   /* Copyright (C) 2008 The Android Open Source Project
    *
    * Licensed under the Apache License, Version 2.0 (the "License");
    * you may not use this file except in compliance with the License.
    * You may obtain a copy of the License at
    *
    * http://www.apache.org/licenses/LICENSE-2.0
    *
    * Unless required by applicable law or agreed to in writing, software
    * distributed under the License is distributed on an "AS IS" BASIS,
    * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    * See the License for the specific language governing permissions and
    * limitations under the License.
    */

   /*
    * File: OP_RETURN_COMMON.S
    *
    * Code: Return a 32-bit value. Uses no substitutions.
    *
    * For: return, return-object
    *
    * Description: Copies the return value into the "glue"
    *              structure, then jumps to the return handler.
    *
    * Format: AA|op (11x)
    *
    * Syntax: op vAA
    */

    movl        rGLUE, %edx             # %edx<- pMterpGlue
    GET_VREG    rINST                   # rINST<- vAA
    movl        rINST, offGlue_retval(%edx) # glue->retval<- vAA
    jmp         common_returnFromMethod # jump to common return code

