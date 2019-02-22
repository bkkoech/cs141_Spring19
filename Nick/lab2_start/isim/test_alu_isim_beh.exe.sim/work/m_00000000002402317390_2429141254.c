/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//vmware-host/Shared Folders/CS141 - Computer Architecture/cs141_Spring19/Nick/lab2_start/test_alu.v";
static int ng1[] = {3, 0};
static int ng2[] = {2, 0};
static unsigned int ng3[] = {0U, 0U};
static int ng4[] = {0, 0};
static unsigned int ng5[] = {15U, 0U};
static int ng6[] = {-1, 0};
static int ng7[] = {1, 0};
static const char *ng8 = "Finished with %d errors";
static const char *ng9 = "ERROR: AND:  op_code = %b, X = %h, Y = %h, Z = %h";
static unsigned int ng10[] = {2U, 0U};
static const char *ng11 = "ERROR: XOR:  op_code = %b, X = %h, Y = %h, Z = %h";
static unsigned int ng12[] = {1U, 0U};
static const char *ng13 = "ERROR: OR:  op_code = %b, X = %h, Y = %h, Z = %h";
static unsigned int ng14[] = {3U, 0U};
static const char *ng15 = "ERROR: NOR:  op_code = %b, X = %h, Y = %h, Z = %h";
static unsigned int ng16[] = {5U, 0U};
static const char *ng17 = "ERROR: ADD:  op_code = %b, X = %h, Y = %h, Z = %h";
static const char *ng18 = "ERROR: ADD overflow failed:  op_code = %b, X = %h, Y = %h, Z = %h";
static unsigned int ng19[] = {6U, 0U};
static const char *ng20 = "ERROR: SUB:  op_code = %b, X = %h, Y = %h, Z = %h";
static unsigned int ng21[] = {7U, 0U};
static const char *ng22 = "ERROR: SLT failed:  op_code = %b, X = %h, Y = %h, Z = %h";
static unsigned int ng23[] = {8U, 0U};
static unsigned int ng24[] = {9U, 0U};
static unsigned int ng25[] = {10U, 0U};
static const char *ng26 = "ERROR HAPPENED! invalid op code, Z was not zero, op_code = %b, X = %h, Y = %h, Z = %h";



static void Initial_41_0(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    t1 = (t0 + 1996U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(41, ng0);

LAB4:    xsi_set_current_line(43, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1104);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(44, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(45, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1288);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 4);
    xsi_set_current_line(52, ng0);
    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1472);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB5:    t2 = (t0 + 1472);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng5)));
    memset(t6, 0, 8);
    t7 = (t4 + 4);
    t8 = (t5 + 4);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB6:    if (t18 != 0)
        goto LAB8;

LAB9:    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 1380);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng8, 2, t0, (char)119, t4, 32);
    xsi_set_current_line(91, ng0);
    xsi_vlog_finish(1);

LAB1:    return;
LAB7:    *((unsigned int *)t6) = 1;
    goto LAB9;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(52, ng0);

LAB12:    xsi_set_current_line(53, ng0);
    t28 = (t0 + 1472);
    t29 = (t28 + 36U);
    t30 = *((char **)t29);
    t31 = (t0 + 1288);
    xsi_vlogvar_assign_value(t31, t30, 0, 0, 4);
    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1104);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 1896);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB13;
    goto LAB1;

LAB13:    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng2)));
    memset(t6, 0, 8);
    xsi_vlog_signed_unary_minus(t6, 32, t2, 32);
    t3 = (t0 + 1104);
    xsi_vlogvar_assign_value(t3, t6, 0, 0, 32);
    xsi_set_current_line(61, ng0);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    xsi_vlog_signed_unary_minus(t6, 32, t2, 32);
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t6, 0, 0, 32);
    xsi_set_current_line(62, ng0);
    t2 = (t0 + 1896);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB14;
    goto LAB1;

LAB14:    xsi_set_current_line(65, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1104);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(67, ng0);
    t2 = (t0 + 1896);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB15:    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1104);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    xsi_vlog_signed_unary_minus(t6, 32, t2, 32);
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t6, 0, 0, 32);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 1896);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB16;
    goto LAB1;

LAB16:    xsi_set_current_line(75, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1104);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(76, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(77, ng0);
    t2 = (t0 + 1896);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB17;
    goto LAB1;

LAB17:    xsi_set_current_line(81, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1104);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(82, ng0);
    t2 = ((char*)((ng6)));
    memset(t6, 0, 8);
    xsi_vlog_signed_unary_minus(t6, 32, t2, 32);
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t6, 0, 0, 32);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 1896);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB18;
    goto LAB1;

LAB18:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 1472);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng7)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t4, 32, t5, 32);
    t7 = (t0 + 1472);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 32);
    goto LAB5;

}

