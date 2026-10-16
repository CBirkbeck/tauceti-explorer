# Independent review: Effective Diophantine methods, revision 4

**Verdict: accepted after in-place corrections.** Finished review of #10052 (`REV-EffectiveDiophantineMethods~4`) by Codex, session `codex-UcCUX1`, on 16 October 2026. This session contributed to none of the four blueprint rounds. All **178 nodes** were checked: **161 verified, 17 corrected, none unverifiable**. The packet contains one individual verdict per node; the register below reproduces those judgments.

This accepts a complete target-level plan. All seven stages remain `planned`, all implementation statuses remain `unchecked`, and the 27 recorded gaps and 32 supplier requests remain visible. Acceptance does not claim a formal proof or a replay of every numerical application. The previous review explicitly identified recovery of nine primary-source passages as its acceptance obstacle; this review independently recovers and checks all nine. Its seven earlier mathematical correction requests remain addressed.

## Scope and counts

The audit covered each node's statement, hypotheses, proof route, direct prerequisites, API, tests, source locators and exact omission contracts; the reviewed library audit, RS-03 ownership, stage descriptions/links and supplier statements; all 197 pinned baseline declarations with relevant section variables and instances; the entire suggested file; and planet selection. The reader's target/API/test/omission content was compared with the packet. Source inspection is limited to the target-bearing passages listed below, not entire books or entire bodies of cited work.

| Stage | Nodes | API | Tests | Planets | Verified | Corrected |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| ED.0 | 11 | 78 | 48 | 4 | 10 | 1 |
| ED.1 | 11 | 51 | 30 | 6 | 10 | 1 |
| ED.2 | 33 | 127 | 101 | 6 | 31 | 2 |
| ED.3 | 29 | 56 | 39 | 6 | 27 | 2 |
| ED.4 | 26 | 82 | 58 | 6 | 23 | 3 |
| ED.5 | 29 | 50 | 32 | 6 | 29 | 0 |
| ED.6 | 39 | 63 | 38 | 6 | 31 | 8 |
| Total | 178 | 507 | 346 | 40 | 161 | 17 |

There are 25 definitions, 33 constructions, 102 theorems, 16 applications and two lemmas. Definitions and constructions account for the validator's narrower counts of 480 API entries and 337 tests; the complete inventories are 507 and 346. Every definition/construction has at least three counter-discriminating tests. There are 216 exact omission records (147 streamlined records plus 69 specialized contracts), eight restructuring records and 43 inherited source findings. Node IDs and baseline references are preserved. The review adds two height-search boundary tests, refines four existing weighted-chain API entries, and adds no nodes or planets.

## Corrections made in this review

1. **Exact complex isolation.** `ED.0/exact-algebraic-certificate` originally allowed intervals/discs while the embedding consumer required a rectangular box of the same type. Added rational complex boxes consistently to the structure, existence argument, API and omission contract. Finite root separation and rational density prove existence; this adds no root-finding algorithm or competing real-algebraic implementation.
2. **Empty height-search minimum.** `ED.3/height-lower-bound-by-search` took an inner minimum over non-torsion points that can be empty. The minimum is now over the nonempty union containing `B/2−c⁻`. If no searched point is non-torsion, that singleton supplies the value. The positivity hypothesis remains essential: a negative certified endpoint must prevent applying a positive lower-bound theorem. Added both tests. The finite point search now solves the general Weierstrass quadratic in y and includes infinity, rather than imposing a short-Weierstrass square test. The coordinate helpers are explicitly separate supporting interfaces.
3. **Weighted reduction API.** The `.final`, `.sound`, `.nil` and `.append` entries had identical aggregate descriptions. They now state their distinct projection, preservation, identity-chain and appended-step contracts. The empty-dimensional weighted height is zero, and the exceptional union is carried through every step. This is consistent with the triangular enumeration checked in Fincke–Pohst § 2, pp.464–466.
4. **Symmetric-square regression.** The rational-point comparison in `ED.4/symmetric-square-chabauty-datum` now requires `P₀≠P`. Otherwise the two displayed divisors coincide. For distinct points they are different, and the unique degree-two fibre through P prevents both from being pullbacks. This matches Box Remark 2.3, arXiv v3 p.5.
5. **Withdrawing stale numerical producers.** The Selmer proof now takes a complete irreducible factorization as input rather than invoking an ED.0 factorization producer. Specialized Thue contracts distinguish supplied ideal/class/unit tables from ED.0 isolation and ED.2 logarithm mathematics. The `x³−x` regression takes actual complete local tables and matrix transcripts and derives its dimensions by checking them, without assuming those dimensions. Disc base-change tables and QC/ramified integral tables are explicit inputs with geometric identifications and error bounds. RD.7 supplies the rigid/de Rham comparison, rather than instance-specific coefficient tables. Stale coverage wording asking for regeneration was reconciled.
6. **QC verification and conditional statements.** `ED.6/qc-modular-algorithm` now checks supplied basis, cup, Hecke/Frobenius, cycle, splitting, height-pairing and local root data. It does not target their numerical production. Its output is a finite precision candidate-ball cover; matching/exclusion is still required for a rational-point equality. A failed check gives no emptiness theorem. The classical certificate proof also distinguishes finite payload checks from geometric identifications and infinite-tail hypotheses. Removed “unconditionally” from the roadmap's level13 rank statement and made the downstream small-prime/Cartan statements carry their transitive hypotheses. The published theorem is not disputed; this plan still has the recorded rank-over-Q supplier obligation.
7. **Boundary and locator precision.** The one-dimensional raw rational distance/margin tests no longer appear to instantiate the dimension-at-least-two real reduction theorem. The new p-adic logarithm node's de Weger series locator is corrected to § 2.3 pp.28–29; pp.26–27 instead contain auxiliary real inequalities and the section opening.
8. **Suggested imports.** Replaced the umbrella Mathlib import by the individual modules actually needed, including `Mathlib.NumberTheory.Height.NumberField` for the rational height instance. The actual 289-line deliverable elaborated at the pins with only expected proof-placeholder warnings. No data definition has a proof placeholder as its body.

These corrections are synchronized in the packet, reader and node/top-level omission records. The heavy geometric and certificate carriers remain README targets, in accordance with the streamlined suggested-file rule.

## Nine previously unresolved primary checks

