USE reservation_system_db;

DROP TABLE IF EXISTS users_departments;
DROP TABLE IF EXISTS users_authorities;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS authorities;
DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS facilities;
DROP TABLE IF EXISTS users;

CREATE TABLE facilities (
        id                            BIGINT            AUTO_INCREMENT,
        name                     VARCHAR(64) NOT NULL,
        capacity                 BIGINT             NOT NULL,
        extension_number VARCHAR(4)   NOT NULL,

        CONSTRAINT pk_facility_id
            PRIMARY KEY (id),
        CONSTRAINT uk_facility_name
            UNIQUE (name)

)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE users (
        id                      BIGINT             AUTO_INCREMENT,
        login_name            VARCHAR(10)  NOT NULL,
        password         VARCHAR(60)  NOT NULL,
        name               VARCHAR(64)  NOT NULL,
        department_id BIGINT,
        authority_id     BIGINT,

        CONSTRAINT pk_user_id
            PRIMARY KEY (id)

)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE departments (
        id                            BIGINT              AUTO_INCREMENT,
        department_name VARCHAR(64)   NOT NULL,
        extension_number VARCHAR(4)    NOT NULL,

        CONSTRAINT pk_department_id
            PRIMARY KEY (id),
        CONSTRAINT uk_depatment_name_extension_number
            UNIQUE (department_name, extension_number)

)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE authorities (
        id     BIGINT                 AUTO_INCREMENT,
        role VARCHAR(20)      NOT NULL,

        CONSTRAINT pk_authorities_id
            PRIMARY KEY (id)

)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





CREATE TABLE users_departments (
        id                       BIGINT    AUTO_INCREMENT,
        user_id              BIGINT    NOT NULL,
        department_id   BIGINT    NOT NULL,

        CONSTRAINT pk_user_id
            PRIMARY KEY (id),
        CONSTRAINT uk_user_id_department_id
            UNIQUE (user_id, department_id),
        CONSTRAINT fk_users_departments_user_id
            FOREIGN KEY (user_id)
            REFERENCES users(id),
        CONSTRAINT fk_users_departments_department_id
            FOREIGN KEY (department_id)
            REFERENCES departments(id)

)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE users_authorities (
        user_id          BIGINT     NOT NULL,
        authority_id   BIGINT    NOT NULL,

        CONSTRAINT pk_users_authorities
            PRIMARY KEY (user_id, authority_id)

)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;







CREATE TABLE reservations (
        id BIGINT AUTO_INCREMENT,
        start_at DATETIME NOT NULL,
        end_at DATETIME NOT NULL,
        purpose VARCHAR(255),
        facility_id BIGINT NOT NULL,
        user_id BIGINT NOT NULL,

        CONSTRAINT pk_reservation_id
            PRIMARY KEY (id),
        CONSTRAINT uk_reservation
            UNIQUE(start_at, end_at, facility_id),
        CONSTRAINT fk_facilitiy_id
            FOREIGN KEY (facility_id)
            REFERENCES facilities(id),
        CONSTRAINT fk_user_id
            FOREIGN KEY (user_id)
            REFERENCES users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;