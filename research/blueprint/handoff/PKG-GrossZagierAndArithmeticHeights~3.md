# PKG-GrossZagierAndArithmeticHeights~3: package revision, round 3

Issue #11032. Claude, session `claude-rsk8qI`, 19 October 2026. The bot confirmed the claim
([comment 6272834285](https://github.com/CBirkbeck/tauceti-explorer/issues/11032#issuecomment-6272834285)).
This is the author's revision. It is not an independent acceptance. I did not write the package,
its earlier revisions or any of its reviews, and I claimed no other job.

The revision answers the remaining defects of the second package review,
[REV-PKG-GrossZagierAndArithmeticHeights~2](../reviews/REV-PKG-GrossZagierAndArithmeticHeights~2.md)
(R1, the local comparison interfaces; R2, the Yuan–Zhang–Zhang locators). It builds on the fix job
`FIX-PKG-GrossZagierAndArithmeticHeights~adv` (PR #11036, Claude `claude-TYlSTQ`), whose README and
Suggested.lean are the base of this revision and are kept unchanged except where listed below. That
job left one residue, whose only source it took to be the Yuan–Zhang–Zhang book (not in the cleared
library, and with no author copy online): the exact support condition S¹ of 7.4, and the geometric
half of the bad-place nonsingularity in 7.47. Both are now sourced from public texts that restate
the book's statements with its numbering. The Suggested.lean is rewritten to the maintainer's
2026-10-19 rule on examples.

Deliverables: [README.md](../packages/GrossZagierAndArithmeticHeights/README.md),
[Suggested.lean](../packages/GrossZagierAndArithmeticHeights/Suggested.lean), metadata.toml
(unchanged, `topic = "math.NT"`). The README still has 287 targets (Layers 0–9: 12, 5, 15, 13, 7, 6,
78, 109, 20, 22). `review.json` is left to the next independent review.

## New public sources

- D. Disegni, *The p-adic Gross–Zagier formula on Shimura curves*, arXiv:1510.02114v3 (identical to
  Compositio 153 (2017) apart from footnotes). §6.1, pp. 50–51, restates Yuan–Zhang–Zhang's
  Assumptions 5.2–5.6 on the Schwartz function and the sets S₁, S₂, with Proposition 5.8 as his
  Lemma 6.1.6 and Lemma 5.10 cited for Assumption 5.4. Proposition 8.3.1, p. 57, restates Theorem
  7.8(1) and (4) and Proposition 8.8. Lemma 8.2.1, p. 56, restates §7.2.2. The proof after Theorem
  8.3.2, p. 58, cites §7.4.3 for the vanishing of the S₁ terms (Tunnell–Saito with Waldspurger).
  Proposition 5.4.3, pp. 49–50, gives the reduction by multiplicity one. Theorem 5.4.1, p. 49,
  restates Theorem 3.22.
- X. Yuan, *Modular heights of quaternionic Shimura curves*, arXiv:2205.13995v3, §1.5, pp. 7–8: the
  identity in the form "Pr I′ − 2Z is perpendicular to the cusp form", and footnote 7, which cites
  Theorem 5.7 (the degeneracy assumptions lose no generality).
- Yuan–Zhang, Annals 187, read again for the statements about Assumption 5.3: p. 585 (it removes
  E′₀), p. 587 (Assumption 7.1 = Assumption 5.4), p. 606 (Theorem 8.1 = Theorem 3.17), p. 608 (it
  removes all self-intersections), p. 611 (the domain of the multiplicity function), p. 621 (the
  j-part is nonsingular under 5.3, proved by Yuan–Zhang–Zhang), pp. 622–624 (Lemma 8.9, Remark 8.10).
- The 2026 author erratum, read in full; nothing in it changes 7.4, 7.5, 7.47 or 8.1.

The book itself was not read. The authors' pages (Princeton, Berkeley) link only the erratum. The
ResearchGate copy of the 2011 draft refuses scripted access, and I did not try to get round that.

## Changes

| Place | Change |
| --- | --- |
| Conventions | New standing block **(D)**, degenerate Gross–Zagier data: S₁ (nonsplit, \|S₁\|≥2, containing every nonsplit place where E/F or F/ℚ is ramified, 𝔅 or χ is ramified, or σ_v is not an unramified principal series); S₂ (two split places, σ and χ unramified); pure tensor, standard at ∞ and ℚ-valued; S¹ at S₁, S² at S₂, standard function 1_{O_𝔅}⊗1_{d⁻¹O^×} at the other nonsplit places; principal congruence levels, maximal at the other nonsplit places and at S₂; χ invariant under U∩E^×(𝔸_f); φ invariant under U×U; −1∉U; U small. "six blocks" became "seven". |
| 7.4 | Rewritten as a target with three statements. (1) S¹ vanishing on E_v, near 0 and, by invariance, on U_vE_v^×U_v. (2) Under (D), terms on the line E vanish for g∈K_{S₁}GL₂(𝔸^{S₁}); \|S₁\|≥2 is what kills the derivative of the constant term, by the product rule. (3) Existence of data (D) with nonzero local toric contractions (Proposition 5.8). The gap paragraph is removed. Three new Checks: invariant functions nonzero on U_vE^×U_v are excluded; with S₁={v₀} the constant-term derivative survives; item 2 fails at g_v=w. Draft-numbered ResearchGate locators are replaced by the book numbering, confirmed through Disegni and Yuan. |
| 7.5 | Exact statement: for (D) data with Σ(𝔅)=Σ(σ,χ) and v nonsplit, the σ-component of every coherent kernel of B(v) vanishes. The proof runs through the Shimizu lift, the product of local toric functionals and the zero local Hom at v (4.1, 4.2; equivalently 5.3). The coherent kernel is defined from 5.1, so there is no forward reference. New Checks: Σ(B(v))=Σ(σ,χ) gives nothing; nonzero kernels are allowed; split places have no nearby algebra containing E. Locator: §7.4.3 via Disegni p. 58. The gap is removed. |
| 7.47 | Assumes (Q) and (D). For the standard ψ, the nonsplit places of S′ are exactly S₁ (proved in the statement). The geometric half of item 1 is now Theorem 7.8(4), with a four-step route: (a) S¹ kills the undefined orbit of the multiplicity; (b) only finitely many cosets contribute; (c) local constancy across E_v; (d) compact support. Steps (a) and (b) are elementary from S¹. Steps (c) and (d) use properties of the multiplicity function established with Theorem 7.8(4). The l-part follows Yuan–Zhang's Lemma 8.9 and Remark 8.10. The gap became a short source note: the deep-level proof of steps (c) and (d) is in the book only. |
| 8.1 | Hypotheses made explicit ((Q), Σ(𝔅)=Σ(σ,χ), parallel weight two, finite-order χ, the hypotheses of 6.24, 6.38 and 6.1). Outline: place-by-place cancellation for data (D), with split places vanishing by Theorem 7.8(1); then the reduction by multiplicity one through the Shimizu lift (Disegni, Proposition 5.4.3). The target had no Checks; three were added (the factor 2; Σ(𝔅)≠Σ(σ,χ); \|S₁\|=1). Locators: Theorem 5.7, via Yuan's footnote 7, and Disegni pp. 49–50 and 57–58. The gap became a source note naming the two inputs proved only in the book: Proposition 5.8 at S₁, and Theorem 7.8(4) at deep level. |
| 6.20, 6.39, 8.11 | Book numbers confirmed in public: Theorem 3.17 (Yuan–Zhang Theorem 8.1, p. 606) and Theorem 3.22 (Disegni Theorem 5.4.1, p. 49). In 8.11, "a required proof input from the book" now names 6.39 and 8.1. |
| 0.1, Prerequisites | **Normalization correction.** At the Tau Ceti pin f790474, `Point.canonicalHeight` is lim h_x(2ⁿP)/(2·4ⁿ) = h_(O): its pairing has diagonal h_(O), and its regulator is 2^{−r} times the BSD one. On current Tau Ceti main (a91d3aaf) it is lim h_x(2ⁿP)/4ⁿ = h_x, which is what the README describes. Both versions are now stated, with a 37.a1 version-witness Check. This is why the Lean file states no height identity. |
| 0.4 | The API name `unitIndex_eq_one_iff` became `unitIndex_of_imaginaryQuadratic`, now a Lean milestone. |
| Source and interface limits; References | Updated to the above; Disegni added to the References. "atlas pin" and "roadmap of the atlas" wording removed. |

## Suggested.lean

Rewritten to the 2026-10-19 rule. Every `example` is now proved, there are at most two per kept
definition, and no example is an admitted (`sorry`) one. Removed: the purely numerical examples
(`bdpEulerFactor 5 1`, `5 (−4)`, `rankinPolynomial 0`, `rankinPolynomial 2 1`, the `(1+X)²` power
series), the duplicate `unitIndex` value, and the third and fourth examples of several definitions.
Each kept example pins a convention or is a negative control:
- the stabilizer normalization 2u=w and u=3 at six roots of unity;
- the factorial normalization of p₂;
- the bottom and top cases of p_{k,r};
- the inverse-character membership, and a fixed nonzero vector outside the eigenspace;
- the trivial-character sum, and orthogonality for a nontrivial character (Mathlib
  `sum_hom_units_eq_zero`);
- the average on a fixed vector, and the characteristic-3 zero;
- the trivial-character evaluation and quadraticity of `bdpLFunction`;
- the empty and zero-factor cases of `bdpIncomplete`;
- the boundary witness `bdpEulerFactor 1 2 = 0` for the hypothesis 1<p.

A new milestone, `unitIndex_of_imaginaryQuadratic` (README 0.4), states the classification at the
pins with `NumberField.IsTotallyComplex`, `Module.finrank ℚ K = 2` and `NumberField.discr`. The six
`sorry` theorems are all README targets. The closing block comment of README-only definitions is
unchanged. The file has 275 lines.

## Adversarial pass (touched statements)

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| S¹ (7.4.1) | x∈E_v (x₂=0); x near 0; x∈kE^×k′ with k,k′∈U_v and Weil invariance φ(h₁⁻¹xh₂,q(h₁)q(h₂)⁻¹u)=φ(x,u) (Yuan, modular heights) | vanishes in all three | stated |
| E-terms (7.4.2) | S₁={v₀}; g_v=w at v∈S₁; g_v∈K_v; non-pure tensors | one place is not enough; fails at w | restricted to K_{S₁}GL₂(𝔸^{S₁}); \|S₁\|≥2 explained by the product rule |
| (D) | v nonsplit outside S₁ with F_v/ℚ_p ramified; ψ nonstandard; split v with χ ramified | the first is excluded by S₁; the second breaks "S′∩nonsplit=S₁"; the third is allowed with deep U_v | ψ standard made explicit |
| 7.5 | v split in E; Σ(B(v))=Σ(σ,χ); σ with no JL transfer to B(v) | no B(v)∋E; nothing forced; zero lift | Checks |
| 7.47(a)–(b) | y∈E^×, x in the U_v-coset of y; ord(uq(y))≥−ord(d_v); u→0 with q(y)→∞ | killed; killed; bounded by (d) | route stated, steps (c)–(d) attributed |
| 8.1 | factor 1 vs 2; Σ(𝔅)≠Σ(σ,χ); a pair with a zero local contraction | doubles 8.11's constant; 0=0; reduction needs nonzero contractions | Checks; Outline |
| 0.1 | pinned vs current `canonicalHeight` on 37.a1 (0,0) | 0.02555… vs 0.05111…; pinned regulator 2^{−r} smaller | version paragraph and Check |
| Lean | every example compiled with a real proof; `heegnerAverage` at card G = 3 in ZMod 3 | true | rewritten |

## Checks run

- `lean-check` on the final Suggested.lean: exit 0, six `declaration uses sorry` warnings and
  nothing else (75 GB available before the final run, after rebasing onto main with #11036 merged). Elaboration does not certify the mathematics.
- `python3 research/blueprint/intake.py check-files` on README.md, Suggested.lean and
  metadata.toml: 0 problems. `git diff --check` is clean.
- README: 287 anchors and 838 internal links, all resolved; link labels match their headings; no
  forward or self *Needs* edges.
- Own words: a 10-word overlap scan of the added text against Disegni, Yuan–Zhang, Yuan and the
  erratum finds only two formula strings (m_{φ_v}, l_{φ_v}∈S(B(v)_v×F_v^×) and
  W°_{0,v}(0,g,u)=r(g)φ_{2,v}(0,u)).
- The README states no theorem of Tate's thesis and cites none of its numbers.

## For the next worker and the maintainer

1. Two inputs are proved only in *The Gross–Zagier Formula on Shimura Curves* (Annals of
   Mathematics Studies 184): Proposition 5.8 at the places of S₁ (7.4, item 3), and Theorem 7.8(4)
   at deep level (7.47, item 1, steps (c)–(d)). Their statements and numbering are confirmed by
   Disegni and Yuan, so the README marks them as source notes, not gaps. A formalization of those
   steps needs the book. It is neither free nor in the cleared library.
2. The Tau Ceti `canonicalHeight` normalization changed between f790474 and current main by a
   factor of 2. Any roadmap that cites `canonicalHeight`, `neronTatePairing` or `regulator`
   (rank-zero-and-one BSD, Heegner point Euler systems) should say which version it means.
3. PR #11036 (FIX~adv) merged on 19 October 2026 (eaa670b7f) with its own handoff and `review.json`;
   this revision was rebased onto that merge, and its diff touches only the README, Suggested.lean
   and this handoff. `review.json` still carries the fix job's `needs_changes` verdict for the
   residue resolved here; the next independent review replaces it.
