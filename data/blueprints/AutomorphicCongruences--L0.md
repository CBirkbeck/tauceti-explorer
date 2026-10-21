# Roadmap: Automorphic congruences and reverse main-conjecture divisibilities

Part L0 of the roadmap `AutomorphicCongruences`: stages L0, L1, L2, L2s, L3, L4, L5 and L5a. The stages L5b and L5w are planned in the accepted part `AutomorphicCongruences--L5b`. This document and the packet `research/blueprint/packets/AutomorphicCongruences--L0.json` agree node by node; the suggested Lean file is `research/blueprint/suggested/AutomorphicCongruences--L0.lean`.

## Scope and ownership

Kato's Euler system gives one divisibility in the main conjectures for modular forms. This roadmap plans the opposite divisibility through Eisenstein congruences and Galois extension classes, and the universal-family form through deformation theory and zeta morphisms: Skinner–Urban's ordinary theorem (L1), the Castella–Liu–Wan and Fouquet–Wan GU(3,1) arguments (L2s, L2), Fouquet–Wan's pointwise and universal-family theorems with Nakamura's zeta morphism (L3, L4), and the early input of Burungale–Castella–Skinner (L5a). No general main conjecture for an arbitrary unitary representation is asserted, and every theorem keeps its source's hypotheses.

- Restructuring RS-11 (research/blueprint/restructure/RS-11.result.json) assigns SU's U(2,2) bound to L1, FW §4.8's ordinary reverse bound to L2 (with KatoEulerSystems:L4 inside its proof), the FW pointwise and family endpoints to L4, BCS's rational/integral cyclotomic theorem to L5b, and the ordinary BSTW comparison to a planned KatoEulerSystems:L5; L5 is an aggregate. Its fixed version awaits REV-FIX-RT-RS-11; the previously accepted version made the same layer assignments, and this packet follows them.
- Generic congruence modules: PadicFamilies:L1; generalized matrix algebras, reducibility ideals and Ribet lattices: IntegralHeckeAndGaloisDeterminants:IHG.1/IHG.6 (a TauCetiRoadmap pull request); characteristic ideals and determinant lines: PadicMeasuresIwasawaAlgebras (now on TauCetiRoadmap main, layers 4.6 and 5.1); unitary Shimura varieties and doubling: AutomorphicPadicLFunctions:L4/L4e; Jacobi groups and Fourier–Jacobi periods: MetaplecticAutomorphicForms:MP.6; Galois representations of unitary groups: AutomorphicGaloisRepresentationsPartII; completed cohomology: CompletedCohomologyAndLocalGlobalCompatibility:R31.4; p-adic local Langlands: PadicLocalLanglandsForGL2Qp:R30.5–R30.6; co-Whittaker families: SmoothRepresentationsOfLocalGroups:SR.5; Kato's zeta classes: KatoEulerSystems:L2–L4; Yager modules: GeneralizedHeegnerCycles:GH.7.

## Conventions

- Selmer groups are Σ-primitive (no condition at Σ, unramified elsewhere away from p, ordinary or Greenberg at p) unless stated; characteristic ideals are divisorial ideals of height-one lengths over noetherian normal rings.
- 'Ch ⊆ (L)' (equivalently L divides Ch) is the reverse divisibility proved by Eisenstein congruences; Kato's Euler-system bound is the opposite one.
- SU's p-adic L-functions use the canonical periods Ω^±\_f; no comparison with Gross periods is assumed.
- Hecke polynomials and Euler factors use geometric Frobenius, as in SU and Nakamura; FW's cohomological normalization T(f) = M(f)\_{et,p}(k/2) is kept where FW's statements are quoted.

## Sources

- **SU-2014**: Christopher Skinner and Eric Urban, *The Iwasawa main conjectures for GL2*, Inventiones mathematicae 195 (2014), 1–277. Read in the authors' final copy (226 pages, dated 21 December 2012), whose page numbers are its own and are the ones cited here. [https://www.math.columbia.edu/~urban/eurp/MC.pdf](https://www.math.columbia.edu/~urban/eurp/MC.pdf). Read 2026-10-19: §1 introduction pp. 1–12 (outline); §3.1.3 (Σ-primitive Selmer groups) p. 18; §3.1.8 (Fitting and characteristic ideals, Lemma 3.1.7) pp. 20–21; §3.2 (Prop. 3.2.3, Prop. 3.2.8, Cor. 3.2.9, Prop. 3.2.11, Lemma 3.2.15, Cor. 3.2.16, Lemma 3.2.17) pp. 21–27; §3.5.4–§3.6 (Conj. 3.5.5, Thm 3.5.6, Thm 3.6.1 with its remarks, Cor. 3.6.2, Cor. 3.6.3, Thm 3.6.4) pp. 41–44; §4 (constructing cocycles: §4.1.2, Lemma 4.1.3, set-up 4.2.1–4.2.3, Props 4.4.5, 4.5.4, 4.5.6, Cor. 4.5.7, Prop. 4.5.8) pp. 47–61. Read 2026-10-19 for statements only: §6.5 (Eisenstein datum, (6.5.2.a), Eisenstein ideal (6.5.3.a), Thm 6.5.4) pp. 96–98; §7.2–7.3 (Prop. 7.2.1, Thm 7.3.1, set-up of 7.3.2, Thm 7.3.3, Thm 7.3.5 and its proof) pp. 101–108; Thm 12.3.1 p. 199, Prop. 12.3.6 p. 202, Thms 12.4.1–12.4.2 pp. 202–203, Prop. 13.4.1 p. 217; section and theorem headings of §§5, 6, 9, 10, 11, 12, 13 (scripted listing of every numbered statement). Not read: the proofs in §§5, 6, 9, 10, 11 (Shimura varieties, Hida theory, the Klingen and Siegel Eisenstein series computations) and §13.1–13.3; they are cited by number only.
- **FW-v3**: Olivier Fouquet and Xin Wan, *The Iwasawa main conjecture for universal families of modular motives*, arXiv:2107.13726v3 (103 pages); page numbers are those printed, which equal the PDF pages. [https://arxiv.org/pdf/2107.13726v3](https://arxiv.org/pdf/2107.13726v3). Read 2026-10-19: §1 (Conj. 1.5, Thm 1.6 and the remark before it, Thms 1.7–1.8, Cors 1.9–1.10) pp. 6–8; §1.2 outline (Conj. 1.11, Thms 1.12–1.13, the diagrams (1.2.1)–(1.2.3)) pp. 9–14; §2 (Assumption 2.1, Lemma 2.2, Prop. 2.4, Cor. 2.5, Prop. 2.6, Cor. 2.7) pp. 17–20; §3.2.1 (Assumption 3.5, Thm 3.6 and the remark on p ≥ 5) p. 24; §3.3 (Lemma 3.17, Defs 3.18–3.19, Prop. 3.20) pp. 31–32; Conj. 3.30 p. 36; Thm 4.38, Def. 4.39, Thm 4.41, Prop. 4.42 pp. 58–59; Thm 4.51 p. 65; §4.8 p. 68; §5 (Thms 5.1–5.2, Cors 5.3–5.4, Props 5.5–5.8 and the proof of Thm 5.1) pp. 68–73; Appendix A statements Props 6.7–6.9, Thm 6.10 pp. 77–79; Appendix B statements Prop. 7.19, Cor. 7.21, Lemma 7.22, Prop. 7.29, Def. 7.30, Lemma 7.31, Thm 7.32 and its proof pp. 88–97. Read for statements only (scripted listing of every numbered statement with its page): §§3.1–3.4, 4.1–4.7, 6.1–6.3, 7.1–7.4. Not read: the proofs of §§4.1–4.7 (Pottharst's analytic Iwasawa theory, the Yager-module computations and the p-power argument of §4.6.3) and of Appendix B §7.3; they are cited by number only.
- **CLW-v1**: Francesc Castella, Zheng Liu and Xin Wan, *Iwasawa–Greenberg main conjecture for non-ordinary modular forms and Eisenstein congruences on GU(3,1)*, arXiv:2109.08375v1 (83 pages); page numbers are the PDF pages. [https://arxiv.org/pdf/2109.08375v1](https://arxiv.org/pdf/2109.08375v1). Read 2026-10-19: §1 pp. 2–3 (Selmer group (1.0.1)–(1.0.2), Def. 1.0.1, interpolation (1.0.3), Remark 1.0.2, Conj. 1.0.3); Thm 2.9.1 p. 13; Prop. 4.4.1 p. 24; Thm 4.6.1 p. 29; §5.2–5.4 pp. 31; Thm 5.9.1 p. 42; §6.1 and Thm 6.1.1 p. 46; Thm 8.1.1 p. 77; Thm 8.2.1 and its proof pp. 78–81. Read for statements only (scripted listing): §§3, 5.5–5.10, 7.4–7.12. Not read: the proofs of §§3–7.
- **NAK-v2**: Kentaro Nakamura, *Zeta morphisms for rank two universal deformations*, arXiv:2006.13647v2 (109 pages), read; published in Inventiones mathematicae 234 (2023), 171–290 (open access). Theorem numbers below are those of arXiv v2; where §5 of the published version renumbers (it adds Conjecture 5.8), the published number is given as well, as in research/blueprint/papers/PAPER-NAKAMURA-23.result.json. [https://arxiv.org/pdf/2006.13647v2](https://arxiv.org/pdf/2006.13647v2). Read 2026-10-19: §1 (Thm 1.1, Remark 1.2, Conj. 1.3, Thm 1.4) pp. 4–7; Thm 2.2 p. 20; §4.1 (assumptions, (47)–(48), Lemma 4.1) p. 63; Cor. 4.2 and §4.2 (54)–(55) p. 65; Thm 4.3, Remark 4.4, Thm 4.5 p. 66; §5.3 Thms 5.7, 5.8, 5.10, 5.13, Cor. 5.14 and Conjs 5.9, 5.11, 5.12 pp. 79–80. Read for statements only (scripted listing): §2 (Thm 2.1, Cor. 2.5, 2.7, 2.8), §3 (Thm 3.2, Cor. 3.6, Prop. 3.8, Cors 3.10–3.11, 3.14, Prop. 3.15, Thm 3.16, Prop. 3.17), §4.3–4.4 (Thm 4.7, Cor. 4.8, Prop. 4.9), §5.1–5.2 (Conj. 5.1, Thm 5.2, Cors 5.4, 5.6). The paper-route extraction PAPER-NAKAMURA-23 (which read the published version in full) supplied the published locators. Not read: the proofs of §§2–4 and the appendices.
- **BCS-v2**: Ashay Burungale, Francesc Castella and Christopher Skinner, *Base change and Iwasawa main conjectures for GL2*, arXiv:2405.00270v2 (12 pages). [https://arxiv.org/pdf/2405.00270v2](https://arxiv.org/pdf/2405.00270v2). Whole paper read 2026-10-19, pp. 1–12: Thm 1.1.2, hypotheses (irr\_Q), (im), (disc), (Heeg), (spl); §2 (Selmer groups over a CM quadratic extension, (spl\_F), (Δ), Conj. 2.2.1); §3 (Hypothesis 3.1.1, Remark 3.1.2, Thm 3.2.1); §4 (Conjs 4.1.1–4.1.2, Thm 4.1.3, Cor. 4.1.4, Thm 4.2.1, Prop. 4.2.2); §5 (Lemmas 5.1.1–5.1.2, Prop. 5.2.1, Lemma 5.2.3, proof of Thm 1.1.2).
- **CW-v1**: Francesc Castella and Xin Wan, *The Iwasawa main conjectures for GL2 and derivatives of p-adic L-functions*, arXiv:2001.03878v1 (33 pages). [https://arxiv.org/pdf/2001.03878v1](https://arxiv.org/pdf/2001.03878v1). Read 2026-10-19: Thm 3.6 (Kings–Loeffler–Zerbes classes and Coleman maps) and its proof p. 15; Cor. 3.7 and Thm 3.8 p. 16; scripted listing of all numbered statements.
- **WAN-RS**: Xin Wan, *Iwasawa main conjecture for Rankin–Selberg p-adic L-functions*, arXiv:1408.4044v5 (15 September 2019, 100 pages); published in Algebra & Number Theory 14 (2020). Cited as Wan20 by CLW and as \[126] by FW. [https://arxiv.org/pdf/1408.4044v5](https://arxiv.org/pdf/1408.4044v5). Read 2026-10-19: introduction pp. 1–6 (Thms 1.1–1.2, their hypotheses, and the five-step outline of the Fourier–Jacobi argument). Not read: §§2–9; the lattice construction (Prop. 9.2) is cited as CLW and FW cite it.

## How to read the build

Each layer lists its nodes in dependency order. A node gives its statement, hypotheses, proof outline and checks; a definition or construction also gives where it is used, its API and at least three unit tests that a wrong definition fails. Prerequisites are node ids of this packet, of other roadmaps' packets, stage ids, or pinned library declarations. 'Planet' marks the nodes the atlas shows.

## Layer L0: Congruence modules and Selmer classes

This layer holds the algebra that turns an Eisenstein congruence into a lower bound for a Selmer group. The Selmer groups are the Σ-primitive ones of Skinner–Urban §3, compared with the primitive ones through local Euler factors and specialized along quotients of Iwasawa algebras. The Eisenstein ideal measures the congruence on the automorphic side. Skinner–Urban's lattice construction (§4) produces Galois extension classes from a polarized representation whose trace is congruent to a sum of a two-dimensional representation and two characters, with the ordinary condition at p. The generic congruence module and congruence ideal are PadicFamilies L1's; generalized matrix algebras and Ribet lattices are IntegralHeckeAndGaloisDeterminants IHG.1 and IHG.6's.

### Σ-primitive ordinary Selmer groups over Iwasawa towers

`AutomorphicCongruences:L0/sigma-primitive-selmer` (construction). Planet: Σ-primitive Selmer groups.

**Statement.** Let F be a number field, A a profinite ℤ\_p-algebra, T a free A-module of finite rank with a continuous A-linear G\_F-action, and for each place v | p a G\_{F\_v}-stable A-direct summand T\_v ⊆ T with T/T\_v free. For a finite set Σ of finite places, Sel^Σ\_F(T,(T\_v)) is the kernel of the restriction from H¹(F, T ⊗\_A A^∨) (A^∨ the Pontryagin dual) to the product over v ∉ Σ, v ∤ p of H¹(I\_v, T ⊗ A^∨) and over v | p of H¹(I\_v, (T/T\_v) ⊗ A^∨): no condition at Σ, unramified elsewhere away from p, and the ordinary (Greenberg) condition at p. Its dual X^Σ\_F = Hom\_A(Sel^Σ\_F, A^∨) is finitely generated over A. For an extension E/F inside a ℤ\_p^d-tower, Sel^Σ\_E is the direct limit over finite subextensions and X^Σ\_E the inverse limit, and Shapiro's lemma identifies Sel^Σ\_{F\_∞}(T) with Sel^Σ\_F(T ⊗\_A Λ\_{F,A}(ε\_F^{-1})) as Λ\_{F,A}-modules, where Λ\_{F,A} = A ⊗̂ ℤ\_p\[\[Gal(F\_∞/F)]] and ε\_F is the tautological character. When A is noetherian and normal, Ch^Σ\_{F,A}(T) denotes the characteristic ideal of X^Σ\_F(T) and Ft^Σ\_{F,A}(T) its Fitting ideal.

**Hypotheses.**

- T free of finite rank over the profinite ℤ\_p-algebra A, with a continuous action of G\_F; T\_v free direct summands with free quotients for v | p.
- Σ finite; when Σ contains every place where T ramifies and every place above p, the definition reduces to a kernel on H¹(G\_{F,Σ}, −).
- The characteristic ideal is used only over noetherian normal A, as the divisorial ideal of height-one lengths.

**Proof outline.**

1. Instantiate the upstream Selmer-structure carrier with the relaxed condition at Σ, the unramified condition at v ∉ Σ ∪ {p} and the Greenberg condition attached to T\_v at v | p.
2. Finite generation of the dual: H¹(G\_{F,S}, M ⊗ A^∨) is cofinitely generated for finitely generated M (SU Lemma 3.1.9, after Greenberg).
3. Shapiro: the coinduced module of A^∨ along Gal(F\_n/F) has direct limit Λ\_{F,A}^∨(ε\_F^{-1}); the restriction maps at v correspond to the products over places of F\_n above v (SU 3.1.2, Prop. 3.2.3).
4. Define Ch^Σ via the height-one length divisor of X^Σ and Ft^Σ via Fitting ideals of a presentation.

**Checks.**

- For T = A(χ) with T\_v = 0 at every v | p and Σ ⊇ {places above p} ∪ ram(χ), Sel^Σ\_F is the full H¹(G\_{F,Σ}, A(χ) ⊗ A^∨).
- Enlarging Σ can only enlarge Sel^Σ; the quotient is controlled by local unramified cohomology (L0/primitive-imprimitive-comparison).

**Uses.**

- SU-2014 Thm 3.6.1, p. 41: Ch^Σ\_{K\_∞}(f) is the characteristic ideal of the Σ-primitive dual over the two-variable tower
- CLW-v1 proof of Thm 8.2.1, p. 79: the Σ ∪ {ℓ,ℓ′}-primitive Selmer group in the lattice argument
- BCS-v2 §2, p. 6: the ordinary Selmer group H¹\_{F\_Λ}(M, M\_g) over a quartic CM tower, consumed by L5a
- AutomorphicCongruences:L5b/cyclotomic-control: the Σ-primitive groups whose specialization L5b controls

**API.**

- `SigmaSelmer.mk` (constructor): Sel^Σ\_F(T,(T\_v)) as an A-submodule of H¹(F, T ⊗\_A A^∨), defined by the local conditions above.
- `SigmaSelmer.dual` (data): X^Σ\_F = Hom\_A(Sel^Σ\_F, A^∨), finitely generated over A.
- `SigmaSelmer.mono` (functoriality): Σ ⊆ Σ′ gives an inclusion Sel^Σ ⊆ Sel^{Σ′} and a surjection X^{Σ′} → X^Σ.
- `SigmaSelmer.shapiro` (equivalence): Sel^Σ\_{F\_∞}(T) ≅ Sel^Σ\_F(T ⊗\_A Λ\_{F,A}(ε\_F^{-1})) as Λ\_{F,A}-modules, compatibly with the local conditions.
- `SigmaSelmer.charIdeal` (data): Ch^Σ\_{F,A}(T) := charIdeal of X^Σ over noetherian normal A, with Ch = Char(A/Ft).
- `SigmaSelmer.baseChange` (compatibility): For an ideal 𝔞 with A/𝔞 profinite, the natural map X^Σ(T)/𝔞 → X^Σ(T/𝔞T) (an isomorphism under L0/selmer-specialization-control).
- `SigmaSelmer.of_upstream` (coercion): Agreement with the upstream galois-selmer-group for the Selmer structure (relaxed at Σ, unramified, Greenberg at p).

**Unit tests.**

- `sigmaSelmer_full_relaxed` (degenerate): If T\_v = T for every v | p and Σ contains every place of ramification, Sel^Σ\_F = H¹(G\_{F,Σ}, T ⊗ A^∨); a definition imposing a condition at Σ fails this.
- `sigmaSelmer_trivial_coefficients` (computation): For F = ℚ, A = ℤ\_p, T = ℤ\_p with trivial action, T\_p = 0 and Σ = ∅, Sel^∅\_{ℚ\_∞} = Hom(Gal(L\_∞/ℚ\_∞), ℚ\_p/ℤ\_p) for L\_∞ the maximal unramified abelian pro-p extension of ℚ\_∞, which is ℚ\_∞ itself; so X = 0 and Ch = Λ.
- `sigmaSelmer_strict_is_not_ordinary` (non-example): Taking T\_v = 0 at v | p (the strict condition) gives a different module from the ordinary one for an ordinary modular T; the two differ by H¹(I\_v, T\_v ⊗ A^∨).
- `sigmaSelmer_upstream_agreement` (agreement): For the relaxed/unramified/Greenberg structure, SigmaSelmer.of\_upstream identifies the module with SelmerIwasawaCohomology:L2/galois-selmer-group.

**Prerequisites.** `SelmerIwasawaCohomology:L2/selmer-data`, `SelmerIwasawaCohomology:L2/greenberg-condition`, `SelmerIwasawaCohomology:L2/unramified-condition`, `SelmerIwasawaCohomology:L2/galois-selmer-group`, `SelmerIwasawaCohomology:L2/pontryagin-dual`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-0`, `tauceti:TauCeti.ContCohomology.H1`, `mathlib:Module.length`, `mathlib:LocalizedModule`.

**Sources.**

- SU-2014, §3.1.3, p. 18: Skinner–Urban define the Σ-primitive Selmer group by unramified conditions outside Σ ∪ {p} and the ordinary condition given by T\_v at p, with its Pontryagin dual X^Σ.
- SU-2014, §3.1.8, pp. 20–21, and Prop. 3.2.3, p. 21: Characteristic and Fitting ideals of X^Σ, and Shapiro's identification of the tower Selmer group with one over Λ\_{F,A}.
- CLW-v1, (1.0.1)–(1.0.2) p. 3 and proof of Thm 8.2.1, p. 79: CLW use the instance with relaxed condition at one prime above p and unramified at the other, and its Σ ∪ {ℓ,ℓ′}-primitive variant.

### Primitive against Σ-primitive Selmer groups and the removed Euler factors

`AutomorphicCongruences:L0/primitive-imprimitive-comparison` (theorem).

**Statement.** Let T, (T\_v) and A be as in L0/sigma-primitive-selmer with A noetherian normal, F = ℚ or an imaginary quadratic field K, and S a finite set of finite places not above p at which T is unramified, contained in Σ. Then (i) Ch^Σ\_{F,A}(T) ⊇ Ch^{Σ∖S}\_{F,A}(T) · ∏\_{v∈S} det\_A(1 − q\_v^{-1} frob\_v^{-1} | T) (SU Lemma 3.2.15, Cor. 3.2.16); (ii) over ℚ\_∞, the Pontryagin dual of H¹\_Σ(ℚ\_∞, T ⊗ A^∨) = ∏\_{v∈Σ, v∤p} H¹(ℚ\_{∞,v}, T ⊗ A^∨) is a finitely generated torsion Λ\_{ℚ,A}-module with no nonzero pseudo-null submodule, and its characteristic ideal is generated by ∏\_{ℓ∈Σ} P\_{T,ℓ}(ℓ^{-1} ε\_ℚ(frob\_ℓ)), P\_{T,ℓ}(X) = det(1 − frob\_ℓ X | T^{I\_ℓ}) (SU Lemma 3.2.17); (iii) when the primitive dual is torsion and the global-to-local map is surjective (Greenberg–Vatsal), Ch^Σ = Ch^∅ · ∏\_{ℓ∈Σ} P\_{T,ℓ}(ℓ^{-1}ε(frob\_ℓ)) (SU Prop. 3.2.18). On the analytic side the Σ-imprimitive p-adic L-functions are defined by multiplying the primitive ones by the same Euler-factor elements, so every removed factor is matched by the identical element of Λ.

**Hypotheses.**

- (i) needs only T unramified at S and A noetherian normal; (ii) is over the cyclotomic tower (local Tate duality at each finite level, passed to the limit); (iii) needs torsion of the Σ-primitive dual and surjectivity of the localization map, which SU Prop. 3.2.18 derives from the hypotheses of §3.2.
- The Euler factor uses the geometric Frobenius on inertia invariants; at a Steinberg place T^{I\_ℓ} has rank one.

**Proof outline.**

1. (i): the cokernel of Sel^{Σ∖S} → Sel^Σ injects into ∏\_{v∈S} H¹(I\_v, T ⊗ A^∨)^{G\_{F\_v}}, whose dual has characteristic ideal det(1 − q\_v^{-1}frob\_v^{-1}|T) because T is unramified at v.
2. (ii): Shapiro over ℚ\_∞ and local Tate duality compute the local terms; each is Λ-torsion with characteristic ideal the displayed Euler factor, and has no pseudo-null submodule.
3. (iii): with the localization map surjective the sequence 0 → Sel^∅ → Sel^Σ → H¹\_Σ → 0 is exact, and multiplicativity of characteristic ideals gives equality.
4. Analytic matching: the Σ-imprimitive p-adic L-function is by definition the primitive one times ∏\_{ℓ∈Σ} P\_ℓ(ℓ^{-1}γ\_ℓ), so the comparison of characteristic ideals and of analytic functions involves the same elements.

**Checks.**

- The comparison is used in both directions: one-sided bounds are proved for Σ-primitive objects and transferred to the primitive ones without losing a factor.
- Steinberg check: for ℓ ∥ N with π\_ℓ an unramified twist of Steinberg, the factor is 1 − a\_ℓ ℓ^{-1} ε(frob\_ℓ) with a\_ℓ = ±1, a unit times a distinguished polynomial of degree zero in Λ.

**Prerequisites.** `AutomorphicCongruences:L0/sigma-primitive-selmer`, `SelmerIwasawaCohomology:L2/condition-change-triangle`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `PadicMeasuresIwasawaAlgebras:L4/pseudo-null`, `ArithmeticGaloisDuality:R02.4/poitou-tate`.

**Sources.**

- SU-2014, Lemma 3.2.15, Cor. 3.2.16, Lemma 3.2.17, p. 26; Prop. 3.2.18, p. 27: The three comparisons of Selmer groups as Σ varies, with the Euler-factor characteristic ideals.
- CLW-v1, proof of Thm 8.2.1, p. 79: CLW reduce to the Σ ∪ {ℓ,ℓ′}-primitive inclusion using that unramified local cohomology is controlled by local Euler factors (Greenberg–Vatsal Prop. 2.4).

### Specializing Σ-primitive Selmer groups and their characteristic ideals

`AutomorphicCongruences:L0/selmer-specialization-control` (theorem).

**Statement.** Let F\_∞ be ℚ\_∞, K\_∞ or K^+\_∞, A a profinite ℤ\_p-algebra, 𝔞 ⊂ A an ideal and T as in L0/sigma-primitive-selmer. Assume the hypotheses of SU Prop. 3.2.8 (the inertia at p acts on T/T\_p through a quotient compatible with the tower, and the relevant H⁰ terms vanish), so that X^Σ\_{F\_∞}(T)/𝔞 ≅ X^Σ\_{F\_∞}(T/𝔞T). Then (i) Ft^Σ\_{F,A/𝔞}(T/𝔞T) = Ft^Σ\_{F,A}(T) mod 𝔞; (ii) if A and A/𝔞 are noetherian normal domains and (f) ⊇ Ch^Σ\_{F,A}(T) is principal, then f mod 𝔞 divides Ch^Σ\_{F,A/𝔞}(T/𝔞T); in particular when A is factorial Ch^Σ\_{F,A}(T) mod 𝔞 divides Ch^Σ\_{F,A/𝔞}(T/𝔞T). (iii) For the descent K\_∞ → K^+\_∞ along I^- = ker(Λ\_K → Λ\_ℚ), X^Σ\_{K\_∞}(T)/I^- ≅ X^Σ\_{K^+\_∞}(T), and when A is factorial Ch^Σ\_{K\_∞}(T) mod I^- divides Ch^Σ\_{K^+\_∞}(T).

**Hypotheses.**

- The control isomorphism for a general ideal 𝔞 of the coefficient ring is SU Prop. 3.2.8 and is owned here; the upstream derived control (SelmerIwasawaCohomology:L3) covers the specialization to finite layers of a one-variable tower and is used only there. The control isomorphism needs SU Prop. 3.2.8's hypotheses; without them only a map with kernel and cokernel controlled by H⁰ and local terms exists.
- Characteristic ideals do not commute with base change in general; only the principal majorant transfers (ii). A specialization at which f vanishes gives no information.

**Proof outline.**

1. Fitting ideals commute with base change of a presentation (i).
2. The characteristic ideal is the smallest divisorial ideal containing the Fitting ideal; a principal ideal is divisorial, so (f) ⊇ Ch ⊇ Ft and reduction gives f mod 𝔞 ∣ Ft(T/𝔞) ⊆ Ch(T/𝔞) (ii).
3. For (iii), Shapiro along Γ^-\_K and Prop. 3.2.8 identify Sel^Σ\_{K^+\_∞} with the I^- torsion of Sel^Σ\_{K\_∞}, and (ii) applies.

**Checks.**

- Vanishing check: if f ∈ 𝔞 the conclusion of (ii) is empty, and no cancellation of f against the specialized characteristic ideal is allowed.
- Used by L1/su-cyclotomic-divisibility (descent from two variables to the cyclotomic line) and by L5a/quartic-cm-selmer-restriction.

**Prerequisites.** `AutomorphicCongruences:L0/sigma-primitive-selmer`, `SelmerIwasawaCohomology:L3/derived-control`, `PadicMeasuresIwasawaAlgebras:L6/higher-fitting-base-change`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`.

**Sources.**

- SU-2014, Prop. 3.2.8, p. 23; Cor. 3.2.9, Prop. 3.2.11, p. 24: The control isomorphism, the Fitting base change, the principal-majorant divisibility and the descent from K\_∞ to K^+\_∞.
- BCS-v2, proof of Lemma 5.1.1, p. 9: BCS apply SU Props 3.6–3.7 and Cor. 3.8 (journal numbering) to restrict from a quartic CM tower to K.

### The Eisenstein ideal of an Eisenstein family

`AutomorphicCongruences:L0/eisenstein-ideal` (definition). Planet: Eisenstein ideal.

**Statement.** Let Λ be a noetherian complete local domain, 𝕋 a reduced finite Λ-algebra generated over Λ by the images of a set 𝒯 of Hecke operators acting on a space of Λ-adic cusp forms, and λ: 𝒯 → Λ the system of eigenvalues of a Λ-adic Eisenstein family E (a Λ-algebra homomorphism from the abstract Hecke algebra). The Eisenstein ideal I\_E ⊆ 𝕋 is the ideal generated by t − λ(t) for t ∈ 𝒯; when the structure map Λ → 𝕋/I\_E is surjective, the Eisenstein ideal of Λ is its kernel E\_E, so that Λ/E\_E ≅ 𝕋/I\_E. When I\_E is proper, 𝕋\_E denotes the localization of 𝕋 at the maximal ideal containing I\_E.

**Hypotheses.**

- 𝕋 is generated over Λ by 𝒯 together with the U\_p-operators, so Λ → 𝕋/I\_E is surjective; otherwise E\_E is defined as the kernel on the image.
- The Hecke operators are those at primes outside a fixed finite set Σ, the U\_p-operators, and the central or diamond operators used by the source.

**Proof outline.**

1. Define I\_E as the ideal generated by {t − λ(t) : t ∈ 𝒯} and E\_E := ker(Λ → 𝕋/I\_E).
2. Surjectivity follows because the generators of 𝕋 over Λ act by scalars of Λ modulo I\_E.

**Checks.**

- The congruence statements of L1, L2 and L2s are lower bounds ord\_P(E\_E) ≥ ord\_P(L) for height-one primes P of Λ, from a cuspidal family congruent to E.

**Uses.**

- L1/eisenstein-datum: the SU generators of I\_D
- L2s/clw-eisenstein-congruence: E\_{π,ξ} bounded below by L\_{π,K,ξ}L\_{ξ,ℚ}
- L2/fw-fourier-jacobi-unit: Lemma 7.31's comparison ord\_P(L) ≤ ord\_P(E\_D)
- L0/lattice-construction: the ideal J := E\_E A and I := I\_E R of the abstract set-up

**API.**

- `EisensteinIdeal.hecke` (constructor): I\_E ⊆ 𝕋 generated by t − λ(t), t ∈ 𝒯.
- `EisensteinIdeal.base` (constructor): E\_E := ker(Λ → 𝕋/I\_E).
- `EisensteinIdeal.quotientEquiv` (equivalence): Λ/E\_E ≃ 𝕋/I\_E as Λ-algebras when the structure map is onto.
- `EisensteinIdeal.localize` (functoriality): Formation of I\_E and E\_E commutes with localization at a height-one prime P of Λ and completion.
- `EisensteinIdeal.proper_iff` (characterisation): E\_E ≠ Λ iff some cuspidal eigensystem is congruent to λ modulo the maximal ideal.
- `EisensteinIdeal.mono` (functoriality): Enlarging 𝒯 enlarges I\_E; restricting to a direct factor of 𝕋 enlarges E\_E.

**Unit tests.**

- `eisensteinIdeal_ramanujan_level1` (computation): For weight 12, level 1 cusp forms over ℤ\_691 with E = E\_12 (λ(T\_ℓ) = 1 + ℓ^{11}), 𝕋 = ℤ\_691 and E\_E = (691), since τ(ℓ) ≡ 1 + ℓ^{11} mod 691 and the numerator of B\_12/24 has 691-adic valuation one.
- `eisensteinIdeal_no_congruence` (degenerate): If no cusp form is congruent to E, then I\_E = 𝕋 and E\_E = Λ (for example weight 12 at p = 5).
- `eisensteinIdeal_mazur` (agreement): For weight two, level a prime N and p ∣ numerator((N − 1)/12), E\_E is Mazur's Eisenstein ideal localised at p: generated by T\_ℓ − 1 − ℓ and 1 + w\_N.
- `eisensteinIdeal_not_congruence_ideal` (non-example): E\_E differs from the congruence ideal of a cuspidal eigenform: for weight 12, level 1 and p = 691 the congruence ideal of Δ in the cuspidal Hecke algebra is the unit ideal (𝕋 = ℤ\_p), while E\_E = (691).

**Prerequisites.** `mathlib:Ideal.span`, `mathlib:RingHom.ker`, `mathlib:Ideal.map`.

**Sources.**

- SU-2014, §6.5.3, pp. 97–98, (6.5.3.a): Skinner–Urban define I\_D by the coefficients of Q\_v(X) − Q\_{v,D}(X), the U\_p-relations and the central operators, and E\_D as the kernel of Λ\_D → h\_D/I\_D.
- FW-v3, Def. 7.30, p. 96: Fouquet–Wan define I\_D by t − λ(t) for the Klingen Eisenstein family and E\_D as its inverse image in O\[\[Γ\_K]].
- CLW-v1, proof of Thm 8.2.1, p. 79: The ideal E\_{π,ξ} used in the set-up (5).

### The Skinner–Urban lattice datum

`AutomorphicCongruences:L0/su-lattice-datum` (definition).

**Statement.** Let H = G ⋊ {1, c} with c of order two, A a complete discrete valuation ring with fraction field F and maximal ideal m, and R a local reduced finite flat A-algebra with R/M = A/m. A lattice datum consists of: (1) a character ν: H → A^×; (2) a character χ: G → A^× with χ̄ ≠ ν̄χ̄^{-c}, and χ′ := νχ^{-c}; (3) a representation ρ: G → Aut\_A(V), V ≅ A^n, with ρ^c ≅ ρ^∨ ⊗ ν, ρ̄ absolutely irreducible and ρ residually disjoint from χ and χ′ (some x ∈ A\[G] has coprime residual characteristic polynomials); (4) a representation σ: G → Aut\_{R⊗F}(M), M ≅ (R ⊗ F)^{n+2}, with σ^c ≅ σ^∨ ⊗ ν, tr σ(G) ⊆ R and finitely generated R\[G]-orbits; (5) a proper ideal I ⊂ R with J := A ∩ I ≠ 0, A/J ≅ R/I and tr σ ≡ χ′ + tr ρ + χ mod I. Local data at a subgroup D ⊂ G: a D-stable free summand M^+ ⊆ M with free quotient, a D-stable free summand V^+ ⊆ V, and the congruence Ch(M^+, x, T) ≡ Ch(V^+, x, T)(1 − Tχ(x)) mod I for x ∈ R\[D]. The datum is ν-polarized when ν is compatible (Φ^t = −ν(c)Φ) with the polarization of ρ.

**Hypotheses.**

- The polarization conditions are those of SU 4.2.2; residual disjointness is in the sense of SU 4.1.2.
- In applications G = G\_{K,Σ}, H = G\_{ℚ,Σ}, D a decomposition group at a prime above p, A the completion of a localization of a two-variable Iwasawa algebra at a height-one prime P, and R a completed local Hecke algebra.

**Proof outline.**

1. Record the data (1)–(5) and the local data 4.5.1–4.5.3 as fields; derive the congruence for the quotients M^- and V^- from 4.3.1.
2. Residual disjointness gives projectors x\_1, x\_2 ∈ B\[G] with x\_i acting as identity on one summand and zero on the other (SU Lemma 4.1.3, via the Henselian property).

**Checks.**

- The SU instance (SU 7.3.2), the CLW instance (proof of CLW Thm 8.2.1, items (1)–(5)) and the FW instance (proof of FW Thm 7.32) are all lattice data with n = 2.

**Uses.**

- L1/su-selmer-lower-bound: the instance of SU 7.3.2 with A = Λ̂\_{D,P} and R = 𝕋̂\_{D,Q}
- L2s/clw-main-divisibility: the GU(3,1) instance with ν trivial
- L2/fw-greenberg-divisibility: the general-weight GU(3,1) instance
- AutomorphicCongruences:L5w/galois-selmer-instance: the Hilbert GU(2,2) instance over a totally real field

**API.**

- `LatticeDatum.chiPrime` (projection): χ′ = νχ^{-c}.
- `LatticeDatum.trace_congr` (characterisation): tr σ ≡ χ′ + tr ρ + χ modulo I.
- `LatticeDatum.residualProjectors` (data): The elements x\_1, x\_2 ∈ R\[G] separating the residually disjoint constituents (SU Lemma 4.1.3).
- `LatticeDatum.localize` (functoriality): Base change along A\_0 → Â\_{0,P} and R\_0 → R̂\_{0,Q} preserves the datum.
- `LatticeDatum.localData` (structure): The D-stable summands M^±, V^± with the congruence of characteristic polynomials and its consequence for the quotients.
- `LatticeDatum.toGMA` (coercion): The R\[G]-span of a lattice in M carries a generalized-matrix-algebra structure of type (1, n, 1) relative to the residual decomposition.

**Unit tests.**

- `latticeDatum_ribet_case` (degenerate): With n = 0 (no ρ), the datum is a two-character Ribet datum and LatticeDatum.toGMA recovers IHG.6's distinct-character set-up.
- `latticeDatum_su_instance` (computation): In SU 7.3.2, χ = σ\_{χ̄\_f,0}σ^c\_ψ ε^{-3}, ρ\_0 = ρ\_f ⊗ σ\_{χ̄\_f,0}σ^{-c}\_ξ σ^c\_ψ ε^{-2}, χ′ = σ\_{χ̄\_f,0}ε^{-1}det ρ\_f σ^{-1}\_{ξ′}σ^c\_ψ, and ν is fixed by χ^cχ′ = σ^2\_{χ̄\_f,0}ε^{-7}ε\_ℚ^{-2}; these satisfy χ′ = νχ^{-c}, and the trace of ρ\_D in (6.5.2.a) is χ + tr ρ\_0 + χ′.
- `latticeDatum_requires_distinct` (non-example): If χ̄ = ν̄χ̄^{-c} then condition (2) fails; SU (dist) and CLW's ξ\_p ≢ ξ\_p̄ are exactly what rule this out.
- `latticeDatum_gma_agreement` (agreement): For a lattice datum with σ residually multiplicity free, LatticeDatum.toGMA agrees with IntegralHeckeAndGaloisDeterminants:IHG.1/generalized-matrix-algebra.

**Prerequisites.** `IntegralHeckeAndGaloisDeterminants:IHG.1/generalized-matrix-algebra`, `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-idempotent-lifting`, `IntegralHeckeAndGaloisDeterminants:IHG.1/reducibility-ideal`, `mathlib:IsDiscreteValuationRing`, `mathlib:IsReduced`, `mathlib:Matrix.charpoly`.

**Sources.**

- SU-2014, §4.1.2, Lemma 4.1.3, p. 48; §4.2.1–4.2.3, pp. 48–49; §4.5.1–4.5.3, p. 59: The rings A and R, the polarized data (1)–(5) and the local conditions with their congruence of characteristic polynomials.
- CLW-v1, proof of Thm 8.2.1, p. 79: CLW list the data (1)–(5) for GU(3,1), taking ν trivial and σ from the pseudo-representation of the semi-ordinary Hecke algebra.
- WAN-RS, introduction, p. 4: Wan's U(3,1) argument follows the SU set-up; its lattice construction (Prop. 9.2, set-up (1)–(9)) is the variant used by CLW and FW.

### The lattice construction: Eisenstein ideals bound Selmer groups

`AutomorphicCongruences:L0/lattice-construction` (theorem). Planet: Lattice construction.

**Statement.** Let (ν, χ, ρ, σ, I) be a ν-polarized lattice datum (L0/su-lattice-datum) with H = G\_{ℚ,Σ}, G = G\_{K,Σ}, local data at D = G\_{K,p} satisfying SU 4.5.1–4.5.3, with V^+\_0 ⊕ A(χ) and V^-\_0 ⊕ A(χ′) residually disjoint modulo P, where A = Â\_{0,P} for a height-one prime P of a noetherian normal domain A\_0, and J = A ∩ I. Then (i) ord\_P Ch^Σ\_ℚ(ψν) ≥ ℓ\_P(L(χ′)/J(χ′)); (ii) ord\_P Ch^Σ\_K(ρ\_0 ⊗ χ^{-1}) ≥ ℓ\_P(N/N′), and in particular ord\_P Ch^Σ\_K(ρ\_0 ⊗ χ^{-1}) ≥ ord\_P(J) when N′ = 0 (SU Prop. 4.5.6); (iii) if ord\_P Ch^Σ\_ℚ(ψν) = 0 then ord\_P Ch^Σ\_K(ρ\_0 ⊗ χ^{-1}) ≥ ord\_P(J) (SU Cor. 4.5.7); (iv) under SU Lemma 4.3.11, if ord\_P(J) > ord\_P Ch^Σ\_ℚ(ψν) then ord\_P Ch^Σ\_K(ρ\_0 ⊗ χ^{-1}) ≥ 1 (SU Prop. 4.5.8). Here the Selmer groups are the Σ-primitive ones of L0/sigma-primitive-selmer for the pairs (A\_0(ψν), 0) and (V\_0(χ^{-1}), V^+\_0(χ^{-1})). The variant of Wan20 Prop. 9.2 replaces the irreducibility of σ by condition (9): every specialization σ\_λ is absolutely irreducible or contains an absolutely irreducible two-dimensional subrepresentation with trace ≡ χ + χ^{-c} modulo I.

**Hypotheses.**

- P is a height-one prime of A\_0 with A\_0 noetherian normal; the polarization ν is compatible with the polarization of ρ (4.5.5.a).
- The bound concerns the Σ-primitive groups; primitive versions follow by L0/primitive-imprimitive-comparison.
- The excluded case ord\_P Ch^Σ\_ℚ(ψν) > 0 is where the abelian Selmer group may absorb the extensions; CLW and Wan exclude such P explicitly.

**Proof outline.**

1. Choose a lattice ℒ ⊂ M stable under R\[G]; the residual projectors of the datum decompose ℒ into pieces ℒ(χ′), ℒ(ρ), ℒ(χ) with submodules 𝒥(·) cut out by I (SU 4.3, Cor. 4.3.9).
2. Off-diagonal blocks define cocycles: φ ↦ c\_φ(g) = (φ ⊗ id)(χ^{-1}(g)σ(g)ε̄\* − ε̄\*) gives Hom\_{A\_0}(N, A\_0^∨) → H¹(G, V\_0 ⊗ A\_0^∨(χ^{-1})), whose dual is surjective after localizing at P (SU Props 4.4.4–4.4.5).
3. Local conditions: the projector x^+ ∈ R\[D] splits the D-extension, so a multiple t ∉ P of the image lies in the kernel of restriction to H¹(D, V^-\_0 ⊗ A\_0^∨(χ^{-1})), i.e. satisfies the ordinary condition (SU Prop. 4.5.4); by polarization the same holds at the conjugate prime.
4. Lengths: the dual Selmer group surjects onto Hom(N, A\_0^∨)^∨ localized at P, giving (ii); (iii) and (iv) follow from (i), Lemma 4.3.8 and Lemma 4.3.11.
5. For the Wan20 variant, condition (9) replaces the use of irreducibility in the construction of ℒ; the rest is unchanged.

**Checks.**

- A height-one prime with ord\_P(J) = 2 and N′ = 0 must give ord\_P(Ch) ≥ 2, not just ≥ 1.
- Excluded-prime check: when ord\_P Ch^Σ\_ℚ(ψν) > 0 and Lemma 4.3.11 fails, no conclusion is drawn.
- The extension classes are those of the automorphic family; the theorem does not presuppose any divisibility of characteristic ideals.

**Prerequisites.** `AutomorphicCongruences:L0/su-lattice-datum`, `AutomorphicCongruences:L0/sigma-primitive-selmer`, `AutomorphicCongruences:L0/extension-class-local-conditions`, `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-extension-module`, `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-extension-injection`, `IntegralHeckeAndGaloisDeterminants:IHG.1/ribet-lattice`, `IntegralHeckeAndGaloisDeterminants:IHG.6/local-ribet-theorem`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `mathlib:Module.length`.

**Sources.**

- SU-2014, §4.3–4.5, Props 4.4.4–4.4.5, 4.5.4, 4.5.6, Cor. 4.5.7, Prop. 4.5.8, pp. 52–61: The cocycle construction, the local conditions at p and the length bounds.
- CLW-v1, proof of Thm 8.2.1, pp. 79–80: CLW verify Wan20's properties (6)–(9), with (9) by the CAP-exclusion argument, then apply Wan20 Prop. 9.2 at height-one P with ord\_P(E\_{π,ξ}) > 0 and (X\_{ξ∘Nm} ⊗ ℚ)\_P = 0.
- FW-v3, proof of Thm 7.32, pp. 96–97: Fouquet–Wan apply the lattice construction (Wan20 Prop. 9.2) to the semi-ordinary GU(3,1) pseudo-character.

### Local conditions satisfied by the automorphic extension classes

`AutomorphicCongruences:L0/extension-class-local-conditions` (theorem).

**Statement.** In the situation of L0/lattice-construction, the classes \[c\_φ] obtained from the off-diagonal blocks of σ satisfy, after multiplication by an element t ∉ P: (a) at every place v ∉ Σ they are unramified, since σ is unramified outside Σ; (b) at the primes above p they lie in the kernel of restriction to H¹(D, V^-\_0 ⊗ A\_0^∨(χ^{-1})) for D = G\_{K,p} (the ordinary condition), and by the polarization the corresponding statement holds at G\_{K,p̄}; (c) at places v ∈ Σ, v ∤ p, no condition is imposed (Σ-primitive). When v = ℓ ∈ Σ is a place where π\_ℓ is an unramified twist of Steinberg, the transfer from the Σ-primitive to the primitive Selmer group uses the rank-one inertia invariants T^{I\_ℓ} and the Euler factor det(1 − ℓ^{-1}frob\_ℓ | T^{I\_ℓ}) of L0/primitive-imprimitive-comparison; the residual hypothesis that ρ̄ be ramified at ℓ (SU 3.6.1, FW Thm 1.6(2)) makes this factor a unit at the relevant height-one primes.

**Hypotheses.**

- The residual disjointness of V^+ ⊕ A(χ) and V^- ⊕ A(χ′) modulo P (SU (7.3.3.a)) is what produces the D-projector; it is verified in each instance (SU proof of Thm 7.3.5, CLW and FW checks).

**Proof outline.**

1. (a) σ, hence every block, factors through G\_{K,Σ}.
2. (b) is SU Prop. 4.5.4(ii): the projector x^+ acts as identity on M^+ and kills M^-, so the extension restricted to D splits along the filtration.
3. Steinberg places: local Tate duality and the rank-one inertia invariants give the Euler factor; ramification of ρ̄ at ℓ makes T^{I\_ℓ} ⊗ k one-dimensional with Frobenius eigenvalue ±1 not congruent to ℓ (FW Assumption 3.7).

**Checks.**

- Checks the three kinds of local condition named by the stage: unramified, Steinberg via relaxing and Euler factors, ordinary at p.

**Prerequisites.** `AutomorphicCongruences:L0/su-lattice-datum`, `AutomorphicCongruences:L0/primitive-imprimitive-comparison`, `SelmerIwasawaCohomology:L2/greenberg-condition`, `SelmerIwasawaCohomology:L2/unramified-condition`, `IntegralHeckeAndGaloisDeterminants:IHG.5/lattice-class-local-conditions`.

**Sources.**

- SU-2014, Prop. 4.5.4, pp. 59–60; proof of Thm 7.3.5, p. 107: The ordinary local condition at p from the projector, and the verification of residual disjointness of the four characters at p.
- FW-v3, Thm 1.6(2), p. 6; Assumption 3.7, p. 25: The residual condition at a prime ℓ ∥ N with one-dimensional inertia invariants and no G\_ℓ-invariants.

### Canonical periods, Petersson norms and the congruence number

`AutomorphicCongruences:L0/canonical-period-congruence-number` (comparison).

**Statement.** Let f be an ordinary eigenform in a Hida family 𝐟 with coefficients in a normal domain 𝕀 satisfying (irred) and (dist). The congruence module of the cuspidal Hecke algebra at the augmentation λ\_f is cyclic and generated by the congruence number η\_f (PadicFamilies:L1/congruence-module, congruence-ideal); with the canonical periods Ω^±\_f defined by the integral modular-symbol lattice, ⟨f, f^c|(−1/N)⟩/(Ω^+\_f Ω^-\_f) generates η\_f up to a p-adic unit. Consequently the SU three-variable p-adic L-function normalized by Ω^+Ω^- (Thm 12.3.1(ii)) is integral, while the version normalized by the Petersson norm (Thm 12.3.1(i)) has denominators bounded by η\_f; and every Fourier coefficient of the Eisenstein family divided by Ω^+Ω^- (Thms 12.4.1–12.4.2) is integral. No comparison between the canonical periods Ω^±\_f and the Gross period (a quaternionic or toric normalization) is asserted: Fouquet–Wan note that such a comparison is not available in the needed generality, and this packet records it as a gap rather than a lemma.

**Hypotheses.**

- (irred) and (dist) for f, which give the freeness of the relevant Hecke modules and the Gorenstein property used to make the congruence module cyclic.
- The unit u\_{f\_φ} in SU Thm 12.3.1(ii) depends only on f\_φ and is not specified further.

**Proof outline.**

1. Hida's congruence formula: the congruence module of the Hecke algebra at f is O/η\_f with η\_f = ⟨f,f⟩/(Ω^+Ω^-) up to unit, via the integral Eichler–Shimura pairing on modular symbols (PadicFamilies:L1/family-period-line, period-change-of-trivialisation).
2. SU Lemma 12.2.7 produces both the Petersson-normalized element 𝐼\_g and the integral element 𝑁\_g; their ratio is the family congruence number.
3. Record the canonical/Gross period question as the gap 'canonical-gross-periods'.

**Checks.**

- The integral normalization is the one in which the lattice construction measures congruences; replacing Ω^+Ω^- by a non-integral period breaks the integrality of E\_D's coefficients.

**Prerequisites.** `PadicFamilies:L1/congruence-module`, `PadicFamilies:L1/congruence-ideal`, `PadicFamilies:L1/family-congruence-module`, `PadicFamilies:L1/family-period-line`, `PadicFamilies:L1/period-change-of-trivialisation`.

**Sources.**

- SU-2014, Thm 12.3.1 (i)–(ii), p. 199; Thm 12.4.1, pp. 202–203: The Petersson-normalized and the Ω^+Ω^--normalized interpolation formulas, the latter integral under (irred) and (dist).
- FW-v3, remark before Thm 1.6, p. 6: Deducing Thm 1.6 from SU would need a comparison of the canonical and Gross periods, which Fouquet–Wan say may not exist in the literature in the generality needed.

### The Hida–Tilouine anticyclotomic main conjecture for CM fields (one divisibility and equality)

`AutomorphicCongruences:L0/hida-tilouine-anticyclotomic` (theorem).

**Statement.** Let M be a CM field with maximal totally real subfield F, p an odd prime unramified in M with every prime of F above p split in M, Σ an ordinary CM type, and ψ a branch character. For the anticyclotomic Katz–Hida–Tilouine p-adic L-function L^-\_ψ and the Iwasawa module X^-\_ψ of the anticyclotomic tower (the ψ-part of the Galois group of the maximal p-abelian extension unramified outside Σ\_p), under the hypotheses of Hida–Tilouine (ψ residually nontrivial on the relevant decomposition groups) and Hida 2006, the characteristic ideal of X^-\_ψ equals the ideal generated by L^-\_ψ (after Hida's μ = 0 theorem, integrally). The congruence-module method proves char(X^-\_ψ) ⊆ (L^-\_ψ) by comparing the congruence module of a CM Hida family with the anticyclotomic L-value, and Rubin's or the class-number argument gives the other direction.

**Hypotheses.**

- Hypotheses as in Hida–Tilouine (Invent. Math. 117, 1994, and Ann. Sci. ÉNS 26, 1993) and Hida (Doc. Math. extra volume Coates, 2006); they were not read for this packet, so the exact list is a recorded gap.

**Proof outline.**

1. Construct the CM Hida family attached to ψ and its congruence module; identify the congruence ideal with the anticyclotomic L-value (Hida–Tilouine).
2. Use the lattice construction for CM families to bound X^-\_ψ below by the congruence module.
3. Combine with the analytic class number formula along the tower, or Rubin's main conjecture when F = ℚ, for the reverse inequality; Hida's μ = 0 (AutomorphicPadicLFunctions:L3h/hida-katz-mu-vanishing) removes the p-ambiguity.

**Checks.**

- Consumed by L2s/clw-integrality (CLW's integrality of L\_{π,K,ξ} through L^Hida) and requested by HeegnerPointEulerSystems:HE.8b as 'Hida–Tilouine from proposed AC L0c'.

**Prerequisites.** `AutomorphicPadicLFunctions:L3/katz-hida-tilouine-tame`, `AutomorphicPadicLFunctions:L3h/hida-katz-mu-vanishing`, `PadicFamilies:L1/congruence-module`, `AutomorphicCongruences:L0/lattice-construction`.

**Sources.**

- CLW-v1, proof of Thm 8.2.1(2), p. 81: CLW deduce integrality of L^Hida\_{π,K,ξ} from the anticyclotomic main conjecture of Hida–Tilouine and Hida (HT93, HT94, Hid06).
- WAN-RS, Thm 1.1 and the remark after Thm 1.2, pp. 2–3: Wan proves integrality of Hida's p-adic L-function under (irred) and (dist) for the CM form g\_ξ.

### Dependencies of layer L0

Inside this roadmap and on other roadmaps (node and stage ids): `ArithmeticGaloisDuality:R02.4/poitou-tate`, `AutomorphicPadicLFunctions:L3/katz-hida-tilouine-tame`, `AutomorphicPadicLFunctions:L3h/hida-katz-mu-vanishing`, `IntegralHeckeAndGaloisDeterminants:IHG.1/generalized-matrix-algebra`, `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-extension-injection`, `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-extension-module`, `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-idempotent-lifting`, `IntegralHeckeAndGaloisDeterminants:IHG.1/reducibility-ideal`, `IntegralHeckeAndGaloisDeterminants:IHG.1/ribet-lattice`, `IntegralHeckeAndGaloisDeterminants:IHG.5/lattice-class-local-conditions`, `IntegralHeckeAndGaloisDeterminants:IHG.6/local-ribet-theorem`, `PadicFamilies:L1/congruence-ideal`, `PadicFamilies:L1/congruence-module`, `PadicFamilies:L1/family-congruence-module`, `PadicFamilies:L1/family-period-line`, `PadicFamilies:L1/period-change-of-trivialisation`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-0`, `PadicMeasuresIwasawaAlgebras:L4/pseudo-null`, `PadicMeasuresIwasawaAlgebras:L6/higher-fitting-base-change`, `SelmerIwasawaCohomology:L2/condition-change-triangle`, `SelmerIwasawaCohomology:L2/galois-selmer-group`, `SelmerIwasawaCohomology:L2/greenberg-condition`, `SelmerIwasawaCohomology:L2/pontryagin-dual`, `SelmerIwasawaCohomology:L2/selmer-data`, `SelmerIwasawaCohomology:L2/unramified-condition`, `SelmerIwasawaCohomology:L3/derived-control`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`.

### Acceptance for layer L0

Coverage: **planned**. Generic congruence modules are PadicFamilies:L1's (RT-AREA-langlands-1/27); GMA, reducibility and Ribet tools are IHG.1/IHG.6's. L0 owns the source-specific Selmer instances, the polarized 1+n+1 lattice construction of SU §4 (used by SU, CLW, FW and Wan 2015), its local conditions and the period comparison. Kriz's Eisenstein congruence (RankZeroOneBSD:BSD.7 request) is not planned here: the Eisenstein analogue is BSD.7a's by the L5a stage text.

- Refinement: Refine L0/lattice-construction into the lattice ℒ, the submodules 𝒥(·) and the cocycle maps of SU §4.3–4.4 (Lemmas 4.3.8, 4.3.11, Props 4.4.4–4.4.5) as lemma nodes when the roadmap is packaged.
- Refinement: Read Hida–Tilouine (1993, 1994) and Hida (2006) and fix the exact hypotheses of L0/hida-tilouine-anticyclotomic (gap hida-tilouine-not-read).

## Layer L1: The Skinner–Urban automorphic argument

Skinner and Urban realise the two-variable p-adic L-function of a Hida family over an imaginary quadratic field as the constant term of an ordinary family of Klingen Eisenstein series on GU(2,2), show that a nonsingular Fourier coefficient is prime to it, and deduce a congruence with cusp forms whose four-dimensional Galois representations yield, through L0's lattice construction, the reverse divisibility Ch ⊆ (L). The Shimura varieties, automorphic bundles and doubling machinery are AutomorphicPadicLFunctions L4's; the Galois representations of GU(2,2) are AutomorphicGaloisRepresentationsPartII's.

### Ordinary p-adic Hermitian modular forms on GU(2,2) and their Hecke algebra

`AutomorphicCongruences:L1/gu22-ordinary-hermitian-forms` (construction).

**Statement.** Let K be an imaginary quadratic field in which p splits, G = G\_2 = GU(2,2) the unitary similitude group of the skew-Hermitian form w\_2 = (0 1\_2; −1\_2 0) over O\_K, and K′ ⊂ G(𝔸^p\_f) a neat open compact subgroup. On the ordinary locus of the integral model of the Shimura variety S\_G(K′K\_p) (with its toroidal and minimal compactifications), and over its Igusa tower, define the space V^q\_{a,ord} (dual of the ordinary p-adic Hermitian modular forms; q = 0 for cusp forms, q = 1 for all forms) of weight a with coefficients in Λ\_2 = ℤ\_p\[\[Γ\_2]], Γ\_2 = (1 + pℤ\_p)^4 ⊂ T\_2(ℤ\_p), with the q-expansions at the cusps x = diag(u, t ū^{-1}), the Hecke operators at unramified places, the U\_p-operators u\_t for t = diag(p^{a\_1},…,p^{a\_4}), the ordinary projector e = lim u\_t^{n!}, and the universal ordinary cuspidal Hecke algebra h\_{Σ,0}(K′; Λ). Specializations at arithmetic weights are classical holomorphic Hermitian modular forms of weight (κ, κ; 0, 0)-type when the weight is sufficiently regular.

**Hypotheses.**

- p splits in K; K′K\_p neat; the p-adic weights are characters of T\_2(ℤ\_p) through Γ\_2 and µ\_{p−1}^4.
- The Shimura variety, its compactifications, the automorphic bundles and the ordinary Igusa tower are imported from AutomorphicPadicLFunctions:L4 (unitary PEL data) and AutomorphicBundles; this node instantiates them for GU(2,2) in SU's normalization.

**Proof outline.**

1. Instantiate AutomorphicPadicLFunctions:L4's unitary PEL datum at signature (2,2) and its ordinary forms, using SU §5 conventions (G\_n, the Siegel parabolic, cusps C\_{n−1}(K)).
2. Define the ordinary projector by the profinite ordinary projector of PadicFamilies:L0a applied to u\_t on the p-adic forms.
3. q-expansions at x and the Fourier–Jacobi expansions along the Klingen parabolic come from AutomorphicBundles:B5.

**Checks.**

- The degree-one analogue GU(1,1) recovers elliptic modular forms twisted by characters of K, which is how the Eisenstein family is built from a Hida family f.

**Uses.**

- L1/gu22-hida-control: the spaces whose freeness and control are proved
- L1/padic-eisenstein-family: E\_D is an element of M^{ord}\_a(K′; Λ\_D)
- L1/gu22-galois-pseudocharacter: the Hecke algebra h\_D on which the pseudo-character lives
- AutomorphicCongruences:L5w/klingen-interpolation: the totally real analogue over F imports the same carrier through AutomorphicPadicLFunctions:L4

**API.**

- `GU22Forms.space` (constructor): V^q\_{a,ord}(K′; Λ\_2) and M^q\_{a,ord}(K′; Λ\_2) for q ∈ {0, 1} (cusp forms, all forms).
- `GU22Forms.qExp` (projection): The q-expansion at a cusp x: Σ\_{β ∈ S(ℚ), β ≥ 0} c(β, x) q^β, injective on V^q\_{a,ord} (q-expansion principle).
- `GU22Forms.hecke` (data): The Hecke operators T\_v, Z\_{ℓ,0}, Z^{(i)}\_{ℓ,0} and u\_t, commuting, with e the ordinary projector.
- `GU22Forms.specialize` (functoriality): Specialization at an arithmetic weight φ lands in classical holomorphic ordinary forms of weight φ for sufficiently regular φ.
- `GU22Forms.siegelOperator` (projection): The Siegel operator Φ to the boundary, fitting in the exact sequence of Cor. 5.5.9 and Thm 6.3.10.
- `GU22Forms.heckeAlgebra` (data): h\_{Σ,0}(K′; Λ) := the Λ-algebra generated by the Hecke operators acting on ordinary cusp forms; finite and reduced over Λ\_D after base change.

**Unit tests.**

- `gu22Forms_degree_one` (agreement): For n = 1 the same construction for GU(1,1) gives ordinary p-adic elliptic modular forms twisted by Hecke characters of K, with Hida's ordinary projector.
- `gu22Forms_qexp_injective` (characterisation): A form whose q-expansions vanish at every cusp x with x\_p ∈ Q(ℤ\_p) is zero (q-expansion principle on each connected component).
- `gu22Forms_eisenstein_not_cuspidal` (non-example): The Λ\_D-adic Eisenstein series E\_D has nonzero Siegel-operator image, so it is not in V^0\_{a,ord}.
- `gu22Forms_projector_idempotent` (computation): e ∘ e = e and e commutes with every T\_v; on a classical form of weight a whose u\_t-eigenvalue is a p-adic unit, e acts as the identity.

**Prerequisites.** `AutomorphicPadicLFunctions:L4/ehls-unitary-datum`, `AutomorphicPadicLFunctions:L4/ehls-ordinary-forms-hecke`, `AutomorphicPadicLFunctions:L4/dl-siegel-hermitian-varieties`, `AutomorphicBundles:B5/global-fj-expansion`, `AutomorphicBundles:B5/fj-injectivity`, `PadicFamilies:L0a/profinite-ordinary-projector`, `mathlib:MvPowerSeries`.

**Sources.**

- SU-2014, §5 (groups G\_n §5.1, Shimura varieties §5.2, cusps and boundary §5.4–5.5, Cor. 5.5.9), pp. 61–80; §6.1–6.2, pp. 81–91: Skinner–Urban's unitary similitude groups, Shimura varieties and ordinary automorphic forms with q-expansions and Hecke operators.
- SU-2014, §6.3–6.4 (Thms 6.3.3, 6.3.10, 6.4.1), pp. 91–95: Λ-adic ordinary forms and the universal ordinary Hecke algebra h\_{S,0}.

### Hida theory for GU(2,2): freeness, control and the boundary sequence

`AutomorphicCongruences:L1/gu22-hida-control` (theorem). Planet: Hida theory for GU(2,2).

**Statement.** For n = 2 and q = 0 (cusp forms) or q = 1 (all forms): (i) V^q\_{a,ord} is free of finite rank over Λ\_n, and its specializations at finite-order characters ψ of level s have rank independent of ψ and of the weight (SU Thm 6.3.3); (ii) for any Λ\_n-algebra A there is a short exact sequence 0 → M^0\_{a,ord}(K^p, A) → M^1\_{a,ord}(K^p, A) →Φ ⊕\_{\[g] ∈ C\_{n−1}(K)} M^0\_{a′,ord}(K^p\_{n−1,g}, Λ\_{n−1}) ⊗ A → 0, Φ the sum of the Siegel operators to the boundary components (cusp forms on G\_{n−1} = GU(1,1)) (SU Thm 6.3.10, from Cor. 5.5.9); (iii) for every sufficiently regular algebraic dominant weight k the canonical surjection h^{S,q}(K^p; Λ\_n) ⊗ Λ\_n/P\_k ↠ h^{S,q}\_{k,ord}(K) has nilpotent kernel, so every ℚ̄\_p-valued character of the Λ-adic Hecke algebra at P\_k comes from a classical ordinary eigenform of weight k (SU Thm 6.4.1). Consequently h\_{Σ,0}(K′; Λ) is finite over Λ\_2 and its arithmetic points of regular weight are Zariski dense.

**Hypotheses.**

- Weights sufficiently regular in the sense of SU 6.2; neat level; p split in K.

**Proof outline.**

1. Freeness from vertical control on the Igusa tower (SU §6.2–6.3, Props 6.2.5, Cor. 6.2.6, Thm 6.2.10).
2. Boundary exact sequence: the Siegel operator surjects onto boundary ordinary forms (SU Cor. 5.5.9, Thm 6.3.10).
3. Control of the Hecke algebra in sufficiently regular weight (nilpotent kernel, SU Thm 6.4.1); density of such weights in Spec Λ\_2.

**Checks.**

- The boundary sequence is what lets one subtract an Eisenstein family from a lift and obtain a cusp form congruent to it.

**Prerequisites.** `AutomorphicCongruences:L1/gu22-ordinary-hermitian-forms`, `PadicFamilies:L0a/ordinary-part-complexes`, `PadicFamilies:L0a/profinite-projector-exact`, `AutomorphicPadicLFunctions:L4/ehls-ordinary-forms-hecke`.

**Sources.**

- SU-2014, Thm 6.3.3, p. 91; Thm 6.3.10 and Thm 6.4.1, p. 95; Cor. 5.5.9, p. 78: Freeness of ordinary forms over Λ\_n, the boundary exact sequence and control in sufficiently regular weight.

### The p-adic Eisenstein datum and its Eisenstein ideal

`AutomorphicCongruences:L1/eisenstein-datum` (definition). Planet: Skinner–Urban Eisenstein ideal.

**Statement.** A p-adic Eisenstein datum D = (A, 𝕀, 𝐟, ψ, ξ, Σ) consists of the ring of integers A of a finite extension of ℚ\_p containing ℤ\[µ\_{M\_D p}, i, D\_K^{1/2}], a normal domain 𝕀 finite over Λ\_{W,A}, an 𝕀-adic ordinary eigenform 𝐟 of tame level M, finite idele class characters ψ and ξ of 𝔸\_K^× (ψ|\_{𝔸^×} = χ\_𝐟), and a finite set of primes Σ containing those dividing M p D\_K and the ramification of ξ. Put Λ\_D = 𝕀\[\[Γ^-\_K × Γ\_K]], a finite local reduced Λ\_2-algebra via α ⊗ β (SU 6.5.1), the characters σ\_ψ, σ\_ξ, σ\_{ξ′} = σ\_ξσ^c\_ξ, and the semisimple representation ρ\_D = σ\_{χ̄\_f,0}σ^c\_ψε^{-3} ⊕ (ρ\_𝐟 ⊗ σ\_{χ̄\_f,0}σ^{-c}\_ξσ^c\_ψε^{-2}) ⊕ σ\_{χ̄\_f,0}ε^{-1}det ρ\_𝐟 σ^{-1}\_{ξ′}σ^c\_ψ of G\_K over Frac Λ\_D (6.5.2.a). The Eisenstein ideal I\_D ⊆ h\_D = h\_{Σ,0}(K′; Λ\_D) is generated by the coefficients of Q\_v(X) − Q\_{v,D}(X) (v ∉ Σ), the relations u\_t − ∏β\_i^{a\_i} for the U\_p-operators with the prescribed (β\_1,…,β\_4), and the central operators Z\_{ℓ,0}, Z^{(i)}\_{ℓ,0} minus their values on the Eisenstein characters; E\_D ⊆ Λ\_D is the kernel of Λ\_D → h\_D/I\_D, so Λ\_D/E\_D ≅ h\_D/I\_D (6.5.3.a), and 𝕋\_D is the localization of h\_D at the maximal ideal containing I\_D. The two p-adic L-functions attached to D are L^Σ\_{𝐟,K,ξ} ∈ 𝕀\[\[Γ\_K]] (L1/su-padic-l-function) and L^Σ\_{χ̄\_𝐟ξ̄′}, the image of the Kubota–Leopoldt function of the Dirichlet character χ̄\_𝐟ξ̄′; their product is L\_D.

**Hypotheses.**

- ψ exists with ψ|\_{𝔸^×} = χ\_𝐟 and unramified outside Σ (SU Thm 12.3.1 hypothesis); (irred)\_𝐟 and (dist)\_𝐟 when 𝕋\_D is used.

**Proof outline.**

1. Define Λ\_D, the characters and ρ\_D as in SU 6.5.1–6.5.2.
2. Instantiate L0/eisenstein-ideal with the Hecke operators listed in SU 6.5.3 and the eigensystem of ρ\_D and the U\_p-characters.

**Checks.**

- The specialization of ρ\_D at an arithmetic point with an associated Eisenstein series is the Galois representation of that Eisenstein series (SU remark after (6.5.2.a)).

**Uses.**

- L1/padic-eisenstein-family: Thm 6.5.4 bounds ord\_P(E\_D) below by ord\_P(L\_D)
- L1/su-selmer-lower-bound: the lattice datum of SU 7.3.2 takes J\_0 = E\_D and I\_0 = I\_D
- L1/gu22-galois-pseudocharacter: the residual pseudo-character of 𝕋\_D is tr ρ̄\_D

**API.**

- `EisensteinDatum.lambdaD` (data): Λ\_D = 𝕀\[\[Γ^-\_K × Γ\_K]] with its Λ\_2-algebra structure via α ⊗ β.
- `EisensteinDatum.rhoD` (data): The semisimple G\_K-representation ρ\_D of (6.5.2.a), unramified outside Σ, with det(1 − ρ\_D(g)X) ∈ Λ\_D\[X].
- `EisensteinDatum.heckeIdeal` (constructor): I\_D ⊆ h\_D generated as in SU 6.5.3.
- `EisensteinDatum.ideal` (constructor): E\_D := ker(Λ\_D → h\_D/I\_D).
- `EisensteinDatum.quotientEquiv` (equivalence): Λ\_D/E\_D ≃ h\_D/I\_D (6.5.3.a).
- `EisensteinDatum.LD` (data): L\_D = L^Σ\_{𝐟,K,ξ}·L^Σ\_{χ̄\_𝐟ξ̄′} ∈ Λ\_D.
- `EisensteinDatum.specialize` (compatibility): At an arithmetic φ ∈ X^a\_D with an associated Eisenstein series, φ(ρ\_D) is that series' Galois representation and φ(Q\_{v,D}) its Hecke polynomial.

**Unit tests.**

- `eisensteinDatum_trace_shape` (computation): tr ρ\_D is the sum of two characters and the trace of a twist of ρ\_𝐟; its reduction modulo the maximal ideal is the residual trace used in Thm 7.3.1, with exactly one irreducible two-dimensional constituent under (irred)\_𝐟.
- `eisensteinDatum_proper` (characterisation): E\_D ≠ Λ\_D exactly when some cuspidal ordinary eigensystem is residually congruent to the eigensystem of ρ\_D.
- `eisensteinDatum_rank_count` (degenerate): If 𝕀 = A (a single form, no weight variable) then Λ\_D = A\[\[Γ^-\_K × Γ\_K]] ≅ A\[\[X\_1, X\_2, X\_3]] has Krull dimension 4, one more than the number of Iwasawa variables.
- `eisensteinDatum_not_gl2` (non-example): Replacing h\_D by the GL₂ Hecke algebra of 𝐟 does not give an Eisenstein ideal of this datum: ρ\_D has rank four and its Hecke polynomials Q\_v have degree four.

**Prerequisites.** `AutomorphicCongruences:L0/eisenstein-ideal`, `AutomorphicCongruences:L1/gu22-ordinary-hermitian-forms`, `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`, `PadicFamilies:L4/ordinary-big-galois-representation`, `DirichletPadicLFunctions:L4`.

**Sources.**

- SU-2014, §6.5.1–6.5.3, pp. 96–98: The datum D, the ring Λ\_D, the representation ρ\_D, the generators of I\_D and the isomorphism Λ\_D/E\_D ≅ h\_D/I\_D.

### Klingen Eisenstein series on GU(2,2) as pullbacks of Siegel Eisenstein series on GU(3,3)

`AutomorphicCongruences:L1/klingen-eisenstein-series` (construction).

**Statement.** For a cuspidal eigenform f on GU(1,1) (from an elliptic newform and a character ψ), a character ξ of 𝔸\_K^× and a choice of local sections at the places of Σ and at p, construct the holomorphic Klingen-type Eisenstein series E(Z, x; F) on GU(2,2), induced from the Klingen parabolic with Levi GU(1,1) × Res\_{K/ℚ}𝔾\_m, of weight κ > 6 (SU §9, 'good Eisenstein series' Prop. 9.3.3), its Hecke eigenvalues and Satake parameters (SU §9.5–9.6), and its expression through the pullback of a Siegel Eisenstein series on GU(3,3) along GU(2,2) × GU(1,1) ↪ GU(3,3) paired against f (SU §11, Prop. 11.2.3). The local sections at p and at Σ are chosen as in SU §11.4, so that the Fourier coefficients c(β, x) are products of local Whittaker integrals with explicit values (SU Cor. 11.7.5–11.7.6, §11.8), the singular ones (det β = 0) being multiples of the L-values L^Σ\_K(f, χ̄\_fξ, κ − 1)·L^Σ(χ̄\_fξ̄′, κ − 2).

**Hypotheses.**

- κ > 6 for the absolutely convergent range; the sections at p have conductor dividing p as in (12.4.2.a) when the family is formed.
- The doubling/pullback formalism, the Siegel Eisenstein series on unitary groups and the local doubling integrals are imported; this node owns the Klingen-specific choices and coefficient formulas.

**Proof outline.**

1. Pullback (doubling) formula: restricting E^{Sieg}\_{GU(3,3)} to GU(2,2) × GU(1,1) and integrating against f gives the Klingen series times the standard L-value (SU Prop. 11.2.3, from Shimura/Garrett).
2. Local computations at unramified places, at Σ and at p (SU §11.4, Props 11.4.13, 11.4.17, 11.4.18, 11.4.23) and the Fourier coefficients (SU §11.6–11.7).
3. Hecke eigenvalues: E is an eigenform with Hecke polynomial Q\_{v,D} (SU §9.5–9.6).

**Checks.**

- The constant terms (Siegel operator images) and all singular Fourier coefficients are divisible by the product of the two L-values; the nonsingular ones are not in general.

**Uses.**

- L1/padic-eisenstein-family: the classical members G\_{D\_φ} interpolated by E\_D
- L1/nonsingular-coefficient-coprimality: the nonsingular coefficients c\_D(β\_i, x) analysed in §13
- AutomorphicCongruences:L5w/klingen-interpolation: Wan 2015's Hilbert analogue uses the same pullback pattern

**API.**

- `KlingenEisenstein.series` (constructor): E(Z, x; F) on GU(2,2) from (f, ψ, ξ, Σ, local sections).
- `KlingenEisenstein.pullback` (characterisation): E is the pairing of the pullback of E^{Sieg}\_{GU(3,3)} with f (doubling identity).
- `KlingenEisenstein.fourierCoeff` (data): c(β, x) as a product of local Whittaker integrals with the values of SU Cor. 11.7.5–11.7.6.
- `KlingenEisenstein.singular_dvd` (characterisation): For det β = 0, c(β, x) is a multiple of L^Σ\_K(f, χ̄\_fξ, κ−1)·L^Σ(χ̄\_fξ̄′, κ−2) divided by the period.
- `KlingenEisenstein.hecke` (characterisation): E is a Hecke eigenform with Hecke polynomials Q\_{v,D} at v ∉ Σ and the U\_p-eigenvalues ∏β\_i^{a\_i}.
- `KlingenEisenstein.siegelOperator` (projection): The Siegel-operator image of E at each boundary component is f (or 0) times the constant-term L-value.

**Unit tests.**

- `klingen_constant_term_divisible` (characterisation): The Siegel-operator image of E at the standard boundary component equals the L-value product times f, up to the explicit nonzero archimedean constant of SU §11.
- `klingen_weight_range` (degenerate): For κ ≤ 6 the defining series does not converge absolutely and SU's construction does not apply; the family is built only from κ > 6.
- `klingen_not_siegel` (non-example): The Siegel Eisenstein series on GU(2,2) itself (induced from the Siegel parabolic) has Hecke polynomials of a different shape (four characters, no two-dimensional constituent) and is not E.
- `klingen_hecke_matches_rhoD` (agreement): At v ∉ Σ, the Hecke polynomial of E equals φ(Q\_{v,D}), the characteristic polynomial of Frob\_v on the specialization of ρ\_D (L1/eisenstein-datum).

**Prerequisites.** `AutomorphicPadicLFunctions:L4/doubling-global-identity`, `AutomorphicPadicLFunctions:L4/local-zeta-at-p`, `AutomorphicPadicLFunctions:L4/ehls-eisenstein-measure`, `AutomorphicPadicLFunctions:L4e/ew-pullback-and-local-computations`, `AutomorphicCongruences:L1/gu22-ordinary-hermitian-forms`.

**Sources.**

- SU-2014, §9 (Props 9.2.6, 9.3.3, 9.5.3, 9.6.1, 9.6.2), pp. 113–135: The Klingen-type cuspidal Eisenstein series on GU(2,2), their Hecke eigenvalues and U\_p-behaviour.
- SU-2014, §11 (Prop. 11.2.3; Props 11.4.13–11.4.23; Props 11.6.1–11.6.2; Cor. 11.6.3; Props 11.7.1–11.7.4; Cors 11.7.5–11.7.6; Prop. 11.8.2), pp. 140–190: Siegel Eisenstein series on GU(3,3), their pullbacks and the computation of Fourier coefficients.

### The Skinner–Urban three-variable p-adic L-function

`AutomorphicCongruences:L1/su-padic-l-function` (theorem). Planet: Skinner–Urban p-adic L-function.

**Statement.** Let A, 𝕀, 𝐟, ξ and Σ be as in a p-adic Eisenstein datum, and suppose there is a finite A-valued idele class character ψ with ψ|\_{𝔸^×} = χ\_𝐟, unramified outside Σ. (i) There is L̃^Σ\_{𝐟,K,ξ} ∈ Frac(𝕀) ⊗\_𝕀 𝕀\_K whose value at every φ ∈ X\_{𝕀\_K,A}(𝐟, ψ, ξ) is the Petersson-normalized algebraic part of L^Σ\_K(f\_φ, χ̄\_{f\_φ}ξ\_φ, κ\_φ − 1) (SU Thm 12.3.1(i)); (ii) under (irred)\_𝐟 and (dist)\_𝐟 there is L^Σ\_{𝐟,K,ξ} ∈ 𝕀\_K whose value at φ is u\_{f\_φ} times the same L-value normalized by the canonical periods Ω^+\_{f\_φ}Ω^-\_{f\_φ}, u\_{f\_φ} a p-adic unit (SU Thm 12.3.1(ii)). (iii) If moreover χ\_𝐟 = 1, ξ = ξ̄^c with conductor dividing (p), (M, D\_K) = 1, M = M^+M^- with M^- squarefree with an odd number of primes, all inert in K, and ρ̄\_𝐟 ramified at every ℓ | M^-, then L^Σ\_{𝐟,K,ξ} lies in no prime of 𝕀\[\[Γ\_K]] of the form Q·𝕀\[\[Γ\_K]] with Q a height-one prime of 𝕀\[\[Γ^+\_K]] (SU Prop. 12.3.6, from Vatsal's µ = 0).

**Hypotheses.**

- As stated; the interpolation set X\_{𝕀\_K,A}(𝐟, ψ, ξ) is defined in SU §12.3 (conductor conditions at p).

**Proof outline.**

1. Apply the interpolation lemma 12.2.7 to the family g = f^{(1)}\_{D,1/M,1} of Prop. 12.2.5; Cor. 11.7.5 identifies the specializations (proof of SU Thm 12.3.1).
2. Density of X′\_D and independence of φ|\_{Γ^-\_K} place L̃ in Frac(𝕀) ⊗ 𝕀\_K; the integral version N\_g of Lemma 12.2.7(ii) gives (ii) (L0/canonical-period-congruence-number).
3. (iii): expand in γ^- − 1; the anticyclotomic specialization at a weight-two point has µ = 0 by Vatsal (through AutomorphicPadicLFunctions:L3h/finis-divisibility), so some coefficient is a unit and the series lies in no prime pulled back from 𝕀\[\[Γ^+\_K]].

**Checks.**

- Integrality (ii) requires (irred) and (dist); without them only (i) holds.
- The interpolation uses the canonical periods Ω^±; the anticyclotomic restriction is compared with Bertolini–Darmon's function only up to a unit (SU 3.6.14).

**Prerequisites.** `AutomorphicCongruences:L1/klingen-eisenstein-series`, `AutomorphicCongruences:L0/canonical-period-congruence-number`, `AutomorphicPadicLFunctions:L3h/finis-divisibility`, `AutomorphicPadicLFunctions:L3h/mod-p-nonvanishing`, `PadicFamilies:L1/family-period-line`.

**Sources.**

- SU-2014, Thm 12.3.1, p. 199; Prop. 12.3.6, p. 202: The two interpolation statements and the non-divisibility by pulled-back height-one primes from Vatsal's theorem.

### The Λ\_D-adic Klingen Eisenstein family and its constant terms

`AutomorphicCongruences:L1/padic-eisenstein-family` (theorem). Planet: Klingen Eisenstein family.

**Statement.** Let D be a p-adic Eisenstein datum with cond(ψ\_p), cond(ξ\_p) | p, (irred)\_𝐟 and (dist)\_𝐟, and K′ ⊆ K′\_D with K′K\_p neat. (i) There is E\_D ∈ M^{a,ord}(K′; Λ\_D) whose specialization at every φ ∈ X″\_D is u\_φ·G\_{D\_φ}/(Ω^+\_{f\_φ}Ω^-\_{f\_φ}) with |u\_φ|\_p = 1, G\_{D\_φ} the classical Klingen Eisenstein series (SU Thm 12.4.2(i), Thm 12.4.1); (ii) for x with x\_p ∈ Q(ℤ\_p) and det β = 0, the β-Fourier coefficient c\_D(β, x) lies in L^Σ\_{𝐟,K,ξ}·L^Σ\_{χ̄\_𝐟ξ̄′}·Λ\_D (Thm 12.4.2(ii)); (iii) h ∈ h\_D acts on E\_D by a homomorphism λ\_D: h\_D → Λ\_D with λ\_D(I\_D) = 0 (SU 6.5.3). Consequently, if P ⊂ Λ\_D is a height-one prime with E\_D ≢ 0 modulo P, then ord\_P(E\_D) ≥ ord\_P(L\_D) (SU Thm 6.5.4): subtracting a lift of E\_D's constant terms produces a cuspidal family congruent to E\_D modulo L\_D.

**Hypotheses.**

- (irred)\_𝐟, (dist)\_𝐟; A satisfies the hypotheses of SU Prop. 12.2.5; conductor condition (12.4.2.a) at p.
- The conclusion of Thm 6.5.4 is conditional on E\_D being nonzero modulo P; L1/nonsingular-coefficient-coprimality supplies this.

**Proof outline.**

1. Interpolate each q-expansion coefficient by Lemma 12.2.7 applied to f^{(2)}\_{D,β,x} (proof of SU Thm 12.4.1), using Cor. 11.7.6.
2. Assemble a Λ\_D-adic ordinary form by the q-expansion principle and Hida theory (L1/gu22-hida-control).
3. Thm 6.5.4: if ord\_P(L\_D) = r and E\_D ≢ 0 mod P, the boundary exact sequence lets one subtract a Λ\_D-adic lift of E\_D's boundary values times L\_D^{-1}·(unit), producing a cusp form H ≡ E\_D mod P^r, whence 𝕋\_D/I\_D surjects onto Λ\_D/(E\_D, P^r).

**Checks.**

- The congruence is with the whole family E\_D, not with an individual Eisenstein series; an interpolation formula for E\_D alone does not give it.
- Excluded case: if E\_D ≡ 0 mod P no bound is claimed.

**Prerequisites.** `AutomorphicCongruences:L1/klingen-eisenstein-series`, `AutomorphicCongruences:L1/gu22-hida-control`, `AutomorphicCongruences:L1/eisenstein-datum`, `AutomorphicCongruences:L1/su-padic-l-function`, `AutomorphicCongruences:L0/eisenstein-ideal`, `AutomorphicCongruences:L0/canonical-period-congruence-number`, `AutomorphicPadicLFunctions:L4/ehls-eisenstein-measure`.

**Sources.**

- SU-2014, Thms 12.4.1–12.4.2, pp. 202–203; Thm 6.5.4 and the paragraph before it, p. 98: The Λ\_D-adic Eisenstein series, divisibility of its singular coefficients by L\_D, and the resulting lower bound for the Eisenstein ideal.

### A nonsingular Fourier coefficient is prime to the p-adic L-function

`AutomorphicCongruences:L1/nonsingular-coefficient-coprimality` (theorem).

**Statement.** Let A be the ring of integers of a finite extension of ℚ\_p, 𝕀 a domain finite over Λ\_{W,A}, 𝐟 ∈ M^{ord}(M, 1; 𝕀) an 𝕀-adic newform with (irred)\_𝐟 and (dist)\_𝐟, and Σ\_0 ⊇ {ℓ | pMD\_K}. There is a finite Σ ⊇ Σ\_0 such that for D = (A, 𝕀, 𝐟, 1, 1, Σ) the set C\_D of nonsingular coefficients c\_D(β\_i, x) of E\_D satisfies: (i) every height-one prime of Λ\_D containing C\_D is of the form PΛ\_D with P a height-one prime of 𝕀\[\[Γ^+\_K]]; (ii) if M = M^+M^- with M^- squarefree with an odd number of prime factors, all inert in K, and ρ̄\_𝐟 ramified at every ℓ | M^-, then no height-one prime of Λ\_D contains both L^Σ\_{𝐟,K,1} and C\_D (SU Prop. 13.4.1).

**Hypotheses.**

- The hypotheses of SU Prop. 12.2.5 on A; the auxiliary primes of Prop. 13.2.5 (a set of primes split in K not dividing the level) are part of the choice of Σ.

**Proof outline.**

1. Express a Λ\_D-combination of the c\_D(β\_i, x) as a product of Hecke L-values attached to auxiliary CM forms (SU §13.2–13.3, Props 13.2.5, 13.3.4).
2. Apply the mod-p nonvanishing results of Vatsal and Finis for anticyclotomic twists (AutomorphicPadicLFunctions:L3h/finis-divisibility, mod-p-nonvanishing) to show that combination is not divisible by any height-one prime other than those pulled back from 𝕀\[\[Γ^+\_K]].
3. Combine with L1/su-padic-l-function (iii), which excludes the pulled-back primes from L^Σ\_{𝐟,K,1}, to get (ii).

**Checks.**

- This is what makes E\_D nonzero modulo every height-one prime dividing L^Σ\_{𝐟,K}, so that Thm 6.5.4 applies at those primes.

**Prerequisites.** `AutomorphicCongruences:L1/padic-eisenstein-family`, `AutomorphicCongruences:L1/su-padic-l-function`, `AutomorphicPadicLFunctions:L3h/finis-divisibility`, `AutomorphicPadicLFunctions:L3h/mod-p-nonvanishing`, `AutomorphicPadicLFunctions:L3h/hsieh-hecke-nonvanishing`.

**Sources.**

- SU-2014, Prop. 13.4.1 and the paragraph before it, p. 217; Props 13.2.5, 13.3.4, pp. 210–213: Existence of a datum whose nonsingular coefficients share no height-one prime with L^Σ\_{𝐟,K,1}.
- SU-2014, §1.4.5, p. 9: The proof uses formulas from §11 and the mod-p nonvanishing results of Vatsal and Finis.

### The four-dimensional pseudo-character of the ordinary GU(2,2) Hecke algebra

`AutomorphicCongruences:L1/gu22-galois-pseudocharacter` (construction).

**Statement.** For a neat K = K^0\_pK^p ⊂ G(𝔸\_f) and a finite set S of primes containing p and the primes where K\_ℓ is not hyperspecial, there is a pseudo-representation T^S\_{K^p}: G\_K → h\_{S,0}(K^p) of dimension four such that tr R\_p(π) = λ^{ord}\_π ∘ T^S\_{K^p} for every p-ordinary cuspidal π of weight k with π\_f^{K^p} ≠ 0 (SU Prop. 7.2.1), where R\_p(π) is the four-dimensional Galois representation attached to π (imported from AutomorphicGaloisRepresentationsPartII: polarized, unramified outside S, crystalline at p when π\_p is unramified, with the ordinary filtration at the primes above p). For a datum D, T\_D is its composite with h\_D, R\_D the semisimple representation over the total fraction ring of h\_D with trace T\_D, and for each irreducible component J, R\_J is either absolutely irreducible or, over a finite extension of Frac J, R\_1 ⊕ R\_2 with two-dimensional R\_i satisfying R\_i^c ≅ R\_i^∨ ⊗ ε^{-3}ω^{1+c}\_{K′} (SU Thm 7.3.1).

**Hypotheses.**

- k regular for the attachment of R\_p(π) (SU Thm 7.1.1, from Morel and Shin as explained in Skinner 2010); (irred)\_𝐟 and (dist)\_𝐟 for Thm 7.3.1.
- The Galois representations of cuspidal representations of GU(2,2) and their local–global compatibility at p are imported (RT-AREA-iwasawa-1/6), not constructed here.

**Proof outline.**

1. Define T(frob\_v) := T\_v (the Hecke operator giving −1 times the X^3-coefficient of the Hecke polynomial) for v ∉ S ∪ {p}, extend by continuity using Chebotarev density and compactness of h, and check independence of the approximating sequence on a Zariski-dense set of arithmetic points (proof of SU Prop. 7.2.1).
2. The pseudo-representation identities hold because they hold at each classical point and these are dense.
3. Thm 7.3.1: if R\_J were a sum of two characters and an irreducible two-dimensional piece, specialize at a regular-weight point unramified at p to get a CAP representation, excluded by the residual shape tr ρ̄\_D; otherwise R\_J = R\_1 ⊕ R\_2 with the stated polarization.

**Checks.**

- The residual pseudo-character of 𝕋\_D is tr ρ̄\_D: two characters and one irreducible two-dimensional constituent.

**Uses.**

- L1/su-selmer-lower-bound: σ of the lattice datum is the representation R\_D over the localized Hecke algebra
- L2s/cap-exclusion: CLW and FW use the same pseudo-character argument on GU(3,1) (SU Prop. 7.2.1 cited there)

**API.**

- `GU22PseudoChar.T` (constructor): T^S\_{K^p}: G\_K → h\_{S,0}(K^p), a continuous four-dimensional pseudo-representation.
- `GU22PseudoChar.specialize` (characterisation): λ^{ord}\_π ∘ T = tr R\_p(π) for every ordinary cuspidal π of level K^p.
- `GU22PseudoChar.frob` (characterisation): T(frob\_v) = T\_v for v ∉ S ∪ {p}; the characteristic polynomial of frob\_v is the Hecke polynomial Q\_v.
- `GU22PseudoChar.polarization` (characterisation): T(c g c) = T(g^{-1})·(similitude character) — the polarization inherited from each R\_p(π).
- `GU22PseudoChar.components` (structure): Dichotomy of Thm 7.3.1 for components J of 𝕋\_D.
- `GU22PseudoChar.residual` (characterisation): T\_D modulo the maximal ideal is tr ρ̄\_D.

**Unit tests.**

- `gu22PseudoChar_dimension` (computation): T(1) = 4.
- `gu22PseudoChar_eisenstein_point` (agreement): At a point of h\_D through which λ\_D factors, T\_D specializes to tr ρ\_D of the Eisenstein datum.
- `gu22PseudoChar_not_gl2` (non-example): A pseudo-character of dimension two (the GL₂ one of 𝐟) does not satisfy GU22PseudoChar.specialize: its value at 1 is 2.
- `gu22PseudoChar_cap_excluded` (characterisation): No component J has R\_J = character ⊕ character ⊕ irreducible two-dimensional (the CAP shape), under (irred)\_𝐟 and (dist)\_𝐟.

**Prerequisites.** `AutomorphicGaloisRepresentationsPartII:AG2.2/shin-regular-geometric-existence`, `AutomorphicGaloisRepresentationsPartII:AG2.2/discrete-unitary-galois-assembly`, `AutomorphicGaloisRepresentationsPartII:AG2.5/good-prime-unramified-polynomial`, `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`, `IntegralHeckeAndGaloisDeterminants:IHG.4/classical-interpolation`, `IntegralHeckeAndGaloisDeterminants:IHG.4/frobenius-determinant-uniqueness`, `AutomorphicCongruences:L1/gu22-ordinary-hermitian-forms`, `AutomorphicCongruences:L1/eisenstein-datum`.

**Sources.**

- SU-2014, Thm 7.1.1, p. 99; Prop. 7.2.1 and its proof, p. 101: The Galois representations of ordinary cuspidal representations of GU(2,2) and the pseudo-representation on the universal ordinary Hecke algebra.
- SU-2014, Thm 7.3.1 and its proof, pp. 103–105: Components of the Hecke algebra give irreducible or polarized-reducible representations.

### The Skinner–Urban Selmer lower bound from the Eisenstein ideal

`AutomorphicCongruences:L1/su-selmer-lower-bound` (theorem).

**Statement.** Assume (irred)\_𝐟, (dist)\_𝐟 and 𝕀 integrally closed. Let T = (T\_𝐟 ⊗\_𝕀 𝕀\[\[Γ\_K]])(det ρ\_𝐟^{-1}σ^{-c}\_ξε^{-c}\_K) with its ordinary summand T^+, and Ch^Σ\_K(ρ\_𝐟 ⊗ σ\_ξε\_K) ⊆ 𝕀\[\[Γ\_K]] the characteristic ideal of X^Σ\_K(T, T^+). For a height-one prime P\_0 ⊂ 𝕀\[\[Γ\_K]] with P = P\_0Λ\_D such that the four G\_{K,p}-characters of SU (7.3.3.a) are residually distinct modulo P: (i) if ord\_P(L^Σ\_{χ̄\_𝐟ξ̄′}) = 0 then ord\_{P\_0}(Ch^Σ\_K(ρ\_𝐟 ⊗ σ\_ξε\_K)) ≥ ord\_P(E\_D) (SU Thm 7.3.3); (ii) if E\_D ≢ 0 modulo P and ord\_P(L^Σ\_{𝐟,K,ξ}) ≥ 1, then ord\_P(Ch^Σ\_K) ≥ 1, and if moreover ord\_P(L^Σ\_{χ̄\_𝐟ξ̄′}) = 0 then ord\_P(Ch^Σ\_K) ≥ ord\_P(L^Σ\_{𝐟,K,ξ}) (SU Thm 7.3.5).

**Hypotheses.**

- Residual disjointness (7.3.3.a) is verified in the proof of Thm 7.3.5: the four characters δ²\_fσ^{-1}\_{χ\_f}ε\_Wε, δ\_fσ^{-1}\_{χ\_f}σ\_ξε\_W, δ\_fσ^{-1}\_{χ\_f}σ^c\_ξε\_W, σ\_{χ\_f}ε^{-1}\_Wσ^{-1}\_{ξ′}ε are not ≡ 1 modulo P, by (dist)\_𝐟 and a codimension count.

**Proof outline.**

1. Set up the lattice datum of SU 7.3.2: A\_0 = Λ\_D, A = Λ̂\_{D,P}, J\_0 = E\_D, R\_0 = 𝕋\_D, I\_0 = I\_D, V\_0 = T\_𝐟 ⊗ Λ\_D, ρ\_0 = ρ\_𝐟 ⊗ σ\_{χ̄\_f,0}σ^{-c}\_ξσ^c\_ψε^{-2}, V^±\_0 from T^+\_𝐟, χ, χ′, ν, and σ from R\_D.
2. Apply L0/lattice-construction (Prop. 4.5.6 and Cor. 4.5.7) and Shapiro (L0/sigma-primitive-selmer) to pass from ρ\_0 ⊗ χ^{-1} over Λ\_D to ρ\_𝐟 ⊗ σ\_ξε\_K over 𝕀\[\[Γ\_K]].
3. Thm 7.3.5 combines (i) with L1/padic-eisenstein-family (Thm 6.5.4) and checks (7.3.3.a).

**Checks.**

- The bound is height-one-prime by height-one-prime and needs E\_D ≢ 0 mod P; L1/nonsingular-coefficient-coprimality supplies this at every P dividing L^Σ\_{𝐟,K}.

**Prerequisites.** `AutomorphicCongruences:L0/lattice-construction`, `AutomorphicCongruences:L0/su-lattice-datum`, `AutomorphicCongruences:L0/sigma-primitive-selmer`, `AutomorphicCongruences:L1/eisenstein-datum`, `AutomorphicCongruences:L1/gu22-galois-pseudocharacter`, `AutomorphicCongruences:L1/padic-eisenstein-family`.

**Sources.**

- SU-2014, §7.3.2 set-up, Thm 7.3.3, p. 105; Thm 7.3.5 and proof, pp. 107–108: The SU instance of the lattice construction and the passage from the Eisenstein ideal to the p-adic L-function.

### Skinner–Urban's two-variable divisibility over K

`AutomorphicCongruences:L1/su-two-variable-theorem` (theorem). Planet: Skinner–Urban two-variable theorem.

**Statement.** Let L ⊆ ℚ̄\_p be a finite extension of ℚ\_p containing ℚ\[µ\_{Np}, i, D\_K^{1/2}], 𝕀 a normal domain finite over Λ\_{W,O\_L}, and 𝐟 an 𝕀-adic ordinary eigenform of tame level N with χ\_𝐟 = 1. Suppose N = N^+N^- with N^+ divisible only by primes split in K and N^- only by primes inert in K, N^- squarefree with an odd number of prime factors, (irred)\_𝐟 and (dist)\_𝐟, and ρ̄\_𝐟 ramified at every ℓ | N^-. For every finite Σ containing the primes dividing ND\_K, Ch^Σ\_{K\_∞}(𝐟) ⊆ (L^Σ\_{𝐟,K}) (SU Thm 3.6.1). For a classical p-ordinary eigenform f ∈ S\_k(Np^r, χ; L), k ≥ 2, with χ = ω^{k−2}χ\_1 (χ\_1 of p-power order and conductor) and the same hypotheses, Ch^Σ\_{K\_∞,L}(f) ⊆ (L^Σ\_{f,K}) (SU Cor. 3.6.2).

**Hypotheses.**

- As stated; the hypotheses on N^- and ρ̄\_𝐟|\_{I\_ℓ} enter through Vatsal's theorem (L1/su-padic-l-function (iii)); χ\_𝐟 = 1 enters there and in the Galois argument; Σ ⊇ primes dividing ND\_K avoids local–global compatibility away from p (SU remarks (i)–(v) after Thm 3.6.1).

**Proof outline.**

1. For each height-one prime P\_0 of 𝕀\[\[Γ\_K]] dividing L^Σ\_{𝐟,K}, choose the datum of L1/nonsingular-coefficient-coprimality so that E\_D ≢ 0 mod P = P\_0Λ\_D.
2. If ord\_P L^Σ\_{χ̄\_𝐟ξ̄′} = 0 apply L1/su-selmer-lower-bound (ii); the Dirichlet factor is a unit at P because it lives in the cyclotomic variable only and P\_0 is not pulled back (L1/su-padic-l-function (iii)).
3. Conclude ord\_{P\_0}(Ch^Σ) ≥ ord\_{P\_0}(L^Σ\_{𝐟,K}) for every height-one P\_0, hence the divisorial containment (end of SU §7, p. 108).
4. Cor. 3.6.2: specialize along 𝕀 → O\_L using (3.3.12.b), L0/selmer-specialization-control (ii) and the comparison of L^Σ\_{𝐟,K} with L^Σ\_{f,K} (SU 3.4.6).

**Checks.**

- Oriented: the characteristic ideal is contained in the ideal of the p-adic L-function (L divides the characteristic power series).
- Integral, not after inverting p, under the stated hypotheses.

**Prerequisites.** `AutomorphicCongruences:L1/su-selmer-lower-bound`, `AutomorphicCongruences:L1/nonsingular-coefficient-coprimality`, `AutomorphicCongruences:L1/su-padic-l-function`, `AutomorphicCongruences:L0/selmer-specialization-control`, `AutomorphicCongruences:L0/primitive-imprimitive-comparison`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`.

**Sources.**

- SU-2014, Thm 3.6.1 and remarks (i)–(v), pp. 41–42; Cor. 3.6.2 and proof, p. 42; end of §7, p. 108: The two-variable divisibility for Hida families and its specialization to classical forms.

### Skinner–Urban's cyclotomic divisibility

`AutomorphicCongruences:L1/su-cyclotomic-divisibility` (theorem). Planet: Skinner–Urban cyclotomic divisibility.

**Statement.** Let f ∈ S\_k(Np^r, χ; L), k ≥ 2, be a p-ordinary cuspidal eigenform with (irred) and (dist) for ρ\_f, χ = ω^{k−2}χ\_1 with χ\_1 of p-power order and conductor, and a prime q ≠ p with q ∥ N at which ρ̄\_f is ramified; choose an imaginary quadratic K in which p splits, every prime dividing N/q splits and q is inert, so N^- = q. Then for every finite set of primes Σ, Ch^Σ\_{ℚ\_∞,L}(f)·Ch^Σ\_{ℚ\_∞,L}(f ⊗ χ\_K) ⊆ (L^Σ\_f·L^Σ\_{f⊗χ\_K}) (SU Cor. 3.6.3). This is the reverse divisibility exported to ModularIwasawaMainConjectures:L1/su-ordinary-theorem, in the normalization of the Σ-imprimitive ordinary Selmer dual and the canonical-period p-adic L-function; the equality (SU Thm 3.6.4, with Kato) is assembled there, not here.

**Hypotheses.**

- As stated; the integral containment needs only these hypotheses. The integral equality additionally uses Kato's image condition (a basis with image containing SL₂(ℤ\_p)), owned by the consumer.
- The identification with ModularIwasawaMainConjectures:L0's ordinary Selmer dual and canonical-period p-adic L-function is made in that roadmap's range (trivial character, p ∤ N, the range of SU Thm 3.6.4); outside it the statement is about SU's own Σ-primitive Selmer group and L^Σ\_f.

**Proof outline.**

1. Reduce to Σ ∪ {p} containing all primes dividing ND\_K (SU Lemma 3.2.17 and L0/primitive-imprimitive-comparison).
2. Apply L1/su-two-variable-theorem (Cor. 3.6.2), then descend from K\_∞ to the cyclotomic line: L0/selmer-specialization-control (iii) (SU Prop. 3.2.11, Lemma 3.2.5, Cor. 3.2.9) gives Ch^Σ\_{K^+\_∞} = Ch^Σ\_{ℚ\_∞}(f)·Ch^Σ\_{ℚ\_∞}(f ⊗ χ\_K) by Shapiro, and the restriction of L^Σ\_{f,K} to Γ^+\_K is L^Σ\_f·L^Σ\_{f⊗χ\_K} up to unit (SU 3.4.6).

**Checks.**

- Matches the request of ModularIwasawaMainConjectures for SU Thm 3.6.1 and Cor. 3.6.3 in its stated source range; the auxiliary field K is allowed to depend on f.

**Prerequisites.** `AutomorphicCongruences:L1/su-two-variable-theorem`, `AutomorphicCongruences:L0/selmer-specialization-control`, `AutomorphicCongruences:L0/primitive-imprimitive-comparison`, `ModularIwasawaMainConjectures:L0/ordinary-selmer-dual`, `ModularIwasawaMainConjectures:L0/canonical-ordinary-padic-l-function`.

**Sources.**

- SU-2014, Cor. 3.6.3 and proof, p. 42; proof of Thm 3.6.4 (choice of K), p. 43: The cyclotomic product divisibility and the choice of the auxiliary imaginary quadratic field.

### Dependencies of layer L1

Inside this roadmap and on other roadmaps (node and stage ids): `AutomorphicBundles:B5/fj-injectivity`, `AutomorphicBundles:B5/global-fj-expansion`, `AutomorphicCongruences:L0/canonical-period-congruence-number`, `AutomorphicCongruences:L0/eisenstein-ideal`, `AutomorphicCongruences:L0/lattice-construction`, `AutomorphicCongruences:L0/primitive-imprimitive-comparison`, `AutomorphicCongruences:L0/selmer-specialization-control`, `AutomorphicCongruences:L0/sigma-primitive-selmer`, `AutomorphicCongruences:L0/su-lattice-datum`, `AutomorphicGaloisRepresentationsPartII:AG2.2/discrete-unitary-galois-assembly`, `AutomorphicGaloisRepresentationsPartII:AG2.2/shin-regular-geometric-existence`, `AutomorphicGaloisRepresentationsPartII:AG2.5/good-prime-unramified-polynomial`, `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`, `AutomorphicPadicLFunctions:L3h/finis-divisibility`, `AutomorphicPadicLFunctions:L3h/hsieh-hecke-nonvanishing`, `AutomorphicPadicLFunctions:L3h/mod-p-nonvanishing`, `AutomorphicPadicLFunctions:L4/dl-siegel-hermitian-varieties`, `AutomorphicPadicLFunctions:L4/doubling-global-identity`, `AutomorphicPadicLFunctions:L4/ehls-eisenstein-measure`, `AutomorphicPadicLFunctions:L4/ehls-ordinary-forms-hecke`, `AutomorphicPadicLFunctions:L4/ehls-unitary-datum`, `AutomorphicPadicLFunctions:L4/local-zeta-at-p`, `AutomorphicPadicLFunctions:L4e/ew-pullback-and-local-computations`, `DirichletPadicLFunctions:L4`, `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`, `IntegralHeckeAndGaloisDeterminants:IHG.4/classical-interpolation`, `IntegralHeckeAndGaloisDeterminants:IHG.4/frobenius-determinant-uniqueness`, `ModularIwasawaMainConjectures:L0/canonical-ordinary-padic-l-function`, `ModularIwasawaMainConjectures:L0/ordinary-selmer-dual`, `PadicFamilies:L0a/ordinary-part-complexes`, `PadicFamilies:L0a/profinite-ordinary-projector`, `PadicFamilies:L0a/profinite-projector-exact`, `PadicFamilies:L1/family-period-line`, `PadicFamilies:L4/ordinary-big-galois-representation`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`.

### Acceptance for layer L1

Coverage: **planned**. RT-AREA-iwasawa-1/22: the FW §4.8 target moved to L2; L1 is Skinner–Urban's argument only. RT-AREA-iwasawa-1/6: the Galois representations are imported from AutomorphicGaloisRepresentationsPartII (AG2.2, AG2.5, AG2.6). RT-AREA-iwasawa-1/7: Vatsal and Finis enter through AutomorphicPadicLFunctions:L3h's mod-p nonvanishing nodes.

- Refinement: Decompose SU §§9 and 11 (Klingen and Siegel Eisenstein series, local sections, Fourier coefficients) into lemma nodes from a full reading; only statements were read.
- Refinement: Decompose SU §13.2–13.3 (auxiliary primes and the Λ\_D-combination of nonsingular coefficients) behind L1/nonsingular-coefficient-coprimality.

## Layer L2s: Semi-ordinary GU(3,1) congruences: the Castella–Liu–Wan replacement

Castella, Liu and Wan replace ordinary Hida theory on GU(3,1) by a semi-ordinary theory in two of the three weight directions, which admits weight-two forms that are not ordinary at p. Their Klingen family, Fourier–Jacobi computation and lattice argument give a one-sided divisibility of the two-variable Greenberg main conjecture, after localizing the cyclotomic coefficient subring, and after inverting p under further conditions.

### The semi-ordinary weight space and projector for GU(3,1)

`AutomorphicCongruences:L2s/semi-ordinary-weight-space` (definition). Planet: Semi-ordinary projector.

**Statement.** Let K be imaginary quadratic with p = v\_0v̄\_0 split, and GU(3,1) the unitary similitude group of signature (3,1), so that GU(3,1)(ℚ\_p) ≅ GL\_4(ℚ\_p) × ℚ\_p^× and the diagonal torus of the p-adic group gives a three-dimensional p-adic weight space of characters (a\_1, a\_2, a\_3; b\_1). The semi-ordinary torus T\_so(ℤ\_p) ⊂ T(ℤ\_p) is the two-dimensional subtorus of weights (0, 0, t^+; t^-), with Iwasawa algebra Λ\_so = ℤ\_p\[\[T\_so(ℤ\_p)]]. On the p-adic forms V on the Igusa tower put U\_p := U^+\_{p,2}U^+\_{p,3}U^-\_{p,1}; for every f ∈ V the limit e\_so f := lim\_{r→∞} U\_p^{r!} f exists and defines the semi-ordinary projector e\_so. A classical form is semi-ordinary if it is fixed by e\_so; this asks unit U\_p-eigenvalues only in the two directions of T\_so, so it allows forms whose GL\_2 part at p is not ordinary (a\_p = 0 is allowed).

**Hypotheses.**

- p ≥ 3 split in K; the operators U^±\_{p,i} are those of CLW (3.0.7)–(3.0.8) on p-integral forms.
- The convergence of U\_p^{r!} on every f uses the finiteness property (F) of CLW Thm 4.6.1, proved there; the generic profinite projector is imported.

**Proof outline.**

1. Define U\_p and verify property (F) for forms in V^♭ by CLW Prop. 3.0.2 and Prop. 4.5.2, and for all of V by Prop. 4.5.3.
2. Apply the profinite ordinary projector of PadicFamilies:L0a to the locally finite endomorphism U\_p to obtain e\_so.

**Checks.**

- Semi-ordinary is weaker than ordinary: an ordinary form is semi-ordinary, while a form whose GL\_2 constituent at p has a\_p = 0 can be semi-ordinary and is killed by the ordinary projector.

**Uses.**

- L2s/semi-ordinary-hida-theory: the freeness and control theorems are for e\_so-parts
- L2s/semi-ordinary-klingen-family: E^{Kling} is a measure valued in e\_so V
- L2/general-weight-semi-ordinary-control: FW §7.3 extends the same projector to general weight

**API.**

- `SemiOrd.torus` (data): T\_so(ℤ\_p) ⊂ T(ℤ\_p), the two-dimensional torus of weights (0,0,t^+;t^-), and Λ\_so.
- `SemiOrd.Up` (data): U\_p = U^+\_{p,2}U^+\_{p,3}U^-\_{p,1} acting on p-adic forms.
- `SemiOrd.proj` (constructor): e\_so = lim U\_p^{r!}, an idempotent commuting with the Hecke operators away from p.
- `SemiOrd.proj_idem` (simp): e\_so ∘ e\_so = e\_so.
- `SemiOrd.ord_le_so` (relation): e\_so ∘ e\_ord = e\_ord: ordinary forms are semi-ordinary.
- `SemiOrd.weight` (projection): The weight map from Λ\_so-families to characters (τ^+, τ^-) of T\_so(ℤ\_p).

**Unit tests.**

- `semiOrd_projector_eigenvalue` (computation): On a classical eigenform whose U\_p-eigenvalue is a p-adic unit u, U\_p^{r!}f = u^{r!}f → f because u^{r!} → 1 in ℤ\_p^× along r!; on an eigenform with U\_p-eigenvalue in pℤ\_p the limit is 0.
- `semiOrd_nonordinary_survives` (characterisation): A semi-ordinary classical form of weight (0,0,t^+;t^-) whose GL\_2(ℚ\_p) constituent is unramified with Satake parameters of valuation ±1/2 is fixed by e\_so and killed by the ordinary projector (CLW (8.2.4)–(8.2.5) shape).
- `semiOrd_two_dimensional` (degenerate): The weight space of Λ\_so-families has dimension two, not three: specializations fix a\_1 = a\_2 = 0.
- `semiOrd_not_ordinary_projector` (non-example): Using the ordinary projector in place of e\_so on the weight-two forms of a supersingular π gives zero, so it cannot produce the Klingen family of L2s/semi-ordinary-klingen-family.

**Prerequisites.** `PadicFamilies:L0a/locally-finite-action`, `PadicFamilies:L0a/locally-finite-ordinary-projector`, `PadicFamilies:L0a/profinite-ordinary-projector`, `AutomorphicPadicLFunctions:L4/ehls-unitary-datum`, `AutomorphicPadicLFunctions:L4/ehls-ordinary-forms-hecke`, `mathlib:MvPowerSeries`.

**Sources.**

- CLW-v1, Thm 2.9.1(1), p. 13; Thm 4.6.1 and proof, p. 29: The operator U\_p = U^+\_{p,2}U^+\_{p,3}U^-\_{p,1}, convergence of U\_p^{r!} on every p-adic form, and the semi-ordinary projector e\_so.
- CLW-v1, §1, p. 3: The modular form is not assumed ordinary at p, so the standard Hida theory does not apply; the semi-ordinary theory replaces it.

### Semi-ordinary Hida theory and the fundamental exact sequence

`AutomorphicCongruences:L2s/semi-ordinary-hida-theory` (theorem). Planet: Semi-ordinary Hida theory.

**Statement.** With e\_so as in L2s/semi-ordinary-weight-space: (1) the duals V^{0,\*}\_so = Hom(e\_so V^0, ℚ\_p/ℤ\_p) and V^\*\_so = Hom(e\_so V, ℚ\_p/ℤ\_p) are free of finite rank over Λ\_so (vertical control, CLW Thm 3.0.7 for cusp forms, Thm 4.6.1 for all forms); (2) the spaces of Λ\_so-families of tame level K^p\_f, M^0\_so = Hom\_{Λ\_so}(V^{0,\*}\_so, Λ\_so) and M\_so = Hom\_{Λ\_so}(V^\*\_so, Λ\_so), specialize isomorphically at every weight (τ^+, τ^-) with 0 ≥ t^+ ≥ −t^- + 4 onto the limits of e\_so-parts of mod p^m forms of that weight, and classical semi-ordinary forms embed into the specialization after inverting p (CLW (2.9.1)); (3) there is a fundamental exact sequence 0 → M^0\_{so} → M\_{so} → ⊕\_{g ∈ C(K^p\_f)} M\_{GU(2)}(K^p\_{f,g}K\_{p,0}, Ô^{ur}\_L) ⊗ ℤ\_p\[\[Γ\_K]] → 0 given by the Siegel operators Φ\_g at the cusp labels g, after specializing the family along the character ξ (CLW Thm 2.9.1, used in Thm 8.1.1).

**Hypotheses.**

- The weights in (2) satisfy 0 ≥ t^+ ≥ −t^- + 4; for the Klingen family, 0 ≫ t^+ ≫ −t^-.
- The Shimura variety of GU(3,1), its toroidal and minimal compactifications, the Igusa tower and the boundary strata are imported from AutomorphicPadicLFunctions:L4 and AutomorphicBundles.

**Proof outline.**

1. Base change and q-expansion: CLW Props 3.0.1–3.0.6; vertical control for cusp forms (Thm 3.0.7).
2. The boundary: restriction to the strata Z\_{g,n} gives the exact sequences (4.4.2)–(4.4.3) with the Siegel operators Φ\_g (Prop. 4.4.1), whose global sections are forms on the zero-dimensional Shimura variety of GU(2).
3. Finiteness (F) and the vertical control for all forms (Props 4.5.1–4.5.3, Thm 4.6.1); combine into Thm 2.9.1.

**Checks.**

- The exactness on the right is what allows a Λ\_so-adic lift of the boundary values of the Klingen family, hence a cuspidal family congruent to it.

**Prerequisites.** `AutomorphicCongruences:L2s/semi-ordinary-weight-space`, `PadicFamilies:L0a/profinite-projector-exact`, `PadicFamilies:L0a/ordinary-part-complexes`, `AutomorphicBundles:B5/global-fj-expansion`, `AutomorphicBundles:B5/fj-injectivity`, `AutomorphicPadicLFunctions:L4/ehls-ordinary-forms-hecke`.

**Sources.**

- CLW-v1, Thm 2.9.1, p. 13; Thm 3.0.7, p. 19; Prop. 4.4.1, p. 24; Thm 4.6.1, p. 29: Freeness, control, the boundary exact sequences and the vertical control theorem for semi-ordinary forms on GU(3,1).
- CLW-v1, proof of Thm 8.1.1, p. 77: The fundamental exact sequence in the form used for the congruence.

### The semi-ordinary Klingen Eisenstein family on GU(3,1)

`AutomorphicCongruences:L2s/semi-ordinary-klingen-family` (construction). Planet: Semi-ordinary Klingen family.

**Statement.** Let π be generated by a weight-two newform f satisfying CLW §5.2 (every π\_v unramified, Steinberg or an unramified quadratic twist of Steinberg; π\_p unramified; a prime q nonsplit in K with π\_q ramified, and π ramified at 2 if 2 is nonsplit; ρ̄\_π|\_{G\_K} irreducible), and ξ an algebraic Hecke character of K of ∞-type (0, k\_0), k\_0 even. Construct a measure E^{Kling}\_φ ∈ Meas(Γ\_K, e\_so V\_{GU(3,1),ξ} ⊗̂ Ô^{ur}\_L) whose specialization at an algebraic Hecke character τ (with τ\_{p-adic} factoring through Γ\_K and ξτ of ∞-type (0,k), k ≥ 6 even) is the semi-ordinary projection of the holomorphic Klingen Eisenstein series on GU(3,1) induced from (π\_D, ξτ) on the Klingen Levi, built by the doubling method from the p-adic Siegel Eisenstein measure on GU(3,3) (CLW Thm 5.9.1, Thm 5.5.1, Prop. 5.10.1). Its degenerate Fourier–Jacobi coefficients Φ\_g(E^{Kling}\_φ)(g′) lie in (L^{Σ∪{ℓ,ℓ′}}\_{ξ,ℚ}·L^{Σ∪{ℓ,ℓ′}}\_{π,K,ξ}) ⊆ Ô^{ur}\_L\[\[Γ\_K]] (CLW Thm 6.1.1), where L\_{ξ,ℚ} is the Kubota–Leopoldt function (6.1.1) and L\_{π,K,ξ} the Eischen–Wan function with interpolation (6.1.2).

**Hypotheses.**

- CLW §5.2 hypotheses on π and ξ; the auxiliary primes ℓ, ℓ′ and the sections at Σ ∪ {ℓ, ℓ′} chosen in §§5.6–5.7 using Hsieh's mod-p nonvanishing.
- The Siegel Eisenstein measures on unitary groups, the pullback formula and the local doubling integrals are imported from AutomorphicPadicLFunctions:L4 and L4e (Eischen–Wan's ordinary U(3,1) family is their r = 2 case); CLW's semi-ordinary sections at p, which replace Eischen–Wan's ordinary ones, and the Klingen choices are owned here.

**Proof outline.**

1. Choose the definite quaternion algebra D ramified at q and ∞ and the Jacquet–Langlands transfer π\_D (CLW §5.4); fix the sections at each place (§§5.6–5.8), with the auxiliary characters of §5.6 chosen by Hsieh's nonvanishing.
2. Interpolate the Siegel Eisenstein series on GU(3,3) into a measure (Thm 5.9.1) and pull back along GU(3,1) × GU(0,2) ↪ GU(3,3) against π\_D (Thm 5.5.1, doubling formula), applying e\_so (Prop. 5.10.1).
3. Compute the constant terms at each cusp label: the Siegel operator images are the L-value products (Thm 6.1.1).

**Checks.**

- Shared local test data: the sections at p and the auxiliary characters are fixed before any arithmetic conclusion, and FW's general-weight family (L2/vector-valued-klingen-family) reuses them.

**Uses.**

- L2s/fourier-jacobi-primitivity: a nondegenerate Fourier–Jacobi coefficient of E^{Kling} is shown to be a unit
- L2s/clw-eisenstein-congruence: the congruence of E^{Kling} with a cuspidal family bounds E\_{π,ξ}
- L2/vector-valued-klingen-family: FW's general-weight analogue

**API.**

- `SemiOrdKlingen.family` (constructor): E^{Kling}\_φ ∈ Meas(Γ\_K, e\_so V\_{GU(3,1),ξ} ⊗̂ Ô^{ur}\_L).
- `SemiOrdKlingen.specialize` (characterisation): Its value at τ is e\_so of the holomorphic Klingen Eisenstein series of weight given by ξτ (∞-type (0,k), k ≥ 6).
- `SemiOrdKlingen.constantTerm` (characterisation): Φ\_g(E^{Kling}\_φ)(g′) ∈ (L\_{ξ,ℚ}·L\_{π,K,ξ}) for every cusp label g and g′ (CLW Thm 6.1.1).
- `SemiOrdKlingen.hecke` (characterisation): E^{Kling}\_φ is an eigenvector for the unramified Hecke operators and U\_p, with eigensystem λ\_{π,ξ} defining the Eisenstein ideal E\_{π,ξ}.
- `SemiOrdKlingen.fourierJacobi` (projection): Its Fourier–Jacobi coefficients along the Klingen parabolic, valued in sections of line bundles on the boundary abelian scheme.
- `SemiOrdKlingen.sharedData` (data): The local sections and auxiliary characters, shared with L2's general-weight family.

**Unit tests.**

- `semiOrdKlingen_weight_range` (degenerate): Only τ with ξτ of ∞-type (0,k), k ≥ 6 even, are interpolation points; at k < 6 the classical series is not in the convergent range.
- `semiOrdKlingen_constant_term` (characterisation): At an interpolation point the constant term at the standard cusp is the product of L^{Σ∪{∞,p,ℓ,ℓ′}}(k−2, ξ^ℚ\_0τ^ℚ\_0) and the base-change value L^{Σ∪{∞,p,ℓ,ℓ′}}((k−1)/2, BC(π) × ξ\_0τ\_0), up to the archimedean and p-local factors of (6.1.1)–(6.1.2).
- `semiOrdKlingen_eigen_shape` (computation): The Galois representation of an interpolation point is ρ\_π|\_{G\_K} twisted, plus two characters: three constituents of dimensions 2, 1, 1.
- `semiOrdKlingen_not_ordinary_family` (non-example): For a supersingular π (a\_p = 0) the ordinary-projected Klingen family vanishes, while E^{Kling}\_φ does not.

**Prerequisites.** `AutomorphicCongruences:L2s/semi-ordinary-hida-theory`, `AutomorphicPadicLFunctions:L4e/klingen-family`, `AutomorphicPadicLFunctions:L4e/ew-siegel-eisenstein-measure`, `AutomorphicPadicLFunctions:L4e/ew-pullback-and-local-computations`, `AutomorphicPadicLFunctions:L4e/constant-term-divisibility`, `AutomorphicPadicLFunctions:L4/doubling-global-identity`, `AutomorphicPadicLFunctions:L4/local-zeta-at-p`, `AutomorphicPadicLFunctions:L3h/hsieh-hecke-nonvanishing`, `AutomorphicPadicLFunctions:L3h/theorem-c`.

**Sources.**

- CLW-v1, §5.2–5.4, p. 31; Thm 5.5.1, p. 34; Prop. 5.6.1 and §5.6, pp. 35–36; Thm 5.9.1, p. 42; Prop. 5.10.1, p. 44: Set-up, doubling formula, auxiliary choices, the p-adic Siegel measure and the semi-ordinary Klingen family.
- CLW-v1, §6.1, (6.1.1)–(6.1.2) and Thm 6.1.1, p. 46: Divisibility of the degenerate Fourier–Jacobi coefficients by L\_{ξ,ℚ}·L\_{π,K,ξ}.

### A Fourier–Jacobi coefficient of the semi-ordinary Klingen family is a unit

`AutomorphicCongruences:L2s/fourier-jacobi-primitivity` (theorem).

**Statement.** With E^{Kling}\_φ as in L2s/semi-ordinary-klingen-family and the auxiliary data of CLW §§5.6, 7.7 (a CM family h, the theta functions θ, θ\_3, and operators T\_ns, T′\_ns at the nonsplit places), the functional obtained by taking the β = 1 Fourier–Jacobi coefficient, pairing with an explicit theta function on the Jacobi group of U(2) and then with h, sends E^{Kling}\_φ to an element of Ô^{ur}\_L\[\[Γ\_K]] that is a unit times a nonzero constant (CLW §7, Props 7.4.2, 7.6.1, 7.7.1, 7.9.1, 7.11.1–7.11.3, 7.12.1). The proof expresses the value through Ichino's triple product formula as a product of p-adic L-functions L\_1,…,L\_6 of auxiliary CM forms and Rallis inner products, each a unit or a fixed nonzero constant by the choice of auxiliary characters and Hsieh's mod-p nonvanishing and µ = 0 theorems.

**Hypotheses.**

- Auxiliary characters chosen as in CLW §5.6 so that the relevant anticyclotomic Hecke L-values are nonzero modulo p (Hsieh 2012, 2014).
- Ichino's triple product formula for definite U(2) / D^× and the local triple product integrals at nonsplit places are inputs (requested from AutomorphicLFunctionsAndLocalFactors:AL.3; gap 'ichino-triple-product').

**Proof outline.**

1. The β-th Fourier–Jacobi coefficient of the Siegel Eisenstein series on GU(3,3) is a finite sum of products of Siegel Eisenstein series on U(2,2) and theta functions on the unitary Jacobi group (CLW Prop. 7.4.2; the Jacobi group and Fourier–Jacobi periods are MetaplecticAutomorphicForms:MP.6's).
2. Restrict to (N·U(2)) × U(2), pair with θ⋆ and then with h via the doubling formula; the result is a triple product integral ∫ h θ f (Props 7.6.1, 7.7.1).
3. Ichino's formula and the Rallis inner product formula (Prop. 7.9.1) evaluate it as a product of L-values; local integrals at nonsplit places are nonzero by Prop. 7.12.1; interpolation of each factor (Props 7.11.1–7.11.3) gives the unit statement.

**Checks.**

- The coefficient is a unit, so no height-one prime of Ô^{ur}\_L\[\[Γ\_K]] contains it; this is what makes the Eisenstein congruence measured by L\_{π,K,ξ}L\_{ξ,ℚ}.

**Prerequisites.** `AutomorphicCongruences:L2s/semi-ordinary-klingen-family`, `MetaplecticAutomorphicForms:MP.6/unitary-jacobi-group`, `MetaplecticAutomorphicForms:MP.6/fourier-jacobi-period`, `MetaplecticAutomorphicForms:MP.6/rallis-inner-product`, `MetaplecticAutomorphicForms:MP.6/theta-integral-factorization`, `AutomorphicPadicLFunctions:L3h/hsieh-hecke-nonvanishing`, `AutomorphicPadicLFunctions:L3h/theorem-b`, `AutomorphicPadicLFunctions:L3/katz-padic-l-function`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Sources.**

- CLW-v1, §7: Prop. 7.4.2 p. 57, Prop. 7.6.1 p. 61, Prop. 7.7.1 p. 64, Prop. 7.9.1 p. 67, Props 7.11.1–7.11.3 pp. 68–73, Prop. 7.12.1 p. 73: The Fourier–Jacobi computation: Jacobi-group expansion, CM family, Rallis inner products, triple product integrals at nonsplit places.
- WAN-RS, introduction, steps (1)–(5), pp. 5–6: The five-step pattern: Fourier–Jacobi coefficient of the Siegel series, restriction, pairing with θ⋆ and h, interpolation, Ichino's formula.

### The CLW Eisenstein ideal is bounded by the p-adic L-functions

`AutomorphicCongruences:L2s/clw-eisenstein-congruence` (theorem).

**Statement.** Let ϕ be as in CLW Prop. 7.11.2 and E\_{π,ξ} ⊆ Ô^{ur}\_L\[\[Γ\_K]] the Eisenstein ideal (L0/eisenstein-ideal) of the semi-ordinary cuspidal Hecke algebra 𝕋^0\_{so,ξ,Γ\_K} for the eigensystem of E^{Kling}\_ϕ. For every height-one prime P of Ô^{ur}\_L\[\[Γ\_K]] with P ∩ Ô^{ur}\_L = 0, ord\_P(L^{Σ∪{ℓ,ℓ′}}\_{π,K,ξ}·L^{Σ∪{ℓ,ℓ′}}\_{ξ,ℚ}) ≤ ord\_P(E\_{π,ξ}) (CLW Thm 8.1.1).

**Hypotheses.**

- P not containing p (P ∩ Ô^{ur}\_L = 0).

**Proof outline.**

1. By L2s/semi-ordinary-hida-theory the fundamental exact sequence lets one lift the boundary values of E^{Kling}\_ϕ divided by L\_{π,K,ξ}L\_{ξ,ℚ} modulo P^r to a Λ-adic family.
2. Subtracting gives a family whose image modulo P^r is cuspidal; it is nonzero because the Fourier–Jacobi coefficient of L2s/fourier-jacobi-primitivity is a unit.
3. Hence the Hecke eigensystem of E^{Kling} is congruent modulo P^r to a cuspidal one, i.e. 𝕋^0/I surjects onto Λ/(E\_{π,ξ}, P^r) with r = ord\_P(L·L).

**Checks.**

- The bound is height-one prime by height-one prime and excludes P ∋ p; it is one-sided.

**Prerequisites.** `AutomorphicCongruences:L2s/semi-ordinary-hida-theory`, `AutomorphicCongruences:L2s/semi-ordinary-klingen-family`, `AutomorphicCongruences:L2s/fourier-jacobi-primitivity`, `AutomorphicCongruences:L0/eisenstein-ideal`.

**Sources.**

- CLW-v1, Thm 8.1.1 and proof, p. 77: The congruence between the semi-ordinary Klingen family and cusp forms, measured by L\_{π,K,ξ}L\_{ξ,ℚ}.

### Irreducibility of the GU(3,1) pseudo-character: excluding CAP components

`AutomorphicCongruences:L2s/cap-exclusion` (theorem).

**Statement.** Let 𝕋 be the semi-ordinary (or ordinary) cuspidal Hecke algebra of GU(3,1) localized at the Eisenstein maximal ideal, T: G\_K → 𝕋 its four-dimensional pseudo-character (built as in L1/gu22-galois-pseudocharacter from the Galois representations of cuspidal representations of U(3,1)), and suppose ρ̄\_π|\_{G\_K} is irreducible. Then for every Frac(A)-algebra map λ: 𝕋 ⊗ Frac(A) → K′, the representation σ\_λ is absolutely irreducible or contains an absolutely irreducible two-dimensional subrepresentation whose trace is ≡ χ + χ^{-c} modulo I — Wan20's property (9) (CLW proof of Thm 8.2.1). If instead T = δ\_1 + δ\_2 + δ\_3 with δ\_3 two-dimensional and residually tr ρ̄\_π, then at an arithmetic point x of weight (0,0,t^+;t^-) with 0 ≫ t^+ ≫ −t^-, a twist of the specialization of δ\_3 descends to a G\_ℚ-representation ρ′\_{3,x} which is modular (ordinary case: as in SU Thm 7.3.1; non-ordinary case: ρ\_Π|\_{G\_{K,p}} is crystalline by a Jacquet-module argument and the semi-ordinary slopes, and Kisin's theorem applies; in general weight FW uses Pan's theorem), so Π is CAP, which Harris's Thm 2.5.6 excludes in these weights.

**Hypotheses.**

- ρ̄\_π|\_{G\_K} irreducible; arithmetic points in the absolutely convergent range of sufficiently regular weight.
- The unitary forms and Hecke operators are the AutomorphicPadicLFunctions:L4 carriers; the semi-ordinary projector is L2s's own, since L4 plans only the ordinary one.
- Harris (1984) Thm 2.5.6 (no holomorphic CAP forms of these weights on U(3,1)) is an input not planned in the atlas (gap 'harris-cap').

**Proof outline.**

1. Suppose the pseudo-character is a sum δ\_1 + δ\_2 + δ\_3; residual irreducibility of ρ̄\_π gives a two-dimensional 𝕋-valued representation for δ\_3.
2. Ordinary π: the specialization of δ\_3 at x is ordinary and modular by the SU argument.
3. Non-ordinary π: Edixhoven makes ρ̄\_π|\_{G\_{ℚ\_p}} irreducible; Jacquet modules show Π\_p is an unramified principal series (the semi-ordinary valuations (8.2.4)–(8.2.5) force distinct ratios ≠ p^{±1}), so ρ\_Π|\_{G\_{K,p}} and ρ′\_{3,x} are crystalline; ρ̄′\_{3,x} is not induced from ℚ(√p\*), so Kisin's modularity lifting applies (FW: Pan's Fontaine–Mazur theorem for de Rham ρ with ρ̄|\_{G\_{ℚ\_p}} absolutely irreducible).
4. Modularity of ρ′\_{3,x} makes Π CAP (Klingen type), contradicting Harris Thm 2.5.6 for the chosen weights.

**Checks.**

- Shared by L2s/clw-main-divisibility and L2/fw-greenberg-divisibility; the RT-AREA-iwasawa-1/6 addendum asks exactly for these GL₂ modularity and Harris inputs.

**Prerequisites.** `AutomorphicCongruences:L1/gu22-galois-pseudocharacter`, `AutomorphicGaloisRepresentationsPartII:AG2.2/discrete-unitary-galois-assembly`, `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`, `GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur`, `GL2ModularityLifting:R32.2/odd-prime-de-rham-lifting`.

**Sources.**

- CLW-v1, proof of Thm 8.2.1, property (9), pp. 79–80: The CAP-exclusion argument in the ordinary case (SU Thm 7.5, Harris Thm 2.5.6) and the non-ordinary case (Jacquet modules, crystallinity, Kisin).
- FW-v3, proof of Thm 7.32, p. 97: The same argument in general weight, with modularity from Pan's Thm 1.0.4.

### The Castella–Liu–Wan divisibility over the cyclotomic-localized ring

`AutomorphicCongruences:L2s/clw-main-divisibility` (theorem). Planet: Castella–Liu–Wan divisibility.

**Statement.** Let K be imaginary quadratic, p ≥ 3 split in K, and π, ξ as in CLW §5.2. Let Γ^+\_K ⊂ Γ\_K be the rank-one ℤ\_p-submodule on which complex conjugation acts by +1 and R := O^{ur}\_L\[\[Γ\_K]] ⊗\_{O\_L\[\[Γ^+\_K]]} Frac(O\_L\[\[Γ^+\_K]]), the localization inverting every nonzero element of the cyclotomic coefficient subring O\_L\[\[Γ^+\_K]]. Then, as fractional ideals of R, (L\_{π,K,ξ}) ⊇ char\_R(X\_{π,K,ξ} ⊗\_{O\_L\[\[Γ^+\_K]]} R), where X\_{π,K,ξ} is the dual of the Selmer group of T\_{π,K,ξ} = T\_π(ε^2\_{cyc})|\_{G\_K}(ξ^{-1}) ⊗ ℤ\_p\[\[Γ\_K]](Ψ^{-1}\_K) with relaxed condition at one prime above p and unramified condition at the other (CLW Thm 8.2.1(1)). The localization is in the cyclotomic subring; it is not the inversion of p.

**Hypotheses.**

- CLW §5.2; the excluded height-one primes are exactly those with P ∩ O\_L\[\[Γ^+\_K]] ≠ 0 (pulled back from the cyclotomic line) — in particular primes where (X\_{ξ∘Nm} ⊗ ℚ)\_P ≠ 0 may be among them.
- If X\_{π,K,ξ} is not torsion its characteristic ideal is 0 and the statement is empty.

**Proof outline.**

1. Reduce to the Σ ∪ {ℓ,ℓ′}-primitive inclusion (L0/primitive-imprimitive-comparison; JSW Thm 6.1.6 and Greenberg–Vatsal Prop. 2.4).
2. For P with P ∩ O^{ur}\_L\[\[Γ^+\_K]] = 0, the inequality ord\_P(L) ≤ length(X\_P) follows from ord\_P(E\_{π,ξ}) ≤ length(X\_P) by L2s/clw-eisenstein-congruence (L\_{ξ,ℚ} lives in the cyclotomic variable, hence is a unit at P).
3. Set up the lattice datum (1)–(5) with ν trivial, χ = ξΨ\_K, ρ from ρ\_π, σ the pseudo-representation of the semi-ordinary Hecke algebra, I = E\_{π,ξ}A\_P; check (6)–(8) as in Wan20 and (9) by L2s/cap-exclusion; apply L0/lattice-construction (Wan20 Prop. 9.2) where ord\_P(E\_{π,ξ}) > 0 and (X\_{ξ∘Nm} ⊗ ℚ)\_P = 0.

**Checks.**

- The statement is one-sided and localized; neither torsion of X nor equality is proved here.
- Height-one primes pulled back from O\_L\[\[Γ^+\_K]] are not controlled: CLW cannot prove the analogue of Wan20 Lemma 9.3 with π fixed.

**Prerequisites.** `AutomorphicCongruences:L2s/clw-eisenstein-congruence`, `AutomorphicCongruences:L2s/cap-exclusion`, `AutomorphicCongruences:L0/lattice-construction`, `AutomorphicCongruences:L0/su-lattice-datum`, `AutomorphicCongruences:L0/sigma-primitive-selmer`, `AutomorphicCongruences:L0/primitive-imprimitive-comparison`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`.

**Sources.**

- CLW-v1, Thm 8.2.1(1), p. 78; proof pp. 79–81: The divisibility over R and its proof by the lattice construction, with the explicit exclusion of cyclotomic height-one primes.
- CLW-v1, (1.0.1)–(1.0.2), p. 3: The Selmer group with relaxed condition at p and unramified condition at p̄.

### Integrality of the CLW p-adic L-function and the p-inverted divisibility

`AutomorphicCongruences:L2s/clw-integrality-and-p-inverted` (theorem).

**Statement.** In the setting of L2s/clw-main-divisibility: (a) if ξ\_p ≢ ξ\_p̄ modulo the maximal ideal of O\_L, then L\_{π,K,ξ} ∈ O^{ur}\_L\[\[Γ\_K]]; (b) if moreover ξ|\_{𝔸\_ℚ^×} = ω² (ω the Teichmüller character) with k\_0 ≡ 0 mod 2(p − 1), the local base-change root number ε\_v(1/2, BC(π) × ξ\_0) equals 1 at every finite place v nonsplit in K, and the conductor of ξ is divisible only by primes split in K, then (L\_{π,K,ξ}) ⊇ char\_{O^{ur}\_L\[\[Γ\_K]] ⊗ ℚ}(X\_{π,K,ξ} ⊗ ℚ) (CLW Thm 8.2.1(2)): the containment holds after inverting p, without the cyclotomic localization. This is the source-qualified input that RankZeroOneBSD:BSD.6a imports for its supersingular branch; it is not a nonordinary equality.

**Hypotheses.**

- (a) needs residual distinctness ξ\_p ≢ ξ\_p̄, which gives (irred) and (dist) for the CM form σ\_ξ.
- (b) adds the four listed conditions; the containment is only after ⊗ ℚ.

**Proof outline.**

1. (a): as in Wan20 §7E, build L^{Hida}\_{π,K,ξ} as the product of Hida's Rankin–Selberg p-adic L-function for the ordinary CM family g through σ\_ξ and the newform f, and Katz's p-adic L-function on the line interpolating values at 1; only the ordinarity of g is used.
2. Hida–Tilouine (Thm 7.1, (8.8b)) and Hida's Lemma 5.3(vi) (Petersson norm against the adjoint L-value) show L^{Hida} and L\_{π,K,ξ} agree on a dense set of weights, so they are equal; the anticyclotomic main conjecture for CM fields (L0/hida-tilouine-anticyclotomic) under (irred) and (dist) gives integrality of L^{Hida}.
3. (b): Hsieh's vanishing of the anticyclotomic µ-invariant shows L\_{π,K,ξ} lies in no height-one prime pulled back from O\_L\[\[Γ^+\_K]] other than possibly (p), so combining with L2s/clw-main-divisibility the excluded primes contribute nothing after inverting p.

**Checks.**

- RT-AREA-iwasawa-1/25: the µ = 0 input is AutomorphicPadicLFunctions:L3h's Theorem B; RT-AREA-iwasawa-1/26: the integrality rests on Hida's Rankin–Selberg family p-adic L-function and the Hida–Tilouine main conjecture, both recorded with their owners.

**Prerequisites.** `AutomorphicCongruences:L2s/clw-main-divisibility`, `AutomorphicCongruences:L0/hida-tilouine-anticyclotomic`, `AutomorphicPadicLFunctions:L3h/theorem-b`, `AutomorphicPadicLFunctions:L3h/theorem-a`, `AutomorphicPadicLFunctions:L3/katz-padic-l-function`, `AutomorphicPadicLFunctions:L3/katz-hida-tilouine-tame`, `AutomorphicPadicLFunctions:L3`.

**Sources.**

- CLW-v1, Thm 8.2.1(2), p. 78; proof of (2), p. 81: Integrality via L^{Hida}, Hida–Tilouine and Hida's anticyclotomic main conjecture, and the second containment from Hsieh's µ = 0.
- WAN-RS, Thm 1.1, pp. 2–3: Wan's three-variable theorem under conditions (a)–(g), with L^{Hida} integral when g\_ξ satisfies (dist) and (irred).

### Dependencies of layer L2s

Inside this roadmap and on other roadmaps (node and stage ids): `AutomorphicBundles:B5/fj-injectivity`, `AutomorphicBundles:B5/global-fj-expansion`, `AutomorphicCongruences:L0/eisenstein-ideal`, `AutomorphicCongruences:L0/hida-tilouine-anticyclotomic`, `AutomorphicCongruences:L0/lattice-construction`, `AutomorphicCongruences:L0/primitive-imprimitive-comparison`, `AutomorphicCongruences:L0/sigma-primitive-selmer`, `AutomorphicCongruences:L0/su-lattice-datum`, `AutomorphicCongruences:L1/gu22-galois-pseudocharacter`, `AutomorphicGaloisRepresentationsPartII:AG2.2/discrete-unitary-galois-assembly`, `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicPadicLFunctions:L3`, `AutomorphicPadicLFunctions:L3/katz-hida-tilouine-tame`, `AutomorphicPadicLFunctions:L3/katz-padic-l-function`, `AutomorphicPadicLFunctions:L3h/hsieh-hecke-nonvanishing`, `AutomorphicPadicLFunctions:L3h/theorem-a`, `AutomorphicPadicLFunctions:L3h/theorem-b`, `AutomorphicPadicLFunctions:L3h/theorem-c`, `AutomorphicPadicLFunctions:L4/doubling-global-identity`, `AutomorphicPadicLFunctions:L4/ehls-ordinary-forms-hecke`, `AutomorphicPadicLFunctions:L4/ehls-unitary-datum`, `AutomorphicPadicLFunctions:L4/local-zeta-at-p`, `AutomorphicPadicLFunctions:L4e/constant-term-divisibility`, `AutomorphicPadicLFunctions:L4e/ew-pullback-and-local-computations`, `AutomorphicPadicLFunctions:L4e/ew-siegel-eisenstein-measure`, `AutomorphicPadicLFunctions:L4e/klingen-family`, `GL2ModularityLifting:R32.2/odd-prime-de-rham-lifting`, `GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur`, `MetaplecticAutomorphicForms:MP.6/fourier-jacobi-period`, `MetaplecticAutomorphicForms:MP.6/rallis-inner-product`, `MetaplecticAutomorphicForms:MP.6/theta-integral-factorization`, `MetaplecticAutomorphicForms:MP.6/unitary-jacobi-group`, `PadicFamilies:L0a/locally-finite-action`, `PadicFamilies:L0a/locally-finite-ordinary-projector`, `PadicFamilies:L0a/ordinary-part-complexes`, `PadicFamilies:L0a/profinite-ordinary-projector`, `PadicFamilies:L0a/profinite-projector-exact`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`.

### Acceptance for layer L2s

Coverage: **planned**. Theorem 8.2.1 is one-sided: (1) after localizing the cyclotomic coefficient subring, (2) integrality under ξ\_p ≢ ξ\_p̄ and the p-inverted containment under the four extra conditions. L3h is a prerequisite (RT-AREA-iwasawa-1/25); the integrality inputs are recorded (RT-AREA-iwasawa-1/26).

- Refinement: Decompose CLW §§5–7 (local sections, Siegel measure, Fourier–Jacobi computation) into lemma nodes.
- Refinement: Obtain an owner for Hida's Rankin–Selberg p-adic L-function of a CM Hida family (requested from AutomorphicPadicLFunctions:L3).

## Layer L2: The distinct Fouquet–Wan automorphic input

Fouquet and Wan extend the CLW argument to general even weight (their Appendix B, Theorem 7.32) and use it, with Kings–Loeffler–Zerbes Beilinson–Flach classes and the Castella–Wan equivalence, to prove Kato's main conjecture at crystalline short points (Theorem 4.51) and the ordinary reverse divisibility (Theorem 1.6, by the route of §4.8). Wan's ordinary GU(3,1) Rankin–Selberg theorem, consumed by RankOneConverse, is planned here as well. Yager modules are GeneralizedHeegnerCycles GH.7's; Jacobi groups are MetaplecticAutomorphicForms MP.6's.

### Semi-ordinary Hida theory on GU(3,1) in general weight

`AutomorphicCongruences:L2/general-weight-semi-ordinary-control` (theorem).

**Statement.** For f a normalized cuspidal eigenform of even weight k ≥ 2 and the vector-valued semi-ordinary forms on GU(3,1) of weight k = (a\_1, a\_2, a\_3; b\_1) in the family set X\_ρ of Fouquet–Wan: the semi-ordinary parts e\_α·V\_k(K\_0(p,p^n)) are p-divisible with uniformly bounded classical dimensions (Props 7.9–7.10); for each weight k = (a\_1, a\_2, a\_3; b\_1) ∈ X\_ρ there is A(a) such that, for b\_1 large compared with A(a), the restriction e\_α M\_k(K\_0(p), O) ⊗ ℚ\_p/ℤ\_p → e\_α·V\_k(K\_0(p)) is an isomorphism (FW Thm 7.11); for q = 0 or ∅ the Λ̃-adic families V^q\_so are free of finite rank and M^q\_so(K, Λ̃) ⊗ Λ̃/P\_k ≅ e\_α M^q\_k(K, O) at such weights (Thm 7.12), with Thm 7.15 and the weight-k boundary sequence of Thm 7.17; and the short sequence of cusp forms, forms and boundary forms is exact (Thm 7.18). These extend L2s/semi-ordinary-hida-theory (CLW, weight two) to general weight and are the only new Hida-theoretic input L2 owns.

**Hypotheses.**

- Weights in FW's set X\_ρ; level K\_0(p, p^n); the unitary Shimura data and Igusa varieties as in FW §7.3.1–7.3.3, imported from AutomorphicPadicLFunctions:L4.

**Proof outline.**

1. Vertical control for the vector-valued sheaves (FW Props 7.5, 7.7–7.10) following CLW §§3–4.
2. Uniform boundedness of dimensions and classicality (Thm 7.11, Prop. 7.13).
3. Freeness and the boundary exact sequence (Thms 7.12, 7.15, 7.17, 7.18), with the Siegel operators of L2s.

**Checks.**

- RT-AREA-iwasawa-1/24: L2 imports CLW's weight-two semi-ordinary Hida theory from L2s and adds only FW §7.3's general-weight control.

**Prerequisites.** `AutomorphicCongruences:L2s/semi-ordinary-hida-theory`, `AutomorphicCongruences:L2s/semi-ordinary-weight-space`, `AutomorphicPadicLFunctions:L4/ehls-ordinary-forms-hecke`, `PadicFamilies:L0a/profinite-projector-exact`.

**Sources.**

- FW-v3, §7.3.4–7.3.5: Props 7.5, 7.7–7.10, Thms 7.11, 7.12, Prop. 7.13, Thms 7.15, 7.17, 7.18, pp. 83–88: Semi-ordinary forms and control theorems on GU(3,1) for general weight.
- FW-v3, §7.1, p. 80: The Hida theory of CLW §§2–4 (with its fundamental exact sequence) is the input; §7.3 develops what is needed in general weight.

### The vector-valued Klingen Eisenstein family and the Greenberg p-adic L-function

`AutomorphicCongruences:L2/vector-valued-klingen-family` (theorem).

**Statement.** Let π = π\_f be the unitary automorphic representation of a weight-k form f and Σ a finite set containing the bad primes. (i) There is L^Σ\_{f,K,ξ\_0} ∈ Λ\_{K,O^{ur}} ⊗ ℚ\_p interpolating, at characters ξ\_φ of Γ\_K that are avatars of Hecke characters of conductor p and infinity type (κ\_φ/2 + m\_φ, −κ\_φ/2 − m\_φ) with κ\_φ ≥ 6 even and m\_φ ≥ (k−2)/2, the values L^Σ(π̃, ξ\_φ, (κ\_φ − 1)/2) times the stated periods and local factors (FW Prop. 7.19(i), from Eischen–Wan Thm 1.2); (ii) there is a family of formal q-expansions E\_{f,ξ\_0} whose specializations at a Zariski-dense set of arithmetic points are the Fourier–Jacobi expansions of the highest weight vectors of the holomorphic vector-valued Klingen Eisenstein series on GU(3,1) built by the pullback formula, eigen for U\_{t+} with nonzero eigenvalue (Prop. 7.19(ii)); (iii) the constant terms a\_{t,\[g]}(0) are divisible by L^Σ\_{f,K,ξ\_0}·L^Σ\_{τ̄′} (Prop. 7.19(iii)). After the reparametrization t^{-c}\_{ξ′\_0}, L^{Gr,Σ}\_{f,K} := t^{-c}\_{ξ′\_0}(L\_{f,K,ξ\_0}) is the Greenberg Rankin–Selberg p-adic L-function, it equals L^{Hida}\_{f⊗g}·L^{Katz}\_K·h\_K (FW Cor. 7.21, L2/greenberg-function-factorization) and lies in O^{ur}\[\[Γ\_K]] (FW Lemma 7.22).

**Hypotheses.**

- Eischen–Wan's distinct-Satake-parameter assumption is unnecessary in the U(2) case (FW remark after Prop. 7.19).
- The Klingen family of Eischen–Wan (AutomorphicPadicLFunctions:L4e) is the analytic carrier; FW's reparametrization, the Ikeda-type archimedean factorization and the integrality are owned here.

**Proof outline.**

1. Translate Eischen–Wan Thm 1.2 to the semi-ordinary GU(3,1) setting with the shared local data of L2s/semi-ordinary-klingen-family (FW Prop. 7.19).
2. Reparametrize by t^{-c}\_{ξ′\_0} (γ′ ↦ γ′ξ′\_0(γ′)^{-1}, then γ′ ↦ γ′^{-c}).
3. Integrality (Lemma 7.22): the denominators are powers of p times finitely many Euler factors, while Wan's argument bounds them by powers of the CM-family variable; the two sets are disjoint, so the denominator is a unit.

**Checks.**

- Only the vector-valued, general-weight construction is new here; the weight-two scalar family is L2s's.

**Prerequisites.** `AutomorphicCongruences:L2s/semi-ordinary-klingen-family`, `AutomorphicCongruences:L2/general-weight-semi-ordinary-control`, `AutomorphicPadicLFunctions:L4e/klingen-family`, `AutomorphicPadicLFunctions:L4e/ew-padic-l-function`, `AutomorphicPadicLFunctions:L4e/constant-term-divisibility`, `AutomorphicPadicLFunctions:L4/archimedean-zeta-integral`.

**Sources.**

- FW-v3, Prop. 7.19 and the reparametrization after it, p. 88; Cor. 7.21 and Lemma 7.22, p. 89: The Klingen family on U(3,1), its constant terms divisible by the Rankin–Selberg and Dirichlet p-adic L-functions, the factorization and the integrality.

### Factorization of the Greenberg function into Hida and Katz factors

`AutomorphicCongruences:L2/greenberg-function-factorization` (comparison).

**Statement.** With the normalizations of FW §4.5.2 and Appendix B, the Greenberg Rankin–Selberg p-adic L-function of f over K factors as L^{Gr}\_K(f) = L^{Hida}\_{f⊗g}·L^{Katz}\_K·h\_K, where L^{Hida}\_{f⊗g} is Hida's Rankin–Selberg p-adic L-function of f against the canonical CM Hida family g, L^{Katz}\_K is Katz's p-adic L-function of K restricted to the relevant line and h\_K the class number factor (FW Cor. 7.21, with Prop. 4.35 for the Katz normalization). The factorization is an identity in Frac(O^{ur}\[\[Γ\_K]]) obtained by comparing interpolation formulas on a Zariski-dense set; it carries the class-number, period and local factors explicitly and is not routed to L5a.

**Hypotheses.**

- Interpolation formulas of FW Prop. 7.19 and Prop. 4.35 on both sides; the set of comparison points is Zariski dense.

**Proof outline.**

1. Compare interpolation formulas at the arithmetic points of Prop. 7.19 using the doubling interpolation on one side and Hida's Rankin–Selberg plus Katz's interpolation on the other (FW Lemma before Cor. 7.21).
2. Density of the comparison points and the Weierstrass preparation in O^{ur}\[\[Γ\_K]] give the identity.

**Checks.**

- Requested by RankZeroOneBSD:BSD.6a (castella-higher-weight-input) together with FW Thm 4.41; the erratum's citation of a corollary in another paper does not apply.

**Prerequisites.** `AutomorphicCongruences:L2/vector-valued-klingen-family`, `AutomorphicPadicLFunctions:L3/katz-padic-l-function`, `AutomorphicPadicLFunctions:L3`.

**Sources.**

- FW-v3, Cor. 7.21 and the lemma before it, p. 89; Prop. 4.35, p. 57: L^{Hida}\_{f⊗g}·L^{Katz}\_K h\_K = L^{Gr}\_K(f), from the interpolation formulas.

### The Fouquet–Wan Fourier–Jacobi coefficient and the Eisenstein ideal bound

`AutomorphicCongruences:L2/fw-fourier-jacobi-unit` (theorem).

**Statement.** For the Klingen family E^{Kling} of L2/vector-valued-klingen-family and the functional FJ\_{h,β,θ⋆}(E) = ⟨e^{ord} l\_{θ⋆}(FJ\_β(E)), h⟩, the value FJ\_{h,β,θ⋆}(E^{Kling}) is the product of an element of O^{ur}\[\[Γ\_K]]^× and an element of ℚ̄\_p^× (FW Prop. 7.29). Consequently, for the Eisenstein ideal E\_D of the reduced semi-ordinary cuspidal Hecke algebra 𝕋\_D (FW Def. 7.30, L0/eisenstein-ideal) and every height-one prime P ≠ (p) of O^{ur}\[\[Γ\_K]], ord\_P(L^{Gr,Σ}\_{f,K}) ≤ ord\_P(E\_D) (FW Lemma 7.31).

**Hypotheses.**

- Ichino's triple product formula and the local triple product integrals (requested from AutomorphicLFunctionsAndLocalFactors:AL.3), Ikeda's description of Fourier–Jacobi coefficients of nearly holomorphic Siegel Eisenstein series (FW Lemma 7.26), and Hsieh's nonvanishing for the auxiliary L-values L\_1, L\_5, L\_6 being units and L\_2 a fixed constant.
- When π\_ℓ is supercuspidal the local computation of FW Prop. 7.27 / Cor. 7.28 is used, which removes the squarefree-conductor assumption of earlier work.

**Proof outline.**

1. Express the Fourier–Jacobi coefficient of the Siegel series as finite sums of products of Eisenstein series and theta functions on the Jacobi group containing U(2,2) (FW Lemma 7.26, after Ikeda); factor out the archimedean integrals by a conceptual argument instead of computing them (FW §1.2.1 outline).
2. Ichino's formula evaluates the resulting triple product as L\_3L\_4 times Rallis inner products (interpolated by L\_3, L\_4) and local integrals; the ratio to L\_1L\_2L\_5L\_6 is a fixed nonzero constant (FW Prop. 7.29).
3. Lemma 7.31 follows as in Wan20 Lemma 9.1, with Prop. 7.29 and Thm 7.18 in place of the weight-two inputs.

**Checks.**

- Scalar versus vector-valued: the vector-valued computation is FW's addition over L2s/fourier-jacobi-primitivity.

**Prerequisites.** `AutomorphicCongruences:L2/vector-valued-klingen-family`, `AutomorphicCongruences:L2/general-weight-semi-ordinary-control`, `AutomorphicCongruences:L2s/fourier-jacobi-primitivity`, `AutomorphicCongruences:L0/eisenstein-ideal`, `MetaplecticAutomorphicForms:MP.6/fourier-jacobi-period`, `MetaplecticAutomorphicForms:MP.6/fourier-jacobi-extraction`, `MetaplecticAutomorphicForms:MP.6/rallis-inner-product`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicPadicLFunctions:L3h/hsieh-hecke-nonvanishing`.

**Sources.**

- FW-v3, §7.4.2, Props 7.27, Cor. 7.28, Prop. 7.29, Def. 7.30, Lemma 7.31, pp. 90–96: The Fourier–Jacobi functional is a unit up to a constant, and the resulting bound of the Eisenstein ideal by L^{Gr}.
- FW-v3, §1.2.1, p. 11: Ikeda's theory and Ichino's triple product formula give a Fourier–Jacobi coefficient prime to the p-adic L-function.

### Fouquet–Wan's GU(3,1) divisibility for the Greenberg main conjecture

`AutomorphicCongruences:L2/fw-greenberg-divisibility` (theorem). Planet: Fouquet–Wan GU(3,1) divisibility.

**Statement.** Let f be a normalized cuspidal eigenform of even weight k, trivial character and conductor N prime to p, such that either ρ̄\_f|\_{G\_{ℚ\_p}} is absolutely irreducible or f is ordinary at p; suppose every prime q | N nonsplit in K satisfies q ∥ N and there is at least one such q, that 2 ∥ N if 2 is nonsplit in K, and that ρ̄\_f is absolutely irreducible over G\_K. Then char\_{O^{ur}\[\[Γ\_K]]}(X^{Gr}\_K(f) ⊗\_O O^{ur}) ⊆ (L^{Gr}\_K(f)) up to height-one primes pulled back from O\[\[Γ^+]]; if moreover every ℓ | N nonsplit in K is ramified in K with π\_ℓ the Steinberg representation twisted by the unramified character sending ℓ to (−1)^{ℓ^{k/2−1}}, the whole containment holds (FW Thm 7.32 = Thm 4.41 = Thm 1.12). Here X^{Gr}\_K(f) is the dual of the Greenberg Rankin–Selberg Selmer group (FW Def. 4.39: Greenberg condition at v\_0, strict at v̄\_0, unramified-quotient conditions away from p).

**Hypotheses.**

- As stated; ρ\_f|\_{G\_{ℚ\_p}} crystalline in Thm 4.41's form.
- The first containment excludes height-one primes pulled back from O\[\[Γ^+]]; the second needs the Steinberg-twist hypothesis to invoke the anticyclotomic µ = 0 theorem.

**Proof outline.**

1. Σ-primitive version first: lattice construction (Wan20 Prop. 9.2; L0/lattice-construction) shows that E\_D contains the characteristic ideal of the dual Selmer group, with Wan20's condition (9) by L2s/cap-exclusion (modularity from Pan's theorem in general weight).
2. Lemma 7.31 (L2/fw-fourier-jacobi-unit) bounds ord\_P(L^{Gr,Σ}) ≤ ord\_P(E\_D) for P ≠ (p).
3. Put back the Euler factors at Σ (Greenberg–Vatsal Prop. 2.4; K\_∞ contains the cyclotomic ℤ\_p-extension; L0/primitive-imprimitive-comparison).
4. Under the Steinberg hypothesis apply Hsieh's anticyclotomic µ = 0 to see that L^{Gr}\_K(f) lies in no height-one prime of O\[\[Γ^+]], hence is prime to the Dirichlet factor in the constant terms (L2/exceptional-height-one-primes).

**Checks.**

- One-sided; RT-AREA-iwasawa-1/24 is answered by importing CLW's weight-two Hida theory and the lattice argument from L2s and L0.

**Prerequisites.** `AutomorphicCongruences:L2/fw-fourier-jacobi-unit`, `AutomorphicCongruences:L2s/cap-exclusion`, `AutomorphicCongruences:L2s/clw-main-divisibility`, `AutomorphicCongruences:L0/lattice-construction`, `AutomorphicCongruences:L0/primitive-imprimitive-comparison`, `AutomorphicCongruences:L2/exceptional-height-one-primes`, `AutomorphicCongruences:L1/gu22-galois-pseudocharacter`, `SelmerIwasawaCohomology:L2/greenberg-condition`.

**Sources.**

- FW-v3, Thm 7.32 and proof, pp. 96–97; Thm 4.41 and Def. 4.39, pp. 58–59; Thm 1.12, pp. 10–11: The GU(3,1) divisibility with and without the Steinberg-twist hypothesis, and its proof by the lattice construction, CAP exclusion, Euler factors and µ = 0.

### Removing the excluded height-one primes

`AutomorphicCongruences:L2/exceptional-height-one-primes` (theorem).

**Statement.** Let L ∈ O^{ur}\[\[Γ\_K]] be L^{Gr}\_K(f) (or Wan's L\_{f,K,ξ}). If the anticyclotomic restriction of L has vanishing µ-invariant — which holds when every prime ℓ | N nonsplit in K is ramified in K with π\_ℓ the appropriately twisted Steinberg representation and the residual and conductor hypotheses of Hsieh's Theorem B are met — then L lies in no height-one prime of O^{ur}\[\[Γ\_K]] of the form Q·O^{ur}\[\[Γ\_K]] with Q a height-one prime of O\[\[Γ^+]]; hence it is prime to the cyclotomic Dirichlet factor L^Σ\_{τ̄′} of the constant terms, and a divisibility proved up to pulled-back primes holds integrally. For a Hida family, Wan20 Lemma 9.3 gives the same conclusion; for a single form outside the µ = 0 range the exceptional primes remain excluded.

**Hypotheses.**

- Hypotheses of AutomorphicPadicLFunctions:L3h/theorem-b (Hsieh's µ = 0) for the anticyclotomic specialization; the auxiliary-field choice of L2/auxiliary-field-selection must preserve them (no nonsplit-prime or minimality condition dropped).

**Proof outline.**

1. Write L = Σ a\_i (γ^- − 1)^i with a\_i ∈ O^{ur}\[\[Γ^+]]; L ∈ Q·O^{ur}\[\[Γ\_K]] iff every a\_i ∈ Q.
2. Specialize at the trivial character of Γ^+ (or at a weight point): the anticyclotomic function has µ = 0, so some a\_i is a unit there, so not all a\_i lie in Q (the argument of SU Prop. 12.3.6, with Hsieh in place of Vatsal).
3. The Dirichlet factor lives in the cyclotomic variable, so it is a product of pulled-back primes and is coprime to L.

**Checks.**

- Test: an excluded height-one prime pulled back from O\[\[Γ^+]] at which the Dirichlet factor vanishes is not claimed for L unless the µ = 0 hypothesis holds.

**Prerequisites.** `AutomorphicPadicLFunctions:L3h/theorem-b`, `AutomorphicPadicLFunctions:L3h/theorem-a`, `AutomorphicCongruences:L2/vector-valued-klingen-family`.

**Sources.**

- FW-v3, proof of Thm 7.32, last paragraph, p. 97: The Steinberg-twist assumption lets Fouquet–Wan apply the vanishing of the anticyclotomic µ-invariant, so L is in no height-one prime of O\[\[Γ^+]].
- CLW-v1, proof of Thm 8.2.1(1), p. 81: In Wan20 such primes need not be excluded thanks to Lemma 9.3 and Hsieh; with π fixed CLW cannot prove the analogue.

### Choosing the auxiliary imaginary quadratic field for the Fouquet–Wan route

`AutomorphicCongruences:L2/auxiliary-field-selection` (application).

**Statement.** Let f ∈ S\_k(Γ\_0(N)), p ∤ N, k ≥ 2 even, satisfy the hypotheses of FW Thm 1.6 (ρ̄\_f absolutely irreducible; some ℓ ∥ N with dim ρ̄^{I\_ℓ}\_f = 1 and dim ρ̄^{G\_ℓ}\_f = 0; ordinary with χ̄\_1 ≠ χ̄\_2). Then there is an imaginary quadratic K with p split, the chosen ℓ inert in K (so ℓ is a nonsplit prime with ℓ ∥ N), every other prime dividing N split in K, 2 split or ramified-Steinberg as required, and ρ̄\_f|\_{G\_K} absolutely irreducible; for such K all hypotheses of L2/fw-greenberg-divisibility (first containment) and of L2/castella-wan-equivalence hold, and no nonsplit-prime or minimality condition is dropped in passing from f to f over K.

**Hypotheses.**

- Only the hypotheses of FW Thm 1.6 on f; the conditions on K are finitely many local conditions at finitely many primes plus the avoidance of the finitely many quadratic subfields of the splitting field of ρ̄\_f.

**Proof outline.**

1. Impose local splitting conditions at p, ℓ and the primes of N by choosing D\_K in finitely many residue classes; infinitely many such K exist.
2. Absolute irreducibility of ρ̄\_f|\_{G\_K}: ρ̄\_f is absolutely irreducible over ℚ, so it fails over K only if ρ̄\_f is induced from K; this excludes at most finitely many K.
3. Check each hypothesis of Thm 7.32 and of the Castella–Wan comparison: q = ℓ is nonsplit with q ∥ N; all nonsplit primes are q ∥ N; ρ̄\_f|\_{G\_K} irreducible; ordinary at p.

**Checks.**

- The Steinberg-twist hypothesis of the second containment is not automatic; when it fails the exceptional primes are handled by L2/exceptional-height-one-primes or remain excluded.

**Prerequisites.** `AutomorphicCongruences:L2/fw-greenberg-divisibility`, `AutomorphicCongruences:L2/castella-wan-equivalence`.

**Sources.**

- FW-v3, §4.8, p. 68; Thm 1.6, pp. 6–7: Choose an auxiliary quadratic field K 'in the same way' as in §4.6 and prove the two-variable Rankin–Selberg main conjecture over K.
- SU-2014, proof of Thm 3.6.4, p. 43: The analogous choice of K for SU: p split, primes of N/q split, q inert.

### Λ-adic Beilinson–Flach classes for a Hida family and the CM family

`AutomorphicCongruences:L2/klz-beilinson-flach-classes` (construction). Planet: Beilinson–Flach classes.

**Statement.** Let 𝐟 be a Hida family with coefficient ring 𝕀 and g the canonical CM Hida family of K (with T\_g ≅ Ind^ℚ\_K ℤ\_p\[\[Γ\_p]]). The Kings–Loeffler–Zerbes Beilinson–Flach class BF\_{𝐟,g} ∈ H¹(ℚ, T\_𝐟 ⊗̂ T\_g ⊗̂ Λ\_Γ), obtained from Rankin–Eisenstein classes on products of modular curves (diagonal pushforward of Eisenstein classes, Siegel units) with tame and p-power norm relations, defines through Shapiro's lemma a class BF ∈ H¹(K, T) and, after the twist tw\_{Θ^{-1}}, a class BF† ∈ Sel^{Gr,∅}(K, T†) (Greenberg condition at one prime above p, relaxed at the other) over 𝕀\[\[Γ\_K]] (CW Thm 3.6, from KLZ17 Def. 8.1.1 with m = 1 and LLZ14 Lemma 6.8.9 to remove the auxiliary c; membership in the Selmer group by KLZ17 Prop. 8.1.7). Specializations at weight-k points give the classes used in FW §4.4 and §4.8.

**Hypotheses.**

- 𝐟 an ordinary Hida family (or a point of weight k in the crystalline setting of FW §4.4 via analytic families of Beilinson–Flach elements); p split in K.
- KLZ17 and LLZ14 were not read for this packet: the construction is stated through CW Thm 3.6 and FW §4.4 (gap 'klz-not-read').

**Proof outline.**

1. Rankin–Eisenstein classes: pushforward along the diagonal Y\_1(N) → Y\_1(N)² of Eisenstein classes (from Siegel units, KatoEulerSystems:L0), with the étale realization and the moment maps.
2. Norm relations in the tame and p-power directions give a Λ-adic class over the tower (KLZ).
3. Specialize the second family to the canonical CM family g and apply Shapiro to obtain BF ∈ H¹(K, T); twist by Θ^{-1}.

**Checks.**

- RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity specializes the same KLZ classes to weight two in its Eisenstein branch; the general Hida-family construction is planned here (stage L2's own target).

**Uses.**

- L2/bf-explicit-reciprocity: the Coleman images of loc\_p(BF†) are the two Rankin–Selberg p-adic L-functions
- L2/castella-wan-equivalence: BF† generates the rank-one Selmer module in the Beilinson–Flach main conjecture
- L2/fw-crystalline-main-conjecture: the analytic families of Beilinson–Flach elements in FW §4.4–4.6
- RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity: its weight-two Eisenstein specialization

**API.**

- `BF.lambdaAdic` (constructor): BF\_{𝐟,g} ∈ H¹(ℚ, T\_𝐟 ⊗̂ T\_g ⊗̂ Λ\_Γ).
- `BF.overK` (equivalence): Shapiro identifies BF\_{𝐟,g} with BF ∈ H¹(K, T), T = T\_𝐟 ⊗ 𝕀\[\[Γ\_K]]-coinduced.
- `BF.twisted` (data): BF† = tw\_{Θ^{-1}}(BF) ∈ H¹(K, T†).
- `BF.mem_selmer` (characterisation): BF† ∈ Sel^{Gr,∅}(K, T†): Greenberg at one prime above p, relaxed at the other, unramified away from p (KLZ17 Prop. 8.1.7).
- `BF.normRelation` (characterisation): Tame norm relations with Euler factors P\_ℓ(Frob\_ℓ^{-1}) and p-power norm compatibility.
- `BF.specialize` (functoriality): Specialization along arithmetic points of 𝕀 and of Γ\_K commutes with Shapiro and the twist.
- `BF.loc_nontorsion` (characterisation): loc\_v(BF†) is non-torsion over 𝕀\[\[Γ\_K]] for each v | p (CW Thm 3.6, last sentence).

**Unit tests.**

- `bf_rank_one_specialization` (computation): At a weight-two point of 𝐟 and the trivial point of g, BF specializes to a class whose image under the Coleman map at v̄ is a nonzero multiple of L\_p(f, g) at that point (via L2/bf-explicit-reciprocity).
- `bf_selmer_condition` (characterisation): loc\_{v\_0}(BF†) satisfies the Greenberg condition, while loc\_{v̄\_0}(BF†) is unrestricted (relaxed).
- `bf_not_kato` (non-example): Kato's zeta element of f alone (KatoEulerSystems:L2) is a class for T\_f over ℚ\_∞, not for T\_𝐟 ⊗ T\_g over the two-variable tower; replacing BF by Kato's class fails BF.overK.
- `bf_cm_family_shapiro` (agreement): With g the canonical CM family, T\_g ≅ Ind^ℚ\_K ℤ\_p\[\[Γ\_p]] (BST19), and Shapiro gives the identification BF.overK used by Castella–Wan.

**Prerequisites.** `KatoEulerSystems:L0/siegel-units-and-c-independent-rationalisation`, `KatoEulerSystems:L1/etale-chern-moment-map-into-modular-local-system`, `PadicFamilies:L4/ordinary-big-galois-representation`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/universal-norms-unramified`.

**Sources.**

- CW-v1, Thm 3.6 and its proof, p. 15: The class BF† ∈ Sel^{Gr,∅}(K,T†) from KLZ17 Def. 8.1.1 (m = 1), LLZ14 Lemma 6.8.9 and the CM family via BST19 and Shapiro.
- FW-v3, §4.4 (Prop. 4.22, §4.4.2), pp. 49–51: Hida families of CM representations and analytic families of Beilinson–Flach elements used in the crystalline case.

### Explicit reciprocity for Beilinson–Flach classes

`AutomorphicCongruences:L2/bf-explicit-reciprocity` (theorem).

**Statement.** There are 𝕀\[\[Γ\_K]]-linear injections with pseudo-null cokernel Col^{(1),†}: H¹(K\_p, F^-T†) → 𝕀\_𝐟 ⊗\_𝕀 𝕀\[\[Γ\_K]] and Col^{(2),†}: H¹(K\_p, F^+T†) → 𝕀\_g ⊗̂ 𝕀\[\[Γ\_K]] such that Col^{(1),†}(loc\_p(BF†)) = tw\_{Θ^{-1}}(L\_p(𝐟, g)) and Col^{(2),†}(loc\_p(BF†)) = tw\_{Θ^{-1}}(L\_p(g, 𝐟)), the two Hida Rankin–Selberg p-adic L-functions (CW Thm 3.6, from the explicit reciprocity law KLZ17 Thm 10.2.2 with the Coleman maps Col^{(1)} = ⟨L(−), η\_𝐟 ⊗ ω\_g⟩ and Col^{(2)} = ⟨L(−), η\_g ⊗ ω\_𝐟⟩ built from the Perrin-Riou big logarithm). In particular loc\_v(BF†) is non-torsion for each v | p.

**Hypotheses.**

- As in L2/klz-beilinson-flach-classes; the big logarithm in families is imported.

**Proof outline.**

1. Construct Col^{(i)} by pairing the Perrin-Riou big logarithm of the graded pieces F^∓ with the differentials η, ω (PadicFamilies:L4/family-big-logarithm, PadicHodgeRegulators:L3/crystalline-regulator).
2. KLZ17 Thm 10.2.2: the images of loc\_p(BF) are the Hida p-adic L-functions; twist by Θ^{-1}.
3. Injectivity with pseudo-null cokernel from the structure of local Iwasawa cohomology of rank-one graded pieces.

**Checks.**

- Weight moments: specializing at weight-k points gives the reciprocity laws FW uses in §4.4–4.6 for the analytic families.

**Prerequisites.** `AutomorphicCongruences:L2/klz-beilinson-flach-classes`, `PadicFamilies:L4/family-big-logarithm`, `PadicFamilies:L4/two-variable-l-function`, `PadicHodgeRegulators:L3/crystalline-regulator`, `PadicHodgeRegulators:L3/explicit-reciprocity`.

**Sources.**

- CW-v1, Thm 3.6 and proof, p. 15: The Coleman maps and the explicit reciprocity law of KLZ17 Thm 10.2.2 for BF†.
- FW-v3, §4.4.2 and §4.5, pp. 51–57: Analytic families of Beilinson–Flach elements, Selmer complexes and Rankin–Selberg p-adic L-functions.

### Greenberg and Beilinson–Flach main conjectures over K are equivalent

`AutomorphicCongruences:L2/castella-wan-equivalence` (theorem).

**Statement.** Let 𝐟 be a Hida family with ρ\_𝐟|\_{G\_K} irreducible. The following are equivalent, up to powers of p: (i) X^{Gr,0}(K\_∞, A†\_𝐟) is 𝕀\[\[Γ\_K]]-torsion, Sel^{Gr,∅}(K, T†) has rank one, and char(X^{Gr,0}) = char(Sel^{Gr,∅}(K,T†)/𝕀\[\[Γ\_K]]·BF†); (ii) X^{∅,0}(K\_∞, A†\_𝐟) and Sel^{0,∅}(K, T†) are torsion and char(X^{∅,0})·𝕀^{ur}\[\[Γ\_K]] = (tw\_{Θ^{-1}}(L\_p(𝐟/K))) (CW Thm 3.8). The same argument holds for a weight-k specialization with the Greenberg main conjecture supplied by L2/fw-greenberg-divisibility in place of the weight-two input (FW §4.8). Each divisibility direction in (ii) corresponds to the same direction in (i).

**Hypotheses.**

- ρ\_𝐟|\_{G\_K} irreducible; the comparison is up to powers of p, so it does not by itself remove a power of p.

**Proof outline.**

1. The two Poitou–Tate four-term exact sequences for the Selmer structures (Gr,∅) ⊃ (Gr,0) and (∅,∅) ⊃ (∅,0) relate the four modules; the Coleman maps of L2/bf-explicit-reciprocity identify the local terms with the p-adic L-functions.
2. Rank and torsion statements are proved before any cancellation: loc\_v(BF†) is non-torsion, so Sel^{Gr,∅} has rank one when X^{Gr,0} is torsion.
3. Multiplicativity of characteristic ideals along the exact sequences gives the equivalence, with pseudo-null cokernels absorbed.

**Checks.**

- Integrality is not claimed: the p-power ambiguity is removed only in L2/fw-ordinary-reverse-bound, using Kato's bound and the §4.6.3-type argument.

**Prerequisites.** `AutomorphicCongruences:L2/bf-explicit-reciprocity`, `AutomorphicCongruences:L2/klz-beilinson-flach-classes`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `SelmerIwasawaCohomology:L3/iwasawa-selmer-duality`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-poitou-tate-sequence`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`.

**Sources.**

- CW-v1, Thm 3.8, p. 16: The equivalence of the Beilinson–Flach and Greenberg two-variable main conjectures over K, up to powers of p.
- FW-v3, §4.8, p. 68: The argument goes through in general weight by replacing Greenberg's main conjecture there by Thm 7.32.

### Boundedness of the Bloch–Kato exponential along unramified extensions

`AutomorphicCongruences:L2/unramified-exponential-boundedness` (theorem).

**Statement.** Let V be a crystalline G\_{ℚ\_p}-representation, short with irreducible residual representation (FW Assumption 4.1), and T a lattice. Along the unramified ℤ\_p-extension (the one-variable family through the given point that is unramified at v\_0 and totally ramified at v̄\_0), the Bloch–Kato exponential maps have uniformly bounded denominators: the co-boundary map of FW Prop. 4.12 sends the integral Dieudonné lattice into integral cohomology up to a fixed power of p independent of the layer, and the image of the canonical differential class through the exponential generates an integral local subspace (FW Cor. 4.13–4.14). The Yager-module description of unramified local Iwasawa theory is imported from GeneralizedHeegnerCycles:GH.7; this node owns only FW §4.2.1's boundedness and §4.2.3's explicit description.

**Hypotheses.**

- FW Assumption 4.1 (crystalline, short, residually irreducible); the twist by an unramified character in Cor. 4.13; for Cor. 4.14 every specialization of T ⊗ O\[\[U]] satisfies the hypotheses.

**Proof outline.**

1. Fontaine–Laffaille theory gives an integral description of crystalline cohomology for short representations.
2. Compute the exponential on the unramified tower through Yager modules (FW §4.2.2, following Loeffler–Zerbes §3.2; GH.7) and bound the denominators (Prop. 4.12).
3. Cor. 4.13–4.14: the integral local subspace generated by the canonical differential class.

**Checks.**

- RT-AREA-iwasawa-1/27: the Yager module and the unramified big exponential are planned once, in GeneralizedHeegnerCycles:GH.7; L2 keeps only the boundedness statement.

**Prerequisites.** `GeneralizedHeegnerCycles:GH.7/yager-unramified-checkpoint`, `SelmerIwasawaCohomology:L4/fontaine-laffaille-comparison`, `SelmerIwasawaCohomology:L4/integral-finite-comparison`.

**Sources.**

- FW-v3, §4.2.1 Prop. 4.12, p. 43; §4.2.2 (Yager modules after Loeffler–Zerbes §3.2), p. 43; §4.2.3 Cors 4.13–4.14, pp. 44–45: Boundedness of the exponential map along the unramified family and the integral local subspace replacing the ± theory.
- FW-v3, §1.2.1, pp. 11–12: The integral local theory along the line unramified at v\_0 replaces a two-variable ± theory.

### Fouquet–Wan's main conjecture at crystalline short points

`AutomorphicCongruences:L2/fw-crystalline-main-conjecture` (theorem). Planet: Fouquet–Wan crystalline theorem.

**Statement.** Let f ∈ S\_k(Γ\_0(N)) be a normalized eigencuspform of weight k ≥ 2 with ρ\_f|\_{G\_{ℚ\_p}} crystalline (p ∤ N) and short, ρ̄\_f|\_{G\_{ℚ\_p}} absolutely irreducible, and some ℓ ∥ N with dim ρ̄^{I\_ℓ} = 1 and dim ρ̄^{G\_{ℚ\_ℓ}} = 0. Then Kato's main conjecture holds for M(f): char H²(ℤ\[1/p], T ⊗ Λ\_Iw) = char H¹(ℤ\[1/p], T ⊗ Λ\_Iw)/Λ\_Iw·z(f)\_Iw (FW Thm 4.51 = Thm 1.13; Thm 4.38 under the residual hypothesis of Thm 1.7). The proof first gives the equalities of Prop. 4.42 after inverting p (through Pottharst's analytic Iwasawa theory and Selmer complexes over ΛK,∞), then removes the power of p by the unramified local theory along the line through the point (§4.6.3, Prop. 4.48), and treats equal Satake parameters through the Bianchi three-variable p-adic L-function of Betina–Williams (§4.7).

**Hypotheses.**

- As stated; the distinct-Satake-parameter case first, then §4.7 for the p-irregular case.
- Kato's one-sided bound (KatoEulerSystems:L4) supplies the divisibility F\_1 | F of the proof of Thm 4.51.

**Proof outline.**

1. Prop. 4.42: from L2/fw-greenberg-divisibility over K and the Beilinson–Flach reciprocity of L2/bf-explicit-reciprocity in analytic families, via Poitou–Tate for Selmer complexes (FW §4.5, Props 4.28, 4.30, 4.43, Cor. 4.44), get the equality after inverting p.
2. §4.3: control of Selmer groups and absence of pseudo-null submodules (Prop. 4.20).
3. §4.6.3: along the unramified line through the point, the integral local subspace of L2/unramified-exponential-boundedness gives the bound at a generic arithmetic point (Prop. 4.48, Lemmas 4.49–4.50); with Kato's divisibility F\_1 | F and Kato's explicit reciprocity this gives Thm 4.51.
4. §4.7: when the Satake parameters coincide, compare with the Betina–Williams Bianchi p-adic L-function (Prop. 4.53).

**Checks.**

- Integral, not only after inverting p; this is the seed FW Prop. 5.6 uses at crystalline-short points of the deformation space.

**Prerequisites.** `AutomorphicCongruences:L2/fw-greenberg-divisibility`, `AutomorphicCongruences:L2/bf-explicit-reciprocity`, `AutomorphicCongruences:L2/unramified-exponential-boundedness`, `AutomorphicCongruences:L2/castella-wan-equivalence`, `KatoEulerSystems:L4/cohomological-divisibility-one-direction`, `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`, `PadicFamilies:L4/coleman-family-regulator`, `SelmerIwasawaCohomology:L3/infinite-selmer-complex`, `SelmerIwasawaCohomology:L3/selmer-no-pseudonull`, `PadicHodgeRegulators:L4/noncritical-refinement`, `ModularIwasawaMainConjectures:L0/kato-main-conjecture`.

**Sources.**

- FW-v3, Thm 4.38 p. 58; Prop. 4.42 p. 59; §4.6.3 and Thm 4.51 with proof pp. 61–65; §4.7 Prop. 4.53 pp. 66–67: Kato's main conjecture at crystalline short points with residually irreducible local representation.
- FW-v3, §1.2.1, pp. 11–12: Outline: analytic Iwasawa theory after inverting p, then the unramified line to remove powers of p, then the Betina–Williams comparison.

### The Fouquet–Wan ordinary reverse divisibility (Theorem 1.6 by §4.8)

`AutomorphicCongruences:L2/fw-ordinary-reverse-bound` (theorem). Planet: Fouquet–Wan ordinary reverse divisibility.

**Statement.** Let f ∈ S\_k(Γ\_0(N)), p ∤ N, k ≥ 2, be an eigencuspform with (1) ρ̄\_f absolutely irreducible; (2) some ℓ ∥ N with dim\_𝔽 ρ̄^{I\_ℓ}\_f = 1 and dim\_𝔽 ρ̄^{G\_ℓ}\_f = 0; (3) ρ\_f|\_{G\_{ℚ\_p}} an extension 0 → χ\_1 → ρ\_f|\_{G\_{ℚ\_p}} → χ\_2 → 0 with χ̄\_1 ≠ χ̄\_2. Then char\_{Λ\_Iw} H¹(ℤ\[1/p], T ⊗ Λ\_Iw)/Λ\_Iw·z(f)\_Iw divides char\_{Λ\_Iw} H²(ℤ\[1/p], T ⊗ Λ\_Iw) (FW Thm 1.6). The route is FW §4.8, not SU plus a period lemma: over an auxiliary K (L2/auxiliary-field-selection) prove the two-variable Greenberg Rankin–Selberg main conjecture divisibility by L2/fw-greenberg-divisibility, transfer it through L2/castella-wan-equivalence to the Beilinson–Flach formulation, descend to the cyclotomic line, separate the twist factor f ⊗ χ\_K, and remove the power of p by a §4.6.3-type integral argument that uses Kato's one-sided bound. No comparison of canonical and Gross periods is used.

**Hypotheses.**

- Hypotheses (1)–(3) of FW Thm 1.6 exactly; trivial character, even weight for the GU(3,1) input.
- FW §4.8 only indicates this argument ('the details are given in Castella–Wan Thm 3.8 ... for weight 2'); the p-power step in the ordinary case is not written out in the source (gap 'fw-4-8-sketch').

**Proof outline.**

1. Choose K by L2/auxiliary-field-selection; L2/fw-greenberg-divisibility gives char(X^{Gr}) ⊆ (L^{Gr}) up to pulled-back primes, integrally when L2/exceptional-height-one-primes applies.
2. L2/castella-wan-equivalence (weight k) converts this into the Beilinson–Flach divisibility char(X^{Gr,0}) ⊆ char(Sel^{Gr,∅}/BF†), up to powers of p.
3. Specialize to the cyclotomic line (L0/selmer-specialization-control) and compare BF† with Kato's zeta elements of f and f ⊗ χ\_K (as in FW §4.6.2–4.6.3), separating the two factors.
4. Remove the power of p as in FW §4.6.3: Kato's divisibility (KatoEulerSystems:L4/cohomological-divisibility-one-direction) and an integral local subspace along a line in Spec Λ\_K reduce the integral statement to a cardinality at one generic arithmetic point.

**Checks.**

- Export to ModularIwasawaMainConjectures:L1/fw-ordinary-theorem, which combines it with Kato's bound into the equality; RS-11 requires the KatoEulerSystems:L4 input inside this proof, not only in the consumer.
- RT-AREA-iwasawa-1/22: this target lives in L2 (its inputs are L2's), not in L1; the canonical/Gross period comparison is a recorded gap, not a lemma.

**Prerequisites.** `AutomorphicCongruences:L2/auxiliary-field-selection`, `AutomorphicCongruences:L2/fw-greenberg-divisibility`, `AutomorphicCongruences:L2/castella-wan-equivalence`, `AutomorphicCongruences:L2/exceptional-height-one-primes`, `AutomorphicCongruences:L2/unramified-exponential-boundedness`, `AutomorphicCongruences:L0/selmer-specialization-control`, `KatoEulerSystems:L4/cohomological-divisibility-one-direction`, `KatoEulerSystems:L4/ordinary-selmer-divisibility`, `KatoEulerSystems:L4/rational-iwasawa-module-structure`, `ModularIwasawaMainConjectures:L0/kato-main-conjecture`.

**Sources.**

- FW-v3, Thm 1.6 and the remark before it, pp. 6–7; §4.8, p. 68: Theorem 1.6 and its proof sketch: auxiliary K, two-variable Rankin–Selberg main conjecture via Thm 7.32, Beilinson–Flach reciprocity and Poitou–Tate as in Castella–Wan, then Kato.
- CW-v1, Thm 3.8, p. 16: The weight-two equivalence that FW §4.8 extends.

### Wan's ordinary GU(3,1) Rankin–Selberg divisibility

`AutomorphicCongruences:L2/wan-rankin-selberg-divisibility` (theorem).

**Statement.** Let K be imaginary quadratic with p = v\_0v̄\_0 split, f\_0 a weight-two form of trivial character and square-free tame level N in an ordinary Hida family 𝐟, and ξ a Hecke character of infinity type (κ/2, −κ/2), κ ≥ 6 even, with ord\_{v\_0}, ord\_{v̄\_0} of its conductor ≤ 1. (Thm 1.1) If p ≥ 5, ξ|\_{𝔸^×\_ℚ} = ω∘Nm with κ ≡ 0 mod 2(p − 1), ρ̄\_𝐟|\_{G\_K} irreducible, some q | N nonsplit in K with ρ̄\_𝐟 ramified at q, the CM form g\_ξ satisfies (dist) and (irred), every local root number ε(π\_{f,v}, ξ\_v, 1/2) = 1 at nonsplit v, and the conductor of ξ is divisible only by split primes, then L^{Hida}\_{𝐟,ξ,K} ∈ Î^{ur}\[\[Γ\_K]] and (L^{Hida}\_{𝐟,ξ,K}) ⊇ char(X\_{𝐟,K,ξ}). (Thm 1.2) For the single form f\_0, if p ≥ 5, the p-adic avatar of ξ|·|^{κ/2}(ω^{-1}∘Nm) factors through Γ\_K with κ ≡ 0 mod 2(p − 1), ρ̄\_{f}|\_{G\_K} is irreducible and some q ∥ N is nonsplit in K, then (L\_{f,ξ,K}) ⊇ char(X\_{f,K,ξ}) as fractional ideals of Ô^{ur}\_L\[\[Γ\_K]] ⊗ L, allowing both global root numbers; this p-inverted, imprimitive two-variable bound (with the exceptional-prime and normality arguments of Wan20 §9) is the input exported to RankOneConverse.

**Hypotheses.**

- As stated in Wan20 Thms 1.1–1.2; the published ordinary theorem (arXiv:1408.4044, Algebra Number Theory 2020), not the withdrawn arXiv:1412.1767 nor the nonordinary replacement (L2s).

**Proof outline.**

1. Construct the Klingen Eisenstein family on U(3,1) whose constant terms are L^Σ\_{𝐟,K,ξ} (Wan20 step (1)), with the Siegel section at p of Wan20 §4.3.
2. Fourier–Jacobi coprimality through the functional l\_{θ⋆}, the doubling formula for U(2) × U(2) and Ichino's formula (Wan20 steps (2)–(5); L2s/fourier-jacobi-primitivity is the weight-two semi-ordinary analogue).
3. Galois argument: lattice construction (Wan20 Prop. 9.2, L0/lattice-construction) with CAP exclusion (L2s/cap-exclusion); Thm 1.2 by specializing a weaker three-variable statement after inverting all nonzero elements of 𝕀.

**Checks.**

- RankOneConverse:PC.2/wan-divisibility consumes Thm 1.2; BSD.6a's anticyclotomic input uses the same theorem through JSW §6.

**Prerequisites.** `AutomorphicCongruences:L0/lattice-construction`, `AutomorphicCongruences:L2s/cap-exclusion`, `AutomorphicCongruences:L2s/fourier-jacobi-primitivity`, `AutomorphicCongruences:L2/exceptional-height-one-primes`, `AutomorphicPadicLFunctions:L4e/klingen-family`, `AutomorphicPadicLFunctions:L4e/ew-siegel-eisenstein-measure`, `AutomorphicPadicLFunctions:L3h/theorem-b`, `AutomorphicPadicLFunctions:L3h/hsieh-hecke-nonvanishing`.

**Sources.**

- WAN-RS, Thms 1.1–1.2 and the discussion after them, pp. 2–4; outline pp. 4–6: The three-variable and two-variable divisibilities for Rankin–Selberg p-adic L-functions on U(3,1) and the steps of their proof.

### Dependencies of layer L2

Inside this roadmap and on other roadmaps (node and stage ids): `ArithmeticGaloisDuality:R02.4/poitou-tate`, `AutomorphicCongruences:L0/eisenstein-ideal`, `AutomorphicCongruences:L0/lattice-construction`, `AutomorphicCongruences:L0/primitive-imprimitive-comparison`, `AutomorphicCongruences:L0/selmer-specialization-control`, `AutomorphicCongruences:L1/gu22-galois-pseudocharacter`, `AutomorphicCongruences:L2s/cap-exclusion`, `AutomorphicCongruences:L2s/clw-main-divisibility`, `AutomorphicCongruences:L2s/fourier-jacobi-primitivity`, `AutomorphicCongruences:L2s/semi-ordinary-hida-theory`, `AutomorphicCongruences:L2s/semi-ordinary-klingen-family`, `AutomorphicCongruences:L2s/semi-ordinary-weight-space`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicPadicLFunctions:L3`, `AutomorphicPadicLFunctions:L3/katz-padic-l-function`, `AutomorphicPadicLFunctions:L3h/hsieh-hecke-nonvanishing`, `AutomorphicPadicLFunctions:L3h/theorem-a`, `AutomorphicPadicLFunctions:L3h/theorem-b`, `AutomorphicPadicLFunctions:L4/archimedean-zeta-integral`, `AutomorphicPadicLFunctions:L4/ehls-ordinary-forms-hecke`, `AutomorphicPadicLFunctions:L4e/constant-term-divisibility`, `AutomorphicPadicLFunctions:L4e/ew-padic-l-function`, `AutomorphicPadicLFunctions:L4e/ew-siegel-eisenstein-measure`, `AutomorphicPadicLFunctions:L4e/klingen-family`, `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-poitou-tate-sequence`, `GeneralizedHeegnerCycles:GH.7/yager-unramified-checkpoint`, `KatoEulerSystems:L0/siegel-units-and-c-independent-rationalisation`, `KatoEulerSystems:L1/etale-chern-moment-map-into-modular-local-system`, `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`, `KatoEulerSystems:L4/cohomological-divisibility-one-direction`, `KatoEulerSystems:L4/ordinary-selmer-divisibility`, `KatoEulerSystems:L4/rational-iwasawa-module-structure`, `MetaplecticAutomorphicForms:MP.6/fourier-jacobi-extraction`, `MetaplecticAutomorphicForms:MP.6/fourier-jacobi-period`, `MetaplecticAutomorphicForms:MP.6/rallis-inner-product`, `ModularIwasawaMainConjectures:L0/kato-main-conjecture`, `PadicFamilies:L0a/profinite-projector-exact`, `PadicFamilies:L4/coleman-family-regulator`, `PadicFamilies:L4/family-big-logarithm`, `PadicFamilies:L4/ordinary-big-galois-representation`, `PadicFamilies:L4/two-variable-l-function`, `PadicHodgeRegulators:L3/crystalline-regulator`, `PadicHodgeRegulators:L3/explicit-reciprocity`, `PadicHodgeRegulators:L4/noncritical-refinement`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `SelmerIwasawaCohomology:L2/greenberg-condition`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `SelmerIwasawaCohomology:L3/infinite-selmer-complex`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-selmer-duality`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `SelmerIwasawaCohomology:L3/selmer-no-pseudonull`, `SelmerIwasawaCohomology:L3/universal-norms-unramified`, `SelmerIwasawaCohomology:L4/fontaine-laffaille-comparison`, `SelmerIwasawaCohomology:L4/integral-finite-comparison`.

### Acceptance for layer L2

Coverage: **planned**. L2 imports CLW's weight-two semi-ordinary theory and lattice argument from L2s (RT-AREA-iwasawa-1/24), Yager modules from GeneralizedHeegnerCycles:GH.7 (RT-AREA-iwasawa-1/27) and Jacobi groups from MetaplecticAutomorphicForms:MP.6 (RT-AREA-automorphic-1/20).

- Refinement: Write out the ordinary-case p-power argument that FW §4.8 only indicates (gap fw-4-8-sketch), following FW §4.6.3 with Kato's bound.
- Refinement: Read KLZ17 and LLZ14 and refine L2/klz-beilinson-flach-classes and L2/bf-explicit-reciprocity (gap klz-not-read).
- Refinement: Refine FW §4.5–4.7 (Selmer complexes, Pottharst's analytic Iwasawa theory, the Betina–Williams comparison) behind L2/fw-crystalline-main-conjecture.

## Layer L3: Deformation theory and universal zeta elements

The universal deformation ring of ρ̄ is a reduced complete intersection, equal to the Hecke algebra and finite free over a regular ring Λ = O⟦X₁, X₂, X₃⟧. Nakamura's universal zeta morphism, built from completed homology and Kato's zeta classes through the p-adic local Langlands correspondence, trivializes the fundamental line of the universal deformation and specializes to Kato's zeta morphism at every classical point.

### The residual hypotheses of the Fouquet–Wan and Nakamura theorems

`AutomorphicCongruences:L3/fw-residual-hypotheses` (definition).

**Statement.** For an odd prime p, a finite field 𝔽 of characteristic p and an odd absolutely irreducible continuous ρ̄: G\_ℚ → GL\_2(𝔽) unramified outside a finite set Σ ∋ p, define the predicates: (A2.1) ρ̄|\_{G\_{ℚ(√p\*)}} is absolutely irreducible (p\* = (−1)^{(p−1)/2}p), and if ρ̄|\_{G\_{ℚ\_p}} is an extension of χ\_2 by χ\_1 then χ\_1^{-1}χ\_2 ∉ {1, χ̄\_cyc} (FW Assumption 2.1); (A3.5) if (ρ̄|\_{G\_{ℚ\_p}})^{ss} = χ̄\_1 ⊕ χ̄\_2 then χ̄\_1^{-1}χ̄\_2 ≠ χ̄\_cyc (FW Assumption 3.5); (A3.7) there is ℓ ∥ N, ℓ ≠ p, with dim\_𝔽 ρ̄^{I\_ℓ} = 1 (FW Assumption 3.7); (T1.7) (ρ̄|\_{G\_{ℚ\_p}})^{ss} ≠ χ̄ ⊕ χ̄χ̄\_cyc for every character χ̄, and there is ℓ ∤ p with ρ̄|\_{G\_{ℚ\_ℓ}} a ramified extension 0 → µχ^{1−k/2}\_cyc → ρ̄|\_{G\_{ℚ\_ℓ}} → µχ^{−k/2}\_cyc → 0, µ unramified quadratic (nontrivial if ρ̄|\_{G\_{ℚ\_p}} is irreducible) (FW Thm 1.7/5.1); and Nakamura's (N1) p ≥ 5, (N2) ρ̄|\_{G\_{ℚ(ζ\_p)}} absolutely irreducible, (N3) End\_{𝔽\[G\_{ℚ\_p}]}(ρ̄\_p) = 𝔽, (N4) ρ̄\_p not of the form (1 ∗; 0 ε^{±1}) ⊗ χ, (N5) ρ̄\_p not of the form (1 ∗; 0 1) ⊗ χ (Nakamura Thm 1.1).

**Hypotheses.**

- The predicates are on the residual representation only; the scalar exclusion (ρ̄|\_{G\_{ℚ\_p}})^{ss} ≠ χ̄ ⊕ χ̄ is part of A2.1 through its second clause and the endomorphism remark after it (FW p. 17).

**Proof outline.**

1. Record each predicate as a Prop on ρ̄ with its source.
2. Under A2.1 the endomorphisms of ρ̄|\_{G\_{ℚ\_p}} are scalars unless (ρ̄|\_{G\_{ℚ\_p}})^{ss} ≅ χ̄ ⊕ χ̄ (FW remark after Assumption 2.1), which is where Nakamura's N3 enters.
3. Nakamura's remark on N2/N5 (they can be dropped for the promodular ring) and FW's remark on p ≥ 5 (removed by Paškūnas–Tung's generalization) are recorded as API facts.

**Checks.**

- Answers the consumer question of ModularIwasawaMainConjectures (source issue E1): whether FW Assumption 2.1(2)'s scalar exclusion is needed is decided by recording it as a separate predicate used by L3/universal-deformation-ring-structure and L3/nakamura-universal-zeta-morphism.

**Uses.**

- L3/universal-deformation-ring-structure: A2.1 makes R\_Σ(ρ̄) representable, CI and isomorphic to the Hecke algebra
- L3/nakamura-universal-zeta-morphism: N1–N5 (or N1, N3, N4 for the promodular ring)
- L4/fw-pointwise-theorem: T1.7 is the hypothesis of the pointwise theorem
- ModularIwasawaMainConjectures:L2/fw-pointwise-theorem: the consumer restates FW Thm 1.7 with these predicates

**API.**

- `FWResidual.A21` (constructor): Assumption 2.1 as a predicate on ρ̄.
- `FWResidual.A35` (constructor): Assumption 3.5.
- `FWResidual.A37` (constructor): Assumption 3.7 (a prime ℓ ∥ N with one-dimensional inertia invariants).
- `FWResidual.T17` (constructor): The two residual hypotheses of FW Thm 1.7 / Thm 5.1.
- `FWResidual.Nakamura` (constructor): Nakamura's (N1)–(N5).
- `FWResidual.scalar_endomorphisms` (characterisation): A21 implies End\_{𝔽\[G\_{ℚ\_p}]}(ρ̄|\_{G\_{ℚ\_p}}) = 𝔽 unless (ρ̄|\_{G\_{ℚ\_p}})^{ss} ≅ χ̄ ⊕ χ̄.
- `FWResidual.twist_invariant` (compatibility): Each predicate is invariant under twisting ρ̄ by a character, and A21 depends only on ρ̄ up to isomorphism.

**Unit tests.**

- `fwResidual_A21_quadratic` (computation): For p = 5 and ρ̄ induced from a character of G\_{ℚ(√5)} (dihedral with respect to ℚ(√p\*)), A21 fails while ρ̄ itself is absolutely irreducible.
- `fwResidual_T17_excludes_cyclotomic` (non-example): For E/ℚ with good ordinary reduction at p, (ρ̄\_{E,p}|\_{G\_{ℚ\_p}})^{ss} = u ⊕ u^{-1}χ̄\_cyc with u unramified, u(Frob\_p) = a\_p mod p; this has the form χ̄ ⊕ χ̄χ̄\_cyc exactly when a\_p ≡ ±1 mod p, and then the first clause of T1.7 fails.
- `fwResidual_A37_steinberg` (agreement): For E/ℚ with split multiplicative reduction at ℓ and p ∤ ord\_ℓ(Δ\_E), ρ̄\_{E,p} is ramified at ℓ with dim ρ̄^{I\_ℓ} = 1, so A37 holds for ℓ ∥ N (Tate curve).
- `fwResidual_scalar_case` (degenerate): If (ρ̄|\_{G\_{ℚ\_p}})^{ss} ≅ χ̄ ⊕ χ̄, the endomorphism algebra of a split ρ̄|\_{G\_{ℚ\_p}} is M\_2(𝔽), so N3 fails.

**Prerequisites.** `GlobalGaloisDeformations:R04.2/universal-deformation-ring`, `GL2ModularityLifting:R32.1/quadratic-cyclotomic-irreducibility`, `GL2ModularityLifting:R32.1/exceptional-local-cases`, `GL2ModularityLifting:R32.1/p-star`.

**Sources.**

- FW-v3, Assumption 2.1, p. 17; Assumption 3.5, p. 24; Assumption 3.7, p. 25; Thm 1.7, p. 7; Thm 5.1, p. 68: The residual hypotheses of the deformation-theoretic part and of the main theorems.
- NAK-v2, Thm 1.1 (1)–(5) and Remark 1.2, pp. 4–5: Nakamura's hypotheses, with the remark that (2) and (5) can be removed for the promodular ring and why (1), (3), (4) are needed.

### The universal deformation ring is a reduced complete intersection, finite free over Λ, and equal to the Hecke algebra

`AutomorphicCongruences:L3/universal-deformation-ring-structure` (theorem). Planet: Universal deformation ring.

**Statement.** Under FW Assumption 2.1 (L3/fw-residual-hypotheses), the universal deformation ring R\_Σ(ρ̄) of ρ̄ unramified outside Σ is a flat O-algebra which is a complete intersection of Krull dimension 4 (FW Prop. 2.4); there is a Zariski-dense open X^sm ⊂ Spec R\_Σ(ρ̄) containing every point that is ordinary up to twist (if ρ̄|\_{G\_{ℚ\_p}} is reducible) or crystalline and short up to twist (if irreducible), at which Spec R^χ\_Σ(ρ̄) → Spec O is formally smooth, and R\_Σ(ρ̄) is reduced (Cor. 2.5); the classical points (up to twist) are Zariski dense, so the surjection R\_Σ(ρ̄) → 𝕋^Σ\_{m\_ρ̄} is an isomorphism (Prop. 2.6); and there is a regular sequence (x\_1, x\_2, x\_3) in 𝕋^Σ\_{m\_ρ̄} making it a finite free module over Λ = O\[\[X\_1, X\_2, X\_3]], such that classical points with the same image in Spec Λ are all crystalline-short (resp. ordinary) up to twist or none are (Cor. 2.7). Finite flatness over the regular ring Λ does not make R\_Σ(ρ̄) regular; the main conjecture over R\_Σ(ρ̄) is formulated through perfect complexes and the regular subring Λ.

**Hypotheses.**

- FW Assumption 2.1; p odd; Σ finite containing p and the ramification of ρ̄.
- The existence of a classical point of the Serre weight (FW cites Edixhoven/Gross–Coleman–Voloch-type results \[31]) and the local deformation rings at p (ordinary or crystalline-short) are inputs.

**Proof outline.**

1. Twisting by canonical square roots of characters in 1 + ϖO identifies R\_Σ(ρ̄) ≅ R^χ\_Σ(ρ̄) ⊗̂ R\_Σ(𝟙), reducing to fixed determinant (proof of FW Prop. 2.4).
2. Fixed determinant: the ordinary (resp. crystalline-short) quotient is cut out by a regular sequence (x\_2, x\_3) and is a finite Hecke algebra at a classical point; a presentation over the local rings gives the complete-intersection property (GlobalGaloisDeformations:R04.3/local-to-global-presentation, global-dimension-lower-bound).
3. Étaleness over O\[\[X\_2, X\_3]] at the classical point gives X^sm (Cor. 2.5); density of classical points as in Böckle's argument gives R\_Σ(ρ̄) ≅ 𝕋 (Prop. 2.6; CompletedCohomologyAndLocalGlobalCompatibility:R31.6/boeckle-r-equals-t).
4. Choose x\_1 from R\_Σ(𝟙) to get the Λ-structure of Cor. 2.7.

**Checks.**

- The Λ-structure depends on the initial classical point; the map Spec 𝕋 → Spec Λ may be ramified, even at classical points, but not at points of X^sm.
- No axiom 'R = T' is imported: the isomorphism is proved from density of classical points and reducedness.

**Prerequisites.** `AutomorphicCongruences:L3/fw-residual-hypotheses`, `GlobalGaloisDeformations:R04.2/universal-deformation-ring`, `GlobalGaloisDeformations:R04.2/fixed-determinant-rings`, `GlobalGaloisDeformations:R04.3/local-to-global-presentation`, `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`, `LocalGaloisDeformationRings:R08.1/local-lifting-ring`, `LocalGaloisDeformationRings:R08.3/pst-deformation-ring`, `LocalGaloisDeformationRings:L7/geraghty-fixed-weight-ordinary-rings`, `LocalGaloisDeformationRings:R08.6/export-fontaine-laffaille-irreducible`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.6/boeckle-r-equals-t`, `GL2ModularityLifting:R32.2/odd-prime-de-rham-lifting`, `DeformationAndDerivedPatchingAlgebra:R03.3/complete-intersection-local`, `DeformationAndDerivedPatchingAlgebra:R03.3/free-of-maximal-depth-regular-local`, `mathlib:IsRegularLocalRing`, `mathlib:IsReduced`.

**Sources.**

- FW-v3, Prop. 2.4 and proof, p. 18; Cor. 2.5, p. 19; Prop. 2.6 and Cor. 2.7 with proofs, p. 20: Flatness and the complete-intersection property, the smooth locus X^sm, R = 𝕋 and the finite free Λ-structure.
- FW-v3, §1.2, p. 9; §1.2.2, p. 14: R\_Σ(ρ̄) ≅ 𝕋 is a reduced complete intersection of relative dimension 3, not known to be factorial; the descent is carried out over the regular ring Λ.

### Classical points of good reduction type exist and are dense

`AutomorphicCongruences:L3/smooth-classical-points` (theorem).

**Statement.** Under FW Assumption 2.1: (i) if ρ̄|\_{G\_{ℚ\_p}} is irreducible there is a crystalline and short classical point λ\_f with R\_Σ(ρ̄) ≅ R\_Σ(ρ̄\_f) (FW Lemma 2.2), and in general a point of Spec 𝕋^Σ\_{m\_ρ̄} that is crystalline-short, crystalline-short up to the quadratic twist ω^{(p−1)/2}, good ordinary, or good ordinary up to a quadratic twist (FW Lemma 2.8, used in the proof of Thm 5.1); (ii) X^sm is Zariski dense and the set of specializations that are not Iwasawa-suitable, or at which Spec 𝕋 is not étale over Spec Λ, has large codimension (FW Props 2.6, 3.16).

**Hypotheses.**

- As stated; Iwasawa-suitable in the sense of FW Def. 3.19.

**Proof outline.**

1. Lemma 2.2: twist so that the inertial weights are fundamental characters of level 2 and use the Serre weight conjecture (now a theorem) to produce a crystalline short form.
2. Lemma 2.8: the analogous statement covering the reducible-at-p case with ordinary points.
3. Density and codimension from Cor. 2.5 and Prop. 3.16.

**Checks.**

- These are the seed points at which L4/etale-point-descent applies L2's crystalline theorem or the ordinary theorem.

**Prerequisites.** `AutomorphicCongruences:L3/universal-deformation-ring-structure`, `SerreWeightAndLevelOptimisation:R20.6`, `LocalGaloisDeformationRings:R08.6/export-fontaine-laffaille-irreducible`.

**Sources.**

- FW-v3, Lemma 2.2 and proof, p. 17; proof of Thm 5.1 (Lemma 2.8), p. 73; Prop. 2.6, p. 20; §3.2.2 (Prop. 3.16), p. 29: Existence of crystalline-short or ordinary points and density of good specializations.

### Fundamental lines over the deformation ring and its quotients

`AutomorphicCongruences:L3/fundamental-line` (construction). Planet: Fundamental line.

**Statement.** Let A be a quotient of 𝕋^Σ\_{m\_ρ̄} or of Λ (for example 𝕋, R(𝔞) = 𝕋/𝔞 for a minimal prime 𝔞, Λ, O\_Iw or O) and T := T\_Σ ⊗ A. The complexes RΓ\_et(ℤ\[1/Σ], T) and RΓ(G\_{ℚ\_ℓ}, T) are perfect and commute with derived base change (FW Lemma 3.17). The Σ-partial fundamental line is the graded invertible A-module Δ\_Σ(T) := Det^{-1}\_A RΓ\_et(ℤ\[1/Σ], T) ⊗\_A Det^{-1}\_A T(−1)^+ (FW Def. 3.18); for A a domain and ℓ ∈ Σ prime to p put X\_ℓ(T) := Det\_A RΓ(G\_{ℚ\_ℓ}/I\_ℓ, T^{I\_ℓ}) if rank T^{I\_ℓ} ≠ 1 and Det\_A\[A —(1−α\_ℓ)→ A] if rank T^{I\_ℓ} = 1, and the fundamental line Δ(T) := Δ\_Σ(T) ⊗ ⊗\_{ℓ∈Σ}(X\_ℓ(T) ⊗ Det^{-1}\_A RΓ(G\_{ℚ\_ℓ}, T)). Any ψ: A → A′ induces Δ\_A(T) ⊗\_A A′ ≅ Δ\_{A′}(T′) for the Σ-partial line, and for the full line when ψ is Iwasawa-suitable; when both are defined, Δ\_A(T) ≅ Det^{-1}RΓ\_et(ℤ\[1/p], T) ⊗ Det^{-1}T(−1)^+ (FW Prop. 3.20).

**Hypotheses.**

- The determinant functor on perfect complexes is the Knudsen–Mumford functor (upstream PadicMeasuresIwasawaAlgebras layer 5.1); T(−1)^+ is the +-part for complex conjugation.

**Proof outline.**

1. Perfectness and base change of étale cohomology complexes (Nekovář's Selmer complexes, FW Lemma 3.17).
2. Define Δ\_Σ and Δ by the determinant functor; the local factors X\_ℓ use the explicit two-term complex when the inertia invariants have rank one.
3. Prop. 3.20: identify Δ with the {p}-partial line through the cone of RΓ(ℤ\[1/Σ]) ⊕ ⊕RΓ(G\_{ℚ\_ℓ}) → ⊕RΓ(G\_{ℚ\_ℓ}/I\_ℓ, T^{I\_ℓ}), and check base change of X\_ℓ when ranks of inertia invariants agree and ψ(α\_ℓ) = α′\_ℓ.

**Checks.**

- Fitting ideals commute with base change but are not principal; characteristic ideals are principal but not defined over the non-normal 𝕋. Fundamental lines are invertible and commute with arbitrary base change, which is why FW use them (FW §1.2.2, pp. 13–14).

**Uses.**

- L3/zeta-trivialization: the zeta morphism trivializes Δ\_Σ(T\_Σ) inside Frac Λ
- L4/fw-universal-family-theorem: the statement Δ\_Σ(T\_Σ) ≅ Λ
- L4/derived-specialization-corrections: the Euler-factor lines X\_ℓ and their base change at non-Iwasawa-suitable points
- ModularIwasawaMainConjectures:L4/fw-universal-family-theorem: the consumer's formulation

**API.**

- `FundLine.partial` (constructor): Δ\_Σ(T) = Det^{-1}RΓ\_et(ℤ\[1/Σ], T) ⊗ Det^{-1}T(−1)^+, a graded invertible A-module.
- `FundLine.full` (constructor): Δ(T) = Δ\_Σ(T) ⊗ ⊗\_ℓ (X\_ℓ(T) ⊗ Det^{-1}RΓ(G\_{ℚ\_ℓ}, T)) for A a domain.
- `FundLine.eulerFactorLine` (data): X\_ℓ(T), with X\_ℓ(T) = Det\[A →(1−α\_ℓ) A] when rank T^{I\_ℓ} = 1.
- `FundLine.baseChange_partial` (compatibility): Δ\_Σ(T) ⊗\_A A′ ≅ Δ\_Σ(T ⊗ A′) for every ring map A → A′.
- `FundLine.baseChange_full` (compatibility): Δ(T) ⊗\_{A,ψ} A′ ≅ Δ(T′) for ψ Iwasawa-suitable (FW Prop. 3.20).
- `FundLine.compare_p` (equivalence): Δ\_A(T) ≅ Det^{-1}RΓ\_et(ℤ\[1/p], T) ⊗ Det^{-1}T(−1)^+ when the latter is defined.
- `FundLine.trivial_of_torsion` (characterisation): Over a regular domain, a trivialization of Δ inside Frac A is A itself iff the corresponding characteristic ideals agree (with ModularIwasawaMainConjectures:L0/zeta-basis-characteristic-equivalence pointwise).

**Unit tests.**

- `fundLine_rank` (computation): For A = O\_Iw and T = T(f)\_Iw with H¹ free of rank one and H² torsion, Δ\_Σ(T) is concentrated in degree zero and is a free O\_Iw-module of rank one.
- `fundLine_eulerFactor_rank_one` (computation): If T^{I\_ℓ} has rank one with Frobenius eigenvalue α\_ℓ, X\_ℓ(T) is the determinant of the two-term complex \[A → A] with differential 1 − α\_ℓ, which after inverting 1 − α\_ℓ is the invertible sub-line (1 − α\_ℓ)^{±1}A of Frac A, the sign fixed by the determinant convention; it is A itself when 1 − α\_ℓ is a unit.
- `fundLine_base_change` (agreement): For ψ: 𝕋 → R(𝔞) the base change of Δ\_Σ(T\_Σ) is Δ\_Σ(T(𝔞)) — the left column of FW (1.2.2).
- `fundLine_not_fitting` (non-example): The Fitting ideal of H² does not commute with the identification Δ\_A(T) ≅ Δ\_{A′}(T′) when H¹ has torsion; replacing Δ by Fitt(H²) breaks FundLine.baseChange\_partial.

**Prerequisites.** `PadicMeasuresIwasawaAlgebras:L5`, `SelmerIwasawaCohomology:L3/selmer-determinant`, `SelmerIwasawaCohomology:L3/iwasawa-finiteness-euler`, `SelmerIwasawaCohomology:L2/selmer-complex`, `ModularIwasawaMainConjectures:L0/iwasawa-fundamental-line`, `AutomorphicCongruences:L3/universal-deformation-ring-structure`.

**Sources.**

- FW-v3, §3.3: Lemma 3.17, Defs 3.18–3.19, Prop. 3.20 and proof, pp. 31–32: The Σ-partial and full fundamental lines over quotients of 𝕋 or Λ and their base change.
- FW-v3, §1.2.2, pp. 12–14: Why fundamental lines rather than characteristic or Fitting ideals.

### Completed (co)homology localized at ρ̄ and its local–global factorization

`AutomorphicCongruences:L3/completed-homology-factorization` (comparison).

**Statement.** Under Nakamura's hypotheses (N1), (N3), (N4) (L3/fw-residual-hypotheses) and FW Assumption 2.1, there are G\_ℚ × G\_Σ-equivariant, 𝕋\_{ρ̄,Σ}-linear topological isomorphisms ρ^m ⊗\_{𝕋} π^m\_p ⊗̂\_𝕋 π̃^m\_{Σ\_0} ≅ Ĥ¹\_{ρ̄,Σ} for Emerton's completed cohomology (Nakamura Thm 2.2; FW Thm 6.10, with π\_p(ρ\_Σ|\_{G\_{ℚ\_p}}) from the p-adic local Langlands correspondence of Colmez, Emerton and Paškūnas, and π\_ℓ the co-Whittaker modules attached to ρ\_Σ|\_{G\_{ℚ\_ℓ}} by the local Langlands correspondence in families), and its dual for the Borel–Moore completed homology H̃^{BM}\_{1,ρ̄,Σ} ≅ (π^m\_p)^\* ⊗ (ρ^m)^\* ⊗ π̃^m\_{Σ\_0} (Nakamura Cor. 2.5, the isomorphism φ\_1 of §4.1). For ℓ ∈ Σ\_0, the invariants π\_ℓ(ρ)^U under U = K\_1(ϖ^m) (m the conductor exponent) are free of rank one and commute with base change to classical points (FW Prop. 6.9, essential vectors).

**Hypotheses.**

- (N1), (N3), (N4); in particular p ≥ 5, which is the range of PadicLocalLanglandsForGL2Qp:R30.5's nodes. FW's extension to p = 3 rests on Paškūnas–Tung's generalization (FW remark after Thm 3.6), which the imported nodes do not cover; the request to R30.5 asks for it. The co-Whittaker families exist (Helm's local Langlands in families, conditional in general in SmoothRepresentationsOfLocalGroups:SR.5, proved in the GL\_2 cases needed by FW Prop. 6.8).

**Proof outline.**

1. Import Emerton's local–global compatibility (CompletedCohomologyAndLocalGlobalCompatibility:R31.4) and the Paškūnas description of the Montréal functor (PadicLocalLanglandsForGL2Qp:R30.5).
2. Verify Nakamura's and FW's hypotheses match the imported theorem's two residual hypotheses; dualize to completed homology (Nakamura §2.3).
3. Essential vectors in families: co-Whittaker modules are unique (FW Prop. 6.7), have the explicit shapes of Prop. 6.8, and their K\_1(ϖ^m)-invariants are free of rank one with base change (Prop. 6.9).

**Checks.**

- RT-AREA-iwasawa-1/28: the edges R31.4 → L3 and R30.5/R30.6 → L3 are realised by these prerequisites; SR.5 supplies the co-Whittaker families.

**Prerequisites.** `CompletedCohomologyAndLocalGlobalCompatibility:R31.4/the-main-local-global-theorem-with-its-two-residual-hypotheses`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.4/dual-local-global-compatibility-for-completed-homology`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.4/local-langlands-families-over-the-hecke-algebra`, `PadicLocalLanglandsForGL2Qp:R30.5/paskunas-endomorphism-rings`, `PadicLocalLanglandsForGL2Qp:R30.5/dual-of-universal-deformation`, `SmoothRepresentationsOfLocalGroups:SR.5/co-whittaker`, `SmoothRepresentationsOfLocalGroups:SR.5/llc-family-conditional`, `SmoothRepresentationsOfLocalGroups:SR.5/essential-vector-contract`, `SmoothRepresentationsOfLocalGroups:SR.5/reduced-family-reconstruction`, `AutomorphicCongruences:L3/fw-residual-hypotheses`.

**Sources.**

- NAK-v2, Thm 2.2, p. 20; Cor. 2.5 (§2.3), p. 25; §4.1 (47), p. 63: The factorization of completed cohomology and its dual for completed Borel–Moore homology, used to define the zeta morphism.
- FW-v3, Props 6.7–6.9, pp. 77–78; Thm 6.10, p. 79: Co-Whittaker modules in families, essential vectors and Emerton's theorem in FW's form.

### The G\_Σ-equivariant zeta morphism on completed homology

`AutomorphicCongruences:L3/equivariant-zeta-morphism-completed-homology` (construction).

**Statement.** For N ≥ 3, n ≥ 1 with prime(Np) = Σ and (n, Σ) = 1, Nakamura constructs from Kato's full-level Hecke-linear zeta classes a ℤ\_p\[GL\_2(ℤ/N)]-linear map z^{Iw}\_{N,n}(k, −): H¹(Y(N), 𝒱^\*\_k)(1) → H¹\_Iw(ℤ\[1/Σ\_n, ζ\_n], H¹(X(N), j\_\*𝒱^\*\_k(2)))\_{Q\_{k,n}} (Prop. 3.8, Q\_{k,n} the multiplicative set of the smoothing factors); after localizing at the non-Eisenstein ideal of ρ̄ it lands in the unlocalized Iwasawa cohomology of H¹(Y(N), 𝒱^\*\_k)\_ρ̄(2) (Cor. 3.14, Prop. 3.15); the limits over p-power level define a continuous 𝕋\_{ρ̄,Σ}\[G\_Σ]-linear map z^{Iw}\_{Σ,n,ρ̄}: H̃^{BM}\_{1,ρ̄,Σ} → H¹\_Iw(ℤ\[1/Σ\_n, ζ\_n], H̃^{BM}\_{1,ρ̄,Σ}(1)) with z(τv) = σ\_{−1}z(v) and the Euler-system norm relations (Thm 3.16); and the weight-k maps are recovered from weight two by tensoring with W = Sym^{k−2}(O²)^\* (Prop. 3.17).

**Hypotheses.**

- Localization at the non-Eisenstein maximal ideal of ρ̄ (absolutely irreducible) is what makes H¹(X(N), j\_\*𝒱) and H¹(Y(N), 𝒱) agree and the map integral.

**Proof outline.**

1. Prop. 3.8: assemble Kato's classes c,d-z\_{N,n}(k, r, r′) into a Hecke- and GL\_2(ℤ/N)-equivariant map, removing the c,d smoothing in the localization Q\_{k,n} (following Fukaya–Kato).
2. Prop. 3.15: integrality after localization at ρ̄, using freeness of Iwasawa cohomology over Λ^0 and the comparison of Kato's zeta values (the source's smoothing element d is corrected in PAPER-NAKAMURA-23/E5).
3. Thm 3.16: pass to the limit over N\_0p^∞ and over levels in Σ\_0; Prop. 3.17 compares weights.

**Checks.**

- The modular input is imported from KatoEulerSystems:L2 (full-level Hecke-linear zeta classes), which says the universal-deformation map is owned here.

**Uses.**

- L3/nakamura-universal-zeta-morphism: z^{Iw}\_{Σ,n,ρ̄} is transported through φ\_1 to define z\_{Σ,n}(ρ^m)
- L3/nakamura-specialization-theorem: Prop. 3.17 and the finite-level maps compute the specialization at classical points

**API.**

- `CompZeta.finiteLevel` (constructor): z^{Iw}\_{N,n}(k, −), ℤ\_p\[GL\_2(ℤ/N)]-linear, valued in the Q\_{k,n}-localized Iwasawa cohomology.
- `CompZeta.integral` (characterisation): After localization at ρ̄ the map is integral (no Q\_{k,n}-denominators).
- `CompZeta.limit` (constructor): z^{Iw}\_{Σ,n,ρ̄} on H̃^{BM}\_{1,ρ̄,Σ}, continuous and 𝕋\_{ρ̄,Σ}\[G\_Σ]-linear.
- `CompZeta.conj` (characterisation): z(τv) = σ\_{−1}z(v) for complex conjugation τ.
- `CompZeta.norm` (characterisation): Cor ∘ z\_{Σ,nl} = z\_{Σ,n} if l | n and P\_l(σ\_l^{-1})z\_{Σ,n} if (l, n) = 1, l ∉ Σ.
- `CompZeta.weight` (compatibility): id\_W ⊗ z^{Iw}\_{N\_0p^∞,n,ρ̄} = z^{Iw}\_{N,n,ρ̄}(k, −) under W ⊗ H̃^{BM}\_1\[1/p] ≅ H¹(Y(N), 𝒱^\*\_{k/E})\_ρ̄(1).

**Unit tests.**

- `compZeta_weight_two` (degenerate): For k = 2, W is trivial and CompZeta.weight is the identity.
- `compZeta_norm_l_divides` (computation): For l | n, corestriction from level nl to n is the identity on the zeta morphism (no Euler factor).
- `compZeta_eisenstein_not_integral` (non-example): Without localization at a non-Eisenstein ρ̄ the map has denominators from the smoothing factors (c² − c^{2−j}σ\_c), so CompZeta.integral fails for the Eisenstein part.
- `compZeta_kato_agreement` (agreement): At finite level N and weight k the map agrees with KatoEulerSystems:L2/full-level-hecke-linear-zeta-classes after removing the smoothing factors.

**Prerequisites.** `KatoEulerSystems:L2/full-level-hecke-linear-zeta-classes`, `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations`, `KatoEulerSystems:L2/hecke-dual-twist-dictionary`, `AutomorphicCongruences:L3/completed-homology-factorization`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`.

**Sources.**

- NAK-v2, §3.2 Prop. 3.8 (p. 48), Cors 3.10–3.11 (p. 52); §3.3 Cor. 3.14, Prop. 3.15 (p. 56); §3.4 Thm 3.16 (p. 60), Prop. 3.17 (p. 61) — statements: The equivariant zeta morphisms at finite level, their integrality after localization, the limit on completed homology and the weight comparison.

### Nakamura's universal zeta morphism

`AutomorphicCongruences:L3/nakamura-universal-zeta-morphism` (construction). Planet: Nakamura's universal zeta morphism.

**Statement.** Let ρ̄: G\_ℚ → GL\_2(𝔽) satisfy (N1)–(N5) of L3/fw-residual-hypotheses (or (N1), (N3), (N4) with R\_{ρ̄,Σ} replaced by the promodular ring 𝕋\_{ρ̄,Σ}), with universal deformation ρ^u over R\_{ρ̄,Σ}. There is a family of R\_{ρ̄,Σ}-linear maps z\_{Σ,n}(ρ^u): (ρ^u)^\* → H¹\_Iw(ℤ\[1/Σn, ζ\_n], (ρ^u)^\*(1)), n ≥ 1 prime to Σ, such that (i) z\_{Σ,n}(ρ^u)(τv) = σ\_{−1}z\_{Σ,n}(ρ^u)(v) for complex conjugation τ; (ii) Cor ∘ z\_{Σ,nl}(ρ^u) = z\_{Σ,n}(ρ^u) if l | n and P\_l(σ\_l^{-1})·z\_{Σ,n}(ρ^u) if (l, n) = 1; (iii) at every point x\_f of Spec R\_{ρ̄,Σ}(ℚ̄\_p) attached to a newform f, z\_{Σ,1}(f) = ∏\_{l∈Σ∖{p}} P\_{f,l}(σ\_l^{-1})·z(f) with P\_{f,l}(u) = det(1 − Frob\_l u | ρ\_f^{I\_l}) (Nakamura Thm 1.1, Cor. 4.2, Thm 4.3). Condition (i) makes z\_{Σ,n}(ρ^u) an R ⊗̂ Λ\_n-linear map on (ρ^u)^\* ⊗̂\_{ℤ\_p\[±1]} Λ\_n (Remark 1.2). It is defined by transporting z^{Iw}\_{Σ,n,ρ̄} along φ\_1 (L3/completed-homology-factorization), factoring out the projective envelope P̃ and applying the Whittaker functor Ψ\_{Σ\_0} at the primes of Σ\_0 (§4.1, Lemma 4.1).

**Hypotheses.**

- (N1)–(N5); FW's version (FW Thm 3.6) works under Assumptions 2.1 and 3.5 and removes p ≥ 5 via Paškūnas–Tung's generalization of the relevant local results (FW remark after Thm 3.6).

**Proof outline.**

1. Lemma 4.1: φ\_1 induces an isomorphism H¹\_Iw(ℤ\[1/Σ\_n, ζ\_n], H̃^{BM}\_{1,ρ̄,Σ}(1)) ≅ (π^m\_p)^\* ⊗̂ H¹\_Iw(ℤ\[1/Σ\_n, ζ\_n], (ρ^m)^\*(1) ⊗ π̃^m\_{Σ\_0}), via a perfect complex computing Iwasawa cohomology.
2. Remove the factor (π^m\_p)^\* using Paškūnas's identification of P̃ with the dual of the universal deformation of π̄ (removing-projective-envelope), and apply the Whittaker functor to π̃^m\_{Σ\_0}, which is co-Whittaker so that Ψ\_{Σ\_0}(π̃) ≅ 𝕋 (§4.1).
3. Properties (i)–(ii) follow from Thm 3.16 (Cor. 4.2); (iii) is L3/nakamura-specialization-theorem.

**Checks.**

- It is the morphism FW call z\_Σ: T\_Σ(−1)^+ → H¹(ℤ\[1/Σ], T\_Σ) (FW Thm 3.6) after the identifications of FW §3.2.1.

**Uses.**

- L3/zeta-trivialization: z\_Σ trivializes the fundamental line Δ\_Σ(T\_Σ)
- L4/zeta-morphism-congruences: congruent newforms have congruent Euler-corrected zeta morphisms because they are specializations of one z\_{Σ,n}(ρ^u)
- L4/residual-zeta-morphism: base change to 𝔽 gives z\_{Σ,n}(ρ̄)

**API.**

- `NakamuraZeta.map` (constructor): z\_{Σ,n}(ρ^u): (ρ^u)^\* → H¹\_Iw(ℤ\[1/Σn, ζ\_n], (ρ^u)^\*(1)), R\_{ρ̄,Σ}-linear.
- `NakamuraZeta.conj` (characterisation): z(τv) = σ\_{−1}z(v); hence R ⊗̂ Λ\_n-linearity on (ρ^u)^\* ⊗̂\_{ℤ\_p\[±1]} Λ\_n.
- `NakamuraZeta.norm` (characterisation): The Euler-system norm relations in n.
- `NakamuraZeta.specialize` (compatibility): Base change along x: R\_{ρ̄,Σ} → A commutes with Iwasawa cohomology (perfect complexes) and gives z\_{Σ,n}(ρ\_x).
- `NakamuraZeta.changeSigma` (compatibility): For Σ ⊂ Σ′, z\_{Σ′,n}(ρ^m\_{Σ′}) ⊗ id = ∏\_{l∈Σ′∖Σ} P\_l(σ\_l^{-1})·z\_{Σ,n}(ρ^m\_Σ) (Nakamura (79)).
- `NakamuraZeta.classical` (characterisation): At a newform point, z\_{Σ,1}(f) = ∏\_{l∈Σ\_0} P\_{f,l}(σ\_l^{-1})·z(f) (Thm 4.3).

**Unit tests.**

- `nakamuraZeta_norm_coprime` (computation): For l ∉ Σ, (l, n) = 1, Cor ∘ z\_{Σ,nl} = P\_l(σ\_l^{-1})·z\_{Σ,n} with P\_l(u) = det(1 − Frob\_l u | ρ^u) of degree two in u.
- `nakamuraZeta_sigma_p_only` (degenerate): If Σ = {p} (ρ̄ unramified outside p), the Euler factor in NakamuraZeta.classical is empty and z\_{Σ,1}(f) = z(f).
- `nakamuraZeta_kato_point` (agreement): At a weight-two newform of an elliptic curve E of conductor N, the specialization is ∏\_{l | N} P\_{E,l}(σ\_l^{-1}) times Kato's zeta morphism of E (KatoEulerSystems:L2/nakamura-twisted-zeta-morphism).
- `nakamuraZeta_needs_irreducible` (non-example): For residually reducible ρ̄ (Eisenstein) the construction is not available: Emerton's factorization and Kato's Λ-freeness of H¹\_Iw are only known for absolutely irreducible ρ̄ (Nakamura Remark 1.2).

**Prerequisites.** `AutomorphicCongruences:L3/equivariant-zeta-morphism-completed-homology`, `AutomorphicCongruences:L3/completed-homology-factorization`, `AutomorphicCongruences:L3/universal-deformation-ring-structure`, `PadicLocalLanglandsForGL2Qp:R30.5/removing-projective-envelope`, `PadicLocalLanglandsForGL2Qp:R30.5/dual-of-universal-deformation`, `SmoothRepresentationsOfLocalGroups:SR.5/universal-whittaker`, `SmoothRepresentationsOfLocalGroups:SR.5/co-whittaker`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`.

**Sources.**

- NAK-v2, Thm 1.1 and Remark 1.2, pp. 4–5; §4.1 (47)–(48), Lemma 4.1 and the construction, pp. 63–65; Cor. 4.2, p. 65: The universal zeta morphisms and their τ-equivariance and Euler-system relations (published §4.1, pp. 239–242).
- FW-v3, §3.2.1, Assumption 3.5 and Thm 3.6, p. 24: Fouquet–Wan's statement of Nakamura's theorem and the removal of p ≥ 5.

### The universal zeta morphism specializes to Kato's

`AutomorphicCongruences:L3/nakamura-specialization-theorem` (theorem). Planet: Specialization to Kato's zeta morphism.

**Statement.** Under the assumptions of Nakamura §4 ((N1), (N3), (N4)), for every modular point x\_f ∈ Spec(𝕋\_{ρ̄,Σ})(E) attached to a newform f ∈ S\_k(Γ\_1(N\_f))^{new} of weight k ≥ 2 and every n ≥ 1 prime to Σ, z\_{Σ,n}(f) = ∏\_{l∈Σ\_0} P\_{f,l}(σ\_l^{-1})·z\_n(f) as maps V′\_1(f)\_E → H¹\_Iw(ℤ\[1/Σn, ζ\_n], V′\_1(f)\_E(1)) under V′\_1(f)\_E ≅ ρ\_f^\* (55), where z\_n(f) is Kato's (Nakamura-twisted) zeta morphism and Σ\_0 = Σ ∖ {p}; the equality does not depend on the choice of (55) since End\_{E\[G\_ℚ]}(ρ\_f) = E (Nakamura Thm 4.3, Remark 4.4). In particular the morphism specializes to the Kato class used in KatoEulerSystems:L3–L4.

**Hypotheses.**

- (N1), (N3), (N4); x\_f modular.

**Proof outline.**

1. Let τ be the Galois type of ρ\_f|\_{G\_{ℚ\_p}} and ⋄ = cr or st; x\_f factors through Kisin's potentially semistable (crystalline) quotient R^⋄\_p(k, τ) (Nakamura Thm 4.5).
2. Paškūnas's result (Thm 4.7) makes M^⋄(k, τ) ⊗ 𝕋^⋄ free of rank one at x\_f; Cor. 4.8 and Prop. 4.9 identify σ^⋄(k, τ) ⊗ H̃^{BM}\_{1,ρ̄,Σ} with the classical cohomology H¹\_{Σ\_0}(𝒱^\*\_{k/E}(σ^⋄(τ)))\_ρ̄(1).
3. Under these identifications z\_{Σ,n}(f) is the base change of Ψ\_{Σ\_0}(z^{Iw}\_{Σ\_0,n,ρ̄}(k, σ^⋄(τ), −)); comparing motivic structures with Kato's construction (Nakamura §4.4, (68)–(78)) gives the equality with the Euler factors at Σ\_0.

**Checks.**

- The Euler factors at Σ\_0 are exactly those of NakamuraZeta.classical; dropping them would contradict the change-of-Σ formula (79).

**Prerequisites.** `AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`, `AutomorphicCongruences:L3/equivariant-zeta-morphism-completed-homology`, `KatoEulerSystems:L2/nakamura-twisted-zeta-morphism`, `KatoEulerSystems:L2/rational-kato-zeta-morphism`, `LocalGaloisDeformationRings:R08.3/pst-deformation-ring`, `PadicLocalLanglandsForGL2Qp:R30.6/paskunas-bm-scalar-endomorphisms`, `PadicLocalLanglandsForGL2Qp:R30.6/kisin-local-inequality`, `PadicLocalLanglandsForGL2Qp:R30.5/kisin-deformation-comparison`.

**Sources.**

- NAK-v2, Thm 4.3 and Remark 4.4, p. 66; §4.3 Thms 4.5, 4.7, Cor. 4.8, Prop. 4.9, pp. 66–70; §4.4 proof: The specialization theorem and its proof through Kisin's and Paškūnas's results (published Thm 4.3 p. 243, proof pp. 249–253).
- FW-v3, Thm 3.6, p. 24: The diagram expressing that z\_Σ specializes to z(f)\_{Σ,Iw} at classical points.

### The zeta trivialization of the fundamental line

`AutomorphicCongruences:L3/zeta-trivialization` (construction). Planet: Zeta trivialization.

**Statement.** Let z\_Σ: T\_Σ(−1)^+ → H¹\_et(ℤ\[1/Σ], T\_Σ) be Nakamura's zeta morphism (FW Thm 3.6). Since H²\_et(ℤ\[1/Σ], T\_Σ) is torsion and H¹ has generic rank equal to that of T\_Σ(−1)^+ over 𝕋 (or over Λ), z\_Σ determines an injective trivialization triv\_{z\_Σ}: Δ\_Σ(T\_Σ) ↪ Q(𝕋^Σ\_{m\_ρ̄}), equivalently an isomorphism Δ\_Σ ≅ (x/y)𝕋 for an invertible fractional ideal (FW (1.2.1)); over Λ it gives triv\_{z\_Σ}: Δ\_Σ(T\_Σ) ↪ Frac Λ (Conj. 3.30's map). For every specialization λ: 𝕋 → R(𝔞) to a minimal prime and every classical point λ\_f: R(𝔞) → O\_Iw there are commutative diagrams relating triv\_{z\_Σ}, triv\_{z(𝔞)} and triv\_{z(f)\_Iw} (FW (1.2.2), (1.2.3), Props 3.22–3.23), and for Iwasawa-suitable λ the same holds for the full fundamental lines with Euler factors.

**Hypotheses.**

- FW Assumptions 2.1, 3.5; the specializations in the diagrams with full lines are Iwasawa-suitable (Def. 3.19).

**Proof outline.**

1. Torsion of H² and the rank of H¹ over the total fraction ring (Kato's results at classical points, density) make Det^{-1}RΓ ⊗ Det^{-1}T(−1)^+ ⊗ Q(𝕋) canonically trivial once a generator of the image of z\_Σ is chosen.
2. Compatibility with base change (L3/fundamental-line) and with specialization of z\_Σ (L3/nakamura-specialization-theorem) gives the diagrams (FW Props 3.22–3.23).
3. Over Λ, view T\_Σ as a free Λ-module of rank 2d and repeat (FW proof of Prop. 5.5).

**Checks.**

- The universal main conjecture is the statement that the image of triv\_{z\_Σ} is 𝕋 (resp. Λ); over the non-factorial 𝕋 this cannot be deduced from pointwise statements, which is why the family statement is made over Λ.

**Uses.**

- L3/kato-generalized-main-conjecture: the conjectures assert the image of triv is the whole ring
- L4/integrality-of-universal-trivialization: FW Prop. 5.5 shows triv sends Δ^{-1} into Λ
- L4/family-to-point-limit: the diagram at a classical point is the one used in the limit argument

**API.**

- `ZetaTriv.map` (constructor): triv\_{z\_Σ}: Δ\_Σ(T\_Σ) ↪ Q(𝕋), injective, image an invertible fractional ideal (x/y)𝕋.
- `ZetaTriv.overLambda` (constructor): triv\_{z\_Σ,Λ}: Δ\_Σ(T\_Σ) ↪ Frac Λ, viewing T\_Σ over Λ.
- `ZetaTriv.specialize` (compatibility): Diagram (1.2.2) for 𝕋 → R(𝔞) and (1.2.3) for R(𝔞) → O\_Iw.
- `ZetaTriv.full` (compatibility): For Iwasawa-suitable λ, the analogous diagram for the full lines Δ with Euler-factor lines X\_ℓ.
- `ZetaTriv.image` (projection): The fractional ideal (x/y) ⊂ Q(𝕋) (resp. α Λ ⊂ Frac Λ) that the main conjecture predicts to be the unit ideal.
- `ZetaTriv.pointwise` (compatibility): At a classical point, triv\_{z(f)\_Iw} is Kato's trivialization of Δ(f)\_Iw (FW Thm 3.4).

**Unit tests.**

- `zetaTriv_unit_iff_mc` (characterisation): At a classical point with O\_Iw regular, triv\_{z(f)\_Iw}(Δ) = O\_Iw iff char H² = char(H¹/z(f)\_Iw) (Kato's main conjecture).
- `zetaTriv_eisenstein_excluded` (non-example): For residually reducible ρ̄ no z\_Σ is available and ZetaTriv.map is undefined.
- `zetaTriv_base_change_point` (computation): For λ: Λ → O at a point étale over Λ with fibre S\_x, the specialization of α Λ is the product over ψ ∈ S\_x of the pointwise images (FW proof of Prop. 5.7).
- `zetaTriv_regular_vs_deformation_ring` (degenerate): If the deformation problem is unobstructed, 𝕋 = Λ is itself a power series ring and ZetaTriv.map and ZetaTriv.overLambda coincide.

**Prerequisites.** `AutomorphicCongruences:L3/fundamental-line`, `AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`, `AutomorphicCongruences:L3/nakamura-specialization-theorem`, `AutomorphicCongruences:L3/universal-deformation-ring-structure`, `KatoEulerSystems:L4/rational-iwasawa-module-structure`, `ModularIwasawaMainConjectures:L0/iwasawa-fundamental-line`.

**Sources.**

- FW-v3, §1.2.2 (1.2.1)–(1.2.3), pp. 13–14; §3.3 Props 3.22–3.23, p. 33; Conj. 3.30, p. 36: The trivialization defined by the zeta morphism and its compatibility diagrams.
- FW-v3, Def. 3.19, p. 31; Props 3.14–3.16, pp. 27–29: Iwasawa-suitable specializations.

### Kato's generalized main conjecture for the universal family and its specializations

`AutomorphicCongruences:L3/kato-generalized-main-conjecture` (definition).

**Statement.** For an Iwasawa-suitable specialization λ: 𝕋^Σ\_{m\_ρ̄} → S (S a regular domain), the generalized main conjecture for λ is the proposition that the trivialization triv\_{z(λ)} of L3/zeta-trivialization is an isomorphism Δ(T\_λ) ≅ S (FW Conjs 3.24–3.25; at a classical point λ(f)\_Iw: 𝕋 → O\_Iw this is Kato's main conjecture, FW Conj. 1.5 / Conj. 3.24); for a minimal prime 𝔞 it is Δ(T(𝔞)) ≅ R(𝔞) (Conj. 3.27); and the universal-family conjecture is the proposition that triv\_{z\_Σ}: Δ\_Σ(T\_Σ) ↪ Frac Λ induces Δ\_Σ(T\_Σ) ≅ Λ over the regular subring Λ = O\[\[X\_1, X\_2, X\_3]] (Conj. 3.30, Kato's Conjecture 3.2.2 for (Spec ℤ\[1/Σ], Λ, T\_Σ)). The stronger statement over 𝕋 itself (Conj. 3.26) is a separate proposition.

**Hypotheses.**

- The propositions are stated, not assumed; Λ-structure as in L3/universal-deformation-ring-structure.

**Proof outline.**

1. Define each conjecture as the proposition that the image of the corresponding trivialization is the unit fractional ideal.
2. Record the implications: Conj. 3.26 (over 𝕋) ⇒ Conj. 3.30 (over Λ) by restriction of scalars; Conj. 3.30 ⇒ Conj. 3.24 at classical points is FW Prop. 5.8 (L4/family-to-point-limit).

**Checks.**

- Distinguishes the regular-subring statement of FW Thm 1.8 from the stronger statement over the deformation ring (stage L4's requirement).

**Uses.**

- L4/fw-universal-family-theorem: proves Conj. 3.30
- L4/fw-pointwise-theorem: proves Conj. 3.24 at every classical point under FW Thm 5.1's hypotheses
- ModularIwasawaMainConjectures:L2/fw-pointwise-theorem: consumer restatement

**API.**

- `GenMC.point` (constructor): Conj. 3.24/3.25 for an Iwasawa-suitable λ: the proposition triv\_{z(λ)}(Δ(T\_λ)) = S.
- `GenMC.component` (constructor): Conj. 3.27 for R(𝔞).
- `GenMC.family` (constructor): Conj. 3.30 over Λ.
- `GenMC.familyOverT` (constructor): Conj. 3.26 over 𝕋, a separate and stronger proposition.
- `GenMC.familyOverT_imp_family` (relation): GenMC.familyOverT → GenMC.family.
- `GenMC.point_iff_kato` (equivalence): At a classical point, GenMC.point is Kato's main conjecture char H² = char(H¹/z(f)\_Iw) (ModularIwasawaMainConjectures:L0/zeta-basis-characteristic-equivalence).

**Unit tests.**

- `genMC_trivial_family` (degenerate): If 𝕋 = Λ (unobstructed), GenMC.familyOverT and GenMC.family are the same proposition.
- `genMC_point_kato` (agreement): At λ(f)\_Iw with f of weight two attached to E/ℚ with L(E,1) ≠ 0, GenMC.point specializes at the trivial character to the p-part of the BSD formula (FW Cor. 5.4).
- `genMC_fitting_not_enough` (non-example): Replacing 'image is the unit ideal' by 'the Fitting ideal of H² contains the image' is strictly weaker when H² has a nonzero pseudo-null submodule.
- `genMC_component_vs_point` (characterisation): GenMC.component for 𝔞 implies GenMC.point at every classical point of R(𝔞) that is Iwasawa-suitable, by ZetaTriv.specialize.

**Prerequisites.** `AutomorphicCongruences:L3/zeta-trivialization`, `AutomorphicCongruences:L3/fundamental-line`, `ModularIwasawaMainConjectures:L0/kato-main-conjecture`, `ModularIwasawaMainConjectures:L0/zeta-basis-characteristic-equivalence`.

**Sources.**

- FW-v3, Conjs 3.24–3.27, p. 34; Conj. 3.30, p. 36; Conj. 1.5, p. 6; Thm 1.8, p. 8: The pointwise, minimal-prime and universal-family forms of Kato's generalized main conjecture.

### Dependencies of layer L3

Inside this roadmap and on other roadmaps (node and stage ids): `CompletedCohomologyAndLocalGlobalCompatibility:R31.4/dual-local-global-compatibility-for-completed-homology`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.4/local-langlands-families-over-the-hecke-algebra`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.4/the-main-local-global-theorem-with-its-two-residual-hypotheses`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.6/boeckle-r-equals-t`, `DeformationAndDerivedPatchingAlgebra:R03.3/complete-intersection-local`, `DeformationAndDerivedPatchingAlgebra:R03.3/free-of-maximal-depth-regular-local`, `GL2ModularityLifting:R32.1/exceptional-local-cases`, `GL2ModularityLifting:R32.1/p-star`, `GL2ModularityLifting:R32.1/quadratic-cyclotomic-irreducibility`, `GL2ModularityLifting:R32.2/odd-prime-de-rham-lifting`, `GlobalGaloisDeformations:R04.2/fixed-determinant-rings`, `GlobalGaloisDeformations:R04.2/universal-deformation-ring`, `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`, `GlobalGaloisDeformations:R04.3/local-to-global-presentation`, `KatoEulerSystems:L2/full-level-hecke-linear-zeta-classes`, `KatoEulerSystems:L2/hecke-dual-twist-dictionary`, `KatoEulerSystems:L2/nakamura-twisted-zeta-morphism`, `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations`, `KatoEulerSystems:L2/rational-kato-zeta-morphism`, `KatoEulerSystems:L4/rational-iwasawa-module-structure`, `LocalGaloisDeformationRings:L7/geraghty-fixed-weight-ordinary-rings`, `LocalGaloisDeformationRings:R08.1/local-lifting-ring`, `LocalGaloisDeformationRings:R08.3/pst-deformation-ring`, `LocalGaloisDeformationRings:R08.6/export-fontaine-laffaille-irreducible`, `ModularIwasawaMainConjectures:L0/iwasawa-fundamental-line`, `ModularIwasawaMainConjectures:L0/kato-main-conjecture`, `ModularIwasawaMainConjectures:L0/zeta-basis-characteristic-equivalence`, `PadicLocalLanglandsForGL2Qp:R30.5/dual-of-universal-deformation`, `PadicLocalLanglandsForGL2Qp:R30.5/kisin-deformation-comparison`, `PadicLocalLanglandsForGL2Qp:R30.5/paskunas-endomorphism-rings`, `PadicLocalLanglandsForGL2Qp:R30.5/removing-projective-envelope`, `PadicLocalLanglandsForGL2Qp:R30.6/kisin-local-inequality`, `PadicLocalLanglandsForGL2Qp:R30.6/paskunas-bm-scalar-endomorphisms`, `PadicMeasuresIwasawaAlgebras:L5`, `SelmerIwasawaCohomology:L2/selmer-complex`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-finiteness-euler`, `SelmerIwasawaCohomology:L3/selmer-determinant`, `SerreWeightAndLevelOptimisation:R20.6`, `SmoothRepresentationsOfLocalGroups:SR.5/co-whittaker`, `SmoothRepresentationsOfLocalGroups:SR.5/essential-vector-contract`, `SmoothRepresentationsOfLocalGroups:SR.5/llc-family-conditional`, `SmoothRepresentationsOfLocalGroups:SR.5/reduced-family-reconstruction`, `SmoothRepresentationsOfLocalGroups:SR.5/universal-whittaker`.

### Acceptance for layer L3

Coverage: **planned**. R = T is proved from density of classical points and reducedness (FW Prop. 2.6), not imported as an axiom. Completed cohomology, p-adic local Langlands and co-Whittaker inputs are imported from R31.4, R30.5–R30.6 and SR.5 (RT-AREA-iwasawa-1/28).

- Refinement: Decompose Nakamura §§2–4 (completed homology duality, the equivariant zeta morphisms at finite level, Paškūnas's freeness Thm 4.7, the motivic comparison of §4.4) into lemma nodes.
- Refinement: Decompose FW §3.2.2 (Iwasawa-suitable specializations, Props 3.14–3.16) behind L3/zeta-trivialization.

## Layer L4: Integral descent and specialization

Fouquet and Wan descend from seed points of known type to the universal-family statement over Λ, using that Λ is factorial, and from the family to every classical point by a limit argument with Euler-factor-corrected lines. Nakamura's §5 deduces the residual zeta morphism, its relation to µ-invariants and the constancy of the λ-defect.

### The zeta trivialization over Λ is integral

`AutomorphicCongruences:L4/integrality-of-universal-trivialization` (theorem).

**Statement.** Under the hypotheses of FW Thm 5.1, the trivialization triv\_{z\_Σ}: Δ\_Σ(T\_Σ) ↪ Frac(Λ) of L3/zeta-trivialization sends Δ\_Σ(T\_Σ)^{-1} into Λ; equivalently its image is αΛ for some α ∈ Λ (FW Prop. 5.5).

**Hypotheses.**

- FW Thm 5.1's residual hypotheses; Λ = O\[\[X\_1, X\_2, X\_3]] factorial and regular.

**Proof outline.**

1. Suppose the image of Δ^{-1} is (x/y)Λ with x/y ∉ Λ; since Λ is factorial there is a height-one prime 𝔭 = (y\_0) containing y but not x.
2. By density (L3/smooth-classical-points) choose an Iwasawa-suitable λ\_Iw, étale over Λ, with λ(y\_0) ∈ m^n\_{O\_Iw} and λ(x) ∉ m^n for large n; at such a point T\_{λ,Iw} is a lattice in a direct sum of classical representations V\_{λ,r,Iw}.
3. Kato's one-sided divisibility at each classical point (KatoEulerSystems:L4/cohomological-divisibility-one-direction, integral where T\_{λ,Iw} has the needed image) gives triv(Δ^{-1}) ⊆ O\_Iw at λ, contradicting λ(x/y) ∉ O\_Iw.

**Checks.**

- This uses only Kato's divisibility and density; Zariski density alone is not used to conclude that a rational section is an integral generator — the height-one prime argument over the factorial Λ is.

**Prerequisites.** `AutomorphicCongruences:L3/zeta-trivialization`, `AutomorphicCongruences:L3/smooth-classical-points`, `AutomorphicCongruences:L3/universal-deformation-ring-structure`, `KatoEulerSystems:L4/cohomological-divisibility-one-direction`, `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`, `mathlib:UniqueFactorizationMonoid`.

**Sources.**

- FW-v3, Prop. 5.5 and proof, pp. 70–71: The image of Δ\_Σ(T\_Σ)^{-1} lies in Λ, by a height-one prime of the factorial ring Λ and Kato's bound at well-chosen classical points.

### From pointwise main conjectures at an étale point to the family over Λ

`AutomorphicCongruences:L4/etale-point-descent` (theorem).

**Statement.** Suppose there is a point x: Λ → O at which Spec 𝕋^Σ\_{m\_ρ̄} → Spec Λ is étale and every point ψ: 𝕋 → O above x satisfies Kato's main conjecture (FW Conj. 3.24). Then triv\_{z\_Σ}: Δ\_Σ(T\_Σ) ↪ Frac(Λ) is an isomorphism onto Λ (FW Prop. 5.7).

**Hypotheses.**

- As stated; all λ\_Iw above x are Iwasawa-suitable because of étaleness.

**Proof outline.**

1. By L4/integrality-of-universal-trivialization the image of Δ^{-1} is αΛ with α ∈ Λ.
2. Specialize along x\_Iw: by the base-change diagram (FW Prop. 3.23; L3/zeta-trivialization), x\_Iw(α)O\_Iw is the product over ψ ∈ S\_x of the pointwise images, each O\_Iw by hypothesis, so x\_Iw(α) is a unit.
3. An element of the local ring Λ whose specialization is a unit is a unit; hence αΛ = Λ.

**Checks.**

- The descent is over the regular ring Λ, not over 𝕋: over the non-factorial 𝕋 an invertible module trivial at a point need not be trivial.

**Prerequisites.** `AutomorphicCongruences:L4/integrality-of-universal-trivialization`, `AutomorphicCongruences:L3/zeta-trivialization`, `AutomorphicCongruences:L3/kato-generalized-main-conjecture`, `mathlib:IsLocalRing`.

**Sources.**

- FW-v3, Prop. 5.7 and proof, pp. 71–72: An étale point all of whose preimages satisfy the pointwise conjecture forces the family conjecture over Λ.

### Fouquet–Wan's universal-family main conjecture

`AutomorphicCongruences:L4/fw-universal-family-theorem` (theorem). Planet: Fouquet–Wan universal-family theorem.

**Statement.** Let p ≥ 3 and ρ̄: G\_ℚ → GL\_2(𝔽) satisfy the hypotheses of FW Thm 5.1 (absolutely irreducible; (ρ̄|\_{G\_{ℚ\_p}})^{ss} ≠ χ̄ ⊕ χ̄χ̄\_cyc; a prime ℓ ∤ p with ρ̄|\_{G\_{ℚ\_ℓ}} a ramified extension of µχ^{−k/2}\_cyc by µχ^{1−k/2}\_cyc, µ unramified and nontrivial if ρ̄|\_{G\_{ℚ\_p}} is irreducible). For Σ finite, viewing the universal deformation T\_Σ as a free module over Λ ≅ O\[\[X\_1, X\_2, X\_3]], the zeta morphism z\_Σ induces an isomorphism triv\_{z\_Σ}: Δ\_Σ(T\_Σ) ≅ Λ (FW Thm 5.2 = Thm 1.8; Kato's Conjecture 3.2.2 for (Spec ℤ\[1/Σ], Λ, T\_Σ)). The statement is over the regular subring Λ; the stronger statement over 𝕋 ≅ R\_Σ(ρ̄) itself is not asserted.

**Hypotheses.**

- FW Thm 5.1's residual hypotheses (L3/fw-residual-hypotheses, T1.7) together with Assumptions 2.1 and 3.5 where the construction of z\_Σ needs them.

**Proof outline.**

1. Find a seed point: by FW Lemma 2.8 (L3/smooth-classical-points) there is a classical point that is crystalline-short, crystalline-short up to the quadratic twist ω^{(p−1)/2}, good ordinary, or good ordinary up to quadratic twist.
2. At such a point Kato's main conjecture holds (FW Prop. 5.6): crystalline-short points by L2/fw-crystalline-main-conjecture (Thm 4.51), ordinary points by the ordinary theorem — the ordinary seed is the equality of ModularIwasawaMainConjectures:L1/fw-ordinary-theorem, which combines L2/fw-ordinary-reverse-bound with Kato's bound; twists are handled in the same way.
3. Points near the seed that are étale over Λ and of the same type satisfy the pointwise conjecture; apply L4/etale-point-descent.

**Checks.**

- Exported to ModularIwasawaMainConjectures:L4/fw-universal-family-theorem; the determinant over Λ must not be read as a statement over the deformation ring.

**Prerequisites.** `AutomorphicCongruences:L4/etale-point-descent`, `AutomorphicCongruences:L4/integrality-of-universal-trivialization`, `AutomorphicCongruences:L3/smooth-classical-points`, `AutomorphicCongruences:L3/kato-generalized-main-conjecture`, `AutomorphicCongruences:L2/fw-crystalline-main-conjecture`, `AutomorphicCongruences:L2/fw-ordinary-reverse-bound`, `ModularIwasawaMainConjectures:L1/fw-ordinary-theorem`.

**Sources.**

- FW-v3, Thm 5.2, p. 69; Thm 1.8, p. 8; Prop. 5.6, p. 71; proof of Thm 5.1, p. 73: The universal-family isomorphism over Λ and its proof from a seed point of known type.

### From the family over Λ to every classical point

`AutomorphicCongruences:L4/family-to-point-limit` (theorem).

**Statement.** Suppose triv\_{z\_Σ}: Δ\_Σ(T\_Σ) ≅ Λ (L4/fw-universal-family-theorem). Then for every classical point λ(f): 𝕋^Σ\_{m\_ρ̄} → O, including points ramified over Λ, triv\_{z(f)\_Iw}: Δ\_Σ(T(f)\_Iw) ≅ O\_Iw, i.e. Kato's main conjecture holds for λ(f) (FW Prop. 5.8).

**Hypotheses.**

- As stated; the Σ-partial lines and the Euler-factor-corrected morphisms are used, which both commute with specialization at a classical point even if it is ramified over Λ.

**Proof outline.**

1. Kato's divisibility gives triv\_{z(f)\_Iw}(Δ\_Σ(T(f)\_Iw)^{-1}) ⊆ O\_Iw, so its image is (1/γ)O\_Iw.
2. Over 𝕋 write the image of Δ\_Σ as (α/β)𝕋 with λ(f)\_Iw(β) ≠ 0 (FW Prop. 3.23).
3. Choose λ close to λ(f), outside the zero set of β, étale over Λ with all points above Iwasawa-suitable; the family isomorphism forces each pointwise γ\_ψ to be a unit there, so λ\_Iw(α/β) is a unit.
4. By continuity, taking λ close to λ(f), 1/γ = λ(f)\_Iw(α/β) is a unit.

**Checks.**

- A specialization at which a value vanishes is never cancelled: the argument avoids the zero set of β and works with the Euler-factor-corrected lines.

**Prerequisites.** `AutomorphicCongruences:L4/fw-universal-family-theorem`, `AutomorphicCongruences:L3/zeta-trivialization`, `AutomorphicCongruences:L3/smooth-classical-points`, `AutomorphicCongruences:L3/fundamental-line`, `KatoEulerSystems:L4/cohomological-divisibility-one-direction`.

**Sources.**

- FW-v3, Prop. 5.8 and proof, pp. 72–73: The limit argument: family isomorphism over Λ implies the pointwise main conjecture at every classical point.

### Fouquet–Wan's main conjecture at every point of the family

`AutomorphicCongruences:L4/fw-pointwise-theorem` (theorem). Planet: Fouquet–Wan pointwise theorem.

**Statement.** Let p ≥ 3 and f ∈ S\_k(Γ\_0(Np^r)) a normalized eigencuspform of weight k ≥ 2 whose residual representation satisfies the hypotheses of FW Thm 5.1 (L3/fw-residual-hypotheses, T1.7), with the auxiliary prime ℓ satisfying ℓ ∥ N. Then the zeta morphism gives an isomorphism triv\_{z(f)\_Iw}: Δ\_{O\_Iw}(T(f)\_Iw) ≅ O\_Iw (FW Thm 5.1 = Thm 1.7); equivalently char\_{Λ\_Iw}H²(ℤ\[1/p], T ⊗ Λ\_Iw) = char\_{Λ\_Iw}H¹(ℤ\[1/p], T ⊗ Λ\_Iw)/Λ\_Iw·z(f)\_Iw. This covers non-ordinary and bad-reduction points at p (π(f)\_p principal series, Steinberg or supercuspidal) and needs no µ-invariant hypothesis. Consequences: Sel\_ℚ(f) is finite iff L(f, k/2) ≠ 0 (Cor. 5.3), and for an abelian variety of GL\_2-type with L(A,1) ≠ 0 satisfying the hypotheses, the p-part of the BSD formula holds (Cor. 5.4).

**Hypotheses.**

- As stated; the scalar case (ρ̄|\_{G\_{ℚ\_p}})^{ss} ≅ χ̄ ⊕ χ̄ is not excluded by Thm 5.1's displayed hypotheses but enters through Assumptions 2.1/3.5 used for the deformation ring and z\_Σ (source issue ModularIwasawaMainConjectures/E1, which this packet adopts).

**Proof outline.**

1. Apply L4/fw-universal-family-theorem to ρ̄\_f.
2. Apply L4/family-to-point-limit at λ(f) (FW proof of Thm 5.1, p. 73).
3. Translate the fundamental-line statement into characteristic ideals over the regular O\_Iw (L3/kato-generalized-main-conjecture, GenMC.point\_iff\_kato).

**Checks.**

- Exported to ModularIwasawaMainConjectures:L2/fw-pointwise-theorem in the cohomological (Kato) form; the signed or ordinary scalar versions are the consumer's, after its separate local comparison.

**Prerequisites.** `AutomorphicCongruences:L4/fw-universal-family-theorem`, `AutomorphicCongruences:L4/family-to-point-limit`, `AutomorphicCongruences:L3/kato-generalized-main-conjecture`, `AutomorphicCongruences:L3/fw-residual-hypotheses`, `ModularIwasawaMainConjectures:L0/zeta-basis-characteristic-equivalence`.

**Sources.**

- FW-v3, Thm 5.1, p. 68; Thm 1.7, p. 7; Cors 5.3–5.4, p. 69; proof of Thm 5.1, p. 73: The pointwise main conjecture for all eigencuspforms with the residual hypotheses, and its corollaries.

### Euler factors, Tor terms and the regular subring in specialization

`AutomorphicCongruences:L4/derived-specialization-corrections` (comparison).

**Statement.** For a specialization λ: A → A′ between quotients of 𝕋^Σ\_{m\_ρ̄} or Λ: (i) the Σ-partial fundamental line commutes with every base change, Δ\_Σ(T) ⊗ A′ ≅ Δ\_Σ(T′); (ii) the full fundamental line commutes with λ when λ is Iwasawa-suitable, the Euler-factor lines X\_ℓ(T) specializing to X\_ℓ(T′) because the ranks of inertia invariants and the eigenvalues α\_ℓ are preserved (FW Prop. 3.20); otherwise the rank of T^{I\_ℓ} can jump and the comparison acquires the factor relating X\_ℓ(T) ⊗ A′ and X\_ℓ(T′); (iii) Nakamura's change-of-Σ formula z\_{Σ′,n} ⊗ id = ∏\_{l∈Σ′∖Σ} P\_l(σ\_l^{-1})·z\_{Σ,n} matches the passage from Δ\_{Σ′} to Δ\_Σ with the Euler factors P\_l; (iv) a statement over the regular subring Λ (FW Thm 1.8) is a statement about T\_Σ as a Λ-module of rank 2d, and at a point x of Λ it is a statement about the product over all points of 𝕋 above x — it implies the statement over 𝕋 only at points étale over Λ, and at ramified points only through L4/family-to-point-limit.

**Hypotheses.**

- As stated; Iwasawa-suitable as in FW Def. 3.19.

**Proof outline.**

1. (i)–(ii): perfectness and derived base change of RΓ (FW Lemma 3.17), and the explicit two-term complexes defining X\_ℓ (FW Prop. 3.20's proof).
2. (iii): Nakamura (79) and the exact sequence relating H²\_Iw(ℤ\[1/Σ]) and H²\_Iw(ℤ\[1/Σ′]) through ⊕\_{l∈Σ′∖Σ}H²\_Iw(ℚ\_l) (Nakamura proof of Thm 5.7, (78)–(79)).
3. (iv): restriction of scalars along the finite free Λ → 𝕋 and the étale-point analysis of FW Props 5.7–5.8.

**Checks.**

- Lattice corrections: when T(f)\_Iw is replaced by a different G\_ℚ-stable lattice the fundamental line changes by the index, so the lattice is the one coming from T\_Σ (FW notation T(f)\_Iw = T(𝔞) ⊗ O\_Iw).

**Prerequisites.** `AutomorphicCongruences:L3/fundamental-line`, `AutomorphicCongruences:L3/zeta-trivialization`, `AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`, `SelmerIwasawaCohomology:L3/derived-control`, `SelmerIwasawaCohomology:L3/correction-complex`, `SelmerIwasawaCohomology:L2/lattice-change-cone`.

**Sources.**

- FW-v3, Lemma 3.17, Prop. 3.20, pp. 31–32; Props 5.7–5.8, pp. 71–73; §1.2.2, p. 14: Base change of fundamental lines with and without Euler factors, and the role of points étale over Λ.
- NAK-v2, §5.3 (78)–(79), p. 80: Change of Σ for the zeta morphism and for H²\_Iw.

### Congruences between Kato's zeta morphisms

`AutomorphicCongruences:L4/zeta-morphism-congruences` (theorem).

**Statement.** Let f, g be normalized newforms with coefficients in E, ρ̄\_f absolutely irreducible, and the assumptions of Nakamura §4 holding for ρ̄ = ρ̄\_f. If f ≡ g modulo ϖ^m (Hecke eigenvalues congruent at all but finitely many primes), then ∏\_{l∈Σ\_0} P\_{f,l}(σ\_l^{-1})·z\_n(f) ≡ ∏\_{l∈Σ\_0} P\_{g,l}(σ\_l^{-1})·z\_n(g) modulo ϖ^m as maps ρ^\*\_{f,m} → H¹\_Iw(ℤ\[1/Σ\_n, ζ\_n], ρ^\*\_{f,m}(1)) (Nakamura Cor. 5.6).

**Hypotheses.**

- Nakamura §4 assumptions ((N1), (N3), (N4)); Σ containing the levels of f and g and p.

**Proof outline.**

1. x\_f and x\_g are points of the same Spec 𝕋\_{ρ̄,Σ} that agree modulo ϖ^m (the printed ϖ^n in the proof is ϖ^m, PAPER-NAKAMURA-23/E11).
2. Both Euler-corrected zeta morphisms are specializations of the one universal z\_{Σ,n}(ρ^m) (L3/nakamura-specialization-theorem), so they agree modulo ϖ^m.

**Checks.**

- This is the congruence of zeta morphisms that propagates Kato's main conjecture along congruences (L4/nakamura-lambda-defect).

**Prerequisites.** `AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`, `AutomorphicCongruences:L3/nakamura-specialization-theorem`.

**Sources.**

- NAK-v2, Cor. 5.6, p. 77 (published §5.2, Cor. 5.6, pp. 255–256): Congruent newforms have congruent Euler-corrected zeta morphisms.

### The residual zeta morphism and the space of points X(ρ̄)

`AutomorphicCongruences:L4/residual-zeta-morphism` (construction).

**Statement.** Let Σ\_ρ̄ = {p} ∪ ram(ρ̄). For Σ\_ρ̄ ⊆ Σ ⊆ Σ′, ρ^m\_{Σ′} ⊗ 𝕋\_{ρ̄,Σ} ≅ ρ^m\_Σ and z\_{Σ′,n}(ρ^m\_{Σ′}) ⊗ id = ∏\_{l∈Σ′∖Σ} P\_l(σ\_l^{-1})·z\_{Σ,n}(ρ^m\_Σ) (Nakamura (79)). The residual zeta morphism z\_{Σ,n}(ρ̄) is the base change of z\_{Σ,n}(ρ^m) to 𝔽, a Λ\_{n,𝔽}-linear map ρ̄^\* ⊗\_{𝔽\[±1]} Λ\_{n,𝔽} → H¹\_Iw(ℤ\[1/Σn, ζ\_n], ρ̄^\*(1)). Put X(ρ̄) = ∪\_Σ Spec(𝕋\_{ρ̄,Σ})(ℤ̄\_p) with its modular points X(ρ̄)^{mod}, and for a character η of Δ = Gal(ℚ(ζ\_p)/ℚ) consider η-components over Λ^η.

**Hypotheses.**

- Nakamura §4 assumptions; absolute irreducibility of ρ̄.

**Proof outline.**

1. Base change of z\_{Σ,n}(ρ^m) along 𝕋\_{ρ̄,Σ} → 𝔽, using that H¹\_Iw is computed by a perfect complex.
2. Compatibility with change of Σ from (79).

**Checks.**

- The residual morphism carries the information of the whole family: its nonvanishing is equivalent to µ = 0 at one, hence every, modular point (L4/nakamura-residual-structure).

**Uses.**

- L4/nakamura-residual-structure: Thms 5.7, 5.9, 5.11 (published numbering) are statements about z\_{Σ,1}(ρ̄)^η
- L4/nakamura-lambda-defect: the λ-defect at every point equals the residual defect

**API.**

- `ResZeta.map` (constructor): z\_{Σ,n}(ρ̄): ρ̄^\* ⊗\_{𝔽\[±1]} Λ\_{n,𝔽} → H¹\_Iw(ℤ\[1/Σn, ζ\_n], ρ̄^\*(1)).
- `ResZeta.changeSigma` (compatibility): z\_{Σ′,n}(ρ̄) = ∏\_{l∈Σ′∖Σ} P̄\_l(σ\_l^{-1})·z\_{Σ,n}(ρ̄) for Σ\_ρ̄ ⊆ Σ ⊆ Σ′.
- `ResZeta.points` (data): X(ρ̄) = ∪\_Σ Spec(𝕋\_{ρ̄,Σ})(ℤ̄\_p) and the modular subset X(ρ̄)^{mod}.
- `ResZeta.etaPart` (projection): The η-component z\_{Σ,1}(ρ̄)^η for a character η of Δ.
- `ResZeta.reduction` (compatibility): For x ∈ X(ρ̄), z\_{Σ,1}(ρ\_x) mod ϖ = z\_{Σ,1}(ρ̄).

**Unit tests.**

- `resZeta_reduction_of_point` (agreement): For x\_f modular, z\_{Σ,1}(ρ̄) is the reduction modulo ϖ of ∏\_{l∈Σ\_0}P\_{f,l}(σ\_l^{-1})·z(f) (Thm 4.3 mod ϖ).
- `resZeta_minimal_sigma` (degenerate): For Σ = Σ\_ρ̄, ResZeta.changeSigma is the identity.
- `resZeta_vanishing_iff_mu` (characterisation): z\_{Σ\_ρ̄,1}(ρ̄)^η ≠ 0 iff µ(H¹\_Iw/Im z\_1(f)^η) = 0 at one (equivalently every) modular point (Nakamura Thm 5.7).
- `resZeta_not_kato_lattice` (non-example): Reducing Kato's rational zeta morphism of f without the Euler factors at Σ\_0 does not give ResZeta.map for Σ ⊋ Σ\_ρ̄: the factors P̄\_l(σ\_l^{-1}) can vanish modulo ϖ.

**Prerequisites.** `AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`, `AutomorphicCongruences:L4/derived-specialization-corrections`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`.

**Sources.**

- NAK-v2, §5.3, (79) and the definitions before Thm 5.7, pp. 79–80 (published pp. 256–257): The residual zeta morphism, change of Σ, and the points X(ρ̄).

### Residual nonvanishing, µ = 0 and the structure of residual Iwasawa cohomology

`AutomorphicCongruences:L4/nakamura-residual-structure` (theorem).

**Statement.** Fix a character η of Δ. (i) The following are equivalent: z\_{Σ\_ρ̄,1}(ρ̄)^η ≠ 0; µ(H¹\_Iw(ℤ\[1/Σ\_f], ρ\_f^\*(1))^η/Im(z\_1(f)^η)) = 0 for some x\_f ∈ X(ρ̄)^{mod}; the same for all x\_f ∈ X(ρ̄)^{mod} (Nakamura Thm 5.7; the published version adds Conj. 5.8 that these always hold). (ii) Assume X(ρ̄)^{mod}\_a ≠ ∅ (modular points with Nakamura's condition (a)) and (i) holds for η. Then H¹\_Iw(ℤ\[1/Σ\_ρ̄], ρ̄^\*(1))^η is free of rank one over Λ^η\_𝔽, and H¹\_Iw/Im(z\_{Σ\_ρ̄,1}(ρ̄)^η) and H²\_Iw(ℤ\[1/Σ\_ρ̄], ρ̄^\*(1))^η are finite-dimensional (arXiv Thm 5.8 = published Thm 5.9); the η-part of Kato's main conjecture for ρ̄ is the equality of their dimensions (arXiv Conj. 5.9 = published 5.10). (iii) For every x ∈ Spec(𝕋\_{ρ̄,Σ})(O) ⊂ X(ρ̄): H¹\_Iw(ℤ\[1/Σ], ρ\_x^\*(1))^η is free of rank one over Λ^η\_O; the quotient by Im z\_{Σ,1}(ρ\_x)^η and H²\_Iw are torsion with µ = 0; and if x is modular, or there is τ ∈ Gal(ℚ̄/ℚ(ζ\_{p^∞})) with (ρ\_x/(τ−1)ρ\_x)\[1/p] one-dimensional, then Char(H¹\_Iw/Im z^η) ⊆ Char(H²\_Iw^η) (arXiv Thm 5.10 = published Thm 5.11).

**Hypotheses.**

- Nakamura §4 assumptions; (ii)–(iii) assume X(ρ̄)^{mod}\_a ≠ ∅ and (i) for η.

**Proof outline.**

1. (i): the mod-ϖ exact sequences relating H¹\_Iw(ρ\_f^\*(1))/ϖ and H¹\_Iw(ρ̄^\*(1)), freeness of H¹\_Iw (Kato Thm 12.4(3)) and L4/zeta-morphism-congruences.
2. (ii): Kato's theorem 5.2 at a point of X^{mod}\_a gives the rank and finiteness; descend modulo ϖ.
3. (iii): lift freeness and torsion from the residual statement; µ = 0 from (i); the divisibility from the Euler system bound (EulerSystemsAndKolyvaginSystems:ES.8 / KatoEulerSystems:L4) under the image condition.

**Checks.**

- µ = 0 is a hypothesis-free consequence only of residual nonvanishing; it is not assumed.

**Prerequisites.** `AutomorphicCongruences:L4/residual-zeta-morphism`, `AutomorphicCongruences:L4/zeta-morphism-congruences`, `KatoEulerSystems:L4/rational-iwasawa-module-structure`, `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants`.

**Sources.**

- NAK-v2, Thm 5.7, Thm 5.8, Conj. 5.9, Thm 5.10, p. 79 (published Thm 5.7, Conj. 5.8, Thm 5.9, Conj. 5.10, Thm 5.11, pp. 257–259): Residual nonvanishing versus µ = 0, and the structure of residual and pointwise Iwasawa cohomology.

### The λ-defect is constant on the family and Kato's main conjecture propagates along congruences

`AutomorphicCongruences:L4/nakamura-lambda-defect` (theorem).

**Statement.** Under the assumptions of L4/nakamura-residual-structure (ii), for every x ∈ X(ρ̄): λ(H¹\_Iw(ℤ\[1/Σ], ρ\_x^\*(1))^η/Im z\_{Σ,1}(ρ\_x)^η) − λ(H²\_Iw(ℤ\[1/Σ], ρ\_x^\*(1))^η) equals dim\_𝔽(H¹\_Iw(ℤ\[1/Σ\_ρ̄], ρ̄^\*(1))^η/Im z\_{Σ\_ρ̄,1}(ρ̄)^η) − dim\_𝔽 H²\_Iw(ℤ\[1/Σ\_ρ̄], ρ̄^\*(1))^η, hence is independent of x (arXiv Thm 5.13 = published Thm 5.14); consequently the η-part of Kato's main conjecture for ρ̄ holds iff the weak (λ-) version holds for some x iff it holds for all x (arXiv Cor. 5.14 = published Cor. 5.15). In particular (Nakamura Thm 1.4): if g\_1, g\_2, g\_3 are congruent to f with (1) some τ ∈ Gal(ℚ̄/ℚ(ζ\_{p^∞})) making ρ\_{g\_1}/(τ − 1)ρ\_{g\_1} free of rank one over O, (2) µ = 0 for g\_2, and (3) Kato's main conjecture for g\_3, then µ = 0 and Kato's main conjecture hold for f.

**Hypotheses.**

- As in L4/nakamura-residual-structure; the proof's last display prints H¹ for H² (PAPER-NAKAMURA-23/E12, corrected).

**Proof outline.**

1. For a module with µ = 0, λ(M) = λ\_𝔽(M/ϖ) − λ\_𝔽(M\[ϖ]) (Nakamura (92)); apply it to H¹\_Iw/Im z and to H²\_Iw and use the residual comparison (91).
2. The residual side does not depend on x, giving constancy; the corollary follows since for µ = 0 and the inclusion of (iii), equality of λ-invariants is equality of characteristic ideals.
3. Thm 1.4 is the specialization of these statements to modular points, as in Kim–Lee–Ponsinet.

**Checks.**

- Gives the pointwise consequences of the universal zeta element that stage L4 owns (Nakamura §5); the conjectures are recorded as propositions, not assumed.

**Prerequisites.** `AutomorphicCongruences:L4/nakamura-residual-structure`, `AutomorphicCongruences:L4/zeta-morphism-congruences`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants`, `ModularIwasawaMainConjectures:L0/kato-main-conjecture`.

**Sources.**

- NAK-v2, Thm 5.13, Cor. 5.14 and proof, p. 80 (published Thm 5.14, Cor. 5.15, pp. 259–260, 264); Thm 1.4, pp. 6–7: Constancy of the λ-defect, equivalence of the residual and pointwise main conjectures, and propagation along congruences.

### Dependencies of layer L4

Inside this roadmap and on other roadmaps (node and stage ids): `AutomorphicCongruences:L2/fw-crystalline-main-conjecture`, `AutomorphicCongruences:L2/fw-ordinary-reverse-bound`, `AutomorphicCongruences:L3/fundamental-line`, `AutomorphicCongruences:L3/fw-residual-hypotheses`, `AutomorphicCongruences:L3/kato-generalized-main-conjecture`, `AutomorphicCongruences:L3/nakamura-specialization-theorem`, `AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`, `AutomorphicCongruences:L3/smooth-classical-points`, `AutomorphicCongruences:L3/universal-deformation-ring-structure`, `AutomorphicCongruences:L3/zeta-trivialization`, `KatoEulerSystems:L4/cohomological-divisibility-one-direction`, `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`, `KatoEulerSystems:L4/rational-iwasawa-module-structure`, `ModularIwasawaMainConjectures:L0/kato-main-conjecture`, `ModularIwasawaMainConjectures:L0/zeta-basis-characteristic-equivalence`, `ModularIwasawaMainConjectures:L1/fw-ordinary-theorem`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants`, `SelmerIwasawaCohomology:L2/lattice-change-cone`, `SelmerIwasawaCohomology:L3/correction-complex`, `SelmerIwasawaCohomology:L3/derived-control`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`.

### Acceptance for layer L4

Coverage: **planned**. The family theorem is over the regular subring Λ (FW Thm 1.8), distinct from a statement over the deformation ring; the pointwise theorem uses the ordinary seed of ModularIwasawaMainConjectures:L1/fw-ordinary-theorem as RS-11 requires.

- Refinement: State Nakamura's published Conjectures 5.8, 5.10, 5.12–5.13 as separate proposition nodes if a consumer needs them; they are recorded inside L4/nakamura-residual-structure and L4/nakamura-lambda-defect.

## Layer L5: The ordinary elliptic-curve refinement

An aggregate: it lists the endpoints of this roadmap for elliptic curves at good ordinary primes and owns no proof (RS-11).

### The ordinary elliptic-curve refinement: aggregate of the endpoints

`AutomorphicCongruences:L5/ordinary-elliptic-refinement-aggregate` (application).

**Statement.** For an elliptic curve E/ℚ and a prime p of good ordinary reduction, stage L5 collects, without a second proof, the two reverse-divisibility endpoints planned in this roadmap: (a) Burungale–Castella–Skinner's cyclotomic theorem — for p > 3 with E\[p] irreducible, X\_ord(E/ℚ\_∞) is Λ-torsion and char\_Λ X\_ord(E/ℚ\_∞) = (L\_p(E/ℚ)) in Λ ⊗ ℚ\_p, with equality in Λ under the rank-one image condition (im) (BCS Thm 1.1.2), proved in L5b from L5a's early product input and four Kato bounds; and (b) Fouquet–Wan's cohomological theorem at good ordinary points (L4/fw-pointwise-theorem, through L2/fw-ordinary-reverse-bound). The scalar ordinary main conjecture with canonical periods, the curve-to-form lattice and Manin-constant transport and the final assembly are ModularIwasawaMainConjectures L1–L3's, which import the endpoints directly from L5b and L4.

**Hypotheses.**

- Hypotheses are those of each endpoint; nothing is added or removed here.
- RS-11: L5 is an aggregate only; it is not a prerequisite of ModularIwasawaMainConjectures:L3 (the requested cut C.L5 → I.L3).

**Proof outline.**

1. List the endpoints with their owners: AutomorphicCongruences:L5b/rational-cyclotomic-endpoint and L5b/integral-cyclotomic-endpoint for (a), L4/fw-pointwise-theorem for (b).
2. Record that the BCS rational/integral distinction survives: (a) is in Λ ⊗ ℚ\_p without (im) and in Λ with (im).

**Checks.**

- Acceptance of the roadmap: opposite divisibilities on the same integral objects as Kato's; no hidden 'assume the divisibility' field; the BCS rational/integral distinction kept.

**Prerequisites.** `AutomorphicCongruences:L5b/rational-cyclotomic-endpoint`, `AutomorphicCongruences:L5b/integral-cyclotomic-endpoint`, `AutomorphicCongruences:L4/fw-pointwise-theorem`, `AutomorphicCongruences:L2/fw-ordinary-reverse-bound`, `AutomorphicCongruences:L5a/two-variable-product-containment`.

**Sources.**

- BCS-v2, Thm 1.1.2 and Remark 1.1.3, p. 2; proof of Thm 1.1.2, p. 10: The rational and integral cyclotomic theorems and their proof from Prop. 5.2.1 and Kato's bounds.
- FW-v3, Thm 1.6, Thm 1.7, pp. 6–7: The ordinary and pointwise theorems.

### Dependencies of layer L5

Inside this roadmap and on other roadmaps (node and stage ids): `AutomorphicCongruences:L2/fw-ordinary-reverse-bound`, `AutomorphicCongruences:L4/fw-pointwise-theorem`, `AutomorphicCongruences:L5a/two-variable-product-containment`, `AutomorphicCongruences:L5b/integral-cyclotomic-endpoint`, `AutomorphicCongruences:L5b/rational-cyclotomic-endpoint`.

### Acceptance for layer L5

Coverage: **planned**. Aggregate only (RS-11): one application node listing the L5b and L4 endpoints; it is not a prerequisite of ModularIwasawaMainConjectures:L3.

## Layer L5a: Shared two-variable congruence input

Burungale, Castella and Skinner base change an elliptic curve to a quartic CM field, apply Wan's theorem there (L5w), restrict to an imaginary quadratic K, and obtain integral product divisibilities of the two-variable Perrin-Riou and Greenberg main conjectures. This early input feeds both L5b's cyclotomic descent and HE.8b's anticyclotomic endpoints.

### Interface: the ordinary two-variable Perrin-Riou/Greenberg equivalence (BCS Theorem 4.1.3, Corollary 4.1.4)

`AutomorphicCongruences:L5a/ordinary-two-variable-equivalence` (comparison).

**Statement.** Let g ∈ S\_2(Γ\_0(N)) be an elliptic newform, p ∤ 2N an ordinary prime for g, and K imaginary quadratic with p split (spl), (D\_K, N) = 1 and ρ̄\_g irreducible over G\_K (irr\_K). The following are equivalent: (i) X\_ord(g/K\_∞) is Λ\_K-torsion and (L^{PR}\_p(g/K)) ⊇ ch\_{Λ\_K}(X\_ord(g/K\_∞)) in Λ\_K ⊗ ℚ\_p; (ii) X\_Gr(g/K\_∞) is Λ\_K-torsion and (L^{Gr}\_p(g/K)) ⊇ ch\_{Λ\_K}(X\_Gr(g/K\_∞)) in Λ^{ur}\_K ⊗ ℚ\_p; the same holds for the opposite divisibilities and before inverting p (BCS Thm 4.1.3, from BSTW §9.3.2). For two newforms g, g′ with p ∤ 2NN′ ordinary for both and K satisfying (spl), (D\_K, NN′) = 1 and (irr\_K) for both, the product statements (L^{PR}\_p(g/K)·L^{PR}\_p(g′/K)) ⊇ ch(X\_ord(g/K\_∞))·ch(X\_ord(g′/K\_∞)) and (L^{Gr}\_p(g/K)·L^{Gr}\_p(g′/K)) ⊇ ch(X\_Gr(g/K\_∞))·ch(X\_Gr(g′/K\_∞)) are equivalent, in either direction (BCS Cor. 4.1.4). This node states the exact contract L5a consumes; its proof (the ordinary BSTW two-variable zeta element, both explicit reciprocity laws, and the two four-term Poitou–Tate sequences) belongs to the planned owner KatoEulerSystems L5 of RS-11, which does not yet exist.

**Hypotheses.**

- The ordinary BSTW construction needs E\[p](K) = 0-type vanishing (van\_K) for the integral comparison and the stated split-field, discriminant and irreducibility hypotheses; without van\_K only the p-inverted comparison is available (RS-11 ordinaryBSTW contract).
- BCS cite the theorem as Proposition 4.1.3 in the proof of Prop. 5.2.1; it is Thm 4.1.3 in v2 (RT-AREA-iwasawa-1/29).

**Proof outline.**

1. Writing H for the rank-one global module, Z for the two-variable zeta class and X\_st for the strict Selmer dual, the two Poitou–Tate sequences give ch(H/ΛZ)·ch(X\_Gr) = (L\_Gr)·ch(X\_st) and ch(H/ΛZ)·ch(X\_ord) = (L\_PR)·ch(X\_st) after the unramified coefficient extension, using both explicit reciprocity laws (RS-11 handoff).
2. Prove rank one, torsion and nonvanishing of the terms before cancelling; this gives ch(X\_Gr)·(L\_PR) = ch(X\_ord)·(L\_Gr), hence both directions of the equivalence.
3. Cor. 4.1.4: direct sums of the two pairs of sequences for g and g′.

**Checks.**

- Does not use the anticyclotomic Theorem 4.2.1, which belongs to HeegnerPointEulerSystems:HE.8/HE.8b.

**Prerequisites.** `KatoEulerSystems:L4`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`.

**Sources.**

- BCS-v2, Thm 4.1.3 and proof, Cor. 4.1.4, p. 8: Equivalence of the two-variable Perrin-Riou and Greenberg main conjectures from the BSTW two-variable zeta element, in both directions and before inverting p, and its two-form product version.

### Restricting the quartic-CM characteristic ideal to K

`AutomorphicCongruences:L5a/quartic-cm-selmer-restriction` (theorem).

**Statement.** Let g ∈ S\_2(Γ\_0(N)) be an elliptic newform, p > 3 a good ordinary prime with ρ̄\_g irreducible, F a real quadratic field, K imaginary quadratic, M = FK the quartic CM field, K̃\_∞ = FK\_∞, Λ̃\_K = O\[\[Gal(K̃\_∞/M)]] ≅ Λ\_K and π\_K: Λ\_M → Λ̃\_K ≅ Λ\_K induced by Gal(M\_∞/M) ↠ Gal(K̃\_∞/M). Then π\_K(ch\_{Λ\_M}(X\_ord(g/M\_∞))) ⊇ ch\_{Λ\_K}(X\_ord(g/K\_∞))·ch\_{Λ\_K}(X\_ord(g^F/K\_∞)) in Λ\_K, where g^F is the twist of g by the quadratic character of F/ℚ (BCS Lemma 5.1.1).

**Hypotheses.**

- As in BCS §5; the containment is integral and in the stated direction only.

**Proof outline.**

1. Shapiro's lemma and the control results (L0/selmer-specialization-control; SU Props 3.6–3.7 in the journal numbering) identify H¹\_{F\_Λ}(M, M\_g)\[I\_K] with H¹\_{F\_Λ}(M, T\_g ⊗ Λ̃^∨\_K) ≅ H¹\_{F\_Λ}(M, T\_g ⊗ Λ^∨\_K) ⊕ H¹\_{F\_Λ}(M, T\_g ⊗ η\_F ⊗ Λ^∨\_K), with T\_g ⊗ η\_F ≅ T\_{g^F}.
2. Restriction from M to K of a module induced along Gal(M/K) ≅ Gal(F/ℚ) splits by the characters of Gal(M/K) (Shapiro).
3. SU Cor. 3.8 (journal): π\_K(ch\_{Λ\_M}(X)) ⊇ ch\_{Λ\_K}(X/I\_K) (L0/selmer-specialization-control (ii)).

**Checks.**

- Direction check: the image of the quartic characteristic ideal contains the product of the two K-characteristic ideals, so a divisibility for M gives one for the product over K.

**Prerequisites.** `AutomorphicCongruences:L0/selmer-specialization-control`, `AutomorphicCongruences:L0/sigma-primitive-selmer`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma`.

**Sources.**

- BCS-v2, Lemma 5.1.1 and proof, p. 9: The restriction from the quartic CM tower to K and the resulting containment of characteristic ideals.

### The quartic-CM p-adic L-function restricted to K

`AutomorphicCongruences:L5a/quartic-cm-l-function-factorization` (theorem).

**Statement.** In the setting of L5a/quartic-cm-selmer-restriction, (π\_K(L\_p(g^F/M))) = (L^{PR}\_p(g/K)·L^{PR}\_p(g^F/K)) in Λ\_K ⊗ ℚ\_p, where L\_p(g^F/M) is Wan's p-adic L-function of the base change g\_F over M (BCS Lemma 5.1.2).

**Hypotheses.**

- The identity is only after inverting p (the comparison of interpolation properties involves periods whose p-integral comparison is open — BCS Remark 1.1.3(ii)).

**Proof outline.**

1. Compare interpolation formulas on a Zariski-dense set of characters of Γ\_K: the base-change L-value L(g\_F/M ⊗ χ, 1) factors as L(g/K ⊗ χ, 1)·L(g^F/K ⊗ χ, 1) (Wan's Prop. 84 in the journal numbering).
2. Two elements of Λ\_K ⊗ ℚ\_p with equal values on a dense set are equal (Weierstrass preparation).

**Checks.**

- Exported only after inverting p; the integral statement of L5a/two-variable-product-containment uses µ = 0 instead of an integral period comparison.

**Prerequisites.** `AutomorphicCongruences:L5w/quartic-cm-divisibility`, `AutomorphicPadicLFunctions:L4`.

**Sources.**

- BCS-v2, Lemma 5.1.2 and proof, p. 9; §2 (p-adic L-functions), p. 6: The factorization of the restricted quartic p-adic L-function by direct comparison of interpolation properties.

### Existence of the auxiliary fields K and F

`AutomorphicCongruences:L5a/auxiliary-field-existence` (theorem).

**Statement.** Let g ∈ S\_2(Γ\_0(N)) be an elliptic newform and p ≥ 5 a prime of good ordinary reduction with ρ̄\_g irreducible over G\_ℚ. There exist an imaginary quadratic K satisfying (disc) (D\_K odd, D\_K ≠ −3), (Heeg) (every ℓ | N splits in K), (spl) (p splits in K) and (irr\_K), and a real quadratic F with (i) p inert in F, (ii) D\_F odd with every prime dividing D\_F split in K, (iii) every ℓ | N inert in F if ℓ ≡ −1 mod p and split otherwise, (iv) (irr\_M) for M = FK, (v) ρ̄\_g|\_{G\_{F(ζ\_p)}} irreducible, (vi) F ≠ ℚ(ζ\_5)^+ if p = 5 (BCS Lemma 5.2.3). Moreover such M/F satisfies (pN, D\_F) = 1, (N O\_F, D\_{M/F}) = 1, (spl\_F) and (Δ), and n^- = O\_F, so the hypotheses of Wan's theorem (L5w) other than Hypothesis 3.1.1 hold, and (H1)–(H3) follow from (v), (vi), the minimal-lift argument and (iii) (proof of BCS Prop. 5.2.1).

**Hypotheses.**

- As stated; the conditions are independent splitting conditions satisfied by a positive proportion of quadratic fields.

**Proof outline.**

1. Since p ∤ N, conditions (i) and (iii) on F are independent splitting conditions; fix F with odd D\_F.
2. Similarly (spl), (Heeg) and (ii) hold for a positive proportion of K; choose one with (disc) and (irr\_K).
3. (irr\_M) holds if FK is not in the splitting field of ρ\_g|\_{G\_K}; if ρ̄\_g|\_{G\_{F(ζ\_p)}} is reducible, ρ̄\_g|\_{G\_F} is induced from an index-two subgroup containing G\_{F(ζ\_p)}, which forces p = 5 and F = ℚ(ζ\_5)^+.
4. Check the hypotheses of BCS Thm 3.2.1: (ii) gives n^- = O\_F; (H2) from the base change of a minimal modular lift (Wan's Thm 103); (H3) from (iii) (AutomorphicCongruences:L5w/selected-base-change-hypotheses).

**Checks.**

- Answers the L5b request for Lemma 5.2.3; the stronger 'new ramified K-prime outside D\_F' requirement mentioned there is not in BCS v2 and is not added.
- HeegnerPointEulerSystems:HE.8b/auxiliary-quadratic-field-verification consumes this node (HE.8b comes after L5a); it is not a prerequisite here.

**Prerequisites.** `AutomorphicCongruences:L5w/selected-base-change-hypotheses`, `AutomorphicCongruences:L5w/fujiwara-instance`.

**Sources.**

- BCS-v2, Lemma 5.2.3 and proof, p. 10; conditions (i)–(vi) of Prop. 5.2.1, p. 9; proof of Prop. 5.2.1 (hypothesis checks), p. 10: Existence of K and F and the verification of Wan's hypotheses for M = FK.

### Vanishing of the µ-invariant of the Greenberg function

`AutomorphicCongruences:L5a/greenberg-mu-vanishing` (theorem).

**Statement.** Let g ∈ S\_2(Γ\_0(N)) be an elliptic newform with good reduction at p > 2 and K satisfying (disc), (Heeg), (spl) and (irr\_K). Then µ(L^{Gr}\_p(g/K)) = µ(L^{BDP}\_p(g/K)) = 0 (BCS Prop. 4.2.2).

**Hypotheses.**

- As stated; the projection comparison is CGS23 Prop. 1.4.5 (Lemma 2.4.4/Prop. 2.4.5 in a later version), which needs Rubin's main conjecture and the Hida–Tilouine input for the CM factor.

**Proof outline.**

1. L^{BDP}\_p(g/K) has µ = 0 by Hsieh's Theorem B (AutomorphicPadicLFunctions:L3h/theorem-b, through its BDP/Castella–Hsieh specialization).
2. The projection of L^{Gr}\_p(g/K) to Λ^{-,ur}\_K generates the same ideal as L^{BDP}\_p(g/K) by comparing interpolation properties (CGS23 Prop. 1.4.5); µ of a two-variable function is bounded by µ of a one-variable specialization.

**Checks.**

- Exported to HeegnerPointEulerSystems:HE.8b/primitive-greenberg-mu-vanishing; this is BCS's Proposition 4.2.2, not Theorem 4.2.1.

**Prerequisites.** `AutomorphicPadicLFunctions:L3h/theorem-b`, `AutomorphicPadicLFunctions:L3h/bdp-castella-hsieh-specialisation`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`, `AutomorphicCongruences:L0/hida-tilouine-anticyclotomic`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants`.

**Sources.**

- BCS-v2, Prop. 4.2.2 and proof, p. 9: µ = 0 for L^{Gr} and L^{BDP}, from Hsieh's Theorem B and the CGS23 projection comparison.

### Burungale–Castella–Skinner's two-variable product divisibility

`AutomorphicCongruences:L5a/two-variable-product-containment` (theorem). Planet: BCS two-variable product divisibility.

**Statement.** Let g ∈ S\_2(Γ\_0(N)) be an elliptic newform, p ≥ 5 a good ordinary prime, K satisfying (disc), (Heeg), (spl), (irr\_K), and F a real quadratic field satisfying (i)–(vi) of L5a/auxiliary-field-existence. Then (L^{PR}\_p(g/K)·L^{PR}\_p(g^F/K)) ⊇ ch\_{Λ\_K}(X\_ord(g/K\_∞))·ch\_{Λ\_K}(X\_ord(g^F/K\_∞)) in Λ\_K, and (L^{Gr}\_p(g/K)·L^{Gr}\_p(g^F/K)) ⊇ ch\_{Λ\_K}(X\_Gr(g/K\_∞))·ch\_{Λ\_K}(X\_Gr(g^F/K\_∞)) in Λ^{ur}\_K (BCS Prop. 5.2.1). Both containments are integral.

**Hypotheses.**

- As stated; Wan's quartic-CM theorem (BCS Thm 3.2.1) is imported from L5w with its hypotheses discharged by L5a/auxiliary-field-existence.

**Proof outline.**

1. Wan's theorem for M/F (AutomorphicCongruences:L5w/quartic-cm-divisibility): (π\_K(L\_p(g^F/M))) ⊇ π\_K(ch\_{Λ\_M}(X\_ord(g/M\_∞))).
2. Lemmas 5.1.1–5.1.2 (L5a/quartic-cm-selmer-restriction, L5a/quartic-cm-l-function-factorization) give the Perrin-Riou product containment in Λ\_K ⊗ ℚ\_p.
3. L5a/ordinary-two-variable-equivalence (Cor. 4.1.4) converts it to the Greenberg product containment in Λ^{ur}\_K ⊗ ℚ\_p.
4. µ(L^{Gr}\_p(g/K)·L^{Gr}\_p(g^F/K)) = 0 (L5a/greenberg-mu-vanishing for g and g^F), so the Greenberg containment holds integrally in Λ^{ur}\_K; Cor. 4.1.4 again gives the integral Perrin-Riou containment.

**Checks.**

- Exported to AutomorphicCongruences:L5b (cyclotomic descent) and HeegnerPointEulerSystems:HE.8b (anticyclotomic endpoints) as the early product input; neither L5b's endpoint nor HE.8b's completed result is an input here.

**Prerequisites.** `AutomorphicCongruences:L5a/quartic-cm-selmer-restriction`, `AutomorphicCongruences:L5a/quartic-cm-l-function-factorization`, `AutomorphicCongruences:L5a/ordinary-two-variable-equivalence`, `AutomorphicCongruences:L5a/greenberg-mu-vanishing`, `AutomorphicCongruences:L5a/auxiliary-field-existence`, `AutomorphicCongruences:L5w/quartic-cm-divisibility`, `AutomorphicCongruences:L5w/selected-base-change-hypotheses`.

**Sources.**

- BCS-v2, Prop. 5.2.1 and proof, pp. 9–10: The integral Perrin-Riou and Greenberg product containments over K from Wan's quartic-CM divisibility, Lemmas 5.1.1–5.1.2, Thm 4.1.3 and Prop. 4.2.2.

### Dependencies of layer L5a

Inside this roadmap and on other roadmaps (node and stage ids): `ArithmeticGaloisDuality:R02.4/poitou-tate`, `AutomorphicCongruences:L0/hida-tilouine-anticyclotomic`, `AutomorphicCongruences:L0/selmer-specialization-control`, `AutomorphicCongruences:L0/sigma-primitive-selmer`, `AutomorphicCongruences:L5w/fujiwara-instance`, `AutomorphicCongruences:L5w/quartic-cm-divisibility`, `AutomorphicCongruences:L5w/selected-base-change-hypotheses`, `AutomorphicPadicLFunctions:L3h/bdp-castella-hsieh-specialisation`, `AutomorphicPadicLFunctions:L3h/theorem-b`, `AutomorphicPadicLFunctions:L4`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`, `KatoEulerSystems:L4`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma`.

### Acceptance for layer L5a

Coverage: **planned**. RT-AREA-iwasawa-1/29: L5a uses BCS Theorem 4.1.3 (cited as Proposition 4.1.3 in the proof of Prop. 5.2.1), Lemmas 5.1.1–5.1.2, Prop. 4.2.2 and Prop. 5.2.1; Theorem 4.2.1 is left to HE.8/HE.8b. RT-AREA-iwasawa-1/30: the ordinary BSTW comparison has the single planned owner KatoEulerSystems L5.

- Refinement: Replace L5a/ordinary-two-variable-equivalence by an import once the planned KatoEulerSystems L5 (RS-11 ordinaryBSTW) exists (gap ordinary-bstw-owner).

## Requests to other roadmaps

- `PadicMeasuresIwasawaAlgebras:L5` — Determinant lines (Knudsen–Mumford) of perfect complexes over noetherian rings, as graded invertible modules, with base change, the trivialization of acyclic complexes, and the two-term complex \[A —(1−α)→ A]; TauCetiRoadmap main's PadicMeasuresIwasawaAlgebras layer 5.1 supplies this, so the request is an import of that upstream layer (the atlas packet has no L5 nodes). Needed by `AutomorphicCongruences:L3/fundamental-line`.
- `AutomorphicLFunctionsAndLocalFactors:AL.3` — Ichino's triple product formula for the definite unitary group U(2) (equivalently D^× for a definite quaternion algebra) with explicit local triple product integrals at split, nonsplit and supercuspidal places, in the form used by CLW Props 7.9.1–7.12.1, FW Prop. 7.29 and Wan20 step (5); also the Rallis inner product normalization it is combined with. No atlas stage plans it. Needed by `AutomorphicCongruences:L2s/fourier-jacobi-primitivity`, `AutomorphicCongruences:L2/fw-fourier-jacobi-unit`.
- `DirichletPadicLFunctions:L4` — The Kubota–Leopoldt p-adic L-function of a Dirichlet character as an element of A\[\[Γ\_ℚ]] with Σ-imprimitive Euler factors, and its image under γ ↦ (1+W)^{-1}γ²\_+ in 𝕀\[\[Γ\_K]] (SU's L^Σ\_{χ̄\_fξ̄′}, CLW's L\_{ξ,ℚ} of (6.1.1)). Needed by `AutomorphicCongruences:L1/eisenstein-datum`.
- `SerreWeightAndLevelOptimisation:R20.6` — Existence of a classical eigenform of the Serre weight and minimal level whose residual representation is a given odd absolutely irreducible ρ̄ (Khare–Wintenberger with weight optimisation), in the form FW Lemma 2.2, Lemma 2.8 and the proof of Prop. 2.4 use, including the crystalline-short and ordinary cases up to twist. Needed by `AutomorphicCongruences:L3/smooth-classical-points`.
- `KatoEulerSystems:L4` — For the stage KatoEulerSystems L5 planned by RS-11 (implementationHandoffs.ordinaryBSTW; not yet in the atlas): the ordinary BSTW two-variable zeta element for E (or an elliptic newform g) over imaginary quadratic K with p split, both normalized explicit reciprocity laws, and the ordinary Perrin-Riou/Greenberg characteristic-ideal identity in both directions, before inverting p under van\_K, with the two-form product (BCS Thm 4.1.3, Cor. 4.1.4). Until it exists, L5a states the contract in L5a/ordinary-two-variable-equivalence. Needed by `AutomorphicCongruences:L5a/ordinary-two-variable-equivalence`.
- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma` — Import (existing Tau Ceti layer): Shapiro's lemma for coinduced discrete modules, used to restrict the quartic-CM Selmer group to K and split it by the characters of Gal(M/K); the compact-coefficient comparison is SelmerIwasawaCohomology:L3's. Needed by `AutomorphicCongruences:L5a/quartic-cm-selmer-restriction`.
- `AutomorphicPadicLFunctions:L4` — Instantiate the unitary PEL data at signature (2,2) and (3,1) in Skinner–Urban's and Castella–Liu–Wan's normalizations: ordinary and semi-ordinary Igusa towers, q-expansion and Fourier–Jacobi expansions, Siegel-operator boundary sequences and the ordinary Hecke algebras; and supply Wan 2015's GU(2,2) p-adic L-function over a totally real field with the base-change interpolation comparison used in BCS Lemma 5.1.2 (Wan's Prop. 84). Needed by `AutomorphicCongruences:L1/gu22-ordinary-hermitian-forms`, `AutomorphicCongruences:L5a/quartic-cm-l-function-factorization`.
- `AutomorphicPadicLFunctions:L3` — Hida's GL₂ × GL₂ Rankin–Selberg p-adic L-function of a CM Hida family against a fixed form or Hida family, with its comparison to Katz's p-adic L-function on the line interpolating values at 1 (Wan20 §7E, CLW proof of Thm 8.2.1(2), FW Cor. 7.21); RT-AREA-iwasawa-1/26 proposes a layer for it. PadicFamilies:L1/branch-l-functions is the cyclotomic family L-function of one form and does not cover it. Needed by `AutomorphicCongruences:L2s/clw-integrality-and-p-inverted`, `AutomorphicCongruences:L2/greenberg-function-factorization`.
- `AutomorphicPadicLFunctions:L3h` — Export Hsieh's Theorems A, B and C to AutomorphicCongruences:L2s and L2 as well as L5a (RT-AREA-iwasawa-1/25): µ = 0 of the anticyclotomic Rankin–Selberg function under the Steinberg-twist hypotheses of FW Thm 7.32 and CLW Thm 8.2.1(2), Hsieh 2012's nonvanishing for the auxiliary characters of CLW §5.6, and Vatsal 2003's µ = 0 (a recorded gap there) for SU Prop. 12.3.6. Needed by `AutomorphicCongruences:L1/su-padic-l-function`, `AutomorphicCongruences:L2/exceptional-height-one-primes`, `AutomorphicCongruences:L2s/semi-ordinary-klingen-family`, `AutomorphicCongruences:L2s/clw-integrality-and-p-inverted`.
- `GeneralizedHeegnerCycles:GH.7` — Export the Yager module and the unramified-tower exponential comparison in the form FW §4.2.2 uses (Loeffler–Zerbes §3.2), along a ℤ\_p-extension of K unramified at v\_0 and totally ramified at v̄\_0, for crystalline short representations; L2 keeps only FW §4.2.1's boundedness (RT-AREA-iwasawa-1/27). Needed by `AutomorphicCongruences:L2/unramified-exponential-boundedness`.
- `MetaplecticAutomorphicForms:MP.6` — Ikeda's description of the Fourier–Jacobi coefficients of (nearly holomorphic) Siegel Eisenstein series on U(3,3) as finite sums of products of Siegel Eisenstein series on U(2,2) and theta functions on the unitary Jacobi group (FW Lemma 7.26; Wan20 Prop. 6.44; CLW Prop. 7.4.2), using MP.6's unitary Jacobi group and Fourier–Jacobi periods (RT-AREA-automorphic-1/20). Needed by `AutomorphicCongruences:L2s/fourier-jacobi-primitivity`, `AutomorphicCongruences:L2/fw-fourier-jacobi-unit`.
- `AutomorphicGaloisRepresentationsPartII:AG2.2` — Galois representations of cohomological cuspidal representations of GU(2,2) and U(3,1) over an imaginary quadratic K in SU Thm 7.1.1's form: polarized, unramified outside S with the Hecke-polynomial characteristic polynomial of Frobenius, crystalline at the primes above p when π\_p is unramified, and with the ordinary (resp. semi-ordinary) filtration at p for p-ordinary π (RT-AREA-iwasawa-1/6; AG2.5 and AG2.6 for the local–global compatibility). Needed by `AutomorphicCongruences:L1/gu22-galois-pseudocharacter`, `AutomorphicCongruences:L2s/cap-exclusion`.
- `CompletedCohomologyAndLocalGlobalCompatibility:R31.4` — Emerton's local–global compatibility for completed cohomology localized at a non-Eisenstein ρ̄, in the form of Nakamura Thm 2.2 and FW Thm 6.10 (with co-Whittaker π\_ℓ at ℓ ∈ Σ\_0), and its dual for completed Borel–Moore homology (Nakamura Cor. 2.5), with p ≥ 5 removed by Paškūnas–Tung's generalization (RT-AREA-iwasawa-1/28). Needed by `AutomorphicCongruences:L3/completed-homology-factorization`.
- `PadicLocalLanglandsForGL2Qp:R30.5` — Paškūnas's identification of the projective envelope P̃ with the dual of the universal deformation of π̄ and the removal of P̃ from Hom, under Nakamura's conditions (N1), (N3), (N4), as used in Nakamura §4.1; and Paškūnas's freeness result (Nakamura Thm 4.7) for M^⋄(k, τ) at potentially semistable points (R30.6). R30.5's nodes assume p ≥ 5; FW extend Nakamura's theorem to p = 3 through Paškūnas–Tung's generalization (their Props 2.13, 2.33, cited in FW's remark after Thm 3.6), which R30.5/R30.6 should state if the p = 3 case is to be covered. Needed by `AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`, `AutomorphicCongruences:L3/nakamura-specialization-theorem`.
- `SmoothRepresentationsOfLocalGroups:SR.5` — Co-Whittaker families attached to families of GL₂(ℚ\_ℓ)-representations of Weil–Deligne type over reduced complete local rings, with uniqueness, the explicit principal-series/Steinberg/supercuspidal shapes and freeness of rank one of the K\_1(ϖ^m)-invariants with base change (FW Props 6.7–6.9); SR.5's local Langlands family construction is conditional on Helm's conjecture in general, and the GL₂ case used here must be unconditional. Needed by `AutomorphicCongruences:L3/completed-homology-factorization`, `AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`.
- `GL2ModularityLifting:R32.4` — Pan's modularity theorem in the form cited by FW \[95, Thm 1.0.4]: an odd ρ: G\_ℚ → GL₂(O), unramified outside finitely many primes, with ρ̄|\_{G\_{ℚ\_p}} absolutely irreducible and de Rham with distinct Hodge–Tate weights, is modular; and Kisin's crystalline lifting theorem in CLW's non-ordinary CAP-exclusion step. Needed by `AutomorphicCongruences:L2s/cap-exclusion`.
- `IntegralHeckeAndGaloisDeterminants:IHG.6` — If IHG plans the polarized rank-four (χ′ ⊕ ρ ⊕ χ) lattice and length theorem requested by AutomorphicCongruences--L5b, it should coincide with L0/lattice-construction (SU §4's abstract construction, planned here because no IHG layer states it); otherwise IHG.6's distinct-character Ribet theorem remains the n = 0 case. Needed by `AutomorphicCongruences:L0/lattice-construction`.

## Gaps

- **canonical-gross-periods.** No general comparison of the canonical periods Ω^±\_f with the Gross (toric or quaternionic) period is available; Fouquet–Wan note it may not exist in the literature in the needed generality (remark before FW Thm 1.6), and BCS Remark 1.1.3(ii) calls the analogous p-integral period comparison for Wan 2015 open. This packet does not assume one: FW Thm 1.6 is proved by the §4.8 route and BCS's integral statements use µ = 0. Affects `AutomorphicCongruences:L0/canonical-period-congruence-number`, `AutomorphicCongruences:L2/fw-ordinary-reverse-bound`.
- **fw-4-8-sketch.** FW §4.8 only indicates the proof of Thm 1.6 ('similar to §4.6 but much easier'; details for weight two in Castella–Wan Thm 3.8). The removal of the power of p in the ordinary case, the twist/factor separation of f ⊗ χ\_K and the transfer to the cyclotomic line are not written out in the source; L2/fw-ordinary-reverse-bound states the route and its inputs. Affects `AutomorphicCongruences:L2/fw-ordinary-reverse-bound`.
- **ichino-triple-product.** Ichino's triple product formula for definite U(2)/D^× and the local triple product integrals are used by CLW §7, FW Prop. 7.29 and Wan20 but are planned by no atlas stage; requested from AutomorphicLFunctionsAndLocalFactors:AL.3. Affects `AutomorphicCongruences:L2s/fourier-jacobi-primitivity`, `AutomorphicCongruences:L2/fw-fourier-jacobi-unit`.
- **harris-cap.** Harris (1984) Theorem 2.5.6 (no holomorphic CAP forms of the relevant weights on U(3,1)) is used in the CAP-exclusion step of CLW and FW and is planned by no atlas stage; it was not read. Affects `AutomorphicCongruences:L2s/cap-exclusion`.
- **klz-not-read.** Kings–Loeffler–Zerbes (2017) Def. 8.1.1, Prop. 8.1.7, Thm 10.2.2 and Loeffler–Lei–Zerbes (2014) Lemma 6.8.9 were not read; the Beilinson–Flach construction and reciprocity law are stated through Castella–Wan Thm 3.6 and FW §4.4. Affects `AutomorphicCongruences:L2/klz-beilinson-flach-classes`, `AutomorphicCongruences:L2/bf-explicit-reciprocity`.
- **hida-tilouine-not-read.** Hida–Tilouine (Ann. Sci. ÉNS 26, 1993; Invent. Math. 117, 1994) and Hida (Doc. Math. extra volume, 2006) were not read; L0/hida-tilouine-anticyclotomic states the anticyclotomic main conjecture as CLW and Wan use it, and its exact hypotheses must be fixed from those papers. Affects `AutomorphicCongruences:L0/hida-tilouine-anticyclotomic`, `AutomorphicCongruences:L2s/clw-integrality-and-p-inverted`.
- **ordinary-bstw-owner.** The ordinary BSTW two-variable zeta element, its two reciprocity laws and the ordinary Perrin-Riou/Greenberg comparison have the single planned owner KatoEulerSystems L5 (RS-11, RT-AREA-iwasawa-1/30), which is not yet a stage; RankZeroOneBSD:BSD.6a owns only the supersingular construction. L5a/ordinary-two-variable-equivalence states the contract it consumes. Affects `AutomorphicCongruences:L5a/ordinary-two-variable-equivalence`, `AutomorphicCongruences:L5a/two-variable-product-containment`.
- **su-proofs-cited.** The proofs of Skinner–Urban §§5, 6, 9, 10, 11 and 13.1–13.3 (Shimura varieties and Hida theory for GU(2,2), the Klingen and Siegel Eisenstein series and their Fourier coefficients, the auxiliary-prime analysis) were not read; the L1 nodes cite their numbered statements. Affects `AutomorphicCongruences:L1/gu22-hida-control`, `AutomorphicCongruences:L1/klingen-eisenstein-series`, `AutomorphicCongruences:L1/nonsingular-coefficient-coprimality`.
- **wan20-lattice.** Wan20 §9 (the lattice construction Prop. 9.2 with its set-up (1)–(9) and Lemma 9.3) was not read; its use is stated as CLW and FW state it, and L0/lattice-construction plans SU §4's version, of which Wan20 Prop. 9.2 is the variant with condition (9). Affects `AutomorphicCongruences:L0/lattice-construction`, `AutomorphicCongruences:L2/wan-rankin-selberg-divisibility`.
- **fw-crystalline-proofs.** The proofs of FW §§4.1–4.7 (Pottharst's analytic Iwasawa theory over Λ\_{K,∞}, Selmer complexes, the p-power argument of §4.6.3, the Betina–Williams comparison of §4.7) were not read; no atlas stage plans Pottharst's analytic Iwasawa theory, which L2/fw-crystalline-main-conjecture needs. Affects `AutomorphicCongruences:L2/fw-crystalline-main-conjecture`, `AutomorphicCongruences:L2/unramified-exponential-boundedness`.
- **nakamura-proofs.** The proofs of Nakamura §§2–4 (completed-homology duality, the equivariant zeta morphisms, Paškūnas's Thm 4.7 input and the motivic comparison of §4.4) were read for statements only; the paper-route extraction PAPER-NAKAMURA-23, which read them, records fifteen source issues the refinement must follow. Affects `AutomorphicCongruences:L3/equivariant-zeta-morphism-completed-homology`, `AutomorphicCongruences:L3/nakamura-specialization-theorem`.
- **vatsal-mu.** Vatsal (2003) µ = 0 for anticyclotomic L-values, used in SU Prop. 12.3.6 and Prop. 13.4.1, is a recorded gap of AutomorphicPadicLFunctions:L3h (finis-divisibility); the L1 statements depending on it inherit that gap. Affects `AutomorphicCongruences:L1/su-padic-l-function`, `AutomorphicCongruences:L1/nonsingular-coefficient-coprimality`.

## Mistakes found in the sources

- **AutomorphicCongruences/E8** (misprint, CLW-v1, arXiv:2109.08375v1, proof of Thm 8.2.1(2), p. 81). Printed: The integrality step is said to hold under the conditions (dist) and (dist). Correction: Under the conditions (irred) and (dist) for the CM form σ\_ξ, which the preceding paragraph derives from ξ\_p ≢ ξ\_p̄. Reason: The paragraph just before lists exactly (irred) ρ\_{σ\_ξ} residually absolutely irreducible and (dist) distinct diagonal characters at p as the consequences of ξ\_p ≢ ξ\_p̄; Hida–Tilouine's main conjecture needs both.
- **AutomorphicCongruences/E9** (misprint, BCS-v2, arXiv:2405.00270v2, proof of Prop. 5.2.1, p. 10). Printed: The proof appeals twice to 'Proposition 4.1.3 (and its proof)'. Correction: Theorem 4.1.3 (with Corollary 4.1.4 for the product form). Reason: §4.1 of v2 numbers the equivalence of the two-variable main conjectures Theorem 4.1.3 (p. 8); there is no Proposition 4.1.3. RT-AREA-iwasawa-1/29 records the same mismatch.
- **AutomorphicCongruences/E10** (gap, FW-v3, arXiv:2107.13726v3, §4.8, p. 68). Printed: The proof of Theorem 1.6 is described as similar to §4.6 'but much easier': prove the two-variable Rankin–Selberg main conjecture over K by reducing to Theorem 7.32 via Beilinson–Flach reciprocity and Poitou–Tate as in Castella–Wan Thm 3.8 (weight two), then combine with Kato. Correction: A complete proof must extend Castella–Wan Thm 3.8 to weight k, descend from K to the cyclotomic line separating the f and f ⊗ χ\_K factors, and remove the power of p (Castella–Wan's equivalence holds only up to powers of p) by an argument of §4.6.3 type using Kato's bound; these steps are planned in L2/fw-ordinary-reverse-bound. Reason: Castella–Wan Thm 3.8 is stated up to powers of p (p. 16), and §4.6.3's p-power argument is written for the crystalline residually irreducible case; FW §4.8 does not say how the ordinary case is adapted.

The packet also follows ModularIwasawaMainConjectures/E1–E3 (Fouquet–Wan's hypotheses and citations) and the fifteen issues PAPER-NAKAMURA-23/E1–E15 of the Nakamura extraction.

## Structural proposals

- **split** (AutomorphicCongruences). HeegnerPointEulerSystems:HE.8b's request names the Hida–Tilouine anticyclotomic main conjecture as 'proposed AC L0c', and RT-AREA-iwasawa-1/26 asks for a layer of AutomorphicCongruences for it. Proposal: Add a sub-layer L0c 'Anticyclotomic main conjectures for CM fields (Hida–Tilouine)' under L0, containing L0/hida-tilouine-anticyclotomic; it requires AutomorphicPadicLFunctions:L3 and L3h and supplies L2s and HeegnerPointEulerSystems:HE.8b. The node keeps its id.
- **rescope** (AutomorphicCongruences, AutomorphicGaloisRepresentationsPartII, AutomorphicPadicLFunctions, MetaplecticAutomorphicForms, GeneralizedHeegnerCycles, CompletedCohomologyAndLocalGlobalCompatibility, PadicLocalLanglandsForGL2Qp, KatoEulerSystems). Stage edges realised by node prerequisites of this packet but missing from the atlas (confirmed findings RT-AREA-iwasawa-1/6, /22, /24, /25, /27, /28 and RT-AREA-automorphic-1/20, and RS-11). Proposal: Add the stage edges AutomorphicGaloisRepresentationsPartII:AG2.2, AG2.5, AG2.6 → AutomorphicCongruences:L1, L2, L2s; AutomorphicCongruences:L2s → L2; AutomorphicPadicLFunctions:L3h → L1, L2s; MetaplecticAutomorphicForms:MP.6 → L2; GeneralizedHeegnerCycles:GH.7 → L2 (already an ancestor through GH.8); KatoEulerSystems:L4 → L2 and L5a; CompletedCohomologyAndLocalGlobalCompatibility:R31.4, PadicLocalLanglandsForGL2Qp:R30.5, R30.6, SmoothRepresentationsOfLocalGroups:SR.5 → L3; ModularIwasawaMainConjectures:L0 → L1, L3, L4; ModularIwasawaMainConjectures:L1 → L4 (the ordinary seed). Each is acyclic: none of the sources has an AutomorphicCongruences ancestor except ModularIwasawaMainConjectures:L1, whose AutomorphicCongruences ancestors are L1 and L2, both upstream of L4.
- **rescope** (AutomorphicCongruences, ModularIwasawaMainConjectures, HeegnerPointEulerSystems). RS-11's two requested cuts. Proposal: Remove the stage edges AutomorphicCongruences:L5 → ModularIwasawaMainConjectures:L3 and HeegnerPointEulerSystems:HE.8b → AutomorphicCongruences:L5b; this packet's L5 node is an aggregate, and no node here depends on HE.8b.
- **rescope** (AutomorphicCongruences, RankZeroOneBSD, HeegnerPointEulerSystems). Ownership notes for two consumers: RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity builds the CGS class from Kings–Loeffler–Zerbes classes specialized to the CM family in weight two, and HeegnerPointEulerSystems:HE.8b consumes L5a. Proposal: BSD.7a's node should import L2/klz-beilinson-flach-classes and L2/bf-explicit-reciprocity instead of restating the Hida-family construction; the stage order is L5a → HE.8b, never HE.8b → L5a (no node of L5a uses HE.8b).
- **merge** (AutomorphicCongruences, IntegralHeckeAndGaloisDeterminants). L0/lattice-construction is SU §4's abstract construction for polarized 1+n+1 data; it is generic algebra, used by SU, CLW, FW and Wan 2015, and no IHG layer states it. Proposal: Keep it in L0 now; if IntegralHeckeAndGaloisDeterminants gains a Part II layer for polarized lattice constructions (the extension requested by AutomorphicCongruences--L5b of IHG.6), move the node there and import it from L0, keeping the source-specific instances (L1/su-selmer-lower-bound, L2s/clw-main-divisibility, L2/fw-greenberg-divisibility) here.

## Red-team findings handled here

- **RT-AREA-automorphic-1/20.** L2 and L2s import the unitary Jacobi group, Jacobi spaces and Fourier–Jacobi periods from MetaplecticAutomorphicForms:MP.6 (which now plans them) and request Ikeda's Fourier–Jacobi description there; L2 gains the MP edge (restructure 'link'). Nodes: `AutomorphicCongruences:L2s/fourier-jacobi-primitivity`, `AutomorphicCongruences:L2/fw-fourier-jacobi-unit`.
- **RT-AREA-iwasawa-1/6.** The Galois representations of GU(2,2) and U(3,1) and their families are imported from AutomorphicGaloisRepresentationsPartII AG2.2/AG2.5/AG2.6 (request), not constructed; L1 builds only the pseudo-character and the extension classes; the CAP exclusion names Kisin/Pan (GL2ModularityLifting) and Harris (gap). Nodes: `AutomorphicCongruences:L1/gu22-galois-pseudocharacter`, `AutomorphicCongruences:L2s/cap-exclusion`.
- **RT-AREA-iwasawa-1/7.** Vatsal, Finis and Hsieh 2012 enter through AutomorphicPadicLFunctions:L3h's mod-p nonvanishing nodes (its proposed sub-layer L3m); L1 and L2s cite them, and Vatsal 2003 is recorded as an inherited gap. Nodes: `AutomorphicCongruences:L1/su-padic-l-function`, `AutomorphicCongruences:L1/nonsingular-coefficient-coprimality`, `AutomorphicCongruences:L2s/semi-ordinary-klingen-family`.
- **RT-AREA-iwasawa-1/22.** FW Thm 1.6's §4.8 route is planned in L2 (L2/fw-ordinary-reverse-bound via Thm 7.32, Beilinson–Flach reciprocity and the Castella–Wan equivalence), with Castella–Wan Thm 3.8 and the KLZ classes as named targets; L1 is SU only; the canonical/Gross period comparison is a recorded gap. Nodes: `AutomorphicCongruences:L2/fw-ordinary-reverse-bound`, `AutomorphicCongruences:L2/castella-wan-equivalence`, `AutomorphicCongruences:L2/klz-beilinson-flach-classes`.
- **RT-AREA-iwasawa-1/24.** L2 imports CLW's weight-two semi-ordinary Hida theory, Klingen family and lattice argument from L2s and adds only FW §7.2–7.4's general-weight control, vector-valued family and Fourier–Jacobi unit. Nodes: `AutomorphicCongruences:L2/general-weight-semi-ordinary-control`, `AutomorphicCongruences:L2/vector-valued-klingen-family`.
- **RT-AREA-iwasawa-1/25.** AutomorphicPadicLFunctions:L3h (Theorems A, B, C) is a prerequisite of L2s; the request asks L3h to name L2s among its consumers. Nodes: `AutomorphicCongruences:L2s/clw-integrality-and-p-inverted`, `AutomorphicCongruences:L2s/semi-ordinary-klingen-family`.
- **RT-AREA-iwasawa-1/26.** The integrality of the CLW function is stated with both inputs: the Hida–Tilouine anticyclotomic main conjecture (L0/hida-tilouine-anticyclotomic, proposed sub-layer L0c, gap for the unread papers) and Hida's Rankin–Selberg function of a CM family (requested from AutomorphicPadicLFunctions:L3). Nodes: `AutomorphicCongruences:L2s/clw-integrality-and-p-inverted`, `AutomorphicCongruences:L0/hida-tilouine-anticyclotomic`.
- **RT-AREA-iwasawa-1/27.** The Yager module and unramified exponential are imported from GeneralizedHeegnerCycles:GH.7; L2 keeps only FW §4.2.1's boundedness. Nodes: `AutomorphicCongruences:L2/unramified-exponential-boundedness`.
- **RT-AREA-iwasawa-1/28.** L3 imports Emerton's local–global compatibility (R31.4), Paškūnas's results (R30.5, R30.6) and co-Whittaker families (SR.5) through explicit prerequisites; the stage edges are proposed in restructure 'link'. Nodes: `AutomorphicCongruences:L3/completed-homology-factorization`, `AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`, `AutomorphicCongruences:L3/nakamura-specialization-theorem`.
- **RT-AREA-iwasawa-1/29.** L5a uses BCS Theorem 4.1.3 (not 4.2.1), Lemmas 5.1.1–5.1.2, Prop. 4.2.2 and Prop. 5.2.1; Theorem 4.2.1 is left to HE.8/HE.8b. The label mismatch is source issue E9. Nodes: `AutomorphicCongruences:L5a/ordinary-two-variable-equivalence`, `AutomorphicCongruences:L5a/two-variable-product-containment`, `AutomorphicCongruences:L5a/greenberg-mu-vanishing`.
- **RT-AREA-iwasawa-1/30.** The ordinary BSTW comparison has the single planned owner KatoEulerSystems L5 (RS-11); L5a states the contract as an interface node with a request and a gap and does not depend on BSD.6a. Nodes: `AutomorphicCongruences:L5a/ordinary-two-variable-equivalence`.
- **RT-AREA-langlands-1/8.** No node of L5 or L5a uses an Igusa supplier: the Hilbert Igusa inputs of the quartic-CM argument are L5w's (packet AutomorphicCongruences--L5b) and AutomorphicPadicLFunctions:L3's; the L5 aggregate node imports no Igusa stage. Nodes: `AutomorphicCongruences:L5/ordinary-elliptic-refinement-aggregate`.
- **RT-AREA-langlands-1/27.** The generic congruence module Ψ\_λ(M) and congruence ideal η\_λ are imported from PadicFamilies:L1/congruence-module and congruence-ideal, now planned there; L0 keeps only the Hecke-specific period comparison. Nodes: `AutomorphicCongruences:L0/canonical-period-congruence-number`.

## Paper route: Nakamura, Zeta morphisms for rank two universal deformations

- PAPER-NAKAMURA-23/1: `AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`. Theorem 1.1 with Remark 1.2.
- PAPER-NAKAMURA-23/2: `AutomorphicCongruences:L3/nakamura-specialization-theorem`. Theorem 4.3 and Remark 4.4.
- PAPER-NAKAMURA-23/3: `AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`. Corollary 4.2 (API NakamuraZeta.conj, NakamuraZeta.norm).
- PAPER-NAKAMURA-23/4: `AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`, `AutomorphicCongruences:L3/completed-homology-factorization`. The construction of §4.1 (φ\_1, Lemma 4.1, removal of P̃, Whittaker functor).
- PAPER-NAKAMURA-23/5: `AutomorphicCongruences:L4/nakamura-lambda-defect`. Theorem 1.4, as the specialization of the §5.3 statements.
- PAPER-NAKAMURA-23/26: `AutomorphicCongruences:L3/equivariant-zeta-morphism-completed-homology`. Proposition 3.8 (CompZeta.finiteLevel).
- PAPER-NAKAMURA-23/27: `AutomorphicCongruences:L3/equivariant-zeta-morphism-completed-homology`. Corollary 3.14 and Proposition 3.15 (CompZeta.integral); its source issue E5 is followed.
- PAPER-NAKAMURA-23/28: `AutomorphicCongruences:L3/equivariant-zeta-morphism-completed-homology`. Theorem 3.16 (CompZeta.limit, conj, norm).
- PAPER-NAKAMURA-23/29: `AutomorphicCongruences:L3/equivariant-zeta-morphism-completed-homology`. Proposition 3.17 (CompZeta.weight).
- PAPER-NAKAMURA-23/30: `AutomorphicCongruences:L3/nakamura-specialization-theorem`. Corollary 4.8 and Proposition 4.9, steps of the proof of Theorem 4.3.
- PAPER-NAKAMURA-23/31: `AutomorphicCongruences:L3/nakamura-specialization-theorem`. The proof of Theorem 4.3 (§4.4), with the source issues E5, E7, E8.
- PAPER-NAKAMURA-23/40: `AutomorphicCongruences:L4/zeta-morphism-congruences`. Corollary 5.6 (with source issue E11).
- PAPER-NAKAMURA-23/41: `AutomorphicCongruences:L4/residual-zeta-morphism`. The residual zeta morphism, X(ρ̄) and change of Σ (79).
- PAPER-NAKAMURA-23/42: `AutomorphicCongruences:L4/nakamura-residual-structure`. Published Theorem 5.7 and Conjecture 5.8 (arXiv v2 Theorem 5.7).
- PAPER-NAKAMURA-23/43: `AutomorphicCongruences:L4/nakamura-residual-structure`. Published Theorem 5.9 and Conjecture 5.10 (arXiv v2 Theorem 5.8, Conjecture 5.9).
- PAPER-NAKAMURA-23/44: `AutomorphicCongruences:L4/nakamura-residual-structure`. Published Theorem 5.11 and Conjectures 5.12–5.13 (arXiv v2 Theorem 5.10, Conjectures 5.11–5.12).
- PAPER-NAKAMURA-23/45: `AutomorphicCongruences:L4/nakamura-lambda-defect`. Published Theorem 5.14 and Corollary 5.15 (arXiv v2 Theorem 5.13, Corollary 5.14), with source issue E12.

## Requests of other roadmaps answered here

- HeegnerPointEulerSystems:HE.8b/anticyclotomic-reverse-product-divisibility (HeegnerPointEulerSystems--HE.7s) → `AutomorphicCongruences:L5a` (partial): `AutomorphicCongruences:L5a/ordinary-two-variable-equivalence`, `AutomorphicCongruences:L5a/quartic-cm-selmer-restriction`, `AutomorphicCongruences:L5a/quartic-cm-l-function-factorization`. BCS Thm 4.1.3/Cor. 4.1.4 is stated as an interface node whose proof owner (KatoEulerSystems L5, RS-11) is not yet a stage; Lemmas 5.1.1 and 5.1.2 are planned.
- HeegnerPointEulerSystems:HE.8b (HeegnerPointEulerSystems--HE.7s) → `AutomorphicCongruences:L5w` (answered): `AutomorphicCongruences:L5w/quartic-cm-divisibility`, `AutomorphicCongruences:L5w/selected-base-change-hypotheses`. L5w is planned in the accepted part AutomorphicCongruences--L5b; this part only consumes it.
- HeegnerPointEulerSystems:HE.8b/primitive-greenberg-mu-vanishing, anticyclotomic-specialization-control, anticyclotomic-reverse-product-divisibility (HeegnerPointEulerSystems--HE.8b) → `AutomorphicCongruences:L5a` (answered): `AutomorphicCongruences:L5a/two-variable-product-containment`, `AutomorphicCongruences:L5a/auxiliary-field-existence`, `AutomorphicCongruences:L5a/quartic-cm-selmer-restriction`, `AutomorphicCongruences:L5a/quartic-cm-l-function-factorization`, `AutomorphicCongruences:L5a/greenberg-mu-vanishing`, `AutomorphicCongruences:L5a/ordinary-two-variable-equivalence`. Prop. 5.2.1 (integral), the six auxiliary-field conditions, Lemma 5.1.1, Lemma 5.1.2 after inverting p, and Prop. 4.2.2 through L3h; Thm 4.1.3 is imported (interface), not owned; completed L5b is not an input.
- ModularIwasawaMainConjectures:L1/su-ordinary-theorem → `AutomorphicCongruences:L1` (answered): `AutomorphicCongruences:L1/su-two-variable-theorem`, `AutomorphicCongruences:L1/su-cyclotomic-divisibility`. SU Thm 3.6.1, Cor. 3.6.2 and Cor. 3.6.3 in their source range, integral; the equality and Skinner 2016's rank-one-unipotent integral refinement stay with the consumer.
- ModularIwasawaMainConjectures:L1/fw-ordinary-theorem → `AutomorphicCongruences:L2` (answered): `AutomorphicCongruences:L2/fw-ordinary-reverse-bound`, `AutomorphicCongruences:L2/fw-greenberg-divisibility`, `AutomorphicCongruences:L2/castella-wan-equivalence`. The FW §4.8 route with Thm 7.32, Beilinson–Flach reciprocity, Poitou–Tate and Kato inside the proof; the unwritten ordinary p-power step is gap fw-4-8-sketch and source issue E10.
- ModularIwasawaMainConjectures:L2/fw-pointwise-theorem, L4/fw-universal-family-theorem → `AutomorphicCongruences:L4` (answered): `AutomorphicCongruences:L4/fw-pointwise-theorem`, `AutomorphicCongruences:L4/fw-universal-family-theorem`, `AutomorphicCongruences:L3/fw-residual-hypotheses`. Thms 5.1–5.2 over O\_Iw and over the regular Λ; the scalar exclusion question (ModularIwasawaMainConjectures/E1) is answered by keeping Assumption 2.1 as a separate predicate the proof uses.
- RankOneConverse:PC.2/wan-divisibility → `AutomorphicCongruences:L2` (answered): `AutomorphicCongruences:L2/wan-rankin-selberg-divisibility`, `AutomorphicCongruences:L2/exceptional-height-one-primes`. Wan20 Thm 1.2 (published ordinary theorem), p-inverted, both root numbers.
- RankZeroOneBSD:BSD.6a/wan-anticyclotomic-divisibility, castella-higher-weight-input (RankZeroOneBSD--BSD.0) → `AutomorphicCongruences:L2` (answered): `AutomorphicCongruences:L2/fw-greenberg-divisibility`, `AutomorphicCongruences:L2/wan-rankin-selberg-divisibility`, `AutomorphicCongruences:L2/exceptional-height-one-primes`, `AutomorphicCongruences:L2/greenberg-function-factorization`. FW Thm 7.32 = Thm 4.41 with and without the Steinberg-twist hypothesis, and the factorization Cor. 7.21 with class-number, period and local factors.
- RankZeroOneBSD:BSD.6a/wan-anticyclotomic-divisibility, bstw-signed-main-conjecture (RankZeroOneBSD--BSD.0) → `AutomorphicCongruences:L2s` (answered): `AutomorphicCongruences:L2s/clw-main-divisibility`, `AutomorphicCongruences:L2s/clw-integrality-and-p-inverted`. CLW Thm 8.2.1 (1) and (2); one-sided and source-qualified, covering supersingular π (a\_p = 0) of weight two unramified at p.
- RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture (RankZeroOneBSD--BSD.0) → `AutomorphicCongruences:L5a` (partial): `AutomorphicCongruences:L5a/ordinary-two-variable-equivalence`. L5a imports the ordinary BSTW comparison from the planned KatoEulerSystems L5 (interface node) and does not depend on BSD.6a; the signed early comparison (BSD.6z) is not used by L5a.
- RankZeroOneBSD:BSD.7a/kriz-eisenstein-congruence, integral-two-variable-functions (RankZeroOneBSD--BSD.7) → `AutomorphicCongruences:L0` (declined): `AutomorphicCongruences:L0/eisenstein-ideal`, `AutomorphicCongruences:L0/primitive-imprimitive-comparison`. Kriz's Eisenstein congruence for weight-two forms and its CM evaluations are the Eisenstein analogue that the L5a stage text assigns to RankZeroOneBSD BSD.7a; L0 supplies only the generic Eisenstein ideal and the Euler-factor comparison.
- SerreWeightAndLevelOptimisation:R20.1/congruence-module (request to IHG.1 listing AutomorphicCongruences:L0) → `IntegralHeckeAndGaloisDeterminants:IHG.1` (answered): `PadicFamilies:L1/congruence-module`, `PadicFamilies:L1/congruence-ideal`. L0 imports the generic congruence module and ideal from PadicFamilies:L1, which now plans them.
- AutomorphicCongruences:L5w and L5b nodes (AutomorphicCongruences--L5b) → `AutomorphicCongruences:L0` (partial): `AutomorphicCongruences:L0/lattice-construction`, `AutomorphicCongruences:L0/su-lattice-datum`, `AutomorphicCongruences:L0/primitive-imprimitive-comparison`, `AutomorphicCongruences:L0/selmer-specialization-control`, `AutomorphicCongruences:L0/extension-class-local-conditions`. The general polarized rank-four (1+2+1) lattice theorem, the Σ-primitive Euler comparisons and the specialization control are planned; Wan 2015's Hilbert Gorenstein congruence line (Def. 79) is Hilbert-specific and stays with L5w.
- AutomorphicCongruences:L5w/klingen-interpolation, height-one-congruence (AutomorphicCongruences--L5b) → `AutomorphicCongruences:L1` (partial): `AutomorphicCongruences:L1/gu22-hida-control`, `AutomorphicCongruences:L1/padic-eisenstein-family`. The boundary exact sequence and the cuspidal lifting are planned over ℚ for GU(2,2) of an imaginary quadratic field (SU); the totally real version over F is Wan 2015's and comes through AutomorphicPadicLFunctions:L4 and L5w.
- AutomorphicCongruences:L5b/four-factor-product-bound, rational-cyclotomic-endpoint (AutomorphicCongruences--L5b) → `AutomorphicCongruences:L5a` (answered): `AutomorphicCongruences:L5a/two-variable-product-containment`, `AutomorphicCongruences:L5a/auxiliary-field-existence`, `AutomorphicCongruences:L5a/quartic-cm-selmer-restriction`, `AutomorphicCongruences:L5a/quartic-cm-l-function-factorization`. The early integral product inequality, Lemma 5.2.3 and Lemmas 5.1.1–5.1.2; the 'new ramified K-prime outside D\_F' requirement is not in BCS v2 and is not added.

