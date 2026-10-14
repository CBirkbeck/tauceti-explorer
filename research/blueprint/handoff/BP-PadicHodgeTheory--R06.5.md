# Handoff: BP-PadicHodgeTheory--R06.5

Refs #969. Codex (GPT-6), session **codex-O96Omm**, 2026-10-14.
This is the finished target-level pass, continuing the Claude Code checkpoints
in #3854, #3856 and #3868. It is ready for independent blueprint review.

## Result and verification

- Scope is exactly `PadicHodgeTheory:R06.5` and `PadicHodgeTheory:R06.6`.
  Packet status is `complete`; both layers have coverage `planned`, with nine
  targets apiece. Neither layer is closed or claimed formalized.
- 18 nodes: 15 theorems, one application, one construction and one definition.
  The construction and definition have 21 API items and 17 discriminating
  tests in total. There are 11 planets: six in R06.5 and five in R06.6.
- Nine baseline declarations were read at Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. Current library evidence is
  separately recorded at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
- Eight sources, eight inherited source-finding identifiers E40–E47,
  13 exact supplier requests, and one source-proof gap are recorded.
- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicHodgeTheory--R06.5.json`
  reports zero errors and zero warnings. The packet dependency graph is acyclic.
  The reader contains every target, API item and definition test from the packet.
- `lean-check research/blueprint/suggested/PadicHodgeTheory--R06.5.lean`
  elaborated successfully at the recorded Mathlib pin, with only intentional
  `sorry` warnings. The file has 148 lines: five light real-bodied definitions,
  eight named end identities and ten examples. Memory exceeded 20 GB available
  before compilation; no language server or library build was started.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/PadicHodgeTheory--R06.5.lean`
  passes, as does `git diff --check`. All nodes remain `unchecked`.

The current WORKERS shape rule governs the older issue's request to encode
all carriers in Lean. Advanced carriers and their complete API/tests are
reader targets. The suggested file uses existing matrix, vector and field
carriers; it constructs no period ring, geometric cohomology group,
continuous cocycle space, Tate lattice or filtered-module category.

## Preserved targets and added coverage

Fourteen sound checkpoint IDs are retained and refined:

| Layer | Retained target suffixes |
|---|---|
| R06.5 | `crystalline-comparison-good-reduction`, `abelian-scheme-dcris`, `abelian-variety-hodge-tate-weights`, `weil-pairing-duality`, `elliptic-curve-ordinary-supersingular` |
| R06.6 | `kummer-representation`, `kummer-representations-semistable`, `tate-curve-tate-module`, `tate-curve-filtered-phi-n-module`, `tate-curve-l-invariant`, `good-reduction-iff-crystalline`, `semistable-reduction-semistable`, `multiplicative-reduction-elliptic-curves`, `local-global-compatibility-good-reduction` |

The four new R06.5 IDs are `proper-smooth-de-rham-comparison`,
`proper-semistable-period-comparison`, `proper-smooth-potential-semistability`
and `geometric-period-functoriality-duality-twists`. They supply the general
inputs the stage promises, without importing automorphic varieties.

Corrections and explicit checks include:

- General abelian Hodge–Tate/de Rham realizations use proper smooth comparison
  without a good-reduction hypothesis, avoiding a cycle in the good criterion.
- Crystalline H¹ realizes the dual of the covariant Tate module; its Frobenius
  polynomial is reciprocal to the covariant period polynomial. Semilinear φ
  is distinguished from its linear f-th iterate over F_(p^f).
- Supersingular elliptic periods have no rank-one φ-submodule over K₀ with
  Q_p coefficients. The proof imports height-two Dieudonné classification;
  scalar φ² over F_(p²) does not provide a φ-submodule. Absolute irreducibility
  is not asserted.
- Rational Kummer splitting kills torsion classes; integral splitting does
  not kill nonzero p-power-root classes. All rational Kummer extensions are
  semistable by spanning with explicit classes and using sums/subquotients;
  arbitrary extension-closure of semistable representations is not asserted.
- Covariant Tate periods have N(y)=v_p(q)x and Fil⁰=K(y+log_K(q)x).
  Their L-invariant is log_K(q)/v_p(q), possibly zero. Dual N is minus
  transpose. Raw HK monodromy is divided by e(K/Q_p) before comparison.
- Arithmetic WD uses F=φ^(-f), giving FNF⁻¹=p^f N. The geometric convention
  uses the inverse relation. Split, unramified quadratic and ramified quadratic
  Tate twists have separate reduction and descent conclusions.
- Good iff crystalline uses an actual stable lattice, R07.4's Barsotti–Tate
  equivalence and compatible finite-flat models. The semistable proof uses
  Raynaud's geometric filtration and de Rham extensions of semistable objects;
  it does not infer crystallinity of those extensions.
- Good-place coefficient-prime compatibility is for actual abelian
  realizations. Projector restrictions require a matching geometric action;
  compatible polynomials alone supply no bad-place comparison.

## Confirmed ownership finding RT-AREA-padic-2/22

