INSERT INTO facilities(id, name, capacity, extension_number ) VALUES
        ('1', '大会議室', '40', '2110'),
        ('2', '第1会議室', '10', '2111'),
        ('3', 'ミーティングスペースA', '4', '4210'),
        ('4', 'ミーティングスペースB', '6', '4211');

-- PASSWORD HASH 平文
INSERT INTO users ( id, login_name, password, name, department_id, authority_id ) VALUES
        ('1', 'soramame', '$2a$10$Ppu5XoPRV1oFqifTFVp1meGgPvtWRw9E/XqBYoKVgMcRqUX87qQSm', 'そらまめ', '1', '2'),
        ('2', 'yudemame', '$2a$10$TWx9sHH.1zP6aLKw9Po0m.b66zTr2oeMAMMoqqgQ7M4HE9daZLM3a', 'ゆでまめ', '2', '2'),
        ('3', 'admin', '$2a$10$1lf0dzDoSqnqtY6ERfb6OOeskR/MD1MW6Ckei9/mK6647NzqePyJ.', '管理者', '3', '1'),
        ('4', 'failure', '$2a$10$fj7DX4QwUFwv15MjWz/.4.I0ZZzQdnVtWR7NOGgzdOVCGt./cm/42', '不正ユーザー',  '4', '3');

INSERT INTO departments (id, department_name, extension_number) VALUES
        ('1', '教育事業部', '4101'),
        ('2', '技術部', '4002'),
        ('3', '管理部', '4003'),
        ('4', '不正事業部', '9999');

INSERT INTO authorities (id, role) VALUES
        ('1', 'ADMIN'),
        ('2', 'GENERAL'),
        ('3', 'FAKE');

INSERT INTO users_departments (id, user_id, department_id) VALUES
        ('1', '1', '1'),
        ('2', '2', '2'),
        ('3', '3', '3'),
        ('4', '4', '4');

INSERT INTO users_authorities (user_id, authority_id) VALUES
        ('1', '2'),
        ('2', '2'),
        ('3', '1'),
        ('4', '3');


INSERT INTO reservations (id, start_at, end_at, purpose, facility_id, user_id) VALUES
        ('1', '2004-04-01 10:00:00', '2004-04-01 12:00:00', 'お誕生日会', '3', '1'),
        ('2', '2004-04-01 16:00:00', '2004-04-01 18:00:00', 'OOADレビュー', '3', '2'),
        ('3', '2005-04-01 10:00:00', '2005-04-01 12:00:00', 'お誕生日会', '3', '1');