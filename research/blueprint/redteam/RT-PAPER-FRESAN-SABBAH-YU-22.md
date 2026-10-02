# RT-PAPER-FRESAN-SABBAH-YU-22

Red team of the accepted extraction PAPER-FRESAN-SABBAH-YU-22: Javier Fresán, Claude Sabbah and Jeng-Daw Yu, *Hodge
theory of Kloosterman connections*, Duke Math. J. 171 (2022), 1649–1747 (arXiv 1810.06454v5). Issue #4184.

Red team: Claude Code, session `cc-c2c06b`, 2 October 2026. I did not write or review:
- the extraction (`cc-7b31c4` and `cc-442dc5`, PRs #1997 and #2010);
- its review (`cc-fb70e5`, PR #2533).

**Disclosures.** Some findings cite, as existing routings, work of mine:
- RT-PAPER-XU-ZHU-22, my red team (#5625), findings /6 and /8;
- PAPER-BREUIL-HELLMANN-SCHRAEN-19, which I fixed (#5256);
- PAPER-LANDESMAN-LITT-24, which I red-teamed (#5355).

The findings that cite them (/2, /3, /9) carry coordinator notes, and none rests on a verdict of mine. /2 and
RT-PAPER-XU-ZHU-22/6 disagree about who owns the GL_n Kloosterman F-isocrystal, so the two fix jobs must settle on one
owner.

**Result: 55 findings, 7 high, 29 medium and 19 low.**

## Method

**The source.** arXiv 1810.06454v5 (<https://arxiv.org/pdf/1810.06454v5>), which the authors label the final published
version, 74 pages, re-downloaded on 2026-10-02. Its SHA-256 (`835580aa…1f20a`) equals the extraction's. The Duke version
was not read.

**The passes.** Four parallel passes were run by this session.
- Three read all 74 pages, checking decisive formulas on page images: §§1–3 (pp. 1–24); §4 (pp. 25–38), with the
  dimensions and Hodge numbers recomputed for k ≤ 12; and §5 with the appendix and references (pp. 39–74).
- One checked the six routes, the 36 prerequisites, the planned and library statuses and the briefs against the atlas,
  the packets, other accepted extractions and the pinned libraries.

**Merging and severity.** Thirteen sets of duplicate findings, two to five in each, were merged. I downgraded /31 (item
63's sign exponent) from high to medium: it misdescribes what p. 56 explains but states nothing false about the
mathematics.

**What I re-verified myself.** Every high finding, against the text and the atlas:
- **/1.** Lemma 5.40 (p. 58) compares ε-factors, which only ET.6 plans. `stage-edges.json` has R01.2 → R01.4 → G7 →
  AG2.0 → AG2.1a → ET.6. With every accepted restructuring applied there is also R01.2 → DWP.5 → AG2.1a → ET.6.
- **/2.** The RD.6 and RD.7 stage texts and the RD packet plan none of items 55, 56, 61, 83 and 84.
- **/3.** Both new roadmaps plan characteristic-zero D-modules, and neither result file names the other.
- **/4.** On the nodal cubic, H¹ of the constant sheaf has weight 0 < 0 + 1.
- **/5.** Corollary 4.9(2) on p. 28 concludes N = j_{0†+}, the intermediate extension.
- **/6.** §5.3.2 (p. 56) takes weakly compatible systems of continuous semisimple representations.
- **/7.** On p. 50, for k = 9, p = 3, a = 3, the constant term is 18 = 2(√−3)^4, not a unit times (√−3)².

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** research/blueprint/papers/PAPER-FRESAN-SABBAH-YU-22.result.json route 6 (source
ArithmeticGaloisRepresentations:R01.2), item /89 (Lemma 5.40); report section 'The routes' item 6

**Claim.** Lemma 5.40 concludes that r and its graded representation r̄ have the same L- and ε-factors, and its proof
uses Deligne's local constant ε₀ (Deligne 1973, Th. 4.1(1)). R01.2 plans decomposition and inertia groups,
quasi-unipotence, the Weil–Deligne representation and semisimplification only: it plans no L-factor, no ε-factor and no
purity of Weil–Deligne representations (the review's statement that R01.2 'owns Weil–Deligne representations and local
epsilon-factors' is wrong). The only atlas owner of Weil–Deligne-side local constants is
EndoscopicTransferAndUnitaryTraceComparison:ET.6, and ET.6 depends on R01.2 through R01.2 → R01.4 → G7 →
AutomorphicGaloisRepresentationsPartII:AG2.0 → AG2.1a → ET.6. Placing item 89 in R01.2 therefore forces R01.2 to import
ET.6: a dependency cycle.

**Evidence.** Paper p. 58, Lemma 5.40: 'Then the Weil-Deligne representation associated with r is pure as well, and r
and r̄ have the same L and ε-factors.' Proof: 'By its defining properties (see [8, Th.4.1(1)]), the factor ε0(ρ, s) in
(5.33) only depends on the semi-simplification of r.' Stage ArithmeticGaloisRepresentations:R01.2
(research/blueprint/atlas/roadmaps/ArithmeticGaloisRepresentations.json): 'For ℓ different from the residue
characteristic, prove quasi-unipotence and construct the monodromy operator and Weil–Deligne representation ...
Distinguish the full object, its semisimplification, and its Frobenius semisimplification.' Stage ET.6: 'Construct local
constants on both Weil–Deligne and analytic sides and prove the normalization dictionary'.
research/blueprint/atlas/stage-edges.json contains R01.2→R01.4, R01.4→G7, G7→AG2.0, AG2.0→AG2.1a, AG2.1a→ET.6.

**Fix.** Move item 89 out of route 6. Either put it in the KloostermanMomentsAndPotentialAutomorphy route (its only
consumer; its brief then imports the Weil–Deligne representation from ArithmeticGaloisRepresentations:R01.2, the
monodromy filtration from LefschetzPencilsAndVanishingCycles:LPV.1 and ε₀ from
EndoscopicTransferAndUnitaryTraceComparison:ET.6), or route it as a source item of PeriodsAndSpecialValues:PS.1 ('Define
completed motivic L-functions from local Weil–Deligne data'), with links R01.2→PS.1 and ET.6→PS.1 (PS.1 reaches neither
stage, so no cycle). Route 6 then carries only the planned item 88 (or is dropped). Rewrite the route-6 reason and the
report's route 6 paragraph accordingly.

### /2 — other

**Where.** research/blueprint/papers/PAPER-FRESAN-SABBAH-YU-22.result.json route 4 (source
PadicDifferentialEquationsAndRigidCohomology:RD.6, RD.7), items /55, /56, /61, /83, /84; report section 'The routes'
item 4; research/blueprint/papers/PAPER-FRESAN-SABBAH-YU-22.result.json route 'source' to
PadicDifferentialEquationsAndRigidCohomology (items /61, /83) versus route 'new'
KloostermanMomentsAndPotentialAutomorphy (brief)

**Claim.** RD.6 and RD.7 do not plan what route 4 sends there, and the five items are statements about objects of the
Kloosterman roadmap. RD.6 plans the rigid trace formula, the p-adic Fourier transform and Kedlaya's Weil II for
overconvergent F-isocrystals; RD.7 the rigid–crystalline comparison for smooth proper X/F_q and the export of Weil
factors to WeilConjectures WC.6. Neither plans the Kloosterman F-isocrystal or Robba's Theorem B (61), H¹_rig of Sym^k
Kl through 𝒦 (83), Mieda's p-adic Picard–Lefschetz formula and semistable model (84), the de Rham, semistable and
crystalline properties of V_{k,p} (55, Proposition 5.23), or Newton above Hodge for Z_k(p;T) (56). The accepted RD
packet (304 nodes over RD.0–RD.7) has no such node; Dwork's rank-two Bessel isocrystal occurs there only as an
acceptance example at RD.1/RD.2. The items use V_{k,p} (item 76), 𝒦 (42), 𝒦̄ (74), 𝒦̄' (79), Q_{ap}, Q_{bp} (75), the
Hodge numbers of Theorem 1.8, CP.2–CP.4 and R06.1–R06.2, all of which RD.6 and RD.7 would have to import. The KM route
imports RD.4/RD.6, and its item 90 needs Proposition 5.23 (item 55). So the source route makes a foundational p-adic
layer, whose consumer is WeilConjectures WC.6, depend on the Kloosterman roadmap and through it on
MixedHodgeModulesAndIrregularHodgeTheory. Item 61 also conflicts with RT-PAPER-XU-ZHU-22/6, which found the same
F-isocrystal planned in KloostermanSheavesAndBesselIsocrystals. Coordinator note: RT-PAPER-XU-ZHU-22 is this session's
red team (PR #5625); its finding /6 accepted RD.6 as the owner of the GL_n Kloosterman F-isocrystal (FSY item 61). This
finding moves the Kloosterman-specific items off RD.6, so the two fix jobs must agree on one owner; the finding rests on
RD.6/RD.7's stage text and the RD packet, not on that red team. Also: Item 83 is the rigid analogue of Theorem 3.12. It
computes H^1_rig of Sym^k Kl_{n+1} through the torus sum f-tilde_k and the hypersurface 𝒦. The Kloosterman F-isocrystal
of item 61 is likewise specific to this paper. Both are routed as a 'source' into RD.6, a general layer ('Trace formula,
Fourier transform and p-adic weights'), and do not belong inside it. Their étale twin, item 44, is owned by
KloostermanMoments. Meanwhile the KloostermanMoments brief also asks that roadmap to cover 'the p-adic realization, its
de Rham, semistable and crystalline properties and the comparison with rigid cohomology'. So the same mathematics has
two owners. RD.6 would need the hypersurface 𝒦 and the χ_n-isotypic Thom–Sebastiani decomposition, which
KloostermanMoments builds while importing RD.4/RD.6. That makes a dependency loop between the two roadmaps.

**Evidence.** Stage RD.6: 'Over F_q, construct the rigid Lefschetz trace formula ... Build the p-adic Fourier transform
... Prove sharp compact-support weight inequalities for the specified overconvergent F-isocrystals, then smooth-proper
purity.' Stage RD.7: 'For smooth proper X/F_q, construct rational rigid--crystalline comparison ... Export equality in
Q[T] ... to WC.6.' research/blueprint/packets/PadicDifferentialEquationsAndRigidCohomology.json: its RD.6 and RD.7 nodes
(RD.6/dwork-isocrystal, RD.6/p-adic-weil-ii, RD.7/rigid-crystalline-comparison, ...) contain no Kloosterman,
Robba-Theorem-B or Mieda node. Paper p. 50: 'Since the singularities of 𝒦̄′ consist only of ordinary quadratic points
supported on 𝒦̄′_{F_p}, the p-adic Picard-Lefschetz formula [42, Th. 1.1] yields a commutative diagram'. Paper p. 58:
'r^ss_{k,ℓ} is de Rham at all primes ℓ and crystalline if ℓ > k by Proposition 5.23.' The route's own reason says only
that §§3.2.2 and 5.1.5 'are a clean source for all of them'. Also: Item 83 statement: 'H¹_{rig,mid}(G_m/K, Sym^k
Kl_{n+1}) ≅ gr^W_{kn+1}[H^{kn−1}_{rig,c}(𝒦/K)(−1)]^{𝔖_k×μ_{n+1},χ_n} ...'; route reason: 'The items routed here are the
Kloosterman F-isocrystal with Robba's dimension count ..., the expression of that cohomology through the hypersurface 𝒦
...'. Atlas RD.6: 'Over F_q, construct the rigid Lefschetz trace formula ..., define algebraic/iota weights ... Build
the p-adic Fourier transform and conductor/radius estimates needed for Kedlaya's Weil II theorem.' KloostermanMoments
brief: 'Then: the ℓ-adic realizations V_{k,ℓ} of 𝑴_k ...; the p-adic realization, its de Rham, semistable and
crystalline properties and the comparison with rigid cohomology'; its import list: 'rigid cohomology with its Frobenius
from PadicDifferentialEquationsAndRigidCohomology RD.4 and RD.6'. Paper p. 25: '(3.13) H^1_rig,?(Gm/K, Sym^k Kln+1) =
H^{kn+1}_rig,?(G^{kn+1}_m/K, Lϖ f̃k)^{Sk×µn+1,χn}'.

**Fix.** Move items 55, 56, 61 and 83 into the KloostermanMomentsAndPotentialAutomorphy route; the ℓ-adic Kloosterman
sheaf and the Kloosterman connection are already there, and KloostermanSheavesAndBesselIsocrystals imports its
Kloosterman foundations from that roadmap. In the KM brief, import rigid cohomology with compact supports and its
Frobenius from PadicDifferentialEquationsAndRigidCohomology:RD.4, finiteness and Poincaré duality from RD.5, Kedlaya's
weights from RD.6, the comparison theorems from CohomologyComparisons:CP.2–CP.4, and the period rings and functors from
PadicHodgeTheory:R06.1–R06.2. Restate item 84 in its general form: for a proper flat scheme over Z_p whose special fibre
has only ordinary quadratic singularities, there are the semistable model obtained by blowing them up after base change
to Z_p[√−p] and the Frobenius-compatible injection H_rig → H_dR of Mieda, Th. 1.1 and (2.3). Route it as a source item
of CohomologyComparisons:CP.4, which neither reaches nor is reached by RD.4, or keep it in KM. Drop route 4. Note for
the XU-ZHU fix (RT-PAPER-XU-ZHU-22/6): the owner of the Kloosterman F-isocrystal becomes
KloostermanMomentsAndPotentialAutomorphy, not RD.6. Also: Move items 83 and the Kloosterman part of 61 (Kl_{n+1} =
Rπ_{rig*}L_{ϖf}[n], rank n+1, pure of weight n by Crew; Robba's dimension count) into route
KloostermanMomentsAndPotentialAutomorphy. Keep the source route to RD.4/RD.6 only for the general planned inputs:
Dwork's isocrystal, weights, localisation and Gysin (see the previous finding). The §5 items 55, 56 and 84 on the same
route should be checked the same way (outside this scope).

### /3 — duplicate

**Where.** research/blueprint/papers/PAPER-FRESAN-SABBAH-YU-22.result.json route 1 (new
MixedHodgeModulesAndIrregularHodgeTheory), brief clause 'Algebraic D-modules on a smooth variety over a field of
characteristic zero ...', reason 'The atlas has no D-modules at all', item /9; versus
research/blueprint/papers/PAPER-BREUIL-HELLMANN-SCHRAEN-19.result.json route 1 (new
SpringerResolutionAndCharacteristicCycles), item 2.4-dmodules

**Claim.** Two accepted new roadmaps both build the characteristic-zero D-module foundations, and neither mentions the
other. FSY's MixedHodgeModulesAndIrregularHodgeTheory plans holonomic and regular holonomic modules, direct and inverse
images, j_!, j_*, j_{!*} and duality. BREUIL-HELLMANN-SCHRAEN-19's SpringerResolutionAndCharacteristicCycles, as fixed
by FIX-RT-PAPER-BREUIL-HELLMANN-SCHRAEN-19, plans 'coherent D-modules, good filtrations, characteristic varieties and
cycles, holonomic and regular holonomic G-equivariant D-modules' and says D-modules 'are built here'. Other consumers
have meanwhile been pointed at the FSY roadmap: the microlocal Part II from the RT-AREA-etale fixes takes 'regular
holonomic D-modules from the D-module layer of MixedHodgeModulesAndIrregularHodgeTheory', and RT-PAPER-XU-ZHU-22/8 asks
KloostermanSheavesAndBesselIsocrystals to import them from there too. PROTOCOL §15 requires one owner, planned in the
most general form its users need. The FSY brief's D-module scope is narrower than those users need: it has no good
filtrations or characteristic cycles and no equivariant or stack versions. Coordinator note:
PAPER-BREUIL-HELLMANN-SCHRAEN-19 was fixed by this session (PR #5256), and RT-PAPER-XU-ZHU-22 is this session's red team
(PR #5625), whose finding /8 asked the Kloosterman roadmap to import characteristic-0 D-modules; both are cited only as
existing routings.

**Evidence.** FSY route 1 brief: 'Construct, in order. Algebraic D-modules on a smooth variety over a field of
characteristic zero: holonomic and regular holonomic modules, the derived direct and inverse images for an open
immersion, the functors j_!, j_* and the intermediate extension j_{!*}, duality ...'. PAPER-BREUIL-HELLMANN-SCHRAEN-19
item 2.4-dmodules: 'For a smooth variety Y over a field of characteristic 0: coherent D_Y-modules, good filtrations, the
characteristic variety and characteristic cycle ...; holonomic and regular holonomic D-modules' with note 'No stage
plans D-modules; route 1 builds them'. Its route-1 reason: 'nor D-modules, which are built here'.
research/blueprint/redteam/RT-AREA-etale.fixes.md: 'regular holonomic D-modules from the D-module layer of
MixedHodgeModulesAndIrregularHodgeTheory (PAPER-FRESAN-SABBAH-YU-22 route 1), or as a request to it.' Neither result
file contains the other roadmap's id.

**Fix.** Make MixedHodgeModulesAndIrregularHodgeTheory the single owner of characteristic-zero algebraic D-modules. Its
brief's D-module layer should plan coherent D-modules, good filtrations, characteristic varieties and cycles, holonomic
and regular holonomic modules, equivariant D-modules, arbitrary direct and inverse images, duality, and j_!, j_*,
j_{!*}, as the Springer, microlocal and Kloosterman-sheaf consumers need. Add those consumers to the brief. In
PAPER-BREUIL-HELLMANN-SCHRAEN-19, change item 2.4-dmodules to 'planned (MixedHodgeModulesAndIrregularHodgeTheory,
D-module layer)', and change its route-1 brief to import the D-modules and plan only Beilinson–Bernstein localisation
and characteristic cycles on G/B×G/B. Alternatively, choose SpringerResolutionAndCharacteristicCycles as owner and make
the FSY brief import from it, but record one owner either way. Delete the sentence 'The atlas has no D-modules at all'
from the route-1 reason and from the report.

### /4 — error

**Where.** research/blueprint/papers/PAPER-FRESAN-SABBAH-YU-22.result.json item /5 (statement)

**Claim.** Item 5 states Weil II for 'a lisse sheaf pure of weight w on a variety over a finite field' and says that
'the ordinary étale cohomology has weights ≥ w + i'. The lower bound needs X smooth: it comes from the compact-support
bound by Poincaré duality. On a singular variety it is false. The item's 'consequently the middle-extension cohomology
is pure' also needs smoothness. The paper applies the result only on the smooth curve G_m, so the effect is limited, but
the statement as written is false.

**Evidence.** Counterexample: X the split nodal cubic y² = x²(x+1) in P², over F_q, and F = Q_ℓ (lisse, pure of weight
0). From 0 → Q_ℓ → ν_*Q_ℓ → i_*Q_ℓ → 0 (ν: P¹ → X the normalisation, i the node), H¹(X̄, Q_ℓ) ≅ coker(H⁰(P¹) →
H⁰(ν^{-1}(node))) ≅ Q_ℓ with Frobenius acting trivially. That is weight 0 < 0 + 1. The owner stage
DeligneWeightsAndPurity:DWP.7 states it correctly (research/blueprint/atlas/roadmaps/DeligneWeightsAndPurity.json): 'For
X₀ smooth and F lisse of weights≥w, use Poincaré duality to prove H^i(X,F) weights≥w+i. Therefore for smooth X and lisse
pure F the image of H^i_c→H^i is pure … a pure stalk condition on an arbitrary singular-space sheaf does not by itself
give the same ordinary-cohomology lower bound.' Paper p. 6: 'Since the étale cohomology and the étale cohomology with
compact support of Sym^k Kl₂ have weights ⩾ k + 1 and ⩽ k + 1 respectively by the main theorem of Weil II' (on G_m).

**Fix.** Replace the statement of item 5 with: 'Let X be a separated scheme of finite type over F_q and F a
constructible Q̄_ℓ-sheaf, mixed of weights ≤ w. Then H^i_c(X̄, F) is mixed of weights ≤ w + i (Weil II, 3.3.1). If
moreover X is smooth and F is lisse and punctually pure of weight w, then H^i(X̄, F) is mixed of weights ≥ w + i, so the
image of H^i_c(X̄, F) → H^i(X̄, F) is pure of weight w + i. For F lisse and pure of weight w on an open curve U ⊂ C, the
inertia invariants (F_η̄)^{I_x} at x ∈ C ∖ U have weights ≤ w (Weil II, Lemme 1.8.1).' The last clause is the form used
on p. 24, in (3.11).

### /5 — error

**Where.** research/blueprint/papers/PAPER-FRESAN-SABBAH-YU-22.result.json item /46

**Claim.** The second clause of item 46 says that a proper submodule N of j_{0*}Sym^k Kl_2 with j_0^*N = Sym^k Kl_2
'equals j_{0!}Sym^k Kl_2'. The paper's conclusion is N = j_{0†+}Sym^k Kl_2, the intermediate extension (j_{0!*} in the
extraction's own notation, item 47). As written the clause is false: since the monodromy at 0 is unipotent with
invariants, j_{0!}Sym^k Kl_2 -> j_{0*}Sym^k Kl_2 has kernel i_{0+}C (dual, via the self-duality of Prop. 4.6(2), to the
cokernel i_{0+}C of j_{0!*} -> j_{0*} computed on p. 30), so j_{0!}Sym^k Kl_2 is not even a submodule of j_{0*}Sym^k
Kl_2. The first clause likewise writes j_{∞!} for the paper's j_{∞†+} (true here only because the two coincide when the
formal regular part has no invariants). The item also drops 'The same is true for Sym^k Kl-tilde_2' from clause (2),
which Prop. 4.12 and Prop. 4.20 use for the cover.

**Evidence.** p. 28, Cor. 4.9: '(1) The natural morphism j∞†+ Sym^k Kl2 → j∞+ Sym^k Kl2 is an isomorphism if k ≢ 0 mod
4. The same holds for Sym^k Kl̃2 if k ≢ 0 mod 2. (2) Let N be a proper C[z]⟨∂z⟩-submodule of j0+ Sym^k Kl2 satisfying
j0^+ N = Sym^k Kl2. Then the equality N = j0†+ Sym^k Kl2 holds. The same is true for Sym^k Kl̃2.' p. 30: 'We consider
the intermediate extension D_P1-modules j†+ Sym^k Kl2 ...'; 'the cokernel of the injective morphism of C[z]⟨∂z⟩-modules
j0†+ Sym^k Kl2 → j0+ Sym^k Kl2 is equal to i0+C'. p. 27: 'FT(M2) is equal to the intermediate extension j0†+ Kl̃2'.

**Fix.** Replace the statement of item 46 by: 'With j_0, j_∞ the inclusions of G_m into A^1_z and A^1_{1/z}: (1) the
natural morphism j_{∞!*}Sym^k Kl_2 → j_{∞*}Sym^k Kl_2 is an isomorphism if k ≢ 0 mod 4, and j_{∞!*}Sym^k Kl-tilde_2 →
j_{∞*}Sym^k Kl-tilde_2 is an isomorphism if k is odd; (2) if N is a proper C[z]⟨∂_z⟩-submodule of j_{0*}Sym^k Kl_2 with
j_0^*N = Sym^k Kl_2, then N = j_{0!*}Sym^k Kl_2 (the paper's j_{0†+}), and the same holds for Sym^k Kl-tilde_2.'

### /6 — error

**Where.** research/blueprint/papers/PAPER-FRESAN-SABBAH-YU-22.result.json items /58 and /59 (also /8); route 3 (source
ML.2) reason

**Claim.** Item 58 states Patrikis–Taylor's Theorem A for an arbitrary weakly compatible system {r_ℓ}, and item 59
states Corollary 5.39 the same way. The paper's (and BLGGT 5.1's) weakly compatible systems consist of continuous
SEMISIMPLE representations; the hypothesis is dropped. Without it the statement is false as written: Galois
representations attached to automorphic representations are semisimple, and a non-semisimple r_ℓ stays non-semisimple on
any open subgroup, so it can never 'become automorphic'. The dropped hypothesis is exactly why §5.3.3 passes to
r^ss_{k,ℓ} and needs Serre's theorem (item 91) and Lemma 5.40 (item 89); as stated, item 58 would make both unnecessary.

**Evidence.** p. 56, §5.3.2: 'We consider a weakly compatible system of continuous semi-simple representations r_ℓ:
Gal(Q̄/Q) → GL_m(Q̄_ℓ)'. p. 58: 'By [58, Th. 4.2.1], the semi-simplification r^ss_{k,ℓ} also factors through GO_m(Q̄_ℓ)
(resp. GSp_m(Q̄_ℓ)) ... Therefore, the r^ss_{k,ℓ} form a weakly compatible system satisfying the assumptions of the
theorem of Patrikis and Taylor'.

**Fix.** Item 58: replace 'let {r_ℓ: Gal(Q̄/Q) → GL_m(Q̄_ℓ)} be a weakly compatible system' with 'let {r_ℓ: Gal(Q̄/Q) →
GL_m(Q̄_ℓ)} be a weakly compatible system of continuous semisimple representations'. Item 59: 'For a weakly compatible
system 𝓡 of semisimple representations that is pure of weight w, regular and odd essentially self-dual, ...'. Item 8:
add 'of continuous semisimple representations'. Route 3 reason: 'a weakly compatible system of semisimple
representations which is pure, regular and odd essentially self-dual'.

### /7 — error

**Where.** research/blueprint/papers/PAPER-FRESAN-SABBAH-YU-22.result.json item /84 (and /55, whose proof it supplies);
sourceIssues (missing entry)

**Claim.** Item 84 repeats the paper's claim that, over Z_p[√−p], every ordinary quadratic point of 𝒦̄' (𝒦̄ for odd k)
is formally Q − u(√−p)² with u a unit, so that one blow-up gives a semistable model. That is false whenever p divides a
(odd k) or b (even k). The constant term of g^{⊞k} at the point indexed by a is c = 2ap, with v_p(c) = 1 + v_p(a). By
the formal Morse lemma the equation is Q(z) = −c, i.e. Q − u(√−p)^{2e} with e = 1 + v_p(a). Such points exist if and
only if p² ≤ k (odd k), or 2p² ≤ k (even k, b = 2p). Counterexample: k = 9, p = 3, a = 3. The point y = (1,…,1) has
local equation 18 + Σ_{i≤9} z_i² + (higher order) = 0, and 18 = 2·(√−3)^4. The Tjurina length of O[[z]]/(f, ∂f) is
v_{√−3}(18) = 4, not 2, so it is not of the form Q − u(√−3)². After one blow-up the chart z = √−3·z' gives Q(z') =
u(√−3)², which is still singular, and the special fibre contains the quadric cone Q(z') = 0, so it is not semistable.
The same happens for k = 18, p = 3, b = 6 (c = 36). The proof of Proposition 5.23 (semistability over Q_p(√−p), and the
inclusion (5.24) through Mieda's β) and hence of Corollary 5.27 is therefore incomplete for p² ≤ k (odd k) and 2p² ≤ k
(even k). The statements are recovered for those p by Remark 5.41 (potential automorphy), and plausibly by iterated
blow-ups. The main theorems only use p > k, where 𝒦̄' is smooth.

**Evidence.** p. 50: 'Besides, over the ring of integers Z_p[√−p] of L, with uniformizer √−p, each ordinary quadratic
point of 𝒦̄' is formally defined by an equation Q − u·(√−p)², where u is some unit ... Let 𝒦̄'' be the blow-up of 𝒦̄' ⊗
Z_p[√−p] along the ordinary quadratic points. Then 𝒦̄'' is semistable over Z_p[√−p] by loc. cit.' Against p. 41: 'the
orbits are indexed by odd positive integers a such that ap ⩽ k ... the defining equation of 𝒦 in Z_p[[z_1,…,z_k]] is
given by g^{⊞k}(z) = 2ap + Q_{ap} + higher order terms'. p. 45: (5.16) '2bp + Q_{bp} + higher order terms'.

**Fix.** Item 84: replace the local-form sentence with: 'At the ordinary quadratic point indexed by a (odd k) or b (even
k), the formal equation over Z_p is Q(z) = −c with c = 2ap (resp. 2bp), v_p(c) = 1 + v_p(a) (resp. 1 + v_p(b)). Over
Z_p[√−p] it is Q − u(√−p)^{2e}, e = v_p(c), u a unit. When e = 1 the blow-up at the point is semistable (Mieda 2007,
(2.3)). Points with e ≥ 2 occur exactly when p² ≤ k (k odd) or 2p² ≤ k (k even), and need a different argument (iterated
blow-ups, to be checked against Mieda's hypotheses), or Remark 5.41.' Add the sourceIssue E8 (gap, p. 50, reach: the
proof of Proposition 5.23 and Corollary 5.27 for small p; the stated results survive by Remark 5.41). Record in item
55's note that the paper's proof covers only p² > k (odd k) and 2p² > k (even k).

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | result route 6 (source ArithmeticGaloisRepresentations:R01.2), item …; … | Lemma 5.40 concludes that r and its graded representation r̄ have the same L- and ε-factors, and its proof uses Deligne's local constant ε₀ (Deligne 1973, Th. … |
| /2 | high | other | result route 4 (source …; … | RD.6 and RD.7 do not plan what route 4 sends there, and the five items are statements about objects of the Kloosterman roadmap. RD.6 plans the rigid trace … |
| /3 | high | duplicate | result route 1 (new MixedHodgeModulesAndIrregularHodgeTheory), brief …; … | Two accepted new roadmaps both build the characteristic-zero D-module foundations, and neither mentions the other. FSY's … |
| /4 | high | error | result item /5 (statement) | Item 5 states Weil II for 'a lisse sheaf pure of weight w on a variety over a finite field' and says that 'the ordinary étale cohomology has weights ≥ w + i'. … |
| /5 | high | error | result item /46 | The second clause of item 46 says that a proper submodule N of j_{0*}Sym^k Kl_2 with j_0^*N = Sym^k Kl_2 'equals j_{0!}Sym^k Kl_2'. The paper's conclusion is N … |
| /6 | high | error | result items /58 and /59 (also /8); … | Item 58 states Patrikis–Taylor's Theorem A for an arbitrary weakly compatible system {r_ℓ}, and item 59 states Corollary 5.39 the same way. The paper's (and … |
| /7 | high | error | result item /84 (and /55, whose proof it supplies); … | Item 84 repeats the paper's claim that, over Z_p[√−p], every ordinary quadratic point of 𝒦̄' (𝒦̄ for odd k) is formally Q − u(√−p)² with u a unit, so that one … |
| /8 | medium | error | result route 1 brief, 'Import, and do not rebuild' clause and …; … | The brief names the wrong suppliers for the topological side of mixed Hodge modules, and its D-module scope is too narrow. (a) It imports 'nearby and vanishing … |
| /9 | medium | duplicate | result route 1 brief ('Scope of Saito's theory, which nothing in the …; … | Two accepted Part IIs of the Tau Ceti Hodge-structures roadmap already plan part of the Hodge-theoretic content that route 1 says it must build. … |
| /10 | medium | duplicate | result route 3 (source ModularityAndLanglandsExtensions:ML.2), items …; … | Two problems. (1) Item 59 bundles Remark 5.41, which is about the Kloosterman system: {r_{k,ℓ}} is strictly compatible, r_{k,p} is semistable or crystalline, … |
| /11 | medium | other | result route 2 (KloostermanMomentsAndPotentialAutomorphy), items /87, …; … | Three general cited theorems are routed to the application roadmap, against PROTOCOL §15, which says a general notion is planned once, in its owner. Item 87 is … |
| /12 | medium | error | result item /5 (planned: DeligneWeightsAndPurity:DWP.4, …; … | The planned stages are wrong. DWP.4 is Weil I for smooth projective varieties with constant coefficients and explicitly does not use DWP.5–9. R34.5 is only an … |
| /13 | medium | error | result item /7 (planned: PadicHodgeTheory:R06.5); … | Item 7 is the definitions: Fontaine's period rings B_dR, B_st and B_crys, the functors, and the notions of de Rham, semistable and crystalline representation … |
| /14 | medium | error | result item /8 (planned: PotentialAutomorphyInfrastructure:PA.5); … | PA.5 does not own the notions in item 8. It imports compatible systems from PotentialModularityAndCompatibleSystems:R24.5:operations and only transports a … |
| /15 | medium | error | result item /3 (planned: LefschetzPencilsAndVanishingCycles:LPV.0, …; … | Item 3's own locator says ψ and φ are 'taken in the sense of mixed Hodge modules'. LPV.0 and LPV.6 plan only étale nearby cycles over a henselian trait and … |
| /16 | medium | error | result prerequisites records 3, 4, 5, 7/25, 14, 15, 2 (in file order) …; … | Five prerequisite records cite works that are not the paper's references, and two works are listed twice. (3) cites Sabbah, J. reine angew. Math. 621 (2008), … |
| /17 | medium | missing | result prerequisites (completeness and classification) | Several works whose results the proofs use are missing from prerequisites. Sabbah–Yu [52], Th. 1.3(4), gives the twisted de Rham fibres (A.16)–(A.17) behind … |
| /18 | medium | duplicate | result items /29 and /33; … | The accepted FiniteFieldsAndCharacterSums packet now plans, as FF.2 nodes, several things the extraction marks missing and routes to the new Kloosterman … |
| /19 | medium | missing | result items /10, /37, /44 (no item records the convolution theorem … | Two steps on the main chain rest on 'Fourier transformation exchanges additive convolution and tensor product', and no item states it. The first is Proposition … |
| /20 | medium | missing | result item /41 (proof of Theorem 3.2); … | The proof of Theorem 3.2 (pp. 20–21) has to show H¹_mid = W_{kn+1}H¹, equation (3.5). Its last step is the stationary phase formula: the microlocalization of … |
| /21 | medium | missing | result items /36 and /67 (Proposition 2.7); … | Proposition 2.7, that the symmetric powers are irreducible, uses two inputs. The first is Katz's computation of the differential Galois group, which is item … |
| /22 | medium | missing | result item /43; … | The definition (3.1) of the middle motive M_k takes gr^W_{kn+1} of a Nori motive. The paper relies on the existence of a weight filtration on Nori motives … |
| /23 | medium | missing | result items /38, /39, /41–/44, /52 (definitions on pp. 12, 14 and 19) | Four definitions that the main statements depend on are not recorded. (a) Sym^k E is defined as the S_k-invariants of E^{⊗k}, with the Kummer … |
| /24 | medium | error | result item /40 (Lemma 2.24 clause) | Item 40 ends with 'Moreover M-tilde is irreducible and is the image of the canonical map from the ! to the * extension.' That is not what Lemma 2.24 says. Read … |
| /25 | medium | missing | result item /60 (and item /33); … | The paper turns deg Z_k(p;T) into the Swan conductor at infinity by the ℓ-adic Grothendieck–Ogg–Shafarevich formula (p. 5). The degree drop of that conductor … |
| /26 | medium | error | result item /72 (definition of non-degenerate compactification) and … | The paper's paraphrase of Mochizuki's definition, which item 72 copies, cannot be right as printed, and sourceIssues does not record it. (a) The multi-index is … |
| /27 | medium | missing | result item /71 (note only); … | The formal structure of Kl_2 at infinity, from which Prop. 4.6(3), the irregularity ⌊(k+1)/2⌋, the dimension formulas (4.11) and (4.13) and the exceptional … |
| /28 | medium | duplicate | result item /72 and route KloostermanMomentsAndPotentialAutomorphy … | Item 72 and the KloostermanMoments brief plan the toric compactification X of G_m^k. This is the smooth complete toric variety of the regular fan with 3^k − 1 … |
| /29 | medium | missing | result items /6, /61, /83 (statements and statuses); … | §3.2.2 (p. 25) proves (3.14) and the expression of H^1_rig,mid through 𝒦 from four cited inputs that no item records. They are Kedlaya's p-adic Weil II, … |
| /30 | medium | error | result item /73, last sentence | Item 73 ends: 'In particular every section of Ω^r_X(log D)((r − p)P) defines a class in F^pH^r_dR(U, E^f)'. For r < dim U this is false. A section of the … |
| /31 | medium | error | result item /63 | Item 63 says 'all terms of t_k other than ⌊k/8⌋ + δ_{8Z}(k) are accounted for' by the paper's computations at the odd primes of S and at infinity. That is … |
| /32 | medium | error | result item /13 (versus sourceIssues E6) | Item 13 states 'i^* Q_U^H ≅ Q_D^H', with Q^H the shifted (perverse) constant Hodge modules. That is the misprinted formula E6 corrects, and it is false by a … |
| /33 | medium | missing | result item /25; … | Item 25 records only the compactly supported half of Example A.27, H^r_c(A¹_t × V, tg) ≅ H^{r−2}_c(𝒦)(−1). The example also proves H^r(A¹_t × V, tg) ≅ … |
| /34 | medium | missing | result items /16, /17, /20 and /73 (no item for the cited inputs); … | The appendix's bifiltered de Rham fibres rest on cited theorems that no item records and the prerequisites do not list. (1) Sabbah–Yu [52, Th. 1.3(4)] gives … |
| /35 | medium | missing | result items /62 and /88 (inputs of §5.3.1) | The ε-factor computation of §5.3.1 (item 62) uses three cited results that no item records. (a) Deligne's local functional equation for ε₀ ('formulaire' (5.4), … |
| /36 | medium | missing | result items /86 and /53 (proof notes); … | The determination of det r_{k,ℓ} in the proof of Corollary 5.30 uses Chebotarev's density theorem (as does Remark 5.12, recorded in item 53's note). It turns … |
| /37 | low | error | result item /6 (planned: RD.4, RD.6) | Item 6's statement includes finiteness and Poincaré duality of rigid cohomology with coefficients, which RD.5 plans; the planned list omits RD.5. The item's … |
| /38 | low | library-claim | result item /1 (library) and baseline note; … | Item 1 cites mathlib:riemannZeta, but the paper never uses the Riemann zeta function; its only 'zeta' is the Hasse–Weil zeta function and a reference title. … |
| /39 | low | other | result route 1 and route 2 briefs, import clauses | PROTOCOL §16 asks briefs to name each import by title and id. Both briefs give bare ids ('LPV.0 and LPV.6', 'EDC.5', 'RD.4 and RD.6'). Some imports have no … |
| /40 | low | other | report, sections 'What the atlas and the libraries already have', … | The report repeats the statements found wrong above. It says the atlas has nothing on D-modules (SpringerResolutionAndCharacteristicCycles now plans them). It … |
| /41 | low | missing | result sourceIssues (§1.2, p. 5) | There is an unrecorded misprint in the definition of middle extension cohomology in §1.2. The left side is about Sym^k Kl₂, but the right side has Sym^k … |
| /42 | low | missing | result sourceIssues (§1.3, (1.9) and (1.10), p. 8) | The intro displays (1.9) and (1.10) contain two slips. (i) The middle term of (1.9), H¹_dR(G_m, Kl₂^{⊗k})^{sign}, is wrong for the natural S_k-action. Sym^k is … |
| /43 | low | missing | result sourceIssues (§1.1, Table 1, p. 4) | There is an unrecorded mistake in Table 1. For k = 7 the newform is printed as g ∈ S₃(Γ₀(125), (·/21)χ₅). The nebentypus (·/21)χ₅ has conductor 105, which does … |
| /44 | low | error | result items /3, /4, /33, /38, /42, /52, /64, /65, /67 (locators); … | Several page locators in pp. 1–24 are off. Item 3 cites '§3 … pp. 16–18', but pp. 16–18 are §2.3; the ψ/φ uses in §3 are on pp. 20–21. Item 4 cites '§1.2 … p. … |
| /45 | low | error | result notes of items /35, /36, /42 | Three notes misdescribe the paper. Item 35's note speaks of 'clause (4) … self-duality and clause (5) … Fourier transform', but Proposition 2.4 has only … |
| /46 | low | error | result item /30 | Item 30 never defines m for even k, yet its Λ'_k (via the 'analogous completion') needs m for the gamma factor. It also omits that m is deg M_k(p;T) = dim … |
| /47 | low | error | result prerequisites[14] (Broadhurst–Roberts) | Prerequisite 14 cites Broadhurst and Roberts, 'Quadratic relations between Feynman integrals' (PoS LL2018 053, doi 10.22323/1.303.0053). That paper is not in … |
| /48 | low | missing | result (no item for Remark 3.7) | No item records Remark 3.7, the degenerate case k = n = 1. There H¹(G_m, Kl₂) ≅ Q(−2) and H¹_c(G_m, Kl₂) ≅ Q(0), so H¹_mid(G_m, Kl₂) = 0. It is the case that … |
| /49 | low | error | result item /51 | Item 51 writes the basis vectors as 't^j e-tilde₀^k dt/t' and 'z^j e₀^k dz/z'. The paper's (and item 49's) basis vectors are v-tilde_0 and v_0, the generators … |
| /50 | low | missing | result item /47 | Item 47 gives the singularities and rank-one vanishing cycles only for Π(M-tilde). For M-tilde it records only the generic rank k and the size-k Jordan block … |
| /51 | low | missing | result items /9, /11 (neither records it) | The proof of Corollary 4.9(2) uses the description of regular holonomic D-modules near a point by gluing data. A submodule N of j_{0*}M with j_0^*N = M amounts … |
| /52 | low | error | result item /24 | Item 24 ends 'the same holds for the localized and dual-localized variants', which reads as both H^r and H^r_c being classical for both. Theorem A.24 claims … |
| /53 | low | other | result item /58 note versus route 3 (source … | Item 58's note says 'Nothing in the atlas plans it: ModularityAndLanglandsExtensions ML.2 is the potential-automorphy assembly of the ten-author CM programme, … |
| /54 | low | missing | result item /59 (Remark 5.41 part); … | Remark 5.41 moves the ℓ-adic information to the p-adic representation through the Weil–Deligne representation of a p-adic de Rham representation (Fontaine's … |
| /55 | low | missing | result sourceIssues; … | The report sets aside three real (minor) slips that should be sourceIssues. (a) Remark 5.28 says the even-k Hodge polygons of H¹_{dR,c} lie 'strictly above' … |

## Notes for the fix job

- **Routes.** Move item 89 out of R01.2, to the Kloosterman roadmap or PeriodsAndSpecialValues:PS.1. Move items 55, 56,
  61, 83 and 84 off RD.6/RD.7, and reconcile item 61 with RT-PAPER-XU-ZHU-22/6. Make one owner of characteristic-zero
  D-modules, together with the PAPER-BREUIL-HELLMANN-SCHRAEN-19 fix.
- **Statements.** Add smoothness to item 5, j_{0!*} to item 46 and "semisimple" to items 8, 58 and 59. Restate item 84
  and add a sourceIssue for its small-p gap.
- **Inputs and statuses.** Add the missing cited inputs and prerequisites, correct the planned stages of items 3–8,
  remove the duplicates of FF.2 and the Hodge Part IIs, and record the unrecorded misprints.
