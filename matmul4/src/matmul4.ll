; ModuleID = '.tmp/a.ll'
source_filename = "matmul4/src/matmul4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local void @copy_mask(i32 noundef %dim, i32 noundef %row, i32 noundef %col, ptr noundef %mat, ptr noundef %mask) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc17, %entry
  %i.0 = phi i8 [ 0, %entry ], [ %inc18, %for.inc17 ]
  %conv = zext i8 %i.0 to i32
  %cmp = icmp slt i32 %conv, 4
  br i1 %cmp, label %for.body, label %for.end19

for.body:                                         ; preds = %for.cond
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i8 [ 0, %for.body ], [ %inc, %for.inc ]
  %conv3 = zext i8 %j.0 to i32
  %cmp4 = icmp slt i32 %conv3, 4
  br i1 %cmp4, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond2
  %conv7 = zext i8 %i.0 to i32
  %add = add i32 %row, %conv7
  %mul = mul i32 %add, %dim
  %add8 = add i32 %mul, %col
  %conv9 = zext i8 %j.0 to i32
  %add10 = add i32 %add8, %conv9
  %idxprom = zext i32 %add10 to i64
  %arrayidx = getelementptr inbounds i64, ptr %mat, i64 %idxprom
  %0 = load i64, ptr %arrayidx, align 8
  %conv11 = zext i8 %i.0 to i32
  %mul12 = mul nsw i32 %conv11, 4
  %conv13 = zext i8 %j.0 to i32
  %add14 = add nsw i32 %mul12, %conv13
  %idxprom15 = sext i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds i64, ptr %mask, i64 %idxprom15
  store i64 %0, ptr %arrayidx16, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %inc = add i8 %j.0, 1
  br label %for.cond2, !llvm.loop !5

for.end:                                          ; preds = %for.cond2
  br label %for.inc17

for.inc17:                                        ; preds = %for.end
  %inc18 = add i8 %i.0, 1
  br label %for.cond, !llvm.loop !8

for.end19:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local void @add_mask(i32 noundef %dim, i32 noundef %row, i32 noundef %col, ptr noundef %mat, ptr noundef %mask) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc18, %entry
  %i.0 = phi i8 [ 0, %entry ], [ %inc19, %for.inc18 ]
  %conv = zext i8 %i.0 to i32
  %cmp = icmp slt i32 %conv, 4
  br i1 %cmp, label %for.body, label %for.end20

for.body:                                         ; preds = %for.cond
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i8 [ 0, %for.body ], [ %inc, %for.inc ]
  %conv3 = zext i8 %j.0 to i32
  %cmp4 = icmp slt i32 %conv3, 4
  br i1 %cmp4, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond2
  %conv7 = zext i8 %i.0 to i32
  %mul = mul nsw i32 %conv7, 4
  %conv8 = zext i8 %j.0 to i32
  %add = add nsw i32 %mul, %conv8
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds i64, ptr %mask, i64 %idxprom
  %0 = load i64, ptr %arrayidx, align 8
  %conv9 = zext i8 %i.0 to i32
  %add10 = add i32 %row, %conv9
  %mul11 = mul i32 %add10, %dim
  %add12 = add i32 %mul11, %col
  %conv13 = zext i8 %j.0 to i32
  %add14 = add i32 %add12, %conv13
  %idxprom15 = zext i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds i64, ptr %mat, i64 %idxprom15
  %1 = load i64, ptr %arrayidx16, align 8
  %add17 = add i64 %1, %0
  store i64 %add17, ptr %arrayidx16, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %inc = add i8 %j.0, 1
  br label %for.cond2, !llvm.loop !9

for.end:                                          ; preds = %for.cond2
  br label %for.inc18

for.inc18:                                        ; preds = %for.end
  %inc19 = add i8 %i.0, 1
  br label %for.cond, !llvm.loop !10

for.end20:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @mask_mul(ptr noundef %c, ptr noundef %a, ptr noundef %b) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc31, %entry
  %i.0 = phi i8 [ 0, %entry ], [ %inc32, %for.inc31 ]
  %conv = zext i8 %i.0 to i32
  %cmp = icmp slt i32 %conv, 4
  br i1 %cmp, label %for.body, label %for.end33

for.body:                                         ; preds = %for.cond
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc28, %for.body
  %j.0 = phi i8 [ 0, %for.body ], [ %inc29, %for.inc28 ]
  %conv3 = zext i8 %j.0 to i32
  %cmp4 = icmp slt i32 %conv3, 4
  br i1 %cmp4, label %for.body6, label %for.end30

