; ModuleID = 's271ur.c'
source_filename = "s271ur.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.args_t = type { %struct.timeval, %struct.timeval, i8* }
%struct.timeval = type { i64, i64 }

@__func__.s271 = private unnamed_addr constant [5 x i8] c"s271\00", align 1
@b = dso_local global [32000 x float] zeroinitializer, align 64
@c = dso_local global [32000 x float] zeroinitializer, align 64
@a = dso_local global [32000 x float] zeroinitializer, align 64
@d = dso_local global [32000 x float] zeroinitializer, align 64
@e = dso_local global [32000 x float] zeroinitializer, align 64
@aa = dso_local global [256 x [256 x float]] zeroinitializer, align 64
@bb = dso_local global [256 x [256 x float]] zeroinitializer, align 64
@cc = dso_local global [256 x [256 x float]] zeroinitializer, align 64
@.str = private unnamed_addr constant [11 x i8] c"%10.3f\09%f\0A\00", align 1
@flat_2d_array = dso_local local_unnamed_addr global [65536 x float] zeroinitializer, align 64
@x = dso_local local_unnamed_addr global [32000 x float] zeroinitializer, align 64
@tt = dso_local local_unnamed_addr global [256 x [256 x float]] zeroinitializer, align 64
@indx = dso_local local_unnamed_addr global [32000 x i32] zeroinitializer, align 64
@xx = dso_local local_unnamed_addr global float* null, align 8
@yy = dso_local local_unnamed_addr global float* null, align 8
@str = private unnamed_addr constant [26 x i8] c"Loop \09Time(sec) \09Checksum\00", align 1

; Function Attrs: nounwind optsize uwtable
define dso_local float @s271(%struct.args_t* nocapture %func_args) #0 {
entry:
  %call = tail call i32 @initialise_arrays(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @__func__.s271, i64 0, i64 0)) #6
  %t1 = getelementptr inbounds %struct.args_t, %struct.args_t* %func_args, i64 0, i32 0
  %call1 = tail call i32 @gettimeofday(%struct.timeval* %t1, i8* null) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %entry, %for.cond.cleanup4
  %nl.029 = phi i32 [ 0, %entry ], [ %inc15, %for.cond.cleanup4 ]
  br label %for.body5

for.cond.cleanup:                                 ; preds = %for.cond.cleanup4
  %t2 = getelementptr inbounds %struct.args_t, %struct.args_t* %func_args, i64 0, i32 1
  %call17 = tail call i32 @gettimeofday(%struct.timeval* nonnull %t2, i8* null) #6
  %call18 = tail call float @calc_checksum(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @__func__.s271, i64 0, i64 0)) #6
  ret float %call18

for.cond.cleanup4:                                ; preds = %for.inc.7
  %call13 = tail call i32 @dummy(float* getelementptr inbounds ([32000 x float], [32000 x float]* @a, i64 0, i64 0), float* getelementptr inbounds ([32000 x float], [32000 x float]* @b, i64 0, i64 0), float* getelementptr inbounds ([32000 x float], [32000 x float]* @c, i64 0, i64 0), float* getelementptr inbounds ([32000 x float], [32000 x float]* @d, i64 0, i64 0), float* getelementptr inbounds ([32000 x float], [32000 x float]* @e, i64 0, i64 0), [256 x float]* getelementptr inbounds ([256 x [256 x float]], [256 x [256 x float]]* @aa, i64 0, i64 0), [256 x float]* getelementptr inbounds ([256 x [256 x float]], [256 x [256 x float]]* @bb, i64 0, i64 0), [256 x float]* getelementptr inbounds ([256 x [256 x float]], [256 x [256 x float]]* @cc, i64 0, i64 0), float 0.000000e+00) #6
  %inc15 = add nuw nsw i32 %nl.029, 1
  %exitcond.not = icmp eq i32 %inc15, 400000
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.cond2.preheader, !llvm.loop !2

for.body5:                                        ; preds = %for.inc.7, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next.7, %for.inc.7 ]
  %arrayidx = getelementptr inbounds [32000 x float], [32000 x float]* @b, i64 0, i64 %indvars.iv
  %0 = load float, float* %arrayidx, align 32, !tbaa !4
  %cmp6 = fcmp ogt float %0, 0.000000e+00
  br i1 %cmp6, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body5
  %arrayidx10 = getelementptr inbounds [32000 x float], [32000 x float]* @c, i64 0, i64 %indvars.iv
  %1 = load float, float* %arrayidx10, align 32, !tbaa !4
  %mul = fmul float %0, %1
  %arrayidx12 = getelementptr inbounds [32000 x float], [32000 x float]* @a, i64 0, i64 %indvars.iv
  %2 = load float, float* %arrayidx12, align 32, !tbaa !4
  %add = fadd float %2, %mul
  store float %add, float* %arrayidx12, align 32, !tbaa !4
  br label %for.inc

