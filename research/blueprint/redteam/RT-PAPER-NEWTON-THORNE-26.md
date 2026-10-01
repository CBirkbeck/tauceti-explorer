# RT-PAPER-NEWTON-THORNE-26

Red team of the accepted extraction PAPER-NEWTON-THORNE-26: Newton–Thorne, *Symmetric power functoriality for Hilbert
modular forms*, Annals of Mathematics 203 (2026), 283–347 (arXiv 2212.03595v2). Issue #4029.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`cc-442dc5` and its continuations);
- its review (`cc-38267a`).

**Result: 67 findings, 6 high, 26 medium and 35 low.**

## Method

**The source.** arXiv 2212.03595v2 (<https://arxiv.org/pdf/2212.03595v2>) was re-downloaded on 2026-10-01, with its
LaTeX source. Its SHA-256 is `6a156f7a…b328cb82c`, equal to the extraction's.

**The passes.** All 52 pages were read against the extraction in five parallel passes run by this session:
- §§1–2 and 6;
- §3;
- §4;
- §5;
- the routes and statuses, against `data/atlas.json`, the ModularityAndLanglandsExtensions blueprint, other papers'
  accepted routes, `make_queue.py` and the pinned libraries.

**Cited sources.** The passes read the BLGGT, NT23 and NT21b TeX sources to check cited statements.

**Merging.** I merged findings reported by two passes into one: the Goursat library claim, the stranded route 11 and its
connectedness theorem, and the route-15 brief's imports.

**What I re-verified myself:**
- the RAECSDC display and multiplier, in the TeX;
- the ML.2 and ML.3 overlap, against the blueprint packet;
- the R01.4 cycles, against the stage graph. Here the claim is narrowed: R16.3, R19.3 and AG2.6 are downstream of R01.4,
  but ArithmeticGaloisDuality R02.3 is not.

## The high findings

### /1 — missing

**Where.** PAPER-NEWTON-THORNE-26/local-langlands-rec; hilbert-symmetric-power-endpoint;
cm-field-conjugate-self-dual-endpoint; one-prime-transfer-criterion (no item for rec at archimedean places)

**Claim.** Nothing in the extraction covers the archimedean local Langlands correspondence rec_{F_v} for v | ∞ (GL_n(R)
and, for Theorem 6.5(2), GL_n(C)). Theorem A = Theorem 6.5(1), Theorem 6.5(2) and Lemma 2.1(1) all require
rec_{F_v}(Π_v) ≅ Sym^{n−1} ∘ rec_{F_v}(π_v) 'for each place v', infinite places included. The proof of Lemma 2.1 also
needs the archimedean dictionary: rec_{F_v}Π_v is determined by the labelled Hodge–Tate weights of r_{Π,ι}, together
with the central character (see E9). The direction (1)⇒(2) of Lemma 2.1 needs rec at ∞ as well, to show that Π is
regular algebraic. The only local-Langlands item, local-langlands-rec, is stated 'For a non-archimedean local field K of
characteristic 0'. No atlas stage plans the archimedean correspondence: ET.6 is for 'GL_m(E), E a finite extension of
Q_p', R16.3 imports ET.6, and AF.1 builds only (g,K)-module foundations. Other accepted extractions treat this as a
separate missing item: PAPER-GAN-ICHINO-18/llc-gln-arch and PAPER-CHENEVIER-TAIBI-20/archimedean-llc-gln, both routed to
AutomorphicFormsOnReductiveGroups:AF.1. As extracted, the main endpoint uses an undefined object at the infinite places,
and Lemma 2.1's archimedean step has no owner. The paper itself defines rec_K in §1.2 only for non-archimedean K.

**Evidence.** §1.2, p. 7: 'Let K be a non-archimedean characteristic 0 local field … When Ω = C, we have the local
Langlands correspondence rec_K for GL_n(K)'. Theorem A, p. 1: 'for each place v of F, we have an isomorphism of
Weil–Deligne representations rec_{F_v}(Π_n) ≅ Sym^{n−1} ∘ rec_{F_v}(π_v)'. Lemma 2.1(1), p. 9: 'for each place v of F,
we have rec_{F_v}(Π_v) ≅ Sym^{n−1} ∘ rec_{F_v}(π_v)'. Proof of Lemma 2.1, p. 10: 'The Weil group representation
rec_{F_v}Π_v for an infinite place v is determined by the labelled Hodge–Tate weights of r_{Π,ι} (cf. the proof of
[Tho24, Theorem 8.1])'. Theorem 6.5(2), p. 50: 'for every place w of E, rec_{E_w}(Π_{n,w}) ≅ Sym^{n−1} ∘
rec_{E_w}(π_w)'. Atlas data/atlas.json: no stage matches 'archimedean local Langlands', 'Langlands classification',
'W_ℝ' or 'Weil group of'. AF.1 description: 'Define compatible (g,K)-modules …' (no classification).

**Fix.** Add a construction item 'Archimedean local Langlands correspondence rec_R, rec_C': the bijection between
irreducible admissible (g,K)-modules of GL_n(R) (resp. GL_n(C)) and n-dimensional semisimple representations of W_R
(resp. W_C), with compatibility with twists, central characters and infinitesimal characters (Langlands; Knapp 1994).
Locator: Theorem A, Lemma 2.1, Theorem 6.5. Add a theorem item 'archimedean Hodge–Tate dictionary': for RAESDC Π,
rec_{F_v}(Π_v) for v | ∞ is determined by HT_τ(r_{Π,ι}) together with ω_{Π_v}, using E9's repair. Locator: proof of
Lemma 2.1, citing [Tho24, proof of Theorem 8.1]. Give both status missing and one source route to
AutomorphicFormsOnReductiveGroups (AF.1), as in PAPER-GAN-ICHINO-18/llc-gln-arch. Add both to usesItems of
hilbert-symmetric-power-endpoint, cm-field-conjugate-self-dual-endpoint and one-prime-transfer-criterion. Optionally
record a low 'gap' sourceIssue, affects nothing: §1.2 never defines rec_{F_v} for archimedean v, yet the main statements
use it.

### /2 — error

**Where.** PAPER-NEWTON-THORNE-26/galois-representation-attached (statement); sourceIssues (new misprint at §1.2, p. 8,
not recorded)

**Claim.** The paper's RAECSDC polarization condition and its multiplier formula disagree; the item copies both, so its
statement is false. The paper writes π^∨ ≅ π^c ⊗ (χ∘N_{F/F+}∘det) and claims multiplier ν∘r_{π,ι} = ε^{1−n} r_{χ,ι}. The
cited source fixes the convention the other way round. BLGGT §2.1 defines a polarized pair by π^c ≅ π^∨ ⊗
(χ∘N_{F/F+}∘det), and BLGGT Theorem 2.1.1(1) gives multiplier ε^{1−n} r(χ), where 'polarized' means r^c ≅ r^∨ ⊗ μ. Under
the paper's displayed convention the BLGGT character is χ^{−1}, so the multiplier is ε^{1−n} r_{χ,ι}^{−1}. Check at n =
1: π = ψ is an algebraic Hecke character of a CM field. The display gives ψψ^c = (χ∘N)^{−1}, so μ|_{G_F} = r_ψ r_ψ^c =
r_{χ,ι}^{−1}|_{G_F}, not r_{χ,ι}. Take ψ of infinity type z ↦ z^{−1} over an imaginary quadratic field, with χ adjusted
by δ_{F/Q} so that χ_v(−1) = −1. Then r_χ² ≠ 1, and the item's formula is false. The paper applies the multiplier only
with χ quadratic up to norm, for example ν∘s = ε^{1−n}δ^n on p. 13. Inversion is invisible there, so no result of the
paper changes; only the recalled statement, and the item that copies it, are wrong.

**Evidence.** §1.2, p. 8 (TeX l. 497): 'Suppose π is RAECSDC, with π^∨ ≅ π^c ⊗ (χ∘N_{F/F+}∘det) … Then [BLGGT, Theorem
2.1.1(1)] implies that r_{π,ι} extends to … G_n(Q̄_p) with multiplier ν∘r_{π,ι} = ε^{1−n} r_{χ,ι}'. BLGGT14 (arXiv
1010.2561 TeX, §2.1 'Terminology'): 'By a polarized automorphic representation … we mean a pair (π,χ) where … π^c ≅ π^∨
⊗ (χ∘N_{F/F+}∘det)'. Theorem 2.1.1(1): '(r_{l,ι}(π), ε_l^{1−n} r_{l,ι}(χ)) is a totally odd, polarized l-adic
representation', where polarized means ⟨r(σ)x, r(c_vσc_v)y⟩ = μ(σ)⟨x,y⟩. Item statement: 'If π is RAECSDC with π^∨ ≅ π^c
⊗ (χ ∘ N_{F/F⁺} ∘ det) … multiplier ν ∘ r_{π,ι} = ε^{1−n} r_{χ,ι}'.

