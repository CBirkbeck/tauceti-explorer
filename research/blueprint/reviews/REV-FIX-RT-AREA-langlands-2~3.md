# REV-FIX-RT-AREA-langlands-2~3

Independent review of FIX-RT-AREA-langlands-2~3 (Claude, session `claude-c9TlsS`, issue #5870, PR #6724), for
issue #5871.

Reviewer: Claude, session `claude-hd6PQ0`, 7 October 2026. Review base: `origin/main` at `221b05de`. I did not
write, review, red-team or verify any of: RT-AREA-langlands-2 and its verification; the fix rounds
FIX-RT-AREA-langlands-2, ~2 and ~3 and their reviews; FIX-RT-BP-ClassicalSerreModularity--R27.3 and its review;
FIX-RT-BP-GlobalGaloisDeformations; or any version of the three packets.

## Verdicts

| Packet | Verdict | In one line |
| --- | --- | --- |
| ClassicalSerreModularity--R27.3 | **accepted** | Every round-3 fix is right; no correction needed. |
| GlobalGaloisDeformations | **accepted** | Every round-3 fix is right; no correction needed. The unreviewed edits of FIX-RT-BP-GlobalGaloisDeformations were read too, and no error was found. |
| GL2ModularityLifting--R22.1 | **needs_changes** | Every round-3 fix is right after two corrections. The packet as a whole has never passed its own review, and what that review asked for (PROTOCOL §13, typed signatures; §4, API promotion and the named splits) is still open. |

Nothing of RT-AREA-langlands-2 remains to be fixed inside these three packets. What remains of the findings lies in
other packets, in stage texts and in links, and is listed below for the maintainer and for the jobs that own it.

## What I reviewed

- The 40 findings of `redteam/RT-AREA-langlands-2.result.json`, their 40 confirmations in
  `RT-AREA-langlands-2.review.json`, the round-2 review `reviews/REV-FIX-RT-AREA-langlands-2~2.md`, the fix report
  `redteam/RT-AREA-langlands-2.fixes-3.md` and the packets' own reviews (`REV-GL2ModularityLifting--R22.1.md`,
  `REV-FIX-RT-BP-ClassicalSerreModularity--R27.3.md`).
- The round-3 diff (`ea48bbee`) of the three packets and suggested files, node by node: 4 new and 11 changed nodes in
  ClassicalSerreModularity--R27.3, 5 new and 14 changed in GL2ModularityLifting--R22.1, 1 new and 1 changed in
  GlobalGaloisDeformations, with their requests, gaps, coverage, restructure entries, sources and sourceVersions.
  Since round 3 only the R27.3 packet changed, through REV-FIX-RT-BP-ClassicalSerreModularity--R27.3 (`7b17677c`).