static void Always_97_1(char *t0)
{
    char t14[8];
    char t46[8];
    char t66[8];
    char t71[8];
    char t72[8];
    char t73[8];
    char t78[8];
    char t93[8];
    char t94[8];
    char t108[8];
    char t113[8];
    char t116[8];
    char t124[8];
    char t156[8];
    char t164[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    int t38;
    int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t47;
    char *t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    char *t55;
    char *t56;
    char *t57;
    char *t58;
    char *t59;
    char *t60;
    char *t61;
    char *t62;
    char *t63;
    char *t64;
    char *t65;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    char *t88;
    char *t89;
    char *t90;
    char *t91;
    char *t92;
    char *t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    char *t101;
    char *t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    char *t106;
    char *t107;
    char *t109;
    char *t110;
    char *t111;
    char *t112;
    char *t114;
    char *t115;
    char *t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    char *t123;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    char *t128;
    char *t129;
    char *t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    char *t138;
    char *t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    unsigned int t145;
    unsigned int t146;
    unsigned int t147;
    int t148;
    int t149;
    unsigned int t150;
    unsigned int t151;
    unsigned int t152;
    unsigned int t153;
    unsigned int t154;
    unsigned int t155;
    char *t157;
    unsigned int t158;
    unsigned int t159;
    unsigned int t160;
    unsigned int t161;
    unsigned int t162;
    char *t163;
    unsigned int t165;
    unsigned int t166;
    unsigned int t167;
    char *t168;
    char *t169;
    char *t170;
    unsigned int t171;
    unsigned int t172;
    unsigned int t173;
    unsigned int t174;
    unsigned int t175;
    unsigned int t176;
    unsigned int t177;
    char *t178;
    char *t179;
    unsigned int t180;
    unsigned int t181;
    unsigned int t182;
    int t183;
    unsigned int t184;
    unsigned int t185;
    unsigned int t186;
    int t187;
    unsigned int t188;
    unsigned int t189;
    unsigned int t190;
    unsigned int t191;
    char *t192;
    unsigned int t193;
    unsigned int t194;
    unsigned int t195;
    unsigned int t196;
    unsigned int t197;
    char *t198;
    char *t199;
    char *t200;
    char *t201;
    char *t202;
    char *t203;
    char *t204;
    char *t205;
    char *t206;
    char *t207;
    char *t208;

LAB0:    t1 = (t0 + 2140U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(97, ng0);
    t2 = (t0 + 2336);
    *((int *)t2) = 1;
    t3 = (t0 + 2168);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(97, ng0);

LAB5:    xsi_set_current_line(98, ng0);
    t4 = (t0 + 2040);
    xsi_process_wait(t4, 1000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(99, ng0);
    t2 = (t0 + 1288);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);

LAB7:    t5 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t5, 4);
    if (t6 == 1)
        goto LAB8;

LAB9:    t2 = ((char*)((ng10)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t6 == 1)
        goto LAB10;

LAB11:    t2 = ((char*)((ng12)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t6 == 1)
        goto LAB12;

LAB13:    t2 = ((char*)((ng14)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t6 == 1)
        goto LAB14;

LAB15:    t2 = ((char*)((ng16)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t6 == 1)
        goto LAB16;

LAB17:    t2 = ((char*)((ng19)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t6 == 1)
        goto LAB18;

LAB19:    t2 = ((char*)((ng21)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t6 == 1)
        goto LAB20;

LAB21:    t2 = ((char*)((ng23)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t6 == 1)
        goto LAB22;

LAB23:    t2 = ((char*)((ng24)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t6 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng25)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 4, t2, 4);
    if (t6 == 1)
        goto LAB26;

LAB27:
LAB29:
LAB28:    xsi_set_current_line(167, ng0);

LAB179:    xsi_set_current_line(169, ng0);
    t2 = (t0 + 600U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t14, 0, 8);
    if (*((unsigned int *)t3) != *((unsigned int *)t2))
        goto LAB181;

LAB180:    t5 = (t3 + 4);
    t7 = (t2 + 4);
    if (*((unsigned int *)t5) != *((unsigned int *)t7))
        goto LAB181;

LAB182:    t8 = (t14 + 4);
    t15 = *((unsigned int *)t8);
    t16 = (~(t15));
    t17 = *((unsigned int *)t14);
    t21 = (t17 & t16);
    t22 = (t21 != 0);
    if (t22 > 0)
        goto LAB183;

LAB184:
LAB185:
LAB30:    goto LAB2;

LAB8:    xsi_set_current_line(100, ng0);

LAB31:    xsi_set_current_line(102, ng0);
    t7 = (t0 + 600U);
    t8 = *((char **)t7);
    t7 = (t0 + 1104);
    t9 = (t7 + 36U);
    t10 = *((char **)t9);
    t11 = (t0 + 1196);
    t12 = (t11 + 36U);
    t13 = *((char **)t12);
    t15 = *((unsigned int *)t10);
    t16 = *((unsigned int *)t13);
    t17 = (t15 & t16);
    *((unsigned int *)t14) = t17;
    t18 = (t10 + 4);
    t19 = (t13 + 4);
    t20 = (t14 + 4);
    t21 = *((unsigned int *)t18);
    t22 = *((unsigned int *)t19);
    t23 = (t21 | t22);
    *((unsigned int *)t20) = t23;
    t24 = *((unsigned int *)t20);
    t25 = (t24 != 0);
    if (t25 == 1)
        goto LAB32;

LAB33:
LAB34:    memset(t46, 0, 8);
    if (*((unsigned int *)t8) != *((unsigned int *)t14))
        goto LAB36;

LAB35:    t47 = (t8 + 4);
    t48 = (t14 + 4);
    if (*((unsigned int *)t47) != *((unsigned int *)t48))
        goto LAB36;

LAB37:    t49 = (t46 + 4);
    t50 = *((unsigned int *)t49);
    t51 = (~(t50));
    t52 = *((unsigned int *)t46);
    t53 = (t52 & t51);
    t54 = (t53 != 0);
    if (t54 > 0)
        goto LAB38;

LAB39:
LAB40:    goto LAB30;

LAB10:    xsi_set_current_line(108, ng0);

LAB42:    xsi_set_current_line(110, ng0);
    t3 = (t0 + 600U);
    t5 = *((char **)t3);
    t3 = (t0 + 1104);
    t7 = (t3 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 1196);
    t10 = (t9 + 36U);
    t11 = *((char **)t10);
    t15 = *((unsigned int *)t8);
    t16 = *((unsigned int *)t11);
    t17 = (t15 ^ t16);
    *((unsigned int *)t14) = t17;
    t12 = (t8 + 4);
    t13 = (t11 + 4);
    t18 = (t14 + 4);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 | t22);
    *((unsigned int *)t18) = t23;
    t24 = *((unsigned int *)t18);
    t25 = (t24 != 0);
    if (t25 == 1)
        goto LAB43;

LAB44:
LAB45:    memset(t46, 0, 8);
    if (*((unsigned int *)t5) != *((unsigned int *)t14))
        goto LAB47;

LAB46:    t19 = (t5 + 4);
    t20 = (t14 + 4);
    if (*((unsigned int *)t19) != *((unsigned int *)t20))
        goto LAB47;

LAB48:    t28 = (t46 + 4);
    t30 = *((unsigned int *)t28);
    t31 = (~(t30));
    t32 = *((unsigned int *)t46);
    t33 = (t32 & t31);
    t34 = (t33 != 0);
    if (t34 > 0)
        goto LAB49;

LAB50:
LAB51:    goto LAB30;

LAB12:    xsi_set_current_line(115, ng0);

LAB53:    xsi_set_current_line(117, ng0);
    t3 = (t0 + 600U);
    t5 = *((char **)t3);
    t3 = (t0 + 1104);
    t7 = (t3 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 1196);
    t10 = (t9 + 36U);
    t11 = *((char **)t10);
    t15 = *((unsigned int *)t8);
    t16 = *((unsigned int *)t11);
    t17 = (t15 | t16);
    *((unsigned int *)t14) = t17;
    t12 = (t8 + 4);
    t13 = (t11 + 4);
    t18 = (t14 + 4);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 | t22);
    *((unsigned int *)t18) = t23;
    t24 = *((unsigned int *)t18);
    t25 = (t24 != 0);
    if (t25 == 1)
        goto LAB54;

LAB55:
LAB56:    memset(t46, 0, 8);
    if (*((unsigned int *)t5) != *((unsigned int *)t14))
        goto LAB58;

LAB57:    t28 = (t5 + 4);
    t29 = (t14 + 4);
    if (*((unsigned int *)t28) != *((unsigned int *)t29))
        goto LAB58;

LAB59:    t47 = (t46 + 4);
    t42 = *((unsigned int *)t47);
    t43 = (~(t42));
    t44 = *((unsigned int *)t46);
    t45 = (t44 & t43);
    t50 = (t45 != 0);
    if (t50 > 0)
        goto LAB60;

LAB61:
LAB62:    goto LAB30;

LAB14:    xsi_set_current_line(122, ng0);

LAB64:    xsi_set_current_line(124, ng0);
    t3 = (t0 + 600U);
    t5 = *((char **)t3);
    t3 = (t0 + 1104);
    t7 = (t3 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 1196);
    t10 = (t9 + 36U);
    t11 = *((char **)t10);
    t15 = *((unsigned int *)t8);
    t16 = *((unsigned int *)t11);
    t17 = (t15 | t16);
    *((unsigned int *)t46) = t17;
    t12 = (t8 + 4);
    t13 = (t11 + 4);
    t18 = (t46 + 4);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 | t22);
    *((unsigned int *)t18) = t23;
    t24 = *((unsigned int *)t18);
    t25 = (t24 != 0);
    if (t25 == 1)
        goto LAB65;

LAB66:
LAB67:    memset(t14, 0, 8);
    t28 = (t14 + 4);
    t29 = (t46 + 4);
    t42 = *((unsigned int *)t46);
    t43 = (~(t42));
    *((unsigned int *)t14) = t43;
    *((unsigned int *)t28) = 0;
    if (*((unsigned int *)t29) != 0)
        goto LAB69;

LAB68:    t52 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t52 & 4294967295U);
    t53 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t53 & 4294967295U);
    memset(t66, 0, 8);
    if (*((unsigned int *)t5) != *((unsigned int *)t14))
        goto LAB71;

LAB70:    t47 = (t5 + 4);
    t48 = (t14 + 4);
    if (*((unsigned int *)t47) != *((unsigned int *)t48))
        goto LAB71;

LAB72:    t49 = (t66 + 4);
    t54 = *((unsigned int *)t49);
    t67 = (~(t54));
    t68 = *((unsigned int *)t66);
    t69 = (t68 & t67);
    t70 = (t69 != 0);
    if (t70 > 0)
        goto LAB73;

LAB74:
LAB75:    goto LAB30;

LAB16:    xsi_set_current_line(129, ng0);

LAB77:    xsi_set_current_line(132, ng0);
    t3 = (t0 + 600U);
    t5 = *((char **)t3);
    t3 = (t0 + 1104);
    t7 = (t3 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 1196);
    t10 = (t9 + 36U);
    t11 = *((char **)t10);
    memset(t14, 0, 8);
    xsi_vlog_unsigned_add(t14, 32, t8, 32, t11, 32);
    memset(t46, 0, 8);
    if (*((unsigned int *)t5) != *((unsigned int *)t14))
        goto LAB79;

LAB78:    t12 = (t5 + 4);
    t13 = (t14 + 4);
    if (*((unsigned int *)t12) != *((unsigned int *)t13))
        goto LAB79;

LAB80:    t18 = (t46 + 4);
    t15 = *((unsigned int *)t18);
    t16 = (~(t15));
    t17 = *((unsigned int *)t46);
    t21 = (t17 & t16);
    t22 = (t21 != 0);
    if (t22 > 0)
        goto LAB81;

LAB82:
LAB83:    xsi_set_current_line(137, ng0);
    t2 = (t0 + 600U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng6)));
    memset(t14, 0, 8);
    t5 = (t3 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB86;

LAB85:    t7 = (t2 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB86;

LAB89:    if (*((unsigned int *)t3) > *((unsigned int *)t2))
        goto LAB87;

LAB88:    t9 = (t0 + 784U);
    t10 = *((char **)t9);
    t9 = ((char*)((ng7)));
    memset(t46, 0, 8);
    if (*((unsigned int *)t10) != *((unsigned int *)t9))
        goto LAB91;

LAB90:    t11 = (t10 + 4);
    t12 = (t9 + 4);
    if (*((unsigned int *)t11) != *((unsigned int *)t12))
        goto LAB91;

LAB92:    t15 = *((unsigned int *)t14);
    t16 = *((unsigned int *)t46);
    t17 = (t15 & t16);
    *((unsigned int *)t66) = t17;
    t13 = (t14 + 4);
    t18 = (t46 + 4);
    t19 = (t66 + 4);
    t21 = *((unsigned int *)t13);
    t22 = *((unsigned int *)t18);
    t23 = (t21 | t22);
    *((unsigned int *)t19) = t23;
    t24 = *((unsigned int *)t19);
    t25 = (t24 != 0);
    if (t25 == 1)
        goto LAB93;

LAB94:
LAB95:    t29 = (t66 + 4);
    t50 = *((unsigned int *)t29);
    t51 = (~(t50));
    t52 = *((unsigned int *)t66);
    t53 = (t52 & t51);
    t54 = (t53 != 0);
    if (t54 > 0)
        goto LAB96;

LAB97:
LAB98:    goto LAB30;

LAB18:    xsi_set_current_line(142, ng0);

LAB100:    xsi_set_current_line(145, ng0);
    t3 = (t0 + 600U);
    t5 = *((char **)t3);
    t3 = (t0 + 1104);
    t7 = (t3 + 36U);
    t8 = *((char **)t7);
    t9 = (t0 + 1196);
    t10 = (t9 + 36U);
    t11 = *((char **)t10);
    memset(t14, 0, 8);
    xsi_vlog_unsigned_minus(t14, 32, t8, 32, t11, 32);
    memset(t46, 0, 8);
    if (*((unsigned int *)t5) != *((unsigned int *)t14))
        goto LAB102;

LAB101:    t12 = (t5 + 4);
    t13 = (t14 + 4);
    if (*((unsigned int *)t12) != *((unsigned int *)t13))
        goto LAB102;

LAB103:    t18 = (t46 + 4);
    t15 = *((unsigned int *)t18);
    t16 = (~(t15));
    t17 = *((unsigned int *)t46);
    t21 = (t17 & t16);
    t22 = (t21 != 0);
    if (t22 > 0)
        goto LAB104;

LAB105:
LAB106:    xsi_set_current_line(150, ng0);
    t2 = (t0 + 600U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng6)));
    memset(t14, 0, 8);
    t5 = (t3 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB109;

LAB108:    t7 = (t2 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB109;

LAB112:    if (*((unsigned int *)t3) > *((unsigned int *)t2))
        goto LAB110;

LAB111:    t9 = (t0 + 784U);
    t10 = *((char **)t9);
    t9 = ((char*)((ng7)));
    memset(t46, 0, 8);
    if (*((unsigned int *)t10) != *((unsigned int *)t9))
        goto LAB114;

LAB113:    t11 = (t10 + 4);
    t12 = (t9 + 4);
    if (*((unsigned int *)t11) != *((unsigned int *)t12))
        goto LAB114;

LAB115:    t15 = *((unsigned int *)t14);
    t16 = *((unsigned int *)t46);
    t17 = (t15 & t16);
    *((unsigned int *)t66) = t17;
    t13 = (t14 + 4);
    t18 = (t46 + 4);
    t19 = (t66 + 4);
    t21 = *((unsigned int *)t13);
    t22 = *((unsigned int *)t18);
    t23 = (t21 | t22);
    *((unsigned int *)t19) = t23;
    t24 = *((unsigned int *)t19);
    t25 = (t24 != 0);
    if (t25 == 1)
        goto LAB116;

LAB117:
LAB118:    t29 = (t66 + 4);
    t50 = *((unsigned int *)t29);
    t51 = (~(t50));
    t52 = *((unsigned int *)t66);
    t53 = (t52 & t51);
    t54 = (t53 != 0);
    if (t54 > 0)
        goto LAB119;

LAB120:
LAB121:    goto LAB30;

LAB20:    xsi_set_current_line(155, ng0);

LAB123:    xsi_set_current_line(156, ng0);
    t3 = (t0 + 1104);
    t5 = (t3 + 36U);
    t7 = *((char **)t5);
    t8 = (t0 + 1196);
    t9 = (t8 + 36U);
    t10 = *((char **)t9);
    memset(t14, 0, 8);
    xsi_vlog_signed_less(t14, 32, t7, 32, t10, 32);
    memset(t46, 0, 8);
    t11 = (t14 + 4);
    t15 = *((unsigned int *)t11);
    t16 = (~(t15));
    t17 = *((unsigned int *)t14);
    t21 = (t17 & t16);
    t22 = (t21 & 1U);
    if (t22 != 0)
        goto LAB124;

LAB125:    if (*((unsigned int *)t11) != 0)
        goto LAB126;

LAB127:    t13 = (t46 + 4);
    t23 = *((unsigned int *)t46);
    t24 = *((unsigned int *)t13);
    t25 = (t23 || t24);
    if (t25 > 0)
        goto LAB128;

LAB129:    memcpy(t73, t46, 8);

LAB130:    memset(t78, 0, 8);
    t62 = (t73 + 4);
    t79 = *((unsigned int *)t62);
    t80 = (~(t79));
    t81 = *((unsigned int *)t73);
    t82 = (t81 & t80);
    t83 = (t82 & 1U);
    if (t83 != 0)
        goto LAB141;

LAB142:    if (*((unsigned int *)t62) != 0)
        goto LAB143;

LAB144:    t64 = (t78 + 4);
    t84 = *((unsigned int *)t78);
    t85 = (!(t84));
    t86 = *((unsigned int *)t64);
    t87 = (t85 || t86);
    if (t87 > 0)
        goto LAB145;

LAB146:    memcpy(t164, t78, 8);

LAB147:    t192 = (t164 + 4);
    t193 = *((unsigned int *)t192);
    t194 = (~(t193));
    t195 = *((unsigned int *)t164);
    t196 = (t195 & t194);
    t197 = (t196 != 0);
    if (t197 > 0)
        goto LAB172;

LAB173:
LAB174:    goto LAB30;

LAB22:    xsi_set_current_line(161, ng0);

LAB176:    goto LAB30;

LAB24:    xsi_set_current_line(163, ng0);

LAB177:    goto LAB30;

LAB26:    xsi_set_current_line(165, ng0);

LAB178:    goto LAB30;

LAB32:    t26 = *((unsigned int *)t14);
    t27 = *((unsigned int *)t20);
    *((unsigned int *)t14) = (t26 | t27);
    t28 = (t10 + 4);
    t29 = (t13 + 4);
    t30 = *((unsigned int *)t10);
    t31 = (~(t30));
    t32 = *((unsigned int *)t28);
    t33 = (~(t32));
    t34 = *((unsigned int *)t13);
    t35 = (~(t34));
    t36 = *((unsigned int *)t29);
    t37 = (~(t36));
    t38 = (t31 & t33);
    t39 = (t35 & t37);
    t40 = (~(t38));
    t41 = (~(t39));
    t42 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t42 & t40);
    t43 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t43 & t41);
    t44 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t44 & t40);
    t45 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t45 & t41);
    goto LAB34;

