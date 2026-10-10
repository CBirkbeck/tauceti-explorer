# Prismatic cohomology, Part 2: logarithmic prismatic cohomology (PR.8)

**Target-level checkpoint for `PrismaticCohomology:PR.8`. Packet status and coverage are partial. The retained independent review is `needs_changes`; this revision does not replace or accept that review.**

This layer adds logarithmic structures to the ordinary prismatic theory. Its targets connect δ_log algebra and prismatic envelopes to geometric and derived cohomology, Hodge–Tate and crystalline comparisons, Nygaard and de Rham constructions, Kummer-étale realizations and integral period modules. The final application tracks the standard semistable chart through these constructions. All 76 reviewed node IDs are retained. Each statement, hypothesis, proof outline, prerequisite, API item, test and source locator below agrees with the [packet](../packets/PrismaticCohomology--PR.8.json).

The [suggested file](../suggested/PrismaticCohomology--PR.8.lean) supplies 54 typed API/test forms among 336 names. Its remaining 282 forms are explicitly documentation-only obligations. It includes a genuine prelog prism carrier with its three prism axioms, concrete δ_log computations and a free one-generator model; these do not supply the later geometric sites. Every admitted proof remains work to implement. Neither a complete blueprint nor a formalisation is claimed.

The full Inoue–Koshikawa–Yao corrigendum is a blocking source. Its metadata announces corrections to published Theorems 7.35–7.36, but the corrected hypotheses and their correspondence with preprint Theorems 7.36–7.37 have not been read. The Laurent equivalence and dependent smooth proper pushforward below are therefore provisional preprint targets. Ordinary PR.7 theory does not certify them. The source record and handoff explain the unsuccessful access attempts and where to resume.

## Scope and comparison ranges

The geometric comparison family uses bounded prelog prisms with integral base monoids, and integral log p-adic formal schemes smooth in Koshikawa's Appendix A sense. Global results impose their stated qcqs hypotheses. Hodge–Tate and completed base change apply in this range. Crystalline comparison additionally needs the prism ideal `(p)` and Cartier type. The de Rham comparison, Frobenius isogeny and the invertible décalage factorisation require the Cartier-type mod-p fibre. Each node records its precise version of these conditions.

The global Kummer-étale comparison uses a perfect associated log prism and descent from an fs log-smooth model over an fs monoid with Cartier-type mod-p fibre. The affine comparison has its own saturated-chart and bounded-torsion assumptions. Ordinary étale cohomology replaces Kummer-étale cohomology only when the generic log structure is trivial. Semistable AΩ and the proper Cartier-type A_inf/BKF results have different ranges; their statements below retain those differences. KY's applications beyond this layer are outside the plan.

## Ownership and present inputs

Ordinary δ-rings, prisms, prismatic envelopes and cohomology, derived completion, Nygaard constructions, q-crystalline theory and ordinary Laurent crystals belong to PR.0–PR.7. PR.8 imports their contracts and plans their logarithmic interfaces. Its standalone suggested file restates only the minimal ordinary fixtures needed for typed tests; it does not assign ordinary theory a second owner.

CR.5 owns prelog/log algebra, associated log structures, integral/fine/saturated monoids, log differentials and crystalline constructions. Its present exports cover fine-model smoothness and finite semistable completion. They do not yet establish the whole non-fine, relatively coherent formal range of K1 Appendix A. Exact basic node imports below replace the old blanket requests wherever sufficient; the remaining extension is recorded explicitly.

DD.6 owns Gabber log cotangent theory, its functoriality, log derived de Rham theory, Cartier comparison, homologically log-flat descent and the log quasisyntomic/QRSP notions. The retained PR.8 IDs for the last two expose those definitions to prismatic consumers; they do not define a second site or QRSP notion. Sheafification and the smoothness/lifting interface in the non-fine formal range still need reconciliation. DD.5 supplies ordinary quasisyntomic inputs.

The current T6 log-sites plan exports general locally noetherian fs log adic spaces, their Kummer-étale site and higher direct images. These are exact inputs for the scheme/adic comparison, with its finite-type hypotheses. Its contract does not construct the arbitrary log diamonds or completed untilt coefficient sheaves needed later. DiamondsAndVStacks owns the underlying diamonds, strictly totally disconnected spaces and Spd construction. DiamondEtaleCohomology C0 owns the ordinary quasi-pro-étale setting; the completed structure sheaf and condensed module extension needed for the log coefficient category remain requested.

PR.4 now exports the arbitrary p-adic formal/affine derived étale comparison and coefficient compatibility needed in the affine reduction. PR.7 exports ordinary Laurent/perfect-complex equivalence and crystal descent. These are imported by exact node ID. PR.7's perfect F_p/lisse Riemann–Hilbert target does not supply KY Lemma 8.5's algebraic Witt-length Frobenius modules, constructible coefficients and extension by zero. That stronger input remains a scope gap.

AI.0 owns A_inf and the integral period normalisations; CR.0 owns the generic A_crys PD-envelope input. AI.6 owns semistable AΩ and its period comparisons, AI.2 owns BKF module theory, and AI.5 owns the finiteness and p-local-freeness criteria used here. AI.1 supplies the scalar Koszul décalage calculation and requests a general carrier from DD.1. The log q-derivatives need a commuting-endomorphism cochain complex with compatible degrees, signs and completion; the scalar homological DD.1 contract is a near miss. PR.8 adds the log derivatives, not another generic Koszul theory. CR.6's semistable DVR Hyodo–Kato theory does not by itself supply the proper Cartier-type O_C input in KY's full range. CP.4 assembles comparison agreements with B_st; PR.8 exports the log maps used in those agreements. The pending RS-01 restructuring correction does not authorise a different ownership assignment here.

Current upstream roadmaps and the Tau Ceti library were also checked. The read-only environment revisions were TauCetiRoadmap `0a56d1b5303c26887a4042db834f46d9079ac593` and TauCeti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches found no existing log-prismatic, δ_log or arc-descent declaration in their Lean files. Existing arithmetic Kummer characters and AdicSpaces' Witt/Huber constructions do not supply these log sites or period comparisons. The AdicSpaces and ProfiniteArithmetic reader/signature patterns were used as roadmap references. The exact implementation baseline remains the pinned commits in the following table; present planning exports are not implementations at those pins.

## Conventions

Fix a prime p. The algebraic δ_log source works over Z_(p). Monoids are commutative and written multiplicatively, with unit e, groupification M^gp and units M^×. Prelog structures are monoid maps into a ring's multiplicative monoid. The associated log structure identifies the preimage of ring units with the units; formal-scheme log structures are distinguished from a log ring on global sections.

Completion is derived unless explicitly called classical. Completed polynomial or monoid algebras use angle brackets. Δ̄ is the derived reduction modulo the prism ideal. The Breuil–Kisin twists are retained in every comparison. Frobenius scalar extension, reduction, and the crystalline comparison's ψ-twist are separate operations; the displayed contracts never exchange them implicitly.

Koshikawa smoothness uses integral, relatively coherent local charts and the Appendix A finiteness/lifting conditions. It is not inferred from the finite fs Kato range alone. Cartier type and relative Frobenius exactness are stated at each use. A KY log prism means a bounded prelog prism whose global prelog ring is a log ring; the associated formal log prism is a separate construction.

The proposed namespace is `TauCeti.LogPrismatic` under `TauCeti/AlgebraicGeometry/LogPrismatic/`. Packet API names are stable planning names. Tagged anonymous Lean examples are counted as typed test forms only where an actual `example` occurs, and structure constructors count as typed API forms. Comments alone never count.

## Baseline and sources

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. The fourteen baseline declarations have their statements checked at these pins. Their uses are limited to the following contracts.

