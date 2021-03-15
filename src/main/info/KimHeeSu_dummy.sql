--bulk_order쪽 데이터
insert into bulk_order values(S_BULK_ORDER.nextval,'김희수','01027068717','kyll20@naver.com','20210315','o','<p>고구마 대량 주문 문의요</p>',sysdate);
insert into bulk_order values(S_BULK_ORDER.nextval,'이승준','01058468951','tmdwnsdldi01@naver.com','20210323','o','<p>베이비스트 10개 단체 주문이요</p>',sysdate+
1);
insert into bulk_order values(S_BULK_ORDER.nextval,'김민규','01068953214','alsRb03@naver.com','20210401','o','<p>면도날 100박스 주문이요</p>',sysdate+3);
insert into bulk_order values(S_BULK_ORDER.nextval,'진우람','01089663577','dnfkadnfka20@naver.com','20210325','m','<p>도시락 단품으로 여러군데 주문이요</p>',sysdate);
insert into bulk_order values(S_BULK_ORDER.nextval,'헨리','01086812358','henry15@naver.com','20210402','o','<p>마요네즈 마요네즈 마요네즈</p>',sysdate);
insert into bulk_order values(S_BULK_ORDER.nextval,'박용순 ','01086549972','dydtns115@naver.com','20210319','o','<p>cat fish 상품 2박스 문의요</p>',sysdate);
insert into bulk_order values(S_BULK_ORDER.nextval,'정지원','01055246635','wjdwlwdnjs1@naver.com','20210315','o','<p>kerasys 샴푸 문의요</p>',sysdate);
insert into bulk_order values(S_BULK_ORDER.nextval,'유재석','01087456321','tkfkdml12@naver.com','20210322','o','<p>김장용 배추 대량 주문이요</p>',sysdate);
--eco쪽 데이터
insert into eco values(S_ECO.nextval,'수거해가는 포장용기','<p>포장용기를 플라스틱으로 만든다음, 수거할때 인센티브를 주면 포장지값이 덜 들지 않을까요?</p>','282','모든 박스종류',null,sysdate,'kyll20');
insert into eco values(S_ECO.nextval,'친환경 아이스팩','<p>냉동식품이 올때 아이스팩을 친환경 가능한 아이스팩 어떠세요?</p><p>어차피 수거해 가시잖아요</p>','282','모든 아이스팩',null,sysdate,'kyll20');
insert into eco values(S_ECO.nextval,'완충제','<p>스티로폼 같은 완충제보다는 ss이 같은 완충제로 주세요.</p>','280','사과',null,sysdate,'kyll20');
insert into eco values(S_ECO.nextval,'아이스홍시 패킹','<p>아이스팩을 더 넣어주세요... 보냉이 안되는건지 녹은게 많았어요</p>','279','아이스홍시',null,sysdate,'wldnjs03');
insert into eco values(S_ECO.nextval,'귤 썩은게 많이 왔어요..','<p>검수를 좀 더 꼼꼼히 해주세요. 썩은게 많아요</p>','279','귤','1,2',sysdate,'dydtns02');
--proposition쪽 데이터
insert into proposition values(S_PROPOSITION.nextval,'갈비탕','<p>안양에 있는 "갈비대첩"에서 갈비탕이 맛있는데, 협찬해주시죠 </p>','291',null,sysdate,'kyll20');
insert into proposition values(S_PROPOSITION.nextval,'코스트코 빵','<p>코스트코 빵도 가능할까요?</p>','294',null,sysdate,'wldnjs03');
insert into proposition values(S_PROPOSITION.nextval,'비욘드미트 식품','<p>해외제품은 취급 안하시나요??</p>','293',null,sysdate,'wnans223');
insert into proposition values(S_PROPOSITION.nextval,'하우스 딸기','<p>찾아보면 하우스딸기 있을거예요</p>','289',null,sysdate,'tmdwns245');
insert into proposition values(S_PROPOSITION.nextval,'오징어 젓갈','<p>젓갈...맛있지.</p>','292',null,sysdate,'wjwrkf52');
commit;