LAB36:    *((unsigned int *)t46) = 1;
    goto LAB37;

LAB38:    xsi_set_current_line(102, ng0);

LAB41:    xsi_set_current_line(103, ng0);
    t55 = (t0 + 1288);
    t56 = (t55 + 36U);
    t57 = *((char **)t56);
    t58 = (t0 + 1104);
    t59 = (t58 + 36U);
    t60 = *((char **)t59);
    t61 = (t0 + 1196);
    t62 = (t61 + 36U);
    t63 = *((char **)t62);
    t64 = (t0 + 600U);
    t65 = *((char **)t64);
    xsi_vlogfile_write(1, 0, 0, ng9, 5, t0, (char)119, t57, 4, (char)119, t60, 32, (char)119, t63, 32, (char)118, t65, 32);
    xsi_set_current_line(104, ng0);
    t2 = (t0 + 1380);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t7 = ((char*)((ng7)));
    memset(t14, 0, 8);
    xsi_vlog_signed_add(t14, 32, t5, 32, t7, 32);
    t8 = (t0 + 1380);
    xsi_vlogvar_assign_value(t8, t14, 0, 0, 32);
    goto LAB40;

LAB43:    t26 = *((unsigned int *)t14);
    t27 = *((unsigned int *)t18);
    *((unsigned int *)t14) = (t26 | t27);
    goto LAB45;