for.inc:                                          ; preds = %for.body5, %if.then
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx.1 = getelementptr inbounds [32000 x float], [32000 x float]* @b, i64 0, i64 %indvars.iv.next
  %3 = load float, float* %arrayidx.1, align 4, !tbaa !4
  %cmp6.1 = fcmp ogt float %3, 0.000000e+00
  br i1 %cmp6.1, label %if.then.1, label %for.inc.1

if.then.1:                                        ; preds = %for.inc
  %arrayidx10.1 = getelementptr inbounds [32000 x float], [32000 x float]* @c, i64 0, i64 %indvars.iv.next
  %4 = load float, float* %arrayidx10.1, align 4, !tbaa !4
  %mul.1 = fmul float %3, %4
  %arrayidx12.1 = getelementptr inbounds [32000 x float], [32000 x float]* @a, i64 0, i64 %indvars.iv.next
  %5 = load float, float* %arrayidx12.1, align 4, !tbaa !4
  %add.1 = fadd float %5, %mul.1
  store float %add.1, float* %arrayidx12.1, align 4, !tbaa !4
  br label %for.inc.1

for.inc.1:                                        ; preds = %if.then.1, %for.inc
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx.2 = getelementptr inbounds [32000 x float], [32000 x float]* @b, i64 0, i64 %indvars.iv.next.1
  %6 = load float, float* %arrayidx.2, align 8, !tbaa !4
  %cmp6.2 = fcmp ogt float %6, 0.000000e+00
  br i1 %cmp6.2, label %if.then.2, label %for.inc.2

if.then.2:                                        ; preds = %for.inc.1
  %arrayidx10.2 = getelementptr inbounds [32000 x float], [32000 x float]* @c, i64 0, i64 %indvars.iv.next.1
  %7 = load float, float* %arrayidx10.2, align 8, !tbaa !4
  %mul.2 = fmul float %6, %7
  %arrayidx12.2 = getelementptr inbounds [32000 x float], [32000 x float]* @a, i64 0, i64 %indvars.iv.next.1
  %8 = load float, float* %arrayidx12.2, align 8, !tbaa !4
  %add.2 = fadd float %8, %mul.2
  store float %add.2, float* %arrayidx12.2, align 8, !tbaa !4
  br label %for.inc.2

for.inc.2:                                        ; preds = %if.then.2, %for.inc.1
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx.3 = getelementptr inbounds [32000 x float], [32000 x float]* @b, i64 0, i64 %indvars.iv.next.2
  %9 = load float, float* %arrayidx.3, align 4, !tbaa !4
  %cmp6.3 = fcmp ogt float %9, 0.000000e+00
  br i1 %cmp6.3, label %if.then.3, label %for.inc.3

if.then.3:                                        ; preds = %for.inc.2
  %arrayidx10.3 = getelementptr inbounds [32000 x float], [32000 x float]* @c, i64 0, i64 %indvars.iv.next.2
  %10 = load float, float* %arrayidx10.3, align 4, !tbaa !4
  %mul.3 = fmul float %9, %10
  %arrayidx12.3 = getelementptr inbounds [32000 x float], [32000 x float]* @a, i64 0, i64 %indvars.iv.next.2
  %11 = load float, float* %arrayidx12.3, align 4, !tbaa !4
  %add.3 = fadd float %11, %mul.3
  store float %add.3, float* %arrayidx12.3, align 4, !tbaa !4
  br label %for.inc.3

for.inc.3:                                        ; preds = %if.then.3, %for.inc.2
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %arrayidx.4 = getelementptr inbounds [32000 x float], [32000 x float]* @b, i64 0, i64 %indvars.iv.next.3
  %12 = load float, float* %arrayidx.4, align 16, !tbaa !4
  %cmp6.4 = fcmp ogt float %12, 0.000000e+00
  br i1 %cmp6.4, label %if.then.4, label %for.inc.4

