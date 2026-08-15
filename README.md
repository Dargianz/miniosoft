# MinioSoft

> [!IMPORTANT]
> **This fork is actively maintained and is no longer treated as an archived project.**
>
> MinioSoft is maintained by the **Team Dargianz of the Galaxy**. Our goal is to keep this project open source, S3-compatible, reproducibly buildable, and community-maintained under the GNU AGPL v3.0 license.
>
> This repository is a Dargianz-maintained fork of MinIO. It is not an official MinIO release and is not endorsed by MinIO.
>
> **Maintenance status:** Active
> **Maintainer:** Dargianz
> **License:** GNU AGPL v3.0

---

> [!NOTE]
> The upstream MinIO repository is archived. This repository is the active Dargianz maintenance fork.

---

# MinIO Quickstart Guide

[![Slack](https://slack.min.io/slack?type=svg)](https://slack.min.io) [![Docker Pulls](https://img.shields.io/docker/pulls/minio/minio.svg?maxAge=604800)](https://hub.docker.com/r/minio/minio/) [![license](https://img.shields.io/badge/license-AGPL%20V3-blue)](https://github.com/Dargianz/miniosoft/blob/master/LICENSE)

[![MinIO](https://raw.githubusercontent.com/minio/minio/master/.github/logo.svg?sanitize=true)](https://min.io)

MinioSoft is a high-performance, S3-compatible object storage solution released under the GNU AGPL v3.0 license.
Designed for speed and scalability, it is maintained by Dargianz for open-source deployments and community collaboration.

- S3 API Compatible – Seamless integration with existing S3 tools
- Built for AI & Analytics – Optimized for large-scale data pipelines
- High Performance – Ideal for demanding storage workloads
- Reproducible Builds – Docker builds compile from source

This README provides instructions for building MinioSoft from source and deploying onto bare-metal hardware or container platforms.
Use the [MinIO Documentation](https://github.com/minio/docs) project for upstream documentation while the MinioSoft documentation is being expanded.

## Open Source and Licensing

MinioSoft is distributed under the GNU Affero General Public License version 3 (AGPLv3). Please preserve all copyright, license, and attribution notices when redistributing or modifying the project.

If MinioSoft is modified and offered to users over a network, the corresponding source code for the running modified version must be made available under the AGPLv3 terms.

MinioSoft is an independent Dargianz-maintained fork. The names, logos, and trademarks of MinIO remain subject to their respective owners. MinioSoft should not be represented as an official MinIO release.

## Maintenance

The **Team Dargianz of the Galaxy** maintains this fork through public source changes, reproducible builds, issue tracking, and community review.

Maintenance priorities include:

- Security and dependency updates
- S3 API compatibility
- Reproducible container builds
- Documentation and deployment support
- Community-reviewed improvements

Contributions are welcome through pull requests and issues in this repository.

## Source-Only Distribution

MinioSoft is distributed from source. Container images and binaries should be reproducibly built from this repository and published with the corresponding source revision.

### Building MinioSoft

The repository includes a multi-stage Dockerfile that compiles the server from source:

```bash
docker build -t miniosoft:latest .
```

### Installing from Source

```bash
go install github.com/Dargianz/miniosoft@latest
```

## Upstream Documentation

- [MinIO documentation](https://github.com/minio/docs)
- [GNU AGPLv3 license](LICENSE)
- [Dargianz MinioSoft repository](https://github.com/Dargianz/miniosoft)