LAB47:    *((unsigned int *)t46) = 1;
    goto LAB48;

LAB49:    xsi_set_current_line(110, ng0);

LAB52:    xsi_set_current_line(111, ng0);
    t29 = (t0 + 1288);
    t47 = (t29 + 36U);
    t48 = *((char **)t47);
    t49 = (t0 + 1104);
    t55 = (t49 + 36U);
    t56 = *((char **)t55);
    t57 = (t0 + 1196);
    t58 = (t57 + 36U);
    t59 = *((char **)t58);
    t60 = (t0 + 600U);
    t61 = *((char **)t60);
    xsi_vlogfile_write(1, 0, 0, ng11, 5, t0, (char)119, t48, 4, (char)119, t56, 32, (char)119, t59, 32, (char)118, t61, 32);
    xsi_set_current_line(112, ng0);
    t2 = (t0 + 1380);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t7 = ((char*)((ng7)));
    memset(t14, 0, 8);
    xsi_vlog_signed_add(t14, 32, t5, 32, t7, 32);
    t8 = (t0 + 1380);
    xsi_vlogvar_assign_value(t8, t14, 0, 0, 32);
    goto LAB51;

LAB54:    t26 = *((unsigned int *)t14);
    t27 = *((unsigned int *)t18);
    *((unsigned int *)t14) = (t26 | t27);
    t19 = (t8 + 4);
    t20 = (t11 + 4);
    t30 = *((unsigned int *)t19);
    t31 = (~(t30));
    t32 = *((unsigned int *)t8);
    t38 = (t32 & t31);
    t33 = *((unsigned int *)t20);
    t34 = (~(t33));
    t35 = *((unsigned int *)t11);
    t39 = (t35 & t34);
    t36 = (~(t38));
    t37 = (~(t39));
    t40 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t40 & t36);
    t41 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t41 & t37);
    goto LAB56;

