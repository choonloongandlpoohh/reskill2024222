/* ERD Entity Relationship Diagram(개체 관계 다이어그램) */
-- CRUD
-- Create(생성) insert into 테이블 values 값
-- Read(읽기) select from where order by
-- Update(수정) update 테이블 set 필드 = 값
-- Delete(삭제) delete from 테이블명 where 조건
drop table address1;

drop table foods1;

drop table cars1;

CREATE table --address1 테이블 생성
    address1 (
        id int generated always as identity PRIMARY KEY,
        name varchar(10), --필드생성 자료형선택
        birthday date,
        hphone varchar(13),
        memo varchar(100),
        food varchar(100),
        car varchar(100)
    );

create table
    foods1 (ID int generated always as identity primary key, name varchar(100) UNIQUE);

create table
    cars1 (ID int generated always as identity primary key, name varchar(100) UNIQUE);

--필드값 입력 insert into 테이블(필드, 필드) values(값, 값);
insert into
    address1 (name, birthday, hphone, memo, food, car)
values
    ('홍길동', '1980-01-01', '010-1111-8888', 'LX부트캠프', 1, 2),
    ('김길동', '1982-01-01', '010-2222-5555', 'LX부트캠프', 4, 2),
    ('이길동', '1984-01-01', '010-3333-6666', 'LX부트캠프', 2, 3),
    ('박길동', '1986-01-01', '010-4444-7777', 'LX부트캠프', 3, 4);

insert into
    foods1 (name)
values
    ('김치찌개'),
    ('된장찌개'),
    ('불고기'),
    ('비빔밥'),
    ('잡채'),
    ('삼겹살'),
    ('갈비'),
    ('갈비찜'),
    ('오겹살'),
    ('청국장'),
    ('떡볶이'),
    ('팔보채'),
    ('양장피'),
    ('깐풍기'),
    ('유산슬'),
    ('우동'),
    ('볶음밥'),
    ('마라탕'),
    ('꿔바로우'),
    ('양꼬치'),
    ('오렌지주스'),
    ('딸기주스'),
    ('사과주스'),
    ('토마토주스'),
    ('포도주스'),
    ('키위주스'),
    ('망고주스'),
    ('바나나주스'),
    ('피자'),
    ('햄버거'),
    ('돈까스'),
    ('왕돈까스'),
    ('치즈돈까스');

insert into
    cars1 (name)
values
    ('toyota'),
    ('tesla'),
    ('honda'),
    ('ford'),
    ('chevrolet');

--데이터 출력 select 필드, 필드 from 테이블 where 조건;
select
    ID,
    to_char (id, '0000'), --왼쪽에 0을 채워 문자로 표시
    name,
    replace (name, '길동', '길똥'), --길동을 길똥으로 변경
    length (name), --글자 수 확인
    birthday,
    '만 ' || extract(
        year
        from
            age ('2000-01-01', birthday)
    ) || '세', --2000.01.01기준 만 XX세
    date_part ('year', birthday), --출생연도
    hphone,
    memo,
    trim(memo), --앞뒤 공백 제거
    substring(memo, 2, 3) --substring(memo, 2, 3) 2번째부터 3글자
from
    address1
where
    ID in (1, 2, 3, 4, 5, 6, 7) --in(a,b,c,d)
    and name like '%길동' --like 연산자, %
    or (birthday between '1983-01-01' and '2000-12-31') --between
order by --desc:역방향, asc:정방향
    name desc;

--update (조건지정 안하면 전체 필드가 수정됨)
update address1
set
    memo = '수정'
where
    name = '홍길동';

--Delete
delete from address1
where
    name = '홍길동';

--#####################################################################
--primary key 자동증가 방법(sequence, serial, generated as identity)
--sequence(요청때마다 숫자 증가, 미리생성 필요, 테이블 삭제시 시퀀스도 같이 삭제)
create sequence seq_test1_id;

create table
    test1 (
        id int DEFAULT nextval ('seq_test1_id') primary KEY, --컬럼의 기본값으로 설정
        name varchar(10)
    );

insert into --다음 값으로 삽입
    test1 (id, name)
values
    (nextval ('seq_test1_id'), '홍길동');

--현재 값 조회
select
    currval ('seq_test1_id');

--다음 값 조회
select
    nextval ('seq_test1_id');

drop sequence seq_test1_id;

--serial(자동증가)
create table
    serial_test (id SERIAL primary key, name varchar(10));

--CONSTRAINTS (NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK)
create table
    guest (
        id int generated always as identity PRIMARY KEY, --PRIMARY KEY
        name varchar(20) not null, --NOT NULL
        phone varchar(20) UNIQUE, --UNIQUE
        sid varchar(14) not null
    );

create table
    target (id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY, address1 varchar(50) not null);

create table
    team (id int generated always as identity PRIMARY KEY, name varchar(20) not null, address1 varchar(50) not null);

create table
    apply (
        id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        guestid int not null,
        targetid int not null,
        teamid int,
        applydate date not null,
        surveydate date,
        survertime time,
        --FOREIGN KEY 두 필드는 타입과 길이를 똑같이 맞춰준다(int=int, varchar(10)=varchar(10), FK가 NOT NULL을 의미하지 않는다 빈칸이나 null로 입력가능)
        CONSTRAINT fk_apply_guestid FOREIGN KEY (guestid) REFERENCES guest (id), --참조테이블에 없는 값으로 입력/수정 불가
        CONSTRAINT FK_APPLY_TARGETID FOREIGN KEY (targetID) REFERENCES target (ID), --연결된 자료가 있으면 참조테이블 수정/삭제 불가
        CONSTRAINT FK_APPLY_TEAMID FOREIGN KEY (teamID) REFERENCES team (ID) on delete cascade /*참조테이블 삭제 가능 옵션*/ on update cascade /*수정 가능 옵션*/
    );