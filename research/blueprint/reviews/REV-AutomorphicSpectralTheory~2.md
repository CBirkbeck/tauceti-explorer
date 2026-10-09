# Independent revision-2 review: Automorphic spectral theory and trace distributions

**Verdict: accepted.** This accepts the complete target-level planning pass, with its recorded analytic and supplier gaps. It does not claim proof closure or Lean implementation.

Job: `REV-AutomorphicSpectralTheory~2`, issue #7031. Reviewer: Codex, session `codex-gl6qo2`, 9 October 2026. This session did not write either blueprint planning round. The preceding independent review, revision handoff, library audit, supplier statements, source editions, and confirmed red-team findings were read before adjudication. The current review supersedes the old top-level fix-review verdict while preserving it in `reviewHistory`.

## Inventory and acceptance scope

| Item | Result |
| --- | --- |
| Retained nodes | 190: 36 definitions, 37 constructions, 117 theorems |
| Per-node verdicts | 177 verified, 13 corrected, none unverifiable |
| Nodes added or removed | 0 |
| API items / unit tests | 223 / 219 |
| Baseline declarations | 31 existing confirmed; 1 confirmed input added; 0 removed |
| Planets | 38, at most six per stage |
| Source records / routing entries | 30 / 128 |
| Source-issue verdicts | 36 confirmed, 1 rejected |
| Open gaps / supplier requests | 52 / 22 |
| Implementations | All unchecked |

| Stage | Nodes | Coverage |
| --- | ---: | --- |
| AS.0 | 47 | planned |
| AS.1 | 29 | planned |
| AS.2 | 24 | planned |
| AS.3 | 19 | planned |
| AS.4 | 20 | planned |
| AS.5 | 13 | planned |
| AS.6 | 38 | planned |

The top-level `complete` status means a finished inventory pass. Every stated stage target has a node, an imported owner's target, or precise recorded missing work. None is marked closed. The per-node ledger is the packet's `review.checked`: all 190 identifiers occur exactly once, with an individual reason and source locator. Its judgments concern the source target, prerequisites, proof outline, API, tests and declared model limitations together. A source theorem whose non-routine proof is explicitly missing is not represented as already established.

## Previous acceptance blockers

**B1, Schwartz continuation, is resolved.** The current normed Schwartz specialization has two initial continuous families, reflected scalar continuation, a common finite strip order controlling the Schwartz seminorms, and the required dense target input. It constructs the continuation. The previous example exp((1−s)x²) loses the required Schwartz/common-order hypotheses at the reflected side; it is not a counterexample to this signature. BPCZ Appendix A, Corollary A.0.11.1, printed pp.332–333, is the source; general locally convex targets remain a recorded extension.

**B2, LF-dual continuation, is resolved.** The initial functionals are continuous on the half-plane. Dense-subspace evaluations admit the reflected entire continuation with one common strip-order bound, and the conclusion constructs the extending continuous functionals. An arbitrary discontinuous Hamel functional annihilating a dense subspace is not an initial datum satisfying these assumptions. The target is weak-dual entire continuation, not unsupported strong-dual analyticity. BPCZ Appendix A, Corollary A.0.11.2, pp.332–333, supplies the source target.

**B3, Fourier transfer, is resolved.** Yu's finite model uses the full complex additive-character basis, normalized counting probability, and an absolutely summable `HasSum` formula. The positive-dimensional model uses `UnitAddTorus`, actual `mFourierCoeff`, and the sufficient decay order 2s>d. Finite-kernel transfer divides by the full covering degree and averages over all lifts. A zero measure or an incomplete dual family no longer satisfies the signatures. See Yu v5 §5.2.4, pp.34–35, and §5.3.2, pp.38–40.

**B4, object correspondence, is resolved after the corrections below.** All 219 packet test markers have exactly one corresponding suggested example. The tests evaluate the construction or a named source-related finite, scalar, rank-one, normed or one-parameter model. For example, the harmonic diagonal is an actual operator; the circle-square tests use the transfer map; the intertwiner test evaluates the chamber integral; and the Jordan test uses the polynomial variable's actual action. These tests are specifications with admitted proofs. The models leave their genuine representation/quotient integration obligations visible. No additional tests or nodes were needed.