| Source and precise passage | Independent finding |
| --- | --- |
| Fincke–Pohst1985 § 2 pp.464–466, (2.6)–(2.8), discussion after(2.12) | Square completion gives the recursive closed integer intervals and both directions of enumeration completeness. Boundary equality is retained. The homogeneous sign/zero shortcut must not be copied into an affine-centre enumeration. This verifies both ED.1 enumeration nodes and the enumeration component of ED.2's reduction chain. |
| Matveev2000 English § 2 p.1219, (2.1),(2.4), Corollary 2.3 and replacement(2.6) | Checked the nonzero chosen logarithms, absolute heights, `A_j≥0.16`, the two κ-dependent constants, degree factors and replacement by the maximum coefficient. The packet's rational majorant dominates both real and complex constants. Matveev supplies a lower bound, not a numerical log evaluator; ED.2's explicit finite-series error proof supplies that evaluation. This verifies the log-enclosure provenance, constant, lower-bound and substituted Thue-initial-bound nodes. |
| Silverman1990 Theorem 1.1/Remark1.2 p.725, § 3 pp.729–730, proof § 6 p.738, abstract/§7 pp.723,739–740 | Checked archimedean multiplicities, the field-degree denominator and the absolute half-height convention, including the constants 0.973 and 1.07. Both pinned relative heights must be divided by `[K:Q]`. Cremona's rational full-height constants require a different halving conversion. Doubling and the two-sided comparison give the stated interval width. This verifies the explicit comparison and canonical-height enclosure nodes. |

All three recovered PDFs match the packet's SHA-256 exactly. Matveev was recovered through MathNet's mobile endpoint; the AMS originals through archived publisher PDF endpoints. Each exact URL, hash and independent read scope is recorded in `sources[].reviewAccess` and dated `sourceVersions`. No substitute exposition is used to certify these locators.

## Ownership, closure and baseline

The active graph has no ComputationalNumberTheory prerequisite or supplier request. Minimal exact algebraic isolation, valuations and scalar precision stay in ED.0; explicit archimedean and p-adic logarithm error bounds stay in ED.2. The S-unit and Thue–Mahler bounds and enumeration soundness remain conclusions proved from these analytic bounds and checked finite data. A complete solution list is never an input oracle.

The p-adic log argument uses `v_p(k)≤(k−1)/(p−1)` to give a uniform tail at depth strictly greater than `e/(p−1)`. Powering reaches that depth or exact torsion; division by the chosen power loses `e·v_p(M)` uniformizer digits. Input precision then propagates through finite expressions using ED.0. Its pivot-normalization budget is explicit. This is additional finite-error mathematics, not a second local logarithm theory.

The 197 baseline declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` (157 declarations) and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` (40). Particular checks include the actual Selmer/μ carriers and local conditions, canonical half-height and pairing, Hensel distance hypotheses, unit-group rank, quotient and finite-index statements, characteristic-polynomial scope, geometric series and finite matrix/linear-algebra conventions. The generator characteristic-polynomial theorem is not promoted to an arbitrary-element result; the tower/basis bridge remains a named obligation. Likewise scalar quotient helpers do not provide actual Jacobians, analytic discs or numerical tables.

There are 81 distinct foreign prerequisite references: 57 fine node IDs and 24 broader supplier/stage references, with 32 precise requests covering the broader needs. Fine statements and their hypotheses were checked for the relevant implication; stage-level requests remain requests. The library and target graph are acyclic at this packet's boundary. Existing supplier proof gaps remain explicit, particularly the modular rank-over-Q assembly, prime-ideal/completion adapters, actual Jacobian/Kummer geometry, Hodge pole bounds and root-cluster perturbation. They are not claimed discharged by accepting the plan.

Current read-only TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were also inspected for duplication. RealAlgebraicGeometry owns real root isolation/Sturm–Thom infrastructure. NumberFieldArithmetic already owns canonical completions and explicit unit criteria; its rank-one/prime-degree conditions are not replaced by generic ED numerics. Current `TauCeti.NumberTheory.LocalField.Logarithm` already proves principal-unit HasSum and deep-unit valuation results. ED.2 imports that theory and adds finite-sum error budgets. Current code was not substituted for missing pinned declarations, and no read-only checkout was built or edited.

All stage targets are realized at target granularity. The 40 planets are mathematical definitions, central constructions or named results, at most six per stage. No additional producer roadmap or ownership move is proposed. The eight existing restructuring records remain proposals, not applied changes to supplier roadmaps.

## Source access and findings

The following records describe the bounded primary-source inspection supporting this audit. They are locators, not summaries of the sources. Twenty-nine used source records were independently recovered with matching hashes. Prickett remains unread, unused historical provenance; the five necessary index/saturation routes use the inspected Siksek1995 author copy. No private-library material was needed or copied.