if.then.4:                                        ; preds = %for.inc.3
  %arrayidx10.4 = getelementptr inbounds [32000 x float], [32000 x float]* @c, i64 0, i64 %indvars.iv.next.3
  %13 = load float, float* %arrayidx10.4, align 16, !tbaa !4
  %mul.4 = fmul float %12, %13
  %arrayidx12.4 = getelementptr inbounds [32000 x float], [32000 x float]* @a, i64 0, i64 %indvars.iv.next.3
  %14 = load float, float* %arrayidx12.4, align 16, !tbaa !4
  %add.4 = fadd float %14, %mul.4
  store float %add.4, float* %arrayidx12.4, align 16, !tbaa !4
  br label %for.inc.4

for.inc.4:                                        ; preds = %if.then.4, %for.inc.3
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %arrayidx.5 = getelementptr inbounds [32000 x float], [32000 x float]* @b, i64 0, i64 %indvars.iv.next.4
  %15 = load float, float* %arrayidx.5, align 4, !tbaa !4
  %cmp6.5 = fcmp ogt float %15, 0.000000e+00
  br i1 %cmp6.5, label %if.then.5, label %for.inc.5

if.then.5:                                        ; preds = %for.inc.4
  %arrayidx10.5 = getelementptr inbounds [32000 x float], [32000 x float]* @c, i64 0, i64 %indvars.iv.next.4
  %16 = load float, float* %arrayidx10.5, align 4, !tbaa !4
  %mul.5 = fmul float %15, %16
  %arrayidx12.5 = getelementptr inbounds [32000 x float], [32000 x float]* @a, i64 0, i64 %indvars.iv.next.4
  %17 = load float, float* %arrayidx12.5, align 4, !tbaa !4
  %add.5 = fadd float %17, %mul.5
  store float %add.5, float* %arrayidx12.5, align 4, !tbaa !4
  br label %for.inc.5

for.inc.5:                                        ; preds = %if.then.5, %for.inc.4
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %arrayidx.6 = getelementptr inbounds [32000 x float], [32000 x float]* @b, i64 0, i64 %indvars.iv.next.5
  %18 = load float, float* %arrayidx.6, align 8, !tbaa !4
  %cmp6.6 = fcmp ogt float %18, 0.000000e+00
  br i1 %cmp6.6, label %if.then.6, label %for.inc.6

if.then.6:                                        ; preds = %for.inc.5
  %arrayidx10.6 = getelementptr inbounds [32000 x float], [32000 x float]* @c, i64 0, i64 %indvars.iv.next.5
  %19 = load float, float* %arrayidx10.6, align 8, !tbaa !4
  %mul.6 = fmul float %18, %19
  %arrayidx12.6 = getelementptr inbounds [32000 x float], [32000 x float]* @a, i64 0, i64 %indvars.iv.next.5
  %20 = load float, float* %arrayidx12.6, align 8, !tbaa !4
  %add.6 = fadd float %20, %mul.6
  store float %add.6, float* %arrayidx12.6, align 8, !tbaa !4
  br label %for.inc.6

for.inc.6:                                        ; preds = %if.then.6, %for.inc.5
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %arrayidx.7 = getelementptr inbounds [32000 x float], [32000 x float]* @b, i64 0, i64 %indvars.iv.next.6
  %21 = load float, float* %arrayidx.7, align 4, !tbaa !4
  %cmp6.7 = fcmp ogt float %21, 0.000000e+00
  br i1 %cmp6.7, label %if.then.7, label %for.inc.7

if.then.7:                                        ; preds = %for.inc.6
  %arrayidx10.7 = getelementptr inbounds [32000 x float], [32000 x float]* @c, i64 0, i64 %indvars.iv.next.6
  %22 = load float, float* %arrayidx10.7, align 4, !tbaa !4
  %mul.7 = fmul float %21, %22
  %arrayidx12.7 = getelementptr inbounds [32000 x float], [32000 x float]* @a, i64 0, i64 %indvars.iv.next.6
  %23 = load float, float* %arrayidx12.7, align 4, !tbaa !4
  %add.7 = fadd float %23, %mul.7
  store float %add.7, float* %arrayidx12.7, align 4, !tbaa !4
  br label %for.inc.7

for.inc.7:                                        ; preds = %if.then.7, %for.inc.6
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv, 8
  %exitcond.7.not = icmp eq i64 %indvars.iv.next.7, 32000
  br i1 %exitcond.7.not, label %for.cond.cleanup4, label %for.body5, !llvm.loop !8
}

; Function Attrs: optsize
declare dso_local i32 @initialise_arrays(i8*) local_unnamed_addr #1