for.body6:                                        ; preds = %for.cond2
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc, %for.body6
  %k.0 = phi i8 [ 0, %for.body6 ], [ %inc, %for.inc ]
  %sum.0 = phi i64 [ 0, %for.body6 ], [ %add21, %for.inc ]
  %conv8 = zext i8 %k.0 to i32
  %cmp9 = icmp slt i32 %conv8, 4
  br i1 %cmp9, label %for.body11, label %for.end

for.body11:                                       ; preds = %for.cond7
  %conv12 = zext i8 %i.0 to i32
  %mul = mul nsw i32 %conv12, 4
  %conv13 = zext i8 %k.0 to i32
  %add = add nsw i32 %mul, %conv13
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds i64, ptr %a, i64 %idxprom
  %0 = load i64, ptr %arrayidx, align 8
  %conv14 = zext i8 %k.0 to i32
  %mul15 = mul nsw i32 %conv14, 4
  %conv16 = zext i8 %j.0 to i32
  %add17 = add nsw i32 %mul15, %conv16
  %idxprom18 = sext i32 %add17 to i64
  %arrayidx19 = getelementptr inbounds i64, ptr %b, i64 %idxprom18
  %1 = load i64, ptr %arrayidx19, align 8
  %mul20 = mul i64 %0, %1
  %add21 = add i64 %sum.0, %mul20
  br label %for.inc

for.inc:                                          ; preds = %for.body11
  %inc = add i8 %k.0, 1
  br label %for.cond7, !llvm.loop !11

for.end:                                          ; preds = %for.cond7
  %conv22 = zext i8 %i.0 to i32
  %mul23 = mul nsw i32 %conv22, 4
  %conv24 = zext i8 %j.0 to i32
  %add25 = add nsw i32 %mul23, %conv24
  %idxprom26 = sext i32 %add25 to i64
  %arrayidx27 = getelementptr inbounds i64, ptr %c, i64 %idxprom26
  store i64 %sum.0, ptr %arrayidx27, align 8
  br label %for.inc28

for.inc28:                                        ; preds = %for.end
  %inc29 = add i8 %j.0, 1
  br label %for.cond2, !llvm.loop !12

for.end30:                                        ; preds = %for.cond2
  br label %for.inc31

for.inc31:                                        ; preds = %for.end30
  %inc32 = add i8 %i.0, 1
  br label %for.cond, !llvm.loop !13

for.end33:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @matmul(i32 noundef %dim, ptr noundef %c, ptr noundef %a, ptr noundef %b) #0 {
entry:
  %c_mask = alloca [16 x i64], align 16
  %a_mask = alloca [16 x i64], align 16
  %b_mask = alloca [16 x i64], align 16
  br label %for.cond

for.cond:                                         ; preds = %for.inc15, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add16, %for.inc15 ]
  %cmp = icmp ult i32 %i.0, %dim
  br i1 %cmp, label %for.body, label %for.end17

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc12, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %add13, %for.inc12 ]
  %cmp2 = icmp ult i32 %j.0, %dim
  br i1 %cmp2, label %for.body3, label %for.end14

for.body3:                                        ; preds = %for.cond1
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %k.0 = phi i32 [ 0, %for.body3 ], [ %add, %for.inc ]
  %cmp5 = icmp ult i32 %k.0, %dim
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %arraydecay = getelementptr inbounds [16 x i64], ptr %a_mask, i64 0, i64 0
  call void @copy_mask(i32 noundef %dim, i32 noundef %i.0, i32 noundef %k.0, ptr noundef %a, ptr noundef %arraydecay)
  %arraydecay7 = getelementptr inbounds [16 x i64], ptr %b_mask, i64 0, i64 0
  call void @copy_mask(i32 noundef %dim, i32 noundef %k.0, i32 noundef %j.0, ptr noundef %b, ptr noundef %arraydecay7)
  %arraydecay8 = getelementptr inbounds [16 x i64], ptr %c_mask, i64 0, i64 0
  %arraydecay9 = getelementptr inbounds [16 x i64], ptr %a_mask, i64 0, i64 0
  %arraydecay10 = getelementptr inbounds [16 x i64], ptr %b_mask, i64 0, i64 0
  call void @mask_mul(ptr noundef %arraydecay8, ptr noundef %arraydecay9, ptr noundef %arraydecay10)
  %arraydecay11 = getelementptr inbounds [16 x i64], ptr %c_mask, i64 0, i64 0
  call void @add_mask(i32 noundef %dim, i32 noundef %i.0, i32 noundef %j.0, ptr noundef %c, ptr noundef %arraydecay11)
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %add = add i32 %k.0, 4
  br label %for.cond4, !llvm.loop !14

for.end:                                          ; preds = %for.cond4
  br label %for.inc12