| Exact source record | Independently inspected scope |
| --- | --- |
| [de-weger-1989](https://ir.cwi.nl/pub/13190/13190D.pdf) | Selected § 2.3 pp.28–29, § 2.5 pp.33–34; Chapter 3 pp.43–44,51–55,58–59,64–69; Chapter 6 pp.115–120,122–125; TableII p.130 and Lemma 7.3 p.138. Rendered the ambiguous enumeration, congruence and table passages. |
| [tzanakis-de-weger-1989](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf) | Target-bearing root/unit/form constants and reduction statements and arguments pp.102–119, and worked norm quartics and reduction pp.121–126; generator-label and transformed-constant findings checked. |
| [tzanakis-de-weger-1992](https://numdam.org/item/CM_1992__84_3_223_0.pdf) | Selected removing/case/bound passages pp.223,225–228,230–234,237–241,247,249,258,260–265,267–271,275–277,283–284,286; rendered pp.240–241,265 and compared the 1993 corrigendum. |
| [fincke-pohst-1985](https://web.archive.org/web/20230000000000id_/https://www.ams.org/journals/mcom/1985-44-170/S0025-5718-1985-0777278-8/S0025-5718-1985-0777278-8.pdf) | Published § 2 pp.464–466, especially (2.6)–(2.8) and the discussion after(2.12); rendered Algorithm(2.8) p.465. The affine-centre extension is checked by square completion, not attributed as a literal source statement. |
| [doyle-krumm-2015](https://arxiv.org/pdf/1111.4963v4) | arXiv v4 pp.1–2,9–11,15: finite-height search and candidate/error conventions. |
| [matveev-linear-forms-2000](https://m.mathnet.ru/php/getFT.phtml?jrnid=im&option_lang=eng&paperid=314&what=fullteng) | English published pp.1217–1219; rendered p.1219 for (2.1),(2.4), Corollary 2.3 and its replacement bound(2.6). |
| [yu-p-adic-logarithms-1994](https://numdam.org/item/CM_1994__91_3_241_0.pdf) | Published pp.241–242: full constant/admissibility and ideal-valuation conventions; rendered p.242. |
| [silverman-1990](https://web.archive.org/web/20230000000000id_/https://www.ams.org/journals/mcom/1990-55-192/S0025-5718-1990-1035944-5/S0025-5718-1990-1035944-5.pdf) | Abstract p.723, Theorem 1.1/Remark1.2 p.725 (rendered), § 3 pp.729–730, proof § 6 p.738, § 7 pp.739–740; absolute half-height and local multiplicity conventions checked. |
| [aitken-lemmermeyer-2011](https://arxiv.org/pdf/1108.6310v1) | arXiv v1 pp.11–12,16–17: descent example and AppendixB coefficient. |
| [siksek-2010](https://arxiv.org/pdf/1010.2603v2) | arXiv v2 pp.5,8–11: pairing kernels, local-ball matrix and certified rank criterion. Publisher p.770 remains historical, not independently read. |
| [poonen-errata](https://math.mit.edu/~poonen/papers/errata.pdf) | Relevant Poonen/FPS entries on PDF pp.1–2 of the dated seven-page errata list; no whole-list read asserted. |
| [mccallum-poonen-2012](https://math.mit.edu/~poonen/papers/chabauty.pdf) | Author pp.3–15: formal logarithm, good-reduction setup, all cited local/global criteria and example passages. |
| [box-2021](https://arxiv.org/pdf/1906.05206v3) | arXiv v3 pp.3–7: absolute/relative symmetric-square criteria and sieve; Remark 2.3 requires distinct rational points. |
| [caraiani-newton-2023](https://arxiv.org/pdf/2301.10509v3) | arXiv v3 § 7.4 pp.98–101: degree-two relative criterion, sieve and source acceptance examples. |
| [poonen-1998](https://arxiv.org/pdf/math/9512217v1) | arXiv v1 pp.14–17: Jacobian/rank and point computation, infinity reduction and t=3n point labels; unread Math.Z. publication outside the audit. |
| [stoll-2019](https://arxiv.org/pdf/1307.1773v4) | arXiv v4 pp.6–7,11–13: abelian pairing, disc/model arguments and cited tiny-integral convention. |
| [krzb-2016](https://arxiv.org/pdf/1504.00694v2) | arXiv v2 pp.19–25: cited bad-reduction/model zero-bound route, including Proposition 3.16. |
| [bbk-2010](https://arxiv.org/pdf/1004.4936v2) | arXiv v2 pp.3–4: logarithm series and integration convention; series sign checked. |
| [bruin-stoll-2010](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/29EFF630FD2859F8C79DFD48E1A33926/S1461157009000187a.pdf/the-mordell-weil-sieve-proving-non-existence-of-rational-points-on-curves.pdf) | Selected published pp.273–274,277–284,286–287,290–298,301: quotient/lifting invariants, height/Kummer inequalities, bad/deep data and experiment scope. Historical author code is not executed or independently re-audited. |
| [bdmtv-2019](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf) | Published pp.888,891,893 and pp.909–934: target-bearing connection, gauge, Hodge, Frobenius, local-height and level13 application passages; matrices/point/chart constants checked. |
| [bdmtv-2021](https://arxiv.org/pdf/2101.01862v4) | arXiv v4 pp.13–15,17–19,22–32: modular workflow, gauges, full valuation/root precision and all nine genus-three lists, compared where relevant with the publication. |
| [tzanakis-de-weger-1993-correction](https://numdam.org/item/CM_1993__89_2_241_0.pdf) | Both published pages241–242: main factor correction, changed example bounds/counts and all three minor corrections. |
| [siksek-symmetric-2009](https://msp.org/ant/2009/3-2/ant-v3-n2-p03-s.pdf) | Published pp.215–218,223,225: absolute criterion and repeated-support valuation lemma, relative statement and its impossible index-zero strict inequality. |
| [bdmtv-2023-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/C317E63BB0128EB3F2163621CA63E66E/S0010437X23007170a.pdf/quadratic_chabauty_for_modular_curves_algorithms_and_examples.pdf) | Published pp.1127,1129,1133–1136: gauge sign/primitive, valuation constants and Lemma 4.7 tail condition. No whole-publication read asserted. |
| [cremona-1997](https://johncremona.github.io/book/fulltext/chapter3.pdf) | Author online ChapterIII printed pp.68–86,91,95–96: torsion, local solubility, rank and height conventions; p.91 identifies the571A1 phenomenon. |
| [flynn-poonen-schaefer-1997](https://arxiv.org/pdf/math/9508211v1) | arXiv v1 pp.6–7,9–12,14–16,18–19,22–23: descent/group and 3-adic examples and all inherited source-finding locators; no Duke publication read asserted. |
| [stoll-2008](https://arxiv.org/pdf/0803.2836v2) | arXiv v2 pp.7–13: subgroup, conditional rank and p=5 Chabauty computation. |
| [siksek-1995](https://samirsiksek.github.io/siksek.github.io/papers/infart2.pdf) | Exact 25-page author preprint pp.1–3,14–18: height/index/group/saturation routes and both p.18 findings. No published-version reading asserted. |
| [cremona-ecdata-571a1](https://raw.githubusercontent.com/JohnCremona/ecdata/master/allcurves/allcurves.00000-09999) | Only the571a1 row in the public allcurves.00000-09999 data file. The row identifies the curve; it is not used as a Selmer/rank proof. |

All **E1–E43** inherited findings were checked at their locators and retain individual `confirmed` reasons under this review's job ID. Their original classifications, correction searches and known corrections are preserved; no finding is called newly discovered here. The original statements in inherited evidence fields are not expanded or newly transcribed.

Version scope matters: the FPS/Poonen findings are verified on the named arXiv copies, Siksek1995 on the exact author preprint, and E22 on Siksek arXiv v2 p.5 rather than the unread publisher p.770. Historical claims about other copies or author implementations are not renewed by this review. E29/E32–E34 were compared with the complete 1993 published corrigendum. E15/E16/E21 were compared in the 2021 preprint and 2023 publication; E30 is already corrected in that publication. The review updates source/version metadata accordingly rather than treating preprint and publication as interchangeable.

## Validation and exact arithmetic scope

- `python3 scripts/check_blueprint.py research/blueprint/packets/EffectiveDiophantineMethods.json`: zero errors; one explained baseline-index warning. `Finset.mem_filter` is the correct pinned declaration; the index incorrectly nests it as `Finset.Finset.mem_filter`. No false name change is made to silence the warning.
- `source_issues.check_issues` and `check_errata.versions_checked` on the actual packet: zero errors. The standalone errata command requires an errata-shaped wrapper, so its validation functions were applied directly to this blueprint packet.
- Independent packet/reader consistency checks: stable IDs, unique complete review coverage, exact node/top-level omission agreement, every API/test/signature represented in the reader, at least three tests per definition/construction, at most six planets per stage, no active withdrawn owner and preserved implementation statuses.
- `lean-check research/blueprint/suggested/EffectiveDiophantineMethods.lean`: success on the existing shared pinned build; only expected proof-placeholder warnings. The companion is 289 lines and has real bodies for its light definitions. This is signature elaboration, not proof completion.
- Exact integer evaluation verifies all 68 listed `X₀⁺(N)` memberships and projective distinctness, all seven `X_s(13)` memberships, all four `X_S4(13)` memberships, 22 signed elliptic integral points, the displayed Thue examples and the Thue–Mahler endpoint. Enumerating projective `F₁₇` gives 20 quartic points and 17 first-chart discs.
- An independent exact S-smooth search with `z≤3,000,000` gives 545 normalized coprime triples, largest `z=1771561`, with 514 in the stated small exponent box and 31 exceptions. The corrected `(6561,22000,28561)` row appears. This establishes only that bounded consistency check; it supplies no global upper bound and is not a replay of the logarithmic reduction proof.
- The four-term `log₃(4)` sum is exactly `−51/4`; representative ramified/unramified term-valuation checks agree with the stated tail inequality. These finite arithmetic checks support the independently checked general proof, and are not substituted for it. Empty and negative-endpoint height-minimum cases were also checked.
- `git diff --check` passes. Only issue deliverables and this review's handoff are changed.

## Individual node register

“Verified” means the stated target/proof plan and explicit hypotheses are sound at this level. It does not mean that an omitted interface or a proof placeholder has been implemented. “Corrected” identifies a target contract, proof, API, test or locator changed in place by this review; specialized omission-only repairs are additionally described above.

| Node | Verdict | Independent check |
| --- | --- | --- |
| `ED.0/certified-enclosure` | verified | Outward endpoint containment, zero-width intervals and refinement preserve the selected mathematical value; overlap is not an equality test. |
| `ED.0/exact-algebraic-certificate` | corrected | Added rectangular complex boxes to the exact isolation interface used by the embedding consumer; separability and rational density give arbitrarily small witnesses. |
| `ED.0/isolating-interval-refinement` | verified | Unique-root intervals may degenerate at rational roots; nested refinement preserves the root and gives the stated width without a root-finding algorithm. |
| `ED.0/archimedean-embedding-certificate` | verified | PowerBasis.lift identifies the selected embedding; symmetric imaginary bounds and unique containment force reality; the evaluation error tends to zero. |
| `ED.0/hensel-root-distance` | verified | The pinned strict Hensel hypothesis gives the root distance used by the valuation conversion; a weak derivative inequality is insufficient. |
| `ED.0/padic-embedding-certificate` | verified | The certified simple root supplies a Q_p embedding; extensions at nonsplit primes remain an explicit completion-adapter obligation. |
| `ED.0/certified-nonvanishing` | verified | A ball excluding zero proves nonvanishing; exact algebraic equality and eventual precision are kept separate from effective size bounds. |
| `ED.0/valuation-certificate` | verified | Precision strictly above a nonzero residue valuation determines the exact valuation; zero requires its own branch. |
| `ED.0/padic-precision-propagation` | verified | Sum, product and inverse budgets follow from the ultrametric inequality; the inverse loses twice the centre valuation and normalized division loses the pivot valuation. |
| `ED.0/height-enclosure` | verified | The leading coefficient of the primitive characteristic polynomial supplies the finite-place height contribution; the arbitrary-element tower identity is explicitly still required. |
| `ED.0/bounded-height-enumeration` | verified | The denominator and discriminant lattice give a finite coefficient box; uncertain height-boundary candidates are retained within the stated tolerance. |
| `ED.1/linear-form-lattice` | verified | The last row encodes the scaled real linear form with controlled rational rounding; row and column orientation is consistent. |
| `ED.1/reduced-basis-distance-lower-bound` | verified | The largest nonintegral translated coordinate gives a positive distance term; exact lattice membership and zero-target branches remain separate. |
| `ED.1/homogeneous-reduction` | verified | The strict short-vector threshold makes the logarithm denominator positive; exceptional zero representations cannot be discarded. |
| `ED.1/inhomogeneous-reduction` | verified | The affine target has the sign required by subtraction; the translated distance bound retains exact exceptional representations. |
| `ED.1/padic-linear-form-lattice` | verified | Canonical residue precision and the unit pivot give the required p-adic congruence; weights and the final modulus column are explicit. |
| `ED.1/padic-reduction` | verified | A strict distance inequality excludes all eligible vectors in the coordinate box, with the homogeneous zero vector removed. |
| `ED.1/short-vector-enumeration` | verified | Fincke–Pohst pp464–466 gives triangular square completion and closed integer intervals; the affine extension retains both signs and zero when appropriate. |
| `ED.1/short-vector-enumeration-complete` | verified | Backward recursion includes every vector satisfying the weak quadratic bound; the source's homogeneous symmetry shortcut is not used for affine centres. |
| `ED.1/short-vector-reduction` | verified | Exhaustive residual enumeration retains signed exceptional vectors, rather than relying on the invalid partial-quotient shortcut. |
| `ED.1/exclusion-certificate` | corrected | Clarified that one-dimensional raw distance/margin tests support a checker; the real reduction theorem itself still requires dimension at least two. |
| `ED.1/exclusion-certificate-sound` | verified | Finite arithmetic checks and independently identified forms imply exclusion; no universal solution-preservation assertion is accepted as raw input. |
| `ED.2/logarithm-enclosure` | verified | Selected complex branches, rational log/argument intervals and explicit series tails suffice; Matveev p1219 specifies the admissible logarithms rather than an evaluator. |
| `ED.2/certified-linear-form-constant` | verified | Matveev Corollary 2.3 p1219 has the stated real/complex constants; the rational maximum majorizes both, including degree and height factors. |
| `ED.2/certified-linear-form-lower-bound` | verified | The nonzero chosen logarithms, nonzero linear form and coefficient maximum retain every hypothesis of Matveev's corollary; zero terms are removed first. |
| `ED.2/certified-padic-linear-form-constant` | verified | Yu pp241–242 supplies the constant; degree/residue-degree majorization and lower/upper rounding directions are safe. |
| `ED.2/certified-padic-lower-bound` | verified | The multiplicative expression is nontrivial and every local normalization is explicit; converting ideal valuation to v_p only weakens the bound. |
| `ED.2/padic-logarithm-enclosure` | corrected | The principal-unit tail grows linearly at the stated strict depth, powering handles shallow units, and division loses ord(M); corrected its de Weger page locator. |
| `ED.2/padic-discrete-logarithm-certificate` | verified | Odd-prime residue orders and the 2-adic parity branch are distinct; the logarithm kernel is not identified with an arbitrary cyclic generator. |
| `ED.2/exponent-reduction-chain` | corrected | Replaced four duplicate weighted-chain API descriptions by final, sound, nil and append contracts, including zero-dimensional height and retained exceptions. |
| `ED.2/thue-equation` | verified | Irreducible degree at least three and nonzero right side exclude Pell and reducible infinite families; nonprimitive integer pairs are included. |
| `ED.2/thue-factor-covering` | verified | Complete divisor representatives and a full-rank unit family cover every solution; an empty covering proves emptiness before any extrema are taken. |
| `ED.2/thue-analytic-constants` | verified | Representative extrema require a nonempty covering; root separation and correctly oriented unit matrices give the stated constants. |
| `ED.2/thue-root-approximation` | verified | The no-real-root case and large-denominator nearest-real-root case are separate; complex conjugate distances are retained. |
| `ED.2/thue-linear-form` | verified | The root-of-unity factor and selected argument ensure a nonzero logarithmic form; the corrected arcsine estimate admits the stated safe rounding. |
| `ED.2/thue-exponent-bound` | verified | The invertible logarithmic minor controls all exponents, with the distinguished embedding omitted in the source's orientation. |
| `ED.2/thue-initial-bound` | verified | The substituted Matveev bound applies after zero-log deletion and degree majorization; TdW's scalar logarithmic inequality then gives the finite initial bound. |
| `ED.2/thue-reduced-bound` | verified | The transformed exponent scale includes its field-degree factor; exceptional vectors and the numerical hypotheses of the scalar bound are retained. |
| `ED.2/thue-convergent-search` | verified | The rational root approximation has the required uniform error; scanning every bounded convergent avoids assuming its next partial quotient is exact. |
| `ED.2/thue-small-solutions` | verified | Cauchy bounds and exact polynomial evaluation enumerate a finite signed box, including denominator zero. |
| `ED.2/thue-certificate` | verified | The raw contract distinguishes no real roots, an empty complete covering and a nonempty covering; semantic validity is a separate supporting notion. |
| `ED.2/thue-certified-solution-set` | verified | The finite residual and exceptional checks imply equality with the true solution set; no complete-answer oracle replaces those checks. |
| `ED.2/thue-mahler-equation` | verified | Primitive coordinates, nonnegative prime exponents and the nonzero normalized right side agree with the Thue–Mahler equation used in the source. |
| `ED.2/prime-ideal-removing-lemma` | verified | The full ramified removing bound includes within-factor and pairwise valuations; the surviving unramified uniqueness helper is deliberately narrower. |
| `ED.2/thue-mahler-s-unit-covering` | verified | Complete ideal/class/unit inputs give all five covering cases, including fixed valuations and zero free exponents; they are not generated by an assumed CN supplier. |
| `ED.2/thue-mahler-initial-bounds` | verified | The source's 1993 correction and explicit nonzero-form/degree hypotheses support the initial bound; complete finite arithmetic inputs remain parameters. |
| `ED.2/thue-mahler-reduced-bounds` | verified | Real and p-adic reductions preserve componentwise boxes and exceptions under the checked strict distance hypotheses. |
| `ED.2/auxiliary-prime-sieve` | verified | All possible root residues are retained by the auxiliary-prime test, which is only a necessary condition until final exact evaluation. |
| `ED.2/thue-mahler-certificate` | verified | Every finite case, sign and exponent row has an outcome, including rejected rows; the raw checker has no semantic completeness field. |
| `ED.2/thue-mahler-certified-solution-set` | verified | The accepted residual and exceptional rows give the actual normalized solution set; completeness is the theorem to prove from raw checks. |
| `ED.2/s-unit-equation` | verified | Signs and permutations reduce rational S-unit solutions to positive coprime triples with ordered summands; the empty-prime case is explicit. |
| `ED.2/s-unit-initial-bounds` | verified | The Yu/logarithm route bounds every exponent of the normalized triple without assuming a finite list is exhaustive. |
| `ED.2/s-unit-padic-reduction` | verified | The source's affine sign and normalized valuation are used; odd-prime and p=2 logarithm-kernel cases are separated. |
| `ED.2/s-unit-certificate` | verified | The final finite signed exponent domain is exhaustive and every row receives exact support/gcd/equation checks. |
| `ED.2/s-unit-certified-solution-set` | verified | Normalization and complete bounded search give exact set equality; swapping the two summands in the source table preserves its count. |
| `ED.3/local-quotient-cardinality` | verified | Formal logarithms give the finite-place factor and real components give the archimedean factor; general geometric suppliers remain requested. |
| `ED.3/local-descent-image` | verified | The actual descent map and complete local squareclass image are required; sampled image elements alone cannot establish completeness. |
| `ED.3/local-image-completeness` | verified | An injective local image contained in the target and matching its exact cardinality must equal it; the cardinality is supplied by the geometric quotient theorem. |
| `ED.3/good-place-local-image` | verified | Good odd reduction gives unramified local conditions; bad primes and p=2 require the separate complete local analysis. |
| `ED.3/two-selmer-certificate` | corrected | Replaced the nonexistent ED.0 polynomial-factorization producer by a supplied complete irreducible factorization; finite local/global identifications still determine the true Selmer subgroup. |
| `ED.3/two-selmer-certificate-sound` | verified | The pinned Selmer/μ definitions support the equality once norm, finite local images and the real condition are all identified. |
| `ED.3/rank-upper-bound` | verified | The rank upper bound subtracts rational 2-torsion from the actual Selmer dimension; a norm kernel alone is insufficient. |
| `ED.3/quartic-local-solubility` | verified | The projective quartic test includes the reciprocal chart and exceptional branches; complete local lifting is a mathematical obligation. |
| `ED.3/quartic-local-solubility-correct` | verified | Cremona's local-solubility criteria require the stated model and termination branches; finite scalar helpers do not replace the full checker. |
| `ED.3/two-isogeny-descent-map` | verified | The descent map treats infinity and the rational point (0,0) separately and uses the correct dual 2-isogeny. |
| `ED.3/two-isogeny-rank-bound` | verified | The product of the two complete image sizes gives the rank bound with factor four; rational generators do not prove image completeness. |
| `ED.3/explicit-height-difference-bound` | verified | Silverman p725 and pp729–730,738 give the weighted absolute half-height bound; pinned relative heights require division by the field degree, while Cremona's rational constants require halving. |
| `ED.3/canonical-height-enclosure` | verified | Exact doubling and a two-sided height comparison give shrinking canonical-height intervals; the width and torsion-zero branches use the pinned half-height convention. |
| `ED.3/regulator-lower-bound` | verified | A positive lower bound for the true height Gram determinant proves independence modulo torsion and the claimed rank lower bound. |
| `ED.3/height-lower-bound-by-search` | corrected | Corrected the minimum to include B/2−c⁻ even when the search has no non-torsion points; general Weierstrass y-solubility and two new boundary tests are explicit. |
| `ED.3/index-bound` | verified | The regulator/index comparison uses positive rank, the square-root index and one consistent canonical-height convention; sharp Hermite constants remain requested. |
| `ED.3/p-saturated` | verified | The quotient is p-torsion-free exactly when pP in the subgroup forces P into it; this property is distinct from a finite point search. |
| `ED.3/saturation-certificate` | verified | Jointly injective reductions on the relevant quotient certify saturation; Siksek's group-theoretic routes do not depend on the unused Prickett citation. |
| `ED.3/reduction-rank-lower-bound` | verified | The torsion quotient and finite-generation hypothesis justify a rank lower bound; a single reduction image is not a free-rank certificate. |
| `ED.3/torsion-by-reduction` | verified | Odd good-reduction primes inject the full torsion subgroup; the p=2 counterexample prevents extending that shortcut without qualification. |
| `ED.3/finite-index-subgroup-certificate` | verified | Full-rank independent generators plus complete torsion give finite index; a certified integer killing the quotient is an explicit output. |
| `ED.3/mordell-weil-basis-certificate` | verified | The rank alternatives include the direct two-isogeny prerequisite; rank zero and positive-dimensional index bounds have separate branches. |
| `ED.3/genus-two-descent-rank-bound` | verified | The genus-two x−T route retains divisor, norm and real-place conditions, with the genuine Jacobian supplied by its owner. |
| `ED.3/lind-reichardt-torsor` | verified | The Lind–Reichardt torsor uses the corrected coefficient and the actual isogeny/torsor identification. |
| `ED.3/fermigier-rank-thirteen` | verified | Both descent-image cardinality bounds and thirteen independent points are needed; reported rational points on homogeneous spaces are explicit inputs. |
| `ED.3/rank-zero-curves` | verified | The 571a1 ecdata row identifies the model; Cremona p91 supplies context for rank zero and nontrivial Sha[2], and neither is inferred from the database row alone. |
| `ED.3/fps-genus-two-mordell-weil` | verified | The FPS rank-two subgroup, torsion checks and saturation use the source's odd primes and separately certified height data. |
| `ED.3/poonen-genus-two-mordell-weil` | verified | Poonen's divisor classes give the stated subgroup; the missing corrected local descent remains explicit rather than inferred from the point list. |
| `ED.3/stoll-genus-four-subgroup` | verified | The known genus-four subgroup and its independence are separate from the source's conditional rank claim; every dependent conclusion retains its label. |
| `ED.4/good-reduction-chabauty-datum` | verified | The good-reduction datum contains a genuine smooth proper model and all residue discs, including infinity; the corrected McCallum–Poonen locator is retained. |
| `ED.4/abelian-logarithm` | verified | The geometric formal logarithm extends through finite index and has torsion kernel; the generic supporting homomorphism does not supply Jacobian geometry. |
| `ED.4/abelian-integral` | verified | The actual regular-differential pairing is additive and kills torsion; arbitrary paired vector spaces are only supporting algebra. |
| `ED.4/tiny-integral-expansion` | verified | Local primitives divide coefficients by n+1; convergence, the true chart and division precision are retained before evaluation. |
| `ED.4/kernel-of-reduction-evaluation` | verified | A kernel-of-reduction divisor is evaluated by trace-compatible tiny integrals on compatible lifts; repeated points and extension fields are allowed. |
| `ED.4/coleman-abelian-comparison` | verified | The abelian/Coleman comparison is for the stated regular differentials and normalization; it is not asserted for arbitrary meromorphic forms. |
| `ED.4/disc-integration-constant` | verified | Multiplication into the formal subgroup determines the disc constant without a rational point on every disc, with its division precision loss retained. |
| `ED.4/padic-closure-dimension` | verified | Finite-index logarithmic closure has dimension at most rational rank after removing torsion; no missing full-rank assumption is silently supplied. |
| `ED.4/annihilating-differentials` | verified | The annihilator is against the actual Mordell–Weil logarithmic span and has the expected linear-algebra dimension. |
| `ED.4/annihilator-precision` | verified | Certified minors and error budgets control rank and nullspaces; matching approximate nullspaces do not prove exact annihilation. |
| `ED.4/residue-disc-zero-bound` | verified | Reduction orders bound zeros with the required p-dependent corrections and exceptional discs; multiplicities are counted. |
| `ED.4/chabauty-finiteness` | verified | A proper logarithmic span gives a nonzero annihilating differential and finitely many zeros on each of finitely many discs. |
| `ED.4/coleman-bound` | verified | Good reduction, p>2g and rank<genus give the full projective Coleman bound, including infinity discs. |
| `ED.4/bad-reduction-bound` | verified | The bad-reduction bound uses the smooth locus of a minimal regular model and the source's prime/genus hypotheses. |
| `ED.4/hyperelliptic-residue-discs` | verified | Finite and infinite hyperelliptic charts include branch points and reject repeated roots; an infinity sentinel alone is not an analytic disc. |
| `ED.4/residue-disc-verdict` | corrected | Raw coefficient, tail and exhaustive ball-tree checks determine every zero and its matching/exclusion; changed-base tables are supplied with explicit compatibility identities. |
| `ED.4/chabauty-coleman-certificate` | corrected | Finite payloads do not identify geometric objects or prove infinite-tail bounds by themselves; made those soundness hypotheses explicit and kept the C05 numerical inputs supplied. |
| `ED.4/chabauty-coleman-completeness` | verified | Local bounds matched by distinct known rational points on every disc imply the exact global rational-point set. |
| `ED.4/number-field-chabauty-criterion` | verified | Siksek's dg-row matrix and certified local-unit-ball hypotheses prove uniqueness in one ball; global coverage is a separate step. |
| `ED.4/symmetric-square-chabauty-datum` | corrected | Added P₀≠P to the rational-pair regression so 2P and P+P₀ are distinct; only one degree-two fibre can contain P. |
| `ED.4/symmetric-chabauty` | verified | Repeated support uses higher jets; the corrected strict higher-term inequality starts at positive index and cannot hold at index zero. |
| `ED.4/relative-symmetric-chabauty` | verified | Anti-invariant differentials and the degree-two pullback condition give a residue-class conclusion under the stated genus, prime and reduction hypotheses. |
| `ED.4/fps-quintic-cycle-curve` | verified | FPS's four residue discs and 3-adic series use the corrected dominant-coefficient valuation; complete raw series/error data remain explicit inputs. |
| `ED.4/poonen-type-three-two-curve` | verified | The six affine points and two infinity points use the corrected common reduction and t=3n labels; rank-dependent completeness is conditional. |
| `ED.4/stoll-six-cycle-curve` | verified | The p=5 genus-four application retains its conditional rank input and complete disc data; known-point membership does not remove that condition. |
| `ED.4/strassmann-bound` | verified | The restricted nonzero series uses its last maximal coefficient for a multiplicity-aware Strassmann bound; the zero series is excluded. |
| `ED.5/admissible-classes` | verified | Admissible classes are exactly the finite intersection of local inverse images in the chosen quotient; every test factors through that quotient. |
| `ED.5/global-soundness` | verified | A compatible global element survives every local restriction by the commuting quotient maps. |
| `ED.5/empty-sieve-obstruction` | verified | Emptiness of admissible classes excludes a compatible global element without requiring the global map to be injective. |
| `ED.5/quotient-refinement` | verified | The finer subgroup quotient maps to the coarser quotient and sends each surviving fine class to a surviving coarse one. |
| `ED.5/coset-lift` | verified | A correct section and every finite kernel class supply all coarse lifts; representative choices do not change the filtered result. |
| `ED.5/lift-correctness` | verified | Complete kernel enumeration and the section identity prove both inclusions in the refined-class equality. |
| `ED.5/relevant-tests` | verified | Only changed local tests need reevaluation when unchanged tests factor through the coarse quotient. |
| `ED.5/subgroup-covers-quotient` | verified | Coprimality of subgroup index and finite quotient exponent proves surjectivity; the two integers cannot be interchanged. |
| `ED.5/certified-map-obstruction` | verified | A commuting reduction square sends every candidate point into the compatible sieve group, so an empty sieve obstructs points. |
| `ED.5/known-points-completeness` | verified | Known-point completeness additionally requires a unique point in each surviving fibre; group emptiness and fibre uniqueness are distinct conclusions. |
| `ED.5/jacobian-reduction-data` | verified | Genuine Jacobian/divisor reduction compatibility is required; arbitrary finite group maps are supporting data only. |
| `ED.5/curve-sieve-soundness` | verified | Every rational point survives the curve sieve through its Abel–Jacobi class, without needing Abel–Jacobi injectivity for this soundness direction. |
| `ED.5/padic-quotient-sieve-datum` | verified | Good, bad and deep quotients carry explicit factorization and point-image data; their full p-adic groups remain imported objects. |
| `ED.5/coprime-index-transfer` | verified | A coprime finite index permits using the known subgroup in the selected finite quotient without losing unknown global images. |
| `ED.5/sieve-chain` | verified | Successive subgroup refinement preserves the target subgroup in each kernel preimage, correcting the literal PrepareLift kernel notation. |
| `ED.5/sieve-chain-correct` | verified | Induction identifies every intermediate survivor set with the corresponding exact admissible classes. |
| `ED.5/subgroup-from-membership-test` | verified | The membership predicates define a finite-index kernel; a certified basis requires the genuine finite quotient, rather than accepted samples. |
| `ED.5/height-coset-separation` | verified | The strict height inequality and an integer killing torsion give at most one bounded-height point per coset; free-coordinate equality alone does not. |
| `ED.5/height-bounded-points` | verified | Finite surviving cosets and certified unique small-height representatives give all bounded-height points, using positive-definite height control. |
| `ED.5/kummer-curve-test` | verified | The corrected quadratic evaluation, factor-three triangle inequality and separating-prime product are all needed for the Kummer lifting argument. |
| `ED.5/siksek-lattice-step` | verified | The lattice refinement tests actual Kummer reductions and preserves every unknown rational point represented by the known subgroup. |
| `ED.5/integral-points-completeness` | verified | A certified upper bound on integral points combines with sieve lower bounds outside the known set; effective constants remain explicit hypotheses. |
| `ED.5/chabauty-sieve-combination` | verified | Chabauty gives uniqueness on surviving good fibres, while the sieve removes the remaining bad fibres, including infinity. |
| `ED.5/relative-symmetric-sieve` | verified | Box and Caraiani–Newton use commuting maps and multiplication by I without injectivity; their examples are not claimed replayed in ED.6. |
| `ED.5/genus-two-bad-information` | verified | Bad-prime regular-model and Kummer data impose necessary local restrictions with the required smooth reduction maps. |
| `ED.5/genus-two-deep-information` | verified | Deep congruence information factors through the chosen quotient at sufficient precision; the finite numerical data are explicitly supplied. |
| `ED.5/sieve-certificate` | verified | Raw finite quotient chains, lifts and local outcomes are checked independently of semantic global compatibility. |
| `ED.5/sieve-certificate-sound` | verified | The commuting obstruction and chain soundness imply emptiness or known-fibre completeness with each arithmetic identification stated. |
| `ED.5/small-genus-two-nonexistence` | verified | The source's 1492 cases split into 1447 sieve cases and 45 other cases; raw per-curve inputs and BSD labels are required, with no ED.6 replay claim. |
| `ED.6/certified-solution-set` | verified | The actual raw certificate conclusion is separate from a semantic summary with an assumed completeness field; conditional labels remain attached. |
| `ED.6/padic-candidate-comparison` | verified | Every local candidate must be matched to a known global point or excluded; a local candidate is not presumed rational. |
| `ED.6/qc-disc-certificate` | verified | The actual QC series, complete root counts with multiplicity and every chart are required; finite coefficient helpers have deliberately narrower meanings. |
| `ED.6/qc-certificate-sound` | corrected | The finite QC checks plus actual geometric/rank/height identifications imply completeness; the theorem retains all supplied-data hypotheses. |
| `ED.6/explicit-setup` | verified | The setup identifies the affine curve, differential basis, cup pairing and nice correspondence; a Frobenius-weight matrix alone does not produce a cycle. |
| `ED.6/explicit-connection` | verified | The universal connection supplies geometric existence of η; solving residue linear equations only supports its explicit coordinates. |
| `ED.6/gauge-transformation` | verified | The negative primitive convention and gauge differential agree with the connection; the incompatible preprint primitive is not imported. |
| `ED.6/hodge-filtration-explicit` | verified | Infinity Laurent conditions and the actual filtered bundle define Hodge data; a truncated vector solution alone is not the geometric filtration. |
| `ED.6/hodge-filtration-algorithm` | verified | Finite pole/product bounds and enough Laurent coefficients justify the exact linear system; the largest individual pole order does not bound primitive products. |
| `ED.6/transport-matrices` | verified | Transport matrices use the correct block order and endpoint signs from the horizontal differential equation. |
| `ED.6/frobenius-structure-matrix` | corrected | Frobenius/coefficient tables are explicit inputs; RD.7 supplies the comparison, and G=Φ⁻¹ with GS=S·diag(1,F,p) gives the matrix identification. |
| `ED.6/frobenius-equivariant-splitting` | verified | The fixed-point splitting uses invertibility of 1−F and the actual Teichmüller point, then transports with the stated endpoint matrices. |
| `ED.6/local-height-at-p` | verified | The local height uses compatible Frobenius and Hodge splittings and an End(J)-equivariant complement, as in the cited Lemma 5.5. |
| `ED.6/base-point-change` | verified | Both endpoint transports contribute to base-point change; a matrix identity alone does not identify the Nekovář height. |
| `ED.6/height-series-valuation-bound` | verified | The full coefficient bound includes c₁,c₂,c₃,i₀ and valuation infinity; the duplicate preprint c₁ is removed as in the publication. |
| `ED.6/root-determination-precision` | verified | Every tail index satisfies the truncation inequality; Weierstrass matching counts multiplicity over C_p rather than treating residue solutions as roots. |
| `ED.6/qc-modular-algorithm` | corrected | Replaced numerical-data production steps by explicit input tables and finite checks; candidate residue balls cover the QC locus, and failure supplies no emptiness theorem. |
| `ED.6/xs13-plane-model` | verified | Exact quartic membership and projective F17 enumeration agree with 20 points and 17 first-chart discs; geometric smoothness and modular identification remain separate inputs. |
| `ED.6/xs13-endomorphism-algebra` | verified | The real cubic multiplication and Picard number concern the genuine modular Jacobian, not an arbitrary matrix algebra. |
| `ED.6/xs13-analytic-rank-certificate` | verified | Certified derivative intervals above 0.6 plus exact functional-equation vanishing give order one; the intervals themselves are supplied inputs. |
| `ED.6/xs13-rank-three` | corrected | Removed unconditional wording: modular rank and Sha conclusions require the explicit analytic and rank-one supplier hypotheses; the known assembly gap remains recorded. |
| `ED.6/xs13-tate-classes` | verified | Hecke correspondences identify the two actual Tate classes; antisymmetry, lower-right zero block and cup contraction then have exact matrix checks. |
| `ED.6/xs13-first-chart-hodge-data` | verified | The differential basis and infinity conditions identify the Hodge vectors; supplied coefficients still require their actual geometric identities. |
| `ED.6/xs13-first-chart-frobenius` | verified | The actual lift, Frobenius primitives and precision hypotheses identify θ with the local height; arbitrary symbolic series do not suffice. |
| `ED.6/xs13-equivariant-height-matrices` | corrected | The inert cubic field makes the nonzero logarithm generate; supplied coefficient relations and a certified nonzero determinant justify the equivariant basis. |
| `ED.6/xs13-first-chart-points` | verified | Raw first-chart root/exclusion data at sufficient precision prove the four-point common-zero set; generating those tables is outside this roadmap. |
| `ED.6/xs13-second-chart-points` | verified | The second chart has its own supplied series/error and root data; compatibility on overlaps and the two missing infinity discs are checked. |
| `ED.6/xs13-p0-disc` | verified | The exceptional P₀ disc uses identified ramified-extension integrals with explicit error bounds and both Tate classes before uniqueness is concluded. |
| `ED.6/xs13-rational-points` | verified | The seven-point equality follows from the seventeen first-chart discs, two second-chart discs and P₀, conditional on all explicit data and geometric inputs. |
| `ED.6/small-prime-split-cartan` | corrected | Made the geometric supplier conditions explicit in the small-prime existence statement; rational genus-zero parameters give infinitely many nonintegral, hence non-CM, j-values. |
| `ED.6/split-cartan-classification` | corrected | Made the transitive input conjunction explicit; the level13 argument and Bilu–Parent–Rebolledo supplier give the negative classification half. |
| `ED.6/nonsplit-cartan-13` | corrected | Made the transitive input conjunction explicit; Baran's curve isomorphism transports cardinality, while a separate CM/moduli argument identifies the seven points. |
| `ED.6/class-number-one` | verified | The class-number-one consequence retains its arithmetic/moduli hypotheses; the quartic point count alone cannot imply the conclusion. |
| `ED.6/xs4-13-rational-points` | verified | The four listed projective points satisfy the XS4 model; completeness follows from the supplied isogeny, rank and p=11 raw disc data. |
| `ED.6/x0plus-genus-three-points` | verified | All nine model/point lists agree with the source; exact evaluation checks all 68 memberships, with completeness conditional on each level's raw inputs. |
| `ED.6/thue-example-tdw89` | verified | The two norm quartics and 2+8 signed solutions match TdW's corrected generator labels; full finite search depends on explicit arithmetic data. |
| `ED.6/elliptic-integral-points-tdw89` | verified | All 22 listed integral points satisfy the elliptic equation; the quartic bridge supplies completeness only under the stated bound/search inputs. |
| `ED.6/s-unit-example-deweger` | verified | A bounded exact S-smooth search reproduces 545 triples and 31 exceptions; the global count still uses the stated initial/reduced bounds and complete certificates. |
| `ED.6/thue-mahler-example-tdw92` | verified | The corrected 1993 constants and 72-count arithmetic agree with the source route; exact endpoint tests do not replace the full covering/reduction/search checks. |