; Function Attrs: nofree nounwind optsize
declare dso_local noundef i32 @gettimeofday(%struct.timeval* nocapture noundef, i8* nocapture noundef) local_unnamed_addr #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: optsize
declare dso_local i32 @dummy(float*, float*, float*, float*, float*, [256 x float]*, [256 x float]*, [256 x float]*, float) local_unnamed_addr #1

; Function Attrs: optsize
declare dso_local float @calc_checksum(i8*) local_unnamed_addr #1

; Function Attrs: nounwind optsize uwtable
define dso_local void @time_function(float (%struct.args_t*)* nocapture %vector_func, i8* %arg_info) local_unnamed_addr #0 {
entry:
  %func_args = alloca %struct.args_t, align 8
  %0 = bitcast %struct.args_t* %func_args to i8*
  call void @llvm.lifetime.start.p0i8(i64 40, i8* nonnull %0) #7
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(40) %0, i8 0, i64 32, i1 false)
  %arg_info1 = getelementptr inbounds %struct.args_t, %struct.args_t* %func_args, i64 0, i32 2
  store i8* %arg_info, i8** %arg_info1, align 8, !tbaa !9
  %call = call float %vector_func(%struct.args_t* nonnull %func_args) #6
  %conv = fpext float %call to double
  %tv_sec = getelementptr inbounds %struct.args_t, %struct.args_t* %func_args, i64 0, i32 0, i32 0
  %1 = load i64, i64* %tv_sec, align 8, !tbaa !14
  %conv2 = sitofp i64 %1 to double
  %tv_usec = getelementptr inbounds %struct.args_t, %struct.args_t* %func_args, i64 0, i32 0, i32 1
  %2 = load i64, i64* %tv_usec, align 8, !tbaa !15
  %conv4 = sitofp i64 %2 to double
  %div = fdiv double %conv4, 1.000000e+06
  %add = fadd double %div, %conv2
  %tv_sec5 = getelementptr inbounds %struct.args_t, %struct.args_t* %func_args, i64 0, i32 1, i32 0
  %3 = load i64, i64* %tv_sec5, align 8, !tbaa !16
  %conv6 = sitofp i64 %3 to double
  %tv_usec8 = getelementptr inbounds %struct.args_t, %struct.args_t* %func_args, i64 0, i32 1, i32 1
  %4 = load i64, i64* %tv_usec8, align 8, !tbaa !17
  %conv9 = sitofp i64 %4 to double
  %div10 = fdiv double %conv9, 1.000000e+06
  %add11 = fadd double %div10, %conv6
  %sub = fsub double %add11, %add
  %call12 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), double %sub, double %conv) #8
  call void @llvm.lifetime.end.p0i8(i64 40, i8* nonnull %0) #7
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nofree nounwind optsize
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind optsize uwtable
define dso_local i32 @main(i32 %argc, i8** nocapture readnone %argv) local_unnamed_addr #0 {
entry:
  %ip = alloca i32*, align 8
  %s1 = alloca float, align 4
  %s2 = alloca float, align 4
  %0 = bitcast i32** %ip to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #7
  %1 = bitcast float* %s1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #7
  %2 = bitcast float* %s2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #7
  call void @init(i32** nonnull %ip, float* nonnull %s1, float* nonnull %s2) #6
  %puts = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([26 x i8], [26 x i8]* @str, i64 0, i64 0))
  call void @time_function(float (%struct.args_t*)* nonnull @s271, i8* null) #8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #7
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #7
  ret i32 0
}

; Function Attrs: optsize
declare dso_local void @init(i32**, float*, float*) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #5

attributes #0 = { nounwind optsize uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { optsize "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nounwind optsize "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nofree nosync nounwind willreturn }
attributes #4 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #5 = { nofree nounwind }
attributes #6 = { nounwind optsize }
attributes #7 = { nounwind }
attributes #8 = { optsize }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.0 (git@github.com:plotnw/eecs-583-project.git 88170ee3c0070d25290cd294b7d026805f3c4542)"}
!2 = distinct !{!2, !3}
!3 = !{!"llvm.loop.unroll.disable"}
!4 = !{!5, !5, i64 0}
!5 = !{!"float", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !3}
!9 = !{!10, !13, i64 32}
!10 = !{!"args_t", !11, i64 0, !11, i64 16, !13, i64 32}
!11 = !{!"timeval", !12, i64 0, !12, i64 8}
!12 = !{!"long", !6, i64 0}
!13 = !{!"any pointer", !6, i64 0}
!14 = !{!10, !12, i64 0}
!15 = !{!10, !12, i64 8}
!16 = !{!10, !12, i64 16}
!17 = !{!10, !12, i64 24}
