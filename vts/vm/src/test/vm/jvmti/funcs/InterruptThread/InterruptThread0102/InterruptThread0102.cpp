/*
    Copyright 2005-2006 The Apache Software Foundation or its licensors, as applicable

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

    See the License for the specific language governing permissions and
    limitations under the License.
*/
/**
 * @author Valentin Al. Sitnick
 * @version $Revision: 1.1 $
 *
 */

/* *********************************************************************** */

#include "events.h"
#include "utils.h"
#include "fake.h"

static bool test = false;
static bool util = false;
static bool flag = false;

/* *********************************************************************** */

/**
 * test of function InterruptThread
 */
void InterruptThread0102()
{
    //Fake method for docletting only
}

/* *********************************************************************** */

JNIEXPORT jint JNICALL Agent_OnLoad(prms_AGENT_ONLOAD)
{
    check_AGENT_ONLOAD;

    Callbacks CB;

    cb_tstart;
    cb_death;

    AGENT_FOR_EVENTS_TESTS_PART_I; /* events.h */

    jvmtiEvent events[] = { JVMTI_EVENT_THREAD_START, JVMTI_EVENT_VM_DEATH };

    AGENT_FOR_EVENTS_TESTS_PART_II;

    fprintf(stderr, "\n-------------------------------------------------\n");
    fprintf(stderr, "\ntest InterruptThread0102 is started\n{\n");
    fflush(stderr);

    jvmtiCapabilities zero_caps;
    jvmtiError result;

    fprintf(stderr, "\tnative: make ZERO caps <--- ");
    fflush(stderr);
    make_caps_zero(&zero_caps);
    fprintf(stderr, "finish --->\n");
    fflush(stderr);

    zero_caps.can_signal_thread = 1;

    result = jvmti->RelinquishCapabilities(&zero_caps);
    fprintf(stderr, "\tnative: RelinquishCapabilities result = %d (must be zero) \n", result);

    return JNI_OK;
}

/* *********************************************************************** */

void JNICALL callbackThreadStart(prms_THRD_START)
{
    check_THRD_START;

    if (flag) return;

    jvmtiPhase phase;
    jvmtiThreadInfo tinfo;
    jvmtiError result;

    result = jvmti_env->GetPhase(&phase);
    fprintf(stderr, "\tnative: GetPhase result = %d (must be zero) \n", result);
    fprintf(stderr, "\tnative: current phase is %d (must be 4 (LIVE-phase)) \n", phase);
    if ((result != JVMTI_ERROR_NONE) || (phase != JVMTI_PHASE_LIVE)) return;

    result = jvmti_env->GetThreadInfo(thread, &tinfo);
    fprintf(stderr, "\tnative: GetThreadInfo result = %d (must be zero) \n", result);
    fprintf(stderr, "\tnative: current thread name is %s (must be zero) \n", tinfo.name);
    if (result != JVMTI_ERROR_NONE) return;

    if (strcmp(tinfo.name, "agent")) return;

    fprintf(stderr, "\tnative: test started\n");

    util = true;

    flag = true;

    result = jvmti_env->InterruptThread(thread);
    fprintf(stderr, "\tnative: InterruptThread result = %d (must be JVMTI_ERROR_MUST_POSSESS_CAPABILITY (99)) \n", result);

    if ((int)result == 666)
        fprintf(stderr, "\n\tInterruptThread: FUNCTION IS NOT IMPLEMENTED NOW !!!!!");

    if (result != JVMTI_ERROR_MUST_POSSESS_CAPABILITY) return;

    test = true;
}

void JNICALL callbackVMDeath(prms_VMDEATH)
{
    check_VMDEATH;

    fprintf(stderr, "\n\tTest of function InterruptThread0102             : ");

    if (test && util)
        fprintf(stderr, " passed \n");
    else
        fprintf(stderr, " failed \n");

    fprintf(stderr, "\n} /* test InterruptThread0102 is finished */ \n");
    fflush(stderr);
}

/* *********************************************************************** */

