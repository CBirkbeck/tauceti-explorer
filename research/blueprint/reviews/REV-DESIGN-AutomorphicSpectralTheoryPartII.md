# Independent review: Automorphic spectral theory, Part II

Accepted after correction, 19 October 2026. Reviewer: Codex, session
`codex-s4ZlSf`, job `REV-DESIGN-AutomorphicSpectralTheoryPartII`, issue #3503.
The design was written by a different session, `codex-SwqWWZ`. This review
accepts a complete target-level planning pass, not completed mathematics or
formalization. All six stages remain planned; none is closed. The 16 gaps and
15 open supplier contracts are explicit prerequisites of implementation.

## Inventory and coverage

The packet has 63 nodes: 23 definitions, 6 constructions, 30 theorems,
2 comparisons and 2 applications. Every node has an individual review entry:
54 verified and 9 corrected; no nodes were added or left unverifiable.
The 29 definitions/constructions have 87 API items and 87 discriminating
mathematical unit tests. There are 32 planets, at most six per stage. All
implementation statuses remain unchecked.

The six target chains were checked against the stage descriptions, supplier
statements, source hypotheses and proof plans. The 99 input routes account
for 80 BPLZZ items, 18 BPCZ items and one Bakker–Tsimerman item. The last
remains with the existing CongruenceSpectralGap:CSG.5 owner. Conjectural
converses to the multiplier theorem, the unrestricted noncuspidal Lapid
conjecture, and an identity on an entire near-equivalence class are excluded.
The GL_n constituent application uses isobaric strong multiplicity one with
norm twists, rather than a cuspidal-only theorem.

## Corrections made

Packet statements, proof plans, reader text and the corresponding roadmap
stage descriptions were reconciled wherever affected.

| Node | Correction and evidence |
| --- | --- |
| SM.0/vertical-interpolation | State the affine-lattice consequence of BPLZZ Corollary 2.6, pp.9–10, by translating the variable and exceptional set. Keep complex-linear independence; an arbitrary real lattice is not enough. |
| SM.2/weights | Replace compact generation of the whole adelic group by the connected split real torus argument, followed by Iwasawa/Siegel reduction and height comparison, as in BPCZ Lemma 2.4.3.1, pp.203–205. |
| SM.2/cusp-neighborhoods | Require P∩H⊊Q∩H for the subgroup depth inequality and its API. Otherwise the stated finite root minimum may be empty. Equal-parabolic conclusions use the identity case. See BPCZ §2.4.4, pp.206–208. |
| SM.2/slf-representations | Use the compact finite-place isotypical decomposition into Fréchet summands and the averaging projections in BPCZ Lemma 2.5.4.1, pp.210–211. The argument is not a closed-subspace theorem for arbitrary strict LF spaces. Open mapping is applied to quotient-to-image maps on the Fréchet pieces. |
| SM.3/regular-constant-term | Remove the duplicated conclusion from R11. AS.3 supplies compact-data inner-product/constant-term formulas and their normalizations; this node derives regular L² boundedness and δ_P^{s−1/2}-weighted holomorphy for Re(s)>0. See BPCZ Proposition 2.9.7.1 and Corollary 2.9.7.2, pp.235–238. |
| SM.3/schwartz-kernels | Fix the Fourier test: with R(f)φ(x)=∫f(g)φ(x+g)dg on the mass-one circle, f=e_{−n} gives kernel e_n(x)conj(e_n(y)); f=e_n projects onto the opposite character. This tests the sign and Haar normalization together. |
| SM.4/quasi-cuspidal | Correct the locator of BPLZZ Definition 3.2 from p.21 to p.22. |
| SM.4/finite-typical-data | Specify the allowed affine central lattice coset after fixing ω and normalizing twists, possibly of rank zero. Do not identify the norm-one cotangent space with the entire relative c_M*/a_M* without comparison. R9 now requests that comparison and finite-component finiteness. See BPLZZ Lemmas 3.13–3.14, pp.26–27. |
| SM.4/archimedean-annihilator | Apply interpolation to that affine coset after translation, with complex-linearly independent generators. Preserve the sharp seed, nonzero target value and annihilation for every complex inducing twist. |

R1 and G1 now state the split SLF/direct-sum comparison precisely. R9
separates the norm-one character lattice from the remaining relative central
parameters. R11 requests existing compact-data identities rather than the
new regular weighted theorem. Their mirrored gap descriptions and reader
contracts were updated. No supplier file or ownership boundary was changed.
The public upstream source link was corrected to the repository's actual
root, and its read-range inventory now explicitly includes AS.3.

The suggested file needs no change: its one-dimensional interpolation
statements are valid special cases, and it never states the affected
adelic/topological targets over absent carriers. Its six real-bodied light
definitions use existing carriers; its proof placeholders are confined to
propositions. No implementation or auxiliary development was introduced.

## Source verification and errata decisions

The following public editions were read at the packet's locators. PDF
hashes, dates and source versions are recorded in the packet. No source
passages or source files are submitted.

