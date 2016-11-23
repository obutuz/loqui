import time

import gevent
from gevent.monkey import patch_all

patch_all()

i = 0
from drpc.server import DRPCServer

def log_loop():
    last_i = 0
    last = time.time()
    while True:
        gevent.sleep(1)
        now = time.time()
        elapsed = now - last
        req_sec = (i - last_i) / elapsed

        print '%s total requests (%.2f/sec). last log %.2f sec ago.' % (
            i, req_sec, elapsed
        )
        last_i = i
        last = now


class Server(DRPCServer):
    def handle_request(self, request, session):
        global i
        i += 1
        if i and i % 50000 == 0:
            session.close()

        return request.data

    def handle_push(self, push, session):
        # print 'psuh'
        return


if __name__ == '__main__':
    s = Server(('localhost', 4001))
    gevent.spawn(log_loop)
    s.serve_forever()