LAB58:    *((unsigned int *)t46) = 1;
    goto LAB59;

LAB60:    xsi_set_current_line(117, ng0);

LAB63:    xsi_set_current_line(118, ng0);
    t48 = (t0 + 1288);
    t49 = (t48 + 36U);
    t55 = *((char **)t49);
    t56 = (t0 + 1104);
    t57 = (t56 + 36U);
    t58 = *((char **)t57);
    t59 = (t0 + 1196);
    t60 = (t59 + 36U);
    t61 = *((char **)t60);
    t62 = (t0 + 600U);
    t63 = *((char **)t62);
    xsi_vlogfile_write(1, 0, 0, ng13, 5, t0, (char)119, t55, 4, (char)119, t58, 32, (char)119, t61, 32, (char)118, t63, 32);
    xsi_set_current_line(119, ng0);
    t2 = (t0 + 1380);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t7 = ((char*)((ng7)));
    memset(t14, 0, 8);
    xsi_vlog_signed_add(t14, 32, t5, 32, t7, 32);
    t8 = (t0 + 1380);
    xsi_vlogvar_assign_value(t8, t14, 0, 0, 32);
    goto LAB62;

LAB65:    t26 = *((unsigned int *)t46);
    t27 = *((unsigned int *)t18);
    *((unsigned int *)t46) = (t26 | t27);
    t19 = (t8 + 4);
    t20 = (t11 + 4);
    t30 = *((unsigned int *)t19);
    t31 = (~(t30));
    t32 = *((unsigned int *)t8);
    t38 = (t32 & t31);
    t33 = *((unsigned int *)t20);
    t34 = (~(t33));
    t35 = *((unsigned int *)t11);
    t39 = (t35 & t34);
    t36 = (~(t38));
    t37 = (~(t39));
    t40 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t40 & t36);
    t41 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t41 & t37);
    goto LAB67;

LAB69:    t44 = *((unsigned int *)t14);
    t45 = *((unsigned int *)t29);
    *((unsigned int *)t14) = (t44 | t45);
    t50 = *((unsigned int *)t28);
    t51 = *((unsigned int *)t29);
    *((unsigned int *)t28) = (t50 | t51);
    goto LAB68;

LAB71:    *((unsigned int *)t66) = 1;
    goto LAB72;

LAB73:    xsi_set_current_line(124, ng0);

LAB76:    xsi_set_current_line(125, ng0);
    t55 = (t0 + 1288);
    t56 = (t55 + 36U);
    t57 = *((char **)t56);
    t58 = (t0 + 1104);
    t59 = (t58 + 36U);
    t60 = *((char **)t59);
    t61 = (t0 + 1196);
    t62 = (t61 + 36U);
    t63 = *((char **)t62);
    t64 = (t0 + 600U);
    t65 = *((char **)t64);
    xsi_vlogfile_write(1, 0, 0, ng15, 5, t0, (char)119, t57, 4, (char)119, t60, 32, (char)119, t63, 32, (char)118, t65, 32);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 1380);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t7 = ((char*)((ng7)));
    memset(t14, 0, 8);
    xsi_vlog_signed_add(t14, 32, t5, 32, t7, 32);
    t8 = (t0 + 1380);
    xsi_vlogvar_assign_value(t8, t14, 0, 0, 32);
    goto LAB75;

LAB79:    *((unsigned int *)t46) = 1;
    goto LAB80;

LAB81:    xsi_set_current_line(132, ng0);

