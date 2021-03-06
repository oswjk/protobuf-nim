# Generated by protoc_gen_nim. Do not edit!

import base64
import intsets
import json
import strutils

import nimpb/nimpb
import nimpb/json as nimpb_json

type
    google_protobuf_FieldMask* = ref google_protobuf_FieldMaskObj
    google_protobuf_FieldMaskObj* = object of Message
        paths: seq[string]

proc newgoogle_protobuf_FieldMask*(): google_protobuf_FieldMask
proc newgoogle_protobuf_FieldMask*(data: string): google_protobuf_FieldMask
proc newgoogle_protobuf_FieldMask*(data: seq[byte]): google_protobuf_FieldMask
proc writegoogle_protobuf_FieldMask*(stream: Stream, message: google_protobuf_FieldMask)
proc readgoogle_protobuf_FieldMask*(stream: Stream): google_protobuf_FieldMask
proc sizeOfgoogle_protobuf_FieldMask*(message: google_protobuf_FieldMask): uint64

proc fullyQualifiedName*(T: typedesc[google_protobuf_FieldMask]): string = "google.protobuf.FieldMask"

proc readgoogle_protobuf_FieldMaskImpl(stream: Stream): Message = readgoogle_protobuf_FieldMask(stream)
proc writegoogle_protobuf_FieldMaskImpl(stream: Stream, msg: Message) = writegoogle_protobuf_FieldMask(stream, google_protobuf_FieldMask(msg))

proc google_protobuf_FieldMaskProcs*(): MessageProcs =
    result.readImpl = readgoogle_protobuf_FieldMaskImpl
    result.writeImpl = writegoogle_protobuf_FieldMaskImpl

proc newgoogle_protobuf_FieldMask*(): google_protobuf_FieldMask =
    new(result)
    initMessage(result[])
    result.procs = google_protobuf_FieldMaskProcs()
    result.paths = @[]

proc clearpaths*(message: google_protobuf_FieldMask) =
    message.paths = @[]

proc setpaths*(message: google_protobuf_FieldMask, value: seq[string]) =
    message.paths = value

proc addpaths*(message: google_protobuf_FieldMask, value: string) =
    add(message.paths, value)

proc paths*(message: google_protobuf_FieldMask): seq[string] {.inline.} =
    message.paths

proc `paths=`*(message: google_protobuf_FieldMask, value: seq[string]) {.inline.} =
    setpaths(message, value)

proc sizeOfgoogle_protobuf_FieldMask*(message: google_protobuf_FieldMask): uint64 =
    for value in message.paths:
        result = result + sizeOfTag(1, WireType.LengthDelimited)
        result = result + sizeOfString(value)
    result = result + sizeOfUnknownFields(message)

proc writegoogle_protobuf_FieldMask*(stream: Stream, message: google_protobuf_FieldMask) =
    for value in message.paths:
        protoWriteString(stream, value, 1)
    writeUnknownFields(stream, message)

proc readgoogle_protobuf_FieldMask*(stream: Stream): google_protobuf_FieldMask =
    result = newgoogle_protobuf_FieldMask()
    while not atEnd(stream):
        let
            tag = readTag(stream)
            wireType = wireType(tag)
        case fieldNumber(tag)
        of 0:
            raise newException(InvalidFieldNumberError, "Invalid field number: 0")
        of 1:
            expectWireType(wireType, WireType.LengthDelimited)
            addpaths(result, protoReadString(stream))
        else: readUnknownField(stream, result, tag)

proc serialize*(message: google_protobuf_FieldMask): string =
    let
        ss = newStringStream()
    writegoogle_protobuf_FieldMask(ss, message)
    result = ss.data

proc newgoogle_protobuf_FieldMask*(data: string): google_protobuf_FieldMask =
    let
        ss = newStringStream(data)
    result = readgoogle_protobuf_FieldMask(ss)

proc newgoogle_protobuf_FieldMask*(data: seq[byte]): google_protobuf_FieldMask =
    let
        ss = newStringStream(cast[string](data))
    result = readgoogle_protobuf_FieldMask(ss)


