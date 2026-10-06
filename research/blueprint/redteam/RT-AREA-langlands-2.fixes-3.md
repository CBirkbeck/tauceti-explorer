# Fix report: RT-AREA-langlands-2, third round

Job FIX-RT-AREA-langlands-2~3, Refs #5870. Worker: Claude — claude-c9TlsS. Date: 6 October 2026.
Base tree: origin/main at `4e8e1306`. The bot confirmed this session's claim before work began. This session wrote,
reviewed and red-teamed none of the earlier rounds.

Round 2 was sent back by `research/blueprint/reviews/REV-FIX-RT-AREA-langlands-2~2.md`, which lists five next actions.
This round does the parts of them that lie in the three blueprints this job may edit, and says exactly what is left
for the maintainer and for other jobs. It edits this report and the packet, reader and suggested file of
ClassicalSerreModularity--R27.3, GL2ModularityLifting--R22.1 and GlobalGaloisDeformations, and nothing else. The
`review` objects of the three packets are untouched; REV-FIX-RT-AREA-langlands-2~3 checks this round.

Two of the three packets changed after the round-2 review, through other fix jobs: ClassicalSerreModularity--R27.3
(FIX-RT-BP-ClassicalSerreModularity--R27.3, merged 6 October) and GlobalGaloisDeformations
(FIX-RT-BP-GlobalGaloisDeformations, merged 2 October, its review #5720 still open). This round builds on those
versions and keeps their changes.

## What the round-2 review asked for, and what was done

| Review action | Done here | Left for others |
| --- | --- | --- |
| 1. Early good-dihedral component; remove R26.6 → R27.1; re-point the modern route (/1) | Restructure entry proposing R27.1a and R27.1b, in the terms of part R26.1's entry; Lemma 8.2 has its Chebotarev and Dickson prerequisites; the nodes of R33.1–R33.4 and GL2ModularityLifting R32.1 no longer cite the KW I §6 node of R27.1. At declaration level no node of R33.1–R33.4 has an ancestor in R26, R27.1b or R27.2–R27.6. | The stage edit itself: a packet can only add links. Exact edits are in "For the maintainer". |
| 2. Artin number-field model, lattice, reductions and weight-one descent with early owners (/8) | Four new declarations in R27.6 give the whole proof of KW I Corollary 10.2(ii) from layers that precede R27.6. Nothing is imported from ML.1. | ML.1's packet imports them for Theorem 10.1(ii) and registers the export. |
| 3. Early field and character supplier; typed §8 definitions (/13, /26) | `allowable-base-change-existence` and `alpha-beta-under-allowable-base-change` in R22.1; Clozel–Harris–Taylor's Lemmas 4.1.1–4.1.2 requested from PotentialModularityAndCompatibleSystems R23.1 with their exact statements; the gap on the field supplier is closed. The suggested file has typed forms of the §7.6/§8 definitions, with every API item and test, elaborating at the pinned Mathlib. | The two CHT lemmas are for the R23.1 packet to plan (finding /26 assigns them there). |
| 4. /12 and /22 handoffs; the two coarse back-edges | KW I Theorem 4.1 is an output of R22.5 and R22.6 and its ClassicalSerreModularity consumers cite it there. Both back-edges are removed: the determinant comparison is divided between R04.1 and R04.2, and the Theorem 1.4 contract of R32.2 no longer imports a node of R33.3. | R24.4's stage text and the RS-08 keeps (/12); the stage links L7, L8, G8 → PA.3 (/22). |
| 5. Global reader: #T − 1 | Already corrected in the reader by the fix of 2 October (the constant is `#T − 1`); checked, unchanged. | — |

## Packet changes

| Packet | Nodes | Open requests | Gaps | Checker |
| --- | --- | --- | --- | --- |
| ClassicalSerreModularity--R27.3 | 33 → 37 | 17 → 19 | 5 → 4 | 0 errors, 0 warnings |
| GL2ModularityLifting--R22.1 | 68 → 73 | 21 → 25 | 17 → 16 | 0 errors, 0 warnings |
| GlobalGaloisDeformations | 66 → 67 | 19 → 19 | 1 → 0 | 0 errors, 0 warnings |

No node id is deleted or renamed. No source-issue record is changed, and this round adds none. Every
implementation status stays `unchecked`. All three packets stay `partial`.

## The repairs in the three blueprints

### /1. Good-dihedral declarations and the modern route (ClassicalSerreModularity)

The finding is about a stage edge: R27.1 requires R26.6, and RS-06's links R27.1 → R33.2, R33.3, R33.6 therefore put
Khare's level-one proof above the modern strand. Promotion derives links from prerequisites and never removes one
(`scripts/blueprints.py`, `merge_blueprints`), and it derives none between two layers of one roadmap. So the repair has
two parts.

*In the packet.* Part R26.1, written and reviewed since round 2, owns Definition 2.1 and Lemma 6.3 with prerequisites
in R01.4, R01.5, R15.4 and R24.6/residual-members, and proposes sub-layers R27.1a and R27.1b. This packet now has the
matching restructure entry, with the nodes of each sub-layer, their requirements and the stage edits. Lemma 8.2 lists
its real prerequisites: R01.4/dickson-classification-and-the-dyadic-refinement, R01.3, R01.4 and Tau Ceti's Chebotarev
Layer 10 (the checker now accepts a Tau Ceti layer as a stage prerequisite). Two nodes of R33.1 cited the mixed KW I §6
node `R27.1/dickson-and-the-dyadic-solvable-refinement`; they now cite its component owners, Dickson's classification
in R01.4 and Lemma 6.2(ii) in R15.4 with R01.4. In GL2ModularityLifting, R32.1/quadratic-cyclotomic-irreducibility had
the same citation, which would have produced a link R27.1 → R32.1 on promotion; it now cites R01.4.

*Computed.* Following prerequisites through every packet and integrated decomposition (23,460 declarations in the
registry, 948 reachable from the 177 nodes of the three packets, no cycle): no node of R33.1–R33.4 has among its
ancestors a declaration of R26, the two R27.1b declarations, or a declaration of R27.2–R27.6. On the stage graph
(data/atlas.json with the accepted restructuring links and the link maps), R33.2–R33.5 have R26.1–R26.6 as ancestors
today; after deleting the one edge R26.6 → R27.1 none of R33.1–R33.5 has, and R33.6 keeps them through R27.4 and
R27.6. That is the finding's acceptance test. Part R26.1 also gives a reason the edge is wrong, beyond the modern
route: its node R26.6/corollary-8-1-ii-and-the-statement-W1 has Definition 2.1 as a prerequisite, so declarations of
R26.6 use R27.1, not the reverse.

*Not done.* The stage edge stands until the maintainer applies the restructure entry. This part of the finding is
therefore still open, and I do not claim otherwise. Round 2's gap on it is removed: no mathematical input is missing,
and the restructure entry is the protocol's place for a proposed stage change. Part R33.5 (not a deliverable here) has
two nodes that still cite the mixed KW I §6 node; the restructure entry says how to treat them.

### /8. Corollary 10.2(ii) is proved in R27.6 (ClassicalSerreModularity)

Round 2 exported the statement and left the proof as a gap, with the weight-one descent attributed to ML.1. KW I
give the argument in one sentence (p. 20), citing Khare's note, Gross, Coleman–Voloch and Edixhoven. The proof is now
planned in R27.6:

1. `artin-reductions-of-serre-type` (lemma). A number-field model and stable lattices; for ℓ ∤ |G| the reduction is
   absolutely irreducible, odd and faithful, and invariants of every subgroup have the same dimension, so the
   conductor is unchanged; for ℓ ∤ N it is unramified at ℓ with Serre weight ℓ and Edixhoven weight 1; and the primes ℓ
   whose Frobenius is conjugate to complex conjugation have positive density, with Frobenius eigenvalues 1 and −1.
   Irreducibility is proved from the endomorphism ring and Maschke's theorem
   (`mathlib:MonoidAlgebra.Submodule.exists_isCompl`, read at the pinned commit; the packet's first baseline
   declaration).
2. `unramified-residual-representations-arise-in-weight-one` (theorem). The strong form gives a newform of weight ℓ and
   level N; Edixhoven's theorem, in its non-exceptional case, gives a Katz eigenform of weight one with the same
   eigenvalues away from ℓ. The node checks the hypothesis a_ℓ² ≠ ε(ℓ) of Gross's companion-form theorem from the
   distinct Frobenius eigenvalues. It also states the form without a hypothesis on Frobenius, which holds for ℓ > 2 by
   the form of Edixhoven's theorem that SerreWeightAndLevelOptimisation R20.3 records from Coleman–Voloch. The Artin
   case uses only the first form.
3. `weight-one-reduction-is-onto-for-almost-all-primes` (lemma). H¹(X₁(N), ω(−cusps)) is finitely generated over
   ℤ[1/N], so its torsion is finite, and for ℓ outside a finite set every Katz cusp form of weight one modulo ℓ is a
   reduction.
4. `weight-one-descent-from-infinitely-many-primes` (theorem, planet "Khare's weight-one descent"). Deligne–Serre
   lifting, finitely many eigensystems in characteristic zero, pigeonhole, and a nonzero algebraic number has finitely
   many prime divisors. Stated for a family t_r, without ρ, so that ML.1 can use it for a general irregular system.
5. `odd-artin-weight-one-modularity` now has these three steps as its proof and the corresponding prerequisites.

All suppliers are ancestors of R27.6 already: R01.1, R01.3, R01.5, R15.1, R15.2, R15.4, R15.5, R15.6, R19.1, R20.3 and
Tau Ceti's Chebotarev Layer 10 and ModularForms Layer 4. Supplier nodes that did not exist at round 2 are cited by id
(for instance R20.3/edixhoven-weight-theorem, R20.3/companion-forms, R15.5/deligne-serre-eigenvalue-lifting-lemma,
R19.1/weight-one-artin-representation). Three requests are added for what the suppliers do not yet state (finite
generation of H¹ at R15.2, the exact case of Edixhoven's theorem at R20.3, newforms of weight one at Tau Ceti's
ModularForms Layer 4), and the Chebotarev request is extended. The scope node now says that ML.1 states
Theorem 10.1(ii) for general systems and imports the weight-one step and the descent from R27.6. ML.1 adds
Sen–Fontaine and the irreducibility of almost all reductions, and it needs the weight-one step without the hypothesis
on Frobenius: for a general system distinct eigenvalues cannot be arranged before the image is known to be finite.

What is not verified: Khare's note [21] of KW I (IMRN 1997, corrigendum 1999) is not freely available and was not
read, nor were Gross's and Coleman–Voloch's papers. The descent node is proved from its listed prerequisites and does
not depend on the unread note; the gap "Primary sources of the weight-one descent were not read" records the
comparison still to make. The supplier statements are used as their packets record them, and the R19 and R20 packets
are not yet reviewed. R27.6's coverage is `planned`.

### /13 and /26. The field supplier of KW II §8 (GL2ModularityLifting)

Round 2 recorded a gap, on the ground that importing R23.1 "would put potential modularity before its lifting input".
On the stage graph that is not so. R23.1 (Moret-Bailly's theorem) requires only AlgebraicModuliForArithmeticGeometry
R09.3; with the accepted restructuring links and the link maps it has 16 ancestors, none in GL2ModularityLifting, and
it is not a descendant of R22.1. The layers of PotentialModularityAndCompatibleSystems that use lifting theorems are
R23.4 and later. So the link R23.1 → R22.1 is acyclic, and the build dry run below adds it without skipping it.

The confirmed finding /26 assigns Clozel–Harris–Taylor's Lemmas 4.1.1–4.1.2 to R23.1. The R23.1 packet has not planned
them yet. Following PROTOCOL §3, this packet cites the stage R23.1 and adds a request with both statements as printed
(published version, pp. 116–117, read for this round) and two refinements: the p-primary component of the global
character, and total reality when the real places are prescribed. What is special to KW II is planned in R22.1 itself:

- `allowable-base-change` (definition) now says what "soluble" means: a tower of Galois steps with soluble groups. KW II
  need this: the field F_r in the proof of Theorem 8.4 is a tower of quadratic extensions, not Galois over F, and base
  change is applied one cyclic step at a time. Two API items and one test are added, and the tests are statements about
  the predicate.
- `allowable-base-change-existence` (lemma, new): for prescribed finite Galois completions at a finite set of places
  (unramified above p, trivial above p when ρ̄|D_p is irreducible) and a finite extension L, there is a soluble Galois
  F′/F, totally real, of even degree, with those completions, linearly disjoint from L and from the field cut out by ρ̄
  and μ_p; so it is allowable. Evenness comes from one auxiliary place. A last clause gives a quadratic F′ when every
  prescribed completion has degree at most 2, by weak approximation and one place split in the field to avoid. The
  proof of Theorem 8.4 needs it: its tower consists of extensions of degree exactly 2 (KW II p. 77), and Lemma 4.1.2
  controls completions, not the global degree.
- `alpha-beta-under-allowable-base-change` (lemma, new): the witnesses of (α) and (β) base-change to witnesses.
- Lemma 8.1, Lemma 7.10, Theorem 8.2, the level-raising step, Theorem 8.4 and R22.5/solvable-base-change-reduction cite
  these. Lemma 8.1 has a proof (KW II omit it). Lemma 7.10's dyadic case is written out with Lemma 4.1.1 and global class
  field theory (Tau Ceti ClassFieldTheory Layer 12, requested). KW II invoke Grunwald–Wang there; the argument needs
  only local characters of 2-power order extended to a global character of 2-power order, so the special case of
  Grunwald–Wang does not arise.

The gap "Early soluble field and character selection supplier" is removed. Taylor's Lemma 2.2, which KW II cite for the
field, was not read; the node says so.

### /12. KW I Theorem 4.1 (GL2ModularityLifting, ClassicalSerreModularity)

The finding's fix is to make Theorem 4.1(2) an output of R22.5 and 4.1(1) an output of R22.6. Round 2 changed a
sentence. This round adds the declarations: `R22.5/alpha-beta-from-modularity-over-q` (from "ρ̄ modular" to (α), (β),
by the weight part of Serre's conjecture and base change), `R22.5/kw-i-theorem-4-1-odd-prime` and
`R22.6/kw-i-theorem-4-1-dyadic`, each with the case analysis of KW II §10.2 and its Remark. The four consumers in
ClassicalSerreModularity (Theorem 3.1, Theorem 3.4, the strong form by minimal lifts, (D₁)) cite them, and the request
to R24.4 is withdrawn. On the prerequisite graph the two theorem nodes have one ancestor in
PotentialModularityAndCompatibleSystems, the stage R23.1 of the field supplier.

Case (2)(ii) is covered completely: a potentially crystalline lift of weight 2 is potentially Barsotti–Tate
(Kisin's theorem, already a node), and a lift whose Weil–Deligne representation has N ≠ 0 becomes of type (C) after a
twist by a Dirichlet character of p-power conductor. KW II do not print that reduction.

Two honest limits. First, a new gap, "One case of KW I Theorem 4.1(2) is taken from an unread paper": for k = p + 1
with k(ρ̄) = 2 and a lift non-ordinary at p, KW II cite Kisin's Durham paper, which is neither planned nor read. The
four consumers in ClassicalSerreModularity part R27.3 do not use that case (they apply the theorem to members of
weight-two systems and to minimal lifts of weight k(ρ̄)); the gap in that packet says so. Second, the packet
PotentialModularityAndCompatibleSystems--R24.3, completed on 6 October while this round was under way (#6718), treats
R24.4 as a consumer layer: its nodes `R24.4/kw-theorem-4-1` and `R24.4/alpha-beta-from-residual-modularity` restate the
statements, and it requests the full Theorem 4.1(2) from R22.5. The new nodes are that export, except for the gap
case. Those two nodes still cite Theorem 9.7 and not the export nodes, and two nodes of ClassicalSerreModularity part
R26.1 cite `R24.4/kw-theorem-4-1`. The GL2 packet has a `restructure` entry (rescope) recording what remains; those
edits belong to the other packets' jobs and to the maintainer.

### The two back-edges of the round-2 review

*R04.1 → R04.2 (GlobalGaloisDeformations).* `R04.1/determinant-comparison` cited Carayol's theorem of R04.2. It now
states the determinant map and its non-injectivity for reducible ρ̄, which is what R04.1's target asks for (the
non-injectivity is measured in Ext¹(χ₂, χ₁) modulo the line of the class of ρ̄, and the proof step says so). The
isomorphism for absolutely irreducible ρ̄ is the new `R04.2/determinant-comparison-isomorphism`, with Chenevier's
Theorem 2.22(i) and Carayol's theorem. The gap is closed and R04.1 is `source_decomposed`.

*R32.2 → R33.3 (GL2ModularityLifting).* `R32.2/application-requirements` was a check of the hypotheses of Theorem 1.4
at each use in Dieulefait–Pacetti, and cited the node of R33.3 where one use occurs. It is now the contract that an
application must verify, with the list of uses as locators, and has no prerequisite in ClassicalSerreModularity. The
consumer, `R33.1/dp-modularity-lifting-inputs`, cites the theorem node and the contract. The build dry run reports no
skipped link for any of the three roadmaps.

### Unchanged from round 2, and checked

/15 (the request to R01.4 names KW II Lemma 4.3(2)(ii) and (5), and R01.4 is a prerequisite of the R04.5 nodes), /19
(R22.2 applies R18.3's freeness and twists), /20 (R27.5 imports R22.6/hypothesis-h), /22 (the G8 nodes name PA.3 as
consumer; `consumerContracts` records the contract), /37 (Lemma 4.4, Lemma 4.6, Proposition 4.5; Corollary 4.7 with
R24.2) and /39 (the R33.2 node is Paso 2 only, with R24.3 and Paso 1 as prerequisites). I read each in the current
packets and changed nothing.

One small correction outside the findings: three `sourceVersions` entries of the Global packet, added on 2 October,
had `kind: "selective fix rereading"`, which `scripts/check_errata.py` rejects. They are now `preprint` or
`author copy`, with the original label kept in the note.

## Suggested Lean files

The round-2 review found that the new definitions were comment sketches with undeclared types. All three files were
elaborated for this round with `lean-check` (a single `lake env lean` in an existing build at the pinned Mathlib
`082e2d3`; no language server, no `lake build`). They import Mathlib only; Tau Ceti is not imported, because the
build that exists is not at the Tau Ceti pin. Nothing is formalised: every statement of a node is proved by `sorry`,
and one-line consequences of definitions and two group-theoretic lemmas have proofs.

| File | Errors | Warnings |
| --- | --- | --- |
| `suggested/GL2ModularityLifting--R22.1.lean` | 0 | 13, all `declaration uses sorry` (6 stand-ins without a body, 7 theorems) |
| `suggested/ClassicalSerreModularity--R27.3.lean` | 0 | 23, all `declaration uses sorry` (12 stand-ins, 11 theorems) |
| `suggested/GlobalGaloisDeformations.lean` | 0 | 18, all `declaration uses sorry` (as before this round; only the comment sketch of the determinant comparison changed) |

Both larger files gain an "Imported interfaces" section, in the form of the reviewed precedent in
`suggested/FaltingsFinitenessAndIsogenyTheorems.lean`. A notion Mathlib can state is a definition built from Mathlib
(decomposition and inertia groups of valuation subrings, Frobenius elements, absolute irreducibility in Burnside's
form, ramification index and residue degree). An object another roadmap owns is a data type or a function without a
body (cuspidal automorphic representations with weight, conductor exponent and residual representation; Katz cusp
forms with their operators; newforms of weight one with the Deligne–Serre representation; the Artin conductor;
Serre's weight). No condition is a proposition without a body, and there is no axiom.

**GL2ModularityLifting.** Typed, with every API item and unit test of the packet under its packet name:
`allowable-base-change` (`KW.AllowableBaseChange`, with `KW.IsSolubleTower` for the tower notion and
`KW.StandingHypotheses` for §7.6.2), `determinant-character-kinds` (`KW.IsKindI`, `KW.IsKindII`, `KW.IsKindIII` on the
restriction of the given character to the units above p, with the norm and Teichmüller characters as data), and (α),
(β) (`ResidualModularAlpha`, `ResidualModularBeta` with their witness predicates). Stated as theorems:
`KW.allowableBaseChange_exists` and `KW.allowableBaseChange_exists_quadratic` (degree 2, split at one set of places and inert at another), the two transport theorems, `KW.exists_initial_field` (Lemma 8.1),
`residualModular_of_modular`, and the odd-p branch of Lemma 7.10 for characters of an abstract group (proved).
What the statements leave out, as their docstrings say: prescribed nontrivial completions (only splitting at a finite
set of primes is stated) and disjointness from the field cut out by ρ̄, of which the resulting equality of images is
stated; that the new witness is the base change of the old; the Serre-weight clause of Lemma 8.1; the Γ₁(N) form of
the levels in the passage from "ρ̄ modular". Still comment sketches: KW II Theorems 8.2 and 8.4, the dyadic branch of
Lemma 7.10 and KW I Theorem 4.1, whose local conditions at p cannot be stated at the pinned libraries, and the
definitions outside §7.6/§8 (the packet's gap "Typed suggested signatures and tests are incomplete" lists them).

Two modelling points from this work went back into the packet. "ρ̄|D_p irreducible" is absolute irreducibility: read
over the coefficient field, Lemma 8.1 would ask for a field both split at p and making ρ̄ trivial there. And
"soluble" has to be the tower notion for composition to hold.

**ClassicalSerreModularity.** Six nodes that had no Lean statement now have one: Lemma 8.2 (`lemma_8_2`, with positive
Dirichlet density in Mathlib's sense, and `lemma_8_2_trace_eq_zero`); the reductions of an Artin representation
(kernel, invariants, absolute irreducibility, conductor; the number-field model, the weight and the density of P_c are
left out); the weight-one Katz form of an unramified residual representation; the reduction of Katz forms of weight
one; Khare's descent with its Galois corollary; and Corollary 10.2(ii) (`odd_artin_weight_one`). A Galois
representation is a homomorphism on Gal(ℚ̄/ℚ); Frobenius, inertia, complex conjugation and Dirichlet density are
Mathlib's.

The packet's gap "New §8 signatures require the actual field/automorphic supplier types" is removed, and (α), (β) are
taken out of the list of the general typed-API gap.

## Every confirmed finding

The result file has 40 findings and all are confirmed. "Fixed here" means the correction is in the three blueprints of
this job. "Part here" means the in-blueprint part is done and a named part is outside this job's files. "Handed on"
means the finding concerns files this job may not edit; the job that carries it is named as the issue names it, and
nothing is claimed about its state.

| Finding | Disposition | What changed here, or who carries it |
| --- | --- | --- |
| /1 (high) | Part here | Restructure entry R27.1a/R27.1b; Lemma 8.2's prerequisites; R33.1 and R32.1 nodes re-pointed to R01.4 and R15.4; declaration-level independence of R33.1–R33.4 from R26 computed. The stage edge R26.6 → R27.1 and the three RS-06 links are the maintainer's (below). Part R26.1 (BP-ClassicalSerreModularity--R26.1) carries the same proposal for Definition 2.1 and Lemma 6.3. |
| /2 (high) | Handed on | BP-AutomorphicGaloisRepresentations: Taylor's construction and irreducibility for Hilbert forms without a discrete-series place, and the unconditional compatibility at R19.5. The new GL2 nodes cite R19.2, R19.4, R19.5 as stages or requests and do not supply them. |
| /3 (high) | Handed on | BP-PotentialModularityAndCompatibleSystems--R23.1: the full input list of KW II Theorem 6.1 at R23.3. Its Theorem 8.2 input is R22.1/theorem-8-2-minimal-modular-lifts of this job's GL2 packet. |
| /4 | Handed on | BP-GL2AutomorphicRepresentationsAndTransfer--R17.3 and BP-AutomorphicGaloisRepresentations: the base-change inputs of Carayol's construction (R17.4 → R19.2), with the non-normal cubic and dyadic cases kept distinct. |
| /5 | Handed on | BP-AutomorphicGaloisRepresentations: the two-component special fibre in the Eichler–Shimura node of R19.1. |
| /6 | Handed on | BP-AutomorphicGaloisRepresentations: Chenevier's Theorem 2.22(i) over a finite residue field at R19.6. (This job's new R04.2 node uses the same theorem over Artinian rings, through the existing request to IHG.0.) |
| /7 | Handed on | BP-FiniteFlatGroupsAndIntegralPadicHodgeTheory (owner, R07.5) and BP-ClassicalSerreModularity--R26.1 (consumers): Savitt's weight results and Breuil–Mézard 6.1.1. |
| /8 | Part here | Corollary 10.2(ii) is proved in R27.6 by four new declarations; ML.1 is not a prerequisite. BP-ModularityAndLanglandsExtensions narrows ML.1 to a registry over ℚ and cites R27.6/odd-artin-weight-one-modularity, R17.5 and R19.1; those citations create the links R27.6 → ML.1, R17.5 → ML.1, R19.1 → ML.1 on promotion. BP-AutomorphicGaloisRepresentations keeps the Deligne–Serre construction. |
| /9 | Handed on | BP-ModularCurvesPartII--R14.3 (owner of the Eichler relation) and BP-AutomorphicGaloisRepresentations (R19.1 imports it). |
| /10 | Handed on | BP-PotentialModularityAndCompatibleSystems--R24.3, BP-WeightsInEtaleCohomology, BP-AutomorphicGaloisRepresentations: the generic compatible-system carrier and purity. |
| /11 | Handed on | BP-ClassicalSerreModularity--R26.1: one owner for the consecutive-prime estimate. |
| /12 | Part here | Three new declarations make KW I Theorem 4.1 an output of R22.5 and R22.6; the texts that placed it in R24.4 are corrected in the packet and reader; its four ClassicalSerreModularity consumers cite the new nodes. PotentialModularityAndCompatibleSystems part R24.3 (completed in #6718) treats R24.4 as a consumer layer and requests this export; its two R24.4 nodes can now cite it. The stage text of R22.5 and R24.4 and the RS-08 keeps are the maintainer's. |
| /13 | Fixed here, with an open request | The ten §7.6/§8 declarations of R22.1 now have exact dependencies: field existence (`allowable-base-change-existence`, with its quadratic clause for the tower of Theorem 8.4), transport of (α), (β), and the request to R23.1 for the two CHT lemmas. The definitions have typed forms in the suggested file. The Kisin and Gee prescribed-type contracts remain open requests, as before. |
| /14 | Handed on | BP-AutomorphicGaloisRepresentations and BP-LocalGaloisDeformationRings: Kisin's compatibility at the coefficient prime, with R08.3 → R19.5. |
| /15 | Fixed in round 2; checked | No change. R01.4 is a prerequisite of the R04.5 nodes and the request names the exact lemmas. |
| /16 | Handed on | BP-LocalGaloisDeformationRings: local Tate duality and the Euler characteristic at R08.1. |
| /17 | Handed on | BP-PadicHodgeTheory--P7, BP-LocalGaloisDeformationRings, BP-OrdinaryAutomorphicFormsAndModularityLifting: one early owner for the Berger–Li–Zhu criterion. |
| /18 | Handed on | BP-LocalGaloisDeformationRings: R08.3 owns the potentially semistable rings; L7 imports. |
| /19 | Fixed in round 2; checked | No change in the packet. BP-HilbertModularVarietiesAndShimuraCurves--R18.2 owns KW II Lemmas 7.1–7.4, Corollary 7.5 and Proposition 7.6. |
| /20 | Fixed in round 2; checked | No change. The RS-06 keeps for R27.5 are the maintainer's to amend. |
| /21 | Handed on | BP-GL2ModularityLifting--R32.3 and BP-PotentialModularityAndCompatibleSystems--R24.3. |
| /22 | Part here (round 2); checked | The G8 nodes name PA.3 as consumer and `consumerContracts` gives the contract. The links G8 → PA.3, L7 → PA.3, L8 → PA.3 arise when PotentialAutomorphyInfrastructure's packet cites these nodes, or by the maintainer; BP-LocalGaloisDeformationRings corrects L7's text. |
| /23 | Handed on | BP-PotentialModularityAndCompatibleSystems--R23.1. |
| /24 | Handed on | BP-PotentialModularityAndCompatibleSystems--R23.1. |
| /25 | Handed on | BP-PotentialModularityAndCompatibleSystems--R23.1: the general form of Moret-Bailly's theorem. |
| /26 | Part here | The consumer side: an exact request to R23.1 for CHT Lemmas 4.1.1–4.1.2 and a stage prerequisite, shown acyclic. BP-PotentialModularityAndCompatibleSystems--R23.1 plans the two lemmas (suggested ids `R23.1/cht-character-extension` and `R23.1/cht-soluble-extension-with-prescribed-completions`), with Tau Ceti ClassFieldTheory Layers 8, 11, 12 and Chebotarev as inputs. |
| /27 | Handed on | BP-PotentialModularityAndCompatibleSystems--R23.1: the Chebotarev input of R23.1. |
| /28 | Handed on | BP-PotentialModularityAndCompatibleSystems--R23.1: totally real base fields. |
| /29 | Handed on | BP-PotentialModularityAndCompatibleSystems--R23.1 (R24.1): finiteness beyond KW's local conditions. |
| /30 | Handed on | BP-PotentialModularityAndCompatibleSystems--R24.3: strict compatibility at the coefficient prime. |
| /31 | Handed on | BP-OrdinaryAutomorphicFormsAndModularityLifting. |
| /32 | Handed on | BP-OrdinaryAutomorphicFormsAndModularityLifting (with IntegralIwasawaTheory L4): Washington's theorem. |
| /33 | Handed on | BP-OrdinaryAutomorphicFormsAndModularityLifting: R17.4 → R21.4. |
| /34 | Handed on | BP-OrdinaryAutomorphicFormsAndModularityLifting: the ordinary modular lift used by the abelian-surfaces route. |
| /35 | Handed on | BP-AutomorphicCongruences--L5b. |
| /36 (low) | Handed on | BP-ClassicalSerreModularity--R26.1 and the two PotentialModularityAndCompatibleSystems parts: the Annals locator §6.2, Theorem 6.2. This packet's `kw-annals-2009` source already cites §6.2, pp. 250–251. |
| /37 (low) | Fixed in round 2; checked | No change. |
| /38 (low) | Handed on | BP-OrdinaryAutomorphicFormsAndModularityLifting: the Hida-family clause of R21.6. |
| /39 (low) | Fixed in round 2; checked | No change to the node's statement; its prerequisite Lemma 8.2 now carries the Chebotarev prerequisite. |
| /40 (low) | Handed on | The paper extraction `PAPER-LE-LEHUNG-LEVIN-ETAL-20`, item `cited-base-change` (the round-2 review corrected the target, which round 2 had given as PAPER-QIAN-23). Not a deliverable of this job. |

Counts: fixed, here or in round 2 and checked now, 6 (/13, /15, /19, /20, /37, /39); part here, 5 (/1, /8, /12, /22,
/26); handed on, 29.

## For the maintainer

These cannot be done from a packet.

1. **R27.1 (finding /1).** Delete `ClassicalSerreModularity:R26.6` from the requires of `ClassicalSerreModularity:R27.1`
   (keep RS-06's link R26.6 → R27.3). That alone meets the finding's acceptance test. Then, if the split is wanted:
   create R27.1a and R27.1b as in the restructure entries of the two ClassicalSerreModularity packets, and replace
   RS-06's links R27.1 → R33.2, R33.3, R33.6 by R27.1a → R33.2, R33.3, R33.6.
2. **R22.5, R24.4 and RS-08 (finding /12).** Delete "The KW I Theorem 4.1 formulation is assembled in R24 after its full
   KW II §10 inputs, avoiding a circular appeal to potential modularity" from the R22.5 text and the RS-08 keeps, and
   narrow R24.4 to importing the theorem.
3. **PA.3 (finding /22).** The links L7 → PA.3, L8 → PA.3, G8 → PA.3.
4. **RS-06 keeps for R27.5 (finding /20)** and **RS-08 keeps for R04.3 (finding /37)**, as round 2 described.

## For other jobs

- **BP-PotentialModularityAndCompatibleSystems--R23.1.** Plan CHT Lemmas 4.1.1–4.1.2 in R23.1; the request in the GL2
  packet has the statements and refinements. R23.1 then needs Tau Ceti's class field theory and Chebotarev among its
  inputs (finding /26's fix). The packet's gap "KW II Theorem 8.2 … has no node there yet" is out of date: the node is
  `GL2ModularityLifting:R22.1/theorem-8-2-minimal-modular-lifts`.
- **PotentialModularityAndCompatibleSystems part R24.3** (completed in #6718). Its request to
  `GL2ModularityLifting:R22.5` for the full KW I Theorem 4.1(2) is answered by `R22.5/kw-i-theorem-4-1-odd-prime` with
  `R22.5/alpha-beta-from-modularity-over-q`, and `R22.6/kw-i-theorem-4-1-dyadic` is the dyadic part; `R24.4/kw-theorem-4-1`
  and `R24.4/alpha-beta-from-residual-modularity` can cite them. The case k = p + 1 with residual weight 2 and a lift
  non-ordinary at p, which that request includes, is a gap of the GL2 packet (Kisin's Durham paper, unread).
- **BP-ClassicalSerreModularity--R26.1.** `R26.6/corollary-8-1-ii-and-the-statement-W1` and
  `R27.2/theorem-3-2-weight-reduction` cite `PotentialModularityAndCompatibleSystems:R24.4/kw-theorem-4-1`; re-point
  them to the GL2 nodes. If Theorem 3.2 uses a crystalline lift of weight p + 1 with k(ρ̄) = 2 that is not ordinary at
  p, it meets the GL2 packet's gap on Kisin's Durham paper.
- **ClassicalSerreModularity part R33.5.** `R33.5/dp-characteristic-two-closure` and
  `R33.6/strong-form-by-the-modern-route` cite `R27.1/dickson-and-the-dyadic-solvable-refinement` (proposed R27.1b);
  re-point them to `ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement` where
  only Dickson's classification and its dyadic refinement are used.
- **BP-ModularityAndLanglandsExtensions.** ML.1 can cite `ClassicalSerreModularity:R27.6/odd-artin-weight-one-modularity`
  for Corollary 10.2(ii), and `R27.6/unramified-residual-representations-arise-in-weight-one` with
  `R27.6/weight-one-descent-from-infinitely-many-primes` for Theorem 10.1(ii).
- **BP-AlgebraicModularFormsAndSerreWeights.** A request asks R15.2 for finite generation of H¹ of the cusp sheaf.
- **BP-AutomorphicGaloisRepresentations.** Seen in passing: `R19.1/parabolic-realisation-premotive` has the stage
  `GeneralizedHeegnerCycles:GH.0` among its prerequisites, and GH.0 has ClassicalSerreModularity R26 among its stage
  ancestors. I did not look further.
- **REV-FIX-RT-BP-GlobalGaloisDeformations (#5720).** That review is still open on the Global packet. This round changes
  the same packet in three places: `R04.1/determinant-comparison`, the new `R04.2/determinant-comparison-isomorphism`,
  and three `sourceVersions` kinds.

## Sources read in this round

All four were fetched afresh with ordinary certificate validation, and their hashes are those recorded in the packets.
Text was extracted with `pdftotext -raw` (poppler), which prints ρ̄ where earlier excerpts in these packets have ¯ρ and
prints a prime as 0; new excerpts avoid primes.

| Source | Passages read | SHA-256 |
| --- | --- | --- |
| [Khare–Wintenberger I, author's PDF](https://www.math.ucla.edu/~shekhar/papers/results.pdf) | Definition 2.1 (pp. 4–5); Lemma 6.3 and proof (pp. 11–12); Lemma 8.2, its Remark and proof, §8.4 (pp. 17–18); Theorem 4.1 (p. 7); §10 with the proof of Theorem 10.1 and Corollary 10.2 (pp. 19–21) | `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` |
| [Khare–Wintenberger II, authors' final PDF](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | Proof of Theorem 6.1, solvable case (p. 54); §7.6.2–7.6.3 with Definition 7.9 and Lemma 7.10 (pp. 68–69); §8.1–8.4 (pp. 69–77); Theorem 9.7 and the start of its proof (pp. 89–90); §10.2 (p. 92) | `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4` |
| [Clozel–Harris–Taylor, Publ. Math. IHÉS 108](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf) | Lemmas 4.1.1–4.1.2 with proofs (pp. 116–117); nothing else | `9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c` |
| [Dieulefait–Pacetti, arXiv:2108.07577v2](https://arxiv.org/pdf/2108.07577v2) | Fetched and hash checked; no passage re-read for this round | `0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6` |

Not read: Khare's IMRN note and its corrigendum; Gross; Coleman–Voloch; Edixhoven's paper (used through
SerreWeightAndLevelOptimisation R20.3's nodes); Taylor's "On icosahedral Artin representations II"; Kisin's Durham
paper; Diamond's Annals paper. The Inventiones printings of KW I and KW II were not collated. The pinned libraries
were read for one declaration, `MonoidAlgebra.Submodule.exists_isCompl` (Mathlib `082e2d3`,
`Mathlib/RepresentationTheory/Maschke.lean`).

## Validation

- `scripts/check_blueprint.py` with the pinned declaration index: 0 errors and 0 warnings for each of the three packets
  (37, 73 and 67 nodes).
- `check_errata.versions_checked` on the three packets: no errors (after the correction of the three kinds in Global).
- `research/blueprint/intake.py check-files` on the ten changed files: 0 problems.
- Declaration graph (all packets and integrated decompositions, these three overriding): 23,460 declarations, 948
  reachable from the 177 nodes of the three packets, no cycle.
- Stage links derived from the three packets' cross-roadmap prerequisites, tested against data/atlas.json with the
  accepted restructuring links and the link maps: none would be skipped as cyclic. Among them are
  PotentialModularityAndCompatibleSystems R23.1 → GL2ModularityLifting R22.1 and R22.5, GL2ModularityLifting R32.2 →
  ClassicalSerreModularity R33.1, and GL2ModularityLifting R22.5, R22.6 → ClassicalSerreModularity R27.3, R27.4.
- Build dry run: `build.assemble(require_distances=False, blueprints=…)` on a scratch copy of `data/blueprints` with the
  three revised packets and readers in place: the atlas assembles; `skippedLinks` is empty for ClassicalSerreModularity,
  GL2ModularityLifting and GlobalGaloisDeformations.
- Lean: the three suggested files elaborate at the pinned Mathlib with no errors; the only warnings are
  `declaration uses sorry` (13, 23 and 18). See "Suggested Lean files".

## A fresh read before submitting

Before submitting I had the packet and reader changes read by a separate reader that was given the diff, the rules
and the extracted sources, and not my conclusions. It checked the 22 new excerpts and locators against the sources,
the supplier nodes behind each citation, the examples, and the graph, and reported thirteen problems. All are
corrected in what is submitted:

- The quadratic tower of Theorem 8.4 was said to come from the existence lemma, which gave no control of the degree.
  The lemma now has the quadratic clause (5), with its proof.
- An acceptance item claimed H¹(X, ω²(−C)) = 0. It is H¹(X, Ω¹), free of rank one and torsion-free; the item and the
  hypothesis are corrected (the lemma was not affected).
- The proof step for non-injectivity of the determinant map allowed two classes differing by a multiple of the class
  of ρ̄, which give equivalent deformations. It is restated with one class outside that line.
- The weight-one step said in its statement that the hypothesis on Frobenius can be dropped while proving only the
  case with it, and the text said ML.1 adds "two inputs". Both forms are now stated, with what each rests on, and ML.1's
  need of the second is recorded.
- The restructure entry overlooked two nodes of part R33.5 that cite the mixed KW I §6 node.
- The duplicate nodes for KW I Theorem 4.1 in PotentialModularityAndCompatibleSystems--R24.3 were not named in the
  packet; a `restructure` entry (rescope) now names them and the consumers that cite them.
- The passage from "ρ̄ modular" to (α), (β) lacked the lift from a Katz form to characteristic zero; the step and its
  two supplier nodes are added.
- The last case of Theorem 4.1(2)(ii) was recorded as open; it reduces to type (C) by a twist, and is now a proof step.
- Smaller points: two steps of the descent proof reworded (the valuation ring above V; the ring 𝒪); the relative
  reading of condition (5) of Definition 7.9 recorded; the cases without splitting at p stated exactly; two requests
  that asked a supplier for what the node itself proves, and the gap on the stage split, removed; job references and
  graph remarks taken out of node fields; the count of ancestors of R23.1 stated for both graphs (3 on the atlas's own
  stage edges, 16 with the accepted restructuring links and link maps).

Writing the typed Lean forms also produced two corrections to the packets: "ρ̄|D_p irreducible" in KW II §§7–8 has to
mean absolutely irreducible, and the compatibility of the four conditions in the proof of KW I Lemma 8.2 is a joint
statement about the congruences, not one condition at a time.