**Fix.** In galois-representation-attached, replace the hypothesis with BLGGT's convention: 'π^c ≅ π^∨ ⊗
(χ∘N_{F/F⁺}∘det)', keeping χ_v(−1) = (−1)^n and multiplier ε^{1−n} r_{χ,ι}. Alternatively keep the paper's display and
change the multiplier to ε^{1−n} r_{χ,ι}^{−1}. Add a sourceIssue PAPER-NEWTON-THORNE-26/E32: kind misprint; locator
§1.2, arXiv v2 p. 8; printed 'π^∨ ≅ π^c ⊗ (χ∘N_{F/F+}∘det) … ν∘r_{π,ι} = ε^{1−n}r_{χ,ι}'; correction 'π^c ≅ π^∨ ⊗
(χ∘N_{F/F+}∘det)', as in [BLGGT14, §2.1]; reason: the n = 1 computation above; affects nothing; known: new.

### /3 — error

**Where.** PAPER-NEWTON-THORNE-26/section-4-quaternionic-forms (statement)

**Claim.** The item defines the base level as 'U₀ = ∏ U_{0,v} (Iwahori at Σ, maximal elsewhere)'. That is not the
paper's definition. At v ∈ Σ the quaternion algebra D is ramified and the paper takes the whole unit group, U_{0,v} = (D
⊗_F F_v)^×. Some proofs depend on this choice. The proof of Proposition 4.4 uses it to force π_{1,v} to be exactly
Steinberg rather than a twist of Steinberg. With the maximal compact O_{D_v}^× (the only sensible reading of 'Iwahori'
in a division algebra), forms of the unramified quadratic twist of Steinberg also occur. For p odd, localising at m_D
removes them, since r̄|G_{F_v} is trivial and the twist reduces to −1 at Frob_v. For p = 2 they survive. Their Galois
representations are extensions of χε^{−1} by χ with χ ≠ 1 unramified, which are not of type R_v. So Proposition 4.4(3),
the R_Q-module structure, fails, and the dyadic argument loses its local condition at Σ. The item also omits the local
conditions at p that m_D imposes: T_v^{(1)} ∈ m_D (non-ordinary), T_v^{(1)} − 1 ∈ m_D (ordinary), and T_v^{(2)} − 1 ∈
m_D for v ∈ S_p − Σ_p. These conditions select the local types on the quaternionic side.