LAB84:    xsi_set_current_line(133, ng0);
    t19 = (t0 + 1288);
    t20 = (t19 + 36U);
    t28 = *((char **)t20);
    t29 = (t0 + 1104);
    t47 = (t29 + 36U);
    t48 = *((char **)t47);
    t49 = (t0 + 1196);
    t55 = (t49 + 36U);
    t56 = *((char **)t55);
    t57 = (t0 + 600U);
    t58 = *((char **)t57);
    xsi_vlogfile_write(1, 0, 0, ng17, 5, t0, (char)119, t28, 4, (char)119, t48, 32, (char)119, t56, 32, (char)118, t58, 32);
    xsi_set_current_line(134, ng0);
    t2 = (t0 + 1380);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t7 = ((char*)((ng7)));
    memset(t14, 0, 8);
    xsi_vlog_signed_add(t14, 32, t5, 32, t7, 32);
    t8 = (t0 + 1380);
    xsi_vlogvar_assign_value(t8, t14, 0, 0, 32);
    goto LAB83;

LAB86:    t8 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t8) = 1;
    goto LAB88;

LAB87:    *((unsigned int *)t14) = 1;
    goto LAB88;

LAB91:    *((unsigned int *)t46) = 1;
    goto LAB92;

LAB93:    t26 = *((unsigned int *)t66);
    t27 = *((unsigned int *)t19);
    *((unsigned int *)t66) = (t26 | t27);
    t20 = (t14 + 4);
    t28 = (t46 + 4);
    t30 = *((unsigned int *)t14);
    t31 = (~(t30));
    t32 = *((unsigned int *)t20);
    t33 = (~(t32));
    t34 = *((unsigned int *)t46);
    t35 = (~(t34));
    t36 = *((unsigned int *)t28);
    t37 = (~(t36));
    t6 = (t31 & t33);
    t38 = (t35 & t37);
    t40 = (~(t6));
    t41 = (~(t38));
    t42 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t42 & t40);
    t43 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t43 & t41);
    t44 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t44 & t40);
    t45 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t45 & t41);
    goto LAB95;

LAB96:    xsi_set_current_line(137, ng0);

LAB99:    xsi_set_current_line(138, ng0);
    t47 = (t0 + 1288);
    t48 = (t47 + 36U);
    t49 = *((char **)t48);
    t55 = (t0 + 1104);
    t56 = (t55 + 36U);
    t57 = *((char **)t56);
    t58 = (t0 + 1196);
    t59 = (t58 + 36U);
    t60 = *((char **)t59);
    t61 = (t0 + 600U);
    t62 = *((char **)t61);
    xsi_vlogfile_write(1, 0, 0, ng18, 5, t0, (char)119, t49, 4, (char)119, t57, 32, (char)119, t60, 32, (char)118, t62, 32);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 1380);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t7 = ((char*)((ng7)));
    memset(t14, 0, 8);
    xsi_vlog_signed_add(t14, 32, t5, 32, t7, 32);
    t8 = (t0 + 1380);
    xsi_vlogvar_assign_value(t8, t14, 0, 0, 32);
    goto LAB98;

LAB102:    *((unsigned int *)t46) = 1;
    goto LAB103;

LAB104:    xsi_set_current_line(145, ng0);

LAB107:    xsi_set_current_line(146, ng0);
    t19 = (t0 + 1288);
    t20 = (t19 + 36U);
    t28 = *((char **)t20);
    t29 = (t0 + 1104);
    t47 = (t29 + 36U);
    t48 = *((char **)t47);
    t49 = (t0 + 1196);
    t55 = (t49 + 36U);
    t56 = *((char **)t55);
    t57 = (t0 + 600U);
    t58 = *((char **)t57);
    xsi_vlogfile_write(1, 0, 0, ng20, 5, t0, (char)119, t28, 4, (char)119, t48, 32, (char)119, t56, 32, (char)118, t58, 32);
    xsi_set_current_line(147, ng0);
    t2 = (t0 + 1380);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t7 = ((char*)((ng7)));
    memset(t14, 0, 8);
    xsi_vlog_signed_add(t14, 32, t5, 32, t7, 32);
    t8 = (t0 + 1380);
    xsi_vlogvar_assign_value(t8, t14, 0, 0, 32);
    goto LAB106;

LAB109:    t8 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t8) = 1;
    goto LAB111;

LAB110:    *((unsigned int *)t14) = 1;
    goto LAB111;

LAB114:    *((unsigned int *)t46) = 1;
    goto LAB115;

LAB116:    t26 = *((unsigned int *)t66);
    t27 = *((unsigned int *)t19);
    *((unsigned int *)t66) = (t26 | t27);
    t20 = (t14 + 4);
    t28 = (t46 + 4);
    t30 = *((unsigned int *)t14);
    t31 = (~(t30));
    t32 = *((unsigned int *)t20);
    t33 = (~(t32));
    t34 = *((unsigned int *)t46);
    t35 = (~(t34));
    t36 = *((unsigned int *)t28);
    t37 = (~(t36));
    t6 = (t31 & t33);
    t38 = (t35 & t37);
    t40 = (~(t6));
    t41 = (~(t38));
    t42 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t42 & t40);
    t43 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t43 & t41);
    t44 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t44 & t40);
    t45 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t45 & t41);
    goto LAB118;

LAB119:    xsi_set_current_line(150, ng0);

LAB122:    xsi_set_current_line(151, ng0);
    t47 = (t0 + 1288);
    t48 = (t47 + 36U);
    t49 = *((char **)t48);
    t55 = (t0 + 1104);
    t56 = (t55 + 36U);
    t57 = *((char **)t56);
    t58 = (t0 + 1196);
    t59 = (t58 + 36U);
    t60 = *((char **)t59);
    t61 = (t0 + 600U);
    t62 = *((char **)t61);
    xsi_vlogfile_write(1, 0, 0, ng18, 5, t0, (char)119, t49, 4, (char)119, t57, 32, (char)119, t60, 32, (char)118, t62, 32);
    xsi_set_current_line(152, ng0);
    t2 = (t0 + 1380);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t7 = ((char*)((ng7)));
    memset(t14, 0, 8);
    xsi_vlog_signed_add(t14, 32, t5, 32, t7, 32);
    t8 = (t0 + 1380);
    xsi_vlogvar_assign_value(t8, t14, 0, 0, 32);
    goto LAB121;

