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
; Author: Maxim N. Kurzenev
; Version: $Revision: 1.2 $
;

.source Helper.j
.class public org/apache/harmony/vts/test/vm/jvms/threads/threads215/threads21501/Helper
.super java/lang/Thread

.field  master Lorg/apache/harmony/vts/test/vm/jvms/threads/share/FlaggedTest;

.method public <init>(Lorg/apache/harmony/vts/test/vm/jvms/threads/share/FlaggedTest;)V
    .limit stack 2
    .limit locals 2

    aload_0
    invokespecial java/lang/Thread/<init>()V

    ; this.master = master;
    aload_0
    aload_1
    putfield org/apache/harmony/vts/test/vm/jvms/threads/threads215/threads21501/Helper/master Lorg/apache/harmony/vts/test/vm/jvms/threads/share/FlaggedTest;
    return
.end method

.method public synchronized run()V
    .limit stack 2
    .limit locals 1

    ; master.setFlag(true);
    aload_0
    getfield org/apache/harmony/vts/test/vm/jvms/threads/threads215/threads21501/Helper/master Lorg/apache/harmony/vts/test/vm/jvms/threads/share/FlaggedTest;
    iconst_1
    invokeinterface org/apache/harmony/vts/test/vm/jvms/threads/share/FlaggedTest/setFlag(Z)V 2

    ; this.notifyAll();
    aload_0
    invokevirtual java/lang/Object/notifyAll()V
    return
.end method