The current RS-01 review is `needs_changes`; this run therefore uses the
current structure, as the issue instructs. The independently confirmed /22
finding is applied: modular-curve, Kuga–Sato and Shimura-curve applications
belong to R19.5; higher-rank analogues belong to AG2.6. Their constructions and
integral models do not become prerequisites of this part.

These six checkpoint nodes are removed. Their owner should integrate the
existing applications, using this part's general comparisons:

| Former ID | Owner and mathematical task |
|---|---|
| `PadicHodgeTheory:R06.5/modular-form-de-rham-realisation` | `AutomorphicGaloisRepresentations:R19.5`: rank-two modular summand, Hodge line, weights, dual and determinant realization |
| `PadicHodgeTheory:R06.5/modular-form-crystalline-good-primes` | `AutomorphicGaloisRepresentations:R19.5`: good-level crystallinity, normalized Frobenius polynomial and ordinarity |
| `PadicHodgeTheory:R06.5/weight-two-modular-abelian-varieties` | `AutomorphicGaloisRepresentations:R19.5`: modular abelian realization, lattice and good/semistable prime hypotheses |
| `PadicHodgeTheory:R06.5/modular-form-endpoint-weights` | `AutomorphicGaloisRepresentations:R19.5`: separate k≤p−1, k=p and k=p+1 integral branches, importing R07.4/R08.5 lattices and reductions |
| `PadicHodgeTheory:R06.6/modular-form-local-global-compatibility-at-p` | `AutomorphicGaloisRepresentations:R19.5`: source-qualified modular WD/local-Langlands comparison at the coefficient prime |
| `PadicHodgeTheory:R06.6/hilbert-modular-form-compatibility-at-p` | `AutomorphicGaloisRepresentations:R19.5`: Hilbert/GL₂ realization and Saito comparison with its geometric hypotheses |

AG2.6 imports the general inputs for its higher-rank cases; these six rank-two
applications are not relabelled as higher-rank theorems. No reverse edge to
R19, R18, GH.0 or a modular-variety model is introduced.

Inherited E48–E50 belong with the removed applications. Their provenance
remains in checkpoint #3868 and preceding packet history: E48/E49 concern
Diamond–Flach–Guo's Frobenius and coefficient-prime wording; E50 concerns
Saito's WD/φ,N conventions. This run does not independently re-audit those
sources or issue a new verdict. The receiving owner must compare the named
editions and its own covariant/cohomological conventions before retaining or
modifying those findings. Carry their unresolved proof/source requests to
R19.5; they are not claimed resolved here.

## Tier-order comparison moves

Current WORKERS places this bundle in tier 13 and CohomologyComparisons in
tier 14. Its rule to move needed higher-tier notions down governs the older
stage description's CP imports. This pass reuses period-sheaf/A_inf/HK maps
and owns the needed rational assembly and invariant identifications. It does
not reconstruct sites or crystals.

For the maintainer's ownership reconciliation:

| Previous CP target | New lower owner |
|---|---|
| `CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base` | `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction` |
| `CohomologyComparisons:CP.3/filtered-de-rham-comparison` | `PadicHodgeTheory:R06.5/proper-smooth-de-rham-comparison` |
| `CohomologyComparisons:CP.4/semistable-period-comparison` | `PadicHodgeTheory:R06.5/proper-semistable-period-comparison` |
| `CohomologyComparisons:CP.4/semistable-filtered-bdr-agreement` | `PadicHodgeTheory:R06.5/proper-semistable-period-comparison` |
| Potential-admissibility component of `CohomologyComparisons:CP.4/proper-rigid-potential-semistable-comparison` | `PadicHodgeTheory:R06.5/proper-smooth-potential-semistability` |

The last row moves only potential admissibility, proved by de Rham comparison
and p-adic monodromy. It does not require a semistable formal model after a
finite extension for every proper smooth rigid space. Full analytic HK
comparison over C and integral lattice/correspondence diagrams remain in CP.
CP consumers of the rational statements should import the new owners.

Four inherited AI.6 targets still reference CP.3 in the unedited supplier
packet. Make these exact changes there:

| AI.6 target | Replace its CP.3 input with |
|---|---|
| `bdr-cohomology-etale-embeddings` | `AInfCohomology:AI.6/canonical-bdr-deformation`; retain its existing CK analytic/étale and nonunit-coordinate extension |
| `bdr-comparison-map` | `AInfCohomology:AI.6/canonical-bdr-deformation` for the target object, together with the preceding embedding/extension target |
| `bdr-comparison` | `AInfCohomology:AI.6/canonical-bdr-deformation` and `canonical-bdr-freeness` for target cohomology, freeness and descended identification |
| `etale-bdr-agreement` | `AInfCohomology:AI.6/canonical-bdr-etale-map`, `canonical-bdr-etale-comparison`, `canonical-bdr-freeness`, and `PadicHodgeTheory:R06.5/proper-smooth-de-rham-comparison` for the strict filtered descended statement |

These canonical AI.6 targets already exist. The new R06.5 de Rham node depends
on the earlier P8 coefficient comparison, not on this AI.6 chain, so the
proposed rewiring is acyclic. The legacy P8
`proper-smooth-de-rham-comparison-application` should import the new R06.5
rational application nodes instead of CP.2–CP.4. Keep P8's more general
de-Rham-lisse coefficient comparison as the supplier; its constant-coefficient
application is now the R06.5 target.

