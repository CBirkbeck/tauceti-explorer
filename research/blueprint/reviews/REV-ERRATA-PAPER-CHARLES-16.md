# Review of ERRATA-PAPER-CHARLES-16

**Job** REV-ERRATA-PAPER-CHARLES-16 (issue #1788) · **Date** 2026-09-23 · Claude Code, session `cc-7b31c4` ·
**Verdict: all 7 findings confirmed, none rejected, none amended, none added.**

Source: François Charles, *Birational boundedness for holomorphic symplectic varieties, Zarhin's trick for
K3 surfaces, and the Tate conjecture*, [Annals of Mathematics **184** (2016), 487–526](https://doi.org/10.4007/annals.2016.184.2.4);
arXiv [1407.0592](https://arxiv.org/abs/1407.0592).

The errata job was done by Claude Code session `cc-fb70e5` (pull request #1819). This review is by a
different session, which did not write those files.

## What I could read, and what I could not

**The published article is paywalled and I could not read it.** The Annals article page offers only a
three-page preview (`annals-v184-n2-p04-p.pdf`); the full PDF is not served, and the DOI resolves to the same
page. The errata job read the publisher PDF (sha256 `3425f269…40e2`) and its locators are published pages, so
for two of the seven findings I am checking a quotation I cannot see. I say below exactly where that applies.

**What I did read is arXiv v2** (24 August 2014), the latest public version: PDF sha256
`37d2b945de77b8a40eb23c401335c91c51553d6c458931928ea05b5b16e6714d`, LaTeX e-print sha256
`2ee2bcf9f4a9da36a8f3fb39ff77f30fe1182a3f19e65432d6f8ec240452f7d8`.

Two things about that version matter for anyone re-checking this list, and neither is recorded in the errata:

- **The §2 numbering runs one behind the published version.** Reconstructing the shared theorem counter from
  the source gives Corollary 2.7 `corollary:comparison-of-discriminants`, Proposition 2.8
  `proposition:low-degree-elements-in-lattices` and Theorem 2.9 `thm:Zarhins-trick`, which are the published
  Corollary 2.8, Proposition 2.9 and Theorem 2.10 of E1 and E2. §3 and §4 agree with the printed numbers.
- **arXiv v2 is an incomplete draft.** It is 27 pages against the 40 printed; it carries `changebar` markup
  and an author's note to himself in French; and it **breaks off after Proposition 4.7 with an empty proof
  environment** — there is no §4.2 and no proof of the main theorems. Its proof of Proposition 3.1 also
  differs from the published one. So it is not a substitute for the published text, and in particular the
  passages quoted in **E3 and E7 are not in it**.

**Existing corrections.** Re-checked and none found: the Annals page and the Crossref record carry no
erratum; arXiv stops at v2; Charles's publication page links an erratum only for his 2013 Inventiones paper.
All seven stay `new`.

## Verdicts

Each entry's `review` field carries the detail; the substance is this.

**Checked against the source text and re-derived.** E1, E2, E4, E5 and E6 all quote passages that are in
arXiv v2 verbatim, so the quotations are sound and I could work with the surrounding argument.

- **E1.** The printed proof gets `|disc(v^⊥ ∩ N(X))| = p^r|disc NS(M_H(v))|` and then only the *inequality*
  `|disc N(X)| ≤ v²|disc(v^⊥ ∩ N(X))|` from the injection `Zv ⊕ (v^⊥ ∩ N(X)) ↪ N(X)`. Writing `I` for the
  index of that injection, discriminants scale by `I²`, so the equality is `|disc NS(X)| = p^r(v²/I²)|disc NS(M_H(v))|`
  — the correction. The Hilbert-square counterexample holds up: `v = (1,0,−1)` has `v² = 2`, satisfies
  condition (C) of Definition 2.3 (primitive, `rk = 1 > 0`, `v² > 0`, `gcd(1,0,−1) = 1`), and
  `v^⊥ ∩ N(X) = {(r,D,r)} = NS(X) ⊕ ⟨−2⟩` sits with index exactly 2, since `(a,D,b)` decomposes over
  `Zv ⊕ v^⊥` precisely when `a ≡ b (mod 2)`. So `λ = 1/2`, and for odd `p` no integer `λ ≤ 2` satisfies
  `p^tλ = p^r/2`.
- **E2.** The proof's own first sentence — "the primitive embedding of Λ into Λ_2d corresponds to a tuple" —
  is the hypothesis the statement omits. The counterexample checks out: in `Λ_2 = ⟨2⟩ ⊕ U` the sublattice
  spanned by `2h` and `2(e+f)` has Gram `diag(8,8)` and even half-norms, `m = 1` passes (i) and (ii) for every
  `N, a, b`, and on `Λ_2/2Λ_2 = F_2³` the half-norm descends to `Q(x,y,z) = x + yz`, whose three nonzero
  zeros `(0,0,1)`, `(0,1,0)`, `(1,1,1)` have pairwise sums `(0,1,1)`, `(1,1,0)`, `(1,0,1)`, all of `Q = 1`.
  There is no isotropic plane, so no primitive embedding. The replacement lattice works too: `v = e+f`,
  `w = kh+e` have Gram `[[2,1],[1,2dk²]]` of determinant `4dk² − 1 > 0`, and `(x,y,z) ↦ (z, y−z)` carries them
  to the standard basis, so the span is a direct summand.
- **E4.** Both halves are in the source: "Fix some integer `n ≤ 3`" in the proof of Proposition 3.16, and in
  the Kuga–Satake setup "Let `n ≥ 3` be an integer prime to `p` … a spin structure of level `n`". The proof
  then uses a level-`n` structure and the finiteness of such abelian varieties over a finite field.
- **E5.** A polarization is defined only as an isomorphism class of ample line bundles, with no primitivity,
  so the counterexample is available: on an eligible `(X,H)` of degree `2m₀d` the bundles `H^{⊗ℓ^j}` have
  degree `2(ℓ^{2j}m₀)d`, and for `ℓ` prime to `N, a, b` with `a, b` quadratic residues mod `ℓ`, condition (ii)
  passes to `ℓ^{2j}` by Hensel and to `m₀` by hypothesis, hence to the product by the Chinese remainder
  theorem, while (i) holds for `j` a multiple of the order of `ℓ²` mod `N` and (iii) is untouched. Distinct
  degrees make the pairs pairwise non-isomorphic.
- **E6.** I redid the computation. With `e^{−α/r} = (1, −α/r, α²/(2r²))`,
  `T_{−α/r}(ar, D + aα, cω) = (ar, D, (c − (α·D)/r − aα²/(2r))ω)`, whose last coordinate is not in `Z_ℓ` in
  general for `α` primitive and `r = ℓ^n`. So (4.1) is not the preimage, and since Lemma 4.1's proof reads a
  basis straight off (4.1), nothing downstream moves.

**Confirmed on the mathematics, with the text unchecked.** E3 and E7 quote passages that were added between
the preprint and print.

- **E3.** `3r − 4 > r` needs `r > 2`, while "r is even, so that r > 1" leaves `r = 2`; and the repair is
  available, since "Now up to replacing L by 2L, it is readily seen that we can assume that L has no fixed
  part" stands in the same proof in arXiv v2. But the quoted sentence itself, with its `p`, `q`, `D(p)`,
  `D(q)` and `3L`, is absent from that version, whose proof of Proposition 3.1 instead reaches birationality
  of `φ_{4L}` through adjunction and Riemann–Roch for non-reduced curves. I confirm the finding on the
  quotation as recorded, which the errata job and the extraction each read in the publisher PDF.
- **E7.** The sentence introduces a line bundle `H_n` and then states a property of `c_1(B)`; in §4.1 the
  letter `B` denotes the ℓ-adic B-field `α/ℓ^n ∈ H²(X, Q_ℓ(1))`, which is not a line bundle and has no first
  Chern class, so `c_1(H_n)` is the only reading that makes the sentence well formed. The proof of Theorem 1.3
  is absent from arXiv v2 altogether.

**Nothing added.** I did not add findings. The only version I can read is a draft that differs from the
published text in exactly the places where a mechanical audit of it would be tempting, so a slip in it is no
evidence about the published article. The right way to extend this list is to re-read the publisher PDF.

## What this does to the main results

I agree with the errata's assessment. The three main theorems stand. Corollary 2.8, Proposition 2.9 and
Proposition 3.17 are false as printed and each has a corrected form that is what the proofs use; E3 is a gap
at `L² = 2` with an immediate repair; E6 is a false description of a lattice that nothing depends on; E4 and
E7 are misprints.

## Validation

`python3 scripts/check_errata.py research/blueprint/errata/PAPER-CHARLES-16.json` reports ok and
`research/blueprint/intake.py check-files` reports no problems. All seven findings carry a `review` verdict
with a reason and this job's name. Only the errata JSON, its companion document and this review change.
