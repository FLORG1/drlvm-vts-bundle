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
; Author: Alexander D. Shipilov
; Version: $Revision: 1.2 $
;

.class public org/apache/harmony/vts/test/vm/jvms/instructions/arithm/fmul/fmul05/fmul0502/fmul0502p
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
.method public test([Ljava/lang/String;)I
   .limit stack 3
   .limit locals 2

   ldc 1.5
   ldc 0.0
   ldc 0.0
   fdiv ; must contain NaN
   fmul ; must be NaN
   invokestatic java/lang/Float/isNaN(F)Z
   iconst_1
   if_icmpne Fail
   sipush 104
   ireturn

 Fail:
   sipush 105
   ireturn

   return
.end method

;
; standard main function
.method public static main([Ljava/lang/String;)V
  .limit stack 2
  .limit locals 1

  new org/apache/harmony/vts/test/vm/jvms/instructions/arithm/fmul/fmul05/fmul0502/fmul0502p
  dup
  invokespecial org/apache/harmony/vts/test/vm/jvms/instructions/arithm/fmul/fmul05/fmul0502/fmul0502p/<init>()V
  aload_0
  invokevirtual org/apache/harmony/vts/test/vm/jvms/instructions/arithm/fmul/fmul05/fmul0502/fmul0502p/test([Ljava/lang/String;)I
  invokestatic java/lang/System/exit(I)V

  return
.end method