Only this issue's four paths were edited. These supplier/CP/P8 changes are
instructions for their owners, not claims their packets have changed. The
current unedited transitive supplier graph is not tier-closed. The AI.6
request explicitly asks for naturality/cup compatibility absent from the
older comparison-map statement.

## Exact remaining supplier work

The packet and reader state all 13 requests with consumers and hypotheses:

1. H5: rational scheme/adic étale comparison, products and twists.
2. DD.2: filtered de Rham complex and proper GAGA adapter.
3. CR.3: rational crystalline/Berthelot–Ogus realization and Frobenius.
4. AI.5: natural multiplicative smooth assembly and top Tate-line normalization.
5. AI.6: semistable comparison naturality/products and the rewiring above.
6. R07.2: H¹ crystalline/contravariant Dieudonné σ-pullback comparison and
   height-two classification over each finite residue field.
7. Néron R11.1: abelian good model and minimal-equation predicate adapter.
8. Néron R11.3: compatible finite-flat p-divisible criterion and Raynaud
   p-power torsion exact sequences, with unramified torus/lattice actions.
9. R02.1: continuous compact Z_p and Q_p Kummer inverse limits and Ext¹.
   The discrete-module Ext statement of R02.4 does not supply this input.
10. RD.7: Katz–Messing equality of φ^f and geometric Frobenius polynomials.
11. Current ClassFieldTheory Layer 5: existing finite Kummer input.
12. LocalFieldsRamification Layer 1: valuation/logarithm adapter on current
    LocalGaloisGroups Layer 7's existing multiplicative completion.
13. EllipticCurves Layer 4: existing Tate uniformization and quadratic-twist
    classification, matched to minimal reduction predicates.

No general Tate carrier, Weil pairing, determinant theorem or multiplicative
completion is planned again. Current Tau Ceti's newer elliptic representation,
pairing and determinant are separately identified from the compilation pin.
The nine roadmaps that postdate the atlas snapshot were checked for overlap;
current LocalGaloisGroups Layer 7 supplies the completed multiplicative carrier.
Reviewed library coverage has no entry for either scoped layer; AUDIT-37 is an
unreviewed lead, not an accepted audit.

The single gap is the unread Berthelot–Breen–Messing proof of the H¹
crystalline/Dieudonné comparison. Brinon–Conrad Remark 7.3.3, p.97, specifies
the Frobenius-pullback convention but does not replace the proof. A lawful
source and the exact R07.2/A4 comparison must establish it before closure.
This volume was not available in the cleared library; no other copy was used.

Néron R11.4–R11.5 retain the converse semistable criterion and rank-N/toric-rank
formula. General bad-place abelian WD comparison and automorphic local-Langlands
compatibility remain downstream. A follow-up closes the precise supplier/proof
boundaries and reconciles ownership links; it does not expand this pass into
those downstream theories.

## Sources and reading record

All sources used by the targets were personally read. The packet and reader
provide edition-specific locators and SHA-256 identities. The passages used are:

- Berger, arXiv:math/0210184v1: §§II.3–II.5, pp.14–20.
- Brinon–Conrad, linked author notes: pp.83–98, 107–108, 123–126 and 139–144.
  The all-Kummer-extension statement is **Lemma 8.3.9**, p.125, not a proposition.
- Coleman–Iovita, arXiv:math/9701229v1: introduction, pp.1–3. The public
  version lacks Chapter II. This pass's good-reduction proof instead uses
  R07.4 and the exact Grothendieck criterion, so Chapter II is not an
  unrecorded prerequisite.
- Scholze, arXiv:1205.3463v2: Theorem 7.11 and Remark 7.12, pp.46–47;
  Theorem 8.4 and its proof, pp.48–49.
- Bhatt–Morrow–Scholze, arXiv:1602.03148v3: pp.1–4 and 121–123,
  especially Theorem 14.6(i) and its proof.
- Česnavičius–Koshikawa, arXiv:1710.06145v3: §4.7–4.8, p.27;
  §5.43–5.44, pp.58–59; §6.7 and Proposition 6.8 with its proof,
  pp.66–68; §9.1–9.6, pp.75–77.
- Colmez–Nizioł, linked CN5 manuscript dated 2024-11-24: Theorem 6.4 and
  proof, pp.40–42; §6.8, pp.42–43.
- Katz–Messing, linked author scan: printed pp.73–75, including Theorem 1,
  p.74, and proof, p.75.

Scholze and BMS were read in place in the maintainer-cleared library. Their
files and passages were not copied into scratch or the repository. Other
public PDFs were scratch-only. No uncleared book was obtained. Current
AdicSpaces and EllipticCurves readers supplied the nearby roadmap style.

E40–E47 retain earlier source-finding IDs, rewritten in our own words and
checked against the editions used. Plans use the corrected statements. These
are not independent review verdicts or claims about unseen published editions.
No quotations, excerpt fields, source-section synopsis, private absolute paths
or source files are included in the deliverables.