## Corrections made in this review

1. **AS.6/yu-053: root Haar/contour conversion.** Yu Lemma 4.2.5, printed p.26, converts probability Haar to normalized dz/z in each root coordinate. A formula using dz must carry the matching coordinate product. Corrected the statement and proof outline; the generic measure-preserving probability identity remains valid. This is a packet normalization error, not a new alleged error in Yu.
2. **AS.6/invariant-recursion: expressible hypotheses.** An arbitrary J, lower transform and lower distribution do not produce an invariant functional. Added the conjugation-defect cancellation hypothesis. Character support now uses factorization through the actual `characterLift`; the zero-transform test constructs this lift instead of assuming the support conclusion. The rank-one test distinguishes the global coefficient 1/2 from the local coefficient 1. Sources: Arthur 2005 §23, (23.3), p.146, and (23.10), p.153.
3. **AS.6/general-euler-poincare: scalar realization.** A trace map with zero image cannot realize a nonzero Euler characteristic. The suggested scalar adapter now uses an actual linear equivalence with the scalar trace space. Its compact and rank-one cases use the dimensions of actual relative cochain cohomology. Vanishing in the absence of discrete series requires the Euler-cancellation input. Constructing the real compactly supported function and establishing the representation-theoretic trace theorem remain supplier/source obligations, rather than consequences of this model. Source: Clozel–Delorme 1990 §5, Theorem 3, pp.213–215.
4. **AS.6/automorphic-kernel: inverse-closed indexing.** The adjoint kernel relation needs a reindexing of the rational sum by inversion. Added an indexing equivalence and its compatibility with the rational group element, both to the API and its swapped-variable test. An arbitrary rational-index family is insufficient. Source: Arthur 2005 §2, pp.7–8.
5. **AS.2/dit-165: source prose.** Replaced a verbatim locator passage by an authored description of the differential identity, integration by parts and endpoint estimates, with Appendix A, p.984. The mathematical statement and sign conventions are unchanged.
6. **AS.6/fine-spectral-expansion: locator.** Arthur 2005 (21.5) is on printed p.130, not p.129. Corrected this locator and the matching E14 comparison. The determinant space remains a_M^L; the later displayed a_M^G is the independently checked misprint. The Hecke hypothesis and separate height-total/integral convergence assertions remain intact.
7. **AS.1/gz-69: level residue input.** Fixed the actual prime-level adapter to the named ER.7 meromorphic congruence-pair series and Mathlib's Riemann zeta. Its continuation and initial pair-sum identification are pending source obligations. An arbitrary E or arbitrary normalizer cannot have the claimed residue. The level-one and unrestricted-pair comparison retain the exact 2ζ factor. Source: Gross–Zagier II §2, (2.14), p.239.
8. **AS.2/automorphic-green: actual Laplacian.** The finite-part derivative test uses a concrete UHP coordinate adapter with GZ's sign: y²∂x²+∂t²−∂t along y↦y exp(t), equal to y²(∂x²+∂y²). At level one it gives −12 after subtracting the constant pole. The QM.3 identification remains an adapter obligation; the test no longer quantifies over an arbitrary map called lap. Sources: Gross–Zagier II §2, pp.238–239.
9. **AS.0/gz-66: shared point-pair operator.** Applied the same concrete GZ Laplacian to the point-pair eigen-equation. Its sign is opposite to DIT's positive spectral Laplacian. No arbitrary differential operator remains in this API.
10. **AS.1/gz-70: fixed arithmetic inputs and closure.** The suggested level identity now uses Mathlib `ArithmeticFunction.moebius`, actual Riemann zeta, the named ER.7 continuation, and positive UHP dilation. Added the direct gz-69 dependency and the confirmed Möbius baseline input. The source formula is Gross–Zagier II §2, (2.16), p.240; its Fricke specialization is on p.241.
11. **AS.2/dit-91: actual kernel condition.** Made the hermitian relation explicit as R_s(z,z′)=conj(R_conj(s)(z′,z)). The universally quantified arbitrary-kernel signature is removed and its API name remains an explicit commented omission until the actual modular resolvent kernel is available. This follows PROTOCOL §13. The three actual scalar resolvent tests remain, including inverse failure at the spectrum and the quadratic threshold pole. Source: DIT16 §8, pp.973–975.
12. **AS.3/arthur-truncation: summation domain.** Added pointwise finite coset support to suggested linearity. Compact-uniform `local_finite` is a named omission until reduction theory supplies the genuine cosets and a regular truncation parameter. Arbitrary `TruncationData` do not imply that bound. Cusp-fixed, rank-zero and one-cusp strip tests remain valid. Sources: Arthur 2005 §§12–13, pp.64–71.
13. **AS.1/convergent-intertwiner: omission naming.** Made both general omitted API names explicit in the suggested comment, including `holomorphic_chamber`. This is documentation correspondence, not a new mathematical correction.