LAB124:    *((unsigned int *)t46) = 1;
    goto LAB127;

LAB126:    t12 = (t46 + 4);
    *((unsigned int *)t46) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB127;

LAB128:    t18 = (t0 + 600U);
    t19 = *((char **)t18);
    t18 = (t0 + 576U);
    t20 = (t18 + 44U);
    t28 = *((char **)t20);
    t29 = ((char*)((ng4)));
    xsi_vlog_generic_get_index_select_value(t66, 32, t19, t28, 2, t29, 32, 1);
    t47 = ((char*)((ng7)));
    memset(t71, 0, 8);
    if (*((unsigned int *)t66) != *((unsigned int *)t47))
        goto LAB132;

LAB131:    t48 = (t66 + 4);
    t49 = (t47 + 4);
    if (*((unsigned int *)t48) != *((unsigned int *)t49))
        goto LAB132;

LAB133:    memset(t72, 0, 8);
    t55 = (t71 + 4);
    t26 = *((unsigned int *)t55);
    t27 = (~(t26));
    t30 = *((unsigned int *)t71);
    t31 = (t30 & t27);
    t32 = (t31 & 1U);
    if (t32 != 0)
        goto LAB134;

LAB135:    if (*((unsigned int *)t55) != 0)
        goto LAB136;

LAB137:    t33 = *((unsigned int *)t46);
    t34 = *((unsigned int *)t72);
    t35 = (t33 & t34);
    *((unsigned int *)t73) = t35;
    t57 = (t46 + 4);
    t58 = (t72 + 4);
    t59 = (t73 + 4);
    t36 = *((unsigned int *)t57);
    t37 = *((unsigned int *)t58);
    t40 = (t36 | t37);
    *((unsigned int *)t59) = t40;
    t41 = *((unsigned int *)t59);
    t42 = (t41 != 0);
    if (t42 == 1)
        goto LAB138;

LAB139:
LAB140:    goto LAB130;

LAB132:    *((unsigned int *)t71) = 1;
    goto LAB133;

LAB134:    *((unsigned int *)t72) = 1;
    goto LAB137;

LAB136:    t56 = (t72 + 4);
    *((unsigned int *)t72) = 1;
    *((unsigned int *)t56) = 1;
    goto LAB137;

LAB138:    t43 = *((unsigned int *)t73);
    t44 = *((unsigned int *)t59);
    *((unsigned int *)t73) = (t43 | t44);
    t60 = (t46 + 4);
    t61 = (t72 + 4);
    t45 = *((unsigned int *)t46);
    t50 = (~(t45));
    t51 = *((unsigned int *)t60);
    t52 = (~(t51));
    t53 = *((unsigned int *)t72);
    t54 = (~(t53));
    t67 = *((unsigned int *)t61);
    t68 = (~(t67));
    t38 = (t50 & t52);
    t39 = (t54 & t68);
    t69 = (~(t38));
    t70 = (~(t39));
    t74 = *((unsigned int *)t59);
    *((unsigned int *)t59) = (t74 & t69);
    t75 = *((unsigned int *)t59);
    *((unsigned int *)t59) = (t75 & t70);
    t76 = *((unsigned int *)t73);
    *((unsigned int *)t73) = (t76 & t69);
    t77 = *((unsigned int *)t73);
    *((unsigned int *)t73) = (t77 & t70);
    goto LAB140;

LAB141:    *((unsigned int *)t78) = 1;
    goto LAB144;

LAB143:    t63 = (t78 + 4);
    *((unsigned int *)t78) = 1;
    *((unsigned int *)t63) = 1;
    goto LAB144;

LAB145:    t65 = (t0 + 1104);
    t88 = (t65 + 36U);
    t89 = *((char **)t88);
    t90 = (t0 + 1196);
    t91 = (t90 + 36U);
    t92 = *((char **)t91);
    memset(t93, 0, 8);
    xsi_vlog_signed_greater(t93, 32, t89, 32, t92, 32);
    memset(t94, 0, 8);
    t95 = (t93 + 4);
    t96 = *((unsigned int *)t95);
    t97 = (~(t96));
    t98 = *((unsigned int *)t93);
    t99 = (t98 & t97);
    t100 = (t99 & 1U);
    if (t100 != 0)
        goto LAB148;

LAB149:    if (*((unsigned int *)t95) != 0)
        goto LAB150;

LAB151:    t102 = (t94 + 4);
    t103 = *((unsigned int *)t94);
    t104 = *((unsigned int *)t102);
    t105 = (t103 || t104);
    if (t105 > 0)
        goto LAB152;

LAB153:    memcpy(t124, t94, 8);

LAB154:    memset(t156, 0, 8);
    t157 = (t124 + 4);
    t158 = *((unsigned int *)t157);
    t159 = (~(t158));
    t160 = *((unsigned int *)t124);
    t161 = (t160 & t159);
    t162 = (t161 & 1U);
    if (t162 != 0)
        goto LAB165;

LAB166:    if (*((unsigned int *)t157) != 0)
        goto LAB167;

LAB168:    t165 = *((unsigned int *)t78);
    t166 = *((unsigned int *)t156);
    t167 = (t165 | t166);
    *((unsigned int *)t164) = t167;
    t168 = (t78 + 4);
    t169 = (t156 + 4);
    t170 = (t164 + 4);
    t171 = *((unsigned int *)t168);
    t172 = *((unsigned int *)t169);
    t173 = (t171 | t172);
    *((unsigned int *)t170) = t173;
    t174 = *((unsigned int *)t170);
    t175 = (t174 != 0);
    if (t175 == 1)
        goto LAB169;

LAB170:
LAB171:    goto LAB147;

LAB148:    *((unsigned int *)t94) = 1;
    goto LAB151;

LAB150:    t101 = (t94 + 4);
    *((unsigned int *)t94) = 1;
    *((unsigned int *)t101) = 1;
    goto LAB151;

LAB152:    t106 = (t0 + 600U);
    t107 = *((char **)t106);
    t106 = (t0 + 576U);
    t109 = (t106 + 44U);
    t110 = *((char **)t109);
    t111 = ((char*)((ng4)));
    xsi_vlog_generic_get_index_select_value(t108, 32, t107, t110, 2, t111, 32, 1);
    t112 = ((char*)((ng4)));
    memset(t113, 0, 8);
    if (*((unsigned int *)t108) != *((unsigned int *)t112))
        goto LAB156;

