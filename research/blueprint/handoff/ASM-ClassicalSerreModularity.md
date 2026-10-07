# ASM-ClassicalSerreModularity

Complete assembly for [issue #219](https://github.com/CBirkbeck/tauceti-explorer/issues/219), by Codex — `codex-DBIM91`, 7 October 2026 (UTC). This completes the assembly job; it does not close the parts’ mathematical supplier/source gaps or change their independent verdicts. No second job was claimed.

## Deliverables and input state

- [Full reader](../readmes/ClassicalSerreModularity.md): a single introduction, scope/ownership table, coefficient and variable conventions, pinned-library inventory, edition-specific sources, 18-layer overview and all 81 current declaration plans. It preserves all statements, hypotheses, proof obligations, acceptance checks, 38 API items, 32 test statements and 30 planet names from the current packets, followed by their 11 gaps and 14 confirmed source corrections.
- [Full suggested Lean](../suggested/ClassicalSerreModularity.lean): one standard note, one block of 33 distinct imports, the three executable bodies, and their source-facing supplier sketches. Revision narratives and inherited compilation claims are removed. Packet names for the Paso 2 bundled API and its tests are reconciled with the inherited shorthand; the unavailable bundled objects are expressly sketches in comments.
- [R33.5 packet](../packets/ClassicalSerreModularity--R33.5.json): two component-owner reference repairs described below. The other two part packets are unchanged. The part readers/suggested files, review files, campaign pages, atlas and supplier packets are unchanged.

| Part | Nodes | Packet status | Existing review verdict |
| --- | --- | --- | --- |
| [R26.1](../packets/ClassicalSerreModularity--R26.1.json) | 36 | complete | needs_changes, REV-ClassicalSerreModularity--R26.1, 2026-10-06 |
| [R27.3](../packets/ClassicalSerreModularity--R27.3.json) | 37 | partial | needs_changes, REV-FIX-RT-AREA-langlands-2~2, 2026-10-02 |
| [R33.5](../packets/ClassicalSerreModularity--R33.5.json) | 8 | partial | accepted, REV-FIX-RT-BP-ClassicalSerreModularity--R33.5, 2026-09-30 |

“Complete” in R26.1 is the inherited packet status, not proof closure. None of the 18 layers is closed and every node remains `unchecked`. No review verdict, history or source-issue verdict is changed by the assembly. An independent assembly review should assess the consolidated reader and the two reference repairs.

## Reconciliation and changes to reviewed nodes

The latest R26.1 review corrects the packet and suggested file but leaves its old reader stale. The consolidated reader is rendered from the current packet statements, not copied from that reader. It carries the corrected terminal supports/exponents, normalized-characteristic transfer, ordinary/solvable distinctions, general-weight compatible-system requirement, nonscalar Breuil–Mézard statement with arbitrary stable lattice, scalar crystalline alternative, plus-sign local quadratic, exact prime estimates and dyadic exponent distinction. It also includes the later R27.6 Artin/weight-one reduction and descent nodes, which the earlier reader summary does not count.

Two nodes of R33.5 previously cited the mixed `ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement` alias:

- `R33.5/dp-characteristic-two-closure` now cites `ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement`. Its solvable-branch hypothesis names that component owner; Rohrlich–Tunnell remains R17.6.
- `R33.6/strong-form-by-the-modern-route` now cites the same exact R01.4 component. The conditional R27.4 refinement remains its prerequisite and supplies the required dihedral/refinement contracts.

This applies the explicit option in the R27.3 part’s restructuring proposal. The integrated R01.4 node was read and supplies the identical Dickson classification/dyadic refinement. These are dependency/citation repairs. No theorem statement, mathematical hypothesis, proof step or acceptance condition is strengthened or weakened, and no implementation/coverage/review status changes. They do not replace R27.4’s refinement by the qualitative theorem. The independent assembly review should check the dependency edits; no new mathematical result is claimed as already reviewed.

Every other cross-part prerequisite already resolves to its exact stable node. There are 37 cross-part edges, with no unresolved same-roadmap reference, duplicate declaration identifier or cycle in the 81-node graph. The two R27.1 nodes supplied by R27.3 are displayed before that block’s conductor induction; all other declarations follow their parts in order. The literal stage graph remains a separate maintainer action.

## Validation and its limits

- `python3 scripts/check_blueprint.py` on all three part packets: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/ClassicalSerreModularity.lean`: exit 0; no errors, only `declaration uses sorry` warnings. The shared build’s Mathlib is exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`. Available memory exceeded 20 GB; only one compilation ran at a time. The file imports Mathlib only. The shared Tau Ceti working revision differs from its pin, so no compilation of pinned Tau Ceti modules is claimed.
- Pinned Tau Ceti declaration statements were inspected with the existing repository at `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib statements were read directly at its pin. The assembly reuses matrix GL₂, the absolute Galois group, modular/cusp forms, newforms, abelian varieties, maxPrimeFac, primeCounting, Bertrand and Maschke. It reads the reviewed AUDIT-31 library coverage before assigning work.
- A scratch audit loads integrated declarations and overrides them with every current blueprint packet. It checks the full modern prerequisite closures below, treating unresolved stage/library references as leaves. This is declaration-level bookkeeping, not proof of supplier statements or a repaired atlas stage graph.
- Reader checks cover all 81 identifiers exactly once, all API/test names, unique internal anchors, local link targets and absence of Lean code fences. The suggested file has one import block and one standard note; packet names are accounted for as executable signatures/examples, supplier sketches or the explicit omission ledger.
- The upstream Chebotarev and Global Number Fields roadmaps were read as the two nearby style/ownership references. CH-L08 is the current Chebotarev link; it supplies density after the compatible Frobenius class is constructed.
- Repository intake file validation and `git diff --check` pass for the four changed deliverables. No build, language server, repository copy or clone was started.

| Endpoint | References in current prerequisite closure | R26 or R27.2–R27.6 prerequisites |
| --- | --- | --- |
| `R33.4/dp-odd-characteristic-assembly` | 2354 | None |
| `R33.5/qualitative-serre-theorem` | 2586 | None |
| `R33.6/strong-form-by-the-modern-route` | 2717 | `R27.4/strong-form-by-minimal-lifts` |
| `R33.6/elliptic-curve-export-via-either-route` | 2720 | `R27.4/strong-form-by-minimal-lifts` |

Elaboration validates executable suggestions and their finite arithmetic/lattice instances. It does not validate commented signatures, complete any proof containing `sorry`, produce canonical conductor/Serre-weight/attached-representation interfaces, or close the supplier audits. The R26.1 omission ledger remains necessary; it includes the actual-conductor specialization and representation-valued induction hypotheses. The Paso 2 bundled API and the remaining representation-valued non-examples likewise need R24/R01 interfaces. These are recorded limits of the inherited partial plans, not an unfinished assembly task.

## Maintainer actions for the shared early stage

The parts make the same stage-split request with complementary detail. Apply it once, retaining all five stable node identifiers:

1. Create the proposed early component R27.1a for Definition 2.1, Lemma 6.3 and Lemma 8.2. Remove the inherited R26.6 requirement and any later modularity requirements from that early component. Its genuine inputs are R01.3–R01.5, R15.4, R24’s residual/system operations and upstream Chebotarev Layer 10.
2. Put classical good-dihedral insertion and the mixed KW §6 alias in the late R27.1b component. Keep each alias component with its RS-06 owner. Both modern dyadic direct consumers now cite R01.4, so they do not need that mixed alias as an additional early input.
3. Keep R26.6 → R27.3 for (W₁). Repoint RS-06’s R27.1 → R33.2/R33.3/R33.6 links to the early component, with any actual late consumer linked separately. Do not infer a deleted stage edge from a packet adding a link.
4. Add the integral classification dependency R07.5 → R24.6, after R07.4 descent. R15.4 supplies the weight recipe, not Savitt’s integral classification.
5. After applying the split/edge deletion, recompute atlas ancestors: no R26 layer should be an ancestor of R33.1–R33.5. Retain the intended R27.4 conditional refinement into R33.6. Do not route modern strong modularity or the conditional elliptic-curve corollary through the unconditional R27.6 classical theorem/export.

No stage split, atlas edge deletion or supplier edit is applied in this PR: those files are outside the assembly deliverables. R27.1a/R27.1b remain proposed identifiers only. The exact two original proposals are retained below so that their component assignments and acceptance instructions are not lost.

### Original proposal R26.1/1

Action: split; roadmaps: ClassicalSerreModularity, PotentialModularityAndCompatibleSystems.

RT-AREA-langlands-2/1: current R27.1 has an inherited R26.6 requirement, defeating the early good-dihedral prefix used by R33. The stage graph cannot erase the edge by adding a link. RT-AREA-langlands-2/7 also requires an integral Savitt supplier at R07.5 and its compatible-system consumer edge.

Replace R27.1 by R27.1a (Definition2.1, Lemma6.3, Lemma8.2) and R27.1b (good-dihedral insertion and other late operations). R27.1a requires only R01.4/R01.5, R15.4, R24.5’s compatible-system operations or R24.6 residual-member interface, and Tau Ceti Chebotarev Layer10; delete inherited R26.6 and other late modularity requirements from this prefix. Preserve stable node ids and migrate the sibling R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes to R27.1a; its prime-field hypothesis remains. Migrate R27.1/good-dihedral-prime-insertion to R27.1b, with its actual R24 lift dependencies. Keep R26.6→R27.3 for W1. Replace RS-06 links R27.1→R33.2/R33.3/R33.6 by R27.1a→those stages; assign any actual late insertion consumers to R27.1b explicitly. The mixed Dickson/modularity/weight alias keeps its RS-06 component owners, not a new early-prefix dependency. Add the weight-classification dependency R07.5→R24.6 (R07.4 descent precedes R07.5); remove R15.4-as-integral-classification ownership. After application check that no R26.x stage is an ancestor of R33.1–R33.5. Do not create fictitious live stage ids in this packet.

### Original proposal R27.3/1

Action: split; roadmaps: ClassicalSerreModularity.

RT-AREA-langlands-2/1 (confirmed). The atlas layer R27.1 requires R26.6, and the accepted RS-06 links R27.1 → R33.2, R27.1 → R33.3 and R27.1 → R33.6 therefore make Khare's level-one proof R26.1–R26.6 an ancestor of the modern strand R33.2–R33.5, against RS-06's own keeps for R27.1 and R33.2. No declaration of R27.1 uses R26: Definition 2.1 (R27.1/good-dihedral-prime-definition, part R26.1) rests on ArithmeticGaloisRepresentations R01.4, R01.5 and AlgebraicModularFormsAndSerreWeights R15.4; Lemma 6.3 (R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved, part R26.1) on the definition, R01.4, R01.5 and PotentialModularityAndCompatibleSystems R24.6/residual-members; Lemma 8.2 (R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes, this packet) on R01.3, R01.4 and Tau Ceti Chebotarev Layer 10; the insertion of KW I §8.4 (R27.1/good-dihedral-prime-insertion, this packet) on those three and on R24.3, R24.6; the mixed KW I §6 node (R27.1/dickson-and-the-dyadic-solvable-refinement, part R26.1) on R01.4, GL2AutomorphicRepresentationsAndTransfer R17.5, R17.6, SerreWeightAndLevelOptimisation R20.5 and R15.4. In the other direction R26.6/corollary-8-1-ii-and-the-statement-W1 (part R26.1) has Definition 2.1 as a prerequisite, so the layer order R26.6 before R27.1 is the reverse of the declaration order. A packet can only add links on promotion, never remove one, so the edge R26.6 → R27.1 has to be removed in the atlas or by a revised RS-06.

Two sub-layers of R27.1, with the names used by the restructure entry of part R26.1. R27.1a, 'Good-dihedral primes: definition, image and the Chebotarev choice': R27.1/good-dihedral-prime-definition, R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved (part R26.1) and R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes (this packet). It requires ArithmeticGaloisRepresentations R01.3, R01.4, R01.5, AlgebraicModularFormsAndSerreWeights R15.4, PotentialModularityAndCompatibleSystems R24.6 (for Lemma 6.3(ii)) and tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev. R27.1b, 'Inserting a good-dihedral prime; the KW I §6 image and weight lemmas': R27.1/good-dihedral-prime-insertion (this packet) and R27.1/dickson-and-the-dyadic-solvable-refinement (part R26.1), whose components keep the owners RS-06 gave them. It requires R27.1a, PotentialModularityAndCompatibleSystems R24.3 and R24.6, GL2AutomorphicRepresentationsAndTransfer R17.5 and R17.6, SerreWeightAndLevelOptimisation R20.5 and AlgebraicModularFormsAndSerreWeights R15.4. Stage edits. (1) Delete ClassicalSerreModularity:R26.6 from the requires of R27.1, that is, of both sub-layers; the RS-06 link R26.6 → R27.3 stays, for (W₁) in Theorem 3.3. (2) Replace the RS-06 links R27.1 → R33.2, R27.1 → R33.3 and R27.1 → R33.6 by R27.1a → R33.2, R27.1a → R33.3 and R27.1a → R33.6. (3) R26.6, R27.2, R27.3 and R27.5 require R27.1a; R27.4 and R27.6 require R27.1a and R27.1b. Part R33.5 has two nodes, R33.5/dp-characteristic-two-closure and R33.6/strong-form-by-the-modern-route, that cite the mixed KW I §6 node of R27.1b: either they are re-pointed to the component owners (ArithmeticGaloisRepresentations R01.4/dickson-classification-and-the-dyadic-refinement for Dickson's classification and its dyadic refinement, as this part did for R33.1), or R33.5 and R33.6 require R27.1b. (4) Node ids are stable; only the parent layer of the five declarations changes. Acceptance, as in the finding: on data/atlas.json with the accepted restructuring links and the link maps, after edit (1) alone no R26.x layer is an ancestor of R33.1–R33.5, while R33.6 keeps R26.x through R27.4 and R27.6; after (1)–(3) R33.1–R33.4 also lose R27.1b's suppliers, and R33.5 does once its node is re-pointed. At declaration level the property already holds in this packet: no node of R33.1–R33.4 has a prerequisite in R26, in R27.1b or in R27.2–R27.6, and the fixes report gives the computation.

## Supplier requests

All 42 original request records follow, grouped by supplier. Repeated supplier entries are retained with their part and consumer list: they often request different theorem alternatives or coefficient/lattice contracts. All retain their recorded `open` status; this assembly does not equate an existing partial supplier node with a discharged request.

### AlgebraicModularFormsAndSerreWeights:R15.2

**R27.3 request 17** — status `open`.

Finite generation over a noetherian base A of H¹(X_A, ω^k ⊗ 𝒪(−C)) as well as of H⁰, for the proper fine compactified modular curve X₁(N), N ≥ 5 (the H¹ form of R15.2/finite-generation-of-geometric-sections), with the exact sequence 0 → H⁰(X, ℒ)/ℓ → H⁰(X_{𝔽_ℓ}, ℒ) → H¹(X, ℒ)[ℓ] → 0 for ℒ = ω ⊗ 𝒪(−C) over ℤ[1/N].

Consumers:

- `ClassicalSerreModularity:R27.6/weight-one-reduction-is-onto-for-almost-all-primes`

### AlgebraicModularFormsAndSerreWeights:R15.3

**R26.1 request 12** — status `open`.

For fixed level Γ₁(p²), the integral Hecke algebra acting on weight-two cusp forms is a finite Z-module; after reduction mod p it has finitely many eigencharacters over F̄_p. Supply the weight-two realisation used in Khare Cor1.3, with finite cyclotomic twists.

Consumers:

- `ClassicalSerreModularity:R26.6/finiteness-corollary-1-3`

### AlgebraicModularFormsAndSerreWeights:R15.4

**R26.1 request 11** — status `open`.

Provide the local classical Serre-weight recipe, coefficient/twist invariance and level-one determinant parity; the bad-dihedral normalized-weight application of KW Lemma6.2(ii)/DP v2 Lemma1.14 is owned here, after R01.4. Its niveau-one/two split gives k=(p+1)/2 or (p+3)/2 for p≥3, S-type and 2≤k≤p+1. Ribet Prop2.2 is now read: its theorem assumes semistable and cyclotomic determinant; use the analogous inertia/rotation-subgroup argument, not a false direct general application. In Ribet’s published Proposition 2.2 proof p.280, “center” must mean the index-two rotation subgroup (E14); the analogous argument must use that subgroup. Also export the locally irreducible bad-dihedral weight (p+3)/2 case for residuals ramified at an auxiliary prime, rather than applying the level-one theorem to them.

Consumers:

- `ClassicalSerreModularity:R26.3/serre-weight-twist`
- `ClassicalSerreModularity:R27.1/good-dihedral-prime-definition`
- `ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement`
- `ClassicalSerreModularity:R26.4/ordinary-reduction-and-parity`
- `ClassicalSerreModularity:R26.3/level-one-induction-scheme`
- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`
- `ClassicalSerreModularity:R26.4/degenerate-branches`
- `ClassicalSerreModularity:R26.6/corollary-8-1-ii-and-the-statement-W1`
- `ClassicalSerreModularity:R26.5/terminal-row-branch-contract`

**R27.3 request 5** — status `open`.

Serre's local weight recipe including p = 2 (k = 2 when finite, k = 4 when très ramifiée: Serre (2.4.7), 2.6), its Fontaine–Laffaille comparison (a crystalline lift with Hodge–Tate weights {0, k − 1}, k ≤ p − 1, has residual weight k), and the criterion that a très ramifiée ρ̄ : G_{ℚ₂} → GL₂(𝔽̄₂) is finite flat over no finite extension of odd ramification index (asserted without reference in KW I, used by KW I Theorem 9.1 and DP Remark 6).

Consumers:

- `ClassicalSerreModularity:R27.4/auxiliary-characteristic-choice`
- `ClassicalSerreModularity:R27.4/strong-form-by-minimal-lifts`
- `ClassicalSerreModularity:R27.5/dyadic-weight-two-claim`
- `ClassicalSerreModularity:R27.6/full-classical-serre-theorem`
- `ClassicalSerreModularity:R33.1/fontaine-laffaille-member-not-bad-dihedral`
- `ClassicalSerreModularity:R33.3/remark-6-weight-two-after-type-change`

### AlgebraicModularFormsAndSerreWeights:R15.6

**R26.1 request 2** — status `open`.

Serre's weight k(ρ̄) and conductor N(ρ̄), S-type representations and the meaning of 'arises from'.

Consumers:

- `ClassicalSerreModularity:R26.1/level-one-theorem-and-the-meaning-of-arises-from`
- `ClassicalSerreModularity:R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof`
- `ClassicalSerreModularity:R26.3/serre-weight-twist`
- `ClassicalSerreModularity:R26.6/level-one-proof-assembly`
- `ClassicalSerreModularity:R26.6/finiteness-corollary-1-3`
- `ClassicalSerreModularity:R27.1/good-dihedral-prime-definition`
- `ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement`
- `ClassicalSerreModularity:R27.2/hypotheses-Lr-Wr-and-Dr`

**R27.3 request 6** — status `open`.

Definitions of S-type, N(ρ̄), k(ρ̄), ε(ρ̄), "arises from" and "modular"; the determinant congruence det ρ̄ = ε̄ χ̄_p^{k−1}; Serre's Proposition 4 (k = 2 iff finite at p and det|_{I_p} = χ̄_p); invariance under enlarging the coefficient field.

Consumers:

- `ClassicalSerreModularity:R27.4/strong-form-by-minimal-lifts`
- `ClassicalSerreModularity:R27.6/full-classical-serre-theorem`
- `ClassicalSerreModularity:R27.6/finite-flat-weight-two-export`
- `ClassicalSerreModularity:R33.1/dp-target-and-the-weight-at-least-two-convention`

### ArithmeticGaloisRepresentations:R01.2

**R27.3 request 7** — status `open`.

Local Galois groups at N: the unramified quadratic extension ℚ_{N²}, the tame quotient of inertia through 𝔽_{N²}^×, local class field theory for characters of G_{ℚ_{N²}}, and induced local representations with their Weil–Deligne types. For Lemma 2.3 at (q, N) = (3, 2): the tame relation Frob σ Frob⁻¹ = σ^q in the tame quotient of D₂, and the unique quotient of order 3 of I₂ through which a unipotent mod-3 action factors.

Consumers:

- `ClassicalSerreModularity:R33.2/dihedral-local-type-at-n`
- `ClassicalSerreModularity:R33.3/dp-dyadic-transition-and-the-order-three-type`

### ArithmeticGaloisRepresentations:R01.3

**R27.3 request 8** — status `open`.

The Artin conductor exponent of a tame two-dimensional local representation without inertia invariants (exponent 2).

Consumers:

- `ClassicalSerreModularity:R27.3/theorem-3-3-initial-case`

**R27.3 request 14** — status `open`.

Continuous absolutely irreducible odd two-dimensional residual representations over the prime field, complex conjugation and its projective order; no weight/level or modularity assertion.

Consumers:

- `ClassicalSerreModularity:R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`

**R27.3 request 16** — status `open`.

The conductor exponent of a Frobenius-semisimple Weil–Deligne representation (r, N) of W_{ℚ_ℓ} on a two-dimensional V, with the monodromy term: a(r, N) = a(r) + dim V^{I_ℓ} − dim (ker N)^{I_ℓ}; in particular a = 1 for r unramified and N ≠ 0 (the Steinberg parameter), while a residual representation unramified at ℓ has exponent 0. With PotentialModularityAndCompatibleSystems R24.6/residual-members (iii) (reduction at a prime ≠ ℓ cannot increase the conductor) this gives KW I §8.4's bound v₂(N(ρ̄′_s)) ≤ r, where the first system of Theorem 5.1(2) at p = 2, k(ρ̄) = 4 has dyadic exponent 1 although N(ρ̄) is odd.

Consumers:

- `ClassicalSerreModularity:R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice`

### ArithmeticGaloisRepresentations:R01.4

**R26.1 request 3** — status `open`.

Residual images: Dickson's classification and oddness.

Consumers:

- `ClassicalSerreModularity:R26.2/minimal-weight-two-lift`
- `ClassicalSerreModularity:R27.1/good-dihedral-prime-definition`
- `ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement`
- `ClassicalSerreModularity:R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`

**R27.3 request 9** — status `open`.

Dickson's classification with the coefficient field visible; the bad-dihedral definition (DP Definition 1.12) and DP Lemma 1.13 (irreducibility over ℚ(√p*) iff over ℚ(ζ_p)); absolute irreducibility of odd irreducible ρ̄ for odd p. For KW I Lemma 8.2, classify non-solvable subgroups of GL₂(𝔽_p), p ≡ 1 modulo 4, with projective image PSL₂(𝔽_p), PGL₂(𝔽_p) or A₅ and abelianisation/intersection properties; no level-one modularity input.

Consumers:

- `ClassicalSerreModularity:R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`
- `ClassicalSerreModularity:R33.1/dp-modularity-lifting-inputs`
- `ClassicalSerreModularity:R33.1/fontaine-laffaille-member-not-bad-dihedral`
- `ClassicalSerreModularity:R33.2/dihedral-local-type-at-n`

### ArithmeticGaloisRepresentations:R01.5

**R26.1 request 13** — status `open`.

Supply the canonical inertia/restriction and prime-to-characteristic Artin conductor API. For semisimple residual abelian characters unramified outside p, the Kronecker–Weber/class-field comparison forces factorisation through the prime-to-p quotient of Z_pˣ, hence finitely many F̄_p-valued characters (order divides p−1). For q=2, Artin exponent one in odd residual characteristic gives tame inertia with a fixed line; Frobenius forces the quotient character χ=χ², hence χ=1 and the inertia image is unipotent of p-power order. This supplies the semistability premise for Annals Theorem5.2(ii).

Consumers:

- `ClassicalSerreModularity:R26.6/finiteness-corollary-1-3`
- `ClassicalSerreModularity:R27.1/good-dihedral-prime-definition`
- `ClassicalSerreModularity:R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`
- `ClassicalSerreModularity:R26.6/corollary-1-2-proof`

### AutomorphicGaloisRepresentations:R19.1

**R27.3 request 15** — status `open`.

The Deligne–Serre representation ρ_f of a weight-one cuspidal eigenform (AutomorphicGaloisRepresentations R19.1/weight-one-artin-representation, now cited as a node): unramified outside the level, with Tr ρ_f(Frob_r) = a_r and det ρ_f(Frob_r) = ε(r). Only this attachment is imported; the converse is the theorem of this layer.

Consumers:

- `ClassicalSerreModularity:R27.6/odd-artin-weight-one-modularity`
- `ClassicalSerreModularity:R27.6/weight-one-descent-from-infinitely-many-primes`

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3

**R26.1 request 20** — status `open`.

Supply the scalar crystalline residual-reducibility criterion of Breuil–Mézard Proposition 4.1.1 (author-copy pp.30–31), as an application of the integral Fontaine–Laffaille classification with coefficient action and arbitrary stable lattice: for two-dimensional crystalline V over ℚ_p of HT {0,k−1}, 1<k<p, a locally irreducible V has irreducible residual reduction of niveau two. Thus a reducible reduction forces the ordinary branch. The foil uses only k=2<p, safe even at p=3; the k=p+1 endpoint belongs to R08/R22 and is not inferred from this criterion.

Consumers:

- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`
- `ClassicalSerreModularity:R26.4/degenerate-branches`

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5

**R26.1 request 10** — status `open`.

After R07.4 descent, provide Breuil–Mézard Prop.6.1.1 and Savitt Theorem6.11/Corollary6.15(1),(2)/Remark6.17 for odd p, potentially crystalline Hodge–Tate {0,1}, tame niveau-one/two types. For the Q_p(μ_p) niveau-one type, residually reducible implies ordinary up to a Teichmüller twist. Compute the up-to-cyclotomic-twist Serre weights i+2 or q+1−i for ω_q^i type and q+1−(i−j), i−j (i>j+1), or q (i=j+1) for the niveau-two type. Preserve the lattice/trivial-endomorphism hypothesis of Cor6.15 and use Remark6.17 only for its semisimplification extension; include the corrected i=1 corner in v3 Remark1.7. R24.5/R24.6 must consume this owner rather than R15.4 as a provider of integral classification. The BM author copy has now been read: Proposition 6.1.1 concerns the nonscalar principal-series type ω_p^i⊕1, 1≤i≤p−2, HT {0,1} and any stable lattice, with no End(ρ̄)=F condition. Reducibility excludes the intermediate-slope case. Its introduction to §6 explicitly omits calculation details, which the owning integral-classification plan must supply.

Consumers:

- `ClassicalSerreModularity:R26.2/compatible-system-lifts`
- `ClassicalSerreModularity:R26.4/local-reducibility-ordinary`
- `ClassicalSerreModularity:R27.2/theorem-3-2-weight-reduction`

### GL2AutomorphicRepresentationsAndTransfer:R17.5

**R26.1 request 14** — status `open`.

Import odd-characteristic dihedral/solvable residual modularity from the precise Langlands–Tunnell and theta-series results; this is the modularity component of RS-06’s stable mixed alias, separate from Dickson image classification.

Consumers:

- `ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement`
- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`

**R27.3 request 11** — status `open`.

Langlands–Tunnell as DP Theorem 1.3: an odd irreducible ρ̄ : G_ℚ → GL₂(𝔽̄_p), p odd, with solvable image is modular (it lifts to an odd complex representation, which comes from a weight-one form).

Consumers:

- `ClassicalSerreModularity:R33.1/dp-target-and-the-weight-at-least-two-convention`

### GL2AutomorphicRepresentationsAndTransfer:R17.6

**R26.1 request 15** — status `open`.

Export solvable residual modularity over Q including the p=2 dihedral refinement; verify absolute irreducibility, oddness and coefficient-field hypotheses, not merely an abstract finite-image assertion.

Consumers:

- `ClassicalSerreModularity:R26.4/degenerate-branches`
- `ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement`
- `ClassicalSerreModularity:R26.2/minimal-weight-two-lift`

**R33.5 request 1** — status `open`.

Rohrlich–Tunnell: an irreducible ρ̄ : G_ℚ → GL₂(𝔽̄₂) with dihedral projective image is modular (with its coefficient and ramification hypotheses), as DP §3 uses it.

Consumers:

- `ClassicalSerreModularity:R33.5/dp-characteristic-two-closure`

### GL2ModularityLifting:R22.1

**R26.1 request 5** — status `open`.

Minimal R = T over totally real fields (Fujiwara; Taylor §3) for ρ̄|_{G_F} with non-solvable image.

Consumers:

- `ClassicalSerreModularity:R26.2/lifting-method-flatness`

### GL2ModularityLifting:R22.6

**R26.1 request 17** — status `open`.

Export nonordinary potentially BT modularity over Q for the tame Q_p(μ_p) type, with residual cyclotomic restriction absolutely irreducible, and crystalline lifting in 2≤k≤p+1 with the ordinary endpoint handled explicitly. Include the semistable weight-two transition in the corrected prime-conductor proof.

Consumers:

- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`
- `ClassicalSerreModularity:R26.4/degenerate-branches`
- `ClassicalSerreModularity:R26.6/level-one-proof-assembly`

### GL2ModularityLifting:R32.5

**R27.3 request 4** — status `open`.

DP Theorem 1.7 (Skinner–Wiles at p = 3 with ρ̄^{ss} ≅ 1 ⊕ χ₃, ordinary at 3, det ρ = ψχ₃^{k−1}) with its exact local hypotheses (see the gap on its second bullet).

Consumers:

- `ClassicalSerreModularity:R33.1/dp-modularity-lifting-inputs`
- `ClassicalSerreModularity:R33.4/dp-terminal-characteristic-five-and-the-schoof-base-case`

### GL2ModularityLifting:R32.6

**R27.3 request 3** — status `open`.

DP Theorems 1.4–1.6 as modularity-transfer statements: Kisin's Fontaine–Mazur theorem with Emerton or Paškūnas, Hu–Tan (p ≥ 5) and Tung (p = 3); Kisin's 2-adic theorem with Paškūnas and Tung; Skinner–Wiles and Pan for residually reducible ρ with p ≥ 5, needing only the de Rham property at a ramified coefficient prime.

Consumers:

- `ClassicalSerreModularity:R33.1/dp-modularity-lifting-inputs`

### GL2ModularityLifting:R32.6/globalisation-dependency-audit

**R33.5 request 3** — status `open`.

Complete the remaining independence audit already recorded in this partial supplier: Tung’s global Breuil–Mézard inputs ([CEG+16] patched modules, Emerton–Paškūnas faithfulness, BLGG13 Theorem A.4.1) and Gee’s Theorem 4.4.12 used by Kisin, with the corresponding R31.6/R20.6 owners. Preserve the distinction between modularity-assuming statements and forms that take residual modularity from the full Serre theorem. This requests completion of those stated obligations, not a new duplicate audit.

Consumers:

- `ClassicalSerreModularity:R33.5/globalisation-dependency-check`

### LocalGaloisDeformationRings:R08.2

**R26.1 request 7** — status `open`.

Minimally ramified local lifting rings at ℓ ≠ p and their tangent spaces.

Consumers:

- `ClassicalSerreModularity:R26.2/local-ring-at-q-smooth`

### LocalGaloisDeformationRings:R08.3

**R26.1 request 8** — status `open`.

Crystalline lifting rings of weight k ≤ p + 1 with fixed determinant, smooth of relative dimension h⁰(D_p, Ad⁰ρ̄) + 1.

Consumers:

- `ClassicalSerreModularity:R26.2/nebentype-lift-at-q`
- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`

### LocalGaloisDeformationRings:R08.6

**R26.1 request 9** — status `open`.

Ordinary and Barsotti–Tate local rings of the minimal weight-2 type (Taylor E3–E4).

Consumers:

- `ClassicalSerreModularity:R26.2/minimal-weight-two-lift`

### OrdinaryAutomorphicFormsAndModularityLifting:R21.6

**R26.1 request 4** — status `open`.

The exported ordinary and residually reducible lifting statements (Skinner–Wiles, Wiles, Taylor–Wiles, Diamond, Kisin) with their hypotheses individually.

Consumers:

- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`
- `ClassicalSerreModularity:R26.4/degenerate-branches`
- `ClassicalSerreModularity:R27.2/theorem-3-2-weight-reduction`

Additional request metadata: {"note": "Served in part: OrdinaryAutomorphicFormsAndModularityLifting R21.5/theorem-a-over-q (residually reducible) and R21.5/nearly-ordinary-irreducible-lifting-over-q (Skinner–Wiles 2001, residually irreducible, excluding ρ̄ induced from an imaginary quadratic field until its E11 is resolved), both exported by R21.6/exported-ordinary-modularity-over-q."}

### PotentialModularityAndCompatibleSystems:R24.3

**R27.3 request 1** — status `open`.

Prescribed local lifts as DP Theorem 1.9 states them: (1)–(3) from KW I Theorem 5.1(1)–(2) (minimal crystalline lifts; the dyadic weight-4 Steinberg lift) and (4) weight-2 lifts with any compatible inertial types at ℓ ∈ Σ, crystalline at p if k(ρ̄) = 2 and Steinberg if k(ρ̄) = p + 1 (Gee 2011; Snowden Theorem 7.2.1). The lifts must be minimal in KW I's sense, so that prime-to-p inertial types are preserved (source issue ClassicalSerreModularity/E7).

Consumers:

- `ClassicalSerreModularity:R27.1/good-dihedral-prime-insertion`
- `ClassicalSerreModularity:R33.1/paso-1-weight-two-system`
- `ClassicalSerreModularity:R33.2/dp-lift-existence-and-good-dihedral-insertion`
- `ClassicalSerreModularity:R33.2/paso-3-killing-the-odd-level`
- `ClassicalSerreModularity:R33.3/dp-dyadic-transition-and-the-order-three-type`
- `ClassicalSerreModularity:R33.3/paso-4-removing-two`
- `ClassicalSerreModularity:R33.3/paso-5-killing-the-good-dihedral-prime`
- `ClassicalSerreModularity:R33.4/dp-terminal-characteristic-five-and-the-schoof-base-case`

### PotentialModularityAndCompatibleSystems:R24.5

**R26.1 request 1** — status `open`.

Taylor's potential modularity over totally real Galois fields of even degree for ρ̄ with non-solvable image, with ordinary (resp. crystalline) cuspidal π of the prescribed type, and the resulting compatible systems (Brauer induction and Arthur–Clozel). Include the published Annals Theorem4.2(ii) semistable weight-two compatible-system contract. Its abelian-variety realisation is requested separately from R25.5 by the R26.6 consumer; R24 does not acquire a backward dependency on R25.

Consumers:

- `ClassicalSerreModularity:R26.2/lifting-method-flatness`
- `ClassicalSerreModularity:R26.6/corollary-1-2-proof`

**R26.1 request 19** — status `open`.

For Khare Corollary 5.5 import the general crystalline weight-k minimal lift (R24.3/kw-annals-minimal-lifts, Annals Theorem 3.3) and type-(1) general-weight system (KW I Theorem 5.1(1), Annals Theorem 4.2(i)), with absolute irreducibility on G_{ℚ(μ_q)}, 2≤k≤q+1 and k≠q. At a new odd prime p with k≤p+1 obtain a crystalline member unramified away from p and the residual normalized-weight contract from R24.6/R15.4; deal with dihedral residuals separately. A weight-two compatible system is insufficient.

Consumers:

- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`

### PotentialModularityAndCompatibleSystems:R24.6

**R27.3 request 2** — status `open`.

Almost strictly compatible systems (KW I §5; DP Definition 1.10 with its exception at residually reducible members), KW I Theorem 5.1(1)–(4) with the Weil–Deligne parameters and minimality, Dieulefait's existence of families (DP Theorem 1.11), the change of residual characteristic, and DP Remark 4 (a compatible system is modular iff one member is).

Consumers:

- `ClassicalSerreModularity:R27.1/good-dihedral-prime-insertion`
- `ClassicalSerreModularity:R27.3/theorem-3-1-killing-ramification`
- `ClassicalSerreModularity:R27.4/auxiliary-characteristic-choice`
- `ClassicalSerreModularity:R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice`
- `ClassicalSerreModularity:R27.4/strong-form-by-minimal-lifts`
- `ClassicalSerreModularity:R27.5/dyadic-weight-two-claim`
- `ClassicalSerreModularity:R27.5/d1-by-the-prime-three`
- `ClassicalSerreModularity:R27.5/dr-for-r-at-least-two`
- `ClassicalSerreModularity:R27.6/scope-of-the-final-statement-and-the-compatible-system-export`
- `ClassicalSerreModularity:R33.1/dp-modularity-lifting-inputs`
- `ClassicalSerreModularity:R33.1/paso-1-weight-two-system`
- `ClassicalSerreModularity:R33.2/dp-lift-existence-and-good-dihedral-insertion`
- `ClassicalSerreModularity:R33.2/paso-3-killing-the-odd-level`
- `ClassicalSerreModularity:R33.3/dp-dyadic-transition-and-the-order-three-type`
- `ClassicalSerreModularity:R33.3/remark-6-weight-two-after-type-change`
- `ClassicalSerreModularity:R33.3/paso-4-removing-two`
- `ClassicalSerreModularity:R33.3/paso-5-killing-the-good-dihedral-prime`
- `ClassicalSerreModularity:R33.4/dp-terminal-characteristic-five-and-the-schoof-base-case`

### SerreWeightAndLevelOptimisation:R20.3

**R27.3 request 13** — status `open`.

The untwisting step of KW I Theorem 1.2(1) (source issue ClassicalSerreModularity/E9): for p odd, if ρ̄ ⊗ χ_p^i arises from a newform of level N prime to p, then ρ̄ arises from a mod p eigenform of type (N, k(ρ̄), ε), k(ρ̄) Serre's weight. Twisting by χ_p is the θ-operator on mod p forms of level prime to p (R20.3/ribet-twist-to-small-weight), and Edixhoven's weight theorem (R20.3/edixhoven-weight-theorem, with no exceptional case for p > 2) gives the weight; the Deligne–Serre lifting lemma (AlgebraicModularFormsAndSerreWeights R15.5) then gives a characteristic-zero eigenform of weight k(ρ̄) ≥ 2 and level N.

Consumers:

- `ClassicalSerreModularity:R27.4/strong-form-by-minimal-lifts`
- `ClassicalSerreModularity:R27.6/full-classical-serre-theorem`

**R27.3 request 19** — status `open`.

The minimal-weight part of Edixhoven's theorem in the unramified, non-exceptional case, as R20.3/edixhoven-weight-theorem states it: if ρ̄ ≅ ρ_g for a Katz eigenform g of type (N, ℓ, ε), ℓ ∤ N, and ρ̄ is unramified at ℓ with distinct Frobenius eigenvalues, there is a cuspidal eigenform of type (N, 1, ε) with the eigenvalues of g for T_r, r ≠ ℓ. With R20.3/companion-forms (k = ℓ, a_ℓ² ≠ ε(ℓ)) and the local forms R20.3/local-form-of-ordinary-eigenforms, R20.3/local-form-of-supersingular-eigenforms. All four are cited as nodes; the request records the exact case used.

Consumers:

- `ClassicalSerreModularity:R27.6/unramified-residual-representations-arise-in-weight-one`

Additional request metadata: {"note": "SerreWeightAndLevelOptimisation's packet is not yet reviewed."}

### SerreWeightAndLevelOptimisation:R20.5

**R26.1 request 16** — status `open`.

Export exact-weight/exact-level dihedral modularity from R17 existence and the R20.2–R20.4 optimisation contracts. This is the weight/level component of the stable mixed source alias.

Consumers:

- `ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement`
- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`

### SerreWeightAndLevelOptimisation:R20.6

**R26.1 request 6** — status `open`.

Ribet's level lowering and Edixhoven's weight optimisation: modular of some weight and level ⇒ modular of weight k(ρ̄) and level N(ρ̄). For the solvable-image branch of R26.2/minimal-weight-two-lift, also supply the Gross–Edixhoven ordinary weight-two realisation in S₂(Γ₁(N)∩Γ₀(p),ω_p^(k−2)) of an ordinary residual eigenform of normalized weight k, including the k=2 and k=p+1 local lift distinctions.

Consumers:

- `ClassicalSerreModularity:R26.6/level-one-proof-assembly`
- `ClassicalSerreModularity:R26.5/terminal-row-branch-contract`
- `ClassicalSerreModularity:R26.2/minimal-weight-two-lift`

Additional request metadata: {"note": "Stage prerequisite; the supplier roadmap is SerreWeightAndLevelOptimisation."}

**R27.3 request 10** — status `open`.

The optimisation "modular ⇒ arises from S_{k(ρ̄)}(Γ₁(N(ρ̄)))" for p = 2 and k(ρ̄) = 4 (from weight 2 at level 2N(ρ̄), Steinberg at 2, to weight 4 at level N(ρ̄); Buzzard's level lowering), which KW I Theorem 5.1(1) cannot reach.

Consumers:

- `ClassicalSerreModularity:R27.6/full-classical-serre-theorem`

**R33.5 request 2** — status `open`.

The optimisation for p = 2 and k(ρ̄) = 4 (weight 2 at level 2N(ρ̄), Steinberg at 2, to weight 4 at level N(ρ̄)), used by both routes to the strong form.

Consumers:

- `ClassicalSerreModularity:R33.6/strong-form-by-the-modern-route`

### SmallRamificationAndAbelianVarietyBaseCases:R25.5

**R26.1 request 18** — status `open`.

Export the GL2-type abelian-variety realisation and reduction contract needed for the q=2 application of published KW Annals Theorem4.2(ii)/5.2(ii): after a semistable weight-two minimal lift/system with absolutely irreducible cyclotomic restriction, obtain dim A=[E:Q]≥1, good reduction outside 2 and semistable reduction at 2. Use the existing GL2-type, descent/Snowden realisation and reduction nodes; verify the local and coefficient hypotheses for p=3 as well. The conductor-two residual theorem is an R26.6 application of this contract and R25.4/Schoof, not a pre-existing R25 target.

Consumers:

- `ClassicalSerreModularity:R26.6/corollary-1-2-proof`

### tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev

**R27.3 request 12** — status `open`.

Required upstream input for KW I Lemma 8.2/DP Lemma 1.15: hasDirichletDensity_frobeniusPrimeSet for the nonempty conjugacy-class union in the compositum of the projective residual field and cyclotomic field, with density #C/#G and invariance under finite prime removal. Also its split-completely/arithmetic-progression consequence supplies infinitely many p′ ≡ 1 mod 4 split in the coefficient field (KW I §8.4). This is the existing Chebotarev Layer 10 contract, not a new implemented library declaration. For KW I Corollary 10.2(ii): the density |C|/|G| of the primes with Frobenius in a conjugacy class C of the finite Galois group cut out by an Artin representation, and the consequence that every element of that group is a Frobenius at a prime outside any finite set.

Consumers:

- `ClassicalSerreModularity:R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`
- `ClassicalSerreModularity:R27.4/auxiliary-characteristic-choice`
- `ClassicalSerreModularity:R27.6/artin-reductions-of-serre-type`
- `ClassicalSerreModularity:R27.6/weight-one-descent-from-infinitely-many-primes`

### tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor

**R27.3 request 18** — status `open`.

Newforms in weight one for Γ₁(N′) with character: a nonzero cusp form of weight one, level N′ and character ε that is an eigenvector of T_r for every prime r ∤ N′ has the eigenvalues of a unique normalised newform of level dividing N′ (strong multiplicity one), whose character agrees with ε on the integers prime to N′. This is the existing Layer 4 contract of Tau Ceti's ModularForms roadmap, in weight one.

Consumers:

- `ClassicalSerreModularity:R27.6/weight-one-descent-from-infinitely-many-primes`

## Remaining gaps by part

All 11 input gaps remain. Their source/supplier actions are needed to close the proof plan, not to join the documents. None is claimed resolved by successful JSON or Lean checks.

### R26.1 gap 1: Edition discrepancy in the level-one source

Verified: arXiv:math/0504080v1 (5 April 2005) is titled 'On Serre's modularity conjecture for 2-dimensional mod p representations of Gal(Qbar/Q) unramified outside p'. It was published as 'Serre's modularity conjecture: the level one case', Duke Math. J. 134 (2006), 557-589. Not verified: whether the numbering of results is the same in the two versions; all locators in this packet are to the preprint. Next source action: if Duke pagination is required downstream, obtain the published version and re-map Theorem 1.1, Corollaries 1.2, 1.3 and Propositions 2.1, 2.2.

Consumers:

- `ClassicalSerreModularity:R26.1/level-one-theorem-and-the-meaning-of-arises-from`
- `ClassicalSerreModularity:R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof`

### R26.1 gap 2: KW I's corrected references to Khare's level-one paper use numbering absent from the arXiv preprint

Verified (reviewer): KW I's bibliography gives [24] = Khare, 'Serre's modularity conjecture: the level one case', Duke Math. J. 134 (2006); the proof of Corollary 8.1(i) cites '3 of Theorem 5.1 of [24]' (as insufficient) and '(2) of Theorem 6.1 of [24]' (as the correct input), and 1.2 relates KW I Theorems 4.1 and 5.1 to Theorems 6.1 and 5.1 of [24]. The copy read, arXiv:math/0504080v1, has no Theorem 5.1 or 6.1 (its compatible-system result is Proposition 3.1 and its section 6 is the proof of Theorem 1.1). The drafter's reading 'Theorem 6.1(2) of the Annals paper' confused [24] with [22]. Next source action: obtain the published Duke version of Khare's paper and locate Theorems 5.1 and 6.1.

Consumers:

- `ClassicalSerreModularity:R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof`

### R26.1 gap 3: Skinner's correction to Skinner–Wiles 2001 (KW I's [41]) is unpublished

Verified: KW I (preprint pp. 3 and 16) augment their Skinner–Wiles references [39] (1999) and [40] (2001) by [41] = C. Skinner, 'Nearly ordinary deformations of residually dihedral representations' ('to appear'), 'which is a correction to [40]'; Allen (arXiv:1301.1113) lists it as a 2009 preprint. It was not obtained. It bears on the residually dihedral branches of Khare's argument (ρ̄ induced from ℚ(√((−1)^{(p−1)/2}p))), which OrdinaryAutomorphicFormsAndModularityLifting R21.5 plans with the dihedral CM case excluded (its source issue E11). For p ≡ 1 mod 4 the field is real and the plan applies; for p ≡ 3 mod 4 the branch waits on E11.

Consumers:

- `ClassicalSerreModularity:R26.4/level-one-lifting-lemma`
- `ClassicalSerreModularity:R26.4/degenerate-branches`
- `ClassicalSerreModularity:R26.6/corollary-1-2-proof`
- `ClassicalSerreModularity:R26.1/corollary-1-2-conductor-a-prime-and-its-corrected-proof`

### R26.1 gap 4: Explicit prime-counting proof and omitted integral-classification calculations

Read Rosser–Schoenfeld p.69 exact statements, not its analytic proof or finite verification tables; a formal proof must cover both. Independently checked the resulting finite auxiliary-prime applications for all 2,422 primes 5≤p≤21591, with largest selected P=21599. Breuil–Mézard §6.1 Proposition 6.1.1 has now been obtained and read with its odd-prime, nonscalar type, HT {0,1} and arbitrary-lattice hypotheses. Its introduction to §6 omits computation details; R07.5 must supply those integral proofs, alongside the read Savitt v3 Theorem 6.11/Corollary 6.15/Remark 6.17. The earlier source-access gap is resolved, not the integral supplier proof obligation.

Consumers:

- `ClassicalSerreModularity:R26.3/explicit-prime-counting-input`
- `ClassicalSerreModularity:R26.4/local-reducibility-ordinary`

### R26.1 gap 5: Canonical suggested Lean interfaces absent at the pin

Pinned libraries contain matrix GL2 and cusp-form carriers but not the assembled residual G_Q representation with actual Artin conductor, classical Serre weight and attached-newform residual modularity witness. Suggested Lean states the full good-dihedral matrix predicate with explicitly supplied inertia and conductor parameters and its expressible API/tests, and the arithmetic theorem signatures. Canonical specialization, q²-conductor theorem, HypL/HypW/HypD and representation-valued headline signatures are omitted with a name-by-name ledger; never replace these missing objects with arbitrary proposition fields.

Consumers:

- `ClassicalSerreModularity:R27.1/good-dihedral-prime-definition`
- `ClassicalSerreModularity:R27.2/hypotheses-Lr-Wr-and-Dr`
- `ClassicalSerreModularity:R26.1/level-one-theorem-and-the-meaning-of-arises-from`
- `ClassicalSerreModularity:R27.2/theorem-3-2-weight-reduction`

### R26.1 gap 6: Stage-graph split requires maintainer application

Current R27.1 inherits R26.6, so node-level early-prefix independence does not remove the stage path to R33.2–R33.5. The packet’s explicit R27.1a/R27.1b rescope proposal must replace the base requires and RS-06 source endpoints; adding links alone cannot fix it. The Chebotarev/insertion nodes are preserved in the sibling R27.3 packet. Verify no R26.x ancestor of R33.1–R33.5 after application; until then this structural target is planned, not closed.

Consumers:

- `ClassicalSerreModularity:R27.1/good-dihedral-prime-definition`
- `ClassicalSerreModularity:R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`

### R27.3 gap 1: DP Theorem 1.7: the second hypothesis and its check in Paso 6

Verified: the page image of DP p. 4 prints "ρ|_{D₃} ≠ (1 0; 0 1)" without a bar and Paso 6 says "Since Serre's weight is not 3, the image of ρ̃₃|_{D₃} is non-trivial". Not verified: the hypothesis of Skinner–Wiles (1999) that this bullet transcribes. For ρ̄^{ss} ≅ 1 ⊕ χ₃ the restriction to D₃ is never trivial (χ̄₃ is ramified at 3), so the printed bullet, read residually, holds automatically; the intended condition may be p-distinguishedness or non-splitness. The branch itself is SmallRamificationAndAbelianVarietyBaseCases R25.5/paso-six-terminal-cases (which rests on OrdinaryAutomorphicFormsAndModularityLifting R21.5). Next source action: read the main theorem of Skinner–Wiles, Residually reducible representations and modular forms (Publ. IHÉS 89), and match it.

Consumers:

- `ClassicalSerreModularity:R33.4/dp-terminal-characteristic-five-and-the-schoof-base-case`
- `ClassicalSerreModularity:R33.1/dp-modularity-lifting-inputs`

### R27.3 gap 2: Imported lifting and lift-existence theorems were not read in their primary sources

Verified: DP's statements of Theorems 1.3–1.7, 1.9 and 1.11 and their attributions (Kisin; Emerton; Paškūnas; Hu–Tan; Tung; Skinner–Wiles; Pan; Gee; Snowden; Dieulefait 2004; Berger–Li–Zhu). Not verified: those papers. Under RS-06 they are owned by GL2ModularityLifting R32.5–R32.6, PotentialModularityAndCompatibleSystems R24.3–R24.6 and SmallRamificationAndAbelianVarietyBaseCases R25.5; the requests name the exact forms used here.

Consumers:

- `ClassicalSerreModularity:R33.1/dp-modularity-lifting-inputs`
- `ClassicalSerreModularity:R33.2/dp-lift-existence-and-good-dihedral-insertion`
- `ClassicalSerreModularity:R33.4/dp-terminal-characteristic-five-and-the-schoof-base-case`

### R27.3 gap 3: KW I Theorems 4.1 and 5.1 are used as stated; their proofs are in KW II

Verified: the statements of Theorems 4.1 and 5.1 (KW I pp. 6–10) and KW II's contents and §8.2 (residual conditions (α), (β)); for Theorem 4.1 also KW II §10.2 (p. 92), which derives it from Theorem 9.7, the weight part of Serre's conjecture and cited cases, with no use of Theorem 6.1 or Theorem 10.1. Theorem 4.1 is a pair of declarations of GL2ModularityLifting, R22.5/kw-i-theorem-4-1-odd-prime and R22.6/kw-i-theorem-4-1-dyadic, which the four consumers here cite directly; the request to PotentialModularityAndCompatibleSystems R24.4 is withdrawn. The four consumers apply it to members of weight-two systems (crystalline of weight 2, or potentially semistable of weight 2) and to minimal lifts crystalline of weight k(ρ̄); none is in the case k = p + 1 with k(ρ̄) = 2 that R22.5 leaves as a gap. PotentialModularityAndCompatibleSystems R24.4 is a consumer layer with a node R24.4/kw-theorem-4-1 that binds the same export, and two nodes of part R26.1 cite it (R26.6/corollary-8-1-ii-and-the-statement-W1 and R27.2/theorem-3-2-weight-reduction); citing the R22.5/R22.6 nodes directly, as here, keeps a consumer independent of R23 and R24.1–R24.3. Not verified: KW II §10.3, which proves Theorem 5.1; it is supplied by PotentialModularityAndCompatibleSystems R24.3 and R24.6 (requested).

Consumers:

- `ClassicalSerreModularity:R27.3/theorem-3-1-killing-ramification`
- `ClassicalSerreModularity:R27.4/theorem-3-4-raising-levels-and-the-chebotarev-choice`
- `ClassicalSerreModularity:R27.4/strong-form-by-minimal-lifts`
- `ClassicalSerreModularity:R27.5/d1-by-the-prime-three`
- `ClassicalSerreModularity:R27.5/dr-for-r-at-least-two`

### R27.3 gap 4: Primary sources of the weight-one descent were not read

Verified: KW I's sketch of Theorem 10.1 (p. 20) and Corollary 10.2 with §10.2 (p. 21); Maschke's theorem at the pinned Mathlib; and the supplier statements as their packets record them: Edixhoven's Theorem 4.5 with its note on the exceptional case and Gross's companion forms (SerreWeightAndLevelOptimisation R20.3), the reduction-image criterion and finite generation (AlgebraicModularFormsAndSerreWeights R15.2), the Deligne–Serre lifting lemma (R15.5) and the Deligne–Serre representation (AutomorphicGaloisRepresentations R19.1). Not verified: Khare, Remarks on mod p forms of weight one (Internat. Math. Res. Notices 1997, no. 3, 127–133; corrigendum 1999, no. 18), which KW I cite for the argument and which is not freely available; Gross's and Coleman–Voloch's papers themselves. In particular the form of R27.6/unramified-residual-representations-arise-in-weight-one without a hypothesis on Frobenius, which ModularityAndLanglandsExtensions ML.1 needs and no node here uses, rests on Coleman–Voloch only through the supplier's record of Edixhoven's note. The number-field model, the reductions and the descent are now declarations of this layer (R27.6/artin-reductions-of-serre-type, R27.6/unramified-residual-representations-arise-in-weight-one, R27.6/weight-one-reduction-is-onto-for-almost-all-primes, R27.6/weight-one-descent-from-infinitely-many-primes), and the descent is proved from its listed prerequisites without the unread note. Next source action: compare the descent node with Khare's note and its corrigendum when a copy is available.

Consumers:

- `ClassicalSerreModularity:R27.6/unramified-residual-representations-arise-in-weight-one`
- `ClassicalSerreModularity:R27.6/weight-one-descent-from-infinitely-many-primes`
- `ClassicalSerreModularity:R27.6/odd-artin-weight-one-modularity`

### R33.5 gap 1: Unresolved globalisation inputs of the existing R32.6 audit

The current partial, unreviewed GL2ModularityLifting:R32.6/globalisation-dependency-audit (packets/GL2ModularityLifting--R32.3.json) supplies the checked Kisin/Hu–Tan/Tung residual-modularity forms and the exclusions for Pan/Emerton forms that use Serre’s conjecture. It explicitly leaves Tung’s global Breuil–Mézard inputs ([CEG+16] patching, Emerton–Paškūnas faithfulness, BLGG13 Theorem A.4.1) and Gee’s Theorem 4.4.12 unaudited, requested there from R31.6/R20.6. Those requirements remain open here; so does any independent unaudited lift/system input. Exact references to R24.3 lift nodes, R24.5 system-existence nodes and R24.6 modularity transfer clarify ownership without certifying those partial suppliers. The qualitative route’s recorded ClassicalSerreModularity closure avoids R26 and R27.2–R27.6; full source-level independence is still conditional.

Consumers:

- `ClassicalSerreModularity:R33.5/globalisation-dependency-check`
- `ClassicalSerreModularity:R33.5/qualitative-serre-theorem`

## Source provenance and pending re-reviews

Source versions, hashes, short matching excerpts and independent issue verdicts remain in the three packets. The assembly introduces no new source issue and does not claim the unread Duke, Inventiones, Skinner or early weight-one editions were compared. The current reader uses the corrected arXiv/author-copy statements and marks those edition boundaries. The parts’ own source-read dates describe their extraction and review passes, not a claim that this assembly reread all their external supplier proofs.

The assembly’s independent review should compare the full reader with the current 81 packet nodes, particularly the R26.1 review corrections and later R27.6 descent additions. The two component-reference repairs should be checked against the integrated R01.4 statement. Supplier gaps and the R27.1 atlas stage repair remain with their owners/maintainer; verdicts can change only through independent review. There is no checkpoint handoff or additional assembly work pending.

## Submission routing

The current [queue entry](../queue.json) lists only the full reader, full suggested file and this handoff as outputs. Issue #219’s full instructions explicitly permit edits to the three listed part packets when reconciling prerequisites. This PR therefore includes the authorized R33.5 reference repairs. The local `intake.auto_refusals` preflight reports that packet as outside the queue’s output list, although all four files pass `intake.py check-files` and the packet checker. Automatic intake may leave the PR for the maintainer for this metadata mismatch. The queue and intake rules are outside this job’s editable files and have not been changed; the maintainer can reconcile the allowlist with the issue instructions before intake.