Each mathematical correction is synchronized with the reader and suggested file. The current source-routing explanation for the BPCZ continuations no longer calls the repaired signatures blockers. Historical review conclusions remain identifiable as history.

## Baseline and ownership

All 31 input citations were independently confirmed by reading their actual declarations and enclosing hypotheses at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No existing citation was removed or replaced. The repaired gz-70 adapter adds the 32nd baseline declaration, `ArithmeticFunction.moebius`, read at the same Mathlib pin in `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean`, lines 44–52. It is not planned as new mathematics.

The following distinctions were specifically rechecked: the finite-dimensional eigenbasis versus the compact symmetric Hilbert eigenbasis; nonzero compact eigenspaces versus parameter Fredholm continuation; fixed compact Fredholm perturbation versus a meromorphic inverse; interior Vitali versus boundary estimates; Haar pushforward with equal total masses; real test-function final topology versus LF strictness/nuclearity; normed Schwartz postcomposition versus general locally convex targets; polynomial-evaluation module action; and the full fundamental-discriminant predicate, which accepts 12 and rejects 16.

The packet and reader list every confirmed declaration with its pinned module link and supplied scope. The library audit's already-existing mathematics is imported, not re-planned. AF.3 supplies cuspidal finite multiplicities; ALS.5 supplies cuspidal cohomology; QM supplies Bessel/Kloosterman/hyperbolic operator theory; ER.7 supplies congruence-class Eisenstein series; and ET.1 supplies ordinary orbital integrals. AS owns the added spectral, weighted, residual and ordinary-cohomology comparisons. Requests for missing classical factors, generic packets, global Bruhat, primary support proofs and geometric cycle inputs remain precise extensions.

## Confirmed red-team findings

- **RT-AREA-automorphic-1/4:** the real invariant/operator Paley–Wiener and multiplier prefix is local, with AF local real-induction inputs. It does not import ET.1 or the global trace formula. Nonarchimedean BDK remains with its separate local-representation owner. AS.2 retains the measure-dependent local μ/normalization theory.
- **RT-AREA-automorphic-1/5:** the convergent Weyl integral precedes initial pseudo-Eisenstein pairing in AS.1; AS.2 supplies continuation; pointwise/truncated packets precede their Hilbert Gram map and AS.4 completeness. Central quotients and rho shifts are retained at every step.
- **RT-AREA-automorphic-1/24:** ET.1 alone owns the ordinary orbital-integral carrier. AS.6 adds v_M, weighted estimates and weighted distributions. The two inputs are not interchangeable. The proposed local prefix extraction remains a restructuring proposal, not an invented integrated atlas stage.

The independent exact-node traversal follows available cross-packet prerequisites and reaches 487 nodes without a cycle. Atlas stages remain explicit supplier boundaries; that graph check does not certify that a pending stage request is already supplied. The reader's order agrees with these boundaries.

## Source versions and source issues

All 30 public source PDFs were retrieved for this review and their SHA-256 values matched the packet's recorded versions. Relevant cited passages and source-issue locators were inspected; page images were used for the Gross–Zagier scan and formula-sensitive DIT/Arthur passages. This is not a claim to have read every page of every reference or collated every published edition. The source-version ledger retains its original dates and edition limits. No private-library source was used and no source file or verbatim passage is added to the repository.

The 37 current issue verdicts name this review job, and every previous verdict is retained in the issue's `reviewHistory`. E3 is rejected: the DIT integration-by-parts passage alone does not justify alleging the claimed error. The other 36 are confirmed within their recorded edition scopes. In particular:

