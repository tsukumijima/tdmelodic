# tdmelodic (fork)

tdmelodic 本家の Docker イメージは長らく更新されていません。  
また5年以上前に開発が停止された Chainer で開発されていること、部分的に MeCab に依存していることから、Docker を使わずに動作環境を構築するのは難易度が高いです。

このフォークでは、Docker イメージの整備・前処理の改善など、使い続けるにあたっての最小限の改善を行っています。

> [!TIP]
> 機械学習モデルは今となっては非常に軽量な類のため、CUDA を使わずとも CPU だけで高速に動作します。  
> このため、CUDA 版イメージは用意していません。

### Docker イメージの取得

```bash
$ docker pull ghcr.io/tsukumijima/tdmelodic:latest
```

上記コマンドで、このフォーク版 tdmelodic の最新の Docker イメージを取得できます。  
`tdmelodic:latest` には、GitHub Actions により、最新の master ブランチのコードが自動的にビルド・公開されています。

### テスト

```bash
$ echo "上総一ノ宮" | docker run -i tdmelodic tdmelodic-s2ya
カ]ズサイ[チノ]ミヤ

$ echo "北品川,キタシナガワ" | docker run -i tdmelodic tdmelodic-sy2a
キ[タシナ]ガワ
```

-----

下記ならびに [docs/](docs/) 以下のドキュメントは、tdmelodic 本家のドキュメントを改変なしでそのまま引き継いでいます。  
これらのドキュメントの内容がこのフォークにも通用するかは保証されません。

-----

<p align="center">
<img src="https://github.com/PKSHATechnology-Research/tdmelodic/raw/master/docs/imgs/logo/logo_tdmelodic.svg" width="200" />
</p>


# Tokyo Dialect MELOdic accent DICtionary (tdmelodic) generator

[![document](https://readthedocs.org/projects/tdmelodic/badge/?version=latest)](https://tdmelodic.readthedocs.io/en/latest)
[![arXiv](https://img.shields.io/badge/arXiv-2009.09679-B31B1B.svg)](https://arxiv.org/abs/2009.09679)
[![Python unittest](https://github.com/PKSHATechnology-Research/tdmelodic/actions/workflows/test.yml/badge.svg)](https://github.com/PKSHATechnology-Research/tdmelodic/actions/workflows/test.yml)
[![Docker](https://github.com/PKSHATechnology-Research/tdmelodic/actions/workflows/docker-image.yml/badge.svg)](https://github.com/PKSHATechnology-Research/tdmelodic/actions/workflows/docker-image.yml)
[![Lilypond](https://github.com/PKSHATechnology-Research/tdmelodic/actions/workflows/img.yml/badge.svg)](https://github.com/PKSHATechnology-Research/tdmelodic/actions/workflows/img.yml)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)


This module generates a large scale accent dictionary of
Japanese (Tokyo dialect) using a neural network based technique.

For academic use, please cite the following paper.
[[IEEE Xplore]](https://ieeexplore.ieee.org/document/9054081)
[[arXiv]](https://arxiv.org/abs/2009.09679)

```bibtex
@inproceedings{tachibana2020icassp,
    author    = "H. Tachibana and Y. Katayama",
    title     = "Accent Estimation of {Japanese} Words from Their Surfaces and Romanizations
                 for Building Large Vocabulary Accent Dictionaries",
    booktitle = {2020 IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP)},
    pages     = "8059--8063",
    year      = "2020",
    doi       = "10.1109/ICASSP40776.2020.9054081"
}
```

## Installation and Usage

- English: [tdmelodic Documentation](https://tdmelodic.readthedocs.io/en/latest)
- 日本語: [tdmelodic 利用マニュアル](https://tdmelodic.readthedocs.io/ja/latest)

## Acknowledgement
Some part of this work is based on the results obtained from a project subsidized by the New Energy and Industrial Technology Development Organization (NEDO).
