# netlist_hierachy
perl script to clear netlist hierachy

example: following command show the hierachy with 2 levels of netlist w8192x8c8b4c1i0p0d0s0n0DESTr0.cir
command:
clear_hier.pl -cir w8192x8c8b4c1i0p0d0s0n0DESTr0.cir -cell w8192x8c8b4c1i0p0d0s0n0DESTr0 -level 2

output:
level  1: x_top_lay                                          -> w8192x8c8b4c1i0p0d0s0n0destr0_top_lay

level  2: x_top_lay.xref_cnt_0                               -> w8192x8c8b4c1i0p0d0s0n0destr0_ref_cnt
level  2: x_top_lay.xref_cnt_1                               -> w8192x8c8b4c1i0p0d0s0n0destr0_ref_cnt
level  2: x_top_lay.xref_cnt_2                               -> w8192x8c8b4c1i0p0d0s0n0destr0_ref_cnt
level  2: x_top_lay.xref_cnt_3                               -> w8192x8c8b4c1i0p0d0s0n0destr0_ref_cnt
level  2: x_top_lay.xref_rt_0                                -> w8192x8c8b4c1i0p0d0s0n0destr0_ref_rt
level  2: x_top_lay.xref_rt_1                                -> w8192x8c8b4c1i0p0d0s0n0destr0_ref_rt
level  2: x_top_lay.xref_rt_2                                -> w8192x8c8b4c1i0p0d0s0n0destr0_ref_rt
level  2: x_top_lay.xref_rt_3                                -> w8192x8c8b4c1i0p0d0s0n0destr0_ref_rt
level  2: x_top_lay.xary_cnt_0                               -> w8192x8c8b4c1i0p0d0s0n0destr0_ary_cnt
level  2: x_top_lay.xary_cnt_1                               -> w8192x8c8b4c1i0p0d0s0n0destr0_ary_cnt
level  2: x_top_lay.xary_cnt_2                               -> w8192x8c8b4c1i0p0d0s0n0destr0_ary_cnt
level  2: x_top_lay.xary_cnt_3                               -> w8192x8c8b4c1i0p0d0s0n0destr0_ary_cnt
level  2: x_top_lay.xary_right_0                             -> w8192x8c8b4c1i0p0d0s0n0destr0_ary_right
level  2: x_top_lay.xary_right_1                             -> w8192x8c8b4c1i0p0d0s0n0destr0_ary_right
level  2: x_top_lay.xary_right_2                             -> w8192x8c8b4c1i0p0d0s0n0destr0_ary_right
level  2: x_top_lay.xary_right_3                             -> w8192x8c8b4c1i0p0d0s0n0destr0_ary_right
level  2: x_top_lay.xmux_cnt_0                               -> w8192x8c8b4c1i0p0d0s0n0destr0_mux_cnt
level  2: x_top_lay.xmux_cnt_1                               -> w8192x8c8b4c1i0p0d0s0n0destr0_mux_cnt
level  2: x_top_lay.xmux_cnt_2                               -> w8192x8c8b4c1i0p0d0s0n0destr0_mux_cnt
level  2: x_top_lay.xmux_cnt_3                               -> w8192x8c8b4c1i0p0d0s0n0destr0_mux_cnt
level  2: x_top_lay.xmux_rt_0                                -> w8192x8c8b4c1i0p0d0s0n0destr0_mux_rt
level  2: x_top_lay.xmux_rt_1                                -> w8192x8c8b4c1i0p0d0s0n0destr0_mux_rt
level  2: x_top_lay.xmux_rt_2                                -> w8192x8c8b4c1i0p0d0s0n0destr0_mux_rt
level  2: x_top_lay.xmux_rt_3                                -> w8192x8c8b4c1i0p0d0s0n0destr0_mux_rt
level  2: x_top_lay.xsac_cnt0                                -> w8192x8c8b4c1i0p0d0s0n0destr0_sac_cnt
level  2: x_top_lay.xsac_cnt1                                -> w8192x8c8b4c1i0p0d0s0n0destr0_sac_cnt
level  2: x_top_lay.xsac_rt0                                 -> w8192x8c8b4c1i0p0d0s0n0destr0_sac_rt
level  2: x_top_lay.xsac_rt1                                 -> w8192x8c8b4c1i0p0d0s0n0destr0_sac_rt
level  2: x_top_lay.xgio_cnt                                 -> w8192x8c8b4c1i0p0d0s0n0destr0_gio_cnt
level  2: x_top_lay.xgio_rt                                  -> w8192x8c8b4c1i0p0d0s0n0destr0_gio_rt
level  2: x_top_lay.xref_lt_0                                -> w8192x8c8b4c1i0p0d0s0n0destr0_ref_lt
level  2: x_top_lay.xref_lt_1                                -> w8192x8c8b4c1i0p0d0s0n0destr0_ref_lt
level  2: x_top_lay.xref_lt_2                                -> w8192x8c8b4c1i0p0d0s0n0destr0_ref_lt
level  2: x_top_lay.xref_lt_3                                -> w8192x8c8b4c1i0p0d0s0n0destr0_ref_lt
level  2: x_top_lay.xary_left_0                              -> w8192x8c8b4c1i0p0d0s0n0destr0_ary_left
level  2: x_top_lay.xary_left_1                              -> w8192x8c8b4c1i0p0d0s0n0destr0_ary_left
level  2: x_top_lay.xary_left_2                              -> w8192x8c8b4c1i0p0d0s0n0destr0_ary_left
level  2: x_top_lay.xary_left_3                              -> w8192x8c8b4c1i0p0d0s0n0destr0_ary_left
level  2: x_top_lay.xmux_lt_0                                -> w8192x8c8b4c1i0p0d0s0n0destr0_mux_lt
level  2: x_top_lay.xmux_lt_1                                -> w8192x8c8b4c1i0p0d0s0n0destr0_mux_lt
level  2: x_top_lay.xmux_lt_2                                -> w8192x8c8b4c1i0p0d0s0n0destr0_mux_lt
level  2: x_top_lay.xmux_lt_3                                -> w8192x8c8b4c1i0p0d0s0n0destr0_mux_lt
level  2: x_top_lay.xsac_lt0                                 -> w8192x8c8b4c1i0p0d0s0n0destr0_sac_lt
level  2: x_top_lay.xsac_lt1                                 -> w8192x8c8b4c1i0p0d0s0n0destr0_sac_lt
level  2: x_top_lay.xgio_lt                                  -> w8192x8c8b4c1i0p0d0s0n0destr0_gio_lt