- DIT E1/E2 retain the corrected trigonometric and half-integer Gamma constants; the subsequent identities are not discarded merely because their proof displays contain misprints.
- DIT E5 concerns the opposite-index parity coefficient on printed p.975. The displayed coefficient already includes 2. Corrected the earlier review reason, which incorrectly called that printed factor missing; odd eigenforms require a(−m), equivalently a(−1)a(m).
- Yu E6 concerns using interior zero/pole counts from annular data in Corollary 4.2.6, p.27. A disk-meromorphic extension or winding-number argument is needed. Lemma 4.2.5 on p.26 is the Haar/contour input.
- Yu's reported Lafforgue corrections are confirmed as reports and corrected formulas in the specified v5, dated 18 July 2022. No independent full collation of the older Lafforgue edition is claimed here.
- The Arthur 1980/1982 and Clozel–Delorme 1984 repairs are scoped to the later primary repair passages actually cited. The defective earlier arguments are not claimed freshly collated in this review.
- Yu's Appendix A non-coprime-degree assertions remain explicitly limited by their recorded counterexamples and missing proof work. The coprime main theorem is not invalidated by those overbroad intermediate statements.
- Yetter's Radon–Nikodym map is adjudicated at the specified theorem and its direction convention, rather than silently adopting a reciprocal density.

These are scoped mathematical adjudications, not claims that the mistakes are newly discovered. The source URLs and full hashes remain in the packet; the table below records the matching public receipts for this review.

