package com.example.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "users")
public class User {

    @Id
    @Column(name = "id")
    private Long id;

    private String loginName;
    private String password;
    private String name;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
    name = "users_authorities", // SQLの中間テーブル名
    joinColumns = @JoinColumn(name = "user_id"), // 自分の外部キー
    inverseJoinColumns = @JoinColumn(name = "authority_id") // 相手の外部キー
    )
    private List<Authority> authorities;

}
