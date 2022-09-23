# Changelog

## 2022-09-20

- 修改时区为中国上海
- 修改源为中科大的源

---------------------------------------

- Alpine 的源文件为：

```
/etc/apk/repositories
```

- 阿里云的源

```
sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
```

- 中国科技大学的源

```
sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
```

- 清华源

```
sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
```