**Evidence.** arXiv v2 §4 p. 30 (TeX l. 951): '• U0 = ∏_v U0,v = ∏_{v∉Σ}(O_D ⊗_{O_F} O_{F_v})^× × (∏_{v∈Σ}(D ⊗_F F_v)^×
is an open subgroup of (D ⊗_F A^∞_F)^×.' Proof of Proposition 4.4, p. 31: 'If v ∈ Σ_p, then π_{1,v} is the Steinberg
representation (not just a twist of the Steinberg representation – recall that by definition, U_{0,v} = (D ⊗_F F_v)^×).'
The definition of m_D, p. 31 (TeX ll. 963–966): 'If v ∈ S_p − Σ_p and r|G_{F_v} is non-ordinary, then T_v^{(1)} ∈ m_D.
If … ordinary, then T_v^{(1)} − 1 ∈ m_D. In either case, T_v^{(2)} − 1 ∈ m_D.' NT21b (arXiv 2009.07180 TeX l. 559) has
the same U₀ = (∏_{v∉Σ}(O_D⊗O_{F_v})^×) × (∏_{v∈Σ}(D⊗_F F_v)^×).

**Fix.** Replace '(Iwahori at Σ, maximal elsewhere)' with 'U_{0,v} = (O_D ⊗_{O_F} O_{F_v})^× for v ∉ Σ and U_{0,v} = (D
⊗_F F_v)^× (the full unit group) for v ∈ Σ, so that only π_{1,v} = St (not a twist) contributes at Σ'. Add the m_D
conditions at v ∈ S_p − Σ_p quoted above. Keep 'Iwahori at Σ' only in section-4-unitary-forms (V₀), where it is correct.

### /4 — error

**Where.** routes[2] (ArithmeticGaloisRepresentations, stages G7/R01.1/R01.4); items
PAPER-NEWTON-THORNE-26/all-primes-large-residual-image and PAPER-NEWTON-THORNE-26/local-conditions-large-image
(ownerStage ArithmeticGaloisRepresentations:R01.4)

**Claim.** Proposition 5.4 and the first conclusion of Theorem 5.9 are statements about the compatible system of an
automorphic π, but they are routed to R01.4, a foundational residual-image layer. Their own usesItems point downstream
of it, so the routing creates dependency cycles. all-primes-large-residual-image uses tamely-dihedral
(GL2AutomorphicRepresentationsAndTransfer:R16.3) and small-degree-quadratic-field (ArithmeticGaloisDuality:R02.3).
local-conditions-large-image uses quadratic-splitting-reciprocity, owned by SymmetricPowersByTensorFunctorialityLifting,
a Part II of ModularityAndLanglandsExtensions. The proof also needs r_{π,ι} with local–global compatibility at v₁, v₂
and at p (AG2/R19.3) and Fontaine–Laffaille theory (FiniteFlat R07.3). In the stage graph R01.4 reaches
GL2AutomorphicRepresentationsAndTransfer:R16.3, AutomorphicGaloisRepresentations:R19.3 and
AutomorphicGaloisRepresentationsPartII:AG2.6, so these imports close cycles; ArithmeticGaloisDuality:R02.3 is not
downstream of R01.4, so that import alone is harmless. This is the same reason the review gave for moving Dimitrov's
large-image theorem out of R01.4 into R19.3 (route 13).

**Evidence.** Atlas data/atlas.json: in stageEdges, ArithmeticGaloisRepresentations:R01.4 reaches
GL2AutomorphicRepresentationsAndTransfer:R16.3, AutomorphicGaloisRepresentations:R19.3 and
AutomorphicGaloisRepresentationsPartII:AG2.6. In roadmap edges, ArithmeticGaloisRepresentations supplies
ArithmeticGaloisDuality, PadicHodgeTheory and AutomorphicGaloisRepresentations, and it reaches
ModularityAndLanglandsExtensions. The R01.4 text reads: 'Prove the finite-subgroup facts of GL₂/PGL₂ used in the source
arguments … Define bad-dihedral representations'. It is purely group-theoretic. Paper, Prop. 5.4 proof (p. 39): 'Then
r̄_{π,ι}|_{G_{F_{v_1}}} is irreducible … This contradicts the fact that r̄_{π,ι}|_{G_{F_v}} is Fontaine–Laffaille …
hence K ⊂ F(S ∪ {v_2})'. Route 13's reason says Dimitrov 'is a property of the compatible family of a fixed eigenform
that R19.3 constructs … [R01.4] does not concern automorphic families'.

**Fix.** Move all-primes-large-residual-image and local-conditions-large-image out of route 3. Either route both to
SymmetricPowersByTensorFunctorialityLifting (route 15), or route Prop 5.4 to AutomorphicGaloisRepresentations:R19.3
beside dimitrov-large-image and Theorem 5.9(first) to route 15. R01.4 keeps only the group-theoretic step, which
dickson-classification already plans: a finite irreducible subgroup of PGL₂(F̄_ℓ) containing an element of prime order t
> 5, t ≠ ℓ, is conjugate to PSL₂/PGL₂(F_{ℓ^a}) with t | ℓ^a ± 1, or is dihedral. Update ownerStage on both items.

