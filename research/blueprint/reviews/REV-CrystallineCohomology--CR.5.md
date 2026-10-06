# Independent review: CrystallineCohomology CR.5–CR.7

Verdict: **needs_changes**. This is a completed independent review of BP-CrystallineCohomology--CR.5, issue #380, by Codex session `codex-2i5wDr`, dated 2026-10-06. The original author was Codex session `codex-UMbWmQ`.

The mathematical packet generally preserves the source-qualified scope, including the required integral quasi-coherent branch. Acceptance is blocked by false universal propositions in the suggested Lean file and by named APIs/tests that do not express the objects they promise. A comment describing an omitted geometric condition does not constrain the Lean quantifiers. Honest supplier requests, source gaps and unimplemented proofs are allowed; their existence alone is not the reason for this verdict.

## Inventory and method

All 88 nodes, 165 API statements and 165 tests were checked against their cited passages and suggested signatures. The packet contains 22 definitions, 33 constructions, 27 theorems and 6 comparisons. All 55 definitions/constructions have three tests numerically. The combined per-node verdicts are **13 verified, 6 corrected, 69 unverifiable**. “Unverifiable” identifies a remaining signature, API, test or proof-interface defect, even where the mathematical source statement was verified. Full individual reasons are in `review.checked` in the packet.

All 25 baseline declarations were read at the exact pins. All 18 source PDFs were acquired and their SHA-256 values independently reproduced. The relevant passages of every cited source were read, including OCR of Kato's scan; the PD-envelope and final Künneth pages and BO Theorem 7.8 were also checked visually. Every outside prerequisite was traced to its supplier node or stage. The two upstream roadmap models read in full were AdicSpaces and HodgeStructures. The accepted RS-01, integrated CR.4 decomposition, reviewed library audit, confirmed RT-AREA-padic-2/14 and its independent verification were read.

No nodes were added or removed. Clear corrections changed 34 existing nodes, source metadata, baseline metadata, supplier requests, gaps, coverage remaining lists and the suggested Lean file. There are now four explicit gaps and nine requests. The 19 planets are distributed 6/5/5/3 across log-algebra/CR.5/CR.6/CR.7; their names are source objects or named results and satisfy the limit. Target-level granularity is retained without splitting proofs into lemma nodes.

`status: complete` and four `coverage: planned` entries are retained in the protocol's sense of a finished target-level planning pass. Each stage's targets have nodes; chains terminate at baseline, local nodes, supplier requests or explicit gaps. The added revision instructions are in each stage's `remaining` list. No stage is closed, no implementation is claimed and this review does not promote the packet.

## Clear corrections made

