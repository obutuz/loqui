from libc.stdint cimport uint32_t, uint8_t

cdef class Response:
    cdef readonly uint32_t seq
    cdef readonly bytes data

cdef class Request:
    cdef readonly uint32_t seq
    cdef readonly bytes data

cdef class Push:
    cdef readonly bytes data

cdef class Ping:
    cdef readonly uint32_t seq

cdef class Pong:
    cdef readonly uint32_t seq

cdef class Hello:
    cdef readonly uint8_t version
    cdef readonly uint32_t ping_interval
    cdef readonly list supported_encodings

cdef class GoAway:
    cdef readonly uint8_t code
    cdef readonly bytes reason

cdef class SelectEncoding:
    cdef readonly bytes encoding

cdef class Error:
    cdef readonly uint8_t code
    cdef readonly uint32_t seq
    cdef readonly bytes data