- [BPLZZ, arXiv:1912.07169v3](https://arxiv.org/pdf/1912.07169v3): §§1–3,
  pp.1–30; Appendix A, pp.43–45; §4.2, pp.33–35 for the finite-place interfaces.
  Findings concern this preprint only; the published Annals full text was
  not obtained.
- [BPCZ, published IHÉS 135](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00129-1.pdf):
  §§2.4–2.5, pp.202–221 and §§2.8.4–2.10.2, pp.227–243.
- [Lapid, ESI 2403](https://www.esi.ac.at/preprints/esi2403.pdf): §2,
  §3.6, pp.19–20; Theorem 4.5, p.22; Proposition 5.1, pp.22–24;
  Corollaries 5.7–5.8, pp.25–26; §6, pp.26–28. The general-group result
  retains hereditary (HP); the indicated GL_n cases are unconditional.
- [Bernstein, published author scan](https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/Ber-Plancherel-JGF.pdf):
  §§3.2–3.5, especially the local Sobolev, Hilbert–Schmidt and nuclearity
  arguments on pp.685–689.

All 36 inherited source issues were adjudicated: 25 confirmed and 11 rejected.
The rejected entries are E2, E4, E15, E20, E26, E27, E28, E29, E31, E32 and
E33. In particular the PDF already has the correct real-part expression,
corollary pair, complex Cauchy disk, complex-independent lattice convention,
character lattice, symbol-class order, rational base field, rational coset
quotient, twist subscript and compact restriction. The positivity proof
already works on the full real minus-eigenspace. Several purported defects
arose from misreading or extracting the mathematical typography.

Seven distinct findings were added, each with its own confirmed verdict:
`E-REV-symbol-name`, `E-REV-weyl-invariance`, `E-REV-central-torus`,
`E-REV-parabolic-name`, `E-REV-splitting-criterion`,
`E-REV-induced-character` and `E-REV-compact-name`. These identify the actual
notation defects and the false splitting equivalence, not the rejected
allegations. For the latter equivalence, an anisotropic semisimple ℚ-group
has minimal Levi G and c_G*=a_G*=0 without being ℚ-split. The plan never uses
that equivalence. There are now 43 source issues: 32 confirmed and 11 rejected.

E10 is confirmed only as an additional simultaneous-normalization argument
missing from the anisotropic projection remark. This review does not claim
a counterexample to that remark. E22 is the unnecessarily stronger proof
hypothesis in an otherwise valid local division lemma. E-SLF retains its
explicit qualification about the meaning of morphism. E-T0 is confirmed by
moving point masses in total variation; the roadmap correctly keeps weak
convolution and records the smooth-subspace comparison as open G1 work.

## Baseline and ownership

All seven baseline anchors were independently read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti is pinned at
`f790474821cf4256814db967cb154e7af3d0c369`. None was removed or replaced.

| Anchor | Checked scope |
| --- | --- |
| SchwartzMap | Smooth real normed-space maps with bounds on all iterated derivatives; not reductive-group or quotient Schwartz spaces. |
| CentroidHom | Additive two-sided algebraic centroid on a nonunital nonassociative semiring; continuity and complex linearity are extra predicates. |
| Differentiable | Everywhere differentiability over the stated field; the suggested functions use ℂ. |
| Complex.exp | The complex power-series exponential. |
| Polynomial.eval | Same-semiring polynomial evaluation, as used in the suggested zero-set statement. |
| Multipliable | The source declaration generates Summable by the additive transformation; the generated additive definition is existence of HasSum and is elaborated in the suggested file. |
| MeasureTheory.Lp | The almost-everywhere carrier with finite eLpNorm, not pointwise measurable functions. |

The reviewed library audit and the actual statements of imported AA, AF,
AS and AL nodes were checked, including quotient measures, growth carriers,
SF representations, induction, cuspidal data, pseudo-Eisenstein series,
wave packets, spectral decomposition and isobaric multiplicity one.
The remaining strengthenings are explicit requests, not assertions that a
nearby statement already supplies them. The parent/supplier packets do not
import this Part II, so the corrected R11 creates no new dependency cycle.

Current upstream was checked at TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. OperatorTheory and ReductiveGroups
were read as complete ownership/style references. OperatorIdeals
OI-B32–41/OI-B84, LieGroups real forms, PDE Sobolev targets and the
RealAlgebraicGeometry boundary were checked at the required interfaces.
Current Euclidean Schwartz derivative/Hermite helpers and Sobolev results
were inspected. They do not supply automorphic quotient Schwartz spaces.
Generic spectral calculus, operator ideals and root-data structure remain
with their existing upstream owners.

## Validation and remaining work

`python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicSpectralTheoryPartII.json`
passes with **0 errors and 0 warnings**. A separate consistency check verifies
all 63 reader statements, proof steps, API/tests and stage targets against
the packet, review coverage, local acyclicity, input routes and planet bounds.
`git diff --check` passes.

`lean-check research/blueprint/suggested/AutomorphicSpectralTheoryPartII.lean`
independently exited 0 at the pinned baseline on 19 October 2026, with exactly
23 expected `sorry` warnings and no others. The unchanged file has 156 lines.
The mathematical tests remain planned obligations; elaboration does not
prove their statements.

No correction or clarification is needed from the orchestrator to accept
this planning pass. Before implementation, resolve G1 and the 15 named
supplier contracts, especially the original Donnelly, Müller, Delorme,
Kostant, Wallach, Sakellaridis and Nash-product statements not obtained here.
Preserve the source-version limits and rejected errata verdicts when any
later source or packaging job consumes this packet. Packaging must retain
planned status rather than treat acceptance as proof closure.