1. **Integral characteristic is only a consequence.** The API `IsIntegralMonoid.characteristic_iff` was false and became `IsIntegralMonoid.characteristic`, in both packet and Lean. [Kato §2.4(3)](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf) gives the forward implication. For a counterexample, take a field with a nontrivial unit group and the monoid consisting of its units together with positive powers of x, with every unit acting trivially on those powers. Send units to themselves and positive powers to zero. This is a log structure with characteristic ℕ, but cancellation fails because ux=x with u≠1.
2. **Groupification quotient.** The named `characteristicMonoid.gp_quotient` had been a kernel test rather than the promised equivalence. It now has the actual equivalence between the characteristic groupification and the log groupification modulo the image of ring units. That image qualifier matters for nonintegral logs: units need not embed after groupification. The helper `logUnits` uses the existing log unit condition.
3. **PD assumptions.** Kato's general right adjoint may change the source. The fixed-source envelope is now explicitly under the ambient PD-extension assumption in §5.5.2. Beilinson's source and ambient are explicitly log S♯-schemes, so the base PD structure extends to both. Compatible thickenings require a common PD extension on J+IO_T; IO_T⊆J is not assumed. The crystalline-site source also has the required base PD extension. These mathematical corrections still need their actual Lean supplier data. [Beilinson §§1.2–1.3](https://arxiv.org/pdf/1111.3316v4)
4. **Products and ownership.** Removed the CP.2 product request: CR.3 already owns ordinary crystalline cup products/Künneth, and CR.6 adapts their PD resolution/descent to the logarithmic theorem on Kato p.222. The fine, smooth integral, qc/qs and flat coefficient conditions are retained. E1 supplies enhanced tensor machinery. CP.2's rational crystalline comparison does not own a second generic product theory.
5. **Dependency cycle.** Removed `hk-tate-curve → R06.5`. The supplier's actual stage requires CR.6, giving CR.6→R06.5→CR.6. The geometric Tate valuation/residue calculation remains a local CR.6 source gap, with R06.5 consuming its result. Ordinary filtered (φ,N) coefficient conventions now import R06.2, whose statement owns them, rather than downstream geometric applications.
6. **Exact period prefix.** The tilt/Teichmüller requests and prerequisites now name AI.0:integral. Common A_cris remains CR.0-owned under RS-01. The existing formal/dagger suppliers and RD Part II extension remain separate.
7. **Derived inverse limits.** DD.1's `derived-completion` node is a completion localization, not a generic limit of arbitrary towers. Added an explicit DD.1 request and gap for the coherent derived countable inverse-limit functor, projections and Milnor comparison. No arbitrary quotient tower is identified with derived completion without the regularity/weak-proregularity hypotheses.
8. **Complete analytic coefficients.** The geometric Stein/tower coefficient field is now K̆₀=widehat(K₀^nr), the source's Q̆_p, rather than the uncompleted unramified field. This matters for Fréchet/ind-Fréchet topology and completed scalar extension. [Colmez–Dospinescu–Nizioł §0.3, p.7](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf)

## Sources and locators

The source register preserves all acquired URLs and hashes. Corrections are to blueprint citations, not new errors alleged in the papers:

| Source | Correction |
|---|---|
| Binda–Kato–Vezzani | Title is *On the p-adic weight-monodromy conjecture for complete intersections in toric varieties*. The acquired arXiv:2207.00369v2 hash was already correct. |
| Thompson | Saturation uses §1.2, Definition 1.6, p.7; the former Koshikawa opening/Kato integrality references did not give this definition. |
| Temkin | Steps 9–10 on p.123 belong to the proof of Theorem 4.2.1, before §4.3 and Theorem 4.3.1. |
| Česnavičius–Koshikawa | §§5.9–5.13 are pp.36–38 in the exact v3 acquired. Footnote 11 remains correctly on p.45. |
| Hyodo–Kato | §3.1 is p.242; §3.2 p.243; §§4.19–4.20 pp.260–262; Theorem 5.1 pp.262–263, §§5.2–5.4 pp.263–265, §5.5 pp.265–266. |
| Qian | Theorem 1.6 is PDF p.4; Theorem 3.2/proof PDF pp.14–18, rather than pp.18–23. |
| Disegni–Liu | Definition B.1/Remark B.2 PDF p.113; Lemma B.3 p.114; triangles (B.1)–(B.2) pp.115–116; rational Witt comparison is **equation (B.5)** p.117; residue quotient/(B.7)–(B.9) p.118. Actual Lemma B.5 is a different support/cohomological dimension statement on p.121. |

### Source issues

All four entries now carry an independent `review` verdict **confirmed**:

- **E7051:** Original BO Appendix B2.1 and both pages of the official erratum agree with the recorded replacement correction. Preserve the bounded-above/projective hypotheses; a derived isomorphism does not give a levelwise surjective map onto an arbitrary original tower. [Official erratum](https://math.berkeley.edu/~ogus/preprints/BO_B2_Erratumre.pdf)
- **E7052:** In Qian v1, the displayed Theorem 3.2 setup omits properness, while pp.17–18 use proper base change/finiteness. The packet's proper hypothesis is retained. The [author's publication list](https://web.stanford.edu/~lqian/) and [arXiv record](https://arxiv.org/abs/2103.00106) identify this as a separate preprint. The [2023 potential-automorphy article](https://par.nsf.gov/servlets/purl/10388233) cites it as reference 14; it is not a corrected version of this theorem.
- **E7053:** BKV Remark 2.4(1)'s printed difference condition is tautological with p=0 and q′=q. The sum condition giving inverses modulo the base image is correct, and 0→ℕ detects the error. [Exact v2](https://arxiv.org/pdf/2207.00369v2)
- **E7054:** Kato p.222 visually announces the final Künneth theorem as 6.11 but heads it 6.12. The mathematical formula is unchanged. No new paper source issue was discovered; the wrong DL lemma citation is the blueprint's error.

## Blocking Lean and test findings

The suggested file elaborates, but its `sorry` propositions include these counterexamples. These are not requests to prove theorems during a blueprint job: the statements themselves need correction.

| Signature | Remaining defect and discriminating instance |
|---|---|
| `logSmooth_chart_criterion` | Arbitrary category, tests and arrow unrelated to the chart; missing group cokernel and toric smoothness. Choosing the identity chart does not make every arbitrary arrow satisfy every lifting test. |
| `QCLogSmooth` | Fine monoids and pushout data are present, but a fine log-smooth model is absent. Every fine map passes `fine_compatibility`, including a characteristic-p root chart with obstructing torsion. |
| `logCartier_iso` | Arbitrary q,Hq modules, no Cartier-type differential complexes; zero and a nonzero field module cannot be isomorphic. |
| `logCrystallineSite.trivial_log` | Any functor is asserted to be an equivalence, including a functor from an empty category to a nonempty one. |
| `logCrystal_connection_equivalence` | Any categories C,D are asserted equivalent; again empty versus nonempty contradicts this. |
| `logPoincare`, embedding/HK/Witt/convergent comparisons | Arbitrary derived objects are asserted isomorphic; zero versus a field in degree zero contradicts this. |
| `IsPDSmooth.coordinate` | Any arbitrary arrow is labelled a coordinate envelope and asserted PD smooth for arbitrary tests; the actual construction must restrict it. |
| `pAdicLogCrystalline` / `integralHK` | Rlim is an arbitrary function. A constant zero function fails the point test; a constant nonzero function fails the zero-coefficient test. |
| `hkMonodromy.boundary` / `embedding_independence` | Any boundary map or linear equivalence is asserted compatible with N. The nonzero Tate matrix against the zero boundary gives a counterexample. |
| `hk_finite_frobenius_isogeny` | Any HKModule is declared finite with bijective φ, though its type allows an infinite module or φ=N=0. |
| `hkComparisonMap.pullback`, uniformizer change | Unrelated arbitrary maps/functions are declared natural or obey the exponential law. With N=0 the latter forces an arbitrary ρ to be constant under unit change. |
| `stein_hyodoKato_comparison` | Arbitrary Hausdorff topological modules are asserted continuously equivalent, including zero/nonzero ones. Actual complete Fréchet geometry and completed scalar extension are needed. |
| `messing_filtration_interface` | Arbitrary maps i,q are asserted exact; i=0 on a nonzero field module is not injective. |
| `gaussManin.boundary`, integrability and horizontality | Arbitrary additive maps are identified as the connection boundary; arbitrary d₁ is called its extended differential; arbitrary module equivalences are declared horizontal. They must be the actual filtered de Rham/geometric base-change maps. |

Other required repairs are recorded per node. In particular, strictness is defined using pulled-back log structures, not arbitrary chart bijectivity; `IsCartierType` must use the actual relative Frobenius, not an unrelated qF; `LogCrystal` needs module sheaf descent as well as cartesian presheaf transitions; PD compatibility needs the common base data.

The count of three tests is insufficient when tests avoid the object. `logPDEnvelope.log_diagonal` checks only δ₁(x)=x; `LogConnection.nonintegrable` checks a nonzero exterior product without computing a connection's curvature; the HK good-reduction test is only exp(0)=1; the Tate test is a matrix calculation without geometric identification; Dieudonné tests only check F(1)=1 and pF(1)=p, without D(G), V or dual twists. `gaussManin.constant_family` and `identity` repeat the same arbitrary rank-one connection statement. Revision must bind these tests to their named constructions and retain the intended nonexamples.

The opening Lean note now explicitly records the rejected signatures. The two clear algebraic signatures were corrected in place; the extensive geometric rewrite remains for a revision worker, without inserting arbitrary Prop-valued condition fields.

## Baseline verification

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No citation was removed or replaced. Two declaration-form labels were corrected from `def` to `abbrev`: groupification and exterior algebra. Module presheaves and divided power algebra were already correctly labelled `abbrev`. Every `checked` entry now records this independent verification. Their exact hypotheses provide primitives, not the missing geometric theorems.

| Declarations read | Confirmed provision and limit |
|---|---|
| `Scheme.smallEtaleTopology` | Ordinary scheme small étale topology; does not itself construct the log PD site. |
| `Algebra.GrothendieckGroup`, `.lift`, `.of_injective` | Commutative-monoid groupification and universal maps; canonical map is injective under cancellation. |
| `DividedPowers` | Operations on an ideal in a commutative semiring, with identities; compatible base maps/envelopes still belong to CR.0. |
| `ExteriorAlgebra`, `.ι_sq_zero` | Exterior algebra and alternating generator square, including characteristic two. |
| `WittVector`, `.frobenius`, `.frobeniusEquiv`, `.teichmuller` | p-typical carrier; prime/CharP formula hypotheses and PerfectRing for Frobenius equivalence; Teichmüller is multiplicative, not a ring map. |
| `TauCeti.nilpotentExpUnit`, `IsNilpotent.exp` | Finite nilpotent exponential in a rational algebra, with nilpotence required for the unit result; no analytic infinite exponential is imported. |
| `KaehlerDifferential`, `.D` | Ordinary differential module and universal derivation for a commutative algebra, extended by the log relations. |
| `ModuleCat`, `GrothendieckTopology` | Module and site foundations; no automatic crystalline sheaf or analytic topology. |
| `DerivedCategory` | Ordinary unbounded derived category under HasDerivedCategory; enhanced tensor and coherent limits remain E1/DD.1 inputs. |
| `PresheafOfModulesOfCommRing`, `ModuleCat.extendScalars` | Ring-presheaf modules and tensor scalar extension; sheaf/cartesian conditions must still be supplied. |
| `HasLiftingProperty` | Actual categorical squares and lifts, once the geometric arrow/test types are supplied. |
| `Ind`, `Ind.lim` | Generic ind-category and filtered coherent diagram construction; no Fréchet category or completed tensor construction. |
| `DividedPowerAlgebra`, `.dp` | Existing quotient algebra and divided-power generators; a canonical augmentation PD structure is not inferred from that carrier. |

The library-coverage file has no CrystallineCohomology entries, so its absence is not treated as a positive absence proof. The integrated decomposition covers ordinary CR.4. Generic groupification, Witt vectors, exterior algebra, module categories and existing PD primitives are reused; ordinary PD envelopes, derived completion, analytic categories, p-divisible groups and Dieudonné classification remain with their single owners.

## Red-team remedy and orchestrator actions

RT-AREA-padic-2/14 is addressed mathematically by the Beilinson §§1.1–1.8 and §1.17 finite-level integral quasi-coherent envelope/site/lift branch, CK §5.2 and footnote 11. It is not collapsed back to fine/noetherian geometry. The packet and reader both contain the explicit proposed CR.5:qc-crystalline successor and AI.6 dependency. Shared A_cris stays with CR.0. The nonfine formal-boundary proof chain remains honestly open. Acceptance of that remedy does not validate the false generic Lean comparisons.

The orchestrator should:

1. Route a completed `needs_changes` review to a revision of BP-CrystallineCohomology--CR.5, preserving its source scope and honest open stages. Rewrite the actual geometric interfaces and their APIs/tests according to `review.checked`.
2. Refresh the reader in that revision. It is outside this review issue's deliverables and was not edited. It still has the false integrality converse (line 307), old title/page/lemma locators, missing explicit PD hypotheses, CP.2 product request, R06.5 cycle and uncompleted analytic coefficient field. Reconcile it with the corrected packet before a future acceptance.
3. Decide/apply the existing CR.5:qc-crystalline and RD Part II proposals through their authorized restructuring process. Supplier requests need the exact interfaces now recorded, particularly the generic Rlim export and R07 crystal evaluations. No atlas or supplier roadmap was edited here.
4. Keep the geometric Tate valuation/residue proof with CR.6 and let R06.5 consume it; do not recreate the removed cycle.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/CrystallineCohomology--CR.5.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/CrystallineCohomology--CR.5.lean`: **exit 0, only declaration-uses-sorry warnings**, at the existing pinned Mathlib build. The file imports only Mathlib; the Tau Ceti exponential source was checked at its pin but its unbuilt module was not imported. Memory availability exceeded 20 GB. No Lake build/update/cache command or Lean language server was used.
- `git diff --check`: clean. Only the issue's packet, suggested file, review report and WORKERS-authorized handoff are changed.

Lean elaboration checks typing. It is explicitly not evidence that any listed sorry proposition is true or that anything is formalised.