| Baseline reference | What it supplies |
|---|---|
| `mathlib:MonoidAlgebra` | The monoid algebra R[M] of a monoid over a semiring; used for Z_(p)[M], A[P] and the chart rings A⟨P⟩ before completion. |
| `mathlib:WittVector.teichmuller` | The Teichmüller lift R →* 𝕎 R as a monoid homomorphism; it gives the rank-1 prelog structures R♭ → W(R♭) and M♭ → A_inf(R). |
| `mathlib:Ideal.jacobson` | The Jacobson radical (infimum of maximal ideals containing an ideal); the hypothesis p ∈ rad(A) of the monoid Frobenius and of the extension to M^gp. |
| `mathlib:MvPolynomial` | Multivariate polynomial rings; the free δ_log-ring on one generator is a polynomial ring on x, δ_log(x), δ^n(δ_log(x)). |
| `mathlib:Algebra.GrothendieckGroup` | The group completion M^gp of a commutative monoid as the localization at ⊤, with of: M →* M^gp injective for cancellative M (of_injective). |
| `mathlib:TensorProduct` | Tensor products of modules; carrier of A ⊗_{Z_(p)[M]} Z_(p)[N] in the extension of δ_log along M ⊂ N ⊂ M^gp. |
| `mathlib:PowerSeries` | Formal power series; the ring W(k)[[u]] of the Breuil–Kisin prelog prism. |
| `mathlib:Perfection` | The perfection {f : ℕ → α // f (n+1)^p = f n} of a monoid (with a CommMonoid instance via Perfection.submonoid); it is the tilt M♭ = lim_{m ↦ m^p} M of KY Definition 2.18. |
| `mathlib:PreTilt` | For a commutative ring O, PreTilt O p = Perfection (ModP O p) p, the inverse Frobenius perfection of O/p. This provides the pre-tilt carrier; identifying it with the tilt of a perfectoid ring requires the perfectoid theory of PR.0. |
| `mathlib:CategoryTheory.GrothendieckTopology` | Grothendieck topologies on a category; the étale and flat topologies on log prismatic sites, the Kummer étale and quasisyntomic topologies are instances. |
| `mathlib:DerivedCategory` | The derived category of an abelian category (homological complexes up to quasi-isomorphism); a 1-categorical shadow of D(A) in which log prismatic cohomology lives. |
| `mathlib:CategoryTheory.CosimplicialObject` | Cosimplicial objects SimplexCategory ⥤ C; carriers of Čech–Alexander nerves C^• and of the cosimplicial algebras of Appendix B. |
| `mathlib:KaehlerDifferential` | Kähler differentials Ω[S⁄R] as the cotangent module of the diagonal ideal; the non-log Ω^1 with which log differentials are compared (Ω^1 → Ω^1_log). |
| `mathlib:DividedPowers` | Divided power structures on an ideal; the PD ideals J of δ_log-PD triples. |

The source versions and hashes below preserve the original extraction and independent review provenance. The revision rechecked selected δ_log/free/prism computations, the corrected period diagram and KY Lemma 8.5 against the same public preprints. It does not claim a second complete reading of all recorded sections. Every mathematical statement below is written in our own words; there are no source excerpts.

- **K1**: Teruhisa Koshikawa, [Logarithmic prismatic cohomology I](https://arxiv.org/abs/2007.14037); arXiv:2007.14037v3, 15 September 2022 (64 pp.). Access record: 2026-10-06. SHA-256: `90f68a84bc17618b9bf491ad1b6c43e69e81620f3e2ae1139047cb31ab3a180d`.

- **KY**: Teruhisa Koshikawa and Zijian Yao, [Logarithmic prismatic cohomology II](https://arxiv.org/abs/2306.00364); arXiv:2306.00364v1, 1 June 2023 (98 pp.). Access record: 2026-10-06. SHA-256: `7c55cba22922d94587979fbc45296eb51b13f17b3a5cb23c4d5c138c3866541b`.

- **KatoII**: Kazuya Kato, [Logarithmic structures of Fontaine–Illusie. II — Logarithmic flat topology](https://arxiv.org/abs/1905.10678); arXiv:1905.10678 (PDF of 1 October 2019); published in Tokyo J. Math. 44 (2021) 125–155. Access record: 2026-10-06. SHA-256: `75644f004ea6c7465cf6a03fe586bb46aff534a84f57db4de9ff1724443f160a`.

- **OgusDraft**: Arthur Ogus, [Lectures on logarithmic algebraic geometry (public draft)](https://math.colorado.edu/~casa/seminars/reading/logG/papers/oguslogbook.pdf); 2006 draft; numbering differs from the 2018 book. Access record: 2026-10-06. SHA-256: `5b5d5578e0d8c0ce2b66f2b239b988db42bb6184ee865c08d40cd5bd462c097d`.

- **CK**: Kęstutis Česnavičius and Teruhisa Koshikawa, [The A_inf-cohomology in the semistable case](https://arxiv.org/abs/1710.06145); arXiv:1710.06145v3, 4 October 2018; pp. 65–66 for the correcting diagram. Access record: 2026-10-06. SHA-256: `47000db58599c20831223f43df1d13466c913fdda617070f5cc3458631d36c57`.

- **KYcorr**: Kentaro Inoue, Teruhisa Koshikawa and Zijian Yao, [Corrigendum to Logarithmic prismatic cohomology II](https://doi.org/10.1016/j.aim.2026.111223); Advances in Mathematics 503 (2026), 111223; abstract only. Full correcting text unread; only the recorded metadata/abstract is used.

The packet records the precise historical reading ranges, published/preprint checks and access failures. Individual nodes below cite theorem/section and page numbers rather than relying on the bibliography alone.

## Mathematical corrections retained from the independent review

All nine source findings remain in the packet, including their independent-review verdicts. The first five are numbering or notation slips; the later findings affect a proof, a diagram, source-version certainty or a covering claim. The descriptions below state the correction in our own words.

### `PrismaticCohomology/E8.1`

KY, §1, footnote 5 to Theorem 2(5), p. 3 (arXiv:2306.00364v1). Replace the introductory cross-reference by Theorem 7.30, which contains the global etale comparison.

The numbered statement 7.30 in §7.4 is 'Theorem 7.30 (Globalization of étale comparison)'; footnote 7 of the same introduction correctly cites 'Theorem 7.30'. The atlas description of PR.8 repeats the misprint ('Corollary 7.30').

### `PrismaticCohomology/E8.2`

KY, §1, Theorem 2(1), sentence after (1.1), p. 2 (arXiv:2306.00364v1). Attribute the morphism of topoi to K1 Remark 4.5, rather than Remark 4.4.

In Koshikawa I (arXiv:2007.14037v3, the version cited as [26], 2022), the morphism ν: Shv(((X, M_X)/(A, M_A))_Δ) → Shv(X_ét) is constructed in Remark 4.5 ('Relation to the étale site'); Remark 4.4 concerns independence of the chart.

### `PrismaticCohomology/E8.3`

KY, §4.2, proof of Proposition 4.12(1), p. 37 (arXiv:2306.00364v1). Use K1 Proposition 5.1 for discreteness of the completed log cotangent complex in a smooth chart.

The needed input (for a smooth chart the completed log cotangent complex is discrete with H^0 = Ω^1_log) is Koshikawa I Proposition 5.1; Koshikawa I has no Proposition 6.1 (6.1 is the local crystalline comparison theorem).

### `PrismaticCohomology/E8.4`

KY, §7.2, Definition 7.4(1), p. 72 (arXiv:2306.00364v1). The chart belongs to the log structure on Y, the log diamond being defined.

The definition concerns a log diamond (Y, M_Y); X does not occur in it.

### `PrismaticCohomology/E8.5`

K1, Appendix A.2, Remark A.1, p. 51 (arXiv:2007.14037v3). Point to Lemma A.9 for the sufficient log-affineness condition; A.8 defines small charts.

A.8 is a Definition (small charts); the sufficient condition for (V, Γ(V, M_X)) to be log-affine is the last assertion of Lemma A.9.

### `PrismaticCohomology/E8.6`

K1, Remark 2.18, p. 13, arXiv:2007.14037v3. Integrality descends to the composite factor M_B → M′ from the integral map M_B → N and the exact map M′ → N.

There is no canonical N → M′. Applying exactness descent to M_B → M′ → N gives integrality of M_B → M′, as used in Proposition 3.9. Ogus’s public 2006 draft Proposition I.4.3.17(1) states this descent (the book citation is I.4.6.3.1).

### `PrismaticCohomology/E8.7`

K1, Theorem 8.5 displayed diagram, p. 49, arXiv:2007.14037v3. The middle-right term is étale cohomology with Z_p coefficients, and the first right vertical arrow is a comparison map, not an isomorphism over B_dR^+. Use qCRYS over A_inf before its A_crys tensor product.

Česnavičius–Koshikawa Proposition 6.8 gives the intended diagram with an unlabelled period map; §6.7 gives the comparison isomorphism only over B_dR. The packet had silently made the erroneous B_dR^+ isomorphism its target.

### `PrismaticCohomology/E8.8`

KY, Published Theorems 7.35 and 7.36; 2026 corrigendum, Advances in Mathematics 503, 111223. Obtain the corrigendum’s full text and replace the affected equivalences with its exact corrected hypotheses. The available abstract does not provide them; matching the published numbering with preprint 7.36–7.37 remains unverified.

The authors’ institutional record and publisher abstract explicitly announce correction of these statements. Node 71 must not treat the 2023 preprint equivalences as unconditionally verified current statements. The correction’s content and downstream effect on node 72 are unresolved here.

### `PrismaticCohomology/E8.9`

KY, Proposition 7.22 and its proof, pp. 75–76, arXiv:2306.00364v1. For the stated power-map tower construction require torsion-free P^gp (sharp fs P suffices). For general fs charts, first remove torsion-unit chart redundancy locally; a power map on torsion units need not give a surjective cover.

P = Z/2Z is a fine saturated integral group monoid. For n = 2 and Q = P^{1/2}, Q_p⟨P⟩ ≅ Q_p[t]/(t^2−1) ≅ Q_p × Q_p and t maps to t^2 = 1. The induced diamond map misses the t = −1 component. All chart values are units, so association/saturation of the log structure does not repair the missing component. The proof’s claim that P^× → (P^×)^{1/n} always gives a strict finite étale cover fails in this case.

## Target organisation

The targets are grouped by mathematical construction and dependency. The same six planets are retained: δ_log-ring, log prism, log prismatic site, log Hodge–Tate comparison, log Nygaard filtration and Kummer-étale comparison. Their planet status does not override the checkpoint gaps.

## A. Logarithmic delta algebra

### δ_log-rings

Node `PR.8/delta-log-ring` (definition); implementation status `unchecked`. Planet: **δ_log-ring**.

Fix a prime p. A δ_log-ring is a tuple (A, δ, α: M → A, δ_log: M → A) where (A, δ) is a δ-ring (a Z_(p)-algebra with a p-derivation), (A, α) is a prelog ring (M a commutative monoid, α a map to the multiplicative monoid of A), and δ_log: M → A is a map of sets satisfying (1) δ_log(e) = 0 for the unit e of M; (2) α(m)^p·δ_log(m) = δ(α(m)) for every m ∈ M; (3) δ_log(mm′) = δ_log(m) + δ_log(m′) + p·δ_log(m)·δ_log(m′) for all m, m′ ∈ M. A morphism (A, M) → (B, N) of δ_log-rings is a morphism of prelog rings (a ring map f and a monoid map h with α_N∘h = f∘α_M) commuting with δ and with δ_log (δ_log∘h = f∘δ_log). A δ_log-ring is of rank 1 if δ_log = 0. Equivalently (Remark 2.5) a δ_log-structure is a monoid map w_log: M → W_2(A), m ↦ (1, δ_log(m)), with w(α(m)) = (α(m), 0)·w_log(m) for the δ-section w(x) = (x, δ(x)).

**Hypotheses.** p is a fixed prime; all rings are Z_(p)-algebras (Koshikawa's standing convention in §2). M is an arbitrary commutative monoid (written multiplicatively); no integrality is imposed in the definition. The δ-ring axioms are those of PR.0, imported, not restated.

**Proof or construction outline.**

1. Define the structure as the data (δ, α, δ_log) with axioms (1)–(3) on top of PR.0's δ-structure and CR.5's prelog ring.
2. Derive from (2) and (3) that φ(α(m)) = α(m)^p·(1 + p·δ_log(m)) and that m ↦ 1 + p·δ_log(m) is multiplicative (K1, after Definition 2.2).
3. Iterate to get φ^n(α(m)) ∈ α(m)^{p^n}·(1 + pA) for all n ≥ 0.
4. When α(M) consists of nonzerodivisors, show δ_log is unique if it exists and exists iff α(m)^p divides δ(α(m)) for all m (K1, after Definition 2.2).
5. Prove the Witt-vector reformulation of Remark 2.5 via PR.0's description of δ-structures as sections of W_2(A) → A.

**Uses determining the interface.**

- Koshikawa I, Definition 3.3: a prelog prism is a δ_log-triple whose underlying δ-pair is a prism.
- Koshikawa I, Remark 2.3 and Koshikawa–Yao II, Convention 2.34: δ_log produces the Frobenius lift φ_M(m) = m^p·α^{-1}(1 + pδ_log(m)) on a log ring.
- Koshikawa I, Proposition 2.16: δ_log extends uniquely to M^gp by δ_log(m′/m) = (δ_log(m′) − δ_log(m))/(1 + pδ_log(m)), which drives exactification.
- Koshikawa–Yao II, Definition 2.35: perfect log prisms are those where the induced Frobenius of (A, M_A) is an isomorphism.

**Planning API.**

- `DeltaLogRing.mk` (constructor; typed form, proof admitted): From a δ-structure δ on A, a prelog structure α: M → A and δ_log: M → A satisfying (1)–(3), a δ_log-ring.
- `DeltaLogRing.frobenius_alpha` (relation; typed form, proof admitted): φ(α(m)) = α(m)^p·(1 + p·δ_log(m)) for every m ∈ M, where φ(x) = x^p + pδ(x).
- `DeltaLogRing.unitFactor_mul` (relation; typed form, proof admitted): The map m ↦ 1 + p·δ_log(m) is a monoid map M → (A, ·).
- `DeltaLogRing.frobenius_iterate_alpha` (relation; typed form, proof admitted): φ^n(α(m)) ∈ α(m)^{p^n}·(1 + pA) for all n ≥ 0.
- `DeltaLogRing.deltaLog_unique_of_nonZeroDivisor` (extensionality; typed form, proof admitted): If α(M) ⊂ A consists of nonzerodivisors, two δ_log-structures on (A, δ, α) coincide.
- `DeltaLogRing.exists_iff_dvd` (characterisation; typed form, proof admitted): If α(M) consists of nonzerodivisors, a δ_log-structure exists iff α(m)^p divides δ(α(m)) for every m.
- `DeltaLogRing.equivWittSection` (equivalence; signature outstanding): δ_log-structures on (A, δ, α) correspond bijectively to monoid maps w_log: M → W_2(A) of the form m ↦ (1, δ_log(m)) with w(α(m)) = (α(m), 0)·w_log(m).
- `DeltaLogRing.Hom` (structure; typed form, proof admitted): Morphisms of δ_log-rings: prelog ring maps commuting with δ and δ_log; identity and composition.
- `DeltaLogRing.IsRankOne` (other; typed form, proof admitted): The predicate δ_log = 0; rank-1 δ_log-rings satisfy φ(α(m)) = α(m)^p.
- `DeltaLogRing.trivialLog` (example; typed form, proof admitted): On any δ-ring A the units A^× ⊂ A carry the unique δ_log-structure δ_log(x) = δ(x)·x^{-p}.
- `DeltaLogRing.monoidAlgebra` (example; typed form, proof admitted): (Z_(p)[M], M) with the δ-structure whose Frobenius is m ↦ m^p is a δ_log-ring of rank 1.
- `DeltaLogRing.baseChange` (functoriality; typed form, proof admitted): For a δ_log-ring (A, M) and a δ-ring map A → B, (B, M) with the composite α and δ_log is a δ_log-ring (K1 Example 2.4(4)).
- `DeltaLogRing.ext` (extensionality; typed form, proof admitted): Two δ_log-ring structures on fixed A and M are equal if their δ-structures, prelog maps α, and maps δ_log are equal.
- `DeltaLogRing.Hom.ext` (extensionality; typed form, proof admitted): Two morphisms of δ_log-rings are equal if their underlying ring maps and monoid maps are equal.

**Discriminating unit tests.**

- `DeltaLogRing.trivialLog_deltaLog` (computation; typed form, proof admitted): On Z_(p) with its unique δ-structure and the trivial log structure Z_(p)^×, δ_log(1 + p) = δ(1 + p)/(1 + p)^p with δ(1+p) = (1 + p − (1 + p)^p)/p.
- `DeltaLogRing.zero_monoid` (degenerate; typed form, proof admitted): With M the trivial monoid {e}, δ_log-structures on (A, δ, α) are unique (δ_log(e) = 0) and every δ-ring is a δ_log-ring of rank 1.
- `DeltaLogRing.monoidAlgebra_rankOne` (compatibility; typed form, proof admitted): On Z_(p)[N] = Z_(p)[x] with α(1) = x and φ(x) = x^p, δ_log(1) = 0 and δ(x) = 0, agreeing with PR.0's δ-structure of the monoid algebra.
- `DeltaLogRing.not_any_map` (non-example; typed form, proof admitted): On Z_(p)[x] with δ(x) = 1 (φ(x) = x^p + p) and α(1) = x, there is no δ_log-structure, since x^p does not divide δ(x) = 1: a δ_log-structure is not determined by an arbitrary choice of δ_log values.
- `DeltaLogRing.frobenius_alpha_example` (characterisation; typed form, proof admitted): In any δ_log-ring, φ(α(m)) − α(m)^p = p·α(m)^p·δ_log(m); for A = Z_(p)[x, y_0, y_1, …] with α(1) = x and δ_log(1) = y_0 free, φ(x) = x^p(1 + p y_0).

**Acceptance conditions.**

- The trivial log structure A^× ⊂ A carries the unique δ_log-structure δ_log(x) = δ(x)/x^p (K1 Example 2.4(1)).
- Monoid algebras Z_(p)[M] with φ(m) = m^p are δ_log-rings of rank 1 (K1 Example 2.4(3)).
- Teichmüller lifts make (W(R), R) a rank-1 δ_log-ring for a perfect F_p-algebra R (K1 Example 2.4(2)).

**Prerequisites.** `PrismaticCohomology:PR.0/delta-frobenius-dictionary`, `mathlib:MonoidAlgebra`, `mathlib:WittVector.teichmuller`, `CrystallineCohomology:CR.5:log-algebra/prelog-ring`.

**Sources.** K1, §2, Definition 2.2 (p. 6–7): The definition is the node's statement with the stated data and hypotheses. K1, §2, Remark 2.5 (p. 8): Witt-vector characterisation recorded as API.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/DeltaLog`, namespace `TauCeti.LogPrismatic`.

### The monoid Frobenius of a δ_log log ring

Node `PR.8/delta-log-frobenius` (construction); implementation status `unchecked`.

Let (A, α: M → A, δ_log) be a δ_log-ring such that (A, M) is a log ring (α^{-1}(A^×) ≅ A^×) and p lies in the Jacobson radical of A. Then 1 + pδ_log(m) ∈ A^× for all m, and φ_M(m) := m^p·α^{-1}(1 + pδ_log(m)) defines a monoid endomorphism of M with α∘φ_M = φ_A∘α, so (φ_A, φ_M) is an endomorphism of the log ring (A, M). If the δ_log-ring is of rank 1 the p-th power map of M lifts φ_A for any prelog ring.

**Hypotheses.** (A, M) is a log ring; p ∈ rad(A) (for instance A classically p-complete). For rank-1 δ_log-rings no log-ring hypothesis is needed.

**Proof or construction outline.**

1. Since p ∈ rad(A), 1 + pδ_log(m) is a unit; as (A, M) is a log ring it has a unique preimage in M^× ⊂ M.
2. Multiplicativity of φ_M follows from axiom (3) of δ_log-rings and multiplicativity of α^{-1} on A^×.
3. α(φ_M(m)) = α(m)^p(1 + pδ_log(m)) = φ_A(α(m)) by axiom (2).

**Uses determining the interface.**

- Koshikawa I, §6 before Theorem 6.1: the Frobenius (A/p, M_A) → (A/p, M_A) acts on M_A via φ_{M_A}, defining the twist P^(1) in the crystalline comparison.
- Koshikawa–Yao II, Definition 2.35 and Remark 2.36: a log prism is perfect when (φ_A, φ_M) is an isomorphism; then M_A/A^× is uniquely p-divisible.
- Koshikawa–Yao II, Example 2.37: the perfection of an integral log prism is the colimit along φ_M.

**Planning API.**

- `DeltaLogRing.frobeniusMonoid` (constructor; typed form, proof admitted): For a δ_log log ring with p ∈ rad(A), the monoid endomorphism φ_M(m) = m^p·α^{-1}(1 + pδ_log(m)).
- `DeltaLogRing.alpha_frobeniusMonoid` (simp; typed form, proof admitted): α(φ_M(m)) = φ_A(α(m)).
- `DeltaLogRing.frobeniusMonoid_eq_pow_of_rankOne` (simp; typed form, proof admitted): If δ_log = 0 then φ_M(m) = m^p.
- `DeltaLogRing.frobeniusMonoid_units` (compatibility; typed form, proof admitted): On M^× = A^× the map φ_M is the restriction of φ_A.
- `DeltaLogRing.frobeniusMonoid_natural` (functoriality; typed form, proof admitted): A morphism of δ_log log rings commutes with φ_M.
- `DeltaLogRing.rankOneFrobeniusMonoid` (constructor; typed form, proof admitted): For a rank-one prelog delta-log ring, the p-th power map of M is the chosen monoid Frobenius lift. No log-ring or Jacobson-radical hypothesis is needed for this lift.
- `DeltaLogRing.alpha_rankOneFrobeniusMonoid` (compatibility; typed form, proof admitted): For rank-one D, alpha(m^p)=phi_A(alpha(m)); for the Breuil–Kisin N chart this is the lift n↦pn before logification.

**Discriminating unit tests.**

- `DeltaLogRing.frobeniusMonoid_bk` (computation; typed form, proof admitted): For the rank-one Breuil–Kisin prelog chart (Z_p[[u]], N, n↦u^n), the chosen p-th-power monoid lift sends n to pn for every n, and alpha(phi_M(n))=phi_A(u^n). Use this rank-one prelog lift; the N chart is not assumed to satisfy the log-ring condition required by frobeniusMonoid.
- `DeltaLogRing.frobeniusMonoid_trivial` (degenerate; typed form, proof admitted): For the trivial log structure A^× → A, φ_M(x) = φ_A(x) for every unit x.
- `DeltaLogRing.frobeniusMonoid_not_pow` (non-example; typed form, proof admitted): In the log ring associated with the p-completed free δ_log-ring (Z_p⟨x, y_0, y_1, …⟩, x^N) (δ_log(x) = y_0), φ_M(x) = x^p·(1 + p·y_0) with 1 + p·y_0 ≠ 1 a unit, so φ_M is not the p-th power map of the monoid.

**Acceptance conditions.**

- For (Z_p[[u]] with u ↦ u^p, N → u^n) of rank 1, φ_M is multiplication by p on N.
- For the trivial log structure A^×, φ_M is the restriction of φ_A to units.

**Prerequisites.** `PrismaticCohomology:PR.8/delta-log-ring`, `mathlib:Ideal.jacobson`, `CrystallineCohomology:CR.5:log-algebra/prelog-ring`, `CrystallineCohomology:CR.5:log-algebra/associated-log`.

**Sources.** K1, §2, Remark 2.3 (p. 7): Construction and commutativity as stated.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/DeltaLog`, namespace `TauCeti.LogPrismatic`.

### Limits, colimits and free δ_log-rings

Node `PR.8/delta-log-free` (construction); implementation status `unchecked`.

The category of δ_log-rings has all limits and colimits, computed on underlying rings and monoids; the forgetful functors to prelog rings and to pairs (ring, monoid) have left adjoints that are the identity on the monoid part, and the forgetful functor to prelog rings has a right adjoint. For a δ_log-ring (A, M_A) and a monoid M, (A{M}_δlog, M_A ⊕ M) denotes the δ_log-ring freely obtained from the prelog ring (A[M], M_A ⊕ M). The free δ_log-ring on one log generator, Z_(p){x}_δlog, is the polynomial ring Z_(p)[x, δ_log(x), δ(δ_log(x)), δ^2(δ_log(x)), …] with prelog structure x^N, and its Frobenius is faithfully flat; Z_(p){x}_δlog[1/p] is the polynomial ring on x, φ(x)/x^p, φ(φ(x)/x^p), …; and (Z_(p){x}_δlog[x^{-1}], x^Z) → (Z_(p){x^{±1}}_δlog, x^Z) becomes an isomorphism after classical p-completion.

**Hypotheses.** All rings are Z_(p)-algebras; monoids are commutative.

**Proof or construction outline.**

1. Limits and colimits: compute underlying, using the Witt-vector description (Remark 2.5) for colimits as in BS Remark 2.7 (K1 Remark 2.6).
2. Construct A = Z_(p)[x, y_0, y_1, …] with φ(x) = x^p(1 + p y_0), φ(y_i) = y_i^p + p y_{i+1}; by PR.0's torsion-free equivalence it has a unique δ-structure, and since x is a nonzerodivisor with x^{pn} | δ(x^n), a unique δ_log with δ_log(x) = y_0 (K1 Lemma 2.11 proof).
3. Check the universal property of (A, x^N) and identify it with Z_(p){x}_δlog.
4. Faithful flatness of φ: reduce, as in BS Lemma 2.11, to faithful flatness of Z_(p)[1/p][x^p y_0] ⊂ Z_(p)[1/p][x, y_0].
5. For x^{±1}: Z_p⟨x, y_0, …⟩[x^{-1}] is a δ-ring since φ^n(x) is invertible, with δ_log(x^{-1}) = −y_0/(1 + p y_0); compare universal properties among classically p-complete δ_log-rings.

**Uses determining the interface.**

- Koshikawa I, Proposition 3.9 and Construction 4.7: B = (A{(X_s)}_δ{N^T}_δlog)^∧ is the free δ_log-ring used to build Čech–Alexander covers.
- Koshikawa I, Proposition 2.16 proof: the reduction to free monoids uses the surjection (A{N^M}_δlog, N^M) → (A, M).
- Koshikawa I, Proposition 6.8 proof: B is p-completely free over B_0 = A⟨X_s, N^T⟩, giving the homotopy equivalence B_0^• → B^•.

**Planning API.**

- `DeltaLogRing.freeOnMonoid` (constructor; signature outstanding): For a δ_log-ring (A, M_A) and a monoid M, the δ_log-ring (A{M}_δlog, M_A ⊕ M) with its prelog-ring map from (A[M], M_A ⊕ M).
- `DeltaLogRing.freeOnMonoid.lift` (universal-property; signature outstanding): δ_log-maps (A{M}_δlog, M_A ⊕ M) → (B, N) over (A, M_A) correspond to monoid maps M → N compatible with prelog structures (lift ∘ canonical = given map, and uniqueness).
- `DeltaLogRing.freeOneGenerator_equiv_mvPolynomial` (equivalence; typed form, proof admitted): Z_(p){x}_δlog ≅ Z_(p)[x, y_0, y_1, …] with y_0 = δ_log(x), y_{i+1} = δ(y_i).
- `DeltaLogRing.freeOneGenerator_frobenius_faithfullyFlat` (other; signature outstanding): φ on Z_(p){x}_δlog is faithfully flat.
- `DeltaLogRing.hasLimits` (instance; signature outstanding): The category of δ_log-rings has all small limits and colimits, preserved by the forgetful functor to (ring, monoid) pairs.
- `DeltaLogRing.invertGenerator_completion` (compatibility; signature outstanding): (Z_(p){x}_δlog[x^{-1}], x^Z) → (Z_(p){x^{±1}}_δlog, x^Z) is an isomorphism after classical p-completion.
- `DeltaLogRing.freeOneGenerator.lift` (universal-property; typed form, proof admitted): For a delta-log Z_(p)-algebra (B,N) and m∈N, evaluate the free model x↦alpha(m), y_0↦delta_log(m), y_(i+1)↦delta(y_i), with the canonical coefficient map and generator 1∈N mapping to m.
- `DeltaLogRing.freeOneGenerator.lift_unique` (extensionality; typed form, proof admitted): A delta-log map from the one-generator free model is uniquely determined by its value on the monoid generator and its coefficient algebra map; it equals the evaluation lift.

**Discriminating unit tests.**

- `DeltaLogRing.freeOneGenerator_frobenius_x` (computation; typed form, proof admitted): In Z_(p){x}_δlog, φ(x) = x^p(1 + p·δ_log(x)) and φ(δ_log(x)) = δ_log(x)^p + p·δ(δ_log(x)).
- `DeltaLogRing.freeOnMonoid_trivial` (degenerate; signature outstanding): For M the trivial monoid, (A{M}_δlog, M_A ⊕ M) = (A, M_A).
- `DeltaLogRing.freeOneGenerator_not_monoidAlgebra` (non-example; typed form, proof admitted): Z_(p){x}_δlog is not Z_(p)[x]: the element δ_log(x) is algebraically independent of x, so the rank-1 algebra Z_(p)[x] is a proper quotient.
- `DeltaLogRing.pdivisible_rankOne` (characterisation; typed form, proof admitted): For M = N[1/p] and a classically p-complete δ_log-ring (A, M), δ(α(m)) = 0 for all m (K1 Example 2.10).

**Acceptance conditions.**

- Z_(p){x}_δlog modulo (y_0, y_1, …) recovers (Z_(p)[x], x^N) of rank 1.
- For a p-divisible monoid M, ((Z_p{M}_δlog)^∧, M) ≅ (Z_p⟨M⟩, M) is of rank 1 (K1 Example 2.10).

**Prerequisites.** `PrismaticCohomology:PR.8/delta-log-ring`, `PrismaticCohomology:PR.0/torsionfree-frobenius-equivalence`, `mathlib:MvPolynomial`, `PrismaticCohomology:PR.0`.

**Sources.** K1, §2, Lemma 2.11 (p. 9): First and second assertions of the node. K1, §2, Remark 2.6 (p. 8): Limits and colimits clause. K1, §2, Notation 2.7 (p. 8): Notation A{M}_δlog.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/DeltaLog`, namespace `TauCeti.LogPrismatic`.

### δ_log-structures pass to completions and completely étale extensions

Node `PR.8/delta-log-completion-etale` (lemma); implementation status `unchecked`.

Let (A, M) be a δ_log-ring and I ⊂ A a finitely generated ideal containing p. (1) The classical I-adic completion A^∧_cl with the composite prelog structure M → A → A^∧_cl carries a unique δ_log-structure making A → A^∧_cl a map of δ_log-rings. (2) If A → B is I-completely étale, then (B, M) carries a unique δ_log-structure compatible with (A, M).

**Hypotheses.** I is finitely generated and p ∈ I. In (2), A → B is I-completely étale in the sense of BS22.

**Proof or construction outline.**

1. (1): the δ-structure on A^∧_cl exists uniquely by BS Lemma 2.17 (PR.0); δ_log is the composite M → A → A^∧_cl, and axioms (1)–(3) hold since they hold in A.
2. (2): the δ-structure on B exists uniquely by BS Lemma 2.18 (PR.0); δ_log is the composite M → A → B.

**Acceptance conditions.**

- The p-adic completion of (Z_(p)[x], x^N) with δ_log = 0 is (Z_p⟨x⟩, x^N) of rank 1.
- Uniqueness fails without finite generation in general: the hypothesis I f.g. is retained.

**Prerequisites.** `PrismaticCohomology:PR.8/delta-log-ring`, `PrismaticCohomology:PR.0/delta-completion-unique-fg`, `PrismaticCohomology:PR.0`.

**Sources.** K1, §2, Lemma 2.9 (p. 8–9): Part (1). K1, §2, Lemma 2.13 (p. 10): Part (2).

### δ_log-structures on associated log structures

Node `PR.8/delta-log-associated-log` (theorem); implementation status `unchecked`.

(1) Let (A, M) be a δ_log-ring and N := M ⊔_{α^{-1}(A^×)} A^× the pushout of monoids. There is a unique δ_log-structure on the prelog ring (A, N) compatible with that of (A, M). (2) If moreover A is classically I-complete for a finitely generated ideal I ∋ p, then for every affine U = Spf(B) étale over Spf(A), the log ring (B, Γ(U, M^a)) of the associated log structure M^a on Spf(A)_ét carries a unique δ_log-structure compatible with (A, M) and with étale localisation. Hence δ_log-structures make sense on log structures (on the étale site of Spf(A)).

**Hypotheses.** (2): A classically I-complete, I finitely generated, p ∈ I.

**Proof or construction outline.**

1. (1): A^× → A and α^{-1}(A^×) → A carry unique δ_log-structures (trivial-log example); the defining square is a pushout of δ_log-rings with common underlying ring A.
2. (2): for A → B I-completely étale, transfer δ by δ_log-completion-etale (2) and extend to the associated log ring by (1).
3. Sheafify and take global sections; check the δ_log-axioms on stalks.

**Acceptance conditions.**

- For a log ring (A, M) the construction returns (A, M) itself.
- For (Z_p[[u]], N → u^n), the associated log structure is generated by u and units, with δ_log(u·v) = δ_log(v) for v a unit, δ_log(u) = 0.

**Prerequisites.** `PrismaticCohomology:PR.8/delta-log-ring`, `PrismaticCohomology:PR.8/delta-log-completion-etale`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources.** K1, §2, Proposition 2.14 (p. 10): Part (1). K1, §2, Corollary 2.15 (p. 10): Part (2).

### Extension of δ_log along M ⊂ N ⊂ M^gp

Node `PR.8/delta-log-groupification` (theorem); implementation status `unchecked`.

Let (A, M, α) be a δ_log-ring with M integral and p ∈ rad(A). (1) There is a unique map δ_log: M^gp → A extending the given δ_log on M and satisfying δ_log(mm′) = δ_log(m) + δ_log(m′) + pδ_log(m)δ_log(m′) on M^gp, namely δ_log(m′/m) = (δ_log(m′) − δ_log(m))/(1 + pδ_log(m)). (2) For every submonoid N ⊂ M^gp containing M there is a unique δ-structure on A ⊗_{Z_(p)[M]} Z_(p)[N] making (A ⊗_{Z_(p)[M]} Z_(p)[N], N) a δ_log-ring over (A, M) with this δ_log. (3) The map (A, M) → (A ⊗_{Z_(p)[M]} Z_(p)[N], N) is universal among maps of δ_log-rings (A, M) → (B, N) compatible with M ⊂ N, and its formation commutes with base change A → A′.

**Hypotheses.** M integral; p in the Jacobson radical of A; N a submonoid of M^gp containing M.

**Proof or construction outline.**

1. (1): define δ_log on fractions by the displayed formula; check independence of representatives and the cocycle identity using integrality of M and invertibility of 1 + pδ_log(m).
2. Uniqueness in (2)–(3): δ_log determines δ on the image of N via δ(n) = n^p δ_log(n), hence on the tensor product.
3. Existence for M free: pass to the p-localisation of the free δ_log-ring (A{M}_δlog, M); reduce to α injective with α(M) nonzerodivisors; then A ⊗_{Z_(p)[M]} Z_(p)[M^gp] = α(M)^{-1}A = S^{-1}A for S = ∪_n φ^n(α(M)), which is φ-stable, so carries a δ-structure (BS Lemma 2.15; PR.0); A ⊗ Z_(p)[N] ⊂ α(M)^{-1}A is δ-stable since δ(n) = n^p δ_log(n).
4. General M: use the surjection (A{N^M}_δlog, N^M) → (A, M), the inverse images M̃, Ñ ⊂ Z^M and the comparison map (1) of K1 for N^M and M̃; base change.

**Acceptance conditions.**

- For (A, M) = (Z_p⟨x⟩, x^N) of rank 1 and N = x^Z, the result is (Z_p⟨x^{±1}⟩, x^Z) with δ_log(x^{-1}) = 0.
- For M = N^2 with generators x, y and N generated by M and t = x/y, A ⊗_{Z_(p)[x,y]} Z_(p)[y, t] = A[t]/(ty − x), with δ(t) = t^p·δ_log(t) and δ_log(t) = (δ_log(x) − δ_log(y))/(1 + p·δ_log(y)).

**Prerequisites.** `PrismaticCohomology:PR.8/delta-log-ring`, `PrismaticCohomology:PR.8/delta-log-free`, `PrismaticCohomology:PR.0/delta-localization-phi-stable`, `mathlib:Algebra.GrothendieckGroup`, `mathlib:TensorProduct`, `CrystallineCohomology:CR.5:log-algebra/integral-monoid`, `CrystallineCohomology:CR.5:log-algebra/prelog-ring`.

**Sources.** K1, §2, Proposition 2.16 (p. 11): Part (1). K1, §2, Proposition 2.16 (p. 11): Parts (2)–(3). K1, §1, p. 5: Role of the node.

### Exactification of δ_log-triples

Node `PR.8/delta-log-exactification` (construction); implementation status `unchecked`.

Let (A, I, M) be a δ_log-triple (a δ_log-ring with an ideal I) with A classically p-complete, (A/I, N) a prelog ring and (A, M) → (A/I, N) a surjective map of prelog rings with M and N integral. Let h: M → N, h̄: M → N/N^× and M′ := (h^gp)^{-1}(N) = (h̄^gp)^{-1}(N/N^×) ⊂ M^gp; M′ is generated by M and (h̄^gp)^{-1}(e). The exactification is the δ_log-triple (A′, I′, M′) with A′ := A ⊗_{Z_(p)[M]} Z_(p)[M′] (with the δ_log-structure of Proposition 2.16), the induced exact surjection (A′, M′) → (A/I, N), and I′ := ker(A′ → A/I). The construction is functorial and the formation of (A′, M′) commutes with base change on A. If (A, M) → (A/I, N) lives over (B, M_B) with M_B → N integral, then M_B → M′ is integral.

**Hypotheses.** A classically p-complete; M, N integral; (A, M) → (A/I, N) surjective on rings and monoids.

**Proof or construction outline.**

1. M′ is the monoid exactification of h (owned by CR.5's log algebra); A′ is the induced ring.
2. Apply delta-log-groupification to (A, M) and M ⊂ M′ ⊂ M^gp (p ∈ rad(A) by p-completeness).
3. The natural map M′ → N lifts (A, M) → (A/I, N) to an exact surjection (A′, M′) → (A/I, N) (Proposition 2.16).
4. Integrality of M_B → M′: the composite M_B → M′ → N is integral and M′ → N is exact. Apply Ogus I.4.6.3.1 (the freely readable 2006 draft Proposition I.4.3.17(1)); K1 Remark 2.18 misprints the domain as N.

**Uses determining the interface.**

- Koshikawa I, Proposition 3.6: prelog prismatic envelopes are built by first exactifying, then taking a prismatic envelope.
- Koshikawa I, Construction 4.7 and Proposition 4.13: Čech–Alexander covers use the exactification of (B ⊗̂ C, M_B ×_{M_A} M_C) → (C/IC, P).
- Koshikawa–Yao II, §4.3 and Construction 5.11: the exactification M♭ → M̃ → N of a perfectoid surjection gives the non-perfect base prism Ã_inf(R, M̃).

**Planning API.**

- `DeltaLogTriple.exactification` (constructor; signature outstanding): The δ_log-triple (A′, I′, M′) with A′ = A ⊗_{Z_(p)[M]} Z_(p)[(h^gp)^{-1}(N)].
- `DeltaLogTriple.exactification.toQuotient_exactSurjective` (characterisation; signature outstanding): (A′, M′) → (A/I, N) is surjective and M′/M′^× ≅ N/N^×.
- `DeltaLogTriple.exactification.lift` (universal-property; signature outstanding): Every map of δ_log-triples (A, I, M) → (B, J, M_B) whose target surjects exactly onto (A/I, N) compatibly factors uniquely through (A′, I′, M′).
- `DeltaLogTriple.exactification.baseChange` (functoriality; signature outstanding): For A → A″ the exactification of the base change is the base change of (A′, M′).
- `DeltaLogTriple.exactification.integral` (other; signature outstanding): If M_B → N is integral for a base (B, M_B), then the induced M_B → M′ is integral.

**Discriminating unit tests.**

- `DeltaLogTriple.exactification_of_exact` (degenerate; signature outstanding): If (A, M) → (A/I, N) is already exact surjective then (A′, I′, M′) = (A, I, M).
- `DeltaLogTriple.exactification_diagonal` (computation; signature outstanding): For (Z_p⟨X_0, X_1⟩, X_0^N X_1^N) → (Z_p⟨X_0⟩, X_0^N) sending both generators to X_0, M′ = X_0^N·(X_1/X_0)^Z and A′ = Z_p⟨X_0, X_1⟩[T,T^{-1}]/(X_0T − X_1). This exactification is algebraic; completion is a separate step in the envelope construction.
- `DeltaLogTriple.exactification_not_ring_quotient` (non-example; signature outstanding): The exactification is not the kernel-ideal construction on A alone: for the diagonal example the ring changes (X_1/X_0 is adjoined), so the prismatic envelope of A → A/I without exactification is the wrong object.
- `DeltaLogTriple.exactification_compat_monoid` (compatibility; typed form, proof admitted): For integral M and N, the exactification monoid is exactly (h^gp)^{-1}(N) ⊂ M^gp: x lies in M′ iff h^gp(x) lies in the image of N → N^gp, using Mathlib’s Algebra.GrothendieckGroup. This is the carrier used by CR.5’s monoid exactification.

**Acceptance conditions.**

- For (Z_p[[u]], (E), N → u) → (O_K, N → π) the exactification is trivial (already exact).
- For the diagonal surjection (A⟨X_0, X_1⟩, N^2) → (A/I⟨X_0⟩, N), the exactification adjoins (X_1/X_0)^{±1}, as in K1 §5.4.

**Prerequisites.** `PrismaticCohomology:PR.8/delta-log-groupification`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources.** K1, §2, Construction 2.17 (p. 12): Construction and functoriality. K1, §2, Remark 2.18 (p. 13): Integrality clause. OgusDraft, I, Proposition 4.3.17(1), pp. 92–93: Apply u: M_B → M′ and v: M′ → N. This proves the correction of K1 Remark 2.18.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/DeltaLog`, namespace `TauCeti.LogPrismatic`.

## B. Prisms, envelopes and perfectoid monoids

### Prelog prisms

Node `PR.8/prelog-prism` (definition); implementation status `unchecked`.

A prelog prism is a δ_log-triple (A, I, M) (a δ_log-ring (A, M) with an ideal I) such that (A, I) is a prism in the sense of BS22 (I defines a Cartier divisor, A is derived (p, I)-complete, p ∈ I + φ(I)A). It is bounded if (A, I) is bounded (A/I has bounded p^∞-torsion), and of rank 1 if δ_log = 0. Maps of prelog prisms are maps of δ_log-triples (maps of δ_log-rings carrying I into J). Rigidity: if (A, I, M) is a prelog prism and A → B a map of δ-rings with B (p, I)-complete, then (B, IB, M) is a prelog prism iff B[I] = 0; this holds when (A, I) is bounded and B is (p, I)-completely flat over A.

**Hypotheses.** The prism conditions are PR.0's. No condition on the monoid M (integrality is imposed where needed).

**Proof or construction outline.**

1. Define as the full subcategory of δ_log-triples whose underlying δ-pair is a prism.
2. Rigidity: the condition only involves the underlying δ-pair, so BS Lemma 3.5 and Lemma 3.7(3) (PR.0) apply.

**Uses determining the interface.**

- Koshikawa I, §4 Definition 4.1: the base of a relative log prismatic site is a bounded prelog prism (A, I, M_A) with M_A integral.
- Koshikawa–Yao II, Theorem 2: all comparison theorems are stated over a bounded prelog prism with integral monoid.
- Koshikawa I, Proposition 3.6: prelog prismatic envelopes are prelog prisms over an orientable base.

**Planning API.**

- `PrelogPrism.mk` (constructor; typed form, proof admitted): From a δ_log-ring (A, M) and an ideal I with (A, I) a prism, a prelog prism.
- `PrelogPrism.toPrism` (projection; typed form, proof admitted): The underlying prism (A, I).
- `PrelogPrism.IsBounded` (other; typed form, proof admitted): Boundedness of the underlying prism.
- `PrelogPrism.IsRankOne` (other; typed form, proof admitted): δ_log = 0.
- `PrelogPrism.baseChange_of_flat` (functoriality; signature outstanding): If (A, I) is bounded and A → B is a (p, I)-completely flat δ-map with B (p, I)-complete, then (B, IB, M) is a prelog prism.
- `PrelogPrism.rigid` (characterisation; signature outstanding): For a δ-map A → B with B (p, I)-complete, (B, IB, M) is a prelog prism iff B[I] = 0.

**Discriminating unit tests.**

- `PrelogPrism.zero_log` (computation; typed form, proof admitted): (Z_p, (p), N → Z_p, 1 ↦ 0) is a bounded prelog prism of rank 1.
- `PrelogPrism.trivial_monoid` (degenerate; typed form, proof admitted): With M = {e}, prelog prisms are exactly prisms.
- `PrelogPrism.not_delta_pair` (non-example; typed form, proof admitted): (Z_p[x], (x), x^N) with δ(x) = 0 is a δ_log-triple of rank 1 that is not a prelog prism: x is not distinguished and Z_p[x] is not (p, x)-complete.
- `PrelogPrism.forget_compat` (compatibility; signature outstanding): The forgetful functor to prisms sends (W(k), (p), N → 0) to PR.0's crystalline prism (W(k), (p)).

**Acceptance conditions.**

- (A, I, N → A, 1 ↦ 0) is a rank-1 prelog prism for any prism (A, I) (K1 Example 3.4(2)).
- A bounded prism with trivial monoid is a prelog prism of rank 1.

**Prerequisites.** `PrismaticCohomology:PR.8/delta-log-ring`, `PrismaticCohomology:PR.0`.

**Sources.** K1, §3, Definition 3.3 (p. 14): Definition. K1, §3, after Example 3.4 (p. 14): Rigidity clause.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/Prism`, namespace `TauCeti.LogPrismatic`.

### Log prisms

Node `PR.8/log-prism` (definition); implementation status `unchecked`. Planet: **Log prism**.

Let (A, I, M) be a bounded prelog prism. Then Spf(A) (with the (p, I)-adic topology; A is classically (p, I)-complete) carries the associated log structure M^a_{Spf(A)} with its δ_log-structure (Corollary 2.15). A log prism is a triple (A, I, M_{Spf(A)}) of a bounded prism (A, I) and a log structure on Spf(A) with a δ_log-structure arising from some bounded prelog prism; (A, I, M)^a denotes the associated log prism. A map of log prisms is a map of log formal schemes inducing a map of prisms and preserving δ_log. Conversely (A, I, Γ(Spf(A), M_{Spf(A)})) is a prelog prism. A map of bounded prelog prisms (A, I, M_A) → (B, J, Γ(Spf(B), M_{Spf(B)})) induces a unique map of log prisms (A, I, M_A)^a → (B, J, M_{Spf(B)}). In the convention of Koshikawa–Yao, a ''log prism'' (in quotation marks) is a bounded prelog prism whose (A, M_A) is a log ring; for (A, M_A) a log ring with A classically p-complete the δ_log-structure induces the Frobenius lift φ(m) = m^p(1 + pδ_log(m)).

**Hypotheses.** Bounded prelog prism; A classically (p, I)-complete (BS Lemma 3.7).

**Proof or construction outline.**

1. Use delta-log-associated-log on the étale site of Spf(A) to put a δ_log-structure on M^a.
2. Maps from prelog prisms: by rigidity J = IB; the constant prelog structure M_A maps to M_{Spf(B)} compatibly with δ_log, inducing a map of associated log structures (K1 Remark 3.5).
3. Note that (B, J, Γ(Spf(B), M))^a → (B, J, M) need not be an isomorphism (K1 Remark 3.5): keep both notions.

**Uses determining the interface.**

- Koshikawa I, Definition 4.1: objects of the log prismatic site are log prisms with integral log structure over (A, I, M_A)^a.
- Koshikawa I, Proposition 3.7: log prismatic envelopes are log prisms satisfying a universal property among log prisms.
- Koshikawa–Yao II, Definition 7.34: objects of the absolute saturated log prismatic site are saturated log prisms.

**Planning API.**

- `LogPrism.ofPrelog` (constructor; signature outstanding): The associated log prism (A, I, M)^a of a bounded prelog prism.
- `LogPrism.globalSections` (projection; signature outstanding): The prelog prism (A, I, Γ(Spf(A), M_{Spf(A)})).
- `LogPrism.homOfPrelog` (universal-property; signature outstanding): Maps of prelog prisms (A, I, M_A) → (B, J, Γ(Spf(B), M)) correspond bijectively to maps of log prisms (A, I, M_A)^a → (B, J, M).
- `LogPrism.frobenius` (structure; signature outstanding): For a log prism the Frobenius lift (φ_A, φ_M) of the log formal scheme Spf(A) (from delta-log-frobenius).
- `LogPrism.IsIntegral` (other; signature outstanding): The log structure is integral.
- `LogPrism.trivial` (example; signature outstanding): Any bounded prism with the trivial log structure O^×.

**Discriminating unit tests.**

- `LogPrism.trivial_frobenius` (degenerate; signature outstanding): For the trivial log structure the Frobenius of the log prism is φ_A.
- `LogPrism.bk_associated` (computation; signature outstanding): The associated log structure of (W(k)[[u]], (E(u)), N → u^n) on Spf(W(k)[[u]]) (a single point for the (p, E)-adic topology) has characteristic monoid M/O^× ≅ N, generated by u.
- `LogPrism.globalSections_not_inverse` (non-example; signature outstanding): (B, J, Γ(Spf(B), M))^a → (B, J, M) need not be an isomorphism (K1 Remark 3.5): a log prism is not the same as a prelog prism on global sections.
- `LogPrism.forget_compat` (compatibility; signature outstanding): Forgetting the log structure sends log prisms to PR.0's bounded prisms, and the trivial log prism functor is a section.

**Acceptance conditions.**

- The trivial log structure on a bounded prism is a log prism (K1 Example 3.4(1)).
- (A_inf, (ξ), O_C♭∖{0})^a is a log prism.

**Prerequisites.** `PrismaticCohomology:PR.8/prelog-prism`, `PrismaticCohomology:PR.8/delta-log-associated-log`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources.** K1, §3, Definition 3.3 (p. 14): Definition. KY, §2.3, Convention 2.34 (p. 21): The quoted variant.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/Prism`, namespace `TauCeti.LogPrismatic`.

### The standard prelog prisms

Node `PR.8/standard-log-prisms` (construction); implementation status `unchecked`.

The following are bounded prelog prisms: (1) for a bounded prism (A, I), the trivial log structure (A, I, O^×) and (A, I, N → A, 1 ↦ 0) of rank 1; (2) for a perfect prism (A, I) = (W(R♭), ker θ) with R perfectoid, (W(R♭), ker θ, R♭) with the Teichmüller prelog structure, of rank 1, and for R♭ a domain (A_inf, (ξ), O_C♭∖{0}); (3) the crystalline prelog prism (W(k), (p), N → W(k), 1 ↦ 0) of rank 1 (Hyodo–Kato base); (4) for K/W(k)[1/p] totally ramified with uniformiser π and Eisenstein polynomial E(u), the Breuil–Kisin prelog prism (W(k)[[u]], (E(u)), N → W(k)[[u]], n ↦ u^n) with δ_log = 0 and φ(u) = u^p. These are related by the maps of prelog prisms W(k)[[u]] → W(k) (u ↦ 0, identity on N) and W(k)[[u]] → A_inf (u ↦ [π♭], 1 ↦ [π♭]).

**Hypotheses.** k a perfect field of characteristic p; O_K totally ramified over W(k) with uniformiser π; C the completed algebraic closure; π♭ a compatible system of p-power roots.

**Proof or construction outline.**

1. Each underlying prism is a prism by PR.0's acceptance examples.
2. Each prelog structure has δ(α(m)) = 0 (α(m) a Teichmüller element, 0 or u with φ(u) = u^p), so δ_log = 0 is a δ_log-structure.
3. Compatibility of the displayed maps with prelog structures: u ↦ 0 and 0 ↦ 0; u ↦ [π♭].

**Uses determining the interface.**

- Koshikawa I, Example 1.6: RΓ_BK(X) := RΓ_Δ((X, M_X)/(W(k)[[u]], N)) is defined over the Breuil–Kisin prelog prism.
- Koshikawa I, Example 1.5 and Theorem 8.1: the A_inf prelog prism (A_inf, ker θ, O_C♭∖{0}) is the base for the comparison with AΩ.
- Koshikawa–Yao II, Theorem 10: the Breuil–Kisin log prism (S, (E), N) is the base of the low-ramification structure theorem.

**Planning API.**

- `PrelogPrism.breuilKisin` (constructor; signature outstanding): The Breuil–Kisin prelog prism (W(k)[[u]], (E(u)), N → u^n) of rank 1.
- `PrelogPrism.ainf` (constructor; signature outstanding): The prelog prism (A_inf, ker θ, O_C♭∖{0}) with Teichmüller prelog structure, of rank 1.
- `PrelogPrism.crystallineZeroLog` (constructor; signature outstanding): The prelog prism (W(k), (p), N → W(k), 1 ↦ 0).
- `PrelogPrism.breuilKisinToCrystalline` (functoriality; signature outstanding): The map of prelog prisms u ↦ 0 from the Breuil–Kisin prelog prism to (W(k), (p), N).
- `PrelogPrism.breuilKisinToAinf` (functoriality; signature outstanding): The map of prelog prisms u ↦ [π♭] to (A_inf, ker θ, O_C♭∖{0}), with N → O_C♭∖{0}, 1 ↦ π♭.

**Discriminating unit tests.**

- `PrelogPrism.breuilKisin_frobenius` (computation; signature outstanding): In the Breuil–Kisin prelog prism φ(u) = u^p and δ_log(1) = 0, so φ_M is multiplication by p on N.
- `PrelogPrism.breuilKisin_mod_u` (compatibility; signature outstanding): Reducing the Breuil–Kisin prelog prism along u ↦ 0 gives (W(k), (p), N → 0) since E(0) = p·unit.
- `PrelogPrism.ainf_rankOne` (characterisation; signature outstanding): In (A_inf, ker θ, O_C♭∖{0}), δ([x]) = 0 for all x, so δ_log = 0 is forced (Lemma 2.1 of K1).
- `PrelogPrism.breuilKisin_not_frobenius_u_plus_p` (non-example; signature outstanding): With the Frobenius φ(u) = u^p + p on W(k)[[u]], (W(k)[[u]], (E), N → u) is not a δ_log-ring of rank 1, and no δ_log exists since u^p does not divide δ(u) = 1.

**Acceptance conditions.**

- Base change along W(k)[[u]] → A_inf is used for the Breuil–Kisin–A_inf comparison of K1 Example 1.6.
- The crystalline prelog prism (W(k), (p), N) is the base of Hyodo–Kato cohomology (K1 Example 1.3(1)).

**Prerequisites.** `PrismaticCohomology:PR.8/prelog-prism`, `PrismaticCohomology:PR.0`, `AInfCohomology:AI.0`, `mathlib:WittVector.teichmuller`, `mathlib:PowerSeries`.

**Sources.** K1, §3, Example 3.4(4) (p. 14): Item (4). K1, §3, Example 3.4(3) (p. 14): Item (2). K1, §1, Example 1.3 (p. 2–3): Item (3).

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/Prism`, namespace `TauCeti.LogPrismatic`.

### Prelog prismatic envelopes

Node `PR.8/prelog-prismatic-envelope` (construction); implementation status `unchecked`.

Fix an orientable prelog prism (A, I, M_A) with M_A integral. Let (B, J, M_B) be a δ_log-triple over (A, I, M_A) and (B, M_B) → (B/J, N) a surjection of prelog rings with M_B, N integral. There is a universal map (B, J, M_B) → (B′, IB′, M_{B′}) of δ_log-triples over (A, I, M_A) to a prelog prism with an exact surjection (B′, M_{B′}) → (B′/IB′, N); moreover M_{B′} is integral. It is called the prelog prismatic envelope.

**Hypotheses.** (A, I) orientable; M_A, M_B, N integral; (B, M_B) → (B/J, N) surjective.

**Proof or construction outline.**

1. Exactify (B, J, M_B) along (B, M_B) → (B/J, N) (delta-log-exactification); this does not change the universal problem.
2. For an exact surjection the problem is the (non-log) prismatic envelope of the δ-pair (B′, J′) over (A, I): apply the existence of prismatic envelopes over orientable prisms (Bhatt's notes V Lemma 5.1, owned by PR.0) and carry M′ along (K1 Proposition 3.6 proof).

**Uses determining the interface.**

- Koshikawa I, Proposition 3.7: its associated log prism is the log prismatic envelope.
- Koshikawa I, Construction 4.7: the cosimplicial prelog prism (C^•, IC^•, M_C^•) computing log prismatic cohomology is a levelwise prelog prismatic envelope.
- Koshikawa–Yao II, §4.3: the initial prelog prism Δ^init_{S/R} of a semiperfectoid pre-log ring is a prismatic envelope of the exactification.

**Planning API.**

- `PrelogPrism.envelope` (constructor; signature outstanding): The prelog prismatic envelope (B′, IB′, M_{B′}) of (B, J, M_B) → (B/J, N) over (A, I, M_A).
- `PrelogPrism.envelope.lift` (universal-property; signature outstanding): Maps of δ_log-triples from (B, J, M_B) to a prelog prism (C, IC, M_C) over (A, I, M_A) with an exact surjection (C, M_C) → (C/IC, N) compatible with (B/J, N) factor uniquely through the envelope.
- `PrelogPrism.envelope.exactSurjective` (characterisation; signature outstanding): (B′, M_{B′}) → (B′/IB′, N) is exact surjective.
- `PrelogPrism.envelope.monoid_integral` (other; signature outstanding): M_{B′} is integral.
- `PrelogPrism.envelope_of_exact` (compatibility; signature outstanding): For an exact surjection the envelope is PR.0's prismatic envelope of (B, J) with the monoid M_B unchanged.

**Discriminating unit tests.**

- `PrelogPrism.envelope_identity` (degenerate; signature outstanding): The envelope of (A, I, M_A) → (A/I, M_A) itself is (A, I, M_A).
- `PrelogPrism.envelope_trivial_log` (compatibility; signature outstanding): With all monoids trivial, the prelog prismatic envelope is the BS22 prismatic envelope.
- `PrelogPrism.envelope_log_line_diagonal` (computation; signature outstanding): For (A⟨X_0, X_1⟩, X_0^N X_1^N) → (A/I⟨X_0⟩, X_0^N) the envelope is the completion of A⟨X_0, X_1⟩{(I, X_1/X_0 − 1)/I}_δ with monoid X_0^N(X_1/X_0)^Z (K1 §5.4).
- `PrelogPrism.envelope_not_without_exactification` (non-example; signature outstanding): Without exactification the non-log prismatic envelope of (A⟨X_0, X_1⟩, (I, X_1 − X_0)) gives the non-log Čech nerve, whose Hodge–Tate cohomology is ordinary Ω, not log Ω.

**Acceptance conditions.**

- For an exact surjection with J generated by I and a (p, I)-completely regular sequence relative to A, the envelope is the PR.0 prismatic envelope with monoid unchanged.
- Universality is used only for maps to bounded prisms (K1 footnote 8).

**Prerequisites.** `PrismaticCohomology:PR.8/delta-log-exactification`, `PrismaticCohomology:PR.8/prelog-prism`, `PrismaticCohomology:PR.0`.

**Sources.** K1, §3, Proposition 3.6 (p. 15): The construction. K1, §3, Proposition 3.6 proof (p. 15): Proof sketch.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/Envelope`, namespace `TauCeti.LogPrismatic`.

### Universal property of log prismatic envelopes

Node `PR.8/log-prismatic-envelope` (theorem); implementation status `unchecked`.

In the situation of the prelog prismatic envelope, assume (B′, IB′, M_{B′}) is bounded. Then (B′, IB′, M_{B′})^a with the exact closed immersion (Spf(B′/IB′), N^a) ↪ (Spf(B′), M^a_{B′}) is final among commutative squares with top arrow an exact closed immersion (Spf(C/IC), N^a) ↪ (Spf(C), M_{Spf(C)}) for log prisms (C, IC, M_{Spf(C)}) with integral log structure over (Spf(B/J), N^a) → (Spf(B), M^a_B). Key lemma: for such a log prism, with N^a_{C/I} := Γ(Spf(C/IC), N^a), the map (C, Γ(Spf(C), M_{Spf(C)})) → (C/IC, N^a_{C/I}) is exact surjective and a (1 + IC)-torsor on monoids.

**Hypotheses.** (A, I, M_A) orientable with integral M_A; the prelog prismatic envelope is bounded.

**Proof or construction outline.**

1. Lemma 3.8: for exact closed immersions (Spf(C/(p^m, I)), M) ↪ (Spf(C/(p^m, I^n)), M), Beilinson's exercise gives exact surjections on global sections which are (1 + I)-torsors; pass to the limit over m, n.
2. Form Γ(Spf(C), M) ×_{N^a_{C/I}} N; it is a chart of M_{Spf(C)} with δ_log-structure and maps exactly onto N.
3. Apply the universal property of the prelog prismatic envelope to obtain a map of bounded prelog prisms, and pass to associated log prisms (log-prism API homOfPrelog).

**Acceptance conditions.**

- Uniqueness of the factorisation holds since the chart Γ(Spf(C), M) ×_{N^a} N is canonical.
- For trivial log structures the theorem is the universal property of BS22 prismatic envelopes among bounded prisms.

**Prerequisites.** `PrismaticCohomology:PR.8/prelog-prismatic-envelope`, `PrismaticCohomology:PR.8/log-prism`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources.** K1, §3, Proposition 3.7 (p. 15): Theorem. K1, §3, Lemma 3.8 (p. 15–16): Key lemma.

### Flatness of prelog prismatic envelopes for smooth log algebras

Node `PR.8/envelope-flatness-smooth` (theorem); implementation status `unchecked`.

Fix a bounded prelog prism (A, I, M_A) with M_A integral. (1) Let (B_0, M_B) be a prelog ring over (A, M_A) with M_B integral and (B_0, M_B) → (B_0/J, N) a surjection onto a p-completely smooth prelog ring over (A/I, M_A) (smooth in Koshikawa's Appendix A sense). Assume M_A → N is integral, N is weakly finitely generated over M_A, and (∗): M_A → M_B is injective and integral, M_B^gp/M_A^gp is free abelian, and B_0 is (p, I)-completely free over the completion of A ⊗_{Z_(p)[M_A]} Z_(p)[M_B]. Let (B, M_B) be the (p, I)-completed free δ_log-ring over (A, M_A) generated by (B_0, M_B). Then the prelog prismatic envelope (B′, IB′, M_{B′}) of (B, (JB)^∧, M_B) exists, is (p, I)-completely flat over A (hence bounded), and its formation commutes with base change on (A, I, M_A) and with (p, I)-completely flat base change on B_0. (2) Variant: if (B, M_B) is a (p, I)-completely smooth δ_log-ring over (A, M_A) with M_A → M_B a smooth chart, (B, M_B) → (R, P) a surjection onto a p-completely smooth prelog ring over (A/I, M_A) with M_A → P integral, then the prelog prismatic envelope exists, is (p, I)-completely flat over A and commutes with base change on (A, I, M_A).

**Hypotheses.** (A, I, M_A) bounded with M_A integral; smoothness in the sense of Koshikawa Appendix A (CR.5); hypotheses (∗) and weak finite generation in (1).

**Proof or construction outline.**

1. Replace M_A by M_A′ = inverse image of N in M_A^gp (flat base change, Proposition 2.16) so M_A → N is exact; the envelope does not change by universality.
2. Exactify (B_0, M_B) → (B_0/J, N); condition (∗) persists (Remark 2.18).
3. Write (B_0, M_B) as a (p, I)-completed filtered colimit of (p, I)-completely smooth (A, M_A)-algebras (B_s, M_s) with faithfully flat transitions and exact surjections onto (B_0/J, N), using weak finite generation and that subgroups of free abelian groups are free.
4. Each kernel B_s → B_0/J is Zariski locally generated by I and a (p, I)-completely regular sequence relative to A (smoothness), so BS Proposition 3.13 (PR.0) applies; conclude by Zariski descent and the completed colimit.
5. (2): exactify (Proposition 2.16, Remark 2.18) and apply BS Proposition 3.13 directly.

**Acceptance conditions.**

- For the log affine line (A/I⟨N⟩, M_A ⊕ N) with lift (A⟨N⟩, M_A ⊕ N), the envelope of the self-product is (p, I)-completely flat (used in K1 §5.4).
- For trivial log structures (2) is BS22 Proposition 3.13 for smooth algebras.

**Prerequisites.** `PrismaticCohomology:PR.8/prelog-prismatic-envelope`, `PrismaticCohomology:PR.8/delta-log-exactification`, `PrismaticCohomology:PR.8/delta-log-free`, `PrismaticCohomology:PR.0`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources.** K1, §3, Proposition 3.9 (p. 17): Part (1). K1, §3, Proposition 3.11 (p. 18): Part (2). K1, §3, before Proposition 3.9 (p. 16): Role.

### Perfectoid monoids and perfectoid log rings

Node `PR.8/perfectoid-monoid` (definition); implementation status `unchecked`.

For a commutative monoid M its tilt is M♭ := lim_{m ↦ m^p} M; M♭ and M♭/(M♭)^× are uniquely p-divisible. M is perfectoid if M♭/(M♭)^× → M/M^× is an isomorphism; perfect if M is uniquely p-divisible (M♭ → M an isomorphism); pseudo-perfectoid if M/M^× is uniquely p-divisible. A pre-log ring (R, M) is perfectoid if R is a perfectoid ring (in the sense of BMS1) and M is perfectoid; then (R, M♭) → (R, M) induces an isomorphism of associated log rings, and the tilt (R♭, M♭) with α♭(m_0, m_1, …) = (α(m_0), α(m_1), …) and A_inf(R) := (W(R♭), M♭ → W(R♭), m ↦ [α♭(m)]) are defined. An integral log ring (R, M) is a perfectoid log ring if it is perfectoid as a pre-log ring, equivalently R is perfectoid and M/M^× is uniquely p-divisible.

**Hypotheses.** p fixed; R perfectoid in the sense of BMS1 (as used by PR.0).

**Proof or construction outline.**

1. Define M♭ as Mathlib's monoid perfection (limit along p-th powers) and the three conditions.
2. Construct α♭ and [α♭] using the multiplicative identification R♭ = lim_{x ↦ x^p} R and Teichmüller lifts.
3. For integral log rings: Remark 2.23 builds θ: M♭_{R/p} → M from (R/p^n, M)^a; Remark 2.24 shows pseudo-perfectoid ⇒ perfectoid, giving the equivalence in Definition 2.25.

**Uses determining the interface.**

- Koshikawa–Yao II, Proposition 2.39: perfect log prisms correspond to perfectoid log rings.
- Koshikawa–Yao II, Lemma 2.28: perfectoid pre-log rings have vanishing p-completed log cotangent complex relative to their underlying ring.
- Koshikawa–Yao II, Definition 3.11: semiperfectoid pre-log rings admit maps from perfectoid ones surjective modulo units on monoids.
- Koshikawa–Yao II, Remark 6.2: the étale comparison over a pre-log prism with (A/I, M_A) perfectoid reduces to the trivial-log base.

**Planning API.**

- `Monoid.tilt` (constructor; typed form, proof admitted): M♭ = lim_{m ↦ m^p} M, Mathlib's monoid perfection of M at p.
- `Monoid.IsPerfectoid` (other; typed form, proof admitted): M♭/(M♭)^× → M/M^× is bijective.
- `Monoid.IsPerfect` (other; typed form, proof admitted): M is uniquely p-divisible.
- `Monoid.IsPseudoPerfectoid` (other; typed form, proof admitted): M/M^× is uniquely p-divisible.
- `Monoid.IsPerfect.isPerfectoid` (relation; typed form, proof admitted): Perfect monoids are perfectoid.
- `Monoid.IsPerfectoid.isPseudoPerfectoid` (relation; typed form, proof admitted): Perfectoid monoids are pseudo-perfectoid.
- `PrelogRing.tilt` (constructor; signature outstanding): For a perfectoid pre-log ring (R, M), the pre-log ring (R♭, M♭, α♭).
- `PrelogRing.ainf` (constructor; signature outstanding): A_inf(R) = (W(R♭), M♭ → W(R♭), m ↦ [α♭(m)]).
- `PerfectoidLogRing.iff_pseudoPerfectoid` (characterisation; signature outstanding): For an integral log ring (R, M) with R perfectoid, M is perfectoid iff M/M^× is uniquely p-divisible.

**Discriminating unit tests.**

- `Monoid.tilt_nat_inv_p` (computation; signature outstanding): For M = N[1/p] (additive), M♭ ≅ N[1/p] and M is perfect.
- `Monoid.isPerfectoid_units` (degenerate; typed form, proof admitted): Every group is perfectoid in this sense since M/M^× is trivial; its tilt is lim_{x ↦ x^p} M.
- `Monoid.valuationMonoid_perfectoid_not_perfect` (non-example; signature outstanding): O_C∖{0} for C algebraically closed perfectoid is perfectoid but not perfect, since 1 + p has many p-th roots.
- `Monoid.pseudoPerfectoid_not_perfectoid` (non-example; signature outstanding): The monoid generated by x_0, x_1, …, y_1^{±1}, … with x_j^p = x_{j−1}y_j is pseudo-perfectoid with M/M^× ≅ N[1/p] but M♭ = 0.
- `Monoid.tilt_compat_pretilt` (compatibility; signature outstanding): For an integral perfectoid ring R, the multiplicative monoid of PreTilt agrees with Monoid.tilt of (R, ·) under the multiplicative bijection R♭ ≅ lim_{x ↦ x^p} R.

**Acceptance conditions.**

- O_C∖{0} is perfectoid but not perfect (KY Remark 2.19).
- The monoid ⟨x_0, x_1, …, y_1^{±1}, …⟩/(x_j^p = x_{j−1} y_j) is pseudo-perfectoid but not perfectoid (M♭ = 0) (KY Remark 2.21).

**Prerequisites.** `mathlib:Perfection`, `mathlib:PreTilt`, `mathlib:WittVector.teichmuller`, `PrismaticCohomology:PR.0`, `CrystallineCohomology:CR.5:log-algebra/integral-monoid`, `CrystallineCohomology:CR.5:log-algebra/characteristic-monoid`.

**Sources.** KY, §2.3, Definition 2.18 (p. 17): Definition. KY, §2.3, Definition 2.25 (p. 18): Perfectoid log rings. KY, §2.3, Construction 2.22 (p. 17): Tilt.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/Perfectoid`, namespace `TauCeti.LogPrismatic`.

### Perfect log prisms

Node `PR.8/perfect-log-prism` (definition); implementation status `unchecked`.

A ''log prism'' (A, I, M_A) (bounded prelog prism with (A, M_A) a log ring) is perfect if M_A is integral and its Frobenius (φ_A, φ_{M_A}) is an isomorphism. If (A, I) is perfect, (A, I, M_A) is perfect iff M_A/A^× is uniquely p-divisible; a perfect ''log prism'' has p-saturated monoid. Every integral ''log prism'' has a perfection (A_perf, IA_perf, M_{A,perf}): the colimit perfection of A with the log structure associated to colim_φ M_A → A_perf. For a perfectoid integral pre-log ring (R, M), (A_inf(R), ker θ, M♭)^a is perfect and of rank 1.

**Hypotheses.** Integral monoid; (A, M_A) a log ring; boundedness as for log prisms.

**Proof or construction outline.**

1. Define perfection of the log ring via delta-log-frobenius.
2. Characterisation for perfect (A, I): φ on M_A induces the p-th power on M_A/A^× (KY Remark 2.36).
3. Perfection: by the formula for φ, M_{A,perf}/A_perf^× is uniquely p-divisible (KY Example 2.37).
4. A_inf example: δ([α♭(m)]) = 0, so rank 1 (KY Example 2.38).

**Uses determining the interface.**

- Koshikawa–Yao II, Theorem 2(5) and Theorem 7.30: the Kummer-étale comparison requires the base log prism to be perfect.
- Koshikawa–Yao II, Proposition 4.19: the perfection of the initial pre-log prism of a semiperfectoid pre-log ring is a perfect prism.
- Koshikawa–Yao II, Proposition 2.39: perfect log prisms are equivalent to perfectoid log rings.

**Planning API.**

- `LogPrism.IsPerfect` (other; typed form, proof admitted): M_A integral and (φ_A, φ_{M_A}) bijective.
- `LogPrism.isPerfect_iff_uniquelyDivisible` (characterisation; typed form, proof admitted): For perfect (A, I): perfect iff M_A/A^× is uniquely p-divisible.
- `LogPrism.IsPerfect.pSaturated` (relation; signature outstanding): A perfect ''log prism'' has p-saturated monoid.
- `LogPrism.perfection` (constructor; signature outstanding): The perfection (A_perf, IA_perf, M_{A,perf}) of an integral ''log prism''.
- `LogPrism.perfection.lift` (universal-property; signature outstanding): Maps from an integral ''log prism'' to a perfect one factor uniquely through its perfection.
- `LogPrism.ainfPerfect` (example; signature outstanding): (A_inf(R), ker θ, M♭)^a is perfect of rank 1 for a perfectoid integral pre-log ring (R, M).

**Discriminating unit tests.**

- `LogPrism.ainf_isPerfect` (computation; signature outstanding): (A_inf, (ξ), O_C♭∖{0})^a is a perfect log prism.
- `LogPrism.trivial_isPerfect_iff` (degenerate; typed form, proof admitted): With the trivial log structure, a log prism is perfect iff the underlying prism is perfect.
- `LogPrism.breuilKisin_not_perfect` (non-example; signature outstanding): The Breuil–Kisin log prism (W(k)[[u]], (E), N) is not perfect: u is not a p-th power and φ is not surjective.
- `LogPrism.zeroLog_perfect` (characterisation; signature outstanding): (W(k), (p), N → 0)^a is not perfect (N is not p-divisible), while its perfection has monoid N[1/p] modulo units.

**Acceptance conditions.**

- (A_inf, (ξ), O_C♭∖{0})^a is perfect.
- The Breuil–Kisin log prism is not perfect (its Frobenius is not surjective on W(k)[[u]]).

**Prerequisites.** `PrismaticCohomology:PR.8/log-prism`, `PrismaticCohomology:PR.8/delta-log-frobenius`, `PrismaticCohomology:PR.8/perfectoid-monoid`, `PrismaticCohomology:PR.0`.

**Sources.** KY, §2.4, Definition 2.35 (p. 21): Definition. KY, §2.4, Remark 2.36 (p. 21): Characterisation. KY, §2.4, Example 2.37 (p. 21): Perfection.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/Perfectoid`, namespace `TauCeti.LogPrismatic`.

### Perfect log prisms are perfectoid log rings

Node `PR.8/perfect-log-prisms-perfectoid` (theorem); implementation status `unchecked`.

The functor (A, I, M_A) ↦ (A/I, M_A)^a is an equivalence from perfect ''log prisms'' to perfectoid log rings, with quasi-inverse (R, M) ↦ (A_inf(R), ker θ, M♭)^a ≅ (A_inf(R), ker θ, M♭_{R/p})^a. In particular every perfect ''log prism'' admits a chart N → A of rank 1. Moreover, for a perfectoid integral pre-log ring (R, M) and an integral ''log prism'' (A, I, M_A), every map (R, M) → (A/I, M_A)^a of pre-log rings lifts uniquely to a map of pre-log prisms (A_inf(R), ker θ, M♭) → (A, I, M_A); so (A_inf(R), ker θ, M♭)^a is initial among integral ''log prisms'' under (R, M) (also with exact-surjection or associated-log variants).

**Hypotheses.** Perfect ''log prisms'' are integral and bounded; the lifting statement assumes (A, I, M_A) bounded and integral.

**Proof or construction outline.**

1. Lifting (Lemma 2.40): L_{(A_inf(R)/p^m)^a/(Z/p^m)} = 0, so (Z/p^m, (Z/p^m)^×) → (A_inf(R)/p^m)^a is formally log-étale (Sagave–Schürg–Vezzosi Theorem 5.6, imported through DD.6); lift through (A, M_A) by classical p-completeness.
2. Factor through lim_φ (A, M_A) using Frobenius lifts; since lim_φ A is p-torsion free and M_A integral, the map is a map of δ- and δ_log-rings with δ_log = 0 on M♭.
3. Equivalence: BS Theorem 3.10 (PR.0) on rings; on monoids use Remark 2.42: (A/I, M_A)^a ↦ (A_inf, ker θ, M♭)^a recovers (A, I, M_A).

**Acceptance conditions.**

- (R, M) = (O_C, O_C∖{0}) corresponds to (A_inf, (ξ), O_C♭∖{0}).
- (R, M) = (O_C, O_C^×) (trivial log) corresponds to the perfect prism (A_inf, (ξ)) with trivial log structure.

**Prerequisites.** `PrismaticCohomology:PR.8/perfect-log-prism`, `PrismaticCohomology:PR.8/perfectoid-monoid`, `PrismaticCohomology:PR.8/perfectoid-prelog-cotangent`, `PrismaticCohomology:PR.0`, `DerivedDeRhamCohomology:DD.6`.

**Sources.** KY, §2.4, Proposition 2.39 (p. 21): Equivalence. KY, §2.4, Lemma 2.40 (p. 22): Initiality.

### Log cotangent complexes of perfectoid pre-log rings

Node `PR.8/perfectoid-prelog-cotangent` (lemma); implementation status `unchecked`.

Let (R, M) be a perfectoid (or pseudo-perfectoid) pre-log ring and Z_p the trivial pre-log ring. Then the natural map L̂_{R/Z_p} → L̂_{(R,M)/Z_p} of p-completed (Gabber) log cotangent complexes is an isomorphism; equivalently L̂_{(R,M)/R} = 0; in particular L̂_{(R,M)/Z_p}[−1]{−1} ≅ R. For a map f: (R, M) → (S, N) of perfectoid pre-log rings, L̂_{(S,N)/(R,M)} = 0.

**Hypotheses.** Perfectoid or pseudo-perfectoid pre-log rings; p-completed Gabber log cotangent complex as supplied by DD.6.

**Proof or construction outline.**

1. By derived Nakayama reduce to L_{(R/p, M)/R/p} = 0.
2. L_{(R/p,M)/R/p} ≅ L_{(R/p,M)/(R/p, M^×)} and (R/p, M^×) → (R/p, M) is relatively perfect for pseudo-perfectoid M (KY Remark 2.26), so the log cotangent complex vanishes by the relatively-perfect vanishing lemma (DD.6).
3. For f: combine with the transitivity triangle and BMS2's computation for perfectoid rings.

**Acceptance conditions.**

- (O_C, O_C∖{0}): L̂_{(O_C, O_C∖{0})/Z_p}[−1] ≅ O_C{1} as for the trivial log structure.
- (R, N → R, 1 ↦ 0) is not perfectoid and L_{(R,N)/R} lives in degrees [−1, 0] (KY Example 2.30): a non-example.

**Prerequisites.** `PrismaticCohomology:PR.8/perfectoid-monoid`, `DerivedDeRhamCohomology:DD.6/gabber-log-cotangent`, `DerivedDeRhamCohomology:DD.6/log-cotangent-functoriality`.

**Sources.** KY, §2.3, Lemma 2.28 (p. 18): Statement (log versus non-log). KY, §2.3, Corollary 2.29 (p. 19): Corollary.

## C. Sites and cohomology

### The relative log prismatic site

Node `PR.8/log-prismatic-site` (definition); implementation status `unchecked`. Planet: **Log prismatic site**.

Fix a bounded prelog prism (A, I, M_A) with M_A integral and a log (p, I)-adic formal scheme (X, M_X) smooth over (A/I, M_A) in Koshikawa's sense (so M_X is integral). The log prismatic site ((X, M_X)/(A, M_A))_Δ is the opposite of the category of triples consisting of: a log prism (B, IB, M_{Spf(B)}) = (B, IB, M_B)^a with integral log structure and a map of log prisms (A, I, M_A)^a → (B, IB, M_{Spf(B)}); a map of formal schemes f: Spf(B/IB) → X over A/I; and an exact closed immersion of log formal schemes (Spf(B/IB), f^*M_X) ↪ (Spf(B), M_{Spf(B)}) over (A, M_A). A morphism is an étale cover if B → C is (p, I)-completely étale and faithfully flat and (Spf(C), M) → (Spf(B), M) is strict étale. The structure sheaves are O_Δ: B ↦ B and Ō_Δ: B ↦ B/IB, with O_Δ ⊗^L_A A/I ≅ Ō_Δ. The site depends only on (Spf(A), M_A)^a and (X, M_X), not on the chart M_A → A.

**Hypotheses.** (A, I, M_A) bounded with M_A integral. (X, M_X) smooth over (A/I, M_A) in the sense of Koshikawa Appendix A (CR.5). Étale topology; the (p, I)-completely faithfully flat topology gives the same cohomology (Remark 4.3).

**Proof or construction outline.**

1. Objects and morphisms as stated; étale covers form a pretopology because étale maps of B/IB lift uniquely (Remark 4.2: Lemma 2.13 and Corollary 2.15), so étale objects over B are equivalent to p-completely étale B/IB-algebras.
2. The presheaves O_Δ and Ō_Δ are sheaves by the same remark and étale descent.
3. Chart independence: the objects only involve the associated log structures (Remark 4.4).
4. For M_X trivial and M_A trivial, compare with BS22's prismatic site (X/A)_Δ with the étale topology.

**Uses determining the interface.**

- Koshikawa I, Remark 4.5: the morphism of topoi ν to X_ét defines Δ_{(X,M_X)/(A,M_A)} = Rν_*O_Δ.
- Koshikawa I, Theorem 5.3 and Theorem 6.3: the Hodge–Tate and crystalline comparisons compute the cohomology of O_Δ and Ō_Δ on this site.
- Koshikawa–Yao II, Proposition 4.12: the derived log prismatic cohomology of a smooth log formal scheme agrees with the cohomology of this site.
- Koshikawa I, Theorem 6.3 proof: the δ_log-crystalline site maps to the log prismatic site of the Frobenius twist by a cocontinuous functor.

**Planning API.**

- `LogPrismaticSite` (constructor; signature outstanding): The site ((X, M_X)/(A, M_A))_Δ with the étale topology.
- `LogPrismaticSite.structureSheaf` (data; signature outstanding): The sheaf O_Δ: (B, IB, M) ↦ B, valued in (p, I)-complete A-algebras with δ-structure.
- `LogPrismaticSite.reducedStructureSheaf` (data; signature outstanding): Ō_Δ: (B, IB, M) ↦ B/IB, with O_Δ ⊗^L_A A/I ≅ Ō_Δ.
- `LogPrismaticSite.etaleLift` (characterisation; signature outstanding): For an object B and a p-completely étale B/IB → C̄ there is a unique étale map of objects B → C with C/IC ≅ C̄ (Remark 4.2).
- `LogPrismaticSite.toEtale` (functoriality; signature outstanding): The morphism of topoi ν: Shv(((X, M_X)/(A, M_A))_Δ) → Shv(X_ét) with (ν_*F)(U) = H^0(((U, M_U)/(A, M_A))_Δ, F).
- `LogPrismaticSite.flat_eq_etale` (compatibility; signature outstanding): Replacing étale covers by (p, I)-completely faithfully flat covers does not change the cohomology of O_Δ (Remark 4.3).
- `LogPrismaticSite.trivialLog_equiv` (equivalence; signature outstanding): For trivial log structures the site is equivalent to PR.1's relative prismatic site with the étale topology.
- `LogPrismaticSite.chart_independent` (other; signature outstanding): The site depends only on (Spf(A), M_A)^a and (X, M_X).

**Discriminating unit tests.**

- `LogPrismaticSite.affineLine_object` (computation; signature outstanding): For (X, M_X) = (Spf(A/I⟨X⟩), M_A ⊕ N)^a, the triple (A⟨X⟩, I, M_A ⊕ N)^a with δ_log(N) = 0 and the identity Spf(A/I⟨X⟩) → X is an object.
- `LogPrismaticSite.trivialLog` (compatibility; signature outstanding): With M_A and M_X trivial, the site equals the PR.1 relative prismatic site (étale variant) and the structure sheaves agree.
- `LogPrismaticSite.base_point` (degenerate; signature outstanding): For X = Spf(A/I) with the log structure from M_A, (A, I, M_A)^a is a final object.
- `LogPrismaticSite.not_strict_open_immersion` (non-example; signature outstanding): For the log affine line with trivial base log structure, forgetting logs sends (A⟨X⟩, I, N)^a to a valid object of the underlying non-log prismatic site. It does not preserve the Hodge–Tate differential module: the canonical map R·dX → R·dlog X sends dX to X·dlog X and is not an isomorphism when X is not a unit.

**Acceptance conditions.**

- For trivial log structures the site is BS22's relative prismatic site with étale covers (Remark 4.4).
- For (R, P) = (A/I⟨X⟩, M_A ⊕ N) the object (A⟨X⟩, I, M_A ⊕ N)^a with δ_log(N) = 0 lies in the site.

**Prerequisites.** `PrismaticCohomology:PR.8/log-prism`, `PrismaticCohomology:PR.8/delta-log-completion-etale`, `PrismaticCohomology:PR.8/delta-log-associated-log`, `PrismaticCohomology:PR.1`, `CrystallineCohomology:CR.5:log-algebra`, `mathlib:CategoryTheory.GrothendieckTopology`.

**Sources.** K1, §4.1, Definition 4.1 (p. 19): Objects. K1, §4.1, Definition 4.1 (p. 19): Covers. K1, §4.1, Remark 4.4 (p. 19): Compatibility.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/Site`, namespace `TauCeti.LogPrismatic`.

### Log prismatic cohomology complexes

Node `PR.8/log-prismatic-cohomology` (construction); implementation status `unchecked`.

In the setting of the log prismatic site, define Δ_{(X,M_X)/(A,M_A)} := Rν_*O_Δ ∈ D(X_ét, A) and its reduction Δ̄_{(X,M_X)/(A,M_A)} := Rν_*Ō_Δ ∈ D(X_ét, A/I), commutative algebra objects with Δ̄ ≅ Δ ⊗^L_A A/I, and RΓ_Δ((X, M_X)/(A, M_A)) := RΓ(((X, M_X)/(A, M_A))_Δ, O_Δ), a (p, I)-complete E_∞-A-algebra with a φ_A-semilinear endomorphism φ induced by the δ-structures. For X = Spf(R) with an integral chart P → Γ(X, M_X) over M_A that is integral and weakly finitely generated over M_A, write Δ_{(R,P)/(A,M_A)}; it may be computed with the indiscrete topology and depends only on (Spf(R), P)^a and (A, I, M_A)^a.

**Hypotheses.** (A, I, M_A) bounded with M_A integral; (X, M_X) smooth over (A/I, M_A).

**Proof or construction outline.**

1. Construct ν as in BS Remark 4.4 using the equivalence of étale objects (log-prismatic-site API).
2. Frobenius: O_Δ → φ_{A,*}O_Δ from the δ-structures of the objects.
3. Δ̄ ≅ Δ ⊗^L A/I from O_Δ ⊗^L A/I ≅ Ō_Δ and the projection formula.
4. Indiscrete topology computes the same cohomology for affine X with a chart (§4.2).

**Uses determining the interface.**

- Koshikawa–Yao II, Theorem 2: all comparison theorems are statements about RΓ_Δ((X, M_X)/(A, M_A)) and the sheaf Δ_{(X,M_X)/(A,M_A)}.
- Koshikawa I, Example 1.6: the Breuil–Kisin cohomology of a semistable formal scheme is RΓ_Δ over the Breuil–Kisin prelog prism.
- Koshikawa–Yao II, Construction 4.1: the derived theory is the left Kan extension of Δ_{(R,P)/(A,M_A)} on log-free algebras.

**Planning API.**

- `LogPrismaticSite.cohomology` (constructor; signature outstanding): RΓ_Δ((X, M_X)/(A, M_A)) as a (p, I)-complete E_∞-A-algebra.
- `LogPrismaticSite.sheafCohomology` (constructor; signature outstanding): Δ_{(X,M_X)/(A,M_A)} = Rν_*O_Δ ∈ D(X_ét, A).
- `LogPrismaticSite.reducedCohomology` (constructor; signature outstanding): Δ̄_{(X,M_X)/(A,M_A)} = Rν_*Ō_Δ ∈ D(X_ét, A/I).
- `LogPrismaticSite.reduced_eq_tensor` (characterisation; signature outstanding): Δ̄ ≅ Δ ⊗^L_A A/I.
- `LogPrismaticSite.frobenius` (structure; signature outstanding): The φ_A-semilinear Frobenius φ: Δ → φ_{A,*}Δ.
- `LogPrismaticSite.cohomology_isComplete` (other; signature outstanding): RΓ_Δ is derived (p, I)-complete.
- `LogPrismaticSite.cohomology_map` (functoriality; signature outstanding): Functoriality in (X, M_X) over (A, M_A) and in maps of bounded prelog prisms.

**Discriminating unit tests.**

- `LogPrismaticSite.cohomology_point` (degenerate; signature outstanding): For X = Spf(A/I) with log structure from M_A, RΓ_Δ((X, M_X)/(A, M_A)) ≅ A with φ = φ_A.
- `LogPrismaticSite.cohomology_trivialLog` (compatibility; signature outstanding): With trivial log structures, Δ_{(X,M_X)/(A,M_A)} ≅ PR.1's Δ_{X/A}.
- `LogPrismaticSite.reduced_affineLine` (computation; signature outstanding): For (A/I⟨X⟩, M_A ⊕ N): H^0(Δ̄) = A/I⟨X⟩ and H^1(Δ̄){1} ≅ A/I⟨X⟩·dlog X, a free module of rank 1 (K1 §5.4).
- `LogPrismaticSite.cohomology_not_nonlog` (non-example; signature outstanding): For the log affine line, H^1(Δ̄){1} is generated by dlog X rather than dX: the log and non-log cohomologies differ (the map Ω^1 → Ω^1_log is X·, not an isomorphism).

**Acceptance conditions.**

- For trivial log structures this is BS22's Δ_{X/A} (PR.1).
- For X = Spf(A/I) with chart M_A, RΓ_Δ = A.

**Prerequisites.** `PrismaticCohomology:PR.8/log-prismatic-site`, `mathlib:DerivedCategory`, `PrismaticCohomology:PR.1`.

**Sources.** K1, §4.1, Remark 4.5 (p. 20): Definition. K1, §4.2 (p. 20): Frobenius and completeness.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/Site`, namespace `TauCeti.LogPrismatic`.

### The absolute saturated log prismatic site

Node `PR.8/absolute-log-prismatic-site` (definition); implementation status `unchecked`.

For an integral log p-adic formal scheme (X, M_X), the absolute log prismatic site (X, M_X)_Δ has objects diagrams (Spf(B), M_{Spf(B)}) ↩ (Spf(B/J), M_{Spf(B/J)}) → (X, M_X) where (B, J, M_{Spf(B)}) is a log prism with M_{Spf(B)} integral, M_{Spf(B/J)} its restriction, and the right map admits an integral chart étale locally; it carries the flat topology. For a bounded fs log p-adic formal scheme, the absolute saturated log prismatic site has objects saturated log prisms (A, I, M_A)^a with a map (Spf(A/I), M_A)^a → (X, M_X) admitting a saturated chart étale locally, with the strict flat topology. There is a strict variant requiring the right map to be strict, and the relative site maps to it.

**Hypotheses.** (X, M_X) integral (resp. bounded fs for the saturated variant).

**Proof or construction outline.**

1. Define objects and the (strict) flat topology; check fibre products of covers exist using log prismatic envelopes.
2. Construct the forgetful functor from the relative site of Definition 4.1 to the strict variant.

**Uses determining the interface.**

- Koshikawa–Yao II, Definition 7.35: Laurent F-crystals are crystals of vector bundles on this site.
- Koshikawa I, Lemma 4.14: the Breuil–Kisin log prism covers the final object of (O_K, O_K∖{0})_Δ.

**Planning API.**

- `AbsoluteLogPrismaticSite` (constructor; signature outstanding): The site (X, M_X)_Δ with the flat topology (integral variant).
- `AbsoluteLogPrismaticSite.saturated` (constructor; signature outstanding): The absolute saturated log prismatic site of a bounded fs log p-adic formal scheme, with the strict flat topology.
- `AbsoluteLogPrismaticSite.structureSheaf` (data; signature outstanding): O_Δ: (B, J, M) ↦ B and the ideal sheaf I_Δ: (B, J, M) ↦ J.
- `AbsoluteLogPrismaticSite.ofRelative` (functoriality; signature outstanding): The forgetful functor from the relative site ((X, M_X)/(A, M_A))_Δ to the strict variant.
- `AbsoluteLogPrismaticSite.trivialLog` (compatibility; signature outstanding): For trivial log structures the strict variant is PR.5's absolute prismatic site.

**Discriminating unit tests.**

- `AbsoluteLogPrismaticSite.bk_covers` (computation; signature outstanding): For (X, M_X) = (Spf(O_K), O_K∖{0})^a, the Breuil–Kisin log prism (W(k)[[u]], (E(u)), u^N)^a covers the final object (K1 Lemma 4.14).
- `AbsoluteLogPrismaticSite.point_perfect` (degenerate; signature outstanding): For (Spf(O_C), O_C∖{0})^a, the perfect log prism (A_inf, (ξ), O_C♭∖{0})^a is weakly final.
- `AbsoluteLogPrismaticSite.not_relative` (non-example; signature outstanding): Unlike the relative site, objects need not receive a map from a fixed base prism: for O_K the Breuil–Kisin prism depends on a choice of uniformiser, while the absolute site does not.

**Acceptance conditions.**

- For (O_K, O_K∖{0}) the Breuil–Kisin log prism covers the final object (K1 Lemma 4.14).
- For trivial log structure the strict variant is PR.5's absolute prismatic site.

**Prerequisites.** `PrismaticCohomology:PR.8/log-prism`, `PrismaticCohomology:PR.8/log-prismatic-site`, `PrismaticCohomology:PR.1`, `CrystallineCohomology:CR.5:log-algebra`, `PrismaticCohomology:PR.8/log-prismatic-envelope`.

**Sources.** K1, §4.1, Remark 4.6 (p. 20): Integral variant. KY, §7.5, Definition 7.34 (p. 80): Saturated variant.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/Site`, namespace `TauCeti.LogPrismatic`.

### Čech–Alexander complexes for log prismatic cohomology

Node `PR.8/cech-alexander-log` (construction); implementation status `unchecked`.

Let X = Spf(R) be affine with an integral chart P over M_A that is integral and weakly finitely generated over M_A. Choose a surjection M_B = M_A ⊕ N^T → P and a surjection B_0 := A⟨(X_s)_{s∈S}, N^T⟩ → R compatible with it, and let B := (A{(X_s)}_δ{N^T}_δlog)^∧_(p,I) be the free δ_log-ring. Let (B_0^•, M_B^•) ↪ (B^•, M_B^•) be the (p, I)-completed Čech nerves over (A, M_A) and J^• := ker(B_0^• → R). Applying the flatness theorem for envelopes levelwise gives a cosimplicial prelog prism (C^•, IC^•, M_C^•) with exact surjections onto (C^•/IC^•, P), each C^n (p, I)-completely flat over A; its associated cosimplicial object is the Čech nerve of (C^0, IC^0, M_C^0)^a, which covers the final object of the topos. Hence Δ_{(R,P)/(A,M_A)} is computed by the cosimplicial δ-A-algebra C^•, compatibly with base change in (A, I, M_A). Taking P = Γ(X, M_X) and B_0 = A⟨N^R ⊕ N^P⟩ gives a strictly functorial complex C^•((R, P)/(A, M_A), O_Δ). This latter choice does not itself commute with arbitrary base changes (K1 Remark 4.8); its totalisation computes the same cohomology.

**Hypotheses.** (A, I, M_A) bounded with M_A integral; M_A → P integral and weakly finitely generated; (R, P) p-completely smooth.

**Proof or construction outline.**

1. Each (B_0^n, M_B^n) satisfies condition (∗) of the flatness theorem, so the envelopes C^n exist and are (p, I)-completely flat.
2. Weak finality: for any object (B′, IB′, M) the exact surjection (B′, Γ(Spf B′, M)) → Γ(Spf(B′/IB′), P^a) (Lemma 3.8) lets one lift (B_0, M_B) → (R, P) to (B′, Γ(M)); freeness of (B, M_B) as δ_log-ring extends it, giving a map C^0 → B′ and then a map of log prisms (Remark 3.5).
3. Hence C^0 covers the final object; the Čech nerve computes cohomology (Stacks 079Z and affine vanishing, or the indiscrete topology).
4. Strict functoriality for P = Γ(X, M_X) (Remark 4.8); the log affine line and monoid algebras give base-change-compatible choices (Remarks 4.9–4.10).

**Uses determining the interface.**

- Koshikawa I, Lemma 4.11 and Lemma 4.12: base change and étale localisation are read off the Čech–Alexander complex.
- Koshikawa I, §4.4 and §8: strictly functorial local complexes are glued to globalise comparisons.
- Koshikawa–Yao II, Construction 5.11 and Definition 5.13: the Nygaard filtration of log-free algebras is defined on Čech–Alexander models after exactification.

**Planning API.**

- `LogPrismaticSite.cechAlexander` (constructor; signature outstanding): The cosimplicial δ-A-algebra C^• attached to a choice of surjections (B_0, M_B) → (R, P).
- `LogPrismaticSite.cechAlexander_flat` (other; signature outstanding): Each C^n is (p, I)-completely flat over A.
- `LogPrismaticSite.cechAlexander_computes` (characterisation; signature outstanding): Tot(C^•) ≅ Δ_{(R,P)/(A,M_A)} compatibly with Frobenius.
- `LogPrismaticSite.cechAlexander_baseChange` (functoriality; signature outstanding): For a chosen free presentation, C^• commutes with completed base change along maps of bounded prelog prisms when the same presentation is base changed. This does not assert base change of the strictly functorial presentation indexed by all elements of R and P (K1 Remark 4.8).
- `LogPrismaticSite.cechAlexanderFunctorial` (constructor; signature outstanding): The strictly functorial complex for P = Γ(X, M_X) and B_0 = A⟨N^R ⊕ N^P⟩.
- `LogPrismaticSite.cechAlexander_independent` (extensionality; signature outstanding): Two choices of surjections give canonically quasi-isomorphic totalisations.

**Discriminating unit tests.**

- `LogPrismaticSite.cechAlexander_affineLine` (computation; signature outstanding): For (A/I⟨X_0⟩, M_A ⊕ X_0^N) with B_0 = A⟨X_0⟩, C^n is the completion of A⟨X_0, …, X_n⟩{(I, X_1/X_0 − 1, …, X_n/X_0 − 1)/I}_δ (K1 §5.4).
- `LogPrismaticSite.cechAlexander_trivial` (degenerate; signature outstanding): For R = A/I and P = M_A, the constant cosimplicial algebra A computes Δ = A.
- `LogPrismaticSite.cechAlexander_trivialLog` (compatibility; signature outstanding): With trivial log structures, C^• is BS22's Čech–Alexander complex (PR.1).
- `LogPrismaticSite.cechAlexander_needs_exactification` (non-example; signature outstanding): Using the non-exactified δ-pair (B^1, (I, X_1 − X_0)) for the log affine line gives the non-log Čech nerve, whose cohomology has H^1(Δ̄) ≅ R·dX rather than R·dlog X.

**Acceptance conditions.**

- For the log affine line (A/I⟨X⟩, M_A ⊕ N) one may take B_0 = A⟨X⟩ (Remark 4.9).
- For R = A/I⟨P⟩ one may take B_0 = A⟨N^P⟩ and the result commutes with base change on (A, I) without changing M_A (Remark 4.10).

**Prerequisites.** `PrismaticCohomology:PR.8/envelope-flatness-smooth`, `PrismaticCohomology:PR.8/delta-log-free`, `PrismaticCohomology:PR.8/log-prismatic-envelope`, `PrismaticCohomology:PR.8/log-prismatic-cohomology`, `mathlib:CategoryTheory.CosimplicialObject`.

**Sources.** K1, §4.2, Construction 4.7 (p. 21): Main assertion. K1, §4.2, Remark 4.8 (p. 22): Strict functoriality.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/Site`, namespace `TauCeti.LogPrismatic`.

### Affine base change for log prismatic cohomology

Node `PR.8/log-prismatic-weak-base-change` (lemma); implementation status `unchecked`.

Let (R, P) be as in the Čech–Alexander construction and (A, I, M_A) → (A′, IA′, M_{A′}) a map of bounded prelog prisms with M_{A′} integral and A → A′ of finite (p, I)-complete Tor amplitude. With (R′, P′) the p-completed base change of (R, P) as a prelog ring, the natural map Δ_{(R,P)/(A,M_A)} ⊗̂^L_A A′ → Δ_{(R′,P′)/(A′,M_{A′})} is an isomorphism, and similarly for Δ̄.

**Hypotheses.** Finite (p, I)-complete Tor amplitude of A → A′; M_{A′} integral.

**Proof or construction outline.**

1. (R′, P′) satisfies the hypotheses of §4.2.
2. The Čech–Alexander complex commutes with base change (cech-alexander-log); argue as in BS22 Lemma 4.20 (PR.1) to commute totalisation with completed tensor product.

**Acceptance conditions.**

- For the trivial base change the statement is tautological.
- Corollary 5.5 removes the Tor-amplitude hypothesis using Hodge–Tate.

**Prerequisites.** `PrismaticCohomology:PR.8/cech-alexander-log`, `PrismaticCohomology:PR.1`.

**Sources.** K1, §4.2, Lemma 4.11 (p. 22): Hypotheses; conclusion is the displayed isomorphism.

### Strict étale localisation

Node `PR.8/log-prismatic-etale-localization` (lemma); implementation status `unchecked`.

Let (A, I, M_A) be a bounded prelog prism with M_A integral, (R, P) a p-completely smooth prelog ring over (A/I, M_A), and R → S a p-completely étale map with the pulled-back chart P. Then Δ̄_{(R,P)/(A,M_A)} ⊗̂^L_R S → Δ̄_{(S,P)/(A,M_A)} is an isomorphism. Consequently the reduced log prismatic complex Δ̄ is a quasi-coherent derived p-complete complex on strict-étale localisations. This R-linear statement concerns Δ̄, not the unreduced Δ, which is naturally an A-complex.

**Hypotheses.** Bounded base prism with integral M_A; (R, P) p-completely smooth over (A/I, M_A). R → S p-completely étale; same pulled-back chart P; Δ̄ := Δ ⊗^L_A A/I.

**Proof or construction outline.**

1. The restriction functor ((Spf S, P)^a/(A, M_A))_Δ → ((Spf R, P)^a/(A, M_A))_Δ has a right adjoint F given by p-completed base change R → S on B/IB lifted uniquely (Remark 4.2), with the pulled-back log structure.
2. Apply BS22 Lemma 4.21 (PR.1) to the reduced structure sheaf Ō_Δ, whose cohomology has its R-module structure. Keep bars on both terms; this gives no R-module structure on unreduced Δ.

**Acceptance conditions.**

- For S = R × R the statement is additivity.
- For trivial log structures this is BS22 Lemma 4.21.

**Prerequisites.** `PrismaticCohomology:PR.8/log-prismatic-cohomology`, `PrismaticCohomology:PR.8/log-prismatic-site`, `PrismaticCohomology:PR.1`.

**Sources.** K1, §4.2, Lemma 4.12 (p. 22): The overbars in the displayed PDF formula are essential: this is reduced, R-linear log prismatic cohomology.

### Envelopes of smooth charts cover the final object

Node `PR.8/smooth-chart-covers` (theorem); implementation status `unchecked`.

Work with the flat topology. Let (R, P) be p-completely smooth over (A/I, M_A) with M_A → P a smooth chart, and (B, IB, M_B) a prelog prism over (A, I, M_A) that is (p, I)-completely smooth over (A, M_A) with M_A → M_B a smooth chart, together with a surjection (B, M_B) → (R, P); let (B′, IB′, M_{B′}) be its prelog prismatic envelope. Then for every object (C, IC, M_C)^a of ((R, P)/(A, M_A))_Δ the product of (B′, IB′, M_{B′})^a and (C, IC, M_C)^a exists and is (p, I)-completely faithfully flat over C; in particular (B′, IB′, M_{B′})^a covers the final object. If (A, M_A) has rank 1, a smooth lift (R̃, P̃) of (R, P) over (A, M_A) with its rank-1 δ_log-structure gives such a covering. In the absolute setting, the Breuil–Kisin log prism (W(k)[[u]], (E(u)), u^N)^a covers the final object of the topos of (O_K, O_K∖{0})_Δ.

**Hypotheses.** Flat topology; smooth charts in Koshikawa's sense; (A, I) may be assumed orientable for faithful flatness.

**Proof or construction outline.**

1. As in Proposition 3.7, P ×_{Γ(M_{C/IC})} Γ(M_C) → C is a chart with δ_log-structure and maps exactly onto P (Lemma 3.8).
2. Exactify (B ⊗̂_A C, M_B ×_{M_A} M_C) → (C/IC, P); it is (p, I)-completely smooth over (C, M_C); its envelope C′ is (p, I)-completely flat (envelope-flatness-smooth (2)).
3. Faithful flatness: assume (A, I) orientable and apply Mao's 5.51 since D/ID → C/IC is p-completely quasiregular (also via Mao 5.34 and BS Proposition 3.13).
4. C′ is the product; for Lemma 4.14 exactify (A[[u]], n^N u^N) → (A/I, n^N) to (A[[u]][(u/n)^{±1}], …) and take the prismatic envelope of u/n ↦ 1.

**Acceptance conditions.**

- For trivial log structures this recovers the statement that the envelope of a smooth lift covers the final object of the relative prismatic site.
- Lemma 4.14 is the log analogue of BS F-crystals Example 2.6(1).

**Prerequisites.** `PrismaticCohomology:PR.8/envelope-flatness-smooth`, `PrismaticCohomology:PR.8/log-prismatic-envelope`, `PrismaticCohomology:PR.8/delta-log-exactification`, `PrismaticCohomology:PR.8/absolute-log-prismatic-site`, `PrismaticCohomology:PR.0`.

**Sources.** K1, §4.3, Proposition 4.13 (p. 23): Main statement. K1, §4.3, Lemma 4.14 (p. 23): Absolute statement.

## D. Hodge–Tate and base change

### The log Hodge–Tate comparison map

Node `PR.8/log-hodge-tate-map` (construction); implementation status `unchecked`.

Let (A, I, M_A) be bounded with M_A integral and (X, M_X) smooth over (A/I, M_A). The structure map η^0: O_X → H^0(Δ̄_{(X,M_X)/(A,M_A)}) extends to η^1: Ω^1_{(X,M_X)/(A/I,M_A)} → H^1(Δ̄){1}: locally, for X = Spf(R) with chart P and an object (B, IB, M_B)^a with exact surjection M_B → P, compose RΓ(L_{(R,P)/(A,M_A)}) → RΓ(L_{(B/IB,P)/(B,M_B)}) ≅ RΓ(L_{(B/IB,M_B)/(B,M_B)}) ≅ IB/I^2B[1] ≅ I/I^2 ⊗^L_{A/I} B/IB[1], take derived global sections over the site and H^0. For every local section m of M_X^gp, η^1(dlog m)^2 = 0 and β_I(η^1(dlog m)) = 0, where β_I is the Bockstein differential on H^*(Δ̄){*}. Since Ω^1_log has local bases of the form dlog m, η^1 extends uniquely to a map of commutative differential graded A/I-algebras η^*: Ω^*_{(X,M_X)/(A/I,M_A)} → (H^*(Δ̄){*}, β_I), compatible with the O_X-module structures; its composite with the canonical map Ω^1_{R/(A/I)} → Ω^1_log agrees with the non-log Hodge–Tate map followed by the forgetful comparison map.

**Hypotheses.** Bounded prelog prism with integral monoid; smoothness in Koshikawa's sense; the Breuil–Kisin twist {i} = ⊗ I^i/I^{i+1}.

**Proof or construction outline.**

1. Define η^1 locally via Gabber's log cotangent complex (DD.6): use associated-log invariance (Olsson 8.20) and Illusie III.3.2.4 for L of a quotient by a regular ideal.
2. Globalise η^1 and compare with the non-log η^1 on Ω^1_{R/(A/I)}: reduce to the affine line with trivial log, checked in Anschütz–Le Bras Proposition 3.2.1.
3. Lemma 5.2 (dlog(m)^2 = 0 and β_I(dlog m) = 0) follows from the Hodge–Tate comparison for the log affine line (hodge-tate-log-affine-line) by functoriality along (A⟨X_0⟩, M_A ⊕ X_0^N) → (R, P), X_0 ↦ m.
4. Extend multiplicatively using the universal property of the log de Rham complex (CR.5/DD.6) and graded commutativity of H^*(Δ̄){*}.

**Uses determining the interface.**

- Koshikawa I, Theorem 5.3: the Hodge–Tate comparison asserts η^* is an isomorphism.
- Koshikawa–Yao II, Proposition 4.5: the derived conjugate filtration has graded pieces identified through η.
- Koshikawa I, Remark 5.4: η identifies RΓ(L_{(R,P)/(A,M_A)}) with τ^{≤1}Δ̄{1}[1].

**Planning API.**

- `LogPrismaticSite.hodgeTateMap` (constructor; signature outstanding): η^*: Ω^*_{(X,M_X)/(A/I,M_A)} → H^*(Δ̄_{(X,M_X)/(A,M_A)}){*} as a map of cdgas with the Bockstein differential.
- `LogPrismaticSite.hodgeTateMap_dlog_sq` (simp; signature outstanding): η^1(dlog m)^2 = 0 for m ∈ M_X^gp.
- `LogPrismaticSite.hodgeTateMap_bockstein_dlog` (simp; signature outstanding): β_I(η^1(dlog m)) = 0.
- `LogPrismaticSite.hodgeTateMap_restrict_nonlog` (compatibility; signature outstanding): The square comparing the non-log and log Hodge–Tate maps commutes along the canonical map Ω^1_{X/(A/I)} → Ω^1_log and the map induced by forgetting logs. The differential map is not asserted to be injective.
- `LogPrismaticSite.hodgeTateMap_cotangent` (characterisation; signature outstanding): Locally, η^1 is H^0 of the map RΓ(L_{(R,P)/(A,M_A)}) → Δ̄{1}[1] built from Gabber's log cotangent complex.
- `LogPrismaticSite.hodgeTateMap_natural` (functoriality; signature outstanding): η^* is natural in (X, M_X) and in maps of bounded prelog prisms.

**Discriminating unit tests.**

- `LogPrismaticSite.hodgeTateMap_affineLine` (computation; signature outstanding): For (A/I⟨X_0⟩, M_A ⊕ X_0^N), η^1(dlog X_0) corresponds to the class of (X_1/X_0 − 1)/d ⊗ d in H^1 of the Čech–Alexander complex, for an orientation d.
- `LogPrismaticSite.hodgeTateMap_degree0` (degenerate; signature outstanding): η^0: O_X → H^0(Δ̄) is the structure map, independent of the log structures.
- `LogPrismaticSite.hodgeTateMap_trivialLog` (compatibility; signature outstanding): With trivial log structures η^* equals PR.1's Hodge–Tate comparison map.
- `LogPrismaticSite.hodgeTateMap_dlog_not_dx` (non-example; signature outstanding): η^1(dlog X_0) is not η^1(dX_0): they differ by the factor X_0, which is not a unit on A/I⟨X_0⟩.

**Acceptance conditions.**

- For trivial log structures η^* is BS22's Hodge–Tate map.
- For the log affine line η^1(dlog X_0) is the class X_0 ⊗ X_0 ↦ dX_0 identification of K1 §5.4.

**Prerequisites.** `PrismaticCohomology:PR.8/log-prismatic-cohomology`, `PrismaticCohomology:PR.8/hodge-tate-log-affine-line`, `DerivedDeRhamCohomology:DD.6`, `CrystallineCohomology:CR.5:log-algebra`, `PrismaticCohomology:PR.1`, `mathlib:KaehlerDifferential`.

**Sources.** K1, §5.2 (p. 26–27): Construction of η^1. K1, §5.2, Lemma 5.2 (p. 27): Lemma 5.2. K1, §5.2 (p. 27): Extension to η^*.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/HodgeTate`, namespace `TauCeti.LogPrismatic`.

### Hodge–Tate cohomology of group-ring Čech nerves

Node `PR.8/hodge-tate-group-lemma` (lemma); implementation status `unchecked`.

Let (A, I) be a bounded prism and G′ → G a surjection of finitely generated abelian groups without p-torsion, with kernel H; R := A/I⟨G⟩ and A⟨G′⟩ → R. Let B^• be the Čech nerve of the prismatic envelope B^0 in (R/A)_Δ, H_n := ker((G′)^{⊕(n+1)} → G′), and C^• := A⟨H ⊕ H_n⟩{(I, (h − 1)_{h∈H⊕H_n})/I}_δ ⊗_A A/I, so that B^• ⊗_A A/I ≅ R ⊗̂_{A/I} C^•. Then the map ∧^i(A/I ⊗_Z G) → H^i(Tot(C^•)){i} induced by g ↦ (g̃ − 1)/d ⊗ d (for a lift g̃ ∈ G′ and an orientation d) is an isomorphism of A/I-modules for every i.

**Hypotheses.** G, G′ finitely generated abelian with trivial p-torsion; (A, I) bounded.

**Proof or construction outline.**

1. Choose, as in the proof of BS Theorem 6.3, a map η: ⊕_i ∧^i(A/I ⊗ G){−i}[−i] → Tot(C^•) compatible with the maps in the statement.
2. Check it is an isomorphism after the p-completely faithfully flat base change A/I → R, where totalisation commutes with base change.
3. After base change it becomes ⊕_i Ω^i_{R/(A/I)}{−i}[−i] → Tot(B^• ⊗ A/I), an isomorphism by the non-log Hodge–Tate comparison (PR.1).

**Acceptance conditions.**

- For G′ = G = X_0^Z, C^n has X_i/X_0 − 1 = 0 and H^1 ≅ A/I generated by dlog X_0.
- For G = 0 the statement is H^0 = A/I and H^i = 0 for i > 0.

**Prerequisites.** `PrismaticCohomology:PR.1`, `PrismaticCohomology:PR.0`.

**Sources.** K1, §5.3, Lemma 5.7 (p. 29): Statement. K1, §5.3 (p. 28): Role.

### Hodge–Tate comparison for the log affine line

Node `PR.8/hodge-tate-log-affine-line` (lemma); implementation status `unchecked`.

Let (A, I, M_A) be a bounded prelog prism with M_A integral and (R, P) = (A/I⟨X_0⟩, M_A ⊕ X_0^N). Then η^*: Ω^*_{(R,P)/(A/I,M_A)} → H^*(Δ̄_{(R,P)/(A,M_A)}){*} is an isomorphism; explicitly H^1(Δ̄){1} ≅ R ⊗_Z X_0^Z with 1 ⊗ X_0 ↦ dlog X_0.

**Hypotheses.** (A, I, M_A) bounded, M_A integral.

**Proof or construction outline.**

1. The lift (A⟨N⟩, M_A ⊕ N) with δ_log(N) = 0 is an object; its Čech nerve computes Δ (smooth-chart-covers), with B^n the completion of A⟨X_0, …, X_n⟩{(I, X_1/X_0 − 1, …, X_n/X_0 − 1)/I}_δ.
2. B^• ⊗_A A/I ≅ R ⊗̂_A C^• with C^• the complex of hodge-tate-group-lemma for G′ = G = X_0^Z.
3. After inverting X_0 the identification agrees with the non-log map and 1 ⊗ X_0 ↦ dX_0/X_0; as X_0 is a nonzerodivisor this pins down compatibility with η^1 under dlog.

**Acceptance conditions.**

- H^i(Δ̄) = 0 for i ≥ 2.
- H^0(Δ̄) = R.

**Prerequisites.** `PrismaticCohomology:PR.8/hodge-tate-group-lemma`, `PrismaticCohomology:PR.8/smooth-chart-covers`, `PrismaticCohomology:PR.8/cech-alexander-log`.

**Sources.** K1, §5.4, Proposition 5.8 (p. 29): Statement. K1, §5.4 (p. 29): Key compatibility.

### The log Hodge–Tate comparison

Node `PR.8/log-hodge-tate-comparison` (theorem); implementation status `unchecked`. Planet: **Log Hodge–Tate comparison**.

Let (A, I, M_A) be a bounded prelog prism with M_A integral and (X, M_X) a log p-adic formal scheme smooth over (A/I, M_A) in Koshikawa's sense. Then η^*: Ω^*_{(X,M_X)/(A/I,M_A)} → H^*(Δ̄_{(X,M_X)/(A,M_A)}){*} is an isomorphism of differential graded A/I-algebras (sheaves on X_ét); in particular Δ̄_{(X,M_X)/(A,M_A)} is a perfect complex. Moreover RΓ(Spf(R)_ét, L_{(R,P)/(A,M_A)}) ≅ (τ^{≤1}Δ̄_{(R,P)/(A,M_A)}){1}[1] locally.

**Hypotheses.** (A, I, M_A) bounded with M_A integral. (X, M_X) smooth over (A/I, M_A) in the sense of Koshikawa Appendix A (integral, relatively coherent charts).

**Proof or construction outline.**

1. Work locally with a surjection M_A ⊕ N^S → P (S finite) and the δ_log-ring (A⟨N^S⟩, M_A ⊕ N^S) with δ_log(N^S) = 0; its envelope's Čech nerve B^• computes Δ (smooth-chart-covers) and each B^n is (p, I)-completely flat.
2. With G := P^gp/M_A^gp, G′ := Z^S and H := ker(G′ → G), B^• ⊗_A A/I ≅ R ⊗̂ C^• for C^• of hodge-tate-group-lemma, giving Ω^i_log ≅ ∧^i(R ⊗ G) ≅ H^i(Δ̄){i} since R is p-completely flat over A/I.
3. Compatibility with η^1: compare images of dlog(m) by enlarging the surjection to M_A ⊕ N^S ⊕ X_0^N → P and reducing to the log affine line (hodge-tate-log-affine-line).
4. Perfectness: Ω^i_log is finite locally free (smoothness) and vanishes for i large.

**Acceptance conditions.**

- Log affine line: H^1(Δ̄){1} ≅ R·dlog X_0.
- Semistable chart O_C⟨t_0, …, t_r, t_{r+1}^{±1}, …, t_d^{±1}⟩/(t_0⋯t_r − π) over (A_inf, (ξ), O_C♭∖{0}) (via π ↦ π♭ and Teichmüller lifts): H^i(Δ̄){i} ≅ Ω^i_log is free of rank (d choose i) with basis the wedge products of dlog t_1, …, dlog t_d, since dlog t_0 = −(dlog t_1 + ⋯ + dlog t_r).
- Trivial log structures recover BS22 Theorem 4.11 (PR.1).

**Prerequisites.** `PrismaticCohomology:PR.8/log-hodge-tate-map`, `PrismaticCohomology:PR.8/hodge-tate-group-lemma`, `PrismaticCohomology:PR.8/hodge-tate-log-affine-line`, `PrismaticCohomology:PR.8/smooth-chart-covers`, `CrystallineCohomology:CR.5:log-algebra`, `DerivedDeRhamCohomology:DD.6`.

**Sources.** K1, §5.2, Theorem 5.3 (p. 27): Theorem. KY, §1, Theorem 2(1) (p. 2): Restatement with qcqs X.

### Completed base change for log prismatic cohomology

Node `PR.8/log-prismatic-base-change` (theorem); implementation status `unchecked`.

Let (A, I, M_A) → (A′, IA′, M_{A′}) be a map of bounded prelog prisms with integral monoids, (X, M_X) smooth over (A/I, M_A) with qcqs underlying formal scheme, and X′ := X ×_{(Spf A/I, M_A)^a} (Spf A′/IA′, M_{A′})^a (an integral log formal scheme, smooth over the new base). Then RΓ_Δ((X, M_X)/(A, M_A)) ⊗̂^L_A A′ ≅ RΓ_Δ(X′/(A′, M_{A′})), and the same holds for the sheaves Δ.

**Hypotheses.** Bounded prelog prisms with integral monoids; base change in the category of integral log formal schemes; qcqs X for the global form.

**Proof or construction outline.**

1. Reduce to Δ̄ by derived Nakayama ((p, I)-completeness).
2. Δ̄ is computed by the Hodge–Tate comparison, and Ω^*_log commutes with base change (Koshikawa smoothness is stable under base change, Remark A.12(3)).

**Acceptance conditions.**

- Base change along the Breuil–Kisin → A_inf map gives K1 Example 1.6's descent of A_inf-cohomology.
- For proper X the Hodge–Tate comparison makes RΓ_Δ perfect and the completion is unnecessary.

**Prerequisites.** `PrismaticCohomology:PR.8/log-hodge-tate-comparison`, `PrismaticCohomology:PR.8/log-prismatic-weak-base-change`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources.** K1, §5.2, Corollary 5.5 (p. 27): Statement. KY, §1, Theorem 2(2) (p. 3): Global form.

## E. Crystalline realization

### The δ_log-crystalline site

Node `PR.8/delta-log-crystalline-site` (definition); implementation status `unchecked`.

Let (A, (p), M_A) be a bounded prelog prism with M_A integral and (X, M_X) a log p-adic formal scheme over (A, M_A). A δ_log-PD triple over (A, M_A) is (B, J, M_B)^a where (B, (p), M_B) is a bounded prelog prism over (A, (p), M_A) with integral log structure and J ⊂ B is a p-completed PD ideal with B/J classically p-complete. The (big) δ_log-crystalline site ((X, M_X)/(A, M_A))_δCRYS is the opposite of the category of δ_log-PD triples with a map f: Spf(B/J) → X over A and an exact closed immersion (Spf(B/J), f^*M_X) ↪ (Spf(B), M_{Spf(B)}) over (A, M_A), with the étale topology and structure sheaf O_δCRYS: (B, J, M_B)^a ↦ B. Dropping δ and δ_log gives a version ((X, M_X)/(A, M_A))_CRYS of the big log crystalline site with étale topology; forgetting is a cocontinuous functor inducing u_X^δ: Shv(δCRYS) → Shv(X_ét) and a canonical map Ru_{X*}O_CRYS → Ru^δ_{X*}O_δCRYS.

**Hypotheses.** I = (p); (A, M_A) of rank 1 or a log ring (so A is p-torsion free); objects only those receiving a map from (A, (p), M_A) (a chart-dependent simplification, K1 §6.1).

**Proof or construction outline.**

1. Objects and étale topology as in the log prismatic site; étale covers of B/J lift uniquely.
2. Since B is p-torsion free, J has divided powers compatible with any PD ideal of A (Remark 6.5).
3. Construct the forgetful cocontinuous functor to the big log crystalline site and the induced map of cohomologies (Remark 6.6).

**Uses determining the interface.**

- Koshikawa I, Proposition 6.8: its cohomology agrees with log crystalline cohomology for smooth (X, M_X).
- Koshikawa I, §6.2: its objects are sent by Frobenius twisting to objects of the log prismatic site of X^(1), giving the crystalline comparison map.

**Planning API.**

- `DeltaLogCrystallineSite` (constructor; signature outstanding): The site ((X, M_X)/(A, M_A))_δCRYS with étale topology.
- `DeltaLogCrystallineSite.structureSheaf` (data; signature outstanding): O_δCRYS: (B, J, M_B)^a ↦ B.
- `DeltaLogCrystallineSite.toBigLogCrystalline` (functoriality; signature outstanding): The cocontinuous forgetful functor to the big log crystalline site ((X, M_X)/(A, M_A))_CRYS and the map Ru_{X*}O_CRYS → Ru^δ_{X*}O_δCRYS.
- `DeltaLogCrystallineSite.pd_compatible` (relation; signature outstanding): For a PD ideal I of A, the divided powers of I and J are compatible on every object.
- `DeltaLogCrystallineSite.toEtale` (projection; signature outstanding): The morphism of topoi u^δ_X to X_ét.

**Discriminating unit tests.**

- `DeltaLogCrystallineSite.point` (degenerate; signature outstanding): For X = Spf(A/p) with log structure M_A, the triple (A, (p), M_A)^a is final and RΓ_δCRYS = A.
- `DeltaLogCrystallineSite.trivialLog_compat` (compatibility; signature outstanding): With trivial log structures, the cohomology agrees with crystalline cohomology for smooth X (BS22 Theorem 5.2's δ-crystalline site).
- `DeltaLogCrystallineSite.not_all_pd_thickenings` (non-example; signature outstanding): A PD thickening (B, J) with B having p-torsion is not an object: objects are bounded prelog prisms with I = (p), so B is p-torsion free.
- `DeltaLogCrystallineSite.affineLine` (computation; signature outstanding): For (A/p⟨X⟩, M_A ⊕ N), the rank-one triple (A⟨X⟩, (p), M_A ⊕ N)^a is an object, but it is not asserted weakly final: an arbitrary target log generator can have nonzero δ_log. A weakly final object for the Čech computation is obtained from the free δ_log ring and its log PD envelope (K1 Construction 6.6).

**Acceptance conditions.**

- For trivial log structures it is a δ-variant of the big crystalline site used in BS22 §5.
- For q = 1 it is the log q-crystalline site (K1 Remark 7.7).

**Prerequisites.** `PrismaticCohomology:PR.8/prelog-prism`, `PrismaticCohomology:PR.8/log-prism`, `CrystallineCohomology:CR.5`, `mathlib:DividedPowers`.

**Sources.** K1, §6.1, Definition 6.4 (p. 32): Definition. K1, §6.1, Remark 6.5 (p. 32): PD compatibility.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/Crystalline`, namespace `TauCeti.LogPrismatic`.

### δ_log-crystalline cohomology is log crystalline cohomology

Node `PR.8/delta-log-crystalline-vs-log-crystalline` (theorem); implementation status `unchecked`.

Let I ⊂ A be a p-completed PD ideal with A/I classically p-complete and (X, M_X) smooth over (A/I, M_A). Then the natural map Ru_{X*}O_CRYS → Ru^δ_{X*}O_δCRYS is an isomorphism of E_∞-A-algebras on X_ét. Moreover, for every m ≥ 1 reduction mod p^m identifies Ru_{X*}O_CRYS ⊗^L A/p^m with Ru^crys_*O_{(X,M_X)/(A/p^m,M_A)} (small log crystalline site), and passing to the limit Ru^crys_*O_{(X,M_X)/(A,M_A)} ≅ Ru_{X*}O_CRYS. When I ∋ p and the chart M_A → P is integral and weakly finitely generated, the Čech nerve of the p-completed log PD envelope of a surjection from a p-completely smooth δ_log-ring of topologically finite presentation, and also the log de Rham complex with coefficients in that envelope, compute these cohomologies.

**Hypotheses.** I a p-completed PD ideal, A/I classically p-complete; (X, M_X) smooth over (A/I, M_A) in Koshikawa's sense; (A, (p), M_A) bounded of rank 1 or a log ring.

**Proof or construction outline.**

1. Reduce to X = Spf(R) with a lift (R̃, P̃) and P a smooth chart.
2. Choose (B_0, M_B) = (A⟨X_s, N^T⟩, M_A ⊕ N^T) → (R̃, P̃) with kernel locally generated by p and a regular sequence; the p-completed log PD envelopes C_0^• are p-completely flat (argument of Proposition 3.9, BS Lemma 2.42), hence p-torsion free, and compute the big log crystalline cohomology.
3. For the δ-version use B = (A{X_s}_δ{N^T}_δlog)^∧_p; C := (B ⊗_{B_0} C_0)^∧ is a δ-ring by BS Corollary 2.38 (PR.0/CR.0) and computes δ_log-crystalline cohomology, with C^• ≅ (B^• ⊗_{B_0^•} C_0^•)^∧.
4. C_0^• → C^• is a cosimplicial homotopy equivalence since B_0^• → B^• is (p-complete freeness).
5. Comparison with small sites: Remark 6.7 via Beilinson 1.12 and the projection formula; Čech and de Rham computations via Beilinson 1.6–1.8 and Remark A.19 (CR.5).

**Acceptance conditions.**

- For trivial log structures this recovers the comparison used in BS22 Theorem 5.2.
- For (A, M_A) = (W(k), N → 0) it computes Hyodo–Kato log crystalline cohomology of the special fibre.

**Prerequisites.** `PrismaticCohomology:PR.8/delta-log-crystalline-site`, `PrismaticCohomology:PR.8/delta-log-free`, `PrismaticCohomology:PR.8/envelope-flatness-smooth`, `CrystallineCohomology:CR.5`, `PrismaticCohomology:PR.0`.

**Sources.** K1, §6.1, Proposition 6.8 (p. 33): Main statement. K1, §6.1, Remark 6.7 (p. 33): Comparison with the small site. K1, §6.1, Remark 6.9 (p. 34): de Rham computation.

### Cosimplicial relative Frobenius for Cartier-type monoid maps

Node `PR.8/cartier-type-cosimplicial-frobenius` (lemma); implementation status `unchecked`.

Let k be a ring with a prelog structure M → k, M → Q an injective integral map of integral monoids with G := Q^gp/M^gp, and Q^(1) the base change of M → Q along the p-th power map of M, with relative Frobenius Q^(1) → Q. Consider the cosimplicial k-algebras A^• = k ⊗_{Z[M]} Z[Q ⊕ G^•], A^{•(1)} and B^• (the Čech-type nerves of K1 Appendix B). If Q^(1) → Q is exact and injective (M → Q of Cartier type), the projection pr^•: A^• → B^• (killing q ∉ Q^(1)) is homotopic to the identity as a map of cosimplicial A^{•(1)}-modules, so B^• ⊗_{A^{•(1)}} M^• → A^• ⊗_{A^{•(1)}} M^• is a homotopy equivalence for every cosimplicial A^{•(1)}-module M^•. If moreover G is free abelian, M^• → A^• ⊗_{A^{•(1)}} M^• is a quasi-isomorphism on associated cochain complexes of k-modules.

**Hypotheses.** M → Q injective and integral of integral monoids; Q^(1) → Q exact and injective (Cartier type); G free abelian for the last assertion.

**Proof or construction outline.**

1. Define pr^n on (q, g_1, …, g_n) by 0 if q ∉ Q^(1) and identity otherwise; A^{n(1)}-linearity uses exactness of Q^(1) → Q.
2. Construct the explicit homotopy h^n(α^n_j) of Proposition B.1 and check the cosimplicial identities.
3. For the last statement reduce to k[G^{⊕•}] ⊗_{k[G^{(1)⊕•}]} M^• and apply BS22 Lemma 5.4 (relative Frobenius on free parts), owned by PR.1.

**Acceptance conditions.**

- For M = Q (no new monoid) the statement is trivial.
- For M = N → Q = N diagonal-free case (log point → log line) the Cartier condition holds and the lemma recovers the log Cartier computation of Nizioł 3.28.

**Prerequisites.** `CrystallineCohomology:CR.5:log-algebra`, `PrismaticCohomology:PR.1`, `mathlib:CategoryTheory.CosimplicialObject`, `mathlib:MonoidAlgebra`.

**Sources.** K1, Appendix B, Proposition B.1 (p. 61): Homotopy. K1, Appendix B, Proposition B.3 (p. 61): Quasi-isomorphism.

### The log crystalline comparison map

Node `PR.8/crystalline-comparison-map` (construction); implementation status `unchecked`.

Let (A, (p), M_A) be a bounded prelog prism with M_A integral, of rank 1 or with (A, M_A) a log ring, I ⊂ A a PD ideal containing p, and ψ: (A/I, M_A) → (φ_*A/p, φ_*M_A) the factorisation of Frobenius. For (X, M_X) over A/I let (X^(1), M_X^(1)) be its base change along ψ. There is a cocontinuous functor ((X, M_X)/(A, M_A))_δCRYS → ((X^(1), M_X^(1))/(φ_*A, φ_*M_A))_Δ sending (B, J, M_B)^a (with (B, M_B) a log ring) to (φ_*B, (p), M_B^(1))^a, where M_B^(1) = M_B ⊔_{M_A, φ_{M_A}} φ_*M_A with M_B^(1) → φ_*M_B induced by φ_{M_B}, and Spf(φ_*B/p) → X^(1) induced by ψ_B: B/J → φ_*B/p. It induces a morphism of ringed topoi (Shv(δCRYS), φ_*O_δCRYS) → (Shv(log prismatic site of X^(1)), O_Δ) and hence the crystalline comparison map Δ_{(X^(1),M^(1))/(φ_*A,φ_*M_A)} → φ_*Ru^δ_{X*}O_δCRYS of E_∞-φ_*A-algebras on X_ét, compatible with Frobenius.

**Hypotheses.** I = (p) prism; M_A integral; (A, M_A) of rank 1 or a log ring; I ⊂ A a PD ideal containing p.

**Proof or construction outline.**

1. Frobenius on (B/p, M_B) factors as (B/p, M_B) → (B/J, M_B) → (φ_*B/p, M_B^(1)) → (φ_*B/p, φ_*M_B) since J has divided powers.
2. The composite Spf(φ_*B/p) → Spf(B/J) → X factors through X^(1); the exact closed immersion condition follows from exactness for (B, J, M_B).
3. Cocontinuity: ψ_B identifies étale covers of B/J and B/p.
4. Derive the morphism of ringed topoi and the map on cohomology of structure sheaves.

**Uses determining the interface.**

- Koshikawa I, Theorem 6.1 and Theorem 6.3: the comparison theorems assert that this map is an isomorphism under the Cartier-type hypothesis.
- Koshikawa–Yao II, Theorem 2(3) and Proposition 8.8: the global crystalline comparison and its A_crys specialisation are this map.

**Planning API.**

- `LogPrismaticSite.crystallineFunctor` (constructor; signature outstanding): The cocontinuous functor ((X, M_X)/(A, M_A))_δCRYS → ((X^(1), M^(1))/(φ_*A, φ_*M_A))_Δ.
- `LogPrismaticSite.crystallineFunctor_cocontinuous` (other; signature outstanding): The functor is cocontinuous for the étale topologies.
- `LogPrismaticSite.crystallineComparisonMap` (constructor; signature outstanding): The induced map Δ_{(X^(1),M^(1))/(φ_*A,φ_*M_A)} → φ_*Ru^δ_{X*}O_δCRYS of E_∞-algebras.
- `LogPrismaticSite.crystallineComparisonMap_frobenius` (compatibility; signature outstanding): The comparison map is compatible with the Frobenius endomorphisms.
- `LogPrismaticSite.crystallineComparisonMap_natural` (functoriality; signature outstanding): Natural in (X, M_X) and in the base.

**Discriminating unit tests.**

- `LogPrismaticSite.crystallineComparisonMap_point` (degenerate; signature outstanding): For X = Spf(A/I) with log structure M_A, the comparison map is the identity of φ_*A.
- `LogPrismaticSite.crystallineComparisonMap_trivialLog` (compatibility; signature outstanding): With trivial log structures it equals the map of PR.1's crystalline comparison (BS22 Theorem 5.2).
- `LogPrismaticSite.crystallineFunctor_logPoint` (computation; signature outstanding): For the log point (k, N → 0) over (W(k), (p), N → 0), the functor sends the object (W(k), (p), N) to (φ_*W(k), (p), N^(1)) with N^(1) = N ⊔_{N, ·p} N.
- `LogPrismaticSite.crystallineFunctor_untwisted_fails` (non-example; signature outstanding): Without the Frobenius twist (sending (B, J, M_B) to (B, (p), M_B)) one does not get an object over X: Spf(B/p) need not map to X since only B/J does.

**Acceptance conditions.**

- For trivial log structures this is the map of BS22 Theorem 5.2 (PR.1).
- Its composite with Proposition 6.8 gives a map to log crystalline cohomology.

**Prerequisites.** `PrismaticCohomology:PR.8/delta-log-crystalline-site`, `PrismaticCohomology:PR.8/log-prismatic-site`, `PrismaticCohomology:PR.8/delta-log-frobenius`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources.** K1, §6.2 (p. 34–35): Functor and cocontinuity. K1, §6.2 (p. 35): The comparison map.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/Crystalline`, namespace `TauCeti.LogPrismatic`.

### Local log crystalline comparison

Node `PR.8/local-crystalline-comparison` (theorem); implementation status `unchecked`.

In the setting of the comparison map, let (R, P) be a smooth prelog ring over (A/I, M_A) with P integral, M_A → P integral, (weakly) finitely generated and of Cartier type (M_A/M_A^× → P/P^× integral with exact relative Frobenius P^(1) → P), and assume (R, P) admits an exact surjection from a smooth lift (R̃, P̃) over (A/p, M_A). Then there is a canonical isomorphism Δ_{(R^(1),P^(1))/(φ_*A,φ_*M_A)} ≅ φ_*RΓ_crys((R, P)/(A, M_A)) of E_∞-φ_*A-algebras compatible with Frobenius; by base change the left side is the p-completed base change of Δ_{(R̃,P̃)/(A,M_A)} along φ.

**Hypotheses.** As in the comparison map; Cartier type of M_A → P; existence of the exact surjection from a smooth lift.

**Proof or construction outline.**

1. Compute δ_log-crystalline cohomology by C^• (the p-completed log PD envelope of the exactified Čech nerve, Proposition 6.8) and log prismatic cohomology of the twist by D^• (prismatic envelope of φ_*(φ^*J^•(B^•)′)^∧, Construction 4.7).
2. The relative Frobenius of (B^•)′ extends to D^• → φ_*C^• via BS Corollary 2.38, compatible with the morphism of topoi.
3. Modulo p the map decomposes into a monoid part, handled by cartier-type-cosimplicial-frobenius with Q_1 = M_A, Q_2 = (M_{B_0})′ of Cartier type and G free, and a free part handled by BS Lemma 5.4.
4. Conclude by derived Nakayama.

**Acceptance conditions.**

- Trivial log structures: BS22 Theorem 5.2 locally.
- Log affine line over (W(k), (p), N → 0) with P = N ⊕ N^T: both sides are the log de Rham complex of W(k)⟨N^T⟩ with Frobenius twist.

**Prerequisites.** `PrismaticCohomology:PR.8/crystalline-comparison-map`, `PrismaticCohomology:PR.8/delta-log-crystalline-vs-log-crystalline`, `PrismaticCohomology:PR.8/cartier-type-cosimplicial-frobenius`, `PrismaticCohomology:PR.8/cech-alexander-log`, `CrystallineCohomology:CR.5:log-algebra`, `PrismaticCohomology:PR.1`.

**Sources.** K1, §6, Theorem 6.1 (p. 31): Statement. K1, §6.2 (p. 36): Proof structure.

### The log crystalline comparison

Node `PR.8/log-crystalline-comparison` (theorem); implementation status `unchecked`.

Let (A, (p), M_A) be a bounded prelog prism with M_A integral, of rank 1 or with (A, M_A) a log ring, I a PD ideal of A containing p, and (X, M_X) a smooth log scheme over (A/I, M_A) of Cartier type (Kato 4.8). Then the crystalline comparison map is an isomorphism of E_∞-φ_*A-algebras on X_ét: Δ_{(X^(1),M_X^(1))/(φ_*A,φ_*M_A)} ≅ φ_*Ru^crys_*O_crys. Globally, for I = (p) and X qcqs of Cartier type over (A/p, M_A): RΓ_logcrys((X, M_X)/(A, M_A)) ≅ RΓ_Δ((X, M_X)/(A, M_A)) ⊗̂^L_{A,φ_A} A, φ-equivariantly, as E_∞-A-algebras.

**Hypotheses.** I = (p); Cartier type over (A/I, M_A); smoothness in Koshikawa's sense; qcqs for the global statement.

**Proof or construction outline.**

1. Étale locally on X there is a smooth chart of Cartier type and a smooth lift (Remark 6.2, Remark A.19 of CR.5).
2. Apply local-crystalline-comparison and glue: the comparison map is defined globally by crystalline-comparison-map.
3. Identify δ_log-crystalline with log crystalline cohomology (delta-log-crystalline-vs-log-crystalline) and use base change for the reformulation.

**Acceptance conditions.**

- For (W(k), (p), N → 0) and qcqs smooth (X, M_X) over (W(k), N): (φ^*_{W(k)}RΓ_Δ((X, M_X)/(W(k), N)))^∧_p ≅ RΓ_crys((X, M_X)/(W(k), N)) (K1 Example 1.4), the Hyodo–Kato cohomology.
- Trivial log structures: BS22 Theorem 1.8(1) (PR.1).

**Prerequisites.** `PrismaticCohomology:PR.8/local-crystalline-comparison`, `PrismaticCohomology:PR.8/crystalline-comparison-map`, `PrismaticCohomology:PR.8/delta-log-crystalline-vs-log-crystalline`, `PrismaticCohomology:PR.8/log-prismatic-base-change`, `CrystallineCohomology:CR.5:log-algebra`, `CrystallineCohomology:CR.5`.

**Sources.** K1, §6, Theorem 6.3 (p. 31): Theorem. KY, §1, Theorem 2(3) (p. 3): Global form.

## F. q-de Rham, semistable periods and Breuil–Kisin theory

### Log q-PD triples and log q-PD envelopes

Node `PR.8/log-q-pd-triple` (definition); implementation status `unchecked`.

Let A = Z_p[[q − 1]] with δ(q) = 0 and [p]_q = (q^p − 1)/(q − 1). A q-PD pair is a (p, [p]_q)-complete δ-pair (D, I) over (A, (q − 1)) such that (D, ([p]_q)) is a bounded prism over (A, ([p]_q)), φ(I) ⊂ [p]_q D and γ(I) ⊂ I where γ(x) = φ(x)/[p]_q − δ(x), D/(q − 1) is p-torsion free with finite (p, [p]_q)-complete Tor amplitude over D, and D/I is classically p-complete. A prelog q-PD triple is (D, I, M_D) with (D, I) a q-PD pair and (D, I, M_D) a δ_log-triple; a log q-PD triple is (D, I, M_{Spf(D)}) arising as (D, [p]_q, M_D)^a. Étale maps lift uniquely (Lemma 7.3). For a prelog q-PD triple (D_1, I_1, M_{D_1}) with integral monoid, a p-completely smooth (R, P) over (D_1/I_1, M_{D_1}) with M_{D_1} → P integral and weakly finitely generated admitting a smooth lift, and a surjection (D_2, M_{D_2}) → (R, P) as in Lemma 7.4, there is a universal map to a prelog q-PD triple (D_3, I_3, M_{D_3}) with an exact surjection M_{D_3} → P and D_2/I_2 ≅ D_3/I_3; D_3 is (p, [p]_q)-completely flat over D_1, the construction commutes with completed base change, and D_3 ⊗̂ D_1/(q − 1) is the p-completed log PD envelope. This is the log q-PD envelope.

**Hypotheses.** A = Z_p[[q − 1]]; (D_1, I_1, M_{D_1}) a prelog q-PD triple with integral M_{D_1}. (R, P) p-completely smooth over (D_1/I_1, M_{D_1}); M_{D_1} → P integral and weakly finitely generated; (R, P)^a admits a smooth lift over (D_1, M_{D_1}). A surjection (D_{2,0}, M_{D_2}) → (R, P) over (D_1, M_{D_1}) satisfies one of: (i) (D_{2,0}, M_{D_2}) is a (p, [p]_q)-completely smooth δ_log ring of topologically finite presentation; (ii) M_{D_1} → M_{D_2} is injective integral, M_{D_2}^gp/M_{D_1}^gp is free abelian, and D_{2,0} is (p, [p]_q)-completely free over the completion of D_1 ⊗_{Z_(p)[M_{D_1}]} Z_(p)[M_{D_2}]. In (i), D_2 = D_{2,0}; in (ii), D_2 is the completed universal δ_log ring generated by D_{2,0}. I_{2,0} = ker(D_{2,0} → R), and I_2 is the (p, [p]_q)-completion of I_{2,0}D_2.

**Proof or construction outline.**

1. Define q-PD pairs following BS22 §16 (PR.6) with the added condition D/I classically p-complete.
2. Lemma 7.3: lift étale maps by Lemma 2.13 and BS Lemma 16.5; check γ(J) ⊂ J using γ(x + y) and γ(fx) formulas and completeness.
3. Lemma 7.4: exactify (Construction 2.17), use smooth lifts and Remark A.19 to see I_2 is Zariski locally I_1 plus a (p, [p]_q)-completely regular sequence, then apply BS Lemma 16.10 (PR.6); universality as in Proposition 3.7.

**Uses determining the interface.**

- Koshikawa I, Definition 7.5: objects of the log q-crystalline site are log q-PD triples.
- Koshikawa I, Construction 7.16 and Theorem 7.17: log q-de Rham complexes are formed on log q-PD envelopes.
- Koshikawa I, Theorem 8.1: the A_inf triple of Example 7.2 is the base of the comparison with AΩ.

**Planning API.**

- `LogQPDTriple` (constructor; signature outstanding): A prelog q-PD triple (D, I, M_D) over Z_p[[q − 1]].
- `LogQPDTriple.gamma_mem` (relation; signature outstanding): For x ∈ I, γ(x) = φ(x)/[p]_q − δ(x) ∈ I.
- `LogQPDTriple.etaleLift` (characterisation; signature outstanding): A p-completely étale D/I → Ē lifts uniquely to a prelog q-PD triple (E, J, M_D) over (D, I, M_D) (Lemma 7.3).
- `LogQPDTriple.envelope` (constructor; signature outstanding): The log q-PD envelope (D_3, I_3, M_{D_3}) of Lemma 7.4.
- `LogQPDTriple.envelope_flat` (other; signature outstanding): D_3 is (p, [p]_q)-completely flat over D_1.
- `LogQPDTriple.envelope_mod_q_sub_one` (compatibility; signature outstanding): D_3 ⊗̂_{D_1} D_1/(q − 1) is the p-completed log PD envelope of I_2/(q − 1) (CR.5).

**Discriminating unit tests.**

- `LogQPDTriple.ainf_example` (computation; signature outstanding): (A_inf(O_C), (ξ), O_C♭∖{0}) with q = [ε] is a prelog q-PD triple and ξ = φ^{-1}([p]_q).
- `LogQPDTriple.q_eq_one` (compatibility; signature outstanding): At q = 1 a prelog q-PD triple is the same as a pre-δ_log-PD triple (D p-torsion free and p-complete, D/I classically p-complete, I with divided powers).
- `LogQPDTriple.trivial_envelope` (degenerate; signature outstanding): For (R, P) = (D_1/I_1, M_{D_1}) and the identity surjection, the envelope is (D_1, I_1, M_{D_1}).
- `LogQPDTriple.not_q_minus_one_ideal` (non-example; signature outstanding): (Z_p[[q − 1]], (q − 1)) is a q-PD pair but ([p]_q) cannot be replaced by (q − 1) as the prism ideal: (Z_p[[q − 1]], (q − 1)) is not a prism.

**Acceptance conditions.**

- (A_inf(O_C), (ξ), O_C♭∖{0}) with q = [ε] and ξ = φ^{-1}([p]_q) is a prelog q-PD triple (K1 Example 7.2).
- At q = 1 prelog q-PD triples are pre-δ_log-PD triples: p-torsion free p-complete D, D/I classically p-complete, I with divided powers.

**Prerequisites.** `PrismaticCohomology:PR.8/prelog-prism`, `PrismaticCohomology:PR.8/delta-log-exactification`, `PrismaticCohomology:PR.8/delta-log-completion-etale`, `PrismaticCohomology:PR.6`, `CrystallineCohomology:CR.5`.

**Sources.** K1, §7.1, Definition 7.1 (p. 37): Definition. K1, §7.1, Lemma 7.4 (p. 38): Envelopes. K1, §7.1, Example 7.2 (p. 37): Example.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/QCrystalline`, namespace `TauCeti.LogPrismatic`.

### The log q-crystalline site

Node `PR.8/log-q-crystalline-site` (definition); implementation status `unchecked`.

Fix a prelog q-PD triple (D, I, M_D) with M_D integral and (X, M_X) smooth over (D/I, M_D). The log q-crystalline site ((X, M_X)/(D, M_D))_qCRYS is the opposite of the category of log q-PD triples (E, J, M_{Spf(E)}) from prelog q-PD triples (E, J, M_E) over (D, I, M_D) with M_E integral, with f: Spf(E/J) → X over D/I and an exact closed immersion (Spf(E/J), f^*M_X) ↪ (Spf(E), M_{Spf(E)}) over (D, M_D); étale topology; structure sheaf O_qCRYS: E ↦ E. Write RΓ_qCRYS((X, M_X)/(D, M_D)), a (p, [p]_q)-complete E_∞-D-algebra with φ_D-semilinear endomorphism, and qΩ_{(X,M_X)/(D,M_D)} := Ru^q_{X*}O_qCRYS on X_ét. For affine X with a smooth lift and integral weakly finitely generated chart, the Čech nerve of the log q-PD envelope of a free surjection computes it (Construction 7.8), strictly functorially for (E_0, M_E) = (D⟨N^R, N^P⟩, M_D ⊕ N^P). At q = 1 it is the δ_log-crystalline site.

**Hypotheses.** (D, I, M_D) prelog q-PD triple with M_D integral; (X, M_X) smooth over (D/I, M_D).

**Proof or construction outline.**

1. Objects, étale topology (Lemma 7.3), structure sheaf, u^q_X.
2. Construction 7.8: as Construction 4.7 using log q-PD envelopes (log-q-pd-triple).
3. Remark 7.7: compare with the δ_log-crystalline site at q = 1.

**Uses determining the interface.**

- Koshikawa I, Theorem 7.13: the log q-crystalline cohomology is compared with log prismatic cohomology of the Frobenius twist.
- Koshikawa I, Theorem 8.1: qΩ over (A_inf, (ξ), O_C♭∖{0}) is compared with ČK's semistable AΩ.

**Planning API.**

- `LogQCrystallineSite` (constructor; signature outstanding): The site ((X, M_X)/(D, M_D))_qCRYS.
- `LogQCrystallineSite.qOmega` (constructor; signature outstanding): qΩ_{(X,M_X)/(D,M_D)} = Ru^q_{X*}O_qCRYS, an E_∞-D-algebra on X_ét with φ_D-semilinear Frobenius.
- `LogQCrystallineSite.cech` (characterisation; signature outstanding): For affine X with chart and smooth lift, the Čech nerve of a log q-PD envelope computes qΩ (Construction 7.8, Remark 7.9).
- `LogQCrystallineSite.ofDeltaLogCrystalline` (functoriality; signature outstanding): The functor from ((X, M_X)/(D/(q − 1), M_D))_δCRYS and the induced map qΩ ⊗̂^L D/(q − 1) → Ru^δ_{X*}O_δCRYS.
- `LogQCrystallineSite.strict_change` (other; signature outstanding): For a strict map (D, I, M_D) → (D, I′, M_D), qΩ_{(X,M_X)/(D,M_D)} ≅ qΩ_{(X,M_X)_{D/I′}/(D,M_D)} (Lemma 7.12).

**Discriminating unit tests.**

- `LogQCrystallineSite.point` (degenerate; signature outstanding): For X = Spf(D/I) with log structure M_D, qΩ = D.
- `LogQCrystallineSite.q_eq_one` (compatibility; signature outstanding): If q = 1 in D the site is the δ_log-crystalline site.
- `LogQCrystallineSite.affineLine_complex` (computation; signature outstanding): For (D/I⟨X⟩, M_D ⊕ N) with D flat over A, qΩ is computed by the two-term complex D⟨X⟩ → D⟨X⟩·dlog X, f ↦ (γ(f) − f)/(q − 1)·dlog X with γ(X) = qX (Construction 7.15 with S a point).
- `LogQCrystallineSite.not_prismatic` (non-example; signature outstanding): The log q-crystalline site is not the log prismatic site over (D, ([p]_q)): its objects carry a q-PD ideal J containing the image of the base q-PD ideal I, with γ(J) ⊂ J and φ(J) ⊂ [p]_qE. J need not contain [p]_q (for example J = (ξ) in A_inf). The comparison of Theorem 7.13 uses a Frobenius twist.

**Acceptance conditions.**

- Trivial log structures: close to BS22 Remark 16.15(2) (PR.6).
- q = 1: the δ_log-crystalline site of delta-log-crystalline-site.

**Prerequisites.** `PrismaticCohomology:PR.8/log-q-pd-triple`, `PrismaticCohomology:PR.8/delta-log-crystalline-site`, `PrismaticCohomology:PR.6`.

**Sources.** K1, §7.2, Definition 7.5 (p. 39): Definition. K1, §7.2, Remark 7.7 (p. 40): Specialisation.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/QCrystalline`, namespace `TauCeti.LogPrismatic`.

### Log q-crystalline cohomology modulo q − 1

Node `PR.8/log-q-crystalline-vs-crystalline` (theorem); implementation status `unchecked`.

The canonical map induces an isomorphism qΩ_{(X,M_X)/(D,M_D)} ⊗̂^L_D D/(q − 1) ≅ Ru^δ_{X*}O_δCRYS; hence qΩ_{(R,P)/(D,M_D)} ⊗̂^L_D D/(q − 1) ≅ Ru^crys_*O_{(X,M_X)/(D/(q−1),M_D)} computed on the small log crystalline site.

**Hypotheses.** As in the log q-crystalline site.

**Proof or construction outline.**

1. Reduce to affine X with a smooth chart; the cosimplicial F^• of Construction 7.8 computes qΩ, and F^• ⊗̂^L D/(q − 1) computes δ_log-crystalline cohomology by Lemma 7.4(5).
2. Totalisation commutes with the base change (BS Lemma 16.5(3), PR.6).
3. Combine with delta-log-crystalline-vs-log-crystalline.

**Acceptance conditions.**

- Trivial log: the q = 1 specialisation of q-crystalline cohomology in BS22 §16.
- Log affine line: the q-de Rham complex reduces to the log de Rham complex.

**Prerequisites.** `PrismaticCohomology:PR.8/log-q-crystalline-site`, `PrismaticCohomology:PR.8/delta-log-crystalline-vs-log-crystalline`, `PrismaticCohomology:PR.6`.

**Sources.** K1, §7.2, Theorem 7.10 (p. 40): Statement.

### Log q-crystalline versus log prismatic cohomology

Node `PR.8/log-q-crystalline-vs-prismatic` (theorem); implementation status `unchecked`.

Let (D, I, M_D) be a prelog q-PD triple of rank 1 or with (D, M_D) a log ring, ψ_D: (D/I, M_D) → (φ_*D/[p]_q, φ_*M_D) induced by Frobenius, and (X^(1), M_X^(1)) the base change of (X, M_X) along ψ_D. If the mod p fibre of (X, M_X) is of Cartier type over (D/(p, I), M_D), there is a canonical isomorphism Δ_{(X^(1),M_X^(1))/(φ_*D,φ_*M_D)} ≅ φ_*qΩ_{(X,M_X)/(D,M_D)} of E_∞-φ_*D-algebras on X_ét, relative to the log prism (φ_*D, ([p]_q), φ_*M_D). By base change the left side is the (p, [p]_q)-completed base change along φ_D of Δ_{(X̃,M̃)/(D,M_D)} for a lift.

**Hypotheses.** Cartier type of the mod p fibre; rank 1 or log ring base.

**Proof or construction outline.**

1. Construct a functor ((X, M_X)/(D, M_D))_qCRYS → ((X^(1), M^(1))/(D, M_D))_Δ by Frobenius twisting as in crystalline-comparison-map.
2. Show the induced map is an isomorphism by reducing modulo (q − 1) (both sides (p, [p]_q)-complete) to the log crystalline comparison (log-crystalline-comparison) via log-q-crystalline-vs-crystalline.

**Acceptance conditions.**

- Over (A_inf, (ξ), O_C♭∖{0}) and X semistable: qΩ ≅ the (p, μ)-completed base change of Δ along φ (K1 Remark 8.3).
- Trivial log structures: BS22 Theorem 16.17 (PR.6).

**Prerequisites.** `PrismaticCohomology:PR.8/log-q-crystalline-vs-crystalline`, `PrismaticCohomology:PR.8/log-crystalline-comparison`, `PrismaticCohomology:PR.8/crystalline-comparison-map`, `PrismaticCohomology:PR.8/log-prismatic-base-change`.

**Sources.** K1, §7.2, Theorem 7.13 (p. 42): Statement.

### Log q-de Rham complexes

Node `PR.8/log-q-de-rham-complex` (construction); implementation status `unchecked`.

Assume D flat over A = Z_p[[q − 1]] and work locally with X = Spf(R) admitting a smooth lift and an integral weakly finitely generated chart M_D → P. For S a set and N ⊂ M_D^gp ⊕ Z^S a submonoid containing M_D, let E_N be the (p, [p]_q)-completion of D ⊗_{Z_(p)[M_D]} Z_(p)[N] with its δ_log-structure (Proposition 2.16). For s ∈ S, γ_s: X_s ↦ qX_s, X_t ↦ X_t (t ≠ s) is an automorphism and ∇^log_{q,s}(f) := (γ_s(f) − f)/(q − 1); ∇_q(f) := Σ_s ∇^log_{q,s}(f)·dlog X_s defines the (p, [p]_q)-completed Koszul complex qΩ^*_{(E_N,N)/(D,M_D)}, functorial in (S, N). For a surjection (E_N, N) → (R, P) with exactification (E_{N′}, N′) and log q-PD envelope (F, M_F), ∇^log_q extends to F giving qΩ^*_{(F,M_F)/(D,M_D)}: F → F ⊗̂_E Ω^1_{(E,M_E)/(D,M_D)} → ⋯, whose reduction mod q − 1 is the de Rham complex of the p-completed log PD envelope. Theorem: qΩ_{(R,P)/(D,M_D)} ≅ qΩ^*_{(F,M_F)/(D,M_D)}, functorially in surjections. On qΩ^* the Frobenius sends dlog X_s ↦ [p]_q dlog X_s, so the linearised Frobenius factors through η_{[p]_q}; if the mod p fibre is of Cartier type and R is topologically of finite presentation, qΩ_{(R,P)/(D,M_D)} ∈ D^{[0,r]}(D) (r the rank of Ω^1_log) and the linearised Frobenius induces φ_D^*qΩ ≅ Lη_{[p]_q}qΩ.

**Hypotheses.** D flat over Z_p[[q − 1]]; smooth lift; chart integral and weakly finitely generated; Cartier type for the Frobenius statements.

**Proof or construction outline.**

1. Construction 7.15: γ_s extends to E_N since it is congruent to the identity modulo (q − 1); q − 1 is a nonzerodivisor.
2. Construction 7.16: extend ∇^log_q to the log q-PD envelope as in BS22 Construction 16.20 (PR.6) with (q − 1)X_s replaced by (q − 1).
3. Theorem 7.17: Čech–de Rham double complex argument (BS22 Theorem 16.22): rows i > 0 are cosimplicially null-homotopic since Ω^1_{(E^•,M_E^•)/(D,M_D)} is, column 0 is the complex, face maps are isomorphisms modulo (q − 1) by Beilinson (1.8.1).
4. Remark 7.18: compute Frobenius on dlog; Cartier-type case reduces to the log Cartier isomorphism via log crystalline cohomology (CR.5).

**Uses determining the interface.**

- Koshikawa I, Theorem 8.1: the comparison with ČK's AΩ is made on log q-de Rham complexes of the semistable charts.
- Koshikawa I, Theorem 8.5: the identification of qΩ ⊗ A_crys with the log de Rham complex enters the C_st diagram.

**Planning API.**

- `LogQDeRham.gamma` (data; signature outstanding): The automorphism γ_s: X_s ↦ qX_s of (E_N, N)^a.
- `LogQDeRham.qNabla` (data; signature outstanding): ∇^log_{q,s}(f) = (γ_s(f) − f)/(q − 1) and ∇_q = Σ_s ∇^log_{q,s} dlog X_s.
- `LogQDeRham.complex` (constructor; signature outstanding): The log q-de Rham complex qΩ^*_{(E_N,N)/(D,M_D)} and its extension qΩ^*_{(F,M_F)/(D,M_D)} to log q-PD envelopes.
- `LogQDeRham.computes` (characterisation; signature outstanding): qΩ_{(R,P)/(D,M_D)} ≅ qΩ^*_{(F,M_F)/(D,M_D)} functorially in surjections (Theorem 7.17).
- `LogQDeRham.mod_q_sub_one` (compatibility; signature outstanding): Modulo q − 1, qΩ^* is the log de Rham complex of the p-completed log PD envelope.
- `LogQDeRham.frobenius_dlog` (simp; signature outstanding): Frobenius sends dlog X_s to [p]_q·dlog X_s.
- `LogQDeRham.frobenius_l_eta` (relation; signature outstanding): Under Cartier type, φ_D^*qΩ ≅ Lη_{[p]_q}qΩ, so Frobenius has an inverse up to [p]_q^r.

**Discriminating unit tests.**

- `LogQDeRham.affineLine_monomial` (computation; signature outstanding): On D⟨X⟩ with N = X^N, ∇^log_q(X^n) = [n]_q·X^n (since γ(X^n) = q^n X^n).
- `LogQDeRham.empty` (degenerate; signature outstanding): For S = ∅ the complex is E_N in degree 0.
- `LogQDeRham.q_one_limit` (compatibility; signature outstanding): Setting q = 1, ∇^log_{q,s} becomes the log derivation X_s ∂/∂X_s of the log de Rham complex.
- `LogQDeRham.not_nonlog_derivative` (non-example; signature outstanding): The log q-derivative is not the q-derivative of BS22 §16: on X^n it gives [n]_q X^n rather than [n]_q X^{n−1}, i.e. it uses (γ − 1)/(q − 1), not (γ − 1)/((q − 1)X).

**Acceptance conditions.**

- For the log affine line, qΩ^* is D⟨X⟩ → D⟨X⟩dlog X with X^n ↦ [n]_q X^n dlog X.
- Modulo q − 1 one recovers the log de Rham complex (Beilinson 1.7).

**Prerequisites.** `PrismaticCohomology:PR.8/log-q-pd-triple`, `PrismaticCohomology:PR.8/log-q-crystalline-site`, `PrismaticCohomology:PR.8/delta-log-groupification`, `PrismaticCohomology:PR.6`, `CrystallineCohomology:CR.5`, `AInfCohomology:AI.1`.

**Sources.** K1, §7.3, Construction 7.15 (p. 43): Definition. K1, §7.3, Theorem 7.17 (p. 44): Theorem. K1, §7, Remark 7.18 (p. 45): Frobenius.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/QCrystalline`, namespace `TauCeti.LogPrismatic`.

### Comparison with semistable AΩ

Node `PR.8/semistable-aomega-comparison` (theorem); implementation status `unchecked`.

Let k be algebraically closed of characteristic p, C the completed algebraic closure of W(k)[1/p], and X a p-adic formal scheme over O_C that is étale locally étale over O_C⟨t_0, …, t_r, t_{r+1}^{±1}, …, t_d^{±1}⟩/(t_0⋯t_r − π) for a non-unit π ∈ O_C, with its canonical log structure M_X (Česnavičius–Koshikawa 1.6). Then there is an isomorphism qΩ_{(X,M_X)/(A_inf,O_C♭∖{0})} ≅ AΩ_X in D(X_ét, A_inf) compatible with Frobenius, where the left side is formed over the prelog q-PD triple (A_inf, (ξ), O_C♭∖{0}) and the right side is ČK's semistable A_inf-cohomology. Since the mod p fibre is of Cartier type, qΩ is the (p, μ)-completed base change of Δ_{(X,M_X)/(A_inf,O_C♭∖{0})} along φ_{A_inf}; hence (φ^*_{A_inf}RΓ_Δ((X, M_X)/(A_inf, O_C♭∖{0})))^∧_{(p,φ(ξ))} ≅ RΓ_{A_inf}(X).

**Hypotheses.** Semistable formal scheme over O_C in the sense of ČK19; C algebraically closed; compatible p-power roots of p fixed as in ČK19 1.5.

**Proof or construction outline.**

1. Work étale locally with the ČK presentations X ↪ Spf(R^□_Σ) × ∏_λ Spf(R_λ), each R_λ = O_C⟨N^{r_λ+1} ⊕ Z^{d−r_λ}⟩/(t_{λ,0}⋯t_{λ,r_λ} − p^{q_λ}) giving a small smooth chart.
2. Embed N^{r_λ+1} ⊕ Z^{d−r_λ} → (O_C♭∖{0}) ⊕ Z^d via e_0 ↦ (p^{q_λ}, −1, …, −1) and form log q-de Rham complexes (log-q-de-rham-complex), compatible with ČK's δ_{λ,i}.
3. Identify these with ČK's local complexes computing AΩ (owned by AI.6) functorially for étale maps and glue; Frobenius compatibility by construction.
4. Combine with log-q-crystalline-vs-prismatic and base change for the reformulation.

**Acceptance conditions.**

- For X = Spf(O_C⟨t^{±1}⟩) (trivial boundary) this is the torus case of BS22 Theorem 17.2 (PR.6).
- For the semistable curve O_C⟨t_0, t_1⟩/(t_0t_1 − p) both sides are computed by the same Koszul complexes.

**Prerequisites.** `PrismaticCohomology:PR.8/log-q-de-rham-complex`, `PrismaticCohomology:PR.8/log-q-crystalline-vs-prismatic`, `PrismaticCohomology:PR.8/standard-log-prisms`, `AInfCohomology:AI.6`, `PrismaticCohomology:PR.6`.

**Sources.** K1, §8, Theorem 8.1 (p. 45): Statement. K1, §8, Remark 8.3 (p. 45): Reformulation. K1, §1, Example 1.5 (p. 4): Global form.

### The semistable C_st comparison diagram

Node `PR.8/semistable-crys-bdr-diagram` (theorem); implementation status `unchecked`.

Let X be as in the semistable AΩ comparison and proper over O_C. The intended commutative comparison diagram has left column RΓ_logcrys((X,M_X)/(A_crys,O_C♭∖{0})) ≅ RΓ_qCRYS((X,M_X)/(A_inf,O_C♭∖{0})) ⊗^L_{A_inf} A_crys ≅ RΓ(X_ét,AΩ_X) ⊗^L_{A_inf} A_crys. The right column starts with RΓ_crys(X_C^ad/B_dR^+) → RΓ_ét(X_C^ad,Z_p) ⊗^L_{Z_p} B_dR^+, the period comparison map of ČK19 Proposition 6.8, followed by the usual isomorphism with RΓ_ét(X_C^ad,A_inf,X_C^ad) ⊗^L_{A_inf} B_dR^+. The first right-column map is not asserted an isomorphism over B_dR^+; it becomes one over B_dR. Horizontals are the ČK19 §6.8 maps transported via Theorem 8.1 and Remark 8.4. K1 Theorem 8.5 contains diagram misprints; this node specifies the corrected intended diagram, not the erroneous isomorphism as printed.

**Hypotheses.** X proper semistable over O_C.

**Proof or construction outline.**

1. Use the correctly typed diagram of ČK19 Proposition 6.8: its right vertical period map is unlabelled, and its lower comparison arrow is an isomorphism because φ^{-1}(μ) is a unit in B_dR^+. Transport the left column through the log q-crystalline comparison over A_inf, before tensoring with A_crys.
2. Remark 8.4 identifies each term of the log q-de Rham complex tensored with A_crys with the log de Rham complex, with differentials related by (5.15.2) in the opposite direction.
3. Reduce to the commutativity of ČK19 (6.8.4), checked before colimits and completions.

**Acceptance conditions.**

- The diagram is the input to the semistable conjecture C_st without ČK19 5.4.
- For good reduction (r = 0 everywhere) it specialises to the crystalline diagram of BMS1 §13.

**Prerequisites.** `PrismaticCohomology:PR.8/semistable-aomega-comparison`, `PrismaticCohomology:PR.8/log-q-de-rham-complex`, `AInfCohomology:AI.6`, `AInfCohomology:AI.0`, `CrystallineCohomology:CR.5`.

**Sources.** K1, §8, Theorem 8.5 (p. 49): K1 asserts commutativity, but the printed diagram has incorrect coefficients and an incorrect isomorphism label; see source issue E8.7 and the correcting comparison with ČK19 Proposition 6.8. K1, §8 (p. 49): Role. CK, §6.7; Proposition 6.8 and its diagram, pp. 65–66: The displayed B_dR^+ diagram has an unlabelled period comparison arrow; only the coefficient-sheaf comparison is labelled an isomorphism. This fixes K1’s intended diagram.

### Breuil–Kisin cohomology of semistable formal schemes

Node `PR.8/breuil-kisin-log-cohomology` (construction); implementation status `unchecked`.

Let K be a totally ramified finite extension of W(k)[1/p] with uniformiser π and X a qcqs semistable formal scheme over O_K with canonical log structure M_X. Define RΓ_BK(X) := RΓ_Δ((X, M_X)/(W(k)[[u]], N)) over the Breuil–Kisin prelog prism. Then (A_inf ⊗^L_{W(k)[[u]]} RΓ_BK(X))^∧_(p,ξ) ≅ RΓ_Δ((X, M_X)_{O_C}/(A_inf, O_C♭∖{0})), which together with the semistable AΩ comparison is a Breuil–Kisin descent of the A_inf-cohomology of X_{O_C}; if X is proper, RΓ_BK(X) is perfect and the base change holds without completion. Its Frobenius is φ-semilinear over u ↦ u^p, and over (W(k)[[u]], N) the Frobenius is an isogeny when the mod p fibre is of Cartier type.

**Hypotheses.** X qcqs semistable over O_K; canonical log structure M_X = (O_X[1/p])^× ∩ O_X.

**Proof or construction outline.**

1. (X, M_X) is smooth over (O_K, N → π^n) in Koshikawa's sense (K1 Appendix A, Example (2)), hence over (W(k)[[u]]/E, N).
2. Base change along the map of prelog prisms u ↦ [π♭] (standard-log-prisms) and log-prismatic-base-change.
3. Perfectness for proper X from log-hodge-tate-comparison.
4. Compare with A_inf-cohomology via semistable-aomega-comparison.
5. The Cartier-type Frobenius isogeny is log-frobenius-isogeny, applied to the Breuil–Kisin base; semilinearity alone does not imply it.

**Uses determining the interface.**

- Koshikawa–Yao II, Theorem 10: the low-ramification structure theorem describes H^i_Δ(X/(S, N)) = H^i(RΓ_BK(X)).
- Koshikawa I, §1: it gives the first construction of Breuil–Kisin cohomology in the semistable case.
- CrystallineCohomology CR.6 and AInfCohomology AI.6: its specialisations are compared with Hyodo–Kato and semistable A_inf-cohomology on their overlap.

**Planning API.**

- `BreuilKisinLogCohomology` (constructor; signature outstanding): RΓ_BK(X) := RΓ_Δ((X, M_X)/(W(k)[[u]], N)).
- `BreuilKisinLogCohomology.toAinf` (compatibility; signature outstanding): (A_inf ⊗^L_{W(k)[[u]]} RΓ_BK(X))^∧ ≅ RΓ_Δ((X, M_X)_{O_C}/(A_inf, O_C♭∖{0})).
- `BreuilKisinLogCohomology.perfect` (other; signature outstanding): For X proper, RΓ_BK(X) is a perfect W(k)[[u]]-complex.
- `BreuilKisinLogCohomology.toHyodoKato` (compatibility; signature outstanding): Base change along u ↦ 0 and Frobenius twist gives RΓ_crys((X_k, M)/(W(k), N)) (log-crystalline-comparison).
- `BreuilKisinLogCohomology.frobenius` (structure; signature outstanding): The φ-semilinear Frobenius over u ↦ u^p.

**Discriminating unit tests.**

- `BreuilKisinLogCohomology.point` (degenerate; signature outstanding): For X = Spf(O_K) with M_X = O_K∖{0}, RΓ_BK(X) = W(k)[[u]].
- `BreuilKisinLogCohomology.goodReduction` (compatibility; signature outstanding): If X is smooth over O_K (no boundary), M_X is pulled back from O_K∖{0}, and RΓ_BK(X) agrees with the non-log prismatic cohomology of X over the Breuil–Kisin prism (PR.1), as the strict case of derived-log-properties (1).
- `BreuilKisinLogCohomology.curve_H0` (computation; signature outstanding): For a proper semistable curve with geometrically connected generic fibre, H^0(RΓ_BK(X)) = W(k)[[u]].
- `BreuilKisinLogCohomology.not_trivialLog` (non-example; signature outstanding): Using the trivial log structure on a semistable X (not smooth over O_K) does not give a perfect complex with Hodge–Tate graded pieces Ω^i_log; the log structure is essential.

**Acceptance conditions.**

- For good reduction X (r = 0) RΓ_BK is BMS2's Breuil–Kisin cohomology (via PR.1 base change).
- Specialising along u ↦ 0 gives the Hyodo–Kato log crystalline cohomology of the special fibre after Frobenius twist (log-crystalline-comparison).

**Prerequisites.** `PrismaticCohomology:PR.8/standard-log-prisms`, `PrismaticCohomology:PR.8/log-prismatic-base-change`, `PrismaticCohomology:PR.8/log-hodge-tate-comparison`, `PrismaticCohomology:PR.8/semistable-aomega-comparison`, `CrystallineCohomology:CR.5:log-algebra`, `PrismaticCohomology:PR.8/log-frobenius-isogeny`.

**Sources.** K1, §1, Example 1.6 (p. 5): Definition. K1, §1, Example 1.6 (p. 5): Perfectness.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/Applications`, namespace `TauCeti.LogPrismatic`.

## G. Derived and quasisyntomic theory

### The log quasisyntomic site

Node `PR.8/log-quasisyntomic-site` (definition); implementation status `unchecked`.

Import DerivedDeRhamCohomology:DD.6/log-quasisyntomic-sites and expose its notions to log prismatic consumers under the API names below; no second site or QRSP definition is constructed in PR.8. A map of pre-log rings A → B is p-completely homologically log flat (resp. faithfully flat) if B ⊗^L_A A/p ≅ B/p is discrete and (A/p, M_A) → (B/p, M_B) is homologically log flat (resp. homologically log faithfully flat) in the sense supplied by DD.6 (B′ ⊕^L_A B ≅ B′ ⊕_A B for all A → B′, plus faithful flatness of rings). A pre-log ring (A, M_A) is quasisyntomic if A is p-complete with bounded p^∞-torsion and the Gabber log cotangent complex L_{(A,M_A)/Z_p} has p-complete Tor amplitude in [−1, 0]. A map A → B of p-complete pre-log rings with bounded p^∞-torsion is quasisyntomic (resp. a quasisyntomic cover) if it is p-completely homologically log flat (resp. faithfully flat) and L_{B/A} ⊗^L_B B/p has Tor amplitude in [−1, 0]. QSyn^prelog is the category of quasisyntomic pre-log rings; its opposite is a site with quasisyntomic covers. For (R, M) p-complete with bounded p^∞-torsion, qSyn_{(R,M)} is the small site of quasisyntomic maps (R, M) → (S, N); for perfectoid quasisyntomic (R, M), QSyn_{(R,M)} is the slice. On these sites the p-completion of ∧^i L_{(S,N)/(R,M)}[−i] lies in D^{≥0}(S).

**Hypotheses.** Gabber's log cotangent complex and homologically log flat maps as supplied by DD.6. For trivial pre-log structures one recovers BMS2's quasisyntomic site (DD.5).

**Proof or construction outline.**

1. The following steps describe the supplier contract and its use, not a second proof of DD.6. The PR.8 ID is retained as an adapter so existing consumers keep their prerequisite names.
2. Lemma 3.5: for a quasisyntomic cover A → B, A ∈ QSyn^prelog iff B ∈ QSyn^prelog (transitivity triangle and faithful flatness of A/p → B/p).
3. Lemma 3.6: quasisyntomic maps compose; their p-completed pushouts are discrete with bounded p^∞-torsion and quasisyntomic over the other factor (using BMS2 Corollary 4.8 and base change of L).
4. Corollary 3.7: QSyn^{prelog,op} is a site; Remarks 3.8–3.9 for the slice and small sites and the D^{≥0} property.

**Uses determining the interface.**

- Koshikawa–Yao II, Proposition 4.8: derived log prismatic cohomology is a sheaf for this topology.
- Koshikawa–Yao II, Corollary 3.20: sheaves on QSyn^prelog are determined by their restriction to quasiregular semiperfectoid pre-log rings.
- Koshikawa–Yao II, Corollary 3.10: the p-completed derived log de Rham complex is a sheaf on qSyn_R.
- DerivedDeRhamCohomology, DD.6 exported log quasisyntomic and QRSP contracts: PR.8 aliases the owning definitions and adds their log-prismatic use; DD.6 retains definition and topology ownership..

**Planning API.**

- `LogQSyn.IsQuasisyntomic` (other; signature outstanding): The quasisyntomic condition on a pre-log ring.
- `LogQSyn.IsQuasisyntomicMap` (other; signature outstanding): The quasisyntomic condition on a map, with the cover variant.
- `LogQSyn.site` (constructor; signature outstanding): The site QSyn^{prelog,op} with quasisyntomic covers, and its small variant qSyn_{(R,M)}.
- `LogQSyn.of_cover` (characterisation; signature outstanding): For a quasisyntomic cover A → B, A is quasisyntomic iff B is.
- `LogQSyn.comp` (structure; signature outstanding): Quasisyntomic maps compose.
- `LogQSyn.pushout` (functoriality; signature outstanding): The p-completed pushout of a quasisyntomic map along any map is discrete with bounded p^∞-torsion and quasisyntomic.
- `LogQSyn.trivialLog` (compatibility; signature outstanding): On pre-log rings with trivial pre-log structure, the notions agree with BMS2's quasisyntomic rings and maps (DD.5).
- `LogQSyn.cotangent_coconnective` (other; signature outstanding): For (S, N) in qSyn_{(R,M)}, (∧^i L_{(S,N)/(R,M)}[−i])^∧_p ∈ D^{≥0}(S).

**Discriminating unit tests.**

- `LogQSyn.smoothLog_quasisyntomic` (computation; signature outstanding): (Z_p⟨T⟩, T^N) is quasisyntomic: its log cotangent complex is free of rank 1 on dlog T.
- `LogQSyn.trivialLog_eq` (compatibility; signature outstanding): (R, {e}) is in QSyn^prelog iff R is in BMS2's QSyn.
- `LogQSyn.zeroLog_lci` (characterisation; signature outstanding): (Z_p, N → Z_p, 1 ↦ 0) is quasisyntomic: L_{(Z_p,N)/Z_p} is concentrated in degrees [−1, 0] (KY Example 2.30).
- `LogQSyn.not_nonintegral` (non-example; signature outstanding): For k of characteristic p ≠ 2, (k, P) → (k[x, y]/(x^2, xy, y^2), N^2), with P ⊂ N^2 generated by (2,0), (0,2), (1,1) and P∖{0} ↦ 0, is log étale in Kato's sense but not quasisyntomic: its log cotangent complex is unbounded on the left (KY Remark 2.13).
- `LogQSyn.empty_degenerate` (degenerate; signature outstanding): The identity of a quasisyntomic pre-log ring is a quasisyntomic cover.

**Acceptance conditions.**

- p-completions of smooth Z_p- or O_C-algebras with trivial pre-log structure are quasisyntomic.
- If (R, M) is a p-completely smooth log algebra over Z_p (in Koshikawa's sense), or the p-completion of a p-torsion free log complete intersection, then R ∈ QSyn^prelog (KY Example 3.4(2)).

**Prerequisites.** `CrystallineCohomology:CR.5:log-algebra`, `mathlib:CategoryTheory.GrothendieckTopology`, `DerivedDeRhamCohomology:DD.6/log-quasisyntomic-sites`, `DerivedDeRhamCohomology:DD.6/homological-log-flatness`, `DerivedDeRhamCohomology:DD.6/gabber-log-cotangent`, `DerivedDeRhamCohomology:DD.5/quasisyntomic-site`.

**Sources.** KY, §3.1, Definition 3.2 (p. 27): Quasisyntomic pre-log rings. KY, §3.1, Definition 3.3 (p. 27): Maps and covers. KY, §3.1, Corollary 3.7 (p. 28): Site.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/Derived`, namespace `TauCeti.LogPrismatic`.

### Quasiregular semiperfectoid pre-log rings

Node `PR.8/log-qrsp` (definition); implementation status `unchecked`.

Import DerivedDeRhamCohomology:DD.6/log-quasiregular-semiperfectoid and expose its notions to log prismatic consumers under the API names below; no second site or QRSP definition is constructed in PR.8. A p-complete pre-log ring S = (S, M) is semiperfectoid if (1) there is a ring map R → S from a perfectoid ring; (2) S/p is semiperfect; (3) the natural map M♭ → M/M^× is surjective. It is quasiregular semiperfectoid if moreover (4) S is quasisyntomic. QRSPerfd^prelog denotes the category of quasiregular semiperfectoid pre-log rings. Conditions (2)–(3) (log-semiperfect) imply L_{(S,M)/R} ⊗^L S/p ∈ D^{≤−1}(S/p) for any R → S; for S quasiregular semiperfectoid, L̂_{(S,M)/Z_p}[−1] is p-completely flat. Equivalently (when S/p is log-semiperfect, S p-complete with bounded p^∞-torsion), S ∈ QRSPerfd^prelog iff for some (equivalently every) perfectoid R → S, L_{(S,M)/R} ⊗^L S/p has Tor amplitude in degree −1.

**Hypotheses.** p-complete pre-log rings; perfectoid in the sense of BMS1.

**Proof or construction outline.**

1. The following steps describe the supplier contract and its use, not a second proof of DD.6. The PR.8 ID is retained as an adapter so existing consumers keep their prerequisite names.
2. Define via the four conditions; record the variants (5)–(6) of Remark 3.12 and their implications.
3. Remark 3.13: a semiperfectoid (S, M) receives (R ⊗̂ W(S♭) ⊗̂ Z_p⟨M♭⟩, M♭) → (S, M), surjective on rings and modulo units on monoids.
4. Lemma 3.16: purity of π_1 of L_{R/Z_p} ⊗ S/p → L_{S/Z_p} ⊗ S/p, reduced to perfect fields k and Lemma 2.9 (via DD.6).

**Uses determining the interface.**

- Koshikawa–Yao II, Corollary 3.20: QRSPerfd^prelog is a basis of QSyn^prelog.
- Koshikawa–Yao II, Proposition 4.17: for S ∈ QRSPerfd^prelog integral, Δ_{S/A_inf(R)} is discrete and equals the initial log prism.
- Koshikawa–Yao II, §5: the Nygaard filtration is analysed on (exactified) quasiregular semiperfectoid inputs.
- DerivedDeRhamCohomology, DD.6 exported log quasisyntomic and QRSP contracts: PR.8 aliases the owning definitions and adds their log-prismatic use; DD.6 retains definition and topology ownership..

**Planning API.**

- `LogQRSP.IsSemiperfectoid` (other; signature outstanding): Conditions (1)–(3).
- `LogQRSP.IsQRSP` (other; signature outstanding): Conditions (1)–(4).
- `LogQRSP.cotangent_flat` (other; signature outstanding): For S ∈ QRSPerfd^prelog, L̂_{(S,M)/Z_p}[−1] is p-completely flat.
- `LogQRSP.iff_cotangent` (characterisation; signature outstanding): Lemma 3.16: with S/p log-semiperfect and S p-complete with bounded p^∞-torsion, S is quasiregular semiperfectoid iff the log cotangent complex L_{(S,M)/R} ⊗^L S/p has Tor amplitude in degree −1 for some/any perfectoid R → S (R with trivial prelog structure).
- `LogQRSP.perfectoidCover` (constructor; signature outstanding): The map (R ⊗̂ W(S♭) ⊗̂ Z_p⟨M♭⟩, M♭) → (S, M) of Remark 3.13.
- `LogQRSP.quotient_monoid` (relation; signature outstanding): Condition (3) passes to quotient monoids and pushouts (Remark 3.14).

**Discriminating unit tests.**

- `LogQRSP.perfectoid_divisible` (computation; signature outstanding): (O_C⟨T^{1/p^∞}⟩, N[1/p] → T^{N[1/p]}) is quasiregular semiperfectoid.
- `LogQRSP.trivialLog` (compatibility; signature outstanding): (S, S^×) is in QRSPerfd^prelog iff S is in BMS2's QRSPerfd (PR.2/DD.5).
- `LogQRSP.log_line_not` (non-example; signature outstanding): (Z_p⟨T⟩, T^N) is quasisyntomic but not semiperfectoid: N♭ = 0 does not surject onto N.
- `LogQRSP.zero_ring` (degenerate; signature outstanding): The zero pre-log ring is quasiregular semiperfectoid.

**Acceptance conditions.**

- (R, M) with R ∈ QRSPerfd and M uniquely p-divisible is in QRSPerfd^prelog (KY Example 3.15(1)).
- (O_C⟨X^{1/p^∞}, Y^{1/p^∞}⟩/(X − Y), N[1/p] ⊕_N N[1/p]) is log quasiregular semiperfectoid (KY Example 3.15(2)).

**Prerequisites.** `PrismaticCohomology:PR.8/log-quasisyntomic-site`, `PrismaticCohomology:PR.8/perfectoid-monoid`, `PrismaticCohomology:PR.2`, `DerivedDeRhamCohomology:DD.6/log-quasiregular-semiperfectoid`, `DerivedDeRhamCohomology:DD.6/gabber-log-cotangent`, `DerivedDeRhamCohomology:DD.6/log-cotangent-functoriality`.

**Sources.** KY, §3.2, Definition 3.11 (p. 29): Definition. KY, §3.2, Lemma 3.16 (p. 30–31): Characterisation.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/Derived`, namespace `TauCeti.LogPrismatic`.

### Quasiregular semiperfectoid pre-log rings form a basis

Node `PR.8/log-qrsp-basis` (theorem); implementation status `unchecked`.

(1) For maps A → B, A → C in QRSPerfd^prelog with A → B a quasisyntomic cover, the p-completed pushout lies in QRSPerfd^prelog and is a quasisyntomic cover of C; QRSPerfd^{prelog,op} is a site. (2) Every R ∈ QSyn^prelog admits a quasisyntomic cover R → S with S ∈ QRSPerfd^prelog, which can be chosen with p-divisible monoid. (3) For such a cover every term of the Čech nerve lies in QRSPerfd^prelog. (4) Consequently, for every presentable ∞-category C, restriction induces an equivalence Shv_C(QSyn^{prelog,op}) ≅ Shv_C(QRSPerfd^{prelog,op}).

**Hypotheses.** Quasisyntomic topology; presentable target.

**Proof or construction outline.**

1. (1) Lemma 3.17 via Lemma 3.6 and Remark 3.14.
2. (2) Lemma 3.18: choose surjections Z_p[X_i] → R and N^J → M, base change along (Z_p⟨X_i, Y_j⟩, N^J) → (O_C⟨X_i^{1/p^∞}, Y_j^{1/p^∞}⟩, N[1/p]^J).
3. (3) Lemma 3.19: terms are quasisyntomic with log-semiperfect reductions.
4. (4) Corollary 3.20 as BMS2 Proposition 4.31 (or Lurie SAG A.3.11): the Yoneda construction ρ is inverse to restriction.

**Acceptance conditions.**

- For trivial log structures this is BMS2 Proposition 4.31 (DD.5).
- The log affine line (Z_p⟨T⟩, T^N) is covered by (O_C⟨T^{1/p^∞}⟩, T^{N[1/p]}).

**Prerequisites.** `PrismaticCohomology:PR.8/log-qrsp`, `PrismaticCohomology:PR.8/log-quasisyntomic-site`, `DerivedDeRhamCohomology:DD.5`.

**Sources.** KY, §3.2, Lemma 3.18 (p. 32): Part (2). KY, §3.2, Corollary 3.20 (p. 32): Part (4).

### Derived log prismatic cohomology

Node `PR.8/derived-log-prismatic` (construction); implementation status `unchecked`.

Fix a bounded prelog prism (A, I, M_A) with M_A integral. On the log-free pre-log rings Σ_{S,T} := (A/I⟨(X_s)_{s∈S}, N^T⟩, M_A ⊕ N^T) (S, T finite) consider Σ_{S,T} ↦ Δ_{Σ_{S,T}/(A,M_A)} := RΓ_Δ(Spf(Σ_{S,T})^a/(A, M_A)), a (p, I)-complete commutative algebra in D(A) with φ_A-semilinear Frobenius. The derived log prismatic cohomology (R, P) ↦ Δ^L_{(R,P)/(A,M_A)} is its left Kan extension (animation) to all simplicial (animated) pre-log rings over (A/I, M_A), followed by (p, I)-completion; it depends only on the derived p-completion of (R, P); Δ̄^L := Δ^L ⊗^L_A A/I. For a log p-adic formal scheme (X, M_X) over (A/I, M_A), the étale sheaf Δ^L_{(X,M_X)/(A,M_A)} is the (p, I)-complete étale sheafification of U = Spf(R) ↦ Δ^L_{(R,Γ(U,M_X))/(A,M_A)}; similarly Δ̄^L and the conjugate filtration.

**Hypotheses.** Animated pre-log rings as supplied by DD.6 (KY Remark 2.8) built on EDS E5:animation; (A, I, M_A) bounded with integral monoid.

**Proof or construction outline.**

1. Define on Σ_{S,T} using log-prismatic-cohomology and its functoriality in maps of log-free algebras.
2. Left Kan extend along compact projective generators of animated pre-log (A/I, M_A)-algebras (KY Remark 2.8 and Remark 4.4).
3. Globalise by étale sheafification: the constant prelog chart given by sections P = Γ(U, M_X) → O(U) need not induce the original log structure on every smaller étale open, so the affine presheaf requires sheafification (KY Remark 4.11).

**Uses determining the interface.**

- Koshikawa–Yao II, Theorem 5.1: the derived Nygaard filtration is constructed on the derived theory.
- Koshikawa–Yao II, Theorem 6.1: the affine Kummer-étale comparison is stated for derived log prismatic cohomology of arbitrary p-complete pre-log algebras.
- Koshikawa–Yao II, Proposition 4.8: quasisyntomic descent is a property of the derived functor.

**Planning API.**

- `DerivedLogPrismatic` (constructor; signature outstanding): The functor (R, P) ↦ Δ^L_{(R,P)/(A,M_A)} on animated pre-log (A/I, M_A)-algebras, with Frobenius.
- `DerivedLogPrismatic.reduced` (constructor; signature outstanding): Δ̄^L := Δ^L ⊗^L_A A/I.
- `DerivedLogPrismatic.onFree` (characterisation; signature outstanding): On Σ_{S,T}, Δ^L agrees with the site-theoretic log prismatic cohomology.
- `DerivedLogPrismatic.leftKanExtension` (universal-property; signature outstanding): Δ^L preserves sifted colimits and is the unique such extension of its values on log-free algebras (after completion).
- `DerivedLogPrismatic.pComplete_invariant` (other; signature outstanding): Δ^L depends only on the derived p-completion of (R, P).
- `DerivedLogPrismatic.sheaf` (constructor; signature outstanding): The étale sheaf Δ^L_{(X,M_X)/(A,M_A)} on a log p-adic formal scheme.
- `DerivedLogPrismatic.map` (functoriality; signature outstanding): Functoriality in (R, P) and in maps of bounded prelog prisms.

**Discriminating unit tests.**

- `DerivedLogPrismatic.free_logLine` (computation; signature outstanding): For (A/I⟨N⟩, M_A ⊕ N), Δ̄^L has H^0 = A/I⟨X⟩ and H^1{1} free on dlog X.
- `DerivedLogPrismatic.base` (degenerate; signature outstanding): For (R, P) = (A/I, M_A), Δ^L = A.
- `DerivedLogPrismatic.trivialLog` (compatibility; signature outstanding): For P = M_A pulled back from the base, Δ^L_{(R,M_A)/(A,M_A)} ≅ BS22's Δ_{R/A} (PR.2).
- `DerivedLogPrismatic.zeroLog_not_discrete` (non-example; signature outstanding): For (R, P) = (A/I, N → 0) over trivial M_A, Δ̄^L is not concentrated in degree 0: its conjugate filtration has graded pieces ∧^i L_{(A/I,N)/(A/I)}{−i}[−i] and L_{(A/I,N)/(A/I)} lives in degrees [−1, 0] (KY Example 2.30).

**Acceptance conditions.**

- For (R, P) = Σ_{S,T} the derived and site-theoretic values agree tautologically.
- For P = M_A (pulled back) one recovers BS22's derived prismatic cohomology Δ_{R/A} (derived-log-properties (1)).

**Prerequisites.** `PrismaticCohomology:PR.8/log-prismatic-cohomology`, `PrismaticCohomology:PR.8/log-hodge-tate-comparison`, `EnhancedDerivedSheaves:E5:animation`, `PrismaticCohomology:PR.2`, `DerivedDeRhamCohomology:DD.6/free-prelog-resolutions`.

**Sources.** KY, §4.1, Definition 4.3 (p. 33): Definition. KY, §4.2, Definition 4.9 (p. 35): Globalisation.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/Derived`, namespace `TauCeti.LogPrismatic`.

### Derived log Hodge–Tate comparison

Node `PR.8/derived-log-hodge-tate` (theorem); implementation status `unchecked`.

For a simplicial pre-log ring (R, P) over (A/I, M_A), there is an increasing exhaustive multiplicative filtration Fil_• Δ̄_{(R,P)/(A,M_A)} (the conjugate filtration) by derived p-complete objects with gr_i Δ̄_{(R,P)/(A,M_A)} ≅ (∧^i L_{(R,P)/(A/I,M_A)}{−i}[−i])^∧_p. Globally, gr_i Δ̄^L_{(X,M_X)/(A,M_A)} ≅ LΩ̂^i_{(X,M_X)/(A/I,M_A)}{−i}[−i] := (∧^i L_{(X,M_X)/(A/I,M_A)})^∧{−i}[−i].

**Hypotheses.** (A, I, M_A) bounded with M_A integral.

**Proof or construction outline.**

1. On Σ_{S,T} take the canonical (Postnikov) filtration; the Hodge–Tate comparison gives H^i ≅ (Ω^i_log)^∧{−i} ≅ (∧^i L)^∧{−i}.
2. Left Kan extend the filtration (both sides commute with sifted colimits).
3. Globally sheafify; the p-complete étale sheafification of U ↦ L̂_{(R,Γ(U,M_X))/(A/I,M_A)} is L̂_{(X,M_X)/(A/I,M_A)} (canonical free resolutions; DD.6).

**Acceptance conditions.**

- For smooth (R, P) with a smooth chart the filtration is the canonical filtration τ_{≤i}.
- For trivial log structures this is the derived Hodge–Tate comparison of BS22 §7 (PR.2).

**Prerequisites.** `PrismaticCohomology:PR.8/derived-log-prismatic`, `PrismaticCohomology:PR.8/log-hodge-tate-comparison`, `DerivedDeRhamCohomology:DD.6/gabber-log-cotangent`, `DerivedDeRhamCohomology:DD.6/log-cartier`.

**Sources.** KY, §4.1, Proposition 4.5 (p. 34): Statement. KY, §4.2, Remark 4.10 (p. 36): Global form.

### Basic properties of derived log prismatic cohomology

Node `PR.8/derived-log-properties` (theorem); implementation status `unchecked`.

Let (A, I, M_A) be a bounded prelog prism with M_A integral. (1) For every derived p-complete simplicial ring R over A/I, Δ_{R/A} ≅ Δ^L_{(R,M_A)/(A,M_A)} (strict pull-back of the base log structure). (2) Δ^L is invariant under passing to the associated log ring: Δ^L_{(R,P)/(A,M_A)} ≅ Δ^L_{(R,P)^a/(A,M_A)}. (3) Base change: for a map of bounded prelog prisms (A, I, M_A) → (A′, IA′, M_{A′}) and (R′, P′) the homotopy base change, Δ^L_{(R,P)/(A,M_A)} ⊗̂^L_A A′ ≅ Δ^L_{(R′,P′)/(A′,M_{A′})}. (4) Multiplicativity: for the homotopy cofibre product (R_3, P_3) of (R_1, P_1), (R_2, P_2) over (A/I, M_A), Δ_1 ⊗̂^L_A Δ_2 ≅ Δ_3, compatibly with conjugate filtrations (Day convolution); Δ^L_{−/(A,M_A)} commutes with all colimits. (5) For (A/I, M_A) perfectoid or pseudo-perfectoid, Δ^L_{(R,P)/A} ≅ Δ^L_{(R,P)/(A,M_A)}.

**Hypotheses.** As in derived-log-prismatic.

**Proof or construction outline.**

1. (1) For log-free algebras with P = M_A, the site-theoretic theories agree compatibly with Hodge–Tate; conclude by Hodge–Tate and Lemma 2.9 of KY (log cotangent complex equals the non-log one when monoids agree; DD.6).
2. (2) Hodge–Tate and associated-log invariance L_{(R,P)/(R,P^a)} = 0 (KY Lemma 2.10; DD.6).
3. (3) Hodge–Tate, derived Nakayama, base change for L (KY Theorem 2.11; DD.6).
4. (4) Reduce to log-free algebras and compute differential forms.
5. (5) Hodge–Tate and perfectoid-prelog-cotangent (KY Remark 6.2).

**Acceptance conditions.**

- For the Breuil–Kisin → A_inf map (3) recovers K1 Example 1.6.
- (1) shows that strict smooth log schemes have the same prismatic cohomology as their underlying schemes.

**Prerequisites.** `PrismaticCohomology:PR.8/derived-log-hodge-tate`, `PrismaticCohomology:PR.8/derived-log-prismatic`, `PrismaticCohomology:PR.8/perfectoid-prelog-cotangent`, `DerivedDeRhamCohomology:DD.6`, `PrismaticCohomology:PR.2`.

**Sources.** KY, §4.1, Proposition 4.7 (p. 34): Part (2). KY, §4.1, Proposition 4.7(3) (p. 34): Part (3). KY, §6, Remark 6.2 (p. 59): Part (5).

### Derived and site-theoretic log prismatic cohomology agree for smooth log formal schemes

Node `PR.8/derived-vs-site` (theorem); implementation status `unchecked`.

Let (A, I, M_A) be bounded with M_A integral and (X, M_X) smooth over (A/I, M_A). (1) For every affine U = Spf(R) in X_ét, Δ^L_{(X,M_X)/(A,M_A)}(U) ≅ RΓ(((U, M_U)/(A, M_A))_Δ, O_Δ). (2) If P → Γ(U, M_X) is a smooth chart, Δ^L_{(R,P)/(A,M_A)} ≅ Δ^L_{(X,M_X)/(A,M_A)}(U); in particular for X = Spf(R) with smooth chart M_A → P, Δ^L_{(R,P)/(A,M_A)} ≅ RΓ_Δ((X, M_X)/(A, M_A)) compatibly with Hodge–Tate maps. Hence Δ^L_{(X,M_X)} ≅ Rν_*O_Δ, RΓ_Δ((X, M_X)/(A, M_A)) ≅ RΓ(X_ét, Δ^L_{(X,M_X)}), Δ̄^L ≅ Rν_*Ō_Δ, and the derived conjugate filtration is the canonical filtration τ_{≤i}Δ̄.

**Hypotheses.** (X, M_X) smooth in Koshikawa's sense over a bounded prelog prism with integral monoid.

**Proof or construction outline.**

1. Construct the maps by functoriality of the log prismatic site (an étale sheaf of complexes in U).
2. Compatibility with Hodge–Tate reduces the claim to: the p-complete étale sheafification of U ↦ L̂_{(R,Γ(U,M_X))/(A/I,M_A)} is Ω^1_{(X,M_X)/(A/I,M_A)} (K1 Proposition 5.1, supplied by DD.6).
3. (2): for a smooth chart, L̂_{(R,P)/(A/I,M_A)} ≅ Ω̂^1_log (KY Lemma 2.14; DD.6) and Ω^1_log is locally free; conclude by derived Nakayama.

**Acceptance conditions.**

- For the log affine line, both sides are computed by the Čech–Alexander complex of K1 §5.4.
- For trivial log structures this is the agreement of BS22 Construction 7.6 with site-theoretic prismatic cohomology for smooth algebras (PR.2).

**Prerequisites.** `PrismaticCohomology:PR.8/derived-log-hodge-tate`, `PrismaticCohomology:PR.8/log-hodge-tate-comparison`, `PrismaticCohomology:PR.8/log-prismatic-cohomology`, `DerivedDeRhamCohomology:DD.6`.

**Sources.** KY, §4.2, Proposition 4.12 (p. 36): Part (1). KY, §4.1, Corollary 4.6 (p. 34): Smooth affine case.

### Log quasisyntomic descent

Node `PR.8/log-quasisyntomic-descent` (theorem); implementation status `unchecked`.

Let (A, I, M_A) be a bounded prelog prism with M_A integral. On the small log quasisyntomic site qSyn_{(A/I,M_A)} the presheaf (R, P) ↦ Δ^L_{(R,P)/(A,M_A)} is a sheaf (with values in (p, I)-complete objects of D(A)); if (A/I, M_A) is a perfectoid pre-log ring, the same holds on QSyn_{(A/I,M_A)}. The same holds for each step of the conjugate filtration of Δ̄^L.

**Hypotheses.** Bounded prelog prism with M_A integral; for the big site, (A/I, M_A) perfectoid.

**Proof or construction outline.**

1. In both cases the p-completion of ∧^i L_{(R,P)/(A/I,M_A)}[−i] lies in D^{≥0}(R) (log-quasisyntomic-site).
2. By derived Nakayama and the derived Hodge–Tate comparison, reduce to descent for (∧^i L)^∧[−i].
3. Apply hlf descent of exterior powers of Gabber's log cotangent complex (KY Proposition 2.47; supplied by DD.6); totalisation commutes with the exhaustive conjugate filtration since the terms are coconnective.

**Acceptance conditions.**

- For trivial log structures this is BMS2/BS22 quasisyntomic descent of derived prismatic cohomology (PR.2).
- The descent is not an ordinary flat descent on underlying rings: homologically log flat covers are required (Remark 2.46).

**Prerequisites.** `PrismaticCohomology:PR.8/derived-log-hodge-tate`, `PrismaticCohomology:PR.8/log-quasisyntomic-site`, `DerivedDeRhamCohomology:DD.6/log-power-de-rham-descent`, `DerivedDeRhamCohomology:DD.6/log-quasisyntomic-sites`.

**Sources.** KY, §4.1, Proposition 4.8 (p. 35): Statement.

### Initial log prisms of semiperfectoid pre-log rings

Node `PR.8/initial-log-prism-qrsp` (theorem); implementation status `unchecked`.

Let S = (S, N) be a semiperfectoid integral pre-log ring and (R, M) → (S, N) a map from a perfectoid integral pre-log ring, surjective on rings and modulo units on monoids. Exactify M♭ → M → N as M♭ → M̃ → N and put A_inf(R, M̃) := A_inf(R) ⊗̂ Z_p⟨M̃⟩ with the bounded rank-1 prelog prism (A_inf(R, M̃), (ξ), M̃). Applying prismatic envelopes to A_inf(R, M̃) → S gives a prelog prism (Δ^init_{S/R}, (ξ), M^init_{S/R} := M̃) with S → Δ^init/ξ and an exact surjection onto (Δ^init/ξ, N)^a, and its perfection Δ^init_{S/R,perf}. (1) For every integral ''log prism'' (A, I, M_A) with S → A/I and an exact surjection (A, M_A) → (A/I, N → A/I)^a there is a unique compatible map (Δ^init_{S/R}, (ξ), M^init) → (A, I, M_A); similarly for the perfections among perfect A (resp. perfect log prisms). (2) If S is quasiregular semiperfectoid, Δ_{S/A_inf(R)} is discrete with a δ-structure, Δ_{S/A_inf(R)} ≅ Δ^init_{S/R}, the latter is bounded and independent of R, giving an initial ''log prism'' (Δ^init_S, (ξ), M^init_S) for the category of exact-surjection diagrams. (3) If S is semiperfectoid, Δ_{S/R,perf} is discrete, a perfect prism, and Δ_{S/A_inf(R),perf} ≅ Δ^init_{S,perf}. (4) If moreover N is semiperfect (N♭ → N surjective), the p-saturation S^{p-sat} is semiperfectoid and Δ_{S/R,perf} ≅ Δ_{S^{p-sat}/R,perf}.

**Hypotheses.** S semiperfectoid integral; R perfectoid integral; (R, M) → (S, N) surjective on rings and modulo units on monoids.

**Proof or construction outline.**

1. Universality (Proposition 4.14): from (A/ξ, M_A)^a ≅ (A/ξ, N → A/ξ)^a and initiality of A_inf (perfect-log-prisms-perfectoid) build the map, then use the universal property of envelopes.
2. (2) Proposition 4.17: Δ_{S/A_inf(R)} ≅ Δ_{S/(A_inf(R,M♭),M♭)} is discrete by Hodge–Tate and vanishing of Ω^1; compare with the envelope as in BS22 Proposition 7.10 (PR.2) using Lemma 4.18.
3. (3) Proposition 4.19: coconnectivity of perfection (BS22 Lemma 8.4, PR.2) and a variant of Lemma 4.20.
4. (4) Corollary 4.21: the monoid of a perfectoid log ring is p-saturated, so the universal perfectoid log ring over S is also universal over S^{p-sat}.

**Acceptance conditions.**

- S = O_C/p with trivial monoid: Δ^init = A_crys-type envelope; trivial-log case is BS22 §7.
- (4) is the key input of the Kummer-étale comparison: the φ-fixed points do not see p-saturation.

**Prerequisites.** `PrismaticCohomology:PR.8/perfect-log-prisms-perfectoid`, `PrismaticCohomology:PR.8/log-qrsp`, `PrismaticCohomology:PR.8/derived-vs-site`, `PrismaticCohomology:PR.8/delta-log-exactification`, `PrismaticCohomology:PR.8/derived-log-properties`, `PrismaticCohomology:PR.2`, `PrismaticCohomology:PR.0`.

**Sources.** KY, §4.3, Proposition 4.14 (p. 38): Universality. KY, §4.3, Proposition 4.17 (p. 39): Part (2). KY, §4.3, Corollary 4.21 (p. 41): Part (4).

## H. Nygaard, de Rham and Frobenius

### The log Nygaard filtration

Node `PR.8/log-nygaard-filtration` (construction); implementation status `unchecked`. Planet: **Log Nygaard filtration**.

Let (A, I, M_A) be an integral bounded prelog prism and write Δ^(1)_{(R,P)/(A,M_A)} := Δ_{(R,P)/(A,M_A)} ⊗̂^L_{A,φ_A} A. For a (p, I)-completely flat map of bounded prisms A_0 → A′_0 with ∆^(1)_{R/A_0} (p, I)-completely flat (Assumption 5.3), the Nygaard filtration is Fil^i_N Δ^(1)_{R/A_0} = {x : φ_{R/A_0}(x) ∈ I^iΔ_{R/A_0}} (Definition 5.5). For the log-free algebra (R, P) = (A/I⟨N^S⟩, M_A ⊕ N^S), choose a surjection M_A ⊕ N → M_A ⊕ N^S, exactify it (Construction 5.11) to obtain non-log prismatic cohomologies over the non-perfect base prisms Ã^•_∞ obtained by extracting p-power roots (Construction 5.9), and define Fil^i_N Δ^(1)_{(R,P)/(A,M_A)} as the totalisation of Fil^i_N Δ_{(A/I)^•/Ã^•_∞} ⊗̂^L_{Ã^•_∞,φ} Ã^•_∞ (Definition 5.13), independent of the choice; extend to Σ_{S,T} by Day convolution with BS22's Nygaard filtration. Left Kan extension gives the derived Nygaard filtration Fil^•_N Δ^{L,(1)}_{(R,P)/(A,M_A)} on all simplicial pre-log rings, with a filtered Frobenius φ: Fil^•_N Δ^{L,(1)} → I^•Δ^L and maps I ⊗ Fil^{•−1}_N → Fil^•_N; étale sheafification gives the global Nygaard filtration on Δ^{L,(1)}_{(X,M_X)/(A,M_A)} (Constructions 5.25–5.26). It is multiplicative.

**Hypotheses.** (A, I, M_A) integral bounded prelog prism; animated pre-log rings (DD.6).

**Proof or construction outline.**

1. Show Definition 5.5 agrees with BS22 §12's derived Nygaard filtration after flat base change (Proposition 5.7, PR.3).
2. Extract p-power roots of the monoid generators to reach exact surjections over Ã_∞ (Construction 5.9), and use Lemma 5.10 (Frobenius descent) and Lemma 5.12 (cosimplicial computation) to show the totalisation is independent of choices and has the right graded pieces.
3. Define on Σ_{S,T}, left Kan extend, sheafify; multiplicativity by Remark 5.20.

**Uses determining the interface.**

- Koshikawa–Yao II, Corollary 5.17 and Proposition 5.29: under Cartier type the Nygaard filtration is the I-adic filtration of Lη_IΔ with respect to the Beilinson t-structure.
- Koshikawa–Yao II, Corollary 5.35 and Lemma 9.8: Nygaard completeness and divided Frobenius bound torsion in the BKF and low-ramification applications.
- Koshikawa–Yao II, Proposition 8.3: the pole of Frobenius along φ^{-1}(ξ) is bounded via the Nygaard filtration.

**Planning API.**

- `LogNygaard.fil` (constructor; signature outstanding): The decreasing multiplicative filtration Fil^•_N Δ^{L,(1)}_{(R,P)/(A,M_A)} by (p, I)-complete objects.
- `LogNygaard.frobenius` (data; signature outstanding): The filtered Frobenius φ: Fil^i_N Δ^{L,(1)} → I^iΔ^L.
- `LogNygaard.mulI` (data; signature outstanding): The maps I ⊗^L Fil^{i−1}_N → Fil^i_N (Construction 5.21).
- `LogNygaard.mul` (structure; signature outstanding): Fil^i_N ⊗ Fil^j_N → Fil^{i+j}_N (Remark 5.20).
- `LogNygaard.free_eq_bs` (compatibility; signature outstanding): For trivial log structures, Fil^•_N is BS22's Nygaard filtration on Δ^(1) (PR.3).
- `LogNygaard.flatBaseChange` (functoriality; signature outstanding): Formation of Fil^•_N commutes with (p, I)-completely flat base change on A.
- `LogNygaard.sheaf` (constructor; signature outstanding): The global Nygaard filtration on Δ^{L,(1)}_{(X,M_X)/(A,M_A)} by étale sheafification.
- `LogNygaard.independent` (extensionality; signature outstanding): On log-free algebras the totalisation is independent of the chosen surjection M_A ⊕ N → M_A ⊕ N^S.

**Discriminating unit tests.**

- `LogNygaard.fil0` (degenerate; signature outstanding): Fil^0_N Δ^{L,(1)} = Δ^{L,(1)}.
- `LogNygaard.trivialLog` (compatibility; signature outstanding): For (R, P) = (A/I⟨X⟩, M_A) with trivial M_A, Fil^•_N agrees with BS22's Nygaard filtration on Δ^(1)_{R/A}.
- `LogNygaard.logLine_gr1` (computation; signature outstanding): For (R, P) = (A/I⟨N⟩, M_A ⊕ N), gr^1_N Δ^(1) ≅ τ_{≤1}Δ̄{1}, a two-term object with H^0 ≅ R{1} and H^1 ≅ R·dlog X.
- `LogNygaard.naive_fails` (non-example; signature outstanding): For KY's toy example over (A_inf, (ξ)) the naive filtration {x : φ(x) ∈ ξ^iΔ} on Δ^(1)_{(S,M)/(A,M_A)} differs from Fil^•_N (KY §5.1).
- `LogNygaard.frobenius_fil1` (characterisation; signature outstanding): φ(Fil^1_N) ⊂ IΔ and the induced map gr^0_N → Δ̄ is the inclusion of Fil_0 Δ̄ = (derived) R.

**Acceptance conditions.**

- For trivial M_A and P the construction recovers BS22's Nygaard filtration (PR.3).
- The naive condition φ(x) ∈ I^iΔ on Δ^(1)_{(S,M)/(A,M_A)} for log QRSP S does not give the right filtration (KY §5.1 toy example).

**Prerequisites.** `PrismaticCohomology:PR.8/derived-log-prismatic`, `PrismaticCohomology:PR.8/derived-log-hodge-tate`, `PrismaticCohomology:PR.8/delta-log-exactification`, `PrismaticCohomology:PR.8/cech-alexander-log`, `PrismaticCohomology:PR.3`.

**Sources.** KY, §5.4, Definition 5.13 (p. 49): Definition on log-free algebras. KY, §5.5 (p. 50): Derived filtration. KY, §1 (p. 5): Why the naive definition fails.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/Nygaard`, namespace `TauCeti.LogPrismatic`.

### Graded pieces of the log Nygaard filtration

Node `PR.8/log-nygaard-graded` (theorem); implementation status `unchecked`.

Let (A, I, M_A) be an integral bounded prelog prism and (R, P) a simplicial pre-log ring over (A/I, M_A). The Frobenius induces an isomorphism gr^i_N Δ^{L,(1)}_{(R,P)/(A,M_A)} ≅ Fil_i Δ̄^L_{(R,P)/(A,M_A)}{i}, where Fil_i is the conjugate filtration. For Σ_{S,T} this reads gr^i_N Δ^(1)_{Σ_{S,T}} ≅ τ_{≤i}Δ̄_{Σ_{S,T}}{i}; globally gr^i_N Δ^{L,(1)}_{(X,M_X)} ≅ Fil_i Δ̄^L_{(X,M_X)}{i}, and for (X, M_X) smooth over (A/I, M_A), gr^•_N Δ^(1)_{(X,M_X)/(A,M_A)} ≅ τ_{≤•}Δ̄_{(X,M_X)/(A,M_A)}{•}.

**Hypotheses.** As in log-nygaard-filtration; smoothness for the last assertion.

**Proof or construction outline.**

1. Proposition 5.14 on Σ_{S,T}: commutative square relating Fil^i_N → I^iΔ and gr^i_N → Δ̄{i}, with the bottom map an isomorphism onto τ_{≤i}.
2. Derive (5.12) and sheafify (Corollary 5.27); identify Fil_i with τ_{≤i} in the smooth case (derived-vs-site).

**Acceptance conditions.**

- i = 0: gr^0_N ≅ Fil_0 Δ̄ = R.
- Trivial log structures: BS22 Theorem 15.2 (PR.3).

**Prerequisites.** `PrismaticCohomology:PR.8/log-nygaard-filtration`, `PrismaticCohomology:PR.8/derived-log-hodge-tate`, `PrismaticCohomology:PR.8/derived-vs-site`, `PrismaticCohomology:PR.3`.

**Sources.** KY, §5, Theorem 5.1 (p. 42): Statement. KY, §5.6, Corollary 5.27 (p. 54): Smooth global form.

### The Nygaard–Hodge fibre sequence and Nygaard completeness

Node `PR.8/nygaard-hodge-fiber-sequence` (theorem); implementation status `unchecked`.

For a simplicial pre-log ring (R, P) over (A/I, M_A) there is a functorial fibre sequence I ⊗^L_A Fil^{•−1}_N Δ^{L,(1)} → Fil^•_N Δ^{L,(1)} → Fil^•_H LΩ̂_{(R,P)/(A/I,M_A)} of filtered objects, the second map being the derived de Rham specialisation γ^• (Construction 5.21, Lemma 5.22). Globally on X_ét it holds with the p-complete étale sheafified Hodge-filtered derived log de Rham complex. If (X, M_X) is smooth over (A/I, M_A) with mod p fibre of Cartier type, the right term becomes Ω^{≥•}_{(X,M_X)/(A/I,M_A)}; if moreover X is qcqs and Ω^1_log has finite rank D, then for i ≥ 0 and j ≥ D the maps RΓ(Fil^j_N Δ^(1)) ⊗^L I^i → RΓ(Fil^{i+j}_N Δ^(1)) are isomorphisms and RΓ(X_ét, Δ^(1)) is complete for the Nygaard filtration.

**Hypotheses.** Derived log de Rham with Hodge filtration from DD.6; Cartier type and finite rank for the last assertions.

**Proof or construction outline.**

1. Construct γ^•: Fil^•_N Δ^{L,(1)} → Fil^•_H LΩ̂ on log-free algebras (Lemma 5.22, compatible with BL Proposition 5.2.3 when monoids are trivial).
2. Prove the fibre sequence on Σ_{S,T} as in Bhatt–Lurie Proposition 5.2.8 and derive (Proposition 5.24).
3. Globalise (Corollary 5.33); under Cartier type identify LΩ̂ with Ω^• (Remark 5.34, via the log Cartier isomorphism of DD.6).
4. Corollary 5.35: periodicity for j ≥ D, then completeness since Fil^D_N becomes the I-adic filtration.

**Acceptance conditions.**

- i = 0: Fil^0 gives Δ^(1) → LΩ̂, the de Rham specialisation.
- Trivial log: BL Proposition 5.2.8 (PR.5).

**Prerequisites.** `PrismaticCohomology:PR.8/log-nygaard-filtration`, `PrismaticCohomology:PR.8/log-nygaard-graded`, `DerivedDeRhamCohomology:DD.6`, `PrismaticCohomology:PR.5`.

**Sources.** KY, §5.5, Proposition 5.24 (p. 52): Fibre sequence. KY, §5.6, Corollary 5.35 (p. 58): Completeness.

### The Lη_I factorisation of Frobenius

Node `PR.8/log-l-eta-factorization` (theorem); implementation status `unchecked`.

Let (A, I, M_A) be bounded with M_A integral. (1) If (R, P) is p-complete with bounded p^∞-torsion and M_A → P a smooth chart, then gr^i_N Δ^{L,(1)} ≅ τ_{≤i}Δ̄^L{i} and the Frobenius factors as Δ^L ⊗̂^L_{A,φ} A = Δ^{L,(1)} → Lη_IΔ^L → Δ^L; if M_A → P is of Cartier type, Δ^{L,(1)} → Lη_IΔ^L is an isomorphism identifying the Nygaard filtration with the truncations of the I-adic filtration for the Beilinson t-structure. (2) For (X, M_X) smooth over (A/I, M_A), U ↦ Lη_I(Δ_{(X,M_X)}(U)) is a sheaf on the affine étale site, defining Lη_IΔ_{(X,M_X)/(A,M_A)}; if the mod p fibre is of Cartier type, Frobenius induces an isomorphism of étale sheaves Δ^(1)_{(X,M_X)/(A,M_A)} ≅ Lη_IΔ_{(X,M_X)/(A,M_A)}, and RΓ_Δ((U, M_U)/(A, M_A))^(1) ≅ Lη_I RΓ_Δ((U, M_U)/(A, M_A)) for affine U.

**Hypotheses.** Smooth charts; Cartier type of the chart (1) or of the mod p fibre (2); Lη_I as supplied by AI.1 through PR.3.

**Proof or construction outline.**

1. Factorisation from BMS2 Proposition 5.8 as in BS22 Theorem 15.3 (PR.3) using gr^i_N ≅ τ_{≤i}.
2. Isomorphism under Cartier type: check mod I; Lη_IΔ/I is the log de Rham complex (BMS1 Proposition 6.12 and Hodge–Tate), equal under Cartier type to derived log de Rham (Bhatt 7.6 log version; DD.6); reduce to log-free algebras with M_A trivial, then to the universal oriented prism and to (Z_p, (p)) (BS22 Construction 6.1), where it is the log crystalline comparison compatible with the Cartier isomorphism.
3. Global: Lemma 5.28 (sheaf property) and Proposition 5.29.

**Acceptance conditions.**

- Log affine line over (Z_p, (p), trivial): the factorisation is the log Cartier isomorphism.
- Trivial log: BS22 Theorem 15.3 (PR.3).

**Prerequisites.** `PrismaticCohomology:PR.8/log-nygaard-graded`, `PrismaticCohomology:PR.8/log-crystalline-comparison`, `PrismaticCohomology:PR.8/derived-vs-site`, `PrismaticCohomology:PR.3`, `DerivedDeRhamCohomology:DD.6`.

**Sources.** KY, §5.5, Corollary 5.17 (p. 51): Local. KY, §5.6, Proposition 5.29 (p. 55): Global.

### The log de Rham comparison

Node `PR.8/log-de-rham-comparison` (theorem); implementation status `unchecked`.

(1) If P → R is a smooth chart of Cartier type over (A/I, M_A), Δ^L_{(R,P)/(A,M_A)} ⊗̂^L_{A,φ} A/I ≅ Ω̂^•_{(R,P)/(A/I,M_A)} as E_∞-algebras in D(A/I). (2) For every simplicial pre-log ring (R, P) over (A/I, M_A), Δ^L ⊗̂^L_{A,φ} A/I ≅ LΩ̂_{(R,P)/(A/I,M_A)} (p-completed derived log de Rham). (3) For (X, M_X) smooth over (A/I, M_A) with mod p fibre of Cartier type, Δ_{(X,M_X)/(A,M_A)} ⊗̂^L_{A,φ_A} A/I ≅ Ω^•_{(X,M_X)/(A/I,M_A)} as étale sheaves, and for qcqs X, RΓ_logdR((X, M_X)/(A/I, M_A)) ≅ RΓ_Δ((X, M_X)/(A, M_A)) ⊗̂^L_{A,φ_A} A/I as E_∞-A-algebras.

**Hypotheses.** Cartier type of the chart or of the mod p fibre; (A, I, M_A) bounded with M_A integral.

**Proof or construction outline.**

1. (1) is the mod I reduction of the Lη_I isomorphism (log-l-eta-factorization) combined with Hodge–Tate (it is shown in the proof of Corollary 5.17).
2. (2) Derive (1) on log-free algebras (Remark 5.19), using the fibre sequence at Fil^0.
3. (3) Reduce Proposition 5.29 mod I (Corollary 5.30).

**Acceptance conditions.**

- (A, I) = (W(k)[[u]], (E)): base change to the PD envelope S and specialisation recovers K1 footnote 7's route.
- Trivial log: BS22 Theorem 1.8(3) (PR.1).

**Prerequisites.** `PrismaticCohomology:PR.8/log-l-eta-factorization`, `PrismaticCohomology:PR.8/nygaard-hodge-fiber-sequence`, `PrismaticCohomology:PR.8/log-hodge-tate-comparison`, `DerivedDeRhamCohomology:DD.6/log-derived-de-rham`, `DerivedDeRhamCohomology:DD.6/log-smooth-cartier-comparison`.

**Sources.** KY, §5.5, Corollary 5.18 (p. 51): Local. KY, §1, Theorem 2(4) (p. 3): Global.

### Frobenius is an isogeny

Node `PR.8/log-frobenius-isogeny` (theorem); implementation status `unchecked`.

Let (X, M_X) be smooth over (A/I, M_A) with mod p fibre of Cartier type. For each i ≥ 0 there are natural maps V_i: τ_{≤i}Δ_{(X,M_X)/(A,M_A)} ⊗^L_A I^i → τ_{≤i}Δ^(1)_{(X,M_X)/(A,M_A)} with φ∘V_i and V_i∘(φ ⊗ 1) equal to the maps induced by I^i ⊂ A. If X is qcqs, V_i: H^i_Δ((X, M_X)/(A, M_A)) ⊗_A I^i → H^i(RΓ_Δ ⊗̂^L_{A,φ_A} A) inverts Frobenius up to I^i; for I = (d) principal, φ∘V_i = V_i∘φ = d^i. If Ω^1_log has finite rank D, a single V inverts φ up to I^D; in particular the linearised Frobenius RΓ_Δ ⊗̂^L_{A,φ_A} A → RΓ_Δ becomes an isomorphism after inverting I.

**Hypotheses.** Mod p fibre of Cartier type; qcqs for the global maps; finite rank D for the uniform bound.

**Proof or construction outline.**

1. From Proposition 5.29 apply BMS1 Lemma 6.9 (Lη_I has an inverse up to I^i on τ_{≤i}, via AI.1) as in BS22 Corollary 15.5 (PR.3).
2. Take cohomology for the global maps (Corollary 5.31); uniform bound by Remark 5.32.

**Acceptance conditions.**

- Over (Z_p[[q − 1]], ([p]_q)) this recovers K1 Remark 7.18's inverse up to [p]_q^r.
- Trivial log: BS22 Corollary 15.5 (PR.3).

**Prerequisites.** `PrismaticCohomology:PR.8/log-l-eta-factorization`, `PrismaticCohomology:PR.3`.

**Sources.** KY, §5.6, Corollary 5.31 (p. 56–57): Statement. KY, §1, Theorem 2(6) (p. 3): Global form.

## I. Affine Kummer-étale realization

### The Kummer étale site of an fs log scheme

Node `PR.8/kummer-etale-site-log-scheme` (definition); implementation status `unchecked`.

A homomorphism of fs monoids h: P → Q is of Kummer type if it is injective and every a ∈ Q has a power a^n (n ≥ 1) in h(P); a morphism f: X → Y of fs log schemes is of Kummer type if M_{Y,f(x)}/O^× → M_{X,x}/O^× is of Kummer type for every x. For an fs log scheme X, the Kummer étale site X_két is the category (fs/X) (or its small variant of Kummer étale X-schemes) with coverings the families {f_i: U_i → X} of log étale morphisms of Kummer type with X = ∪ f_i(U_i); RΓ_két(X, Λ) is its cohomology. For a pre-log ring (R[1/p], P) with P saturated (not necessarily fine), RΓ_két(Spec(R[1/p], P)^a, Λ) := colim_{P_i ⊂ P} RΓ_két(Spec(R[1/p], P_i)^a, Λ), over fine saturated submonoids P_i (a filtered colimit). Standard covers: for P → Q of Kummer type with Q fs, Spec(R ⊗_{Z[P]} Z[Q], Q)^a → Spec(R, P)^a is a Kummer étale cover when the index is invertible on R.

**Hypotheses.** fs log schemes (CR.5); Kummer-étale coverings are log étale (Kato) and of Kummer type.

**Proof or construction outline.**

1. Define Kummer-type monoid maps and morphisms (Kato II Definitions 2.1–2.2).
2. Show coverings are stable under fs base change and composition (Kato II Lemma 2.4, Nakayama 2.2.2) so they define a Grothendieck topology (Kato II Definition 2.3 (i)′).
3. Define RΓ_két and the colimit extension to saturated monoids (KY §6).

**Uses determining the interface.**

- Koshikawa–Yao II, Theorem 6.1: the affine étale comparison computes RΓ_két(Spec(R[1/p], P)^a, Z/p^n).
- Koshikawa–Yao II, Corollary 7.23 and Theorem 7.25: the quasi-pro-Kummer-étale site of the log diamond maps to it and computes the same cohomology.
- Koshikawa–Yao II, Lemma 6.5: for fs pre-log rings of finite type it agrees with Kummer-étale cohomology of the log adic space (T6:log-sites).

**Planning API.**

- `KummerEtale.IsKummerType` (other; typed form, proof admitted): Kummer type for maps of fs monoids and morphisms of fs log schemes.
- `KummerEtale.site` (constructor; signature outstanding): The Kummer étale site X_két of an fs log scheme.
- `KummerEtale.cohomology` (constructor; signature outstanding): RΓ_két(X, Λ) for a torsion abelian group Λ, and its colimit extension to saturated charts.
- `KummerEtale.standardCover` (example; signature outstanding): For P → Q of Kummer type with index invertible, Spec(R ⊗_{Z[P]} Z[Q], Q)^a → Spec(R, P)^a is a covering.
- `KummerEtale.trivialLog` (compatibility; signature outstanding): For trivial log structure X_két ≃ X_ét.
- `KummerEtale.baseChange` (functoriality; signature outstanding): Kummer étale covers are stable under fs base change; morphisms of fs log schemes induce morphisms of sites.
- `KummerEtale.toLogEtale` (relation; signature outstanding): For constant torsion Λ, Kummer étale and full log étale cohomology agree (Nakayama II Proposition 5.4, KY Remark 6.3).

**Discriminating unit tests.**

- `KummerEtale.trivialLog_eq` (compatibility; signature outstanding): For X with trivial log structure, RΓ_két(X, Λ) = RΓ_ét(X, Λ).
- `KummerEtale.kummerType_nat` (computation; typed form, proof admitted): For n ≥ 1, N → N, 1 ↦ n is of Kummer type; at n = 0 it is not injective. The diagonal N → N^2, 1 ↦ (1,1) is not of Kummer type (not every element has a positive multiple in the image).
- `KummerEtale.empty` (degenerate; signature outstanding): The empty family covers the empty log scheme.
- `KummerEtale.not_etale` (non-example; signature outstanding): For n > 1 and K algebraically closed of characteristic 0 and the log point X = Spec(K, N → 0)^a, H^1_két(X, Z/n) ≅ Z/n(−1) ≠ 0 = H^1_ét(Spec K, Z/n): Kummer étale cohomology is not étale cohomology of the underlying scheme.

**Acceptance conditions.**

- For trivial log structure X_két is X_ét.
- For K algebraically closed of characteristic 0, the log point Spec(K, N → 0)^a has H^1_két(−, Z/n) ≅ Z/n(−1) (its Kummer covers adjoin n-th roots of the log generator), while Spec K has no étale H^1.

**Prerequisites.** `mathlib:CategoryTheory.GrothendieckTopology`, `CrystallineCohomology:CR.5:log-algebra/fine-monoid`, `CrystallineCohomology:CR.5:log-algebra/saturated-monoid`, `CrystallineCohomology:CR.5:log-algebra/kummer-morphism`.

**Sources.** KatoII, §2, Definition 2.1 (p. 6): Kummer type. KatoII, §2, Definition 2.3 (p. 7): Coverings (log étale variant (i)′: log étale and of Kummer type). KY, §6, after Theorem 6.1 (p. 59): Saturated extension.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/Etale`, namespace `TauCeti.LogPrismatic`.

### Kummer étale cohomology of log schemes and of log adic spaces

Node `PR.8/log-scheme-vs-log-adic-kummer` (lemma); implementation status `unchecked`.

Let Λ = Z/nZ and (R, P) a classically p-complete fs pre-log ring with R topologically finitely generated over a noetherian ring A_0. With X = Spec(R[1/p], P)^a and X^ad = (Spa(R[1/p], R), P)^a the associated fs log adic space (Diao–Lan–Liu–Zhu), there is a natural isomorphism RΓ_két(X, Λ) ≅ RΓ_két(X^ad, Λ).

**Hypotheses.** Fs pre-log ring; R topologically of finite type over a noetherian base; Spa(R[1/p], R) is then an adic space.

**Proof or construction outline.**

1. With ε: X → X̊ and ε^ad: X^ad → X̊^ad the maps to underlying (adic) spaces, by Huber Corollary 3.2.3 and Grothendieck–Serre it suffices that R^iε^ad_*Λ ≅ f^*R^iε_*Λ for f: X̊^ad → X̊.
2. Both sides are ∧^i(M^gp/nM^gp)(−i): DLLZ (4.4.28), Lemma 4.4.29 on the adic side (T6:log-sites) and Kato–Nakayama Theorem 2.4 on the scheme side.

**Acceptance conditions.**

- For P trivial this is Huber's comparison of étale cohomology of Spec(R[1/p]) and its adic analytification.
- For (Z_p⟨T⟩, T^N) both sides compute the Kummer étale cohomology of the punctured-disc log structure.

**Prerequisites.** `PrismaticCohomology:PR.8/kummer-etale-site-log-scheme`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-adic-space`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-higher-direct-images`.

**Sources.** KY, §6, Lemma 6.5 (p. 60): Statement.

### The affine Kummer-étale comparison

Node `PR.8/affine-kummer-etale-comparison` (theorem); implementation status `unchecked`.

Let (A, I = (d)) be a perfect prism with I ≠ (p), and (R, P) a p-adically complete pre-log A/I-algebra with P saturated and R of bounded p^∞-torsion. For each n ≥ 1 there is a canonical isomorphism RΓ_két(Spec(R[1/p], P)^a, Z/p^n) ≅ (Δ^L_{(R,P)/A}[1/d]/p^n)^{φ=1}, functorial in (R, P), where (−)^{φ=1} is the derived fibre of φ − 1. The base prism may be replaced by any perfect log prism, or by a pre-log prism with (A/I, M_A) perfectoid or pseudo-perfectoid (derived-log-properties (5)); the left side may equally be the full log étale cohomology.

**Hypotheses.** Perfect prism, I ≠ (p) (both sides vanish for I = (p)); P saturated; bounded p^∞-torsion.

**Proof or construction outline.**

1. Descendability (§6.1, Lemma 6.6, Corollary 6.7): the cover (R, P) → (R_∞, P_∞) adjoining p-power roots of coordinates and monoid elements makes the log prismatic side satisfy descent.
2. Construct the comparison map on the Čech nerve (R^•_∞, P^•_∞) (Construction 6.12) and pass to saturated Čech nerves: by initial-log-prism-qrsp (4) the φ-fixed points of perfected log prismatic cohomology do not change under p-saturation (Proposition 6.13, Lemmas 6.17–6.18).
3. On saturated perfectoid terms with divisible monoids, Kummer étale cohomology is étale cohomology of R^{i,sat}_∞[1/p] (Lemma 6.9–6.10, Corollary 6.11) and log prismatic cohomology is non-log (derived-log-properties (5)); apply the non-log étale comparison for perfect prisms (BS22 Theorem 9.1, PR.4).
4. Kummer-étale descent along Spec(R_∞[1/p], P_∞)^a → Spec(R[1/p], P)^a (Proposition 6.13); the log affine line is treated explicitly (Proposition 6.16).

**Acceptance conditions.**

- For P trivial this is BS22's étale comparison Theorem 9.1 for perfect prisms (PR.4).
- For (A_inf⟨N⟩, N) (the log affine line over O_C) the comparison computes RΓ_két of the punctured log disc with H^1 = Z/p^n(−1) from Kummer covers (Proposition 6.16).

**Prerequisites.** `PrismaticCohomology:PR.8/kummer-etale-site-log-scheme`, `PrismaticCohomology:PR.8/derived-log-prismatic`, `PrismaticCohomology:PR.8/derived-log-properties`, `PrismaticCohomology:PR.8/initial-log-prism-qrsp`, `PrismaticCohomology:PR.8/log-quasisyntomic-descent`, `PrismaticCohomology:PR.4/etale-comparison`, `PrismaticCohomology:PR.4/etale-comparison-coefficients`.

**Sources.** KY, §6, Theorem 6.1 (p. 59): Statement. KY, §1 (p. 6): Key step.

## J. Log diamonds and coefficient objects

### Log diamonds

Node `PR.8/log-diamond` (definition); implementation status `unchecked`.

A log (locally spatial) diamond over Q_p is a (locally spatial) diamond Y with a map Y → Spd Q_p and a log structure M_Y → Ô_Y on the quasi-pro-étale site Y_qproét, where Ô_Y and Ô^+_Y are the completed structure sheaves (for affinoid perfectoid Y′ = Spa(R, R^+) quasi-pro-étale over Y with untilt (R^♯, R^{♯+}), Ô_Y(Y′) = R^♯). A chart is P → Γ(Y_qproét, M_Y) inducing P^a ≅ M_Y and factoring through Ô^+_Y; (Y, M_Y) is quasi-coherent (integral, saturated, fine, fs) if such charts exist quasi-pro-étale locally. Maps are assumed to have compatible charts locally (Convention 7.5). Saturation exists for quasi-coherent log diamonds (via perfectoidisation of R^+ ⊗_{Z[P]} Z[P^sat]) and fibre products exist among saturated quasi-coherent (resp. fs) log diamonds; from now on fibre products are saturated fibre products ×^sat.

**Hypotheses.** Diamonds, locally spatial diamonds and quasi-pro-étale maps as supplied by DiamondsAndVStacks D4 and DiamondEtaleCohomology C0.

**Proof or construction outline.**

1. Define the structure sheaves (Mann–Werner) and log structures on Y_qproét.
2. Lemma 7.7: for affinoid perfectoid X with chart P → Γ(Ô^+), the saturation is Spa of the perfectoidisation of R^+ ⊗_{Z_p[P]} Z_p[P^sat] (BS22 Theorem 1.17(1), via PerfectoidQuotients Q2).
3. Corollary 7.8: glue along a quasi-pro-étale presentation by affinoid perfectoids with pro-étale equivalence relation (Scholze Proposition 11.8), spatiality via Proposition 11.24.
4. Corollary 7.9: fibre products as saturations of diamond fibre products.

**Uses determining the interface.**

- Koshikawa–Yao II, Definition 7.18: the quasi-pro-Kummer-étale site is defined on saturated quasi-coherent log diamonds.
- Koshikawa–Yao II, Theorem 7.30: the generic fibre of a log formal scheme is taken as a log diamond because the pre-adic generic fibre need not be sheafy.
- Koshikawa–Yao II, Theorem 7.36: Z_p-local systems on the log diamond generic fibre correspond to Laurent F-crystals.

**Planning API.**

- `LogDiamond` (constructor; signature outstanding): A diamond Y → Spd Q_p with a log structure M_Y → Ô_Y on Y_qproét.
- `LogDiamond.chart` (data; signature outstanding): Charts P → Γ(Y_qproét, M_Y) factoring through Ô^+_Y, with integral/saturated/fine/fs variants.
- `LogDiamond.IsQuasiCoherent` (other; signature outstanding): Existence of charts quasi-pro-étale locally (with integral, saturated, fine, fs variants).
- `LogDiamond.saturation` (universal-property; signature outstanding): A quasi-coherent log diamond admits a saturation map (Y^sat, M_Y^sat) → (Y, M_Y), terminal among maps from saturated quasi-coherent log diamonds to (Y, M_Y).
- `LogDiamond.satFiberProduct` (structure; signature outstanding): Saturated fibre products exist among saturated quasi-coherent (resp. fs) log diamonds.
- `LogDiamond.ofLogAdicSpace` (coercion; signature outstanding): An fs log adic space (DLLZ, from T6:log-sites), locally noetherian or perfectoid, gives an fs log diamond (X, M_X)^♦.

**Discriminating unit tests.**

- `LogDiamond.trivial` (degenerate; signature outstanding): Y with M_Y = Ô_Y^× is a saturated quasi-coherent log diamond and its saturation is itself.
- `LogDiamond.disc` (computation; signature outstanding): (Spd(Q_p⟨T⟩, Z_p⟨T⟩), T^N)^a is an fs log diamond with chart N → Ô^+, 1 ↦ T.
- `LogDiamond.compat_logAdic` (compatibility; signature outstanding): For an fs log adic space from T6:log-sites, the associated log diamond has the log structure induced by ν^{-1} of the étale log structure (KY Example 7.6).
- `LogDiamond.not_naive_product` (non-example; signature outstanding): For n > 1, take the log n-th-root cover of the disc over an algebraically closed complete C. Its ordinary diamond self-product has branches meeting over T = 0; its saturated log self-product is the disjoint union of n copies of the root disc after choosing μ_n(C). Over Q_p this splitting is asserted only after this geometric base change.

**Acceptance conditions.**

- An fs log adic space (DLLZ) over Spa(Q_p, Z_p), locally noetherian or perfectoid, gives an fs log diamond (X, M_X)^♦ (Example 7.6).
- A diamond with trivial log structure Ô^× is a saturated quasi-coherent log diamond.

**Prerequisites.** `DiamondsAndVStacks:D4`, `DiamondEtaleCohomology:C0`, `PerfectoidQuotients:Q2`, `CrystallineCohomology:CR.5:log-algebra`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/log-adic-space`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site`, `HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-higher-direct-images`.

**Sources.** KY, §7.2, Definition 7.3 (p. 72): Definition. KY, §7.2, Corollary 7.9 (p. 73): Fibre products.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/LogDiamond`, namespace `TauCeti.LogPrismatic`.

### The log diamond generic fibre

Node `PR.8/log-diamond-generic-fibre` (construction); implementation status `unchecked`.

For a pre-log Huber pair (R, R^+) over (Q_p, Z_p) with a monoid map P → R^+, (Spd(R, R^+), P)^a denotes the associated log diamond (log structure associated with P → Ô^+). For an fs log p-adic formal scheme (X, M_X) over Z_p, its diamond generic fibre X^♦_η → Spd Q_p carries the fs log structure induced by M_X, giving the log diamond (X, M_X)^♦_η, functorial in (X, M_X); for p-complete (R, P) with bounded p^∞-torsion it is (Spd(R[1/p], R^+), P)^a with R^+ the integral closure of R. The underlying pre-adic space Spa(R[1/p], R^+) need not be sheafy; the log diamond always exists.

**Hypotheses.** Fs log p-adic formal schemes; diamonds of Huber pairs via DiamondsAndVStacks D6.

**Proof or construction outline.**

1. Use Spd of Huber pairs (D6) and the induced log structure on the quasi-pro-étale site.
2. Functoriality: maps of charts induce maps of log diamonds (Convention 7.5); glue over affine covers.

**Uses determining the interface.**

- Koshikawa–Yao II, Theorem 7.30: global étale comparison computes the quasi-pro-Kummer-étale cohomology of (X, M_X)^♦_η.
- Koshikawa–Yao II, Theorem 7.36 and Proposition 7.38: local systems and smooth proper pushforward live on log diamond generic fibres.

**Planning API.**

- `LogDiamond.genericFibre` (constructor; signature outstanding): (X, M_X) ↦ (X, M_X)^♦_η for fs log p-adic formal schemes.
- `LogDiamond.ofHuberPair` (constructor; signature outstanding): (Spd(R, R^+), P)^a for a pre-log Huber pair.
- `LogDiamond.genericFibre_map` (functoriality; signature outstanding): Functoriality in maps of fs log p-adic formal schemes, compatible with composition.
- `LogDiamond.genericFibre_trivial` (compatibility; signature outstanding): For trivial M_X, the underlying diamond is X^♦_η with trivial log structure.
- `LogDiamond.genericFibre_affine` (characterisation; signature outstanding): For X = Spf(R) with fs chart P, (X, M_X)^♦_η ≅ (Spd(R[1/p], R^+), P)^a.

**Discriminating unit tests.**

- `LogDiamond.genericFibre_point` (degenerate; signature outstanding): For (Spf Z_p, trivial) the generic fibre is Spd Q_p with trivial log structure.
- `LogDiamond.genericFibre_disc` (computation; signature outstanding): For (Spf Z_p⟨T⟩, T^N)^a the generic fibre is (Spd(Q_p⟨T⟩, Z_p⟨T⟩), T^N)^a.
- `LogDiamond.genericFibre_ok_nonsheafy` (characterisation; signature outstanding): For p-complete R with bounded p^∞-torsion whose Spa(R[1/p], R^+) is not sheafy, (Spd(R[1/p], R^+), P)^a still exists as a log diamond.
- `LogDiamond.genericFibre_not_complement` (non-example; signature outstanding): The log diamond generic fibre of (Spf Z_p⟨T⟩, T^N) is not the punctured disc: its underlying diamond contains T = 0; only its Kummer-étale cohomology sees the puncture.

**Acceptance conditions.**

- For trivial M_X this is the diamond generic fibre X^♦_η.
- For (Z_p⟨T⟩, T^N) one gets the disc with log structure along T = 0.

**Prerequisites.** `PrismaticCohomology:PR.8/log-diamond`, `DiamondsAndVStacks:D6`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources.** KY, §7.2, Example 7.6 (p. 72): Construction. KY, §1, footnote 5 (p. 3): Why diamonds.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/LogDiamond`, namespace `TauCeti.LogPrismatic`.

### Strictly totally disconnected log perfectoid spaces

Node `PR.8/stdisc-log-perfectoid` (definition); implementation status `unchecked`.

A strictly totally disconnected log perfectoid space is a strictly totally disconnected perfectoid space X (qcqs, every étale cover splits) with a saturated quasi-coherent log structure M_X such that M_X/M_X^× is uniquely divisible; then X is affinoid perfectoid and Γ(X, M_X) is saturated and divisible. For such X, H^1(X, Ô_X^×) = 0 for the pro-étale topology, so Γ(X, M_X) → Γ(X, M_X/M_X^×) is surjective for any integral quasi-coherent M_X; it suffices that M_X be divisible, and (X, P)^a is such a space for any divisible saturated P → Γ(X, Ô^+_X).

**Hypotheses.** Strictly totally disconnected perfectoid spaces as in DiamondsAndVStacks D1.

**Proof or construction outline.**

1. Lemma 7.11: pro-étale (even v-) vector bundles on perfectoid spaces descend to étale ones (Kedlaya–Liu, Scholze–Weinstein 17.1.8), and line bundles on strictly totally disconnected spaces are trivial; lifts of sections of M/M^× form an Ô^×-torsor.
2. Remark 7.13: M/M^× sharp saturated and divisible ⇒ uniquely divisible.

**Uses determining the interface.**

- Koshikawa–Yao II, Definition 7.14: quasi-pro-Kummer-étale maps are tested by pullback to strictly totally disconnected log perfectoid spaces.
- Koshikawa–Yao II, Proposition 7.22: maps from fs monoids extend through Kummer extensions into Γ(X, M_X) by divisibility.

**Planning API.**

- `LogPerfectoid.IsStrictlyTotallyDisconnected` (other; signature outstanding): The defining condition: X strictly totally disconnected, M_X saturated quasi-coherent, M_X/M_X^× uniquely divisible.
- `LogPerfectoid.h1_units` (other; signature outstanding): H^1_proét(X, Ô_X^×) = 0 for X strictly totally disconnected.
- `LogPerfectoid.sections_surjective` (characterisation; signature outstanding): Γ(X, M_X) → Γ(X, M_X/M_X^×) is surjective.
- `LogPerfectoid.of_divisible` (constructor; signature outstanding): (X, P)^a for P divisible saturated with P → Γ(X, Ô^+_X).
- `LogPerfectoid.divisible_iff` (characterisation; signature outstanding): It suffices that M_X be divisible (Remark 7.13).

**Discriminating unit tests.**

- `LogPerfectoid.trivial` (degenerate; signature outstanding): Any strictly totally disconnected perfectoid space with trivial log structure is a strictly totally disconnected log perfectoid space.
- `LogPerfectoid.rational_monoid` (computation; signature outstanding): For C algebraically closed, the chart Q_{≥0} → O_C sending 0 ↦ 1 and every a > 0 to 0 on Spa(C,O_C) gives a strictly totally disconnected log perfectoid space: its characteristic monoid is Q_{≥0}, which is uniquely divisible.
- `LogPerfectoid.not_fs` (non-example; signature outstanding): On Spa(C,O_C), the chart N → O_C with 0 ↦ 1 and every n > 0 mapping to 0 gives characteristic monoid N, so the log perfectoid space is not strictly totally disconnected as a log space. In contrast, 1 ↦ p gives trivial associated log structure on Ô = C, hence is not this non-example.
- `LogPerfectoid.compat_D1` (compatibility; signature outstanding): The underlying perfectoid space is strictly totally disconnected in the sense of DiamondsAndVStacks D1.

**Acceptance conditions.**

- (X, Q_{≥0}) for X strictly totally disconnected and P = Q_{≥0} → Ô^+ via T^{Q≥0}.
- With trivial log structure every strictly totally disconnected perfectoid space qualifies.

**Prerequisites.** `DiamondsAndVStacks:D1`, `PrismaticCohomology:PR.8/log-diamond`.

**Sources.** KY, §7.3, Definition 7.12 (p. 74): Definition. KY, §7.3, Lemma 7.11 (p. 73): Key lemma.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/LogDiamond`, namespace `TauCeti.LogPrismatic`.

### The quasi-pro-Kummer-étale site

Node `PR.8/quasi-pro-kummer-etale-site` (definition); implementation status `unchecked`.

A locally separated map f: (Y′, M_{Y′}) → (Y, M_Y) of saturated quasi-coherent log diamonds is quasi-pro-Kummer-étale (resp. Kummer-étale, finite Kummer-étale) if for every map (X, M_X) → (Y, M_Y) from a strictly totally disconnected log perfectoid space, Y′ ×^sat_Y X is a perfectoid space and (Y′ ×_Y X, M) → (X, M_X) is strict and pro-étale (resp. étale, finite étale); it is surjective if each such pullback is surjective. The quasi-pro-Kummer-étale site (Y, M_Y)_qpkét consists of quasi-pro-Kummer-étale maps to (Y, M_Y) with jointly surjective coverings. Strict maps are quasi-pro-Kummer-étale iff the underlying map is quasi-pro-étale; the classes are stable under pullback and composition and satisfy cancellation in the following direction: if g and g∘f belong to the class, then f belongs to the class (no unrestricted two-out-of-three assertion); maps of log diamonds induce morphisms of sites.

**Hypotheses.** Saturated quasi-coherent log diamonds; locally separated maps (as in Scholze).

**Proof or construction outline.**

1. Define via pullback to strictly totally disconnected log perfectoid spaces.
2. Proposition 7.16: strict case, pullback, composition (as Scholze Proposition 10.4(i)), cancellation.
3. Definition 7.17: surjectivity, stable under base change and composition; Definition 7.18 the site; Remark 7.19 functoriality.

**Uses determining the interface.**

- Koshikawa–Yao II, Theorem 7.25: its cohomology with torsion coefficients agrees with Kummer-étale cohomology of log schemes.
- Koshikawa–Yao II, Definition 7.32: Λ-local systems are defined on this site.
- Koshikawa–Yao II, Theorem 7.30: the global étale comparison computes RΓ_qpkét of the log diamond generic fibre.

**Planning API.**

- `QProKummerEtale.IsQPKet` (other; signature outstanding): The quasi-pro-Kummer-étale condition on a map, with Kummer-étale and finite Kummer-étale variants.
- `QProKummerEtale.site` (constructor; signature outstanding): The site (Y, M_Y)_qpkét.
- `QProKummerEtale.strict_iff` (characterisation; signature outstanding): A strict map is quasi-pro-Kummer-étale iff its underlying map of diamonds is pro-étale in the quasi sense.
- `QProKummerEtale.comp` (structure; signature outstanding): Stability under composition and saturated pullback. Cancellation in KY Proposition 7.16(4): if g and g∘f are quasi-pro-Kummer-étale (respectively Kummer-étale or finite Kummer-étale), then f is too.
- `QProKummerEtale.pullbackSite` (functoriality; signature outstanding): A map of saturated quasi-coherent log diamonds induces a morphism of sites.
- `QProKummerEtale.trivialLog` (compatibility; signature outstanding): For trivial log structures (Y, M_Y)_qpkét ≃ Y_qproét (DiamondEtaleCohomology C0).
- `QProKummerEtale.cohomology` (constructor; signature outstanding): RΓ_qpkét((Y, M_Y), Λ) for a condensed (discrete or profinite) coefficient ring.

**Discriminating unit tests.**

- `QProKummerEtale.kummer_root` (computation; signature outstanding): (Spd(Q_p⟨T^{1/n}⟩, Z_p⟨T^{1/n}⟩), T^{N/n}) → (Spd(Q_p⟨T⟩, Z_p⟨T⟩), T^N) is surjective finite Kummer-étale; over a strictly totally disconnected log perfectoid space its saturated pullback is n copies indexed by Z/n.
- `QProKummerEtale.trivial` (compatibility; signature outstanding): With trivial log structures quasi-pro-Kummer-étale maps are quasi-pro-étale maps.
- `QProKummerEtale.id` (degenerate; signature outstanding): Identity maps are quasi-pro-Kummer-étale coverings.
- `QProKummerEtale.not_strict_etale` (non-example; signature outstanding): For n > 1, the Kummer map T ↦ T^n of log discs is Kummer-étale but its underlying map of diamonds is not étale at T = 0.

**Acceptance conditions.**

- For trivial log structures (Y, M_Y)_qpkét is Y_qproét.
- (Spd(Q_p⟨T^{1/n}⟩), T^{N/n}) → (Spd(Q_p⟨T⟩), T^N) is a surjective finite Kummer-étale map (Lemma 7.21).

**Prerequisites.** `PrismaticCohomology:PR.8/log-diamond`, `PrismaticCohomology:PR.8/stdisc-log-perfectoid`, `DiamondEtaleCohomology:C0`, `DiamondsAndVStacks:D4`.

**Sources.** KY, §7.3, Definition 7.14 (p. 74): Definition of maps. KY, §7.3, Definition 7.18 (p. 75): Site.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/LogDiamond`, namespace `TauCeti.LogPrismatic`.

### Kummer towers and the comparison of sites

Node `PR.8/kummer-tower-covers` (theorem); implementation status `unchecked`.

For the power-tower assertions (1)–(2), let P be an fs monoid with torsion-free group completion (in particular, a sharp fs monoid), P^{1/n} the monoid P with structure map a ↦ a^n, and P_{Q≥0} := colim_n P^{1/n}. (1) For n ≥ 1 and a saturated Q with P ⊂ Q ⊂ P^{1/n}, (Spd(Q_p⟨Q⟩, Z_p⟨Q⟩), Q) → (Spd(Q_p⟨P⟩, Z_p⟨P⟩), P) is surjective finite Kummer-étale. (2) (Spd(Q_p⟨P_{Q≥0}⟩, Z_p⟨P_{Q≥0}⟩), P_{Q≥0}) → (Spd(Q_p⟨P⟩, Z_p⟨P⟩), P) is surjective quasi-pro-Kummer-étale. (3) For any fs chart P and a Huber pair (R, R^+) over (Q_p, Z_p) with P → R^+, the associated log diamond gives a morphism of sites (Spd(R, R^+), P)^a_qpkét → (Spec R, P)^a_két; separately, for any divisible saturated chart P, (Spd(R, R^+), P)^a_qpkét ≅ Spd(R, R^+)_qproét and there is a morphism of sites to (Spec R)_ét. (4) For P fs and P_∞ divisible saturated over P, base change gives (Spec S)_ét → (Spec R, P)_két for the saturated base change (S, P_∞).

**Hypotheses.** For (1)–(2), P is fs and P^gp is torsion free. Without this hypothesis the power construction can fail surjectivity; see E8.9. For (3)–(4), fs charts and Huber pairs over (Q_p,Z_p); work locally with sharp charts and treat unit charts separately.

**Proof or construction outline.**

1. For (1), P^gp is free abelian under the stated hypothesis. First treat sharp P: extend P → M to Q → M for divisible M with uniquely divisible characteristic, and compute the saturated self-coproduct Q^gp/P^gp ⊕ Q. For general P with torsion-free P^gp, split off the free unit group; its power-map cover is strict finite étale and surjective. Torsion units do not satisfy this argument.
2. (2) follows from (1) by limits.
3. (3): Kummer-étale maps of log schemes are étale locally finite Kummer maps modelled on P → Q ⊂ P^{1/n} (Kato II); coverings remain surjective; saturated fibre products commute with passage to log diamonds; for divisible P every quasi-pro-Kummer-étale map to (Y, P)^a is strict.

**Acceptance conditions.**

- P = N: T^{1/n} covers (Lemma 7.21).
- P trivial: the statements reduce to quasi-pro-étale covers.
- Excluded generality: for P = Z/2Z and n = 2, Q_p⟨P⟩ = Q_p[t]/(t^2−1) ≅ Q_p × Q_p. The power-map ring endomorphism t ↦ t^2 = 1 misses the t = −1 component on Spd, so it is not a surjective log-diamond cover; the associated log structures are trivial because P is a group.

**Prerequisites.** `PrismaticCohomology:PR.8/quasi-pro-kummer-etale-site`, `PrismaticCohomology:PR.8/kummer-etale-site-log-scheme`, `PrismaticCohomology:PR.8/stdisc-log-perfectoid`.

**Sources.** KY, §7.3, Proposition 7.22 (p. 75): The preprint states general fs P, but its proof misses torsion units. This node retains the justified torsion-free P^gp power-tower range, with general-fs site statements chart-local; see E8.9. KY, §7.3, Corollary 7.23 (p. 76): Part (3).

### Kummer-étale cohomology of log schemes via log diamonds

Node `PR.8/kummer-etale-vs-qpket` (theorem); implementation status `unchecked`.

Let Λ be a torsion abelian group, R a p-complete ring with bounded p^∞-torsion, (R[1/p], R^+) the associated Huber pair and P → R a map from an fs monoid. The comparison map is an isomorphism RΓ_két((Spec R[1/p], P)^a, Λ) ≅ RΓ_qpkét((Spd(R[1/p], R^+), P)^a, Λ). Consequently, for a perfect prism (A, (d)), R p-complete over A/I with bounded p^∞-torsion and P → R fs, RΓ_qpkét((Spd(R[1/p], R^+), P)^a, Z/p^n) ≅ (Δ_{(R,P)/A}[1/d]/p^n)^{φ=1} functorially (and for saturated P after defining the left side as a filtered colimit of fs cases).

**Hypotheses.** Λ torsion; R p-complete with bounded p^∞-torsion; P fs (saturated via colimit).

**Proof or construction outline.**

1. Take N^J → P and P → P_∞ divisible as in Proposition 6.13; (S, P_∞) the completed saturated base change.
2. Kummer-étale descent holds for (Spec S[1/p], P_∞)^a → (Spec R[1/p], P)^a (Proposition 6.13) and quasi-pro-Kummer-étale descent for the log diamonds.
3. Replace (R, P) by (S, P_∞): both sites become (quasi-pro-)étale sites (kummer-tower-covers (3)–(4)); conclude by arc-descent for étale cohomology (Bhatt–Mathew Corollary 6.17; recorded gap).
4. Corollary 7.27: combine with affine-kummer-etale-comparison.

**Acceptance conditions.**

- P trivial: étale cohomology of Spec R[1/p] equals quasi-pro-étale cohomology of its diamond (arc-descent).
- Remark 7.26: the analogous comparison for DLLZ log adic spaces (via log-scheme-vs-log-adic-kummer).

**Prerequisites.** `PrismaticCohomology:PR.8/kummer-tower-covers`, `PrismaticCohomology:PR.8/affine-kummer-etale-comparison`, `PrismaticCohomology:PR.8/log-scheme-vs-log-adic-kummer`, `DiamondEtaleCohomology:C0`.

**Sources.** KY, §7.3, Theorem 7.25 (p. 77): Statement. KY, §7.3, Corollary 7.27 (p. 77): Reformulation. KY, §7.3, proof of Theorem 7.25 (p. 77): Imported input (recorded as a gap).

### The Kummer-étale comparison

Node `PR.8/global-etale-comparison` (theorem); implementation status `unchecked`. Planet: **Kummer-étale comparison**.

Let (A, I = (d), M_0) be a bounded pre-log prism with (A, I) perfect and M_0 an fs monoid; (X_0, M_{X_0}) a smooth fs log p-adic formal scheme over (A/I, M_0) with X_0 qcqs and mod p fibre of (X_0, M_{X_0}) → (Spf A/I, M_0)^a of Cartier type (equivalently, saturated in Tsuji's sense); (A, I, M_A) a saturated pre-log prism whose associated log prism is perfect, with (A, M_0) → (A, Γ(Spf A, M_{Spf A})); and (X, M_X) the base change of (X_0, M_{X_0}) to (A/I, M_A) (also (X_i, M_{X_i}) to fs submonoids M_i ⊂ M_A containing the image of M_0; underlying formal schemes unchanged). Define RΓ_qpkét((X, M_X)^♦_η, Z/p^m) := colim_i RΓ((X_i, M_{X_i})^♦_{η,qpkét}, Z/p^m). Then there are functorial isomorphisms RΓ_qpkét((X, M_X)^♦_η, Z/p^m) ≅ (RΓ_Δ((X, M_X)/(A, M_A))[1/d]/p^m)^{φ=1} ≅ (RΓ_Δ((X_0, M_{X_0})/(A, M_0))[1/d]/p^m)^{φ=1}. If moreover A/I = O_C (C algebraically closed, A = A_inf) and X is proper, RΓ_qpkét((X, M_X)^♦_η, Z_p) := lim_m RΓ_qpkét(−, Z/p^m) is a perfect Z_p-complex with RΓ_qpkét ⊗^L_{Z_p} W(C♭) ≅ RΓ_Δ((X, M_X)/(A, M_A)) ⊗^L_{A_inf} W(C♭), and similarly mod p^m. Kummer-étale cohomology is not replaced by étale cohomology of the generic fibre unless the log structure is trivial there.

**Hypotheses.** Exactly the setup of KY §7.4 (perfect log prism, fs M_0, Cartier-type mod p fibre, qcqs X_0); properness and A/I = O_C for the second part.

**Proof or construction outline.**

1. Show the presheaves U ↦ RΓ_qpkét((U, M)^♦_η, Z/p^m) and U ↦ (Δ(U)[1/d]/p^m)^{φ=1} are étale sheaves on X and compare them on affine U with fs charts using kummer-etale-vs-qpket and derived-vs-site.
2. Base change from M_0 to M_i and to M_A (log-prismatic-base-change; Cartier type implies saturated, so fs base change is integral base change, Tsuji II.2.13).
3. Pass to the colimit over M_i (any fs sub log structure of M_{Spf A} lies in some M_i by quasicompactness).
4. Corollary 7.31: perfectness of RΓ_Δ for proper X (log-hodge-tate-comparison) and Bhatt's Lemma 8.5 / BS F-crystals Example 3.4 (PR.4/PR.7).

**Acceptance conditions.**

- For trivial log structures and smooth X this is BS22 Theorem 1.8(4) (PR.4).
- For a proper semistable formal scheme over O_C with canonical log structure, H^i_qpkét of the generic fibre (Kummer-étale = étale cohomology of the smooth rigid generic fibre since the log structure is trivial there) is computed by the A_inf log prismatic cohomology after ⊗ W(C♭).

**Prerequisites.** `PrismaticCohomology:PR.8/kummer-etale-vs-qpket`, `PrismaticCohomology:PR.8/affine-kummer-etale-comparison`, `PrismaticCohomology:PR.8/derived-vs-site`, `PrismaticCohomology:PR.8/log-prismatic-base-change`, `PrismaticCohomology:PR.8/perfect-log-prism`, `PrismaticCohomology:PR.8/log-diamond-generic-fibre`, `PrismaticCohomology:PR.8/log-hodge-tate-comparison`, `PrismaticCohomology:PR.4`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources.** KY, §7.4, Theorem 7.30 (p. 78): Statement. KY, §7.4, Corollary 7.31 (p. 79): Proper case over O_C. KY, §1, Theorem 2(5) (p. 3): Hypotheses.

### Kummer-étale local systems

Node `PR.8/kummer-local-systems` (definition); implementation status `unchecked`.

Let (X, M_X) be an fs log diamond and pr: (X, M_X)_qpkét → X_qproét → ∗_proét. For a condensed ring Λ (here Z/p^n discrete or Z_p profinite), a sheaf of pr^{-1}Λ-modules F on (X, M_X)_qpkét is constant if F ≅ pr^{-1}Λ^r, and locally constant (a Λ-local system) if it is constant quasi-pro-Kummer-étale locally. Loc_Λ(X, M_X) is the category of Λ-local systems; D^(b)((X, M_X)^♦_η, Z_p) denotes the corresponding category of complexes locally constant with perfect fibres (hypercomplete when X^♦_η is quasicompact).

**Hypotheses.** Condensed coefficient rings Z/p^n and Z_p; following Mann–Werner §3.

**Proof or construction outline.**

1. Define pr and constant sheaves via condensed sets.
2. Local constancy quasi-pro-Kummer-étale locally; morphisms are sheaf maps.

**Uses determining the interface.**

- Koshikawa–Yao II, Theorem 7.36: Z_p-local systems on the log diamond generic fibre are equivalent to Laurent F-crystals.
- Koshikawa–Yao II, Proposition 7.38: Rf_{η*}Z_p for smooth proper f is locally constant with perfect fibres.

**Planning API.**

- `KummerLocalSystem` (constructor; signature outstanding): Loc_Λ(X, M_X): locally constant sheaves of pr^{-1}Λ-modules on (X, M_X)_qpkét.
- `KummerLocalSystem.constant` (constructor; signature outstanding): The constant local system pr^{-1}Λ^r.
- `KummerLocalSystem.pullback` (functoriality; signature outstanding): Pullback along maps of fs log diamonds.
- `KummerLocalSystem.tensor` (structure; signature outstanding): Tensor products and duals of local systems.
- `KummerLocalSystem.trivialLog` (compatibility; signature outstanding): For trivial log structure, Loc_{Z_p} agrees with quasi-pro-étale Z_p-local systems (Mann–Werner).

**Discriminating unit tests.**

- `KummerLocalSystem.constant_rank` (computation; signature outstanding): pr^{-1}Z_p^r is a Z_p-local system of rank r.
- `KummerLocalSystem.zero` (degenerate; signature outstanding): The zero sheaf is the local system of rank 0.
- `KummerLocalSystem.kummer_torsor` (non-example; signature outstanding): Over an algebraically closed complete C and for n > 1, let π be the finite Kummer-étale n-th-root cover of the log disc. The linear local system π_*Z_p has rank n and nontrivial permutation inertia at T = 0, so it does not descend to a local system on the underlying diamond near T = 0. The root torsor itself is a torsor under Z_p(1) in the inverse p-power tower, not a rank-one Z_p-module local system.
- `KummerLocalSystem.trivialLog_eq` (compatibility; signature outstanding): With trivial log structure these are the quasi-pro-étale Z_p-local systems of Mann–Werner.

**Acceptance conditions.**

- For trivial log structure these are quasi-pro-étale Z_p-local systems on X (Mann–Werner).
- Over an algebraically closed complete C and for n > 1, let π be the finite Kummer-étale n-th-root cover of the log disc. The linear local system π_*Z_p has rank n and nontrivial permutation inertia at T = 0, so it does not descend to a local system on the underlying diamond near T = 0. The root torsor itself is a torsor under Z_p(1) in the inverse p-power tower, not a rank-one Z_p-module local system.

**Prerequisites.** `PrismaticCohomology:PR.8/quasi-pro-kummer-etale-site`, `DiamondEtaleCohomology:C0`.

**Sources.** KY, §7.5, Definition 7.32 (p. 80): Definition.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/LocalSystems`, namespace `TauCeti.LogPrismatic`.

### Laurent F-crystals on the absolute saturated log prismatic site

Node `PR.8/laurent-f-crystal` (definition); implementation status `unchecked`.

Let (X, M_X) be a bounded fs log p-adic formal scheme and (X, M_X)_Δ its absolute saturated log prismatic site. A Laurent F-crystal is a crystal of vector bundles E over (O_Δ[1/I])^∧_p on (X, M_X)_Δ (a compatible family of finite projective A[1/I]^∧_p-modules on objects (A, I, M_A)^a with isomorphisms along maps) together with an isomorphism φ_E: φ^*E ≅ E. Vect((X, M_X)_Δ, O_Δ[1/I]^∧_p)^{φ=1} is the category of Laurent F-crystals; D_perf((X, M_X)_Δ, O_Δ[1/I]^∧_p)^{φ=1} the analogous category of perfect complexes.

**Hypotheses.** Bounded fs log p-adic formal schemes; absolute saturated site with the strict flat topology.

**Proof or construction outline.**

1. Define crystals of vector bundles over O_Δ[1/I]^∧_p and Frobenius structures.
2. By Drinfeld–Mathew descent (Mathew Theorem 5.8), Vect(…)^{φ=1} ≃ lim over objects of Vect(A[1/I]^∧_p)^{φ_A=1} (used in Theorem 7.36).

**Uses determining the interface.**

- Koshikawa–Yao II, Theorem 7.36: Laurent F-crystals are equivalent to Z_p-local systems on the log diamond generic fibre.
- Koshikawa–Yao II, Proposition 7.38: Rf_*O_Δ for smooth proper f is an F-crystal of perfect complexes whose étale realisation is Rf_{η*}Z_p.

**Planning API.**

- `LaurentFCrystal` (constructor; signature outstanding): The category Vect((X, M_X)_Δ, O_Δ[1/I]^∧_p)^{φ=1}.
- `LaurentFCrystal.unit` (example; signature outstanding): The unit object O_Δ[1/I]^∧_p with its Frobenius.
- `LaurentFCrystal.tensor` (structure; signature outstanding): Tensor products and duals.
- `LaurentFCrystal.pullback` (functoriality; signature outstanding): Pullback along maps of bounded fs log p-adic formal schemes.
- `LaurentFCrystal.descent` (characterisation; signature outstanding): Vect(…)^{φ=1} ≃ lim_{(A,I,M_A)} Vect(A[1/I]^∧_p)^{φ_A=1} over the absolute saturated site (Drinfeld–Mathew).
- `LaurentFCrystal.etaleRealisation` (projection; signature outstanding): The étale realisation F ↦ F_ét to Loc_{Z_p}((X, M_X)^♦_η) (from Theorem 7.36).

**Discriminating unit tests.**

- `LaurentFCrystal.unit_realisation` (computation; signature outstanding): The étale realisation of the unit O_Δ[1/I]^∧_p is the constant local system Z_p.
- `LaurentFCrystal.trivialLog` (compatibility; signature outstanding): For trivial log structure the category agrees with PR.7's Laurent F-crystals (BS F-crystals Definition 3.2).
- `LaurentFCrystal.zero` (degenerate; signature outstanding): The zero crystal is a Laurent F-crystal of rank 0.
- `LaurentFCrystal.not_F_crystal` (non-example; signature outstanding): A vector-bundle crystal E over O_Δ (not O_Δ[1/I]) with φ^*E[1/I] ≅ E[1/I] is a prismatic F-crystal, not a Laurent F-crystal: inverting I is part of the definition.

**Acceptance conditions.**

- For trivial log structure these are BS F-crystals' Laurent F-crystals (PR.7).
- O_Δ[1/I]^∧_p with φ is the unit Laurent F-crystal.

**Prerequisites.** `PrismaticCohomology:PR.8/absolute-log-prismatic-site`, `PrismaticCohomology:PR.7`.

**Sources.** KY, §7.5, Definition 7.35 (p. 81): Definition.

**Proposed placement.** `TauCeti/AlgebraicGeometry/LogPrismatic/LocalSystems`, namespace `TauCeti.LogPrismatic`.

### Laurent F-crystals and Kummer-étale local systems

Node `PR.8/laurent-f-crystals-local-systems` (theorem); implementation status `unchecked`.

Provisional preprint target, held for source correction and not accepted as a current theorem: Let (X, M_X) be a bounded fs log p-adic formal scheme with log diamond generic fibre (X, M_X)^♦_η. There is a natural equivalence Vect((X, M_X)_Δ, O_Δ[1/I]^∧_p)^{φ=1} ≃ Loc_{Z_p}((X, M_X)^♦_η), and more generally D_perf((X, M_X)_Δ, O_Δ[1/I]^∧_p)^{φ=1} ≃ D^(b)((X, M_X)^♦_η, Z_p); the unit O_Δ corresponds to the constant sheaf Z_p.

**Hypotheses.** Bounded fs log p-adic formal schemes; quasi-pro-Kummer-étale topology on the generic fibre.

**Proof or construction outline.**

1. Source gate: read the full 2026 corrigendum and the published theorem numbering before accepting this statement or its proof. The ordinary PR.7 export supplies only the ordinary comparison/descent input; it does not repair a log equivalence.
2. By Drinfeld–Mathew, reduce to the limit over objects (A, I, M_A)^a of Vect(A[1/I]^∧_p)^{φ=1}; restrict to perfect saturated log prisms, which form a basis.
3. For a perfect log prism, by perfect-log-prisms-perfectoid A/I with its log structure is a perfectoid log ring; on its log diamond generic fibre the log structure is divisible, so quasi-pro-Kummer-étale = quasi-pro-étale (kummer-tower-covers (3)), and BS F-crystals Corollary 3.8 (PR.7) applies.
4. Glue: descent for both sides along the quasi-pro-Kummer-étale covers obtained from saturated perfect log prisms; perfect complexes as in Bhatt–Mathew Proposition 5.11; quasicompact then quasiseparated then general X by gluing (Theorem 7.37).

**Acceptance conditions.**

- Trivial log structure: BS F-crystals Corollary 3.8 (PR.7).
- A corrected equivalence must preserve ranks: the finite Kummer-cover pushforward π_*Z_p of kummer-local-systems has rank n. A root torsor is not a rank-one linear local system and cannot be used as that acceptance test.

**Prerequisites.** `PrismaticCohomology:PR.8/laurent-f-crystal`, `PrismaticCohomology:PR.8/kummer-local-systems`, `PrismaticCohomology:PR.8/perfect-log-prisms-perfectoid`, `PrismaticCohomology:PR.8/kummer-tower-covers`, `PrismaticCohomology:PR.8/log-diamond-generic-fibre`, `PrismaticCohomology:PR.7/laurent-f-crystals-local-systems`, `PrismaticCohomology:PR.7/crystal-descent`.

**Sources.** KY, §7.5, Theorem 7.36 (p. 81): Statement. KY, §7.5, Theorem 7.37 (p. 82): Derived version. KYcorr, Publisher/Keio abstract, October 2026: Confirms a published correction exists; insufficient to verify the repaired equivalences. No corrected theorem is inferred from the abstract.

### Smooth proper pushforward of Kummer-étale local systems

Node `PR.8/smooth-proper-pushforward` (theorem); implementation status `unchecked`.

Provisional preprint target, held for source correction and not accepted as a current theorem: Let f: (X, M_X) → (Y, M_Y) be a smooth (Koshikawa's sense) proper map of bounded fs log p-adic formal schemes. Then Rf_*O_Δ is an F-crystal of perfect complexes on (Y, M_Y)_Δ and there is a natural isomorphism (Rf_*O_Δ)_ét ≅ Rf_{η*}Z_p for f_η: (X, M_X)^♦_η → (Y, M_Y)^♦_η; in particular Rf_{η*}Z_p is locally constant with perfect fibres and commutes with base change (Z, M_Z) → (Y, M_Y).

**Hypotheses.** f smooth and proper; bounded fs.

**Proof or construction outline.**

1. Source gate: read the full 2026 corrigendum and the published theorem numbering before accepting this statement or its proof. The ordinary PR.7 export supplies only the ordinary comparison/descent input; it does not repair a log equivalence.
2. Hodge–Tate comparison and base change show Rf_*O_Δ is an F-crystal of perfect complexes.
3. Work étale locally on Y with a sharp fs chart; evaluate on saturated perfect log prisms and apply global-etale-comparison fibrewise, then laurent-f-crystals-local-systems.

**Acceptance conditions.**

- For f the identity, (O_Δ)_ét = Z_p.
- Trivial log structures: the relative form of BS F-crystals Corollary 3.8 with smooth proper pushforward (PR.7).

**Prerequisites.** `PrismaticCohomology:PR.8/laurent-f-crystals-local-systems`, `PrismaticCohomology:PR.8/global-etale-comparison`, `PrismaticCohomology:PR.8/log-hodge-tate-comparison`, `PrismaticCohomology:PR.8/log-prismatic-base-change`.

**Sources.** KY, §7.5, Proposition 7.38 (p. 82): Statement.

## K. A_inf, Hyodo–Kato and BKF

### Étale comparison over A_inf[1/φ^{-1}(μ)]

Node `PR.8/etale-comparison-over-ainf` (theorem); implementation status `unchecked`.

Let C be algebraically closed with A_inf = W(O_C♭), ξ = μ/φ^{-1}(μ), μ = [ε] − 1; (X_0, M_{X_0}) an fs log p-adic formal scheme smooth and proper over (Spf O_C, M_0)^a with mod p fibre of Cartier type, base changed to (X, M_X) over a perfect log prism (A_inf, (ξ), M_A) receiving M_0; M := RΓ_Δ((X_0, M_{X_0})/(A_inf, M_0)) ≅ RΓ_Δ((X, M_X)/(A_inf, M_A)), H^i_Δ := H^i(M), T := RΓ_qpkét((X, M_X)^♦_η, Z_p). Then for every i, H^i_Δ ⊗_{A_inf} A_inf[1/φ^{-1}(μ)] ≅ H^i_qpkét((X, M_X)^♦_η, Z_p) ⊗_{Z_p} A_inf[1/φ^{-1}(μ)].

**Hypotheses.** As in KY §8 setup; C algebraically closed; properness; Cartier type.

**Proof or construction outline.**

1. Lemma 8.5: construct a φ-equivariant map M → T ⊗^L_{Z_p} A_inf compatible with the étale comparison, using the characteristic-p Riemann–Hilbert correspondence of Bhatt–Lurie (recorded gap) on the p-completed perfection (M_perf)^∧_p.
2. Lemma 8.6: the pole of Frobenius along φ^{-1}(ξ) is bounded by the Nygaard filtration / isogeny (log-frobenius-isogeny), with D the rank of Ω^1_log, so M ⊗ A_inf[1/φ^{-1}(μ)] ≅ (M_perf)^∧_p ⊗ A_inf[1/φ^{-1}(μ)].
3. Combine with global-etale-comparison (perfectness of T, Corollary 7.31).

**Acceptance conditions.**

- Trivial log structures: the analogous statement of BMS1 Theorem 1.8(iii) via BS22 Theorem 17.2 (PR.6/AI.5).
- For X = Spf O_C: both sides are A_inf[1/φ^{-1}(μ)] in degree 0.

**Prerequisites.** `PrismaticCohomology:PR.8/global-etale-comparison`, `PrismaticCohomology:PR.8/log-frobenius-isogeny`, `PrismaticCohomology:PR.8/log-nygaard-filtration`, `AInfCohomology:AI.0`.

**Sources.** KY, §8, Proposition 8.3 (p. 86): Statement. KY, §8.1 (p. 86): Imported input (recorded as a gap).

### Hyodo–Kato isomorphism for log prismatic cohomology over A_crys

Node `PR.8/log-hyodo-kato-isomorphism` (theorem); implementation status `unchecked`.

In the setting of the étale comparison over A_inf, let (A_crys, (p), M_crys) be the log prism associated with M_0 → A_inf → A_crys and (X_0, M_{X_0})_{O_C/p} the base change along Spec(O_C/p, M_crys)^a → Spf(O_C, M_0)^a. (1) φ^*RΓ_Δ((X_0, M_{X_0})/(A_inf, M_0)) ⊗^L_{A_inf} A_crys ≅ RΓ_crys((X_0, M_{X_0})_{O_C/p}/(A_crys, M_crys)) Frobenius-equivariantly, and Frobenius is an isomorphism after inverting p. (2) Let k = O_C/m, (k, N) the log ring associated with (k, M_0) and (Y, M_Y) the base change of (X_0, M_{X_0}) to (k, N). For a section k → O_C/p, RΓ_crys((Y, M_Y)/(W(k), N)) ⊗^L_{W(k)} A_crys[1/p] ≅ RΓ_crys((X_0, M_{X_0})_{O_C/p}/(A_crys, M_crys))[1/p]; hence each H^i(M ⊗^L_{A_inf,φ} A_crys[1/p]) is a finite free A_crys[1/p]-module.

**Hypotheses.** As in KY §8; section k → O_C/p fixed.

**Proof or construction outline.**

1. (1) Proposition 8.8: the kernel of A_crys → O_C/p has divided powers; apply log-crystalline-comparison, base change and log-frobenius-isogeny.
2. (2) Proposition 8.9: iterate Frobenius to identify (φ^n)^* of the A_crys cohomology with crystalline cohomology of the base change along φ^n: (O_C/p, M_crys) → (O_C/p^{1/p^n}, M_crys) → (O_C/p, M_crys), compare with Y ⊗_k O_C/p^{1/p^n} via the section, as in BMS1 Proposition 13.21 (log analogue; Hyodo–Kato theory of CR.6).

**Acceptance conditions.**

- Good reduction (trivial M_0): BMS1 Proposition 13.21.
- For the log point X_0 = Spf O_C with M_0 = N: both sides are A_crys[1/p] in degree 0.

**Prerequisites.** `PrismaticCohomology:PR.8/log-crystalline-comparison`, `PrismaticCohomology:PR.8/log-prismatic-base-change`, `PrismaticCohomology:PR.8/log-frobenius-isogeny`, `CrystallineCohomology:CR.6`, `AInfCohomology:AI.0`.

**Sources.** KY, §8.2, Proposition 8.8 (p. 89): Part (1). KY, §8.2, Proposition 8.9 (p. 89): Part (2).

### Log prismatic cohomology groups are Breuil–Kisin–Fargues modules

Node `PR.8/log-prismatic-bkf-module` (theorem); implementation status `unchecked`.

In the setting of the étale comparison over A_inf (X proper over O_C, mod p fibre of Cartier type, perfect log prism base over A_inf), for every i the Frobenius-twisted cohomology φ^*H^i_Δ = H^i_Δ ⊗_{A_inf,φ} A_inf with its Frobenius is a Breuil–Kisin–Fargues module: a finitely presented A_inf-module N, free after inverting p, with a φ-linear φ_N inducing N[1/ξ] ≅ N[1/φ(ξ)]. Moreover H^i_Δ ⊗ A_inf[1/φ^{-1}(μ)] ≅ H^i_qpkét((X, M_X)^♦_η, Z_p) ⊗ A_inf[1/φ^{-1}(μ)].

**Hypotheses.** As in KY §8: X proper; Cartier type; C algebraically closed.

**Proof or construction outline.**

1. Apply BMS1 Corollary 4.20 (criterion for BKF modules from a perfect complex with Frobenius, owned by AI.2) to M = RΓ_Δ.
2. Its two inputs are etale-comparison-over-ainf (Proposition 8.3) and the finite freeness of H^i(M ⊗_{A_inf,φ} A_crys[1/p]) (log-hyodo-kato-isomorphism, Proposition 8.4).

**Acceptance conditions.**

- Trivial log structures: BMS1 Theorem 14.5 / BS22 Theorem 1.8 with the A_inf comparison (AI.5).
- X = Spf O_C: φ^*H^0 = A_inf, the unit BKF module.

**Prerequisites.** `PrismaticCohomology:PR.8/etale-comparison-over-ainf`, `PrismaticCohomology:PR.8/log-hyodo-kato-isomorphism`, `PrismaticCohomology:PR.8/perfect-log-prism`, `AInfCohomology:AI.2/bkf-module`, `AInfCohomology:AI.5/cohomology-finiteness-from-periods`, `AInfCohomology:AI.5/p-local-freeness-from-periods`.

**Sources.** KY, §8, Theorem 8.2 (p. 85): Statement. KY, §8, Definition 8.1 (p. 85): Definition of BKF modules (imported from AI.2).

## L. Standard semistable application

### Log prismatic cohomology of the standard semistable chart

Node `PR.8/semistable-chart-application` (application); implementation status `unchecked`.

Let O_K be totally ramified over W(k) with uniformiser π and R = O_K⟨x_1, …, x_d⟩/(x_1⋯x_r − π) (1 ≤ r ≤ d) with the canonical log structure given by the chart P = N^r → R, e_j ↦ x_j (j ≤ r), over (O_K, N → O_K, 1 ↦ π) via the diagonal 1 ↦ e_1 + ⋯ + e_r (the standard semistable chart of CR.5, with its actual monoid map recording π). Then: (1) (Spf R, P)^a is smooth of Cartier type over (O_K, N) in Koshikawa's sense, hence over the Breuil–Kisin prelog prism (W(k)[[u]], (E), N → u) via O_K = W(k)[[u]]/(E); (2) H^i(Δ̄_{(R,P)/(W(k)[[u]],N)}){i} ≅ Ω^i_{(R,P)/(O_K,N)}, a free R-module of rank (d − 1 choose i) with basis the wedge products of dlog x_2, …, dlog x_r, dx_{r+1}, …, dx_d (dlog x_1 = −Σ_{j=2}^r dlog x_j); (3) the crystalline comparison over (W(k), (p), N → 0), after u ↦ 0, computes the Hyodo–Kato log crystalline cohomology of the special fibre (Spec k[x_1, …, x_d]/(x_1⋯x_r), N^r)^a; (4) the de Rham comparison gives Ω^•_{(R,P)/(O_K,N)}; (5) base change along u ↦ [π♭] gives the A_inf log prismatic cohomology of R_{O_C}, whose Frobenius twist is ČK's AΩ (semistable-aomega-comparison, on the overlap with AI.6); (6) the Kummer-étale comparison over a perfect log prism computes the Kummer-étale cohomology of the generic fibre, which is étale cohomology because x_1, …, x_r are units on R[1/p], so the log structure is trivial there.

**Hypotheses.** 1 ≤ r ≤ d; k perfect; the free coordinates x_{r+1}, …, x_d carry no log structure.

**Proof or construction outline.**

1. Smoothness: P^gp/N^gp ≅ Z^{r−1} is free; Z[t] → Z[x_1, …, x_r], t ↦ x_1⋯x_r is flat, so N → P is integral (Kato 4.1); Zariski locally (on D(x_j) or D(x_j − 1)) each free coordinate is a unit coordinate, and R is étale over O_K⟨P ⊕ Z^{d−r}⟩ ⊗_{O_K⟨N⟩} O_K; Cartier type since the special fibre is reduced (K1 Appendix A, Example (2); Tsuji).
2. (2) log-hodge-tate-comparison with CR.5's explicit log differentials of the chart.
3. (3) log-crystalline-comparison and the Hyodo–Kato specialisation of breuil-kisin-log-cohomology; (4) log-de-rham-comparison; (5) log-prismatic-base-change and semistable-aomega-comparison; (6) global-etale-comparison.

**Acceptance conditions.**

- d = r = 1: R = O_K and all cohomology is concentrated in degree 0.
- d = r = 2: the semistable node O_K⟨x, y⟩/(xy − π); H^1(Δ̄){1} is free of rank 1 on dlog y = −dlog x.

**Prerequisites.** `PrismaticCohomology:PR.8/log-hodge-tate-comparison`, `PrismaticCohomology:PR.8/log-crystalline-comparison`, `PrismaticCohomology:PR.8/log-de-rham-comparison`, `PrismaticCohomology:PR.8/breuil-kisin-log-cohomology`, `PrismaticCohomology:PR.8/semistable-aomega-comparison`, `PrismaticCohomology:PR.8/global-etale-comparison`, `CrystallineCohomology:CR.5`, `CrystallineCohomology:CR.6`, `AInfCohomology:AI.6`.

**Sources.** K1, Appendix A.1, Example (2) (p. 50): Cartier type of semistable models. K1, §8, Theorem 8.1 (p. 45): The semistable chart over O_C.

## Supplier contracts and remaining requests

Exact current imports appear at their consuming nodes. The following requests record the required cross-roadmap contracts; their presence is not a claim that every supplier is missing. Scope extensions are distinguished explicitly from existing exports. No second owner is assigned in this checkpoint.

### `CrystallineCohomology:CR.5:log-algebra`

Remaining extension beyond the present fine and finite semistable contracts: arbitrary integral monoid exactification and exact surjections, relatively coherent/small charts, and Koshikawa Appendix A smoothness for possibly non-fine integral bases, including its exact-immersion lifting, chart independence and étale localisation on (p,I)-adic formal schemes. Current CR.5 exports prelog-ring, integral-monoid, associated-log and fine-model smoothness; those exports are used where sufficient and do not establish the full Appendix A comparison.

Consumers: `PrismaticCohomology:PR.8/delta-log-associated-log`, `PrismaticCohomology:PR.8/delta-log-exactification`, `PrismaticCohomology:PR.8/log-prism`, `PrismaticCohomology:PR.8/log-prismatic-envelope`, `PrismaticCohomology:PR.8/envelope-flatness-smooth`, `PrismaticCohomology:PR.8/log-prismatic-site`, `PrismaticCohomology:PR.8/absolute-log-prismatic-site`, `PrismaticCohomology:PR.8/log-hodge-tate-map`, `PrismaticCohomology:PR.8/log-hodge-tate-comparison`, `PrismaticCohomology:PR.8/log-prismatic-base-change`, `PrismaticCohomology:PR.8/cartier-type-cosimplicial-frobenius`, `PrismaticCohomology:PR.8/crystalline-comparison-map`, `PrismaticCohomology:PR.8/local-crystalline-comparison`, `PrismaticCohomology:PR.8/log-crystalline-comparison`, `PrismaticCohomology:PR.8/breuil-kisin-log-cohomology`, `PrismaticCohomology:PR.8/log-quasisyntomic-site`, `PrismaticCohomology:PR.8/log-diamond`, `PrismaticCohomology:PR.8/log-diamond-generic-fibre`, `PrismaticCohomology:PR.8/global-etale-comparison`.

### `CrystallineCohomology:CR.5`

Log PD envelopes (p-completed), the small and big log crystalline sites with étale topology and log crystalline cohomology Ru^crys_*O over a p-adic PD base with a log structure, its computation by Čech nerves of log PD envelopes and by log de Rham complexes with coefficients in the envelope (Beilinson 2013 §1.6–1.8), the comparison of the big site with the small sites mod p^m and in the limit (Koshikawa I Remark 6.7), and the explicit log differential module of the standard semistable chart O_K⟨x_1, …, x_d⟩/(x_1⋯x_r − π) with chart N^r.

Consumers: `PrismaticCohomology:PR.8/delta-log-crystalline-site`, `PrismaticCohomology:PR.8/delta-log-crystalline-vs-log-crystalline`, `PrismaticCohomology:PR.8/log-crystalline-comparison`, `PrismaticCohomology:PR.8/log-q-pd-triple`, `PrismaticCohomology:PR.8/log-q-de-rham-complex`, `PrismaticCohomology:PR.8/semistable-crys-bdr-diagram`, `PrismaticCohomology:PR.8/semistable-chart-application`.

### `CrystallineCohomology:CR.6`

Hyodo–Kato theory over the log Witt base (W(k), N → W(k), 1 ↦ 0): log crystalline cohomology of the log special fibre of a semistable (or Cartier-type fs smooth) model and the Hyodo–Kato isomorphism with crystalline cohomology over (A_crys, M_crys) after inverting p and choosing a section k → O_C/p (log analogue of BMS1 Proposition 13.21), as used in Koshikawa–Yao II Proposition 8.9.

Consumers: `PrismaticCohomology:PR.8/log-hyodo-kato-isomorphism`, `PrismaticCohomology:PR.8/semistable-chart-application`.

### `DerivedDeRhamCohomology:DD.6`

Remaining extension/verification beyond the exact DD.6 nodes now imported: Gabber cotangent sheafification on non-fine integral log formal schemes, discreteness for Koshikawa smooth charts and the formal log-étaleness lifting criterion used in KY Lemma 2.40. The supplier already owns animated Gabber complexes, transitivity, log de Rham, hlf descent and the log quasisyntomic/QRSP notions; PR.8 does not reconstruct them.

Consumers: `PrismaticCohomology:PR.8/perfect-log-prisms-perfectoid`, `PrismaticCohomology:PR.8/log-hodge-tate-map`, `PrismaticCohomology:PR.8/log-hodge-tate-comparison`, `PrismaticCohomology:PR.8/derived-log-properties`, `PrismaticCohomology:PR.8/derived-vs-site`, `PrismaticCohomology:PR.8/nygaard-hodge-fiber-sequence`, `PrismaticCohomology:PR.8/log-l-eta-factorization`.

### `DerivedDeRhamCohomology:DD.5`

BMS2's quasisyntomic site QSyn and its quasiregular semiperfectoid basis (BMS2 Definitions 4.10, 4.20, Lemma 4.25–4.26, Proposition 4.31, Corollary 4.8 on bounded p^∞-torsion of p-completely flat algebras), which the log quasisyntomic site of PR.8 restricts to on trivial pre-log structures.

Consumers: `PrismaticCohomology:PR.8/log-qrsp-basis`.

### `DiamondsAndVStacks:D1`

Strictly totally disconnected perfectoid spaces (qcqs with every étale cover split), every affinoid perfectoid admitting an affinoid pro-étale surjection from one (Scholze, Étale cohomology of diamonds, Lemma 7.18), and triviality of étale line bundles on them.

Consumers: `PrismaticCohomology:PR.8/stdisc-log-perfectoid`.

### `DiamondsAndVStacks:D4`

Diamonds and locally spatial diamonds, quasi-pro-étale (locally separated) maps and quotients of perfectoid spaces by pro-étale equivalence relations (Scholze Propositions 11.8, 11.24), fibre products of locally spatial diamonds.

Consumers: `PrismaticCohomology:PR.8/log-diamond`, `PrismaticCohomology:PR.8/quasi-pro-kummer-etale-site`.

### `DiamondsAndVStacks:D6`

The diamond Spd(R, R^+) of an arbitrary (possibly non-sheafy) Huber pair over (Q_p, Z_p) and the diamond generic fibre X^♦_η of a p-adic formal scheme, functorial in maps.

Consumers: `PrismaticCohomology:PR.8/log-diamond-generic-fibre`.

### `DiamondEtaleCohomology:C0`

The quasi-pro-étale site Y_qproét of a diamond with its completed structure sheaves Ô_Y, Ô^+_Y (Mann–Werner), the morphism to ∗_proét giving condensed coefficients, and quasi-pro-étale descent for torsion and Z_p coefficients.

Consumers: `PrismaticCohomology:PR.8/log-diamond`, `PrismaticCohomology:PR.8/quasi-pro-kummer-etale-site`, `PrismaticCohomology:PR.8/kummer-etale-vs-qpket`, `PrismaticCohomology:PR.8/kummer-local-systems`.

### `PerfectoidQuotients:Q2`

Perfectoidization of integral algebras over a perfectoid ring (Bhatt–Scholze Theorem 1.17(1)), used to construct saturations of log perfectoid spaces in Koshikawa–Yao II Lemma 7.7.

Consumers: `PrismaticCohomology:PR.8/log-diamond`.

### `AInfCohomology:AI.0`

A_inf = W(O_C♭) with θ, ξ, μ = [ε] − 1, ξ̃ = φ(ξ), and A_crys as the completed PD envelope of ker θ, with the Frobenius conventions of BMS1 §3; the perfect prism (A_inf, (ξ)).

Consumers: `PrismaticCohomology:PR.8/standard-log-prisms`, `PrismaticCohomology:PR.8/semistable-crys-bdr-diagram`, `PrismaticCohomology:PR.8/etale-comparison-over-ainf`, `PrismaticCohomology:PR.8/log-hyodo-kato-isomorphism`.

### `AInfCohomology:AI.6`

Česnavičius–Koshikawa's semistable A_inf-cohomology AΩ_X for semistable formal schemes over O_C with canonical log structure, its local Koszul-complex description in the charts R^□_Σ × ∏_λ R_λ (ČK19 5.17–5.19) and the comparison diagram ČK19 6.8 with log crystalline and B_dR^+ cohomology.

Consumers: `PrismaticCohomology:PR.8/semistable-aomega-comparison`, `PrismaticCohomology:PR.8/semistable-crys-bdr-diagram`, `PrismaticCohomology:PR.8/semistable-chart-application`.

### `EnhancedDerivedSheaves:E5:animation`

Animated (simplicial) commutative rings and sifted left Kan extension from polynomial algebras; the animated pre-log rings of DD.6 are built on it.

Consumers: `PrismaticCohomology:PR.8/derived-log-prismatic`.

### `AInfCohomology:AI.1`

The commuting-endomorphism Koszul cochain interface used in K1 Constructions 7.15–7.16 and its décalage calculation. Current AI.1/koszul-decalage-calculation supplies the scalar divisibility calculation and requests the general carrier from DD.1. Current DD.1/koszul-complex is the homological exterior complex of a linear form, with scalar cochain version in [−r,0]; the log q-derivatives require commuting module endomorphisms with cochain degrees [0,r]. Obtain that carrier through the owner, with polynomial-operator/scalar and degree/sign adapters, finite-coordinate functoriality and the required completion/colimit bounds. PR.8 owns only the log q-derivatives.

Consumers: `PrismaticCohomology:PR.8/log-q-de-rham-complex`.

## Gaps and completion gate

The layer remains partial until the following are resolved and checked independently. In particular, the provisional Laurent targets cannot be accepted from the preprint or metadata alone.

### Bhatt–Lurie Riemann–Hilbert correspondence in characteristic p

Koshikawa–Yao II Lemma 8.5 constructs the φ-equivariant map M → T ⊗^L A_inf using the Riemann–Hilbert correspondence in positive characteristic of Bhatt–Lurie (Camb. J. Math. 7 (2019)) on the p-completed perfection of M. No roadmap of the atlas plans this correspondence (searched: all stage descriptions and paper routes for 'Riemann–Hilbert'). It needs an owner, presumably an étale-cohomology or perfect-scheme roadmap; until then the étale comparison over A_inf[1/φ^{-1}(μ)] and the BKF theorem rest on it. The current PR.7/artin-schreier-riemann-hilbert node is a near miss: it classifies perfect F_p-complexes with invertible Frobenius and lisse coefficients. KY Lemma 8.5 uses algebraic Frobenius W_n(O_C♭)-modules arising from colimit perfection, bounded constructible sheaves and Rj_! across Spec C♭→Spec O_C♭. The perfected modules need not be perfect as ring-modules. This stronger Witt-length and extension-by-zero contract is not supplied by that node.

Affected nodes: `PrismaticCohomology:PR.8/etale-comparison-over-ainf`, `PrismaticCohomology:PR.8/log-prismatic-bkf-module`.

### arc-descent for étale cohomology with torsion coefficients

The proof of Koshikawa–Yao II Theorem 7.25 ends with Bhatt–Mathew, The arc-topology, Corollary 6.17 (étale cohomology of p-complete rings with bounded p^∞-torsion after inverting p satisfies arc-descent, giving agreement with quasi-pro-étale cohomology of the diamond). The routing of PAPER-BHATT-SCHOLZE-22 names a proposed ArcTopologyAndDescent roadmap for arc_p-descent, but no such roadmap or stage exists in data/atlas.json or research/blueprint/roadmaps/ at the time of writing; the comparison of Kummer-étale cohomology of log schemes with quasi-pro-Kummer-étale cohomology of log diamonds rests on it.

Affected nodes: `PrismaticCohomology:PR.8/kummer-etale-vs-qpket`.

### Corrected Laurent F-crystal equivalences

The Inoue–Koshikawa–Yao corrigendum, DOI 10.1016/j.aim.2026.111223, advertises corrections to published Theorems 7.35–7.36. On 10 October 2026 only publisher/institutional metadata and the abstract were readable. ScienceDirect article/PDF requests returned 403; Elsevier FULL API requests returned 401 (API key required), and canonical metadata routes later returned 429. ArXiv 2306.00364 is still v1, and the checked Harvard/UCSB/Keio author or faculty pages supplied no corrected PDF. Thus corrected hypotheses and published/preprint numbering remain unread. Nodes 71–72 are explicitly provisional; do not replace the missing correction by speculation or by the ordinary PR.7 equivalence.

Affected nodes: `PrismaticCohomology:PR.8/laurent-f-crystals-local-systems`, `PrismaticCohomology:PR.8/smooth-proper-pushforward`.

### Suggested Lean signatures and discriminating examples

This checkpoint supplies 54 typed API/test forms out of 336 packet names (206 API items and 130 tests); 282 still occur only in documentation. The prior independent review recorded 40 of 332. The added forms include the actual Z_(p) computation at 1+p, a computed monoid-algebra delta operation, the free polynomial model with its evaluation/uniqueness contract, the rank-one prelog monoid Frobenius, and a full prelog prism carrier with invertibility, derived completeness and p-membership. Constructors count as typed forms, and anonymous examples count under their explicitly tagged packet names. The general non-rank-one Frobenius test is still a conditional lemma rather than the promised concrete completed-free example; most geometric targets and their APIs/tests remain untyped. Supply real declarations/examples using the suppliers and actual mathematical axioms, without opaque Prop placeholders. A successful elaboration does not discharge PROTOCOL §13 or establish any admitted proof.

Affected nodes: `PrismaticCohomology:PR.8/delta-log-ring`, `PrismaticCohomology:PR.8/delta-log-frobenius`, `PrismaticCohomology:PR.8/delta-log-free`, `PrismaticCohomology:PR.8/delta-log-completion-etale`, `PrismaticCohomology:PR.8/delta-log-associated-log`, `PrismaticCohomology:PR.8/delta-log-groupification`, `PrismaticCohomology:PR.8/delta-log-exactification`, `PrismaticCohomology:PR.8/prelog-prism`, `PrismaticCohomology:PR.8/log-prism`, `PrismaticCohomology:PR.8/standard-log-prisms`, `PrismaticCohomology:PR.8/prelog-prismatic-envelope`, `PrismaticCohomology:PR.8/log-prismatic-envelope`, `PrismaticCohomology:PR.8/envelope-flatness-smooth`, `PrismaticCohomology:PR.8/perfectoid-monoid`, `PrismaticCohomology:PR.8/perfect-log-prism`, `PrismaticCohomology:PR.8/perfect-log-prisms-perfectoid`, `PrismaticCohomology:PR.8/perfectoid-prelog-cotangent`, `PrismaticCohomology:PR.8/log-prismatic-site`, `PrismaticCohomology:PR.8/log-prismatic-cohomology`, `PrismaticCohomology:PR.8/absolute-log-prismatic-site`, `PrismaticCohomology:PR.8/cech-alexander-log`, `PrismaticCohomology:PR.8/log-prismatic-weak-base-change`, `PrismaticCohomology:PR.8/log-prismatic-etale-localization`, `PrismaticCohomology:PR.8/smooth-chart-covers`, `PrismaticCohomology:PR.8/log-hodge-tate-map`, `PrismaticCohomology:PR.8/hodge-tate-group-lemma`, `PrismaticCohomology:PR.8/hodge-tate-log-affine-line`, `PrismaticCohomology:PR.8/log-hodge-tate-comparison`, `PrismaticCohomology:PR.8/log-prismatic-base-change`, `PrismaticCohomology:PR.8/delta-log-crystalline-site`, `PrismaticCohomology:PR.8/delta-log-crystalline-vs-log-crystalline`, `PrismaticCohomology:PR.8/cartier-type-cosimplicial-frobenius`, `PrismaticCohomology:PR.8/crystalline-comparison-map`, `PrismaticCohomology:PR.8/local-crystalline-comparison`, `PrismaticCohomology:PR.8/log-crystalline-comparison`, `PrismaticCohomology:PR.8/log-q-pd-triple`, `PrismaticCohomology:PR.8/log-q-crystalline-site`, `PrismaticCohomology:PR.8/log-q-crystalline-vs-crystalline`, `PrismaticCohomology:PR.8/log-q-crystalline-vs-prismatic`, `PrismaticCohomology:PR.8/log-q-de-rham-complex`, `PrismaticCohomology:PR.8/semistable-aomega-comparison`, `PrismaticCohomology:PR.8/semistable-crys-bdr-diagram`, `PrismaticCohomology:PR.8/breuil-kisin-log-cohomology`, `PrismaticCohomology:PR.8/log-quasisyntomic-site`, `PrismaticCohomology:PR.8/log-qrsp`, `PrismaticCohomology:PR.8/log-qrsp-basis`, `PrismaticCohomology:PR.8/derived-log-prismatic`, `PrismaticCohomology:PR.8/derived-log-hodge-tate`, `PrismaticCohomology:PR.8/derived-log-properties`, `PrismaticCohomology:PR.8/derived-vs-site`, `PrismaticCohomology:PR.8/log-quasisyntomic-descent`, `PrismaticCohomology:PR.8/initial-log-prism-qrsp`, `PrismaticCohomology:PR.8/log-nygaard-filtration`, `PrismaticCohomology:PR.8/log-nygaard-graded`, `PrismaticCohomology:PR.8/nygaard-hodge-fiber-sequence`, `PrismaticCohomology:PR.8/log-l-eta-factorization`, `PrismaticCohomology:PR.8/log-de-rham-comparison`, `PrismaticCohomology:PR.8/log-frobenius-isogeny`, `PrismaticCohomology:PR.8/kummer-etale-site-log-scheme`, `PrismaticCohomology:PR.8/log-scheme-vs-log-adic-kummer`, `PrismaticCohomology:PR.8/affine-kummer-etale-comparison`, `PrismaticCohomology:PR.8/log-diamond`, `PrismaticCohomology:PR.8/log-diamond-generic-fibre`, `PrismaticCohomology:PR.8/stdisc-log-perfectoid`, `PrismaticCohomology:PR.8/quasi-pro-kummer-etale-site`, `PrismaticCohomology:PR.8/kummer-tower-covers`, `PrismaticCohomology:PR.8/kummer-etale-vs-qpket`, `PrismaticCohomology:PR.8/global-etale-comparison`, `PrismaticCohomology:PR.8/kummer-local-systems`, `PrismaticCohomology:PR.8/laurent-f-crystal`, `PrismaticCohomology:PR.8/laurent-f-crystals-local-systems`, `PrismaticCohomology:PR.8/smooth-proper-pushforward`, `PrismaticCohomology:PR.8/etale-comparison-over-ainf`, `PrismaticCohomology:PR.8/log-hyodo-kato-isomorphism`, `PrismaticCohomology:PR.8/log-prismatic-bkf-module`, `PrismaticCohomology:PR.8/semistable-chart-application`.

### Supplier hypotheses and interface extensions

The present T6 log-sites packet exports general locally noetherian fs log adic spaces, their ringed Kummer site and higher direct images, covering node60 and the noetherian comparison input of node62. PR.4 exports the arbitrary p-adic formal/affine derived etale comparison, and PR.7 the ordinary Laurent/perfect-complex equivalence and crystal descent; these are now exact prerequisites, not missing extensions. Still unresolved: C0 completed untilt structure sheaves and condensed/profinite module interfaces on general diamonds; CR.6 rational crystalline base change for proper Cartier-type fs objects over O_C with a chosen section k→O_C/p; and the commuting-endomorphism cochain Koszul carrier/sign/completion adapter required through AI.1/DD.1. General log perfectoid/log diamond constructions remain PR.8 targets and cannot be certified by T6’s noetherian contract. Exact-node planning imports are not claims of implementations.

Affected nodes: `PrismaticCohomology:PR.8/log-diamond`, `PrismaticCohomology:PR.8/log-diamond-generic-fibre`, `PrismaticCohomology:PR.8/kummer-local-systems`, `PrismaticCohomology:PR.8/laurent-f-crystal`, `PrismaticCohomology:PR.8/laurent-f-crystals-local-systems`, `PrismaticCohomology:PR.8/smooth-proper-pushforward`, `PrismaticCohomology:PR.8/log-hyodo-kato-isomorphism`, `PrismaticCohomology:PR.8/log-q-de-rham-complex`.

## Coverage and acceptance

Coverage for PR.8 is **partial**. The reviewed 76-node target density is retained; proof interiors belong in sketches rather than an expanded declaration inventory. Remaining work:

- Obtain the full 2026 corrigendum and published article; replace the provisional Laurent equivalence and check the smooth-proper pushforward consequences. No corrected hypotheses or version numbering are yet verified.
- Provide actual suggested signatures/examples for the still-untyped API/test contracts and comparison targets. The concrete delta-log/free/prism core is strengthened, but documentation-only names remain an explicit PROTOCOL §13 deficit.
- Resolve the exact recorded Riemann–Hilbert, arc-descent, completed diamond coefficient, Cartier-type O_C Hyodo–Kato and commuting-endomorphism Koszul inputs; finish the non-fine Koshikawa/derived-log supplier interface reconciliation.
- Target-level proof-interior refinement remains as recorded in the independent review: KY Lemmas4.18,4.20,6.6,6.9–6.10,6.17–6.18,8.5–8.6 and Proposition2.47; any lemma-level subdivision belongs to the later refinement job.

Acceptance requires resolution of the source gate and proof dependencies, real suggested declarations and discriminating examples for the outstanding contracts, agreement among the packet/reader/suggested file, successful pinned elaboration and a new independent decision. The retained `needs_changes` review remains historical evidence. This checkpoint makes no acceptance decision.