LAB155:    t114 = (t108 + 4);
    t115 = (t112 + 4);
    if (*((unsigned int *)t114) != *((unsigned int *)t115))
        goto LAB156;

LAB157:    memset(t116, 0, 8);
    t117 = (t113 + 4);
    t118 = *((unsigned int *)t117);
    t119 = (~(t118));
    t120 = *((unsigned int *)t113);
    t121 = (t120 & t119);
    t122 = (t121 & 1U);
    if (t122 != 0)
        goto LAB158;

LAB159:    if (*((unsigned int *)t117) != 0)
        goto LAB160;

LAB161:    t125 = *((unsigned int *)t94);
    t126 = *((unsigned int *)t116);
    t127 = (t125 & t126);
    *((unsigned int *)t124) = t127;
    t128 = (t94 + 4);
    t129 = (t116 + 4);
    t130 = (t124 + 4);
    t131 = *((unsigned int *)t128);
    t132 = *((unsigned int *)t129);
    t133 = (t131 | t132);
    *((unsigned int *)t130) = t133;
    t134 = *((unsigned int *)t130);
    t135 = (t134 != 0);
    if (t135 == 1)
        goto LAB162;

LAB163:
LAB164:    goto LAB154;

LAB156:    *((unsigned int *)t113) = 1;
    goto LAB157;

LAB158:    *((unsigned int *)t116) = 1;
    goto LAB161;

LAB160:    t123 = (t116 + 4);
    *((unsigned int *)t116) = 1;
    *((unsigned int *)t123) = 1;
    goto LAB161;

LAB162:    t136 = *((unsigned int *)t124);
    t137 = *((unsigned int *)t130);
    *((unsigned int *)t124) = (t136 | t137);
    t138 = (t94 + 4);
    t139 = (t116 + 4);
    t140 = *((unsigned int *)t94);
    t141 = (~(t140));
    t142 = *((unsigned int *)t138);
    t143 = (~(t142));
    t144 = *((unsigned int *)t116);
    t145 = (~(t144));
    t146 = *((unsigned int *)t139);
    t147 = (~(t146));
    t148 = (t141 & t143);
    t149 = (t145 & t147);
    t150 = (~(t148));
    t151 = (~(t149));
    t152 = *((unsigned int *)t130);
    *((unsigned int *)t130) = (t152 & t150);
    t153 = *((unsigned int *)t130);
    *((unsigned int *)t130) = (t153 & t151);
    t154 = *((unsigned int *)t124);
    *((unsigned int *)t124) = (t154 & t150);
    t155 = *((unsigned int *)t124);
    *((unsigned int *)t124) = (t155 & t151);
    goto LAB164;

LAB165:    *((unsigned int *)t156) = 1;
    goto LAB168;

LAB167:    t163 = (t156 + 4);
    *((unsigned int *)t156) = 1;
    *((unsigned int *)t163) = 1;
    goto LAB168;

LAB169:    t176 = *((unsigned int *)t164);
    t177 = *((unsigned int *)t170);
    *((unsigned int *)t164) = (t176 | t177);
    t178 = (t78 + 4);
    t179 = (t156 + 4);
    t180 = *((unsigned int *)t178);
    t181 = (~(t180));
    t182 = *((unsigned int *)t78);
    t183 = (t182 & t181);
    t184 = *((unsigned int *)t179);
    t185 = (~(t184));
    t186 = *((unsigned int *)t156);
    t187 = (t186 & t185);
    t188 = (~(t183));
    t189 = (~(t187));
    t190 = *((unsigned int *)t170);
    *((unsigned int *)t170) = (t190 & t188);
    t191 = *((unsigned int *)t170);
    *((unsigned int *)t170) = (t191 & t189);
    goto LAB171;

LAB172:    xsi_set_current_line(156, ng0);

LAB175:    xsi_set_current_line(157, ng0);
    t198 = (t0 + 1288);
    t199 = (t198 + 36U);
    t200 = *((char **)t199);
    t201 = (t0 + 1104);
    t202 = (t201 + 36U);
    t203 = *((char **)t202);
    t204 = (t0 + 1196);
    t205 = (t204 + 36U);
    t206 = *((char **)t205);
    t207 = (t0 + 600U);
    t208 = *((char **)t207);
    xsi_vlogfile_write(1, 0, 0, ng22, 5, t0, (char)119, t200, 4, (char)119, t203, 32, (char)119, t206, 32, (char)118, t208, 32);
    xsi_set_current_line(158, ng0);
    t2 = (t0 + 1380);
    t3 = (t2 + 36U);
    t5 = *((char **)t3);
    t7 = ((char*)((ng7)));
    memset(t14, 0, 8);
    xsi_vlog_signed_add(t14, 32, t5, 32, t7, 32);
    t8 = (t0 + 1380);
    xsi_vlogvar_assign_value(t8, t14, 0, 0, 32);
    goto LAB174;

LAB181:    *((unsigned int *)t14) = 1;
    goto LAB182;

LAB183:    xsi_set_current_line(169, ng0);

LAB186:    xsi_set_current_line(170, ng0);
    t9 = (t0 + 1288);
    t10 = (t9 + 36U);
    t11 = *((char **)t10);
    t12 = (t0 + 1104);
    t13 = (t12 + 36U);
    t18 = *((char **)t13);
    t19 = (t0 + 1196);
    t20 = (t19 + 36U);
    t28 = *((char **)t20);
    t29 = (t0 + 600U);
    t47 = *((char **)t29);
    xsi_vlogfile_write(1, 0, 0, ng26, 5, t0, (char)119, t11, 4, (char)119, t18, 32, (char)119, t28, 32, (char)118, t47, 32);
    goto LAB185;

}


extern void work_m_00000000002402317390_2429141254_init()
{
	static char *pe[] = {(void *)Initial_41_0,(void *)Always_97_1};
	xsi_register_didat("work_m_00000000002402317390_2429141254", "isim/test_alu_isim_beh.exe.sim/work/m_00000000002402317390_2429141254.didat");
	xsi_register_executes(pe);
}