- Every supplier node the new nodes cite, in its packet or integrated decomposition.
- For GlobalGaloisDeformations, everything that differs from the version now live in `data/blueprints/` (identical,
  apart from its review objects, to the version accepted on 1 October at `873aa30c`): REV-FIX-RT-AREA-langlands-2~2's
  baseline wording, the five nodes edited by FIX-RT-BP-GlobalGaloisDeformations (#5719, merged as `c9fbf255`), and
  round 3.

## Sources

All were downloaded afresh with ordinary certificate validation; each hash equals the one recorded in the packets.

| Source | Passages read | SHA-256 |
| --- | --- | --- |
| [Khare–Wintenberger I, author's preprint](https://www.math.ucla.edu/~shekhar/papers/results.pdf) | Theorem 4.1 (p. 7); Theorem 3.1 (p. 6); Lemma 8.2 with its proof and §8.4 (pp. 17–18); Theorem 10.1, its proof and Corollary 10.2 with §10.2 (pp. 20–21) | `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` |
| [Khare–Wintenberger II, authors' final version](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | Proof of Theorem 6.1, solvable case (p. 54); §7.6.2–7.6.3, Definition 7.9, Lemma 7.10 and proof (pp. 68–69); §8 opening, Lemma 8.1, §8.1–8.2, Theorem 8.2 and its proof (pp. 69–73); §10.2 with its Remark (p. 92); bibliography [3], [12], [16], [20], [21], [24], [27], [36], [38], [64], [66] (pp. 95–97) | `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4` |
| [Clozel–Harris–Taylor, Publ. Math. IHÉS 108](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf) | Lemmas 4.1.1 and 4.1.2 with their proofs (pp. 116–117) | `9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c` |
| [Gee, Modularity lifting theorems, arXiv:2202.05818v2](https://arxiv.org/pdf/2202.05818v2) | §3.23, the complexes and the long exact sequence (p. 16) | `878f83e189ad44603ac04f6c16ef17f4c4fe046db91a2f0933a192e048715ea5` |
| [Dieulefait–Pacetti, arXiv:2108.07577v2](https://arxiv.org/pdf/2108.07577v2) | Fetched and hash checked; no passage re-read | `0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6` |

Every excerpt that round 3 added or changed (7 in the R27.3 packet, 15 in the GL2 packet) was compared with the text
layer after NFKC normalisation and removal of whitespace and overlines: all 22 occur verbatim. Their page locators
were checked on the PDF pages: KW I pp. 7, 17, 20, 21; KW II pp. 54, 68, 69, 92; CHT p. 116.

Not read, as in the fix: Khare's IMRN note and its corrigendum; Gross; Coleman–Voloch; Edixhoven; Taylor, "On
icosahedral Artin representations II"; Kisin's Durham paper; Diamond's Annals paper. The packets record these as
gaps or as unread in node hypotheses.

## Checks

- `python3 scripts/check_blueprint.py <packet> --index <baseline>/declarations.tsv` on each packet, before and after
  my edits: 0 errors, 0 warnings (37, 73 and 67 nodes).
- `check_errata.versions_checked` on the three packets: no errors (the three Global `sourceVersions` kinds that
  round 3 corrected are now `preprint` or `author copy`).
- The one new baseline declaration, `mathlib:MonoidAlgebra.Submodule.exists_isCompl`, read at Mathlib `082e2d3` in
  `Mathlib/RepresentationTheory/Maschke.lean`: line 162, under the section variables of line 139 (`Field k`,
  `Finite G`, `NeZero (Nat.card G : k)`). The packet's record of it is accurate.
- `lean-check` on the three suggested files (`lake env lean` in the shared build at Mathlib `082e2d3`; no language
  server, no `lake build`), before and after the header lines I added: no errors; the only warnings are
  `declaration uses sorry`, 13 (GL2), 23 (R27.3) and 18 (Global). No axiom and no `Prop`-valued placeholder; the
  stand-ins for other roadmaps' objects are data types and functions, in the form of the reviewed precedent.
- Declaration graph over every packet and integrated decomposition, the three packets overriding, under both
  precedences (packets over decompositions, and the reverse): no cycle reachable from the 177 nodes of the three
  packets.
- An in-memory assembly of the atlas (`build.assemble(require_distances=False)` with `blueprints.load_promoted`
  patched; nothing written): with all three packets swapped in, 65 links are added to the stage graph (47 between
  layers, 18 between planets of GL2ModularityLifting), none is skipped, and the graph has no cycle. With only the
  two accepted packets swapped in, which is what promotion will do, one link is added, IntegralHeckeAndGaloisDeterminants
  IHG.0 → GlobalGaloisDeformations R04.2, and nothing is skipped.

## The three packets' review histories, and why GL2 is not accepted

- **ClassicalSerreModularity--R27.3** was accepted by its own review and is live, in its current form:
  REV-FIX-RT-BP-ClassicalSerreModularity--R27.3 accepted it on 7 October after reading round 3's edits. This review
  follows that one; its object is now the last entry of `reviewHistory`.
- **GlobalGaloisDeformations** was accepted by REV-GlobalGaloisDeformations and by REV-FIX-RT-AREA-langlands-1~2,
  and its 1 October version is live. Acceptance here also promotes the edits of FIX-RT-BP-GlobalGaloisDeformations to
  five nodes, whose own review (REV-FIX-RT-BP-GlobalGaloisDeformations, #5720) has not been done. I read them (below)
  and found no error; their disposition stays with #5720.
- **GL2ModularityLifting--R22.1** has never been accepted. Its own review, REV-GL2ModularityLifting--R22.1 (Codex
  `codex-a71f92`, 30 September), returned needs_changes and called the missing typed signatures "a substantive
  blocker". Only fix reviews have looked at it since. Accepting it here would make 73 nodes live on the strength of a
  review of one fix round. All three packets are planned at target level (`detail.json`, distance ≥ 7), so the base
  review's wish for declaration-sized nodes goes beyond PROTOCOL §2. Two of its requests are protocol rules and are
  still open:
  1. **PROTOCOL §13.** Fifteen definitions and constructions, those in the `neededBy` of the gap "Typed suggested
     signatures and tests are incomplete", have 53 API items and 45 unit tests that are neither declarations nor
     examples of the suggested file. They are: R22.1/minimal-level-data, deformation-to-hecke-map,
     framed-hecke-module; R22.2/auxiliary-level-groups, auxiliary-hecke-algebra, taylor-wiles-module-system,
     dyadic-twists-of-forms; R22.3/arithmetic-patching-data; R22.4/ihara-avoidance-comparison;
     R22.5/strong-residual-modularity; R22.6/dyadic-patched-ring; R32.1/lifting-statement-table,
     dyadic-lifting-proposition, residually-reducible-lifting-proposition, ordinary-three-lifting-proposition.
     Round 3 showed how: typed stand-ins for the suppliers' objects, the API items as lemma signatures under their
     packet names, the tests as examples named in their docstrings, and each docstring saying what cannot be stated.
  2. **PROTOCOL §4, last paragraph.** API items that another node uses become lemma nodes, and the three bundles the
     base review named (R22.2/auxiliary-hecke-algebra, R22.1/framed-hecke-module,
     R22.2/delta-freeness-at-taylor-wiles-level) are split as it asked. The packet records this as the gap
     "Declaration granularity and API promotion still required".

  The other open items of the base review are recorded as gaps with their exact missing inputs, which a partial
  packet may carry.

## Every confirmed finding

"Right" means the three packets now carry the correct correction for the part of the finding that lies in them.
"Handed on" means no part of the finding lies in these packets; I checked that the packets cite the supplier where
they use it and restate nothing, but I did not re-adjudicate the mathematics of the other packets, and nothing is
claimed about their state.

| Finding | Verdict | Reason |
| --- | --- | --- |
| /1 (high) | Right; stage edit remains | Lemma 8.2 now has R01.3, R01.4/dickson-classification-and-the-dyadic-refinement and Chebotarev Layer 10 as prerequisites, and its new compatibility step is right: the first three conditions make Frob_q trivial on every quadratic subfield of the cyclotomic field (on ℚ(√p) because q ≡ −1 mod p and p ≡ 1 mod 4), the fourth on L because ρ̄_proj(c) ∈ PSL₂(𝔽_p) (KW I pp. 17–18). R33.1's three nodes and GL2's R32.1/quadratic-cyclotomic-irreducibility cite R01.4 and R15.4 instead of the mixed KW I §6 node. Recomputed: no node of R33.1–R33.4 has an ancestor in R26, in R27.1b (good-dihedral-prime-insertion, dickson-and-the-dyadic-solvable-refinement) or in R27.2–R27.6. On the assembled stage graph R33.2–R33.5 still have R26.1–R26.6 as ancestors; deleting the one edge R26.6 → R27.1 removes them all from R33.1–R33.5, and R33.6 keeps them, as the finding allows. The split entry agrees with part R26.1's. The stage edit is the maintainer's. |
| /2 (high) | Handed on | BP-AutomorphicGaloisRepresentations. The new GL2 nodes cite R19.2 only for the attached representation of a base change, and do not supply Taylor's construction. |
| /3 (high) | Handed on | BP-PotentialModularityAndCompatibleSystems--R23.1. Its Theorem 8.2 input is R22.1/theorem-8-2-minimal-modular-lifts. |
| /4 | Handed on | BP-GL2AutomorphicRepresentationsAndTransfer--R17.3 and BP-AutomorphicGaloisRepresentations. GL2's base-change uses go through the exact R17.4 request. |
| /5 | Handed on | BP-AutomorphicGaloisRepresentations (R19.1). |
| /6 | Handed on | BP-AutomorphicGaloisRepresentations (R19.6) or IntegralHeckeAndGaloisDeterminants, whichever owns the reconstruction. Global's new R04.2 node already reads Chenevier's Theorem 2.22(i) as the finding asks (a henselian local ring, here Artinian, and a split, absolutely irreducible residual determinant, split because it is det∘ρ̄), through the existing IHG.0 request, and does not use Theorem B. |
| /7 | Handed on | BP-FiniteFlatGroupsAndIntegralPadicHodgeTheory (R07.5) and part R26.1. |
| /8 | Right; ML.1's side remains | Corollary 10.2(ii) is planned in full in R27.6, from layers before it, and nothing is imported from ML.1. I checked the four new declarations step by step: (a)–(d) of artin-reductions-of-serre-type, including exactness of invariants and Maschke for ℓ ∤ |G|, equality of conductors from equal invariants of the ramification groups, k(ρ̄_λ) = ℓ and Edixhoven weight 1, and P_c; the weight-one step, with ordinarity from Fontaine's supersingular form, the Frobenius eigenvalues from Deligne's ordinary form, and Gross's companion form at k = ℓ under a_ℓ² ≠ ε(ℓ) (R20.3/companion-forms states that case); finiteness of the torsion of H¹ of the cusp sheaf and flat base change; and the descent (Deligne–Serre lifting, restriction of eigensystems, pigeonhole over primes of 𝒪_{E′}[1/N′], weight-one newforms, Chebotarev). The suppliers in R15.1, R15.2, R15.4, R15.5, R15.6, R19.1, R20.3, R01.1, R01.3 and R01.5 state what is used, and the three new requests ask for what they do not. The acceptance items for the S₃ representation of conductor 23 are right. ML.1's narrowing is BP-ModularityAndLanglandsExtensions'. |
| /9 | Handed on | BP-ModularCurvesPartII--R14.3 and BP-AutomorphicGaloisRepresentations. |
| /10 | Handed on | BP-PotentialModularityAndCompatibleSystems--R24.3, BP-WeightsInEtaleCohomology, BP-AutomorphicGaloisRepresentations. |
| /11 | Handed on | Part R26.1 (R26.3 and R27.2 are not in these packets). |
| /12 | Right; R24.4 and stage texts remain | The three new GL2 nodes are right against KW I Theorem 4.1 (p. 7) and KW II §10.2 with its Remark (p. 92): Theorem 9.7 covers (2)(i) except k = p + 1 with k(ρ̄) = 2, and (2)(ii) when ρ restricted to ℚ_p(μ_p) is semistable of weight 2. The node's own reduction of the case N ≠ 0 is right: the Weil–Deligne representation is sp(2) ⊗ η, η\|_{I_p} comes from a Dirichlet character of p-power conductor, and the twist by its inverse is semistable non-crystalline of weight 2, so of type (C). Potentially crystalline weight 2 is potentially Barsotti–Tate (Kisin's node). The ordinary weight-p + 1 case is requested from R21.4, where KW II cite Diamond [16]; the non-ordinary case, Kisin's Durham paper [38], is an honest gap, and none of the four consumers in R27.3 needs it (Theorem 3.1 works with k(ρ̄) = 2, and the strong form uses lifts of weight k(ρ̄)). alpha-beta-from-modularity-over-q follows KW II p. 54 and p. 92. The R24.4 nodes, the RS-08 keeps and the R22.5 stage text are outside these packets; the GL2 `restructure` entry records them. |
| /13 | Right, after one correction | The §7.6/§8 nodes match KW II pp. 68–73. allowable-base-change-existence is proved correctly from CHT Lemma 4.1.2 (with the real places, E_v = ℝ, and one auxiliary place with the unramified quadratic extension for evenness), and its quadratic clause (5) correctly by weak approximation and a place z split completely in D; disjointness from K(μ_p) gives both image conditions. Lemma 8.1's construction gives every bullet of KW II's statement; an absolutely irreducible or weight-p + 1 ρ̄\|_{D_p} is ramified, so E_p = ℚ_p there. alpha-beta-under-allowable-base-change is right (cuspidality from absolute irreducibility; conductor exponents ≤ 1 are kept along unramified extensions). Lemma 7.10's dyadic branch is right, given a finite-order character from CHT Lemma 4.1.1; the correction (below) makes the request say where finite order comes from. Theorem 8.2's field step agrees with KW II p. 72. The definitions are typed in the suggested file with every API item and test under their packet names. The Kisin and Gee prescribed-type contracts remain open requests, as before. |
| /14 | Handed on | BP-AutomorphicGaloisRepresentations and BP-LocalGaloisDeformationRings. GL2 requests KW II Lemma 7.7 from R19.5. |
| /15 | Right (round 2); rechecked | R01.4 is a prerequisite of three R04.5 nodes, and the R01.4 request names the exact KW II Lemma 4.3 content. |
| /16 | Handed on | BP-LocalGaloisDeformationRings (R08.1). |
| /17 | Handed on | BP-PadicHodgeTheory--P7, BP-LocalGaloisDeformationRings, BP-OrdinaryAutomorphicFormsAndModularityLifting. |
| /18 | Handed on | BP-LocalGaloisDeformationRings. |
| /19 | Right (round 2); rechecked | R22.2 imports R18.3's freeness and twists through R18.6 and restates neither. |
| /20 | Right (round 2); rechecked | The three R27.5 nodes that need (H) cite R22.6/hypothesis-h; the RS-06 keeps for R27.5 are the maintainer's. |
| /21 | Handed on | Part R32.3 of GL2ModularityLifting (R32.6) and BP-PotentialModularityAndCompatibleSystems--R24.3. |
| /22 | Right (round 2); links remain | The three G8 nodes name PA.3 as their consumer and `consumerContracts` gives the contract. The links L7, L8, G8 → PA.3 and L7's text are outside this packet. |
| /23–/25 | Handed on | BP-PotentialModularityAndCompatibleSystems--R23.1. |
| /26 | Right on the consumer side; R23.1 remains | The request to R23.1 states CHT Lemmas 4.1.1–4.1.2 as printed (checked on pp. 116–117), with its refinements; the stage prerequisite R23.1 → R22.1 is acyclic (R23.1's only stage requirement is AlgebraicModuliForArithmeticGeometry R09.3), and the dry assembly adds it without skipping. R23.1's packet has to plan the two lemmas. |
| /27–/29 | Handed on | BP-PotentialModularityAndCompatibleSystems--R23.1 (R24.1 for /29). |
| /30 | Handed on | BP-PotentialModularityAndCompatibleSystems--R24.3. |
| /31–/34 | Handed on | BP-OrdinaryAutomorphicFormsAndModularityLifting (with IntegralIwasawaTheory L4 for /32). |
| /35 | Handed on | BP-AutomorphicCongruences--L5b. |
| /36 (low) | Handed on | Part R26.1 and the PotentialModularityAndCompatibleSystems parts. |
| /37 (low) | Right (round 2); rechecked | R04.3 cites KW II Lemma 4.4, Lemma 4.6 and Proposition 4.5, and its two mentions of Corollary 4.7 attribute that application to R24.2 with R03.4. |
| /38 (low) | Handed on | BP-OrdinaryAutomorphicFormsAndModularityLifting. |
| /39 (low) | Right (round 2); rechecked | The R33.2 node is Paso 2 only, with R24.3, R24.6 and Paso 1 as prerequisites. |
| /40 (low) | Handed on | The extraction PAPER-LE-LEHUNG-LEVIN-ETAL-20, item `cited-base-change`. |

Counts: right in these packets, 11 (/1, /8, /12, /13, /15, /19, /20, /22, /26, /37, /39, of which /1, /8, /12, /22
and /26 also have a part elsewhere); handed on, 29.

### The two back-edges of the round-2 review

- **R04.2 → R04.1 (Global).** Removed. R04.1/determinant-comparison now states the map and its non-injectivity and
  cites nothing in R04.2. I redid the computation: conjugating the constant deformation by 1 + εA, A = (a b₀; c₀ d),
  forces c₀ = 0 and adds ε((a − d)b + b₀(χ₂ − χ₁)), so exactly the classes of 𝔽·[b] are reached, and a class outside
  that line gives a deformation with the constant determinant that is not strictly equivalent. The isomorphism for
  absolutely irreducible ρ̄ is R04.2/determinant-comparison-isomorphism, correctly proved from Chenevier's
  Theorem 2.22(i), Burnside and Nakayama, and Carayol's theorem. R04.1 is `source_decomposed`.
- **R33.3 → R32.2 (GL2 and CSM).** Removed. R32.2/application-requirements is the contract an application of
  Theorem 1.4 must verify, with no prerequisite in ClassicalSerreModularity, and R33.1/dp-modularity-lifting-inputs
  cites it. The dry assembly adds GL2ModularityLifting R32.2 → ClassicalSerreModularity R33.1 and no cycle.

### The edits of FIX-RT-BP-GlobalGaloisDeformations that this acceptance promotes

Read for errors only; the verdicts on RT-BP-GlobalGaloisDeformations /1–/3 belong to REV-FIX-RT-BP-GlobalGaloisDeformations.

- R04.1/strict-vs-full-conjugacy and R04.2/carayol-trace-theorem now carry the locality of the coefficient ring. The
  integral example is right: a = (2 5; 5 12) has determinant −1 and reduces to 2·I modulo 5, the integral centraliser
  of the S₃ image is {±I}, so every conjugator is ±a and reduces to 2·I or 3·I; over ℤ/25 the unit 13 rescales a to
  reduce to I.
- R04.3/relative-tangent-space now states Gee's complex exactly as on p. 16 of arXiv:2202.05818v2: full adjoint in
  global and framed local degree zero, ad⁰ elsewhere, the quotients by L̃_v at S ∖ T in degree one, and the mapping
  fibre with d(φ, ψ) = (∂φ, φ\|_{G_v} − ∂ψ_v). The rank-one count with two framings, k²/diag(k) of dimension 1 =
  #T − 1, is right.
- R04.5/image-hypotheses and odd-taylor-wiles-primes: the p = 5 S₃ example (splitting field of X³ − 2, quadratic
  subfield ℚ(√−3) not in ℚ(ζ₅)) satisfies KW's cyclotomic hypothesis while ad⁰ = sign ⊕ standard has an invariant
  line, so whole-adjoint spanning is not available in the KW branch, as the node now says.

## Corrections made

In `research/blueprint/packets/GL2ModularityLifting--R22.1.json`:

1. The request to PotentialModularityAndCompatibleSystems R23.1 for CHT Lemmas 4.1.1–4.1.2 asked for refinement (a),
   the p-primary component of the global character, but CHT's Lemma 4.1.1 as printed produces only a continuous
   character, for which a p-primary component is not defined. The request now says that what is used is a
   finite-order χ, that the printed proof gives one once S contains the infinite places (χ is first defined on an
   open subgroup of finite index, the quotient being a ray class group, with finite image, and a finite-order
   character of a finite-index subgroup of an abelian group extends with finite order), and refinement (a) is
   stated for finite-order χ. R22.1/lemma-7-10-determinant-adjustment, which takes S to contain the real places of a
   totally real F, already uses it in that form.
2. `R32.1/p-star` is removed from the `neededBy` of the gap "Typed suggested signatures and tests are incomplete":
   its three API items and four tests are declarations and examples of the suggested file, as the gap's own text
   says. The coverage of R32.1 still lists the gap, for its other four nodes.

In the three packets the top-level `review` object is replaced by this review's, and the previous object is
appended, unchanged, to `reviewHistory`. In the three suggested files the header gains a line recording this review;
no declaration changed.

## What remains

**For the next fix round (GL2ModularityLifting--R22.1 only).** The two items in "Why GL2 is not accepted": typed
signatures, API lemma signatures and test examples for the fifteen definitions and constructions listed there, and
the API promotion and three splits of the gap "Declaration granularity and API promotion still required". Nothing
of RT-AREA-langlands-2 remains to be fixed in the packet. The other open items of the base review are recorded gaps.

**For the maintainer**, as the fix report's "For the maintainer" says, and unchanged by this review:
1. /1: delete ClassicalSerreModularity:R26.6 from the requires of R27.1; then, if wanted, the R27.1a/R27.1b split of
   the two ClassicalSerreModularity packets' entries, with RS-06's links R27.1 → R33.2, R33.3, R33.6 re-pointed to
   R27.1a.
2. /12: remove "assembled in R24" from the R22.5 text and the RS-08 keeps; narrow R24.4 to importing the theorem.
3. /22: the links L7, L8, G8 → PotentialAutomorphyInfrastructure PA.3.
4. /20 and /37: the RS-06 keeps for R27.5 and the RS-08 keeps for R04.3.

**For other jobs**, as listed in the fix report: R23.1 plans CHT Lemmas 4.1.1–4.1.2 (with the finite-order remark
of correction 1); the two R24.4 nodes of PotentialModularityAndCompatibleSystems--R24.3 cite the R22.5/R22.6
exports; part R26.1 re-points R26.6/corollary-8-1-ii-and-the-statement-W1 and R27.2/theorem-3-2-weight-reduction;
part R33.5 re-points its two nodes that cite the mixed KW I §6 node; ML.1 cites R27.6.

**Notes for the maintainer, outside these findings.**
- The base review's send-back of GL2ModularityLifting--R22.1 never produced a revision round: `plan_sent_back` in
  `research/blueprint/make_queue.py` reads the packet's current `review`, and the fix reviews replaced it within
  days. Its open requests have since travelled only as gaps of the packet. If a BP-…~2 round is wanted for them, it
  has to be queued by hand; otherwise the next fix round is where they are done.
- GlobalGaloisDeformations: 131 of the 162 API and test names of its definitions and constructions do not appear in
  its suggested file (PROTOCOL §13). This has been so at every version since the base acceptance and is not part of
  these findings, so it does not hold up this acceptance; it is work for the roadmap's next revision or assembly.
- ClassicalSerreModularity--R27.3: the three API items and six tests of R33.2/dp-lift-existence-and-good-dihedral-insertion
  are not in its suggested file. They predate round 3.
- Many tests in all three packets have `kind` `example`, which is not one of the five kinds of PROTOCOL §12, and the
  checker does not test kinds.