| Source | Public version | SHA-256 prefix |
| --- | --- | --- |
| yetter | [arXiv:math/0309185v2, 6 September 2004](https://arxiv.org/pdf/math/0309185) | `a3b59a3b059e2d10` |
| teschl | [author PDF of second edition](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe.pdf) | `8dc8de0b58aa0a3f` |
| arthur05 | [Clay Mathematics Proceedings 4 (2005), 1–263](https://www.claymath.org/library/cw/arthur/pdf/62.pdf) | `2b6623010ce5d854` |
| langlands | [IAS electronic transcription, 235 PDF pages, dated 2 December2015 and updated 22 July2016, of LNM544(1976); AppendixIII includes editorial reconstruction notices; not collated against the printed 337-page edition](https://publications.ias.edu/sites/default/files/functional-equations-eisenstein_rpl_8.pdf) | `d0feffaf5f79222a` |
| langlands66 | [Proc. Sympos. Pure Math. 9 (1966), 235–252, IAS transcription](https://publications.ias.edu/sites/default/files/Eisenstein-series-rpl_0.pdf) | `7ee86983d6d18653` |
| arthur78 | [Duke Math. J. 45 (1978), 911–952](https://www.claymath.org/library/cw/arthur/pdf/7.pdf) | `7e60f480e35d9cce` |
| arthur80 | [Compositio Math. 40 (1980), 87–121](https://www.claymath.org/library/cw/arthur/pdf/9.pdf) | `8478531337b3fd59` |
| arthur81 | [Annals of Math. 114 (1981), 1–74](https://www.claymath.org/library/cw/arthur/pdf/10.pdf) | `6bdf32990eb33b6d` |
| arthur82ms | [Duke Math. J. 49 (1982), 35–70](https://www.claymath.org/library/cw/arthur/pdf/12.pdf) | `f0693c409f3cbae9` |
| arthur83pw | [1983 expository article, Arthur archive no.17](https://www.claymath.org/library/cw/arthur/pdf/17.pdf) | `a1eb8329d6937374` |
| arthur83acta | [Acta Math. 150 (1983), 1–89](https://www.claymath.org/library/cw/arthur/pdf/15.pdf) | `a78240ce1095e2a1` |
| arthur88local | [JAMS 1 (1988), 323–383](https://www.claymath.org/library/cw/arthur/pdf/26.pdf) | `902db792ffe11350` |
| arthur88global | [JAMS 1 (1988), 501–554](https://www.claymath.org/library/cw/arthur/pdf/27.pdf) | `42d2193dde29d159` |
| arthur89weighted | [J. Funct. Anal. 84 (1989), 19–84](https://www.claymath.org/library/cw/arthur/pdf/28.pdf) | `0ba6be4e9e8020d1` |
| arthur89lefschetz | [Invent. Math. 97 (1989), 257–290](https://www.claymath.org/library/cw/arthur/pdf/32.pdf) | `5c8655176c90fa08` |
| clozeldelorme90 | [Ann. ENS 23 (1990), 193–228](https://www.numdam.org/article/ASENS_1990_4_23_2_193_0.pdf) | `dd70f4069fdeec6f` |
| franke | [Ann. ENS 31 (1998), 181–279](https://www.numdam.org/item/10.1016/s0012-9593(98)80015-3.pdf) | `3c0465f6413bf156` |
| wallach | [Monogr. Stud. Math. 18 (1984), 227–237, author scan](https://mathweb.ucsd.edu/~nwallach/tempered-cuspidal.pdf) | `07bd2feb5939f4fa` |
| yu23 | [arXiv:1807.04659v5, 18 July 2022 (journal route labelled 2023)](https://arxiv.org/pdf/1807.04659v5) | `9383bcdee14777ec` |
| jiangzhang20 | [arXiv:1508.03205v4 author preprint; route points to Annals of Mathematics191(2020),905–985; journal text not collated](https://arxiv.org/pdf/1508.03205v4) | `d97bf3048aa10de5` |
| dit16 | [Annals of Math. 184 (2016), 949–990](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf) | `a67de7157f76ee70` |
| dit11 | [Annals of Math. 173 (2011), 947–981](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n2-p08-p.pdf) | `8f2b8ed3518fe69f` |
| cg20 | [arXiv:1907.08691v1, July2019; source of the Duke2020 route](https://arxiv.org/pdf/1907.08691) | `39aa93a83c77ce93` |
| cgh20 | [arXiv:1907.08694v1, July2019](https://arxiv.org/pdf/1907.08694) | `8389edfec6576b92` |
| bcg25 | [author WeightZero PDF; route labelled 2025](https://math.uchicago.edu/~fcale/papers/WeightZero.pdf) | `4d27afabbef371ba` |
| bpcz22 | [Publ. Math. IHES 135 (2022), 183–337](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00129-1.pdf) | `a07a6143d3e71f1e` |
| ct20 | [Publ. Math. IHES 131 (2020), 261–323](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf) | `ea90fb0faabeaaa5` |
| bcgp21 | [Publ. Math. IHES 134 (2021), 153–501](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf) | `b4cc8b016615bcaf` |
| gz86 | [Invent. Math. 84 (1986), 225–320](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf) | `a9a52cb8662e03f1` |
| shapiro25 | [Fall 2025; last typeset 10 December 2025](https://web.math.princeton.edu/~js129/PDFs/teaching/MAT520_fall_2025/MAT520_Lecture_Notes.pdf) | `56aefb385eefd760` |

## Validation and remaining work

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicSpectralTheory.json`: zero errors and zero warnings.
- Independent correspondence/closure check: 190 unique node ids; every reader statement and API/test name present; all 219 suggested test markers match exactly; all API names represented by declarations or explicit supplier omissions; 487 reachable exact nodes, no cycle.
- `lean-check research/blueprint/suggested/AutomorphicSpectralTheory.lean`: exit zero against the shared pinned Mathlib build; only `declaration uses sorry` warnings. The final subsequent edit to Lean is a comment naming an existing omission. No library build, update, cache fetch or language server was run. Tau Ceti baseline declarations were checked at their source pin; the suggested scaffold imports individual Mathlib modules and does not require unavailable Tau Ceti compiled artifacts. Elaboration checks syntax/types, not admitted mathematics.
- All implementations remain unchecked, all seven stages planned, and all 52 gaps and 22 requests retained. No atlas promotion, supplier packet edit, roadmap merge or label change is performed by this review.

Questions for the orchestrator concern follow-up scope, not unresolved acceptance contradictions: integrate the proposed acyclic real Paley–Wiener prefix under the accepted ownership rules; route the primary Hejhal, Franke–Schwermer, analytic Fredholm and rank-one local-factor proof work to the existing gaps/requests; and preserve Yu's exact v5 and coprime-degree limitations in future assembly. The next worker should use the current review ledger, not the superseded blocker wording in historical reviews.