for.inc12:                                        ; preds = %for.end
  %add13 = add i32 %j.0, 4
  br label %for.cond1, !llvm.loop !15

for.end14:                                        ; preds = %for.cond1
  br label %for.inc15

for.inc15:                                        ; preds = %for.end14
  %add16 = add i32 %i.0, 4
  br label %for.cond, !llvm.loop !16

for.end17:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @read_mat(i32 noundef %dim, ptr noundef %mat) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc4, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc5, %for.inc4 ]
  %cmp = icmp ult i32 %i.0, %dim
  br i1 %cmp, label %for.body, label %for.end6

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %cmp2 = icmp ult i32 %j.0, %dim
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %call = call i64 (...) @read()
  %mul = mul i32 %i.0, %dim
  %add = add i32 %mul, %j.0
  %idxprom = zext i32 %add to i64
  %arrayidx = getelementptr inbounds i64, ptr %mat, i64 %idxprom
  store i64 %call, ptr %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %inc = add i32 %j.0, 1
  br label %for.cond1, !llvm.loop !17

for.end:                                          ; preds = %for.cond1
  br label %for.inc4

for.inc4:                                         ; preds = %for.end
  %inc5 = add i32 %i.0, 1
  br label %for.cond, !llvm.loop !18

for.end6:                                         ; preds = %for.cond
  ret void
}

declare i64 @read(...) #2

; Function Attrs: nounwind uwtable
define dso_local void @print_mat(i32 noundef %dim, ptr noundef %mat) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc4, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc5, %for.inc4 ]
  %cmp = icmp ult i32 %i.0, %dim
  br i1 %cmp, label %for.body, label %for.end6

for.body:                                         ; preds = %for.cond
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %cmp2 = icmp ult i32 %j.0, %dim
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %mul = mul i32 %i.0, %dim
  %add = add i32 %mul, %j.0
  %idxprom = zext i32 %add to i64
  %arrayidx = getelementptr inbounds i64, ptr %mat, i64 %idxprom
  %0 = load i64, ptr %arrayidx, align 8
  call void @write(i64 noundef %0)
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %inc = add i32 %j.0, 1
  br label %for.cond1, !llvm.loop !19

for.end:                                          ; preds = %for.cond1
  br label %for.inc4

for.inc4:                                         ; preds = %for.end
  %inc5 = add i32 %i.0, 1
  br label %for.cond, !llvm.loop !20

for.end6:                                         ; preds = %for.cond
  ret void
}

declare void @write(i64 noundef) #2

; Function Attrs: nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i64 (...) @read()
  %conv = trunc i64 %call to i32
  %rem = urem i32 %conv, 4
  %cmp = icmp ne i32 %rem, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %cleanup

if.end:                                           ; preds = %entry
  %mul = mul i32 %conv, %conv
  %conv2 = zext i32 %mul to i64
  %mul3 = mul i64 %conv2, 8
  %call4 = call noalias ptr @malloc(i64 noundef %mul3) #4
  %mul5 = mul i32 %conv, %conv
  %conv6 = zext i32 %mul5 to i64
  %mul7 = mul i64 %conv6, 8
  %call8 = call noalias ptr @malloc(i64 noundef %mul7) #4
  %mul9 = mul i32 %conv, %conv
  %conv10 = zext i32 %mul9 to i64
  %mul11 = mul i64 %conv10, 8
  %call12 = call noalias ptr @malloc(i64 noundef %mul11) #4
  call void @read_mat(i32 noundef %conv, ptr noundef %call4)
  call void @read_mat(i32 noundef %conv, ptr noundef %call8)
  call void @matmul(i32 noundef %conv, ptr noundef %call12, ptr noundef %call4, ptr noundef %call8)
  call void @print_mat(i32 noundef %conv, ptr noundef %call12)
  br label %cleanup

cleanup:                                          ; preds = %if.end, %if.then
  ret i32 0
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #3

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind allocsize(0) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 18.1.0rc (https://github.com/llvm/llvm-project.git 461274b81d8641eab64d494accddc81d7db8a09e)"}
!5 = distinct !{!5, !6, !7}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!"llvm.loop.unroll.disable"}
!8 = distinct !{!8, !6, !7}
!9 = distinct !{!9, !6, !7}
!10 = distinct !{!10, !6, !7}
!11 = distinct !{!11, !6, !7}
!12 = distinct !{!12, !6, !7}
!13 = distinct !{!13, !6, !7}
!14 = distinct !{!14, !6, !7}
!15 = distinct !{!15, !6, !7}
!16 = distinct !{!16, !6, !7}
!17 = distinct !{!17, !6, !7}
!18 = distinct !{!18, !6, !7}
!19 = distinct !{!19, !6, !7}
!20 = distinct !{!20, !6, !7}