### /5 — duplicate

**Where.** research/blueprint/papers/PAPER-NEWTON-THORNE-26.result.json route 5 (part-ii PolarizedAutomorphyLifting),
items blggt-alt, blggt-connects-relation, potential-diagonalisability, iota-ordinary-automorphic,
steinberg-weight-zero-ordinary, ordinary-automorphic-to-galois; also adequacy-large-characteristic (route 3) and the
BLGGT Lemma 2.2.2 half of base-change-and-soluble-descent

**Claim.** These BLGGT14 results are already planned as nodes of ModularityAndLanglandsExtensions ML.2 in that roadmap's
blueprint packet, so route 5 plans BLGGT14 §§1.3–1.4, §2.1, §2.2 and Theorem 4.2.1 a second time. Route 5's reason only
says that the extraction had routed Theorem 4.2.1 to ML.2 and that it 'belongs here'. The ML blueprint was checkpointed
after this review, plans the results in ML.2 and never imports them from PolarizedAutomorphyLifting.

**Evidence.** research/blueprint/packets/ModularityAndLanglandsExtensions.json (checkpoint 1, commit 9dd56649,
2026-09-29, #3920; the NT26 review is commit 9e869e36 of 2026-09-23). Its coverage note for ML.2 reads 'BLGGT arXiv v4
§§1.4, 2.1–2.4, 3.1–3.3, 4.1–4.5, 5.4–5.5 in 30 nodes'. Nodes: (1) ML.2/pd-automorphy-lifting = BLGGT §4.2 Theorem 4.2.1
'Let F be imaginary CM, l odd … r|_{G_{F_v}} potentially diagonalizable for all v | l; r̄|_{G_{F(ζ_l)}} irreducible, l ≥
2(d + 1) and ζ_l ∉ F' (= blggt-alt). (2) ML.2/connects-relation, §1.4 p. 26 (= blggt-connects-relation). (3)
ML.2/potentially-diagonalizable and ML.2/potential-diagonalizability-criteria (Lemmas 1.4.2–1.4.3: ordinary and
Fontaine–Laffaille imply potentially diagonalizable) (= potential-diagonalisability). (4) ML.2/iota-ordinary: '…weight 0
with π_v Steinberg for all v | l implies ı-ordinary (Geraghty Lemma 5.1.5); ı-ordinary ⇒ r_{l,ı}(π)|_{G_{F_v}} ordinary'
(= iota-ordinary-automorphic, steinberg-weight-zero-ordinary and ordinary-automorphic-to-galois). (5)
ML.2/ghtt-adequacy-criterion (GHTT Theorem 9), which overlaps adequacy-large-characteristic. (6)
ML.2/automorphy-twist-and-soluble-base-change (BLGGT Lemmas 2.2.1–2.2.2). The packet never mentions
PolarizedAutomorphyLifting. In research/blueprint/queue.json both BP-ModularityAndLanglandsExtensions ('released on
GitHub issue #1033') and DESIGN-PotentialAutomorphyInfrastructurePartII are pending, so both jobs would plan this
material.

**Fix.** Choose one owner and record it on both sides. Option (a) follows the accepted routes of
PAPER-BOXER-CALEGARI-GEE-25 r2, PAPER-CLOZEL-THORNE-17 r5, PAPER-NEWTON-THORNE-21 r7, PAPER-NEWTON-THORNE-21-B r4,
PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22 r5, PAPER-QIAN-23 r15 and this route 5: hand BP-ModularityAndLanglandsExtensions
(issue #1033) a finding to replace the ML.2 nodes pd-automorphy-lifting, connects-relation, potentially-diagonalizable,
potential-diagonalizability-criteria, iota-ordinary, ghtt-adequacy-criterion, automorphy-twist-and-soluble-base-change
(and minimal-/ordinary-automorphy-lifting) with imports from the PotentialAutomorphyInfrastructure Part II, and add to
route 5's reason that these ML.2 nodes are imports, not owners. Option (b): mark the six items planned at
ModularityAndLanglandsExtensions:ML.2, citing those node ids, move them to route 2, and delete item (4) from route 5's
brief. Either way, name the chosen owner of BLGGT §1.4/§2.1/Theorem 4.2.1 in route 5.

### /6 — duplicate

**Where.** research/blueprint/papers/PAPER-NEWTON-THORNE-26.result.json routes 15, 16, 17 (part-ii of
ModularityAndLanglandsExtensions); route 15 reason; item nt21b-functoriality-lifting

**Claim.** Route 15 is justified by 'No layer or pending candidate plans this method', but the ML blueprint plans it in
ML.3. Its ML.3 checkpoint already has Newton–Thorne II Theorem 2.1 (the template that route 16 sends to
SymmetricPowerAutomorphyLifting) and the Newton–Thorne I level-raising and residually reducible finiteness theorems as
ML.3 nodes. Its open coverage tells the next round to decompose the Newton–Thorne proofs and to plan this paper's
Hilbert symmetric powers inside ML.3. Two pending jobs would therefore decompose §§3–6 of this paper and NT II §2.

**Evidence.** research/blueprint/packets/ModularityAndLanglandsExtensions.json: coverage ML.3 remaining = 'Decompose the
Newton–Thorne proofs (see the gap); plan the ACC+ Sato–Tate over CM fields and the Hilbert-modular-form symmetric powers
(Newton–Thorne, arXiv:2212.03595).' The gap 'Newton–Thorne proofs are recorded at statement level' is neededBy
ML.3/symmetric-power-automorphy-lifting, steinberg-level-raising, reducible-deformation-finiteness,
eigenvariety-propagation, …. Node ML.3/symmetric-power-automorphy-lifting has source 'newton-thorne-II §2, Theorem 2.1
and proof', the same theorem as nt21b-functoriality-lifting ('The Taylor–Wiles–Kisin argument of [NT21b, §2] (Theorem
2.1; …)'). Stage text (content/campaign/ModularityAndLanglandsExtensions/README.md, ML.3): 'Integrate Newton-Thorne
source-scoped symmetric-power automorphy … Select the exact original statement, page and full proof before dividing this
stage into proof tasks.' content/campaign/PotentialAutomorphyInfrastructure/README.md 'Scope and source': 'symmetric
powers and Sato–Tate have downstream owner ML.3. Those source-qualified endpoints require their own complete proof
decomposition'. In queue.json BP-ModularityAndLanglandsExtensions (#1033) and
DESIGN-ModularityAndLanglandsExtensionsPartII are both pending.

**Fix.** Make the boundary explicit in both places. (1) Replace route 15's 'No layer or pending candidate plans this
method' with the boundary: ML.3 keeps the endpoint statements (ML.3/symmetric-power-lifting, non-cm-symmetric-powers,
Theorem A, SP_n), and the proofs of NT II Theorem 2.1, NT I Theorems 4.1/5.2/6.1/7.1 and this paper's §§3–6 belong to
the ModularityAndLanglandsExtensions Part II. (2) Hand BP-ModularityAndLanglandsExtensions a finding to delete
'Decompose the Newton–Thorne proofs … Hilbert-modular-form symmetric powers' from ML.3's remaining list, and to mark
ML.3/symmetric-power-automorphy-lifting, steinberg-level-raising, reducible-deformation-finiteness and
eigenvariety-propagation as imports from that Part II. If the maintainer prefers ML.3 to own the proofs, convert routes
15–17 into source routes to ModularityAndLanglandsExtensions:ML.3 instead.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | missing | PAPER-NEWTON-THORNE-26/local-langlands-rec; … | Nothing in the extraction covers the archimedean local Langlands correspondence rec_{F_v} for v / ∞ (GL_n(R) and, for Theorem 6.5(2), GL_n(C)). Theorem A = … |
| /2 | high | error | PAPER-NEWTON-THORNE-26/galois-representation-attached (statement); … | The paper's RAECSDC polarization condition and its multiplier formula disagree; the item copies both, so its statement is false. The paper writes π^∨ ≅ π^c ⊗ … |
| /3 | high | error | PAPER-NEWTON-THORNE-26/section-4-quaternionic-forms (statement) | The item defines the base level as 'U₀ = ∏ U_{0,v} (Iwahori at Σ, maximal elsewhere)'. That is not the paper's definition. At v ∈ Σ the quaternion algebra D is … |
| /4 | high | error | routes[2] (ArithmeticGaloisRepresentations, stages G7/R01.1/R01.4); … | Proposition 5.4 and the first conclusion of Theorem 5.9 are statements about the compatible system of an automorphic π, but they are routed to R01.4, a … |
| /5 | high | duplicate | research/blueprint/papers/PAPER-NEWTON-THORNE-26.result.json route 5 … | These BLGGT14 results are already planned as nodes of ModularityAndLanglandsExtensions ML.2 in that roadmap's blueprint packet, so route 5 plans BLGGT14 … |
| /6 | high | duplicate | research/blueprint/papers/PAPER-NEWTON-THORNE-26.result.json routes … | Route 15 is justified by 'No layer or pending candidate plans this method', but the ML blueprint plans it in ML.3. Its ML.3 checkpoint already has … |
| /7 | medium | missing | §1.2 notation, arXiv v2 p. 9 (no item); consumers … | §1.2 defines the local Hecke algebras and operators that §4 builds its Hecke algebras and Taylor–Wiles maximal ideals from: H(G(F_v),U_v) with its Z-basis of … |
| /8 | medium | missing | Proof of Proposition 6.1 (prop-6-1-intermediate-claim, … | No item covers 'raising the level to a tamely dihedral type', although the proof of Proposition 6.1 uses it four times: at v_a modulo t, at v_0 modulo p, at … |
| /9 | medium | missing | Proof of Proposition 6.1, construction of E … | No item covers the field-theoretic input that a soluble totally real extension E/F exists with prescribed local behaviour at finitely many places and linear … |
| /10 | medium | missing | Proof of Proposition 6.1, p. 47 (prop-6-1-intermediate-claim mentions … | The existence of a square root of a totally even character after soluble base change, with its obstruction in Br(F)[2], is a theorem used in the proof of … |
| /11 | medium | missing | PAPER-NEWTON-THORNE-26/residual-automorphy-constituents (no item for … | The proof of Proposition 3.9 uses a GL₂ level-raising theorem over the totally real field (uncited in the paper). No item states it, nothing in the atlas plans … |
| /12 | medium | other | routes[15] (part-ii SymmetricPowersByTensorFunctorialityLifting), … | The brief must name the roadmaps the new Part II imports from (PROTOCOL §16), but its import list leaves out owners of results that §3 uses: … |
| /13 | medium | missing | PAPER-NEWTON-THORNE-26/connectedness-dimension and routes[11] (source … | The bound c(R_{𝒮′_{F₂}}/(ϖ)) ≥ n[F₂:Q] − 1 comes from the proof of [Tho15, Lemma 3.21]. That proof rests on Grothendieck's connectedness theorem: for a … |
| /14 | medium | error | PAPER-NEWTON-THORNE-26/nt23-enormous-criterion (statement) | The item omits the standing hypothesis of the cited lemma, and as written the statement is false. The item reads 'A subgroup of GL_n(O) is enormous if the … |
| /15 | medium | error | PAPER-NEWTON-THORNE-26/pseudodeformation-ring-P (statement); … | P is defined as the quotient R_S of R^{[a,b]}_{t̄,S} from [NT23, §2.4], with only 'a < b such that the Hodge–Tate weights lie in [a,b]'. NT23 defines R_S only … |
| /16 | medium | error | PAPER-NEWTON-THORNE-26/nt23-adjoint-selmer-vanishing (statement) | The item states the cited theorem without its hypotheses: 'For an automorphic Galois representation of unitary type with enormous image, the adjoint Bloch–Kato … |
| /17 | medium | missing | PAPER-NEWTON-THORNE-26/kw-taylor-wiles-primes-two (p = 2 only); … | No item covers the existence of Taylor–Wiles data of the §4 type for p > 2. Proposition 4.8 needs, for every N, a set Q of q primes with q_v ≡ 1 mod p^N, split … |
| /18 | medium | error | PAPER-NEWTON-THORNE-26/prop-4-6-unitary-forms (statement) | The item drops a conclusion that patching needs. Proposition 4.6(3) also asserts that the O[Δ′_Q]-module structure on H_G(V₁(Q;N))_{m_{G,Q}} induced by O[Δ′_Q] … |
| /19 | medium | missing | PAPER-NEWTON-THORNE-26/global-deformation-4 and kisin-local-rings (no … | The p > 2 component argument rests on 'R_loc = ⊗̂ R_v is an O-flat domain of dimension 1 + 3[F:Q] + 3/S/'. The paper gives no reference, and no item records … |
| /20 | medium | error | PAPER-NEWTON-THORNE-26/one-new-prime-quadratic-extension, … | There are two more dependency inversions among §5 items. (i) one-new-prime-quadratic-extension (ArithmeticGaloisDuality:R02.3) uses … |
| /21 | medium | error | contexts['S5-global']; items … | The paper puts SP_{r−1}, SP_r and SP_{r+1} among the standing hypotheses of §5.2. contexts['S5-global'] omits them, while the item s5-global-hypotheses … |
| /22 | medium | missing | §5.1 (no item); affects PAPER-NEWTON-THORNE-26/coefficient-field, … | No item states that the isomorphism class of γπ depends only on the image of γ in Γ_π = Gal(K̃_π/Q). That fact is what makes 'γπ for γ ∈ Γ_π' meaningful in … |
| /23 | medium | missing | Completion of the proof of Theorem 5.5 (no item); … | Theorem 5.5's output must be ι-ordinary, and Proposition 6.3 consumes it as an ι-ordinary residual witness. The paper gets this from 'a simple check from … |
| /24 | medium | error | PAPER-NEWTON-THORNE-26/fontaine-laffaille-residual | The item's locator includes the proof of Proposition 5.4, but its statement covers only the Lemma 5.7 use: residual representations determine the weights, so … |
| /25 | medium | other | research/blueprint/papers/PAPER-NEWTON-THORNE-26.result.json routes … | The queue plans one '<parent>, Part II' per parent. Every part-ii route of ModularityAndLanglandsExtensions, from every paper, becomes the single job … |
| /26 | medium | error | research/blueprint/papers/PAPER-NEWTON-THORNE-26.result.json route 6 … | These items are marked missing, but existing layers plan them. AG2.0 plans fields of rationality, AF.4 plans Clozel's rationality theorem, and AG2.2/AG2.5 plan … |
| /27 | medium | error | research/blueprint/papers/PAPER-NEWTON-THORNE-26.result.json route 6 … | Labesse's descent (Théorème 5.4) and base change (Corollaire 5.3) between definite unitary groups and GL_n are planned at ET.7a (with AG2.2), and both sibling … |
| /28 | medium | error | research/blueprint/papers/PAPER-NEWTON-THORNE-26.result.json route 4 … | These items are marked missing although the named layers plan them by their own text and the sibling Newton–Thorne extractions mark the same results planned in … |
| /29 | medium | error | research/blueprint/papers/PAPER-NEWTON-THORNE-26.result.json route 12 … | Hida families for Hilbert modular forms (Wiles 1988) are planned at PadicFamilies:L5, not at R21.2. R21.2 imports Hida control from PadicFamilies and owns only … |
| /30 | medium | duplicate | research/blueprint/papers/PAPER-NEWTON-THORNE-26.result.json route 3 … | Sen's theorem on the Lie algebra of the Zariski closure of the image of a Hodge–Tate representation is routed here to ArithmeticGaloisRepresentations … |
| /31 | medium | duplicate | research/blueprint/papers/PAPER-NEWTON-THORNE-26.result.json route 6 … | BLGGT14 Lemma A.2.5 is routed to AutomorphicGaloisRepresentationsPartII (AG2.0/AG2.6/AG2.2). The PolarizedAutomorphyLifting proposal, which route 5 of this … |
| /32 | medium | duplicate | research/blueprint/papers/PAPER-NEWTON-THORNE-26.result.json item … | Theorem 6.4 has two owners in this extraction. sp-induction is 'planned' at ML.3 and named in source route 2 ('Theorem A (Theorem 6.5(1)), Theorem 6.4 and the … |
| /33 | low | error | PAPER-NEWTON-THORNE-26/bertrand-postulate, low-rank-symmetric-powers … | Three locators put a sentence of the Introduction on page 4 when it is on page 3: the use of Bertrand's postulate and 'the known cases of SP_n for 1 ≤ n ≤ 5'. |
| /34 | low | library-claim | PAPER-NEWTON-THORNE-26/goursat-lemma (status library) vs … | goursat-lemma has status library, but its statement also asserts 'the consequence that a subgroup of PGL₂(Q̄_p) × PGL₂(Q̄_p) surjecting onto both factors is … |
| /35 | low | library-claim | PAPER-NEWTON-THORNE-26/essentially-discrete-series-weight (planned: … | R16.3 does not plan the definition of essentially discrete series of GL₂(R) of weight k_v, a subquotient of Ind_{B(R)}^{GL₂(R)} with sgn^{ε_i}/·/^{s_i}. R16.3 … |
| /36 | low | missing | §1.2 notation, p. 7 (no item): C_O, coefficient field (E, O, ϖ, k), … | §1.2 also fixes three notations that later items use with no defining item: the category C_O of complete Noetherian local O-algebras with residue field k; the … |
| /37 | low | missing | sourceIssues (proof of Lemma 3.3); compare E16 | New gap. The proof of Lemma 3.3 normalises the image h of complex conjugation to diag(1,−1) by GL₂(F_{p^a})-conjugation. This is impossible whenever h is a … |
| /38 | low | error | PAPER-NEWTON-THORNE-26/tho15-steinberg-domain; sourceIssues (§3 … | The item says 'Let v / v₀ be a place of F₂, so that q_v ≡ 1 mod p, p^N ∥ q_v − 1 with p^N > n, and the residual representation is trivial at v', copying the §3 … |
| /39 | low | missing | items (Lemma 3.3, final sentence) | Local Tate duality is used to derive H²(F_v, ad(…)^{ss}) = 0 in Lemma 3.3. That vanishing is what makes v_a 'have no ramified deformations', and it is the … |
| /40 | low | missing | items (proof of Lemma 3.6) | The proof of Lemma 3.6 uses the local Jacquet–Langlands correspondence between D_v^× and the discrete series of GL_n(K_{1,ṽ}), in particular that the trivial … |
| /41 | low | missing | items (local conditions of deformation-problems-3) | Every deformation problem of §3 uses Thorne's ordinary lifting ring R_v^△ over Λ_v at v / p, and 𝒮_{F₃} uses the unipotently ramified ring R_v^1 at T_{F₃}. … |
| /42 | low | error | PAPER-NEWTON-THORNE-26/lemma-3-5-residual-s | The statement starts 'With π₁ = BC(Sym^r σ) ⊗ XY^{−r}/·/^{(r−1)/2} …' but omits what makes π₁ and π₂ exist and be cuspidal. Sym^r σ needs SP_{r+1} and … |
| /43 | low | error | PAPER-NEWTON-THORNE-26/ordinary-hecke-algebras | The item omits the auxiliary level S_a = T′_{F₂} (resp. T′_{F₃}), the places above v_a. Choosing that level is the whole purpose of Lemma 3.3 ('shrink the … |
| /44 | low | other | PAPER-NEWTON-THORNE-26/generic-prime-set-P | The second condition uses 𝔭_{F₂} for a prime 𝔭 of R_{𝒮_{F₁}}, but the paper's definition 𝔭_{F₂} = ker(R_{𝒮′_{F₂}} → R_{𝒮′_{F₁}}/𝔭) quotients R_{𝒮′_{F₁}} by an … |
| /45 | low | missing | sourceIssues (definition of generic prime, p. 21) | Misprint not recorded: in the recalled definition of a generic prime, the universal characters have codomain 'Λ^×_{K_{2,ṽ}}', a ring defined nowhere. Only Λ_v … |
| /46 | low | error | PAPER-NEWTON-THORNE-26/comparison-diagram-J-containment, field … | The locator says '§3 before Proposition 3.14, arXiv v2 p. 24', but the diagram and the containment J_{𝒮_{F₃}}P_{𝒮′_{F₂}} ⊂ J_{𝒮′_{F₂}} come immediately before … |
| /47 | low | missing | prerequisites | Two papers cited in §3 proofs are missing from prerequisites, and papers.json does not cover them: Allen 2016 [All16, Proposition 1.2.2], used in the proof of … |
| /48 | low | other | sourceIssues (new, against Lemma 4.7, arXiv v2 p. 33); … | This is a missed source issue (a gap that affects nothing). Lemma 4.7 asserts enormousness for the coefficient field E fixed earlier, and its proof applies … |
| /49 | low | missing | PAPER-NEWTON-THORNE-26/component-argument-theorem-4-1 (no item for … | The component argument uses three standard facts that no item records. First, a module that is finite free over a regular W′_∞ is Cohen–Macaulay over P_∞, so … |
| /50 | low | missing | PAPER-NEWTON-THORNE-26/section-4-taylor-wiles-rings, … | The O[Δ′_Q]-algebra structure on P_Q, and hence Proposition 4.6(3) and patching over W′_∞, uses the fact that a determinant of the abelianised local group … |
| /51 | low | error | PAPER-NEWTON-THORNE-26/component-argument-theorem-4-1 (statement) | The item says p_∞ lies 'on a unique irreducible component Z of Supp H_{G,∞}'. The argument needs Z to be the unique irreducible component of Spec P_∞ through … |
| /52 | low | duplicate | PAPER-NEWTON-THORNE-26/kisin-patched-irreducibility (route 11, R03.6) … | Two items routed to different owners state the same conclusions: for p odd, R_loc⟦X⟧ ≅ R_∞ with H_{D,∞} faithful, and for p = 2, Ĝ_m^γ[2](O) acts transitively … |
| /53 | low | error | PAPER-NEWTON-THORNE-26/local-hilbert-symbol-facts (locator) | The locator says 'Proof of Lemma 5.3, arXiv v2 p. 38'. Lemma 5.3 and its proof are on p. 39. |
| /54 | low | error | PAPER-NEWTON-THORNE-26/all-primes-large-residual-image (statement) | The corrected conclusion for ℓ = 2 reads '2^a ≥ t_i − 1 … where t_i is the prime of the place used in the proof'. A statement cannot depend on its proof. For ℓ … |
| /55 | low | other | usesItems of … | The dependency chain inside §5 is broken. twisted-companion-characteristic-zero, the step that produces Π in the proof of Theorem 5.5, is used by no item. … |
| /56 | low | other | sourceIssues (Proof of Lemma 5.7, p. 41) | The paper has a gap in Lemma 5.7(2) that the extraction did not record. It deduces irreducibility of the tensor product from irreducibility of each factor over … |
| /57 | low | other | PAPER-NEWTON-THORNE-26/small-degree-quadratic-field; … | The paper defines F(S) as 'unramified outside S' for a set S of finite places, without saying whether ramification at the real places is allowed. Under the … |
| /58 | low | missing | Proof of Lemma 5.8, checks (1), (4), (5) (no items) | Lemma 5.8 relies on several facts about Aut(C)-conjugation and coefficient conjugation that no item states. γπ is RAESDC of weight 0 and non-CM (check 1). … |
| /59 | low | library-claim | PAPER-NEWTON-THORNE-26/minkowski-unramified; … | The library declarations, read at Mathlib 082e2d3, prove only that a number field K ≠ Q has a ramified prime. The paper uses the consequence that Γ_π = … |
| /60 | low | error | PAPER-NEWTON-THORNE-26/khare-wintenberger-method (locator); … | (i) The Khare–Wintenberger method is invoked 'as in Lemma 3.1' in two places in §5: to construct σ′ in Lemma 5.7 and π′ in Theorem 5.9. The locator of … |
| /61 | low | other | extraction.md (§5 lines of the cited-inputs list and the 'Mistakes … | The report's body was not updated after the review, so some of its routes and its E1 text contradict extraction.json. It routes Lemma 5.6 and BLGGT14 Thm 4.2.1 … |
| /62 | low | error | research/blueprint/papers/PAPER-NEWTON-THORNE-26.result.json route 3 … | Strong irreducibility of r_{π,ι} for non-CM Hilbert π (NT23 Example 2.29, i.e. Zariski closure containing SL_2) is routed to ArithmeticGaloisRepresentations. … |
| /63 | low | other | research/blueprint/papers/PAPER-NEWTON-THORNE-26.result.json routes … | All four Part IIs carry area 'automorphic' (galaxy 'Modular and automorphic forms'). Both parents are classified in cluster … |
| /64 | low | other | research/blueprint/papers/PAPER-NEWTON-THORNE-26.result.json route 15 … | Lemma 5.3 and the generator lemma before it are pure algebraic number theory (exponent-two extensions, ray class fields, the Hilbert product formula), with no … |
| /65 | low | library-claim | research/blueprint/papers/PAPER-NEWTON-THORNE-26.result.json route 3 … | The item cites no library declaration, but Mathlib at the pinned commit already has the group-theoretic core: the image of a perfect group is perfect, and a … |
| /66 | low | other | research/blueprint/papers/PAPER-NEWTON-THORNE-26.result.json items … | These are general facts about linear algebraic groups over Q̄_p: closure of images, the derived group of the closure, connected reductive irreducible subgroups … |
| /67 | low | other | research/blueprint/papers/PAPER-NEWTON-THORNE-26.result.json field … | The 'local' validation statement describes the 57-item checkpoint ('57 unique item IDs … exact once-only routing of all 48 missing items'). The deliverable now … |

## Notes for the fix job

- **ML.2 and ML.3 (/5–/6).** The overlap needs one owner decision. The lighter fix is to tell the
  ModularityAndLanglandsExtensions blueprint job to import the BLGGT and Newton–Thorne material from the Part II that
  seven accepted extractions already use. The alternative is to move the items into ML.2 and ML.3 here. Both options
  are written into the fixes.
- **The three Part IIs.** The three Part IIs of ModularityAndLanglandsExtensions become one design job in
  `make_queue.py`, so their briefs should be merged into one coherent route.
- **New source issues.** Record the RAECSDC multiplier and the gaps in Lemma 3.3, Lemma 5.7 and F(S) as new source
  issues, under PROTOCOL §18.

