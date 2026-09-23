# Mistakes in Couveignes, *Enumerating number fields*

Job ERRATA-PAPER-COUVEIGNES-20. Original worker: Claude Code, session `cc-fb70e5`, 22 September 2026. Independently reviewed by Codex, session `codex-hjdg0j`, job REV-ERRATA-PAPER-COUVEIGNES-20, 23 September 2026. The finding and its confirmed verdict are in `PAPER-COUVEIGNES-20.json` beside this file.

**Paper and versions read.** Jean-Marc Couveignes, Annals of Mathematics 192 (2020), 487–497, DOI 10.4007/annals.2020.192.2.4. The extraction read the publisher PDF in full. The independent review REV-PAPER-COUVEIGNES-20 (PR #1655) also compared the arXiv source of 1907.13617v2 (29 August 2019). The published version states Theorem 1 and Propositions 1–2 with the root discriminant δ_K, where the arXiv text uses d_K^{1/n}; that is a revision, not a mistake.

**Earlier work.** The extraction PAPER-COUVEIGNES-20, by Codex, and its review found no mathematical mistake in the paper. The extraction noted the one notational slip recorded here (item `relation-lattice`).

**Existing corrections.** A fresh search on 23 September 2026 found none in the [Annals article page](https://annals.math.princeton.edu/2020/192-2/p04), [arXiv history](https://arxiv.org/abs/1907.13617), [author's page](https://www.math.u-bordeaux.fr/~jcouveig/) and linked [HAL publication list](https://cv.hal.science/jean-marc-couveignes), or [Crossref correction metadata](https://api.crossref.org/works/10.4007/annals.2020.192.2.4). Exact-title searches with erratum, corrigendum and correction also located none. Both arXiv versions and the later [HAL deposit](https://hal.science/hal-02375397v1/file/nf.pdf) retain E1. This is a bounded search, not a claim of discovery priority. Source hashes and reading scope are recorded in the JSON and review report.

## E1. A tensor product over Q of a Z-module (misprint; affects nothing)

The lattice in §3 consists of integral polynomials in the kernel of evaluation. Published p.493 then prints “L = 𝓛 ⊗_Q R”. The intended object is L = 𝓛 ⊗_Z R, its real span inside V_R, equivalently (𝓛 ⊗_Z Q) ⊗_Q R.

This is not merely a missing declaration of scalars. The assumptions give ℓ = C(d+r,d) − n ≥ nr ≥ 1; a basis vector of this nonzero finite free abelian group is not divisible by 2. Thus no compatible Q-module structure exists on the lattice itself. On the other hand, real scalar extension of the integral evaluation matrix identifies 𝓛 ⊗_Z R with its real kernel. Orthogonal complements and the ensuing lattice-volume and successive-minima arguments use precisely this space. The correction changes the scalar subscript and no mathematical conclusion.

**Independent verdict: confirmed.** The reviewer read published pp.491–494 and inspected the image of p.493; compared arXiv v1/v2 p.5, the v2 TeX source, and HAL PDF p.7. Each retains the same scalar subscript. No additional source finding was established in this review.

## Checked and found correct

The following were checked because they are easy to get wrong, and they are correct as printed:
- the canonical measure of the sup-norm unit ball, 2^r(2π)^s ≥ 2^n (p. 489);
- the lower bound 1 ≤ ‖x‖ for nonzero integral x;
- the monomial count C(d+r, d);
- the per-variable degree bound used for grid nonvanishing (p. 492).

The reviewer corrected the first bullet's transcription from `>` to `≥`. The publisher page image and arXiv v2 TeX both have the correct non-strict inequality. Indeed its ratio to 2^n, where n = r + 2s, is (π/2)^s; equality holds when s = 0. This was an error in this report, not in Couveignes's paper.
