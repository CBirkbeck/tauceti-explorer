# RT-PAPER-LANDESMAN-LITT-24

Red team of the accepted extraction PAPER-LANDESMAN-LITT-24: Aaron Landesman and Daniel Litt, *Canonical representations
of surface groups*, Annals of Mathematics 199 (2024), 823–897 (arXiv 2205.15352v4). Issue #4050.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`cc-7b31c4`, PR #1906);
- its review, REV-PAPER-LANDESMAN-LITT-24 (`cc-39fac3`, PR #2337).

Disclosure: my FIX-RT-PAPER-CHEN-24 (PR #5131) added PAPER-CHEN-24 route 7, which merges with this paper's route 1 into
one design job. Two findings (/26, /31) cite it as evidence. I lowered /31 to medium and gave its fix both directions.

**Result: 64 findings, 3 high, 35 medium and 26 low.**

## Method

**The source.** arXiv 2205.15352v4 (<https://arxiv.org/abs/2205.15352v4>) was re-downloaded on 2026-10-01 with its LaTeX
source. Its SHA-256 is `4cb511ba…5a1107ceb`, equal to the extraction's. The published Annals text is paywalled and was
not read.

**The passes.** Five parallel passes were run by this session.
- Four read all 62 pages against the extraction: §§1–3, §§4–6, §§7–8, and §§9–10 with Appendix A.
- One checked the five routes, every planned and library status, and the briefs against the atlas, the roadmaps in
  `research/blueprint/roadmaps`, other papers' accepted routes, earlier red teams and the pinned libraries (Mathlib
  082e2d3, Tau Ceti f790474).

**Merging.** I merged findings reported by more than one pass:
- the §3 deformation theory with item 115 (Hochschild–Serre), and Theorem 9.1.2's base field in the brief;
- item 100; the statuses of items 97, 101, 102 and 109; item 99 with complete reducibility;
- the character variety; the prerequisites of §§1–3 and §§9–10; item 108 with item 75;
- the hyperbolicity gap in the proof of Theorem 1.2.1.

**What I re-verified myself.** All three high findings:
- R04.1 and R04.2 plan deformations of G_{F,S} over Artinian O-algebras and nothing about normal subgroups, while the
  TeX applies Proposition 3.2.1 in the proof of Lemma 8.5.1;
- the TeX of Theorem 9.1.2 has M_{g,n,ℚ}, while route 1's brief, the report and item 75's note have M_{g,n,ℚ̄};
- MordellLawrenceVenkatesh LV.5 (committed 16 September, before the extraction) plans Mod(S), Dehn twists, capping and
  the Birman sequence, and PAPER-LAWRENCE-VENKATESH-20 marks them planned there.
I also checked the library declarations cited for items 99, 109 and 124 in the pinned index.

**Severities I changed.** These are medium, not high, for the reasons given in each claim:
- item 106 (M_{g,n} at R09.4): one item, and the edit is already written as Edit 2 of RT-AREA-etale.fixes.md;
- item 125 (the Hurwitz stack): a single-item duplicate, involving the route I added to PAPER-CHEN-24;
- item 104 (Leray): DiamondsAndVStacks:D0 plans the Leray spectral sequence on ordinary sites, so the item names the
  wrong layer rather than nothing. I rewrote that finding's conclusion and fix.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** route 4 (GlobalGaloisDeformations, items 26, 27, 28); item 111 (planned: GlobalGaloisDeformations:R04.1,
R04.2); route 1's brief import line; Item PAPER-LANDESMAN-LITT-24/115 (Lyndon–Hochschild–Serre spectral sequence),
routed to route 1; items 26–28 (route 4)

**Claim.** The §3 deformation theory is routed as a source of GlobalGaloisDeformations R04.1/R04.2, and item 111 is
marked planned by those layers, but neither layer plans it. R04.1/R04.2 plan deformation functors and universal rings
for Galois groups G_{F,S} of number fields over coefficient rings of a complete DVR O. The paper's §3 works with an
arbitrary abstract group G and coefficients in Art_ℂ. Its Lemma 3.1.2 (constancy on a normal subgroup when H⁰(Q, H¹(N,
ad)) = 0) and Proposition 3.2.1 (a ℂ[[t]]-family whose finite-level equivariant deformations vanish is conjugate to a
constant family on N, proved by the d_n: f ↦ f + εf′ successive-approximation trick) appear nowhere in those layers'
plans. Proposition 3.2.1 is on the main path: Lemma 8.5.1 → Lemma 8.5.2 → Theorem 8.5.3 → Theorem 1.2.1. As routed, the
R04 blueprint is not asked to build it, and the new roadmap imports 'deformation functors from GlobalGaloisDeformations
R04.1'. The main theorem would therefore depend on a result that no layer builds. Also: The Hochschild–Serre spectral
sequence has an atlas owner, ArithmeticGaloisDuality R02.2, which is already a prerequisite of R04.1. LL instead routes
the discrete-group version, item 115, to the mapping-class roadmap. Item 115's locator says it is used in the proof of
Lemma 3.1.2, which is item 27, routed to R04.1/R04.2. R04.1, a foundational deformation layer, would therefore import
from the mapping-class roadmap, and that roadmap imports R04.1 (items 26–28 are used in items 67 and 69). The
central-extension lifting obstruction in item 115(2) is the infinite-group form of what Tau Ceti InductionRestriction
layer 7 plans for finite groups.

**Evidence.** Paper §3.1, p. 20: 'Fix a group G and a representation ρ₀ : G → GL_r(ℂ). Let Art be the category of local
Artin ℂ-algebras with residue field ℂ.' Proof of Lemma 8.5.1, p. 42: 'We apply Proposition 3.2.1 to the short exact
sequence 1 → π₁(C°, c) → π₁(𝒞°, c) → π₁(ℳ, m) → 1.' In the atlas, GlobalGaloisDeformations:R04.1 reads 'Define framed
and strict-equivalence unframed deformations over Artinian coefficient rings, continuity, determinant-fixed variants and
change of coefficients. Prove that the local equivalence relation is the intended conjugacy relation and that
restriction is well-defined.' R04.2 reads 'Verify the finiteness hypotheses on G_{F,S} and prove existence of universal
framed rings…'. The roadmap conventions say 'A deformation problem includes the finite ramification set, residual
representation, determinant lift, coefficient ring…'. Its supplier DeformationAndDerivedPatchingAlgebra fixes 'a
complete DVR O with uniformiser π and residue field k'. Item 26's own review note says: 'The abstract-group,
ℂ-coefficient statement with the adjoint in 𝔭𝔤𝔩_r is not explicitly planned; the coordinator should decide.' Also: R02.2
('Hochschild–Serre and descent'): 'Build the spectral sequence for a closed normal subgroup ... Identify the low-degree
sequence with the existing inflation–restriction maps ... This layer is a general extension to the cohomology owner'.
R04.1 requires ['ArithmeticGaloisDuality:R02.2', ...]. Item 115's locator: 'proof of Proposition 2.3.4, pp. 17–18,
diagram (2.6); proof of Lemma 3.1.2, p. 21'. Tau Ceti InductionRestriction layer 7 ('Projective representations, factor
sets and the Schur multiplier'): 'the group central extension and the representation group are built here ... The
Clifford-theory obstruction ... is a [Schur-multiplier] class'.

**Fix.** Move items 27 and 28, and preferably 26, from route 4 to route 1
(MappingClassGroupsAndCanonicalRepresentations), as a layer on deformations of representations of abstract groups over
Art_ℂ: Lemma 3.1.1, Lemma 3.1.2 and Proposition 3.2.1. Place that layer before the semisimple case (Lemmas 8.5.1 and
8.5.2). Split item 111: the Art_ℂ, abstract-group part (§3.1) becomes missing and is routed with them. The
universal-deformation-ring part (Remarks 9.2.5 and 9.2.6) stays planned at R04.1 and R04.2. In route 1's brief, replace
'deformation functors from GlobalGaloisDeformations R04.1' by the new layer, and keep R04 only for §9.2. Keep items 80
and 83 in route 4. Also: In research/blueprint/papers/PAPER-LANDESMAN-LITT-24.result.json, route item 115(1) as a source
of ArithmeticGaloisDuality:R02.2, in the generality of a closed normal subgroup of a topological group, which includes
discrete groups. Route 115(2), the H² obstruction for central extensions, with it, citing InductionRestriction layer 7
for the finite-group case. Update route 1's brief to import both, so that route 4's R04 items depend only on R02.2.

### /2 — error

**Where.** route 1's brief (MappingClassGroupsAndCanonicalRepresentations, final theorem (3));
PAPER-LANDESMAN-LITT-24.md, 'What the paper proves', bullet 'Arithmetic consequences (§9)'; PAPER-LANDESMAN-LITT-24/75
note; Route 1, field 'brief', final theorem (3)

**Claim.** The brief states Theorem 9.1.2 'on a curve whose moduli point is the generic point of M_{g,n,ℚ̄}', and
PAPER-LANDESMAN-LITT-24.md says the same. Item 75's note likewise says 'since Spec K → M_{g,n,ℚ̄} is dominant, the outer
action of π₁(Spec K) factors through that of π₁(M_{g,n,ℚ̄})'. The paper's hypothesis is over ℚ. With ℚ̄ the theorem is
vacuous: a finitely generated field of characteristic 0 contains only a number field's worth of algebraic numbers, so it
is never a ℚ̄-algebra, and no Spec K maps to M_{g,n,ℚ̄}. The review corrected item 77 for exactly this reason, but did
not propagate the correction to the brief, the report or item 75's note. The brief is the design job's instruction
('states the final theorems exactly as the paper does', PROTOCOL §16), so the design job would plan a vacuous target.
Also: Route 1's brief misstates a final theorem. It gives Theorem 9.1.2 as 'on a curve whose moduli point is the generic
point of M_{g,n,ℚ̄}'. The paper, and item 77 as corrected by the review, use M_{g,n,ℚ}. Over ℚ̄ the hypothesis is
vacuous for a finitely generated K, so the brief's version is not the paper's theorem. The report repeats the error.

**Evidence.** Theorem 9.1.2, p. 45 (TeX: \mathscr{M}_{g,n, \mathbb{Q}}): 'such that the corresponding map Spec(K) →
M_{g,n,Q} factors through the generic point.' Proof, p. 47: 'Because Spec K → M_{g,n,Q} is dominant, the induced map
π1(Spec K) → π1(M_{g,n,Q}) has image of finite index.' Item 77's own review note says: 'With M_{g,n,ℚ̄} the hypothesis
is vacuous, because a finitely generated field of characteristic 0 is never a ℚ̄-algebra.' Also: TeX source of arXiv
2205.15352v4, Theorem 9.1.2: 'such that the corresponding map $\on{Spec}(K)\to \mathscr{M}_{g,n, \mathbb{Q}}$ factors
through the generic point'. Item 77, corrected by REV-PAPER-LANDESMAN-LITT-24: 'Spec(K) → M_{g,n,ℚ} factors through the
generic point'. The review's notes: '77 (M_{g,n,ℚ}, not ℚ̄, else the hypothesis is vacuous)'.

**Fix.** Replace M_{g,n,ℚ̄} by M_{g,n,ℚ} in brief item (3) and in the PAPER-LANDESMAN-LITT-24.md bullet. In item 75's
note, say that the second row of (9.1) is over M_{g,n,ℚ}, that Spec K → M_{g,n,ℚ} is dominant, and that finiteness of
the orbit passes from π₁^ét(M_{g,n,ℚ}) to its subgroup π₁^ét(M_{g,n,ℚ̄}). Also: In
research/blueprint/papers/PAPER-LANDESMAN-LITT-24.result.json, route 1 'brief', replace 'the generic point of
M_{g,n,ℚ̄}' with 'a map Spec K → M_{g,n,ℚ} factoring through the generic point (K finitely generated of characteristic
0)'. Make the same correction in research/blueprint/papers/PAPER-LANDESMAN-LITT-24.md, 'What the paper proves'.

### /3 — duplicate

**Where.** Route 1 (new MappingClassGroupsAndCanonicalRepresentations); items PAPER-LANDESMAN-LITT-24/113, /128, /129

**Claim.** The new roadmap re-plans surface mapping class groups that a roadmap in research/blueprint/roadmaps already
plans. MordellLawrenceVenkatesh layer LV.5 ('Surfaces, mapping class groups and families of branched covers') plans
Mod(S) for surfaces with boundary and punctures, Dehn twists and multitwists, point pushing with the Birman exact
sequence, capping boundary circles, the configuration (Fadell–Neuwirth) fibration and the classification of compact
surfaces. Items 113 (Mod_{g,n}, PMod_{g,n}, Birman sequence, point-pushing), 128 (Dehn twists and multitwists) and 129
(capping boundary components and boundary twists) are therefore 'planned', not 'missing', under PROTOCOL.md section 16,
and route 1's reason ('Nothing in the atlas goes in this direction ... no mapping class group') is false. Item 128's
note ('Not planned: the tauceti GeometricTopology roadmap treats diffeomorphism groups, not surface mapping classes') is
also wrong: GeometricTopology layer 9 consumes 'layer 3's surface mapping classes'. If both designs proceed, Mod, Dehn
twists, the Birman sequence and capping get built twice.

**Evidence.** MordellLawrenceVenkatesh.json, stage LV.5 (committed 16 Sept 2026, before this extraction on 22 Sept):
'Mapping class groups Mod(S) and Mod(S*) ...; Dehn twists and their action on homology ..., multitwists; ... capping
(Proposition 3.19). Point pushing: the Birman exact sequence and Push(α)=T_aT_b⁻¹'. The packet nodes include
LV.5/mapping-class-group, LV.5/dehn-twist, LV.5/birman-exact-sequence, LV.5/point-push and LV.5/capping-surjective. Its
'capping-surjective' statement, '1 → ⟨T_β⟩ → Mod(S) → Mod(S′, p) → 1 is exact', is item 129. The packet's restructure
entry (action 'split') reads: 'Create a roadmap MappingClassGroups (group topology) owning Farb–Margalit Chapters 1–6
and the classification of compact surfaces ... MordellLawrenceVenkatesh LV.5 is then replaced by a dependency on that
roadmap.' The packet's ownership gap, written by its reviewer, says: 'Surface/mapping-class infrastructure extends the
existing GeometricTopology/AlgebraicTopology direction; the current claim that no roadmap owns it is not an adequate
section-15 ownership argument. Propose the appropriate Part II.' The accepted
PAPER-LAWRENCE-VENKATESH-20/mapping-class-inputs ('Birman exact sequence ..., surjectivity of MCG onto the symplectic
group, capping, change of coordinates') has status planned with planned = [MordellLawrenceVenkatesh:LV.5].
GeometricTopology layer 9: 'with φ a surface diffeomorphism (consume layer 3's surface mapping classes ...)'.

**Fix.** In research/blueprint/papers/PAPER-LANDESMAN-LITT-24.result.json, set items 113, 128 and 129 to status
'planned' with planned ['MordellLawrenceVenkatesh:LV.5'], and remove them from route 1. Alternatively, record that route
1 is the 'MappingClassGroups' roadmap that the LV packet's restructure proposal asks for: make it the single owner, move
LV.5's generic nodes into its first layer, and leave LV.5 only the Aff(q)-specific material, as that proposal says.
Either way, rewrite route 1's reason to cite LV.5 and its restructure proposal. The brief must import cutting, gluing,
collars and isotopy extension from tauceti:TauCetiRoadmap/GeometricTopology layer 1, and Diff(M) as a topological group
from its layer 3, because π₀Diff⁺ = Mod. The maintainer should decide whether this route is a Part II of
tauceti:TauCetiRoadmap/GeometricTopology, as the LV reviewer recommends, or a new roadmap, and record the decision.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | route 4 (GlobalGaloisDeformations, items 26, 27, 28); … | The §3 deformation theory is routed as a source of GlobalGaloisDeformations R04.1/R04.2, and item 111 is marked planned by those layers, but neither layer … |
| /2 | high | error | route 1's brief (MappingClassGroupsAndCanonicalRepresentations, final …; … | The brief states Theorem 9.1.2 'on a curve whose moduli point is the generic point of M_{g,n,ℚ̄}', and PAPER-LANDESMAN-LITT-24.md says the same. Item 75's note … |
| /3 | high | duplicate | Route 1 (new MappingClassGroupsAndCanonicalRepresentations); … | The new roadmap re-plans surface mapping class groups that a roadmap in research/blueprint/roadmaps already plans. MordellLawrenceVenkatesh layer LV.5 … |
| /4 | medium | library-claim | item 97 (status planned); … | Item 97 (Schur's lemma, isotypic components and semisimple decompositions) is marked planned by the Tau Ceti SemisimpleAlgebras layer 1 and the CharacterTheory … |
| /5 | medium | library-claim | item 99 (status planned); … | Item 99 (unitary groups, averaging and unitarizability) is marked planned by CompactGroups layers 0 and 1. Tau Ceti at the pinned commit already contains both … |
| /6 | medium | library-claim | item 100 (status library); … | Item 100 claims as library 'the inflation–restriction sequence relating H⁰(Q, H¹(N, −)) to H¹ of an extension' and 'the identification Ext¹_G(ρ₂, ρ₁) = H¹(G, … |
| /7 | medium | error | items 11, 13, 15, 17, 18 | These items omit the standing hyperbolicity hypothesis 2g − 2 + n > 0 of Notation 1.10.1, and without it their statements are false or ill-formed. At (g, n) = … |
| /8 | medium | error | route 1's brief (final theorem (1)); … | The brief says that Corollary 1.6.1 is equivalent to Theorem 1.2.1. It is only a corollary, and the converse does not hold. Closed-surface groups are not free. … |
| /9 | medium | missing | items 3 and 1 (Corollary 1.2.3, §1.1) | No item states the cited dictionary [CH19, Theorem A], or defines the (algebraic) universal isomonodromic deformation that Corollary 1.2.3 is about. Item 3 is … |
| /10 | medium | missing | Notation 1.10.3; … | No item defines the fundamental group or the singular cohomology of the analytification of a Deligne–Mumford stack. No item states the correspondence between … |
| /11 | medium | missing | items 7, 112, 19; … | No item defines the surface Σ_{g,n} and the structure of its fundamental group: the standard presentation, freeness of rank 2g + n − 1 for n ≥ 1, and the map … |
| /12 | medium | missing | item 1 (statement); … | The representation variety Hom(Γ, GL_r) and the character variety have no item. Item 1's statement asserts 'Semisimple MCG-finite representations are exactly … |
| /13 | medium | error | prerequisites; … | The prerequisites omit three papers whose results the main proof quotes and which the atlas does not cover. [BGMW17, Lemma 3.2] is the rank-one finiteness of … |
| /14 | medium | missing | item 15 (Lemma 2.1.4) | The only substantive input to Lemma 2.1.4 is the cited result [Deb01, Lemma 4.19]: for a dominant morphism of varieties, the image on π₁ has finite index. It … |
| /15 | medium | error | PAPER-LANDESMAN-LITT-24/34 (statement); … | Item 34 copies a misprint of Theorem 4.2.1: it says H⁰(X, W) carries 'a natural real Hodge structure'. As written this reads as a pure Hodge structure, and the … |
| /16 | medium | missing | PAPER-LANDESMAN-LITT-24/36 and the HodgeStructuresPartII route | The proof of Proposition 4.2.2 needs two admissibility facts, which it asserts without citation: (a) a pure polarizable real VHS is admissible; (b) a tensor … |
| /17 | medium | missing | PAPER-LANDESMAN-LITT-24/38 (Lemma 4.3.2) and the … | The proof of Lemma 4.3.2 uses three external results that have no items. (1) [Moc06, Lemma 10.13] deforms a G(ℂ)-valued representation, with G the reductive … |
| /18 | medium | missing | HodgeStructuresPartII route brief; … | §§4 and 6 work throughout with real mixed Hodge structures: a constant real MHS Q_ℝ, its complex Deligne bigrading Q^{i,j}, morphisms of real VMHS, and the … |
| /19 | medium | error | PAPER-LANDESMAN-LITT-24/105 (status, library, planned) | Item 105 is marked 'planned' by AlgebraicModuliForArithmeticGeometry:R09.1 and R09.2, including 'the identification of its tangent bundle with Hom of the … |
| /20 | medium | error | PAPER-LANDESMAN-LITT-24/37, /68, /69; … | Item 37 (Mochizuki's Theorem 4.3.1) says only that rho 'admits a deformation with constant determinant to a representation underlying a complex PVHS'. Neither … |
| /21 | medium | error | PAPER-LANDESMAN-LITT-24.md, 'What the paper proves', bullet … | The report says Corollary 9.1.4 gives 'a four-way equivalence between finiteness, arithmeticity, geometric origin and underlying an integral variation, with … |
| /22 | medium | error | PAPER-LANDESMAN-LITT-24/83 statement; … | Item 83 asserts that the paper 'answers negatively, for arithmetic fundamental groups of generic curves, Flach's question [CO05, p. 7]'. The route reason and … |
| /23 | medium | missing | PAPER-LANDESMAN-LITT-24/81 (Corollary 9.2.2, the 'in particular' …; … | The second assertion of Corollary 9.2.2, that no such representation is of geometric origin, rests on the claim that 'representations of geometric origin are … |
| /24 | medium | missing | PAPER-LANDESMAN-LITT-24/75 (b)-(c), PAPER-LANDESMAN-LITT-24/108; … | The proof of Theorem 9.1.2 treats the Deligne–Mumford stack M_{g,n,ℚ} and the punctured universal curve 𝒞°_ℚ over it as if they were schemes. It takes their … |
| /25 | medium | missing | PAPER-LANDESMAN-LITT-24/75 (left vertical isomorphism of (9.1) and …; … | Theorem 9.1.2's proof uses three times that π₁^ét of a non-proper variety, or stack, in characteristic 0 does not change under extension of algebraically … |
| /26 | medium | library-claim | PAPER-LANDESMAN-LITT-24/108 (planned); … | Item 108 says the comparison of π₁^ét of a complex variety with the profinite completion of the topological π₁ ([GR71, XII 5.2], Riemann existence) is planned … |
| /27 | medium | error | PAPER-LANDESMAN-LITT-24/85 statement, part (2) (and parts (1), (3)); … | Example 10.1.6(2) claims that for every n > 0 the sequence 0 → I²/I³ → I/I³ → I/I² → 0 of PMod_{g,n}-modules does not split. Item 85 copies this. It is false … |
| /28 | medium | error | PAPER-LANDESMAN-LITT-24/131 statement (also /77) | Item 131 states [LL22, Lemma 7.5.1] for any n-punctured genus g surface and r > 1: finite-image representations are not Zariski-dense in the character variety. … |
| /29 | medium | error | PAPER-LANDESMAN-LITT-24/136 statement; … | Item 136 applies Voisin's harmonic theory with 'F = ℰ ⊗ Ω¹_𝒞(log 𝒟) with the metric from the unitary structure'. The flat unitary metric on V ⊗ O_{𝒞°} does not … |
| /30 | medium | duplicate | Route 5 (source AlgebraicModuliForArithmeticGeometry …; … | M_{g,n}, M̄_{g,n} and finite étale scheme covers of M_{g,n} (item 106) are sent to R09.4, whose stated scope excludes curves. The atlas already has an accepted … |
| /31 | medium | duplicate | Route 1; … | Item 125, Wewers' Hurwitz stack of H-covers of n-pointed genus g curves (a DM stack étale over M_{g,n}, isotropy Z(H), with a universal cover), is routed into … |
| /32 | medium | error | Item PAPER-LANDESMAN-LITT-24/104 (Leray spectral sequence, status …; … | Item 104 is marked planned at Tau Ceti AlgebraicTopology stage 5 and ClassicalAdicEtaleCohomology:H0, but neither layer plans what the paper uses. The paper … |
| /33 | medium | error | Route 5; … | Item 107 combines two statements and sends both to R09.7. The first is the snc compactification of the Deligne–Mumford stack M̄_{g,n+1} by blowing up boundary … |
| /34 | medium | duplicate | Item PAPER-LANDESMAN-LITT-24/29 (polarizable complex VHS); … | The variation-of-Hodge-structure carrier already has an owner, ShimuraData:D3. Item 29 is nonetheless 'missing' and routed to the Hodge Part II, and route 2's … |
| /35 | medium | other | Items PAPER-LANDESMAN-LITT-24/127, /135, /10 (routed to route 1) … | Several basic notions that the Hodge Part II's own items use are placed in the mapping-class roadmap, so the 'engine' that route 1 imports depends on route 1 … |
| /36 | medium | library-claim | Item PAPER-LANDESMAN-LITT-24/124 (local systems and the monodromy … | Item 124 is 'missing', and its note says no stage plans the local-system/representation correspondence. Tau Ceti at f790474 already has local coefficient … |
| /37 | medium | error | Item PAPER-LANDESMAN-LITT-24/110 (Lafforgue and Deligne's companions, … | Item 110 is planned at GS.6 and DWP.7, but neither layer plans the companion theorem the paper needs. DWP.7 is Weil II's direct-image weight theorem and plans … |
| /38 | medium | error | Route 4 (source GlobalGaloisDeformations R04.1/R04.2); … | Item 83 says that deformation rings of residual representations of arithmetic fundamental groups of generic curves are not flat over ℤ_p. It is a corollary of … |
| /39 | low | other | item 2 (Theorem 1.2.1) and sourceIssues; … | This is an unrecorded gap in the paper. Theorem 1.2.1 is stated 'for g, n, r ≥ 0', but its proof goes through Theorem 8.5.3, whose first step is Corollary … |
| /40 | low | other | item 22 (Proposition 2.3.4) and sourceIssues | This is an unrecorded gap in the proof of Proposition 2.3.4. The proof passes to one dominant étale base change that kills every element of E₂^{2,0} and … |
| /41 | low | other | item 21 (Lemma 2.3.3) and sourceIssues | This is an unrecorded gap. Lemma 2.3.3 is stated for an arbitrary complex variety ℳ, but its proof applies Artin's K(π,1)-neighbourhood theorem from SGA 4 … |
| /42 | low | error | sourceIssues E3 (reason) | E3's reason still contains a sentence that is false as mathematics, and the review asked for it to be removed. Corollary 1.3.1 holds when ℳ → M_{g,n} is merely … |
| /43 | low | other | item 16 note; … | The review fixed the total-space/fibre conflation (𝒞° versus C°) and the B_n convention in statements only. Three notes and the brief still carry the garbled … |
| /44 | low | error | item 27 (locator) | Item 27's locator gives pp. 21–22, but Lemma 3.1.2 and its proof lie entirely on p. 21. Page 22 begins with the definitions of §3.2. |
| /45 | low | missing | item 7 (Remark 1.6.5) | Remark 1.6.5 is a stated result with a precise statement, the extension of Corollary 1.6.1 to characteristic quotients of free and surface groups. It appears … |
| /46 | low | missing | §5.1.5 and proof of Theorem 1.7.1 (items 39, 42, 43, 8) | The identification of fibres F¹H_b = H⁰(C_b, ℰ_b ⊗ ω(D_b)) and (H/F¹H)_b = H¹(C_b, ℰ_b) needs cohomology and base change: local freeness of π_*(ℰ ⊗ Ω¹(log 𝒟)) … |
| /47 | low | other | sourceIssues (missing entry); … | A gap the extraction does not record. The proof of Lemma 6.1.1 applies Proposition 4.2.2 (and through it Theorem 4.2.1) with X = ℳ. Both are stated for a … |
| /48 | low | other | sourceIssues (missing entry) | A misprint the extraction does not record. Twice in the proof of Theorem 6.2.1 the paper writes R¹π_*𝕌_i for R¹π°_*𝕌_i. The 𝕌_i live on the punctured total … |
| /49 | low | error | PAPER-LANDESMAN-LITT-24/43 (statement), /42 (name and note), /49 … | The bar on ∇̄ has been lost in several places. Item 43 ends 'Moreover dP^∨_b is adjoint to ∇_b', but the paper says ∇̄_b, the O_B-linear composite (5.3). The … |
| /50 | low | error | PAPER-LANDESMAN-LITT-24/48 (note) | Item 48's note still says Remark 5.2.5 uses 'that E_⋆ is parabolically stable if and only if Ê_⋆ is coparabolically stable'. The extraction's own confirmed … |
| /51 | low | error | PAPER-LANDESMAN-LITT-24/47 (statement) | Item 47 (Proposition 5.2.3) concludes rk(E) ≥ g − r without saying what g is or what C is. The hypotheses come from the opening of §5.2: C smooth, proper and … |
| /52 | low | error | PAPER-LANDESMAN-LITT-24/31 (locator) | Item 31's locator credits '[Del70, Remarques 5.5(i)] and [LL22, Definition 4.1.2]' to Notation 5.1.1, pp. 27–28. Notation 5.1.1 cites only [Del70]. The … |
| /53 | low | error | PAPER-LANDESMAN-LITT-24/60; … | Proposition 8.2.1 concludes 'In particular, V is cohomologically rigid' through Lemma 8.1.3. Definition 8.1.1 defines cohomological rigidity only for ρ whose … |
| /54 | low | error | PAPER-LANDESMAN-LITT-24/65; … | The printed proof of Lemma 8.3.4 shows that the O_K-point Pρ(α) of PGL_r has some lift in G(O_{K'}). It never shows that ρ(α) itself lies in G(O_{K'}), which … |
| /55 | low | library-claim | PAPER-LANDESMAN-LITT-24/73 | Item 73 ([LL22, Lemma 7.2.1]: a representation into GL_r(O_K) that is unitary at every embedding has finite image) is marked missing with an empty library list … |
| /56 | low | missing | PAPER-LANDESMAN-LITT-24/59 (new item) | The proof of Lemma 8.1.3 (item 59) rests on a cited result that has no item of its own: [EG18, Remark 2.4]. It identifies H¹(X̄, j!* ad ρ) with H¹(U, a_* ad ρ) … |
| /57 | low | missing | PAPER-LANDESMAN-LITT-24/52; … | Route 1's reason names Ivanov's conjecture as one of the new roadmap's targets. No item states it, and none states the cited equivalence [PW13, Theorem 1.3] … |
| /58 | low | other | PAPER-LANDESMAN-LITT-24/12 (note) | Item 12's note says Proposition 2.1.1 'is what allows the induction on the socle filtration in §8.7: both the socle and the quotient by it are MCG-finite'. … |
| /59 | low | error | PAPER-LANDESMAN-LITT-24/78 note | The note says 'The equivalence of (1) and (2) is Theorem 9.1.2', following the paper. Theorem 9.1.2 gives only (2) ⇒ (1). The converse, that finite image … |
| /60 | low | error | PAPER-LANDESMAN-LITT-24/89 statement | Item 89, copying Notation A.1.2, says '(A^•_{log D}(ℰ), ∇ + ∂̄) is the de Rham resolution of the unitary local system V'. The complex lives on the compact … |
| /61 | low | error | PAPER-LANDESMAN-LITT-24/84 note | The note says the FLM bound and the paper's bound 'are asymptotic to √g'. The FLM bound 2√(g−1) is asymptotic to 2√g, not √g. Both are Θ(√g). The paper uses … |
| /62 | low | missing | route 1's brief ('the open questions of §10 … are recorded as …; … | The brief and the report say the §10 questions are 'recorded as targets', but no item records Question 10.1.1 (rigidity), Question 10.2.3 or 10.2.6 (minimal … |
| /63 | low | other | Briefs of routes 1 and 2 (import lists) | The import lists of both briefs fall short of PROTOCOL.md section 16. They name roadmaps by short id or description rather than by exact title and id, and omit … |
| /64 | low | other | research/blueprint/papers/PAPER-LANDESMAN-LITT-24.md (summary … | The report's summary was not updated after the review and describes a different extraction from the one accepted. Its opening paragraph says the paper was … |

## Notes for the fix job

- **Routes first.** Settle the four ownership questions before editing statements, since each moves items: the §3
  deformation theory (items 26–28, 111, 115) into route 1 or R02.2 so that R04.1 does not import from route 1; items
  113, 128 and 129 against MordellLawrenceVenkatesh LV.5 and its restructure proposal; item 106 to StableReductionPartII
  (Edit 2 of RT-AREA-etale.fixes.md); and item 125 against PAPER-CHEN-24 route 7.
- **Briefs.** Correct route 1's final theorems (Theorem 9.1.2 over M_{g,n,ℚ}; Corollary 1.6.1 as a consequence, not an
  equivalent), name every import by exact title and id, and replace the stage-5 Leray import by DiamondsAndVStacks D0.
- **Hyperbolicity.** Add 2g − 2 + n > 0 wherever the paper's Notation 1.10.1 assumes it (items 11, 13, 15, 17, 18, 131),
  and record under PROTOCOL §18 that Theorem 1.2.1 is stated for all (g, n) while its proof needs it.
- **Source issues.** Record the unrecorded mistakes the findings list (Theorem 4.2.1's "real Hodge structure", Example
  10.1.6(2) for (1,1) and (0,3), the metric in Proposition A.1.7, Lemma 8.3.4's lift, R¹π_* for R¹π°_*, the gaps in
  Proposition 2.3.4 and Lemma 2.3.3) and the misprints the paper's text carries.
