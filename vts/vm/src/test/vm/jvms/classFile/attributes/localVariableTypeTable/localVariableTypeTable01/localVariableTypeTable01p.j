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
; Author: Alexander V. Esin
; Version: $Revision: 1.2 $
;
.bytecode 49.0
.class public org/apache/harmony/vts/test/vm/jvms/classFile/attributes/localVariableTypeTable/localVariableTypeTable01/localVariableTypeTable01p
.super java/lang/Object

.method public <init>()V
   aload_0
   invokespecial java/lang/Object/<init>()V
   return
.end method

.method public test()I
  .limit stack 2
  .limit locals 2
  .var 1 is ts Lorg/apache/harmony/vts/test/vm/jvms/classFile/attributes/localVariableTypeTable/localVariableTypeTable01/localVariableTypeTable01Test; signature "Lorg/apache/harmony/vts/test/vm/jvms/classFile/attributes/localVariableTypeTable/localVariableTypeTable01/localVariableTypeTable01Test<Ljava/lang/String;>;" from Label1 to Label2
Label1:
   new org/apache/harmony/vts/test/vm/jvms/classFile/attributes/localVariableTypeTable/localVariableTypeTable01/localVariableTypeTable01Test
   dup
   invokespecial org/apache/harmony/vts/test/vm/jvms/classFile/attributes/localVariableTypeTable/localVariableTypeTable01/localVariableTypeTable01Test/<init>()V
   astore_1
Label2:
   bipush 104
   ireturn
.end method

