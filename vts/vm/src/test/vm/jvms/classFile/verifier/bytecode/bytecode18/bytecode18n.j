;    Copyright 2005-2006 The Apache Software Foundation or its licensors, as applicable
;
;    Licensed under the Apache License, Version 2.0 (the "License");
;    you may not use this file except in compliance with the License.
;    You may obtain a copy of the License at
;
;       http://www.apache.org/licenses/LICENSE-2.0
;
;    Unless required by applicable law or agreed to in writing, software
;    distributed under the License is distributed on an "AS IS" BASIS,
;    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;
;    See the License for the specific language governing permissions and
;    limitations under the License.

;
; Author: Khen G. Kim
; Version: $Revision: 1.2 $
;

.class public org/apache/harmony/vts/test/vm/jvms/classFile/verifier/bytecode/bytecode18/bytecode18n
.super java/lang/Object
;
; standard initializer
.method public <init>()V
   aload_0
   invokespecial java/lang/Object/<init>()V
   return
.end method

;
; test method
.method public test()V
   .limit locals 2
   .limit stack 2
.catch java/lang/Throwable from L1 to L2 using L3

L1:  
  sipush 1
  sipush 0
  idiv
  return
L2: 
  iload_0
  return

L3:   
  ; Tested point java/lang/ArithmeticException should be on the operand stack.
  invokevirtual java/lang/String/length()I
  return

.end method


