# P-adic Hodge theory and geometric comparison — part P7

## Purpose

This is part 1 of 2 of the roadmap `PadicHodgeTheory`. Part 2 (stages R06.5 and R06.6: geometric comparison
and arithmetic consequences) is a separate job. This part plans:

- the analytic coefficient rings of $p$-adic Hodge theory;
- the period rings and the period functors;
- the pro-étale period sheaves of Scholze's relative theory;
- the $p$-adic monodromy theorem with its Weil–Deligne parameters;
- the small-weight interface with integral theory.

The spine is Fontaine's theory as written in two public texts, each with complete proofs:

- Brinon–Conrad, *CMI Summer School notes on p-adic Hodge theory*;
- Fontaine–Ouyang, *Theory of p-adic Galois representations*.

Around it:

- Scholze, *p-adic Hodge theory for rigid-analytic varieties* (Forum Math. Pi 1 (2013)), with its
  erratum, for the period sheaves;
- Tan–Tong (arXiv:1510.05543) for the crystalline period sheaves;
- Berger, *Représentations p-adiques et équations différentielles* (Invent. Math. 148 (2002)), and his
  introduction arXiv:math/0210184, for the Robba ring of a $p$-adic field and the $p$-adic monodromy
  theorem;
- Berger, *Équations différentielles p-adiques et (φ,N)-modules filtrés* (Astérisque 319), for the
  proof of Colmez–Fontaine;
- Fontaine–Laffaille, *Construction de représentations p-adiques* (Ann. Sci. ÉNS 15 (1982)), for small
  weights;
- Kedlaya–Liu, *Relative p-adic Hodge theory: Foundations*, for annuli and Robba rings.

Several texts are not public and are never cited as read: Fontaine's Astérisque 223 papers,
Colmez–Fontaine, Cherbonnier–Colmez, Fontaine's Astérisque 295, Brinon's Mémoire and Fontaine's 1982
Annals paper. The packet cites the public statements of their results and records each missing proof as a
gap.

Two earlier decisions bind this part:

- **The restructuring RS-01** (accepted) keeps all ten stages of this roadmap. It makes R06.1 the single
  owner of the rational period rings formerly built in CohomologyComparisons CP.0; CP.0–CP.3 import them.
- **The reviewed decomposition** `data/decompositions/PadicHodgeTheory.json` supplies ten accepted nodes
  from Scholze's paper. Their ids are kept.

Consumers that name exact statements, all served by nodes of this part:

- **ColemanIntegration L0/L1** and **PadicDifferentialEquationsAndRigidCohomology RD.0/RD.2** need the
  Laurent-series rings of annuli and Berger's $B^\dagger_{\mathrm{rig},K} = \mathcal R_{F'}(\pi_K)$.
- **MordellLawrenceVenkatesh** needs:
  - exactness and tensor compatibility of $D_{\mathrm{dR}}$;
  - filtered φ-modules;
  - weak admissibility of $D_{\mathrm{cris}}(V)$;
  - $t_H$ and $t_N$;
  - Tate–Sen.
- **FaltingsFinitenessAndIsogenyTheorems** needs Tate's theorems on $C(\psi)$ and the Hodge–Tate
  decomposition.
- **CohomologyComparisons** needs the period rings, $B_{\mathrm{cris}}^{G_K}$ and the period functors.
  Its requests for Kisin's functor and Scholze's comparison are redirected: to FiniteFlatGroups R07.4 and
  to part 2 of this roadmap.

## How this document is organized

The layers appear in dependency order:

1. R06.1 (period rings);
2. P7:annulus-foundations;
3. P8:local-rational;
4. P8;
5. R06.2 (period functors);
6. P7 (Berger's Robba dictionary);
7. R06.3;
8. R06.4.

Each section:

1. opens with what the layer does;
2. gives its objects (definitions and constructions), each with:
   - the suggested module and the statement;
   - the API declarations;
   - the unit tests that pin the definition down;
3. gives its lemmas, theorems, comparisons and acceptance applications, each with:
   - the statement and its hypotheses;
   - the proof outline and the acceptance tests;
   - the results used;
4. ends with what is still missing.

The packet `research/blueprint/packets/PadicHodgeTheory--P7.json` carries the same material with source
locators and excerpts. `research/blueprint/suggested/PadicHodgeTheory--P7.lean` sketches the Lean
signatures in the namespace `TauCeti.PadicHodge`.

## Scope and boundaries

**In scope.** The stages P7:annulus-foundations, P7, P8:local-rational, P8, R06.1, R06.2, R06.3 and R06.4.
The annulus foundations are `source_decomposed`; the other stages are `partial`, with precise remaining
lists.

**Boundaries with neighbouring roadmaps.**

- `PhiGammaModulesAndIwasawaCohomology` owns:
  - the field of norms and the Witt-vector realisation of the cyclotomic rings (PG.0);
  - étale $(\varphi,\Gamma)$-modules and the Galois equivalence (PG.1);
  - Cherbonnier–Colmez overconvergence and the Robba realisation (PG.2);
  - Herr complexes (PG.3), ψ and the Iwasawa comparison (PG.4–PG.5), and Wach modules (PG.6).

  P7:annulus-foundations owns the analytic carriers on which PG.0 builds. P7 imports the rest and plans
  only the comparisons.
- `PadicDifferentialEquationsAndRigidCohomology`:
  - RD.0 plans the structure theory of Robba rings (units, Bézout property, the general extended Robba
    ring) on top of P7:annulus-foundations;
  - RD.2 exports Kedlaya's local monodromy theorem, which R06.3 consumes. The consumed nodes are
    `RD.2/logarithmic-form-of-local-monodromy` and `RD.2/berger-form-of-local-monodromy`.
- `ColemanIntegration` L0 owns residues and logarithmic primitives on annuli.
- `AInfCohomology` owns $A_{\mathrm{inf}}$, ξ, μ and the integral pro-étale sheaves (AI.0, AI.3).
  `PerfectoidSpaces` owns perfectoid spaces, the tilt and the principal kernel of θ (P1).
  `CrystallineCohomology` CR.0 owns the PD envelope that defines $A_{\mathrm{cris}}$.
- `CohomologyComparisons` owns the comparison theorems (CP.2–CP.4); P8 applies them.
  `HodgeTateAndCanonicalSubgroups` T1 consumes the degree-one comparison.
- `ArithmeticGaloisRepresentations` R01.2 owns Weil–Deligne representations for $\ell\ne p$. R06.3 owns
  Fontaine's $p$-adic recipe and the convention comparison.
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory` owns the integral Fontaine–Laffaille theory (R07.3) and
  Breuil–Kisin modules (R07.4). R06.4 plans only their rational consequences.

## Conventions

- **Fields and Galois groups.** $K/\mathbb Q_p$ is finite, with residue field $k$, and
  $K_0 = W(k)[1/p]$. $K_n = K(\mu_{p^n})$, $K_\infty = \bigcup K_n$, $H_K = \mathrm{Gal}(\bar K/K_\infty)$
  and $\Gamma_K = G_K/H_K$. $C = \hat{\bar K}$, and $\mathbb C_p$ is Mathlib's `PadicComplex`.
- **The tilt and the special elements.** The tilt is $C^\flat$ and $A_{\mathrm{inf}} = W(\mathcal O_{C^\flat})$.
  θ is Mathlib's `WittVector.fontaineTheta` and ξ generates its kernel. Further, $\varepsilon = (1,\zeta_p,
  \zeta_{p^2},\dots)$, $\pi = [\varepsilon]-1$ and $t = \log[\varepsilon]$.
- **Hodge–Tate weights.** The cyclotomic character has Hodge–Tate weight $+1$. So $\mathbb Q_p(n)$ has
  weight $n$, and the Hodge–Tate weights of a de Rham representation are the negatives of the filtration
  jumps of $D_{\mathrm{dR}}$. The sign dictionary for each source is recorded in R06.4.
- **Period rings.** $B_{\mathrm{dR}}^+$ is Mathlib's `BDeRhamPlus`, with $\mathrm{Fil}^i B_{\mathrm{dR}} =
  t^iB_{\mathrm{dR}}^+$. $B_{\mathrm{st}} = B_{\mathrm{cris}}[u]$ with $u = \log[p^\flat]$,
  $N = -d/du$ and $N\varphi = p\varphi N$. The embedding $B_{\mathrm{st}} \to B_{\mathrm{dR}}$ is taken
  with $\log p = 0$. Berger's monodromy operator on $\tilde B^\dagger_{\log}$ is normalised by
  $N(\log\pi) = -p/(p-1)$, which agrees with Fontaine's.
- **Robba rings.** Kedlaya's notation $\mathcal R$, $\mathcal R^{\mathrm{bd}}$, $\mathcal R^{\mathrm{int}}$ and
  $\mathcal E$ is used for rings of annuli. Berger's notation $B^\dagger_K$, $B^\dagger_{\mathrm{rig},K}$ and
  $B^\dagger_{\log,K}$ is used in the cyclotomic variable π, with $\varphi(\pi) = (1+\pi)^p-1$ and
  $\gamma(\pi) = (1+\pi)^{\chi(\gamma)}-1$.

## R06.1 Period rings

**What Mathlib already has.** $\mathbb C_p$, its integers, the tilt, θ with its surjectivity, and $B_{\mathrm{dR}}^+$ and $B_{\mathrm{dR}}$ for a general perfectoid-type ring. This layer cites them as baseline.

**What this layer plans.**

- The Galois action on $\mathbb C_p$, Ax–Sen–Tate, Tate's normalised traces and the Tate–Sen theorem. No other stage owned these.
- The generator ξ of $\ker\theta$ and $B_{\mathrm{dR}}^+$ as a complete discrete valuation ring, with its natural topology; the element $t$, the filtration $t^iB_{\mathrm{dR}}^+$ and $\mathrm{gr}\,B_{\mathrm{dR}} = \bigoplus C(i)$.
- $B_{\mathrm{HT}}$.
- $A_{\mathrm{cris}}$ (imported from CR.0) with its embedding into $B_{\mathrm{dR}}^+$; $B_{\mathrm{cris}}$ with Frobenius, and $B_{\mathrm{st}}$ with $\varphi$, $N$ and the Galois action.
- The embeddings into $B_{\mathrm{dR}}$, the fundamental exact sequence, and the invariants $B_{\mathrm{dR}}^{G_K} = K$ and $B_{\mathrm{cris}}^{G_K} = B_{\mathrm{st}}^{G_K} = K_0$.

No read source proves the injectivity of $A_{\mathrm{cris}} \to B_{\mathrm{dR}}^+$: Brinon–Conrad omit it and Fontaine–Ouyang leave it as an exercise. It is a recorded gap, with a proof route.

### Objects

#### Construction. The continuous isometric action of G_K on C_p

*Module* `TauCeti/PadicHodge/PeriodRings/GaloisActionCp.lean`. *Node* `PadicHodgeTheory:R06.1/galois-action-on-cp`.

Let Q̄_p = PadicAlgCl p and let K ⊆ Q̄_p be a finite extension of Q_p; put G_K = Gal(Q̄_p/K) with its Krull topology. Every σ ∈ G_{Q_p} is an isometry of Q̄_p for the spectral norm, hence extends uniquely to a continuous (indeed isometric) field automorphism σ̂ of C = ℂ_[p] = completion of Q̄_p. The rule σ ↦ σ̂ is an injective group homomorphism G_{Q_p} → Aut(C) whose image is the group of continuous Q_p-algebra automorphisms of C; restricting to G_K gives an action of G_K on C by isometric K-algebra automorphisms which preserves O_C and its maximal ideal, and the action map G_K × C → C is continuous for the Krull topology on G_K and the norm topology on C. By functoriality it induces continuous actions on O_C/p, on the tilt O_C^♭ = PreTilt O_C p (commuting with PreTilt.untilt), on W(O_C^♭) (commuting with Frobenius and with θ) and on W(O_C^♭)[1/p].

*Hypotheses.* K/Q_p finite inside Q̄_p; G_K = Gal(Q̄_p/K). The same construction applies to any complete discretely valued K' ⊆ C with G_{K'} the closed subgroup of Aut_cont(C) fixing K' (B-C Remark 4.4.9).

*API.*

- `galoisActionCp` (*constructor*) — The group homomorphism Gal(Q̄_p/Q_p) → (C ≃+* C), σ ↦ σ̂ (continuous extension of σ).
- `galoisActionCp_coe` (*simp*) — σ̂(x) = σ(x) for x ∈ Q̄_p ⊆ C.
- `norm_galoisActionCp` (*simp*) — |σ̂ x| = |x| for all x ∈ C.
- `continuous_galoisActionCp` (*instance*) — The action map G_K × C → C is jointly continuous (ContinuousSMul) for the Krull topology.
- `galoisActionCp_injective` (*characterisation*) — σ ↦ σ̂ is injective.
- `galoisActionCp_range` (*characterisation*) — The image of σ ↦ σ̂ is the group of continuous Q_p-algebra automorphisms of C.
- `galoisActionCp_mem_integers` (*other*) — σ̂ maps O_C onto O_C and m_C onto m_C.
- `galoisActionCp_cyclotomic` (*compatibility*) — σ̂(ζ) = ζ^{χ(σ)} for p-power roots of unity ζ, χ = cyclotomicCharacter.
- `galoisActionPreTilt` (*functoriality*) — The induced action on O_C^♭ = PreTilt O_C p; PreTilt.untilt(σ x) = σ̂(PreTilt.untilt x).
- `fontaineTheta_galoisAction` (*compatibility*) — θ(W(σ)(w)) = σ̂(θ(w)) for w ∈ W(O_C^♭).

*Used by.*

- Brinon–Conrad §2.1–2.2 — G_K acts on C_K ⊗ V for every p-adic representation V; all C-representations use this action
- R06.1 period rings — the actions on O_C^♭, A_inf, B_dR^+, A_cris, B_cris and B_st are induced from it by functoriality
- `PadicHodgeTheory:P8:local-rational` — the pro-étale period sheaves specialise at geometric points to rings with this G_K-action

*Unit tests.* A wrong definition fails one of these.

- `galoisActionCp_id` (degenerate) — The identity of Gal(Q̄_p/Q_p) acts as the identity of C.
- `galoisActionCp_restrict` (compatibility) — For σ ∈ Gal(Q̄_p/Q_p) and x ∈ Q̄_p, galoisActionCp σ (x : C) = (σ x : C).
- `galoisActionCp_zeta` (computation) — For σ ∈ Gal(Q̄_p/Q_p) and ζ a primitive p^n-th root of unity, galoisActionCp σ ζ = ζ ^ (χ(σ) mod p^n) with χ = cyclotomicCharacter.
- `galoisActionCp_not_discrete` (non-example) — For an open subgroup U of G_K the fixed field C^U is a finite extension of K (Ax–Sen–Tate), so the action on C is not discrete: C is not the union of the C^U.

*Construction.*

1. Isometry: for σ ∈ Gal(Q̄_p/Q_p), spectralNorm_eq_of_equiv gives |σx| = |x| on Q̄_p.
2. Extension: an isometric ring automorphism is uniformly continuous, so UniformSpace.Completion.map extends it to C; the extension of σ^{-1} is inverse to that of σ by uniqueness of continuous extensions (density of Q̄_p), and σ ↦ σ̂ is multiplicative by the same uniqueness.
3. Image: a continuous Q_p-automorphism of C maps Q̄_p (the elements algebraic over Q_p) to itself, so it is σ̂ for σ its restriction; injectivity is restriction to Q̄_p.
4. Continuity of G_K × C → C: given x ∈ C and ε > 0 choose y ∈ Q̄_p with |x − y| < ε; the stabilizer of y is open (y lies in a finite extension), and |σ̂x' − x| ≤ max(|x' − x|, |σ̂ y − y|, |x − y|) for x' near x, using the isometry property.
5. Integral structures: isometries preserve O_C and m_C; the induced actions on O_C/p and on the inverse limit PreTilt O_C p are by ring automorphisms; W(-) is functorial, Witt Frobenius and θ commute with functorial maps (θ is natural in the p-adically complete ring, Mathlib fontaineTheta_teichmuller characterises it on Teichmüller lifts).

*Acceptance.*

- For σ ∈ G_K and a compatible system (ζ_{p^n}) of p-power roots of unity in Q̄_p, σ̂(ζ_{p^n}) = ζ_{p^n}^{χ(σ)} with χ = Mathlib cyclotomicCharacter.
- σ̂ restricted to Q̄_p is σ; σ̂ is the identity on K.

*Uses.* `mathlib:PadicAlgCl`, `mathlib:PadicComplex`, `mathlib:spectralNorm_eq_of_equiv`, `mathlib:UniformSpace.Completion.map`, `mathlib:krullTopology`, `mathlib:cyclotomicCharacter`, `PadicHodgeTheory:R06.1/cp-integers-p-adically-complete`, `mathlib:PreTilt`, `mathlib:WittVector.fontaineTheta`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, §2.1, paragraph after Proposition 2.1.1, p. 12: “Since GK = Gal(K/K) acts on K by isometries, this action uniquely extends to an action on the field CK by isometries, and so identifies GK with the isometric automorphism group of CK over K.” This is the construction and the identification of its image.
- Theory of p-adic Galois representations, §3.1.2, before Question 3.7, p. 43: “Let GK = Gal(K s /K), C=K cs . The action of GK extends by continuity to C.” Same construction in F-O.

#### Construction. The tilt O_C^♭ of C_p with its valuation and the elements ε and p^♭

*Module* `TauCeti/PadicHodge/PeriodRings/Tilt.lean`. *Node* `PadicHodgeTheory:R06.1/tilt-of-cp-and-special-elements`.

Let O_C^♭ = PreTilt O_C p = lim_{x ↦ x^p} O_C/p (Mathlib PreTilt, for O_C = 𝓞_ℂ_[p] made p-adically complete by R06.1/cp-integers-p-adically-complete), with its sharp map x ↦ x^♯ = x^{(0)} (Mathlib PreTilt.untilt) and valuation v^♭(x) = v_p(x^♯) (Mathlib PreTilt.val, normalised so that v^♭ takes values in Q ∪ {∞}). Then O_C^♭ is a perfect valuation ring of characteristic p, v^♭-adically complete, with residue field k̄, the multiplicative bijection lim_{x↦x^p} O_C → O_C^♭, and Frac(O_C^♭) = C^♭ (Mathlib Tilt). Fix a compatible system ζ = (ζ_{p^n}) of primitive p-power roots of unity and a compatible system of p-power roots of p; they define ε = (1, ζ_p, ζ_{p^2}, …) and p^♭ = (p, p^{1/p}, …) in O_C^♭ with ε^♯ = 1, (p^♭)^♯ = p, v^♭(p^♭) = 1 and v^♭(ε − 1) = p/(p − 1). G_K acts on O_C^♭ (R06.1/galois-action-on-cp) with g(ε) = ε^{χ(g)} and g(p^♭) = p^♭ ε^{c(g)} for a continuous 1-cocycle c: G_K → Z_p (the Kummer cocycle of p); changing ζ replaces ε by ε^a, a ∈ Z_p^×.

*Hypotheses.* Only the valued field C and its G_K-action enter; K matters only through G_K ⊆ Aut_cont(C).

*API.*

- `TiltCp` (*data*) — O_C^♭ := PreTilt O_C p, a perfect ring of characteristic p.
- `TiltCp.val` (*projection*) — The valuation v^♭ = PreTilt.val, with v^♭(x) = v_p(x^♯).
- `epsilonFlat` (*constructor*) — ε ∈ O_C^♭ attached to a compatible system of primitive p-power roots of unity.
- `pFlat` (*constructor*) — p^♭ ∈ O_C^♭ attached to a compatible system of p-power roots of p.
- `untilt_epsilonFlat` (*simp*) — ε^♯ = 1.
- `untilt_pFlat` (*simp*) — (p^♭)^♯ = p.
- `val_epsilonFlat_sub_one` (*simp*) — v^♭(ε − 1) = p/(p − 1).
- `galois_epsilonFlat` (*relation*) — g(ε) = ε^{χ(g)} for g ∈ G_K.
- `epsilonFlat_change` (*relation*) — Another choice of roots of unity gives ε^a with a ∈ Z_p^×.

*Used by.*

- Brinon–Conrad §4.4 — ε gives t = log[ε] and p^♭ gives the generator ξ = [p^♭] − p of ker θ
- Brinon–Conrad §9.2 — p^♭ gives u = log[p^♭], the variable of B_st
- `AInfCohomology:AI.0:integral` — μ = [ε] − 1 and ξ = μ/φ^{-1}(μ) use the same ε

*Unit tests.* A wrong definition fails one of these.

- `untilt_epsilonFlat_eq_one` (computation) — PreTilt.untilt (epsilonFlat p ζ) = 1.
- `epsilonFlat_ne_one` (non-example) — epsilonFlat p ζ ≠ 1 (its first component ζ_p ≠ 1).
- `val_pFlat_eq_one` (computation) — v^♭(p^♭) = v_p(p) = 1 in the normalisation v^♭(x) = v_p(x^♯).
- `tiltCp_compat_tilt` (compatibility) — Frac(tiltCp) is Mathlib's Tilt for (C, v, O_C), i.e. the fraction field of PreTilt O_C p.

*Construction.*

1. The bijection between p-power compatible sequences in O_C and O_C^♭ and the formulas for addition and multiplication: B-C Proposition 4.3.1 / Remark 4.3.2; Mathlib realises it through PreTilt and PreTilt.untilt.
2. Valuation: B-C Lemma 4.3.3 (|x|_R = |x^{(0)}|_p is an absolute value making O_C^♭ a complete valuation ring with value group Q); Mathlib PreTilt.val is the same valuation with values in ℝ≥0.
3. v^♭(ε − 1): (ε − 1)^{(0)} = lim_n (ζ_{p^n} − 1)^{p^n} for odd p, so v^♭(ε − 1) = lim p^n v_p(ζ_{p^n} − 1) = lim p^n/(p^{n−1}(p − 1)) = p/(p − 1); p = 2 is treated with ζ_{2^n} + 1 (B-C Example 4.3.4).
4. Galois action: g(ζ_{p^n}) = ζ_{p^n}^{χ(g)} gives g(ε) = ε^{χ(g)} using the Z_p-module structure on the 1-units of O_C^♭.

*Acceptance.*

- v^♭(ε − 1) = p/(p − 1): PARI check of p^n·v_p(ζ_{p^n} − 1) = 3/2 for p = 3, n = 1,…,4.
- ε ≠ 1 but ε^♯ = 1.

*Uses.* `mathlib:PreTilt`, `mathlib:PreTilt.val`, `mathlib:PreTilt.untilt`, `mathlib:Tilt`, `mathlib:cyclotomicCharacter`, `PadicHodgeTheory:R06.1/cp-integers-p-adically-complete`, `PadicHodgeTheory:R06.1/galois-action-on-cp`, `PerfectoidSpaces:P1/tilt-of-perfectoid-field`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Lemma 4.3.3, p. 53: “is a GK -equivariant absolute value on R that makes R the valuation ring for the unique valuation vR on Frac(R)” The valuation on the tilt (B-C's R = O_C^♭).
- CMI Summer School notes on p-adic Hodge theory, Example 4.3.4, p. 54: “with ε(0) = 1 but ε(1) 6= 1 (so ε(1) = ζp is a primitive pth root of unity and hence ε(n) is a primitive pn th root of unity for all n ⩾ 0).” The element ε; the example computes v_R(ε − 1) = p/(p − 1).

#### Construction. A_inf, B_inf, B_dR^+ and B_dR of a perfectoid affinoid (K, K^+)-algebra; the element ξ

*Module* `TauCeti/PadicHodge/PeriodRings/BdRAffinoid.lean`. *Node* `PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras`.

Let K be a perfectoid field of characteristic 0 with an open bounded valuation subring K^+, and fix π ∈ K♭ with π♯/p ∈ (K^+)^×. For a perfectoid affinoid (K, K^+)-algebra (R, R^+) set A_inf(R, R^+) = W(R♭+), B_inf = A_inf[1/p], B_dR^+(R, R^+) = lim B_inf/(ker θ)^i. There is ξ ∈ A_inf(K, K^+) of the form ξ = [π] − Σ_{i≥1} p^i [x_i] (x_i ∈ K♭+; the source writes x_i ∈ O_{K♭}, but ξ must lie in W(K♭+), and writing π♯ = p·u with u ∈ (K^+)^× and lifting u through the surjection θ: W(K♭+) → K^+ produces x_i ∈ K♭+) generating ker(θ: A_inf(K, K^+) → K^+); ξ is not a zero-divisor, hence unique up to a unit, and for every (R, R^+) the same ξ generates ker(θ: A_inf(R, R^+) → R^+) and is a nonzerodivisor there. Consequently B_dR(R, R^+) := B_dR^+(R, R^+)[ξ^{-1}] carries the filtration Fil^i = ξ^i B_dR^+ with gr^i B_dR(R, R^+) ≅ ξ^i R, a free R-module of rank 1, and gr^• B_dR(R, R^+) ≅ R[ξ^{±1}].

*Hypotheses.* K perfectoid of characteristic 0 with open bounded valuation subring K^+; π ∈ K♭ with π♯/p ∈ (K^+)^× (so π ∈ K♭+ is topologically nilpotent); (R, R^+) a perfectoid affinoid (K, K^+)-algebra in the field-based sense of Sch12. The proof uses that R♭+ is flat over K♭+ and that W(R♭+) and R^+ are p-torsion free (R^+ flat over Z_p). Surjectivity of θ: W(R♭+) → R^+ is recalled, not proved ("Moreover, we know that θ ... is surjective", line 2037). Its supplier is PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel. The construction of ξ needs this surjectivity for (K, K^+). The generation step uses W(R♭+)/(ξ, p) = R♭+/π = R^+/p, i.e. the tilting identification R♭+/π ≅ R^+/π♯ with π♯ ∈ p(K^+)^×. Its supplier is PerfectoidSpaces:P1/tilt-of-perfectoid-tate-ring.

*API.*

- `bdRPlusAffinoid` (*constructor*) — B_dR^+(R, R^+) := lim_i B_inf/(ker θ)^i for a perfectoid affinoid (K, K^+)-algebra (R, R^+); it is Mathlib's BDeRhamPlus R^+ p localised at p, i.e. the (ker θ[1/p])-adic completion of W(R^♭+)[1/p].
- `xiAffinoid` (*constructor*) — The element ξ = [π] − Σ_{i≥1} p^i[x_i] ∈ W(K^♭+) generating ker θ.
- `xiAffinoid_generates` (*characterisation*) — For every perfectoid affinoid (R, R^+) over (K, K^+), ξ generates ker(θ: W(R^♭+) → R^+) and is a nonzerodivisor.
- `filAffinoid` (*structure*) — Fil^i B_dR(R, R^+) = ξ^i B_dR^+(R, R^+) for i ∈ Z.
- `grAffinoid` (*characterisation*) — gr^i B_dR(R, R^+) ≅ ξ^i R, free of rank one over R; gr^• B_dR(R, R^+) ≅ R[ξ^{±1}].
- `bdRPlusAffinoid_functorial` (*functoriality*) — A map of perfectoid affinoid (K, K^+)-algebras induces a filtered map of B_dR^+ compatible with θ.
- `bdRPlusAffinoid_eq_bdRPlus_C` (*compatibility*) — For (R, R^+) = (C, O_C), B_dR^+(C, O_C) is R06.1/de-rham-period-ring's B_dR^+ (Mathlib BDeRhamPlus 𝓞_ℂ_[p] p).

*Used by.*

- Scholze, p-adic Hodge theory for rigid-analytic varieties, Definition 6.1 and Proposition 6.5 — values of the pro-étale sheaves B_dR^+, B_dR on affinoid perfectoids
- `PadicHodgeTheory:P8:local-rational/period-sheaves-definitions` — the sheaves are defined by these rings on affinoid perfectoids
- `PadicHodgeTheory:R06.1/de-rham-period-ring` — the case (C, O_C) is Fontaine's B_dR^+

*Unit tests.* A wrong definition fails one of these.

- `bdRPlusAffinoid_C` (compatibility) — For (R, R^+) = (C, O_C) the ring B_dR^+(R, R^+) is isomorphic, compatibly with θ, to BDeRhamPlus 𝓞_ℂ_[p] p.
- `grAffinoid_zero` (degenerate) — gr^0 B_dR(R, R^+) ≅ R via θ.
- `xiAffinoid_mem_ker` (computation) — θ(ξ) = 0 and θ([π]) = π^♯ = p·u with u ∈ (K^+)^×.
- `grAffinoid_not_split_equivariantly` (non-example) — For (R, R^+) = (C, O_C) the surjection B_dR^+/ξ^2 → C admits no G_K-equivariant additive section (B-C Remark 4.1.4), although gr^1 ≅ ξR is free of rank one.

*Construction.*

1. Construction: θ([π]) = π♯ = p·u with u ∈ (K^+)^×; write u = θ(Σ_{j≥0} p^j [u_j]) with u_j ∈ K♭+ and put x_i = u_{i-1}, so that ξ = [π] − Σ_{i≥1} p^i [x_i] ∈ ker θ. (Packet-authored expansion of "any such element can be written as a sum Σ p^i θ([x_i])".)
2. Nonzerodivisor: if ξy = 0 with y = Σ p^i [y_i] ≠ 0, p-torsion-freeness of W(R♭+) lets one assume y_0 ≠ 0; reducing mod p gives πy_0 = 0 in R♭+, impossible since R♭+ is flat over K♭+.
3. Generation: for y ∈ ker θ, first reduce to y_0 ≠ 0 using p-torsion-freeness of W(R♭+) and R^+. W(R♭+)/(ξ, p) = R♭+/π = R^+/p gives z_0 with y − z_0ξ = p·y_1, and y_1 ∈ ker θ because R^+ is p-torsion free (the printed "f is mapped to zero" means y). Iterating gives y − (Σ_{i≤k} p^i z_i)ξ ∈ p^{k+1}W(R♭+), and p-adic completeness and separatedness of W(R♭+) give y = (Σ p^i z_i)ξ.
4. Corollary 6.4: ξ has the same properties in B_inf, so gr^i B_dR(R, R^+) = ξ^i B_dR^+/ξ^{i+1} B_dR^+ ≅ ξ^i R (the source says only "The corollary follows").

*Acceptance.*

- For (R, R^+) = (C, O_C), ξ generates ker θ ⊂ A_inf, and B_dR^+(C) = lim A_inf[1/p]/ξ^i with gr^i = Cξ^i. That this is Fontaine's ring is true by definition but not discussed in the source; this is also the case where the node must agree with AInfCohomology:AI.0:integral up to a unit.
- The element t = log([ε]) ∈ Fil^1 B_dR^+(K, K^+), for K = completed Q_p(μ_{p^∞}), generates Fil^1, and Gal(Q_p(μ_{p^∞})/Q_p) acts on it through the cyclotomic character. The proof of Proposition 6.7 recalls this without proof, so a test must supply its own derivation.

*Uses.* `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`, `PerfectoidSpaces:P1/tilt-of-perfectoid-tate-ring`, `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`, `mathlib:WittVector`, `mathlib:WittVector.fontaineTheta`, `mathlib:BDeRhamPlus`, `mathlib:BDeRham`, `mathlib:AdicCompletion`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 6, the definitions before Lemma 6.3, Lemma 6.3 with proof, Corollary 6.4 with proof, pp. 35-36 (extraction lines 2026-2081): “As a first step, we will find z_0 ∈ W(R♭+) so that y − z_0 ξ is divisible by p. Indeed, W(R♭+)/(ξ, p) = R♭+/π = R^+/p, so that f is mapped to zero in this quotient, which amounts to the existence of z_0 as desired.” The principal-kernel argument, uniform in (R, R^+) over (K, K^+), which R06.1 needs for B_dR^+ and its filtration.

#### Construction. The de Rham period ring B_dR with its filtration and Galois action

*Module* `TauCeti/PadicHodge/PeriodRings/DeRham.lean`. *Node* `PadicHodgeTheory:R06.1/de-rham-period-ring`.

Put B_dR^+ := BDeRhamPlus O_C p, the (ker θ_Q)-adic completion of A_inf[1/p] (Mathlib, instantiated by R06.1/cp-integers-p-adically-complete), and let θ_dR: B_dR^+ → C be the map induced by θ_Q (the j = 1 projection). Put B_dR := BDeRham O_C p (Mathlib: B_dR^+ localised at the images of the generators of ker θ_Q). For i ≥ 0 let Fil^i B_dR^+ = (ker θ_dR)^i and for i ∈ Z let Fil^i B_dR = ξ^i B_dR^+ ⊆ B_dR. The G_K-action on A_inf[1/p] (R06.1/galois-action-on-cp) preserves ker θ_Q, hence extends to B_dR^+ and B_dR by ring automorphisms preserving Fil^•; B_dR^+ is a W(k̄)[1/p]-algebra and a K̄-algebra via R06.1/algebraic-closure-in-bdr-plus. The construction depends only on the valued field C: replacing K by a finite extension or by K̂^{ur} changes only the acting group.

*Hypotheses.* O_C = 𝓞_ℂ_[p]; the principal generator ξ of ker θ_Q from R06.1/explicit-generator-of-ker-theta.

*API.*

- `BdRPlus` (*data*) — B_dR^+ := BDeRhamPlus 𝓞_ℂ_[p] p.
- `BdR` (*data*) — B_dR := BDeRham 𝓞_ℂ_[p] p, with the algebra map B_dR^+ → B_dR.
- `thetaDR` (*projection*) — θ_dR: B_dR^+ →+* C induced by fontaineThetaInvertP.
- `thetaDR_surjective` (*characterisation*) — θ_dR is surjective.
- `thetaDR_coe` (*simp*) — θ_dR agrees with θ_Q on the image of A_inf[1/p].
- `filBdR` (*structure*) — Fil^i B_dR ⊆ B_dR for i ∈ Z, the B_dR^+-submodule ξ^i B_dR^+; decreasing, exhaustive, separated; Fil^0 = B_dR^+, Fil^1 ∩ B_dR^+ = ker θ_dR, Fil^i · Fil^j ⊆ Fil^{i+j}.
- `filBdR_isFiltration` (*instance*) — filBdR is a ring filtration in Mathlib's sense (IsRingFiltration / IsModuleFiltration).
- `galoisActionBdR` (*instance*) — MulSemiringAction of G_K on B_dR^+ and B_dR preserving each Fil^i, and θ_dR(g x) = g θ_dR(x).
- `bdR_functorial_C` (*functoriality*) — A continuous isometric isomorphism of complete algebraically closed fields C → C' induces B_dR(C) ≅ B_dR(C') compatibly with θ, filtration and Galois actions.
- `bdR_independent_of_K` (*other*) — B_dR^+ and B_dR depend only on C; for K ⊆ K' ⊆ C complete discretely valued, G_{K'} acts through the inclusion G_{K'} ⊆ G_K.

*Used by.*

- Brinon–Conrad §6, Definition of D_dR — D_dR(V) = (B_dR ⊗ V)^{G_K} with Fil^i D_dR(V) = (t^iB_dR^+ ⊗ V)^{G_K}
- `PadicHodgeTheory:R06.2/period-functors` — D_dR and the de Rham comparison isomorphism
- CohomologyComparisons:CP.2, CP.3 — the canonical B_dR^+-lattice and the filtered crystalline comparison use B_dR^+ and its filtration
- `PadicHodgeTheory:P8:local-rational` — the pro-étale sheaves B_dR^+, B_dR specialise to this ring at geometric points
- `AInfCohomology:AI.0:period-comparison` — compares this B_dR^+ with the A_inf-based normalisations

*Unit tests.* A wrong definition fails one of these.

- `thetaDR_teichmuller` (computation) — thetaDR (algebraMap A_inf B_dR^+ [x]) = PreTilt.untilt x for x ∈ O_C^♭.
- `filBdR_zero` (degenerate) — Fil^0 B_dR is the image of B_dR^+ in B_dR.
- `bdRPlus_eq_mathlib` (compatibility) — BdRPlus p is definitionally BDeRhamPlus 𝓞_ℂ_[p] p.
- `bdRPlus_not_field` (non-example) — B_dR^+ is not a field: ξ is a nonzero non-unit (θ_dR(ξ) = 0).
- `bdRPlus_no_equivariant_section` (non-example) — There is no G_K-equivariant ring section C → B_dR^+ of θ_dR (B-C Remark 4.1.4; F-O Exercise 5.18(2)).

*Construction.*

1. The completion is Mathlib's AdicCompletion of Localization.Away p; the inverse system has transition maps A_inf[1/p]/(ker θ_Q)^{j+1} → A_inf[1/p]/(ker θ_Q)^j.
2. θ_dR is the projection to the j = 1 quotient A_inf[1/p]/ker θ_Q ≅ C.
3. The G_K-action preserves ker θ_Q because θ is equivariant; it therefore acts on each quotient and on the limit, and on the localisation because it permutes the generators of ker θ_Q.
4. Fil^i := ξ^iB_dR^+ inside B_dR; it is G_K-stable because g(ξ) generates the G_K-stable ideal ker θ_Q, and decreasing because ξ ∈ B_dR^+ (exhaustiveness and separatedness are proved in R06.1/bdr-plus-complete-dvr).

*Acceptance.*

- The Mathlib definitions typecheck at R = 𝓞_ℂ_[p] (suggested Lean file).
- θ_dR([x]) = x^♯ for x ∈ O_C^♭.

*Uses.* `mathlib:BDeRhamPlus`, `mathlib:BDeRham`, `mathlib:fontaineThetaInvertP`, `mathlib:AdicCompletion`, `PadicHodgeTheory:R06.1/cp-integers-p-adically-complete`, `PadicHodgeTheory:R06.1/explicit-generator-of-ker-theta`, `PadicHodgeTheory:R06.1/galois-action-on-cp`.

*Planet:* Field of p-adic periods B_dR.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, §4.4, display (4.4.1) and Definition 4.4.7, pp. 59–60: “The field of p-adic periods (or the de Rham period ring) is BdR :=” Definition of B_dR as the fraction field of B_dR^+ with G_K-action and filtration by powers of the maximal ideal.
- Theory of p-adic Galois representations, §5.2.2, Definition 5.13, p. 93: “Since Ker θ is a maximal ideal, which is principal and generated by a non-” F-O's definition B_dR^+ = lim W(R)[1/p]/(ker θ)^n.

#### Construction. The natural (Fréchet) topology on A_inf[1/p] and B_dR^+ and continuity of the Galois action

*Module* `TauCeti/PadicHodge/PeriodRings/Topology.lean`. *Node* `PadicHodgeTheory:R06.1/bdr-natural-topology`.

For an open ideal a of O_C^♭ and N ≥ 0 put U_{N,a} = ⋃_{j > −N} (p^{−j} W(a^{p^j}) + p^N A_inf) ⊆ A_inf[1/p], where W(a) is the ideal of Witt vectors with all coordinates in a. Then: (1) the U_{N,a} form a basis of neighbourhoods of 0 for a unique ring topology on A_inf[1/p] for which G_K acts continuously; (2) its restriction to A_inf is the weak (product of v^♭-adic) topology and K_0 = W(k)[1/p] is a closed subfield with its p-adic topology; (3) θ_Q is continuous and open; (4) multiplication by ξ is a closed embedding, so each (ker θ_Q)^j is closed; the inverse-limit topology on B_dR^+ (the natural topology) is a complete Hausdorff ring topology, the G_K-action on B_dR^+ is continuous, multiplication by a uniformiser is a closed embedding, W(O_C^♭) is a closed subring, and C = B_dR^+/Fil^1 gets its valuation topology as quotient topology; (5) B_dR^+ is a topological K-algebra; the natural topology is strictly coarser than the discrete-valuation topology.

*Hypotheses.* O_C^♭ with its valuation topology; the topology is built in B-C Exercise 4.5.3 (stated there as an exercise with hints; the proofs are packet-authored along those hints).

*API.*

- `naturalTopologyAinfInvP` (*instance*) — The ring topology on A_inf[1/p] with basis U_{N,a}.
- `naturalTopologyBdRPlus` (*instance*) — The inverse-limit topology on B_dR^+ (TopologicalSpace, IsTopologicalRing, T2Space, CompleteSpace).
- `continuousSMul_galois_bdRPlus` (*instance*) — The G_K-action on B_dR^+ is continuous.
- `isClosedEmbedding_mul_xi` (*characterisation*) — Multiplication by any uniformiser of B_dR^+ is a closed embedding.
- `continuous_thetaDR` (*compatibility*) — θ_dR is continuous and open onto C with its valuation topology.
- `isClosed_ainf` (*other*) — W(O_C^♭) is a closed subring of B_dR^+ with its weak topology.

*Used by.*

- Brinon–Conrad §4.4, construction of t — continuity of x ↦ log[x] to prove log[ε^a] = a log[ε]
- Brinon–Conrad Proposition 6.3.8 and Example 6.3.6 — continuity of G_K on t^iB_dR^+ ⊗ V and successive approximation with continuous cocycles
- `PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus` — the map A_cris → B_dR^+ is constructed by continuity for this topology

*Unit tests.* A wrong definition fails one of these.

- `naturalTopology_theta_quotient` (compatibility) — The quotient topology on B_dR^+/Fil^1 ≅ C is the valuation topology of C.
- `naturalTopology_p_pow_tendsto_zero` (computation) — p^n → 0 in B_dR^+ for the natural topology.
- `naturalTopology_xi_pow_not_tendsto_zero` (non-example) — ξ^n → 0 in the discrete-valuation topology but, for the natural topology, [p^♭]^n/p^n does not tend to 0 in A_inf[1/p] (its θ-image is 1).
- `naturalTopology_W_k_padic` (degenerate) — The subspace topology on W(k̄) ⊆ B_dR^+ is the p-adic topology.

*Construction.*

1. (1) U_{N,a} is a G_K-stable W(O_C^♭)-submodule; U_{N+M, a∩b} ⊆ U_{N,a} ∩ U_{M,b} and U_{N,a}·U_{N,a} ⊆ U_{N,a} (Witt addition and multiplication are coordinatewise polynomial), giving a ring topology; G_K preserves each U_{N,a}.
2. (2) U_{N,a} ∩ W(O_C^♭) = W(a) + p^N W(O_C^♭); k is discrete in O_C^♭, so W(k) is closed with its p-adic topology.
3. (3) θ_Q(U_{N,a}) contains p^N O_C and lies in p^{N+s}O_C for s > 0 small once a is small (B-C Exercise 4.5.3(4), using openness of θ from B-C Proposition 4.4.2).
4. (4) ξ·: A_inf[1/p] → A_inf[1/p] is a homeomorphism onto a closed subspace (ξ = [p^♭] − p with p^♭ a pseudo-uniformiser); quotients get Hausdorff topologies and the limit is Hausdorff; completeness: a null sequence in A_inf[1/p]/(ker θ_Q)^j has bounded denominators (B-C Exercise 4.5.3(6)), reducing to completeness of W(O_C^♭).
5. (5) Tensor with a K_0-basis of K using (2); the discrete-valuation topology induces the discrete topology on C, the natural one the valuation topology.

*Acceptance.*

- θ_dR is continuous for the natural topology and C carries its valuation topology.
- The logarithm x ↦ log[x] = Σ (−1)^{n+1}([x] − 1)^n/n is continuous from U_R = {x ∈ O_C^♭: x^♯ = 1} to B_dR^+ (B-C, text after Exercise 4.5.3).

*Uses.* `PadicHodgeTheory:R06.1/de-rham-period-ring`, `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`, `PadicHodgeTheory:R06.1/explicit-generator-of-ker-theta`, `PadicHodgeTheory:R06.1/galois-action-on-cp`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Exercise 4.5.3(1)–(6), pp. 65–66: “This crucial exercise introduces a topological ring structure on W(R)[1/p] that induces the natural vR -adic product topology on the subring W(R)” The construction and all properties (1)–(5) are stated there, with proofs left as an exercise.
- Theory of p-adic Galois representations, Remark 5.14, p. 93: “We call (2) the natural topology of BdR” F-O define the same natural topology as the inverse limit topology.

#### Construction. Fontaine's element t = log[ε], the p-adic 2πi

*Module* `TauCeti/PadicHodge/PeriodRings/FontaineT.lean`. *Node* `PadicHodgeTheory:R06.1/fontaine-element-t`.

For ε as in R06.1/tilt-of-cp-and-special-elements, [ε] − 1 ∈ ker θ ⊆ Fil^1 B_dR^+, so t := log[ε] = Σ_{n≥1} (−1)^{n+1}([ε] − 1)^n/n converges in B_dR^+ (for the discrete-valuation topology). Then: (1) t ∈ Fil^1 ∖ Fil^2, i.e. t is a uniformiser of B_dR^+; (2) g(t) = χ(g)t for g ∈ G_K; (3) replacing ε by ε^a (a ∈ Z_p^×) replaces t by at; more generally log[x^a] = a log[x] for a ∈ Z_p and x ∈ U_R = {x ∈ O_C^♭ : x^♯ = 1}; (4) hence Z_p t ⊆ B_dR^+ is a canonical G_K-stable copy of Z_p(1), a choice of Z_p-basis being the same as a choice of ε; (5) θ_dR(t) = 0 and t/ξ is a unit of B_dR^+.

*Hypotheses.* p arbitrary (p = 2 needs the separate computation in B-C Proposition 4.4.8).

*API.*

- `fontaineT` (*constructor*) — t := log[ε] ∈ B_dR^+ for a compatible system ζ of p-power roots of unity.
- `thetaDR_fontaineT` (*simp*) — θ_dR(t) = 0.
- `fontaineT_isUniformizer` (*characterisation*) — t generates the maximal ideal of B_dR^+ (t ∈ Fil^1 ∖ Fil^2).
- `galois_fontaineT` (*relation*) — g • t = χ(g) • t for g ∈ G_K, χ = cyclotomicCharacter.
- `fontaineT_change` (*relation*) — t_{ζ^a} = a t_ζ for a ∈ Z_p^×.
- `logTeichmuller` (*constructor*) — The homomorphism U_R → B_dR^+, x ↦ log[x], continuous for the natural topology.
- `logTeichmuller_zpow` (*simp*) — log[x^a] = a log[x] for a ∈ Z_p.
- `zpTwistLine` (*other*) — Z_p t ⊆ B_dR^+ is a G_K-stable Z_p-line isomorphic to Z_p(1), independent of ζ.

*Used by.*

- Brinon–Conrad Example 6.1.1 — D_dR(Q_p(n)) = K t^{−n}
- Brinon–Conrad §9.1 — t ∈ A_cris, φ(t) = pt, B_cris = B_cris^+[1/t]
- `PadicHodgeTheory:R06.2/period-functors` — Tate twists: multiplication by t^n identifies D_B(V(n)) with t^{−n}D_B(V)
- `AInfCohomology:AI.0:period-comparison` — comparison of t with μ = [ε] − 1 and the Breuil–Kisin twist

*Unit tests.* A wrong definition fails one of these.

- `fontaineT_ne_zero` (non-example) — t ≠ 0 (t is a uniformiser), although exp would formally give [ε] = 1 only after θ: θ_dR([ε]) = 1 while [ε] ≠ 1.
- `galois_fontaineT_cyclotomic` (computation) — For g with χ(g) = −1 (complex-conjugation-like element of G_{Q_p}), g • t = −t.
- `fontaineT_trivial_character` (degenerate) — For g ∈ G_{K(μ_{p^∞})}, g • t = t.
- `fontaineT_div_xi_unit` (compatibility) — t/ξ is a unit of B_dR^+, where ξ = [p^♭] − p generates ker θ (Mathlib fontaineTheta).

*Construction.*

1. Convergence: [ε] − 1 ∈ Fil^1 and B_dR^+ is complete for its valuation.
2. (1) Terms with n ≥ 2 lie in Fil^2, so it suffices that [ε] − 1 ∉ (ker θ)^2 = ξ^2A_inf (R06.1/explicit-generator-of-ker-theta (3)); comparing 0-th Witt coordinates, ε − 1 would be divisible by (p^♭)^2, impossible since v^♭(ε − 1) = p/(p − 1) < 2 for p > 2; for p = 2 compare the first two Witt coordinates (B-C Proposition 4.4.8, F-O Proposition 5.20).
3. (3) x ↦ log[x] is a homomorphism U_R → B_dR^+ continuous for the natural topology (R06.1/bdr-natural-topology), so log[x^a] = a log[x] extends from a ∈ N to a ∈ Z_p by continuity.
4. (2) g(ε) = ε^{χ(g)} (R06.1/tilt-of-cp-and-special-elements) and G_K-equivariance of log give g(t) = log[ε^{χ(g)}] = χ(g)t by (3).
5. (5) θ_dR(t) = 0 by (1); t/ξ is a unit because both are uniformisers.

*Acceptance.*

- t ∉ A_inf[1/p]: the series has unbounded denominators; t ∈ A_cris (R06.1/t-in-acris).
- θ_dR(t/([ε] − 1)) = 1.

*Uses.* `PadicHodgeTheory:R06.1/tilt-of-cp-and-special-elements`, `PadicHodgeTheory:R06.1/explicit-generator-of-ker-theta`, `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`, `PadicHodgeTheory:R06.1/bdr-natural-topology`, `mathlib:cyclotomicCharacter`.

*Planet:* Fontaine's period t = log[ε].

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, §4.4, Proposition 4.4.8 and the preceding construction, pp. 61–62: “We conclude that Zp t is a canonical copy of Zp (1) as a GK -stable line in BdR” Statements (2)–(4); Proposition 4.4.8 is statement (1).
- Theory of p-adic Galois representations, §5.2.3, Proposition 5.20, p. 94: “In other words, t generates the maximal ideal of BdR” Statement (1) in F-O.

#### Construction. The Hodge–Tate period ring B_HT

*Module* `TauCeti/PadicHodge/PeriodRings/HodgeTate.lean`. *Node* `PadicHodgeTheory:R06.1/hodge-tate-period-ring`.

B_HT := ⊕_{q∈Z} C(q), the graded C-algebra whose q-th piece is C(q) = C ⊗_{Z_p} Z_p(q) with the diagonal G_K-action and multiplication C(q) ⊗ C(q') ≅ C(q + q'). Choosing a Z_p-basis t of Z_p(1) identifies B_HT with the Laurent polynomial ring C[t, t^{−1}] with g(Σ a_n t^n) = Σ g(a_n)χ(g)^n t^n. B_HT is a graded domain with Frac(B_HT) = C(t) and B_HT^{G_K} = Frac(B_HT)^{G_K} = K.

*Hypotheses.* G_K-action on C from R06.1/galois-action-on-cp; χ the cyclotomic character.

*API.*

- `BHT` (*data*) — B_HT = ⊕_{q∈Z} C(q) as a Z-graded C-algebra with G_K-action.
- `BHT.single` (*constructor*) — The element c·t^q in degree q.
- `BHT.laurentEquiv` (*equivalence*) — B_HT ≅ C[t, t^{-1}] after choosing a basis t of Z_p(1), with g(ct^n) = g(c)χ(g)^n t^n.
- `galoisActionBHT` (*instance*) — The graded, C-semilinear G_K-action.
- `BHT.invariants_eq` (*characterisation*) — B_HT^{G_K} = K (degree 0 constants).
- `BHT.frac_invariants_eq` (*characterisation*) — Frac(B_HT)^{G_K} = K.
- `BHT.isDomain` (*instance*) — B_HT is a domain.

*Used by.*

- Brinon–Conrad §2.4 — D_HT(V) = (B_HT ⊗ V)^{G_K} with its grading
- `PadicHodgeTheory:R06.1/bdr-filtration-and-graded` — gr B_dR ≅ B_HT
- `PadicHodgeTheory:R06.2/period-functors` — D_HT and Hodge–Tate representations

*Unit tests.* A wrong definition fails one of these.

- `BHT_invariants_degree_zero` (computation) — The G_K-invariants of the degree-1 piece C(1) of B_HT are 0.
- `BHT_unit_single` (degenerate) — The degree-0 piece of B_HT is C with its usual action.
- `BHT_eq_gr_BdR` (compatibility) — B_HT is isomorphic to gr^• B_dR as graded C-algebras with G_K-action.
- `BHT_not_field` (non-example) — B_HT is not a field: 1 + t is not a unit of C[t, t^{-1}].

*Construction.*

1. Construction as a graded algebra (AddMonoidAlgebra C Z twisted by χ, or Mathlib's Laurent polynomials with the twisted action).
2. Invariants: B_HT^{G_K} = ⊕ C(n)^{G_K} = K by the Tate–Sen theorem; for C(t) embed into C((t)) and take invariants coefficientwise (B-C Example 5.1.2).

*Acceptance.*

- B_HT^{G_K} = K; the degree-n piece of B_HT^{G_K} vanishes for n ≠ 0.

*Uses.* `PadicHodgeTheory:R06.1/galois-action-on-cp`, `PadicHodgeTheory:R06.1/tate-sen-theorem`, `mathlib:cyclotomicCharacter`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Definition 2.4.7, p. 22: “The Hodge–Tate ring of K is the CK -algebra BHT = ⊕q∈Z CK (q) in which multiplication is defined via the natural maps” The definition.
- CMI Summer School notes on p-adic Hodge theory, Example 5.1.2, p. 66: “We claim that B is (Qp , G)-regular (with B G = K).” Invariants and regularity (regularity is proved in R06.2/period-rings-are-regular).

#### Construction. The structure map A_cris → B_dR^+

*Module* `TauCeti/PadicHodge/PeriodRings/Crystalline.lean`. *Node* `PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus`.

Let A_cris be the p-adically completed divided-power envelope of (A_inf, ker θ) supplied by CrystallineCohomology:CR.0, with its PD-compatible map θ_cris: A_cris → O_C and its dense subring A^0_cris = A_inf[ξ^m/m!]_{m≥1} ⊆ A_inf[1/p]. There is a unique continuous ring homomorphism j: A_cris → B_dR^+ (p-adic topology on A_cris, natural topology on B_dR^+) restricting to the inclusion A^0_cris ⊆ A_inf[1/p] ⊆ B_dR^+. It is G_K-equivariant and W(k̄)-linear, θ_dR ∘ j = θ_cris (followed by O_C ⊆ C), and its image is {Σ_{n≥0} a_n ξ^n/n! : a_n ∈ A_inf, a_n → 0 p-adically}, the series converging for the discrete-valuation topology of B_dR^+.

*Hypotheses.* A_cris and θ_cris as exported by CR.0 (the common envelope of ker(θ: A_inf → O_C) and its p-completion).

*API.*

- `acrisToBdRPlus` (*constructor*) — j: A_cris →+* B_dR^+.
- `acrisToBdRPlus_continuous` (*characterisation*) — j is continuous from the p-adic topology to the natural topology, and is the unique such extension of A^0_cris ⊆ A_inf[1/p].
- `acrisToBdRPlus_divided_power` (*simp*) — j(γ_m(ξ)) = ξ^m/m!.
- `thetaDR_comp_acrisToBdRPlus` (*compatibility*) — θ_dR ∘ j = θ_cris.
- `acrisToBdRPlus_galois` (*functoriality*) — j(g·a) = g·j(a) for g ∈ G_K.
- `acrisToBdRPlus_range` (*characterisation*) — range j = {Σ a_nξ^n/n! : a_n ∈ A_inf, a_n → 0}.

*Used by.*

- Brinon–Conrad §9.1 — B_cris^+ and B_cris are defined as subrings of B_dR^+ and B_dR through j
- CohomologyComparisons:CP.2, CP.3 — comparison isomorphisms over A_cris are base-changed to B_dR^+ along j
- `AInfCohomology:AI.0:period-comparison` — compares the integral PD maps with this rational structure map

*Unit tests.* A wrong definition fails one of these.

- `acrisToBdRPlus_one` (degenerate) — j(1) = 1.
- `acrisToBdRPlus_xi_sq` (computation) — j(ξ^2/2) = ξ^2/2 in B_dR^+.
- `acrisToBdRPlus_theta` (compatibility) — θ_dR (j a) = θ_cris a for a ∈ A_cris, where on A_inf θ_cris is Mathlib's fontaineTheta.
- `acrisToBdRPlus_not_into_ainf` (non-example) — The image of j is not contained in the image of A_inf[1/p]: j(t) = t has unbounded denominators.

*Construction.*

1. On A^0_cris: for each j ≥ 1 the image of A^0_cris in B_dR^+/Fil^j = A_inf[1/p]/ξ^j A_inf[1/p] lies in ((j − 1)!)^{-1}·(image of A_inf), since ξ^m/m! vanishes there for m ≥ j.
2. Hence p^N A^0_cris maps into ((j−1)!)^{-1}p^N A_inf, which tends to 0 in the natural topology of B_dR^+/Fil^j (p^N W(O_C^♭) ⊆ U_{N,a}, R06.1/bdr-natural-topology); so the inclusion is uniformly continuous from the p-adic topology and extends to the p-adic completion by completeness of each B_dR^+/Fil^j and passage to the limit.
3. Uniqueness: A^0_cris is dense in A_cris and B_dR^+ is Hausdorff. G_K-equivariance and W(k̄)-linearity follow from uniqueness. θ_dR ∘ j = θ_cris holds on A^0_cris and both sides are continuous.
4. Image: every element of A_cris is a p-adically convergent sum Σ a_n ξ^n/n! with a_n ∈ A_inf (B-C §9.1; F-O text after Proposition 6.5).

*Acceptance.*

- j(ξ^m/m!) = ξ^m/m!; j(t) = t for the element t ∈ A_cris of R06.1/t-in-acris.

*Uses.* `CrystallineCohomology:CR.0`, `PadicHodgeTheory:R06.1/bdr-natural-topology`, `PadicHodgeTheory:R06.1/de-rham-period-ring`, `PadicHodgeTheory:R06.1/explicit-generator-of-ker-theta`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, §9.1, display (9.1.2), pp. 128–129: “is unique since Acris is dense in Acris and BdR is Hausdorff.” Existence (asserted in B-C via [19, Prop. 4.4.7] and 'a somewhat tedious amount of algebra') and uniqueness of j; the node gives the continuity argument.
- Theory of p-adic Galois representations, §6.1.1, after Definition 6.1, p. 114: “by continuity Acris ⊂ BdR” F-O construct the same map by continuity.

#### Construction. Frobenius on A_cris, B_cris^+ and B_cris

*Module* `TauCeti/PadicHodge/PeriodRings/Crystalline.lean`. *Node* `PadicHodgeTheory:R06.1/frobenius-on-acris`.

The Witt Frobenius φ of A_inf preserves A^0_cris: writing φ(ξ) = ξ^p + pw with w ∈ A_inf, φ(γ_m(ξ)) = (p^m/m!)(w + (p − 1)!γ_p(ξ))^m ∈ A^0_cris. It therefore extends uniquely to a p-adically continuous ring endomorphism φ of A_cris and of B_cris^+ = A_cris[1/p], commuting with G_K, with φ(t) = pt; since p is a unit of B_cris^+[1/t], φ extends uniquely to B_cris = B_cris^+[1/t] by φ(1/t) = 1/(pt). φ is σ-semilinear over K̂_0^{ur} = W(k̄)[1/p] ⊆ B_cris^+ and does not preserve the subspace filtration from B_dR (φ(ξ) ∉ Fil^1).

*Hypotheses.* A_cris from CrystallineCohomology:CR.0 (its universal property gives the same extension); p arbitrary.

*API.*

- `acrisFrobenius` (*constructor*) — φ: A_cris →+* A_cris extending the Witt Frobenius of A_inf.
- `acrisFrobenius_teichmuller` (*simp*) — φ([x]) = [x^p].
- `acrisFrobenius_t` (*simp*) — φ(t) = p t.
- `bcrisFrobenius` (*constructor*) — φ: B_cris →+* B_cris, the unique extension with φ(1/t) = 1/(pt).
- `bcrisFrobenius_galois` (*relation*) — φ(g·b) = g·φ(b).
- `bcrisFrobenius_semilinear` (*relation*) — φ(λb) = σ(λ)φ(b) for λ ∈ W(k̄)[1/p].
- `bcrisFrobenius_not_filtered` (*other*) — φ(Fil^1 B_cris) ⊄ Fil^1 B_cris (witness φ(ξ)).

*Used by.*

- Brinon–Conrad §8 intro and §9.1 — D_cris(V) inherits a σ-semilinear Frobenius, making it a filtered φ-module
- `PadicHodgeTheory:R06.1/fundamental-exact-sequence` — B_cris^{φ=1} ∩ Fil^0 = Q_p
- `CohomologyComparisons:CP.2` — Frobenius compatibility of the crystalline comparison

*Unit tests.* A wrong definition fails one of these.

- `acrisFrobenius_one` (degenerate) — φ(1) = 1.
- `acrisFrobenius_xi` (computation) — φ(ξ) = [p^♭]^p − p.
- `acrisFrobenius_witt_compat` (compatibility) — φ restricted to A_inf is Mathlib's WittVector.frobenius on W(O_C^♭).
- `acrisFrobenius_not_theta_compatible` (non-example) — θ_cris ∘ φ ≠ θ_cris: θ_cris(φ(ξ)) = p^p − p ≠ 0 = θ_cris(ξ).

*Construction.*

1. φ(ξ) = [p^♭]^p − p = (ξ + p)^p − p = ξ^p + pw with w ∈ A_inf; then φ(ξ) = p(w + (p − 1)!γ_p(ξ)), so φ(ξ^m) = p^m(…)^m and p^m/m! ∈ Z_p gives φ(A^0_cris) ⊆ A^0_cris (B-C Lemma 9.1.7, F-O §6.1.1).
2. p-adic continuity extends φ to A_cris; G_K-equivariance holds on A^0_cris and passes to the completion.
3. φ(t) = pt: t is the p-adically convergent series of R06.1/t-in-acris, so φ(t) = Σ (−1)^{n+1}([ε]^p − 1)^n/n = log[ε^p] = p log[ε] (B-C text after Lemma 9.1.7).
4. Non-compatibility with Fil: θ(φ(ξ)) = p^p − p ≠ 0 while ξ ∈ Fil^1.

*Acceptance.*

- φ([x]) = [x^p] for x ∈ O_C^♭; φ(t^n) = p^n t^n.

*Uses.* `CrystallineCohomology:CR.0`, `mathlib:WittVector.frobenius`, `PadicHodgeTheory:R06.1/t-in-acris`, `PadicHodgeTheory:R06.1/galois-action-on-cp`, `PadicHodgeTheory:R06.1/explicit-generator-of-ker-theta`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Lemma 9.1.7 with proof, p. 132: “The W(R)-subalgebra A0cris ⊆ W(R)[1/p] is φR -stable.” φ preserves A^0_cris.
- Theory of p-adic Galois representations, §6.1.1, 'The Frobenius map ϕ on Bcris', p. 116: “hence ϕ(t) = pt. Consequently ϕ is extended to Bcris by setting ϕ( 1t ) = pt” Extension to B_cris (the extraction garbles φ(1/t) = 1/(pt)).
- CMI Summer School notes on p-adic Hodge theory, text after Theorem 9.1.8, p. 133: “so ξ ∈ Fil1 (Bcris ) and φ(ξ) 6∈ Fil1 (Bcris ).” Frobenius does not preserve the filtration.

#### Construction. The crystalline period rings A_cris, B_cris^+ and B_cris

*Module* `TauCeti/PadicHodge/PeriodRings/Crystalline.lean`. *Node* `PadicHodgeTheory:R06.1/crystalline-period-ring`.

B_cris^+ := A_cris[1/p] and B_cris := B_cris^+[1/t] = A_cris[1/t], identified with subrings of B_dR^+ and B_dR via j (R06.1/acris-embedding-injective). They carry: the G_K-action; the Frobenius φ of R06.1/frobenius-on-acris; the structure of K̂_0^{ur}-algebra (K̂_0^{ur} = W(k̄)[1/p] ⊆ A_inf[1/p] ⊆ B_cris^+); the filtration Fil^i B_cris := B_cris ∩ Fil^iB_dR and, on K ⊗_{K_0} B_cris ⊆ B_dR (R06.1/k-tensor-bcris-injective), the subspace filtration. Only C enters the construction; G_K acts through G_K ⊆ Aut_cont(C).

*Hypotheses.* A_cris from CrystallineCohomology:CR.0; injectivity of j is R06.1/acris-embedding-injective (a recorded gap).

*API.*

- `BcrisPlus` (*data*) — B_cris^+ = A_cris[1/p] as a subring of B_dR^+.
- `Bcris` (*data*) — B_cris = B_cris^+[1/t] as a subring of B_dR.
- `Bcris.algebraK0ur` (*instance*) — Algebra (W(k̄)[1/p]) B_cris compatible with the embedding into B_dR.
- `Bcris.frobenius` (*projection*) — The Frobenius of R06.1/frobenius-on-acris on B_cris.
- `Bcris.galoisAction` (*instance*) — G_K acts on B_cris by ring automorphisms commuting with φ.
- `Bcris.fil` (*structure*) — Fil^i B_cris = B_cris ∩ Fil^i B_dR, a decreasing G_K-stable filtration (not φ-stable).
- `Bcris.t_mem` (*simp*) — t ∈ B_cris^×.
- `Bcris_subset_BdR` (*coercion*) — The inclusion B_cris ⊆ B_dR is G_K-equivariant and restricts to B_cris^+ ⊆ B_dR^+.
- `Bcris.independent_of_K` (*other*) — B_cris with φ and G-action depends only on C.

*Used by.*

- Brinon–Conrad §9.1 — D_cris(V) = (B_cris ⊗ V)^{G_K}; crystalline representations
- `PadicHodgeTheory:R06.2/period-functors` — D_cris and V_cris(D) = Fil^0(B_cris ⊗ D)^{φ=1}
- `CohomologyComparisons:CP.2` — H^i_ét ⊗ B_cris ≅ H^i_cris ⊗ B_cris and B_cris^{G_K} = W(k)[1/p]
- `MordellLawrenceVenkatesh:LV.4/fibre-representation-crystalline` — B_cris^{G_L} = W(k_w)[1/p] = L for unramified L
- `PadicHodgeTheory:P8:local-rational` — rational crystalline period sheaves are built from the same rings

*Unit tests.* A wrong definition fails one of these.

- `Bcris_invariants_computation` (computation) — B_cris^{G_{Q_p}} = Q_p.
- `Bcris_t_inv` (degenerate) — t^{-1} ∈ B_cris and φ(t^{-1}) = p^{-1}t^{-1}.
- `BcrisPlus_subset_BdRPlus` (compatibility) — B_cris^+ ⊆ B_dR^+ = BDeRhamPlus 𝓞_ℂ_[p] p and B_cris ⊆ BDeRham 𝓞_ℂ_[p] p.
- `Bcris_ne_BdR` (non-example) — B_cris ≠ B_dR: B_cris^{G_K} = K_0 ≠ K = B_dR^{G_K} when K/K_0 is ramified.
- `Bcris_not_field` (non-example) — B_cris is not a field: ξ is a nonzero non-unit of B_cris (B_cris^× is described by regularity, and ξ spans no G_K-stable line).

*Construction.*

1. B_cris^+ is the localisation of A_cris at p; since t^{p−1} ∈ pA_cris (R06.1/t-in-acris), A_cris[1/t] already inverts p, so B_cris = A_cris[1/t] (B-C Definition 9.1.4).
2. The inclusion into B_dR is j[1/p][1/t], injective by R06.1/acris-embedding-injective and because B_dR is a field in which t is invertible.
3. Galois action and φ are inherited (R06.1/frobenius-on-acris); t ↦ χ(g)t under g.

*Acceptance.*

- B_cris contains t and t^{−1}; B_cris^{G_K} = K_0 (R06.1/crystalline-semistable-invariants).

*Uses.* `PadicHodgeTheory:R06.1/acris-embedding-injective`, `PadicHodgeTheory:R06.1/frobenius-on-acris`, `PadicHodgeTheory:R06.1/t-in-acris`, `PadicHodgeTheory:R06.1/de-rham-period-ring`, `CrystallineCohomology:CR.0`.

*Planet:* Crystalline period ring B_cris.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Definition 9.1.4, p. 131: “The crystalline period ring Bcris for K is the GK -stable W(R)[1/p]-” The definition B_cris = B_cris^+[1/t] = A_cris[1/t] inside B_dR.
- Theory of p-adic Galois representations, Definition 6.7, p. 115: “We define Bcris := Bcris [1/t] = Acris [1/t], then Bcris ⊂ BdR .” Same definition.

#### Construction. The rings A_max and B_max^+ and their embedding in B_dR^+

*Module* `TauCeti/PadicHodge/PeriodRings/Bmax.lean`. *Node* `PadicHodgeTheory:R06.1/bmax-period-ring`.

Let I = (p, ξ) ⊆ A_inf, A^0_max = A_inf[ξ/p] ⊆ A_inf[1/p] (the A_inf-subalgebra generated by p^{-1}I), A_max its p-adic completion and B_max^+ = A_max[1/p]; B_max = B_max^+[1/t]. For K/K_0 finite with uniformiser π_K, put A_{inf,K} = O_K ⊗_{W(k)} A_inf and let A_{max,K}, B_max,K^+ be the analogous completions for ([π̃_K] − π_K)/π_K (π̃_K ∈ O_C^♭ with π̃_K^♯ = π_K). Then: (1) the Witt Frobenius extends to A_max, B_max^+ and B_max; (2) the series Σ b_n(ξ/p)^n converge in B_dR^+, giving continuous G_K-equivariant maps B_max^+ → B_dR^+ and B_max,K^+ → B_dR^+, and B_max,K^+ ≅ K ⊗_{K_0} B_max^+; (3) A_cris maps continuously into A_max (γ_n(ξ) = (p^n/n!)(ξ/p)^n with p^n/n! ∈ Z_p), compatibly with the maps to B_dR^+, so j(A_cris)[1/p] ⊆ image(B_max^+) inside B_dR^+.

*Hypotheses.* Only used as an auxiliary ring in the proof of R06.1/k-tensor-bcris-injective; Colmez's rings, specialised to the sympathetic algebra Λ = C.

*API.*

- `Amax` (*data*) — A_max, the p-adic completion of A_inf[ξ/p] ⊆ A_inf[1/p].
- `BmaxPlus` (*data*) — B_max^+ = A_max[1/p].
- `bmaxPlusToBdRPlus` (*constructor*) — The continuous G_K-equivariant map B_max^+ → B_dR^+, Σ b_n(ξ/p)^n ↦ Σ b_n(ξ/p)^n.
- `acrisToAmax` (*constructor*) — The continuous map A_cris → A_max extending A^0_cris ⊆ A^0_max.
- `acrisToAmax_comp` (*compatibility*) — bmaxPlusToBdRPlus ∘ acrisToAmax = acrisToBdRPlus.
- `bmaxFrobenius` (*constructor*) — The Frobenius on A_max and B_max^+ extending the Witt Frobenius.
- `bmaxPlusK_equiv` (*equivalence*) — K ⊗_{K_0} B_max^+ ≅ B_max,K^+.

*Used by.*

- Colmez 2002, Proposition 8.14 — K ⊗_{K_0} B_max^+ → B_dR^+ is injective
- `PadicHodgeTheory:R06.1/k-tensor-bcris-injective` — B_cris^+ ⊆ B_max^+ transfers the injectivity to B_cris

*Unit tests.* A wrong definition fails one of these.

- `Amax_xi_div_p` (computation) — ξ/p ∈ A_max and (ξ/p)^n ∈ A_max for all n.
- `Amax_contains_ainf` (degenerate) — A_inf ⊆ A_max.
- `acrisToAmax_divided_power` (compatibility) — acrisToAmax(γ_n(ξ)) = (p^n/n!)(ξ/p)^n.
- `xi_mem_p_Amax_not_Acris` (non-example) — ξ ∈ pA_max, but ξ ∉ pA_cris: modulo p, A_cris/p ≅ (O_C^♭/(p^♭)^p)[Y_0, Y_1, …]/(Y_i^p) and ξ maps to p^♭ ≠ 0.

*Construction.*

1. Construction as in Colmez 2002 §8.5; φ preserves the ideal (p, ξ) since φ(ξ) ≡ ξ^p mod p, so φ(ξ/p) = ξ^p/p + w ∈ A^0_max.
2. (2) ξ/p ∈ Fil^1B_dR^+, so power series in ξ/p with p-adically null coefficients converge; K ⊗_{K_0} B_max^+ ≅ B_max,K^+ because ([π̃_K]/π_K)^e and [p^♭]/p differ by a unit of A_{inf,K} (Colmez Remark 8.13).
3. (3) the inclusion A^0_cris ⊆ A^0_max is p-adically continuous and extends to the completions; both maps to B_dR^+ restrict to the inclusion on A^0_cris ⊆ A_inf[1/p], so they agree by continuity.

*Acceptance.*

- ξ^n/p^n ∈ A_max for all n, while A_cris only contains the divided powers ξ^n/n!; the map A_cris → A_max sends γ_n(ξ) to (p^n/n!)(ξ/p)^n.

*Uses.* `CrystallineCohomology:CR.0`, `PadicHodgeTheory:R06.1/de-rham-period-ring`, `PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus`, `PadicHodgeTheory:R06.1/algebraic-closure-in-bdr-plus`, `mathlib:WittVector.frobenius`.

*Sources.*

- Espaces de Banach de dimension finie, §8.5, definition of A_max and B_max^+, p. 61: “On note Amax le séparé complété pour la topologie p- adique de la Sous-Ainf -Algèbre de Ainf [ p1 ] engendrée par p−1 I” The definition (Colmez's I is the ideal generated by p and ξ).
- Espaces de Banach de dimension finie, Remarque 8.13, p. 62: “Si e = [K : K0 ], on passe de πK” Colmez Remark 8.13 gives the identification K ⊗_{K_0} B_max^+ ≅ B_max,K^+ (the formulas follow in the display).

#### Construction. The crystalline logarithm λ: (O_C^♭)^× → B_cris^+ and its extension to (C^♭)^×

*Module* `TauCeti/PadicHodge/PeriodRings/Semistable.lean`. *Node* `PadicHodgeTheory:R06.1/crystalline-logarithm`.

(1) For x ∈ 1 + m_{O_C^♭}, the terms ([x] − 1)^n/n lie in A_cris for n ≫ 0 and tend to 0 p-adically, so log_cris[x] = Σ_{n≥1}(−1)^{n+1}([x] − 1)^n/n converges in B_cris^+; x ↦ log_cris[x] is a G_K-equivariant homomorphism with φ(log_cris[x]) = p log_cris[x]; extending by 0 on the Teichmüller lifts of k̄^× gives λ: (O_C^♭)^× → B_cris^+. (2) (Compatibility with log_dR.) If y ∈ (O_C^♭)^× and y^♯ ∈ K̄^× ∩ O_C^×, then log_cris[y] = log_dR([y]/y^♯) + log(y^♯) in B_dR^+, where log_dR is the logarithm on 1-units of B_dR^+ and log the p-adic logarithm on O_{K̄}^× (trivial on roots of unity). (3) log_cris[ε^a] = at for a ∈ Z_p.

*Hypotheses.* A_cris ⊆ B_dR^+ as in R06.1/acris-embedding-injective.

*API.*

- `logCris` (*constructor*) — λ: (O_C^♭)^× → B_cris^+, x ↦ log_cris[x] on 1-units, 0 on Teichmüller lifts of k̄^×.
- `logCris_mul` (*simp*) — λ(xy) = λ(x) + λ(y).
- `frobenius_logCris` (*relation*) — φ(λ(x)) = pλ(x).
- `logCris_galois` (*functoriality*) — λ(gx) = g λ(x).
- `logCris_epsilon` (*simp*) — λ(ε^a) = a t.
- `logCris_eq_logDR` (*compatibility*) — λ(y) = log_dR([y]/y^♯) + log(y^♯) when y^♯ ∈ O_{K̄}^×.

*Used by.*

- Brinon–Conrad Definition 9.2.3 — B_st^+ is generated over B_cris^+ by adjoining the logarithms λ_st(y) of non-units
- Brinon–Conrad Example 9.2.8 — Kummer extensions of Q_p by Q_p(1) are crystalline, realised by t and log_cris[ũ]
- `PadicHodgeTheory:R06.1/semistable-period-ring` — the universal property of B_st^+ extends λ to (C^♭)^×

*Unit tests.* A wrong definition fails one of these.

- `logCris_one` (degenerate) — λ(1) = 0.
- `logCris_epsilon_eq_t` (computation) — λ(ε) = t.
- `logCris_compat_logDR_units` (compatibility) — For y ∈ 1 + m_{O_C^♭} with y^♯ = 1, λ(y) = log_dR[y] (the B_dR^+ logarithm of R06.1/fontaine-element-t).
- `logCris_not_extend_nonunits` (non-example) — λ does not extend to (C^♭)^× as a map into B_cris: λ(p^♭) would be u, which is transcendental over Frac(B_cris) (R06.1/log-p-flat-transcendental).

*Construction.*

1. (1) θ(([x] − 1)^N) ∈ pO_C for N ≫ 0, so ([x] − 1)^N = pw_1 + ξw_2 has divided powers in A_cris; write n = Nq_n + r_n and use v_p(q_n!/n) → ∞ (B-C Lemma 9.2.2). Homomorphism, equivariance and φ-compatibility pass to the limit from finite sums.
2. (2) Both sides are additive in y and live in a torsion-free group, so replace y by y^N to reach y^♯ ∈ 1 + pO_{K'} for a finite K'/K; then compare the p-adically convergent series in O_{K'} ⊗_{W(k')} A_cris[1/p] with the Fil-adically convergent series in B_dR^+: the p-adic tail of Σ(−1)^{n+1}(p^n/n)v^n (θ̃(v) = 0) lies in Fil^i for n ≥ i (B-C Lemma 9.2.7).
3. (3) is R06.1/fontaine-element-t (3) in A_cris.

*Acceptance.*

- λ(ε) = t; φ(λ(x)) = λ(x^p) = pλ(x).

*Uses.* `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:R06.1/t-in-acris`, `PadicHodgeTheory:R06.1/fontaine-element-t`, `PadicHodgeTheory:R06.1/algebraic-closure-in-bdr-plus`, `PadicHodgeTheory:R06.1/frobenius-on-acris`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Lemma 9.2.2, p. 137: “Moreover, x 7→ logcris ([x]) is GK -equivariant homomorphism and” Statement (1) (the φ-compatibility is the following display).
- CMI Summer School notes on p-adic Hodge theory, Lemma 9.2.7, p. 140: “If y ∈ R× and y (0) ∈ OK then logcris ([y]) = logdR ([y]/y (0) ) + logK (y (0) ).” Statement (2).

#### Construction. The semistable period ring B_st with Frobenius, monodromy and Galois action

*Module* `TauCeti/PadicHodge/PeriodRings/Semistable.lean`. *Node* `PadicHodgeTheory:R06.1/semistable-period-ring`.

B_st^+ := Sym_Q((C^♭)^×) ⊗_{Sym_Q((O_C^♭)^×)} B_cris^+ (B-C Definition 9.2.3), the initial B_cris^+-algebra with a G_K-equivariant homomorphism λ_st: (C^♭)^× → B_st^+ extending λ of R06.1/crystalline-logarithm; B_st := B_st^+[1/t]. Choosing y_0 = p^♭ and u := λ_st(p^♭) gives B_st^+ = B_cris^+[u], B_st = B_cris[u], a polynomial ring in u. Structures: Frobenius φ(λ_st(y)) = pλ_st(y) (so φ(u) = pu), extending φ of B_cris; G_K acts by g(u) = u + c(g)t, where g(p^♭) = p^♭ε^{c(g)}; the monodromy operator N is the unique B_cris-linear derivation of B_st with N(λ_st(y)) = −v^♭(y) for y ∈ (C^♭)^× (normalisation v^♭(p^♭) = 1), i.e. N = −d/du. Then Nφ = pφN, N commutes with G_K, B_st^{N=0} = B_cris, and 0 → B_cris → B_st → B_st → 0 (last map N) is exact. Sign convention: this is Fontaine–Ouyang's N (N(log[ϖ]) = −1); Brinon–Conrad's operator is −N.

*Hypotheses.* The normalisation of u and N: u = λ_st(p^♭) with (p^♭)^♯ = p, N = −d/du (Fontaine's convention as in Fontaine–Ouyang Definition 6.15).

*API.*

- `Bst` (*data*) — B_st = B_cris[u] (Polynomial Bcris), canonically Sym_Q((C^♭)^×) ⊗ B_cris.
- `Bst.u` (*constructor*) — u = λ_st(p^♭) ∈ B_st.
- `Bst.logSt` (*constructor*) — λ_st: (C^♭)^× → B_st, λ_st(y) = v^♭(y)u + λ(y/(p^♭)^{v^♭(y)}) (for y with rational valuation, using p-power roots of p^♭).
- `Bst.frobenius` (*constructor*) — φ on B_st with φ(u) = pu, extending φ on B_cris.
- `Bst.monodromy` (*constructor*) — N = −d/du, a B_cris-linear derivation.
- `Bst.monodromy_frobenius` (*relation*) — N ∘ φ = p·φ ∘ N.
- `Bst.galois_u` (*relation*) — g(u) = u + c(g)t with c the Kummer cocycle of p.
- `Bst.monodromy_galois` (*relation*) — N(gb) = gN(b).
- `Bst.ker_monodromy` (*characterisation*) — B_st^{N=0} = B_cris.
- `Bst.monodromy_surjective` (*characterisation*) — N: B_st → B_st is surjective.
- `Bst.universal` (*universal-property*) — (B_st^+, λ_st) is initial among B_cris^+-algebras S with a G_K-equivariant homomorphism (C^♭)^× → S extending λ.

*Used by.*

- Brinon–Conrad §9.2 — D_st(V) = (B_st ⊗ V)^{G_K} is a filtered (φ,N)-module
- `PadicHodgeTheory:R06.2/period-functors` — semistable representations and D_st
- `PadicHodgeTheory:R06.3 (part D)` — potentially semistable representations and the Weil–Deligne parameter from (D_st, φ, N)
- `CohomologyComparisons:CP.4` — semistable comparison with the Hyodo–Kato structure uses B_st with the same N-normalisation

*Unit tests.* A wrong definition fails one of these.

- `Bst_monodromy_u` (computation) — N(u) = −1 and N(u^2) = −2u.
- `Bst_monodromy_bcris` (degenerate) — N vanishes on B_cris ⊆ B_st.
- `Bst_frobenius_restrict` (compatibility) — φ on B_st restricts to the Frobenius of B_cris (R06.1/frobenius-on-acris), and N is Polynomial.derivative up to sign.
- `Bst_not_bcris` (non-example) — u ∉ B_cris: N(u) = −1 ≠ 0.
- `Bst_sign_convention` (characterisation) — With B-C's normalisation N_BC = v^♭(y_0)·d/dλ_st(y_0) one has N_BC = −N.

*Construction.*

1. Sym_Q((C^♭)^×) is a polynomial ring over Sym_Q((O_C^♭)^×) in one variable, because 1 → (O_C^♭)^× → (C^♭)^× → Q → 1 is exact (v^♭) (B-C (9.2.1)); so B_st^+ = B_cris^+[λ_st(y_0)] for any y_0 with v^♭(y_0) ≠ 0.
2. Changing y_0 to y_0w with w ∈ (O_C^♭)^× changes u by λ(w) ∈ B_cris^+, so d/du and hence N = −v^♭(y_0)d/dλ_st(y_0) do not depend on y_0 (B-C Remark 9.2.5).
3. g(p^♭) = p^♭ε^{c(g)} gives g(u) = u + λ(ε^{c(g)}) = u + c(g)t; φ is defined by φ(λ_st(y)) = λ_st(y^p) = pλ_st(y).
4. Nφ = pφN: both sides are derivations twisted by φ, agree on B_cris (zero) and on u: Nφ(u) = N(pu) = −p and pφN(u) = pφ(−1) = −p. N commutes with G_K because N(c(g)t) = 0.
5. Exactness: N = −d/du on B_cris[u] is surjective with kernel B_cris (F-O Proposition 6.16).

*Acceptance.*

- N(u^2) = −2u; φ(u^2) = p^2u^2; B_st^{N=0, φ=1} ⊇ B_cris^{φ=1}.
- Tate curve: for q ∈ m_K, q̃ ∈ O_C^♭ with q̃^♯ = q, λ_st(q̃) = v_p(q)u + λ(unit) and g(λ_st(q̃)) = λ_st(q̃) + η(g)t realises V_p(E_q) inside B_st (B-C Example 9.2.9).

*Uses.* `PadicHodgeTheory:R06.1/crystalline-logarithm`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:R06.1/tilt-of-cp-and-special-elements`, `mathlib:Polynomial.derivative`.

*Planet:* Semistable period ring B_st.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Definition 9.2.3 and Remark 9.2.5, pp. 138–139: “Non-canonically, Bst ≃ Bcris [X] and Bst ≃ Bcris [X] upon choosing y ∈ Frac(R)× with” The construction; B-C define N = v_0·d/dX, the negative of the convention used here.
- Theory of p-adic Galois representations, Definition 6.15 and Propositions 6.16–6.17, p. 122: “is the unique Bcris -derivation such that N (log[$]) = −1.” Fontaine–Ouyang's normalisation N(log[ϖ]) = −1, with ϖ^{(0)} = −p.
- Theory of p-adic Galois representations, Proposition 6.17, p. 122: “(2) N ϕ = pϕN .” The commutation relation.

#### Construction. The embedding B_st → B_dR attached to log p = 0

*Module* `TauCeti/PadicHodge/PeriodRings/Semistable.lean`. *Node* `PadicHodgeTheory:R06.1/bst-embedding-into-bdr`.

For a choice of log_K with log_K(p) ∈ K_0 (R06.1/log-extension-to-kbar), there is a unique G_K-equivariant B_cris-algebra homomorphism ι_{log}: B_st → B_dR with ι(λ_st(y)) = log_dR([y]/y^♯) + log_K(y^♯) for y ∈ (C^♭)^× with y^♯ ∈ Q̄_p^×; on u = λ_st(p^♭) it gives ι(u) = log_dR([p^♭]/p) + log_K(p) = Σ_{n≥1}(−1)^{n+1}ξ^n/(np^n) + log_K(p). The image ι(B_st) does not depend on the choice of log_K(p) ∈ K_0, and with Iwasawa's choice log_K(p) = 0 the map depends only on C. ι(B_st^+) ⊆ B_dR^+ and ι commutes with φ only on B_cris (B_dR has no Frobenius). K ⊗_{K_0} B_st inherits via ι the subspace filtration.

*Hypotheses.* log_K(p) ∈ K_0; ι injective by R06.1/k-tensor-bst-injective.

*API.*

- `bstToBdR` (*constructor*) — ι: B_st →+* B_dR for Iwasawa's log (log p = 0).
- `bstToBdR_u` (*simp*) — ι(u) = Σ_{n≥1}(−1)^{n+1}ξ^n/(np^n).
- `bstToBdR_bcris` (*compatibility*) — ι restricted to B_cris is the inclusion B_cris ⊆ B_dR.
- `bstToBdR_galois` (*functoriality*) — ι(gb) = gι(b).
- `bstToBdR_range_independent` (*other*) — For any log_K(p) ∈ K_0 the image of B_st in B_dR is the same subring.
- `bstToBdR_fil` (*structure*) — Fil^i(K ⊗_{K_0} B_st) := (K ⊗ B_st) ∩ Fil^iB_dR via ι.

*Used by.*

- Brinon–Conrad §9.2 — the filtration on D_st(V)_K comes from K ⊗ B_st ⊆ B_dR
- `PadicHodgeTheory:R06.2/period-functors` — K ⊗_{K_0} D_st(V) ⊆ D_dR(V)

*Unit tests.* A wrong definition fails one of these.

- `bstToBdR_u_mod_fil2` (computation) — ι(u) − ξ/p ∈ Fil^2B_dR.
- `bstToBdR_one` (degenerate) — ι(1) = 1.
- `bstToBdR_theta` (compatibility) — θ_dR(ι(u)) = 0 = log_K(p) (Iwasawa's choice), and θ_dR(ι(b)) = θ_cris(b) for b ∈ A_cris.
- `bstToBdR_not_frobenius` (non-example) — There is no Frobenius on B_dR making ι φ-equivariant: φ(u) = pu but the image of ξ ∈ Fil^1 would have to satisfy φ(ξ) ∉ Fil^1.

*Construction.*

1. Define the homomorphism (C^♭)^× → B_dR^+ on the subgroup {y : y^♯ ∈ Q̄_p^×} (which surjects onto (C^♭)^×/(O_C^♭)^×) by log_dR([y]/y^♯) + log_K(y^♯); [y]/y^♯ is a 1-unit of B_dR^+ since θ([y]) = y^♯ ∈ K̄ ⊆ B_dR^+ (R06.1/algebraic-closure-in-bdr-plus).
2. It extends λ on units by R06.1/crystalline-logarithm (2), so the universal property of B_st^+ (R06.1/semistable-period-ring) gives ι.
3. Changing log_K(p) by c ∈ K_0 changes ι(u) by c ∈ K_0 ⊆ B_cris, so the image is unchanged (B-C text before Theorem 9.2.10).

*Acceptance.*

- ι(u) ∈ Fil^0 and θ_dR(ι(u)) = log_K(p) = 0 with Iwasawa's choice; ι(u) ≡ ξ/p mod Fil^2.

*Uses.* `PadicHodgeTheory:R06.1/semistable-period-ring`, `PadicHodgeTheory:R06.1/crystalline-logarithm`, `PadicHodgeTheory:R06.1/log-extension-to-kbar`, `PadicHodgeTheory:R06.1/algebraic-closure-in-bdr-plus`, `PadicHodgeTheory:R06.1/crystalline-period-ring`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, §9.2, text before Theorem 9.2.10, p. 143: “Hence, the Bcris -subalgebra image of Bst in BdR is independent of the choice” Independence of the image.
- Theory of p-adic Galois representations, §6.1.2, display (6.9), p. 119: “then we get the desired logarithm map log : (Fr R)∗ → BdR for any x ∈” F-O's logarithm with log[ϖ] = log([ϖ]/(−p)).

### Lemmas, theorems and comparisons

#### Lemma. The ring of integers of C_p is p-adically complete, p is not a unit, and Frobenius is surjective modulo p

*Node* `PadicHodgeTheory:R06.1/cp-integers-p-adically-complete`.

Let O_C = 𝓞_ℂ_[p] be the valuation subring of C = ℂ_[p] (Mathlib PadicComplexInt). Then (i) p is not a unit of O_C; (ii) O_C is p-adically separated and complete, i.e. the instance IsAdicComplete (span {p}) O_C holds; (iii) the absolute Frobenius x ↦ x^p of O_C/pO_C is surjective. Consequently the Mathlib constructions fontaineTheta, PreTilt.untilt, fontaineThetaInvertP, BDeRhamPlus and BDeRham are defined for R = O_C, and θ: W(O_C^♭) → O_C is surjective by surjective_fontaineTheta.

*Hypotheses.* p a prime; C = ℂ_[p] = completion of Q̄_p = PadicAlgCl p for the spectral norm, with |p| = 1/p (PadicComplex.valuation_p).

*Proof outline.*

1. (i) v(p) = 1/p < 1 (PadicComplex.valuation_p), so p lies in the maximal ideal of the valuation ring O_C and is not a unit.
2. (ii) Since |p| < 1 and the value group of C is p^Q, the ideals p^n O_C are the closed balls {|x| ≤ p^{-n}}, so the p-adic topology of O_C is its norm topology. O_C is the closed unit ball of the complete field ℂ_[p] (a uniform-space completion, hence complete), so it is complete; it is separated because ⋂_n p^n O_C = {0}.
3. (iii) C is algebraically closed (PadicComplex.isAlgClosed), so every x ∈ O_C has a p-th root y ∈ C with |y| = |x|^{1/p} ≤ 1, i.e. y ∈ O_C; reducing modulo p gives surjectivity of Frobenius on O_C/p.
4. The three facts are exactly the instance arguments [Fact ¬IsUnit (p : R)], [IsAdicComplete (span {p}) R] of Mathlib's BDeRham file and the hypothesis hF of surjective_fontaineTheta.

*Acceptance.*

- The Mathlib definitions BDeRhamPlus (𝓞_ℂ_[p]) p and BDeRham (𝓞_ℂ_[p]) p elaborate once these instances are provided (checked in the suggested Lean file).
- Non-example: for K/Q_p finite with ramification index e > 1, O_K is p-adically complete but x ↦ x^p is not surjective on O_K/p (a uniformiser π_K is not a p-th power modulo p), so surjective_fontaineTheta does not apply to R = O_K; this is why the period rings are built from O_C.

*Uses.* `mathlib:PadicComplex`, `mathlib:PadicComplexInt`, `mathlib:PadicComplexInt.integers`, `mathlib:PadicComplex.isAlgClosed`, `mathlib:surjective_fontaineTheta`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, §4.3, opening paragraph, p. 52: “it is convenient to work more generally with any p-adically separated and complete ring (e.g., OCK but not OK )” B-C use exactly the p-adic completeness of O_C (and its failure for O_K) to set up R and θ; the node records it as a Mathlib instance.
- CMI Summer School notes on p-adic Hodge theory, Proposition 2.1.1, p. 11: “The field CK is algebraically closed.” Algebraic closedness gives the p-th roots needed for surjectivity of Frobenius modulo p.

#### Lemma. Semilinear Galois descent: Hilbert 90 for GL_n and completed unramified descent

*Node* `PadicHodgeTheory:R06.1/semilinear-galois-descent`.

(i) Let L/F be a Galois extension of fields (finite or infinite) and D a finite-dimensional L-vector space with a semilinear action of Gal(L/F) such that every vector has an open stabilizer. Then the natural map L ⊗_F D^{Gal(L/F)} → D is an isomorphism; equivalently H^1_cont(Gal(L/F), GL_n(L)) = 1 for L with the discrete topology. (ii) (Completed unramified descent.) Let R be a complete discrete valuation ring with perfect residue field k, R' the completion of the maximal unramified extension R^{un} (residue field k̄), and M a finitely generated R'-module with a semilinear action of G_k = Gal(k̄/k) continuous for the natural topology of M. Then M^{G_k} is a finitely generated R-module and R' ⊗_R M^{G_k} → M is an isomorphism; after inverting a uniformiser, every finite-dimensional Frac(R')-vector space with continuous semilinear G_k-action is spanned by its invariants.

*Hypotheses.* (i) needs only that the action is discrete (open stabilizers); no topology on F is used. (ii) needs continuity of the G_k-action and completeness of R'; k perfect.

*Proof outline.*

1. (i) Reduce to L/F finite: choose a basis of D and a finite Galois subextension L_1 fixing it (open stabilizers); D = L ⊗_{L_1} D_1 with D_1 the L_1-span of the basis.
2. (i) Finite case (Cartier's proof of Hilbert 90 for GL_n, F-O Theorem A.108(3)): for a cocycle c: Gal(L/F) → GL_n(L) put b(x) = Σ_σ c_σ σ(x) for x ∈ L^n; linear independence of characters (Dedekind) gives x with b(x) ... columns spanning, so b is invertible and c_σ = b σ(b)^{-1}. For n = 1 this is Mathlib's groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units.
3. (ii) Reduce modulo the uniformiser π: M/πM is a finite-dimensional k̄-space with discrete semilinear G_k-action (continuity), so by (i) (M/πM)^{G_k} spans and H^1(G_k, M/πM) = 0 (as H^1(G_k, k̄) = 0 by the additive Hilbert 90).
4. (ii) Successive approximation with continuous 1-cocycles gives H^1_cont(G_k, Λ) = 0 for a G_k-stable lattice Λ, so Λ^{G_k}/π = (Λ/πΛ)^{G_k}; lift a k-basis to get an R-basis of Λ^{G_k} and conclude by Nakayama; torsion modules are handled by dévissage as in B-C Lemma 3.2.6.

*Acceptance.*

- The Galois action of Gal(F(i)/F) (F = Q_3, i^2 = −1) on L^2 by σ(x, y) = (σ(y), σ(x)) is semilinear and D^{Gal} = {(x, σx)} is 2-dimensional over Q_3, spanning D.
- Non-example for (i) without discreteness: the continuous but non-discrete semilinear G_K-action on the C-line C(1) has C(1)^{G_K} = 0 (Tate–Sen), so C ⊗_K C(1)^{G_K} → C(1) is not surjective; the discreteness hypothesis cannot be dropped.

*Uses.* `mathlib:groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units`, `mathlib:krullTopology`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Proof of Theorem 2.4.6, display (2.4.3), p. 20: “is an isomorphism. (See [47, Ch. II, Lemma 5.8.1] for a proof, resting on the non-vanishing of discriminants for finite Galois extensions.)” Statement (i) in the finite case, with the discreteness extension explained right after.
- CMI Summer School notes on p-adic Hodge theory, Lemma 3.2.6, p. 36: “Let M be a finitely generated R′ -module equipped with a semilinear Gk -action that is con-” Statement (ii), completed unramified descent (the sentence continues 'tinuous with respect to the natural topology on M').
- Theory of p-adic Galois representations, Appendix A.5.2, Theorem A.108 (Hilbert's Theorem 90), p. 209: “(3) For all n ≥ 1, H 1 (L/K, GLn (L)) is trivial.” Hilbert 90 for GL_n with the proof due to Cartier.

#### Lemma. Ax–Sen lemma

*Node* `PadicHodgeTheory:R06.1/ax-sen-lemma`.

Let K be a complete nonarchimedean field of characteristic 0 with residue characteristic p, v its valuation, E an algebraic extension of K and α an element of a separable closure of E. Put Δ_E(α) = min{v(α' − α)} over the E-conjugates α' of α. Then there is a ∈ E with v(α − a) > Δ_E(α) − p v(p)/(p − 1)^2.

*Hypotheses.* char K = 0 (the characteristic p case has a different constant, F-O Proposition 3.6).

*Proof outline.*

1. F-O §3.1.2: reduce to α of degree a power of p over E by a trace/Tschirnhaus argument (Lemma 3.5 bounds the valuations of the roots of the derivatives of the minimal polynomial).
2. Induct on the degree, using that the roots of P^{(d−1)} (P the minimal polynomial) are close to α, and a weighted average Σ_σ σ(c)(α − σ(α)) over a set S of coset representatives to produce a with the stated bound.

*Acceptance.*

- If α ∈ E then Δ_E(α) = +∞ and a = α works.
- For E = Q_p, α = ζ_p − 1 (conjugates at distance v = 1/(p−1)): the lemma produces a ∈ Q_p with v(α − a) > 1/(p−1) − p/(p−1)^2 (a negative bound for p = 2, 3 — the lemma is informative only when Δ_E(α) is large).

*Source.* Theory of p-adic Galois representations, §3.1.2, Proposition 3.3 (Ax–Sen's lemma, characteristic 0 case), p. 41: “Ax-Sen's Lemma means that if all the conjugates α0 are close to α, then α is close to an element of E.” The statement; the displayed inequality (3.2) is the bound in the node.

#### Theorem. Ax–Sen–Tate: invariants of closed subgroups on C

*Node* `PadicHodgeTheory:R06.1/ax-sen-tate-invariants`.

Let K/Q_p be finite, C = ℂ_[p] with the G_K-action of R06.1/galois-action-on-cp, H ⊆ G_K a closed subgroup and L = Q̄_p^H. Then C^H is the closure L̂ of L in C. In particular C^{G_K} = K, and for H open, C^H = L is a finite extension of K.

*Hypotheses.* K/Q_p finite (more generally K complete of characteristic 0 with algebraic closure dense in C).

*Proof outline.*

1. Let x ∈ C^H and choose x_n ∈ Q̄_p with v(x − x_n) ≥ n. For g ∈ H, v(g(x_n) − x_n) ≥ min(v(g(x_n − x)), v(x_n − x)) ≥ n because g is an isometry fixing x.
2. So Δ_L(x_n) ≥ n and the Ax–Sen lemma gives y_n ∈ L with v(x_n − y_n) ≥ n − p/(p−1)^2; hence y_n → x and x ∈ L̂.
3. Conversely L̂ ⊆ C^H by continuity of the action. For H = G_K, L = K is complete, and for H open, L is finite over K hence complete.

*Acceptance.*

- C^{G_{Q_p}} = Q_p; C^{G_K} = K for K = Q_p(ζ_p).
- For H = G_{K_∞} with K_∞ = K(μ_{p^∞}), C^H = K̂_∞ ≠ K_∞ (the cyclotomic Z_p-extension is not complete).

*Uses.* `PadicHodgeTheory:R06.1/galois-action-on-cp`, `PadicHodgeTheory:R06.1/ax-sen-lemma`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Proposition 2.1.2 with proof, p. 12: “Choose x ∈ CH K , so we want to show x is a limit of points in K” Statement (B-C's typesetting drops the hats and the superscript H: C_K^H = completion of L = K̄^H).
- Theory of p-adic Galois representations, Proposition 3.8 with proof, p. 43: “which implies that there exists an ∈ L, such that v(αn − an ) ≥ n − ε, and lim an = α ∈ L.” The proof via Ax–Sen's lemma.

#### Theorem. Tate: traces in finite extensions of a ramified Z_p-extension are almost surjective

*Node* `PadicHodgeTheory:R06.1/tate-trace-almost-surjective`.

Let K/Q_p be finite and K_∞/K an infinitely ramified Galois extension with Gal(K_∞/K) isomorphic to Z_p near the identity (e.g. K_∞ = K(μ_{p^∞})). For every finite extension M/K_∞ inside Q̄_p, the trace Tr_{M/K_∞}(O_M) contains the maximal ideal m_{K_∞}. Equivalently (F-O Corollary A.89), for every a > 0 there is x ∈ M with v(x) > −a and Tr_{M/K_∞}(x) = 1.

*Hypotheses.* K_∞/K_{n_0} a totally ramified Z_p-extension for some layer K_{n_0}; the conclusion concerns finite extensions M of K_∞.

*Proof outline.*

1. Write M = L_0 K_∞ with L_0/K finite Galois and linearly disjoint from K_∞, and L_n = L_0 K_n (B-C Example 13.1.4; F-O proof of Proposition A.88).
2. Herbrand's formula for the different via upper-numbering ramification groups: v_K(D_{L_n/K_n}) = ∫_{−1}^{∞} (|Gal(K_n/K)^v|^{-1} − |Gal(L_n/K)^v|^{-1}) dv (F-O (A.25)); this needs the upper numbering filtration and its compatibility with quotients (Herbrand's theorem).
3. The upper ramification groups of Gal(L_0/K) vanish beyond some h, and for the Z_p-extension |Gal(K_n/K)^v| grows linearly in the break index (B-C Lemmas 13.1.6–13.1.7, F-O (A.34)), so v_K(D_{L_n/K_n}) ≤ ∫_{−1}^{h} |Gal(K_n/K)^v|^{-1} dv → 0.
4. A different of valuation → 0 forces the trace image Tr(O_{L_n}) ⊇ elements of valuation → 0 (F-O Corollary A.72), whence Tr_{M/K_∞}(O_M) ⊇ m_{K_∞}; dividing by the trace of a suitable α gives Corollary A.89.

*Acceptance.*

- For K_∞ = Q_p(μ_{p^∞}) and M = K_∞(p^{1/p}) the trace image contains m_{K_∞}, although for each finite layer Tr_{L_n/K_n}(O_{L_n}) is a proper ideal.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Theorem 13.1.2 (Tate), p. 199: “For any finite extension M/K∞ , the image of the trace map TrM/K∞ : OM → OK∞ contains mK∞ .” The statement.
- Theory of p-adic Galois representations, Appendix A.4, Proposition A.88 and Corollary A.89, p. 202: “For any a > 0, there exists x ∈ L, such that” The trace-one element of valuation > −a, used in the almost étale descent.

#### Theorem. Tate's normalized traces on the cyclotomic tower (the Tate–Sen axioms for C)

*Node* `PadicHodgeTheory:R06.1/tate-sen-axioms-cyclotomic`.

Let K/Q_p be finite, K_∞ = K(μ_{p^∞}), H_K = Gal(Q̄_p/K_∞), Γ_K = Gal(K_∞/K) and, for n ≥ n_0, K_n = K(μ_{p^n}) with K_∞/K_{n_0} totally ramified with group ≅ Z_p. There are constants c, d > 0 and continuous K_n-linear projections R_n: K̂_∞ → K_n (Tate's normalized traces, R_n|_{K_m} = p^{n−m} Tr_{K_m/K_n}) such that: (1) R_n commutes with Γ_K and R_n ∘ R_m = R_n for m ≥ n; (2) v(R_n(x)) ≥ v(x) − c; (3) R_n(x) → x as n → ∞; (4) K̂_∞ = K_n ⊕ X_n with X_n = ker R_n, and for a topological generator γ_n of Gal(K_∞/K_n), γ_n − 1 is bijective on X_n with v((γ_n − 1)^{-1}x) ≥ v(x) − d; (5) if λ is a principal unit that is not a root of unity, then γ − λ is bijective on K̂_∞ with continuous inverse. Together with the almost étale descent of R06.1/tate-sen-vanishing-on-hk these are the Tate–Sen axioms (TS1)–(TS3) for Λ̃ = C.

*Hypotheses.* K finite over Q_p; the cyclotomic character has open image, so K_∞/K is an infinitely ramified Z_p-extension up to a finite layer.

*Proof outline.*

1. Ramification estimate: v(Tr_{K_{n+1}/K_n}(O_{K_{n+1}})) is bounded below by n − const, from the upper numbering filtration of the Z_p-extension (F-O Propositions A.84, A.91, Corollary A.92; B-C Proposition 13.1.9).
2. Define R_n(x) = p^{n−m}Tr_{K_m/K_n}(x) for x ∈ K_m; independence of m follows from transitivity of the trace. The bound (2) follows from the estimate (F-O Proposition A.95) and extends R_n to K̂_∞ by continuity.
3. (4): X_n is the completion of ⋃_m (K_m ∩ X_n); on each finite-dimensional K_n-space K_m ∩ X_n, γ_n − 1 is injective (its kernel is K_m^{γ_n} ∩ X_n = K_n ∩ X_n = 0), hence bijective, and the uniform bound on its inverse (F-O Proposition A.97(2)) comes from the same trace estimate; extend by continuity.
4. (5): on K_n the operator γ − λ is invertible when v(λ − 1) > d or λ is not a root of unity, and on X_n it is a small perturbation of the invertible γ − 1 (F-O Proposition A.97(3), B-C Lemma 14.1.9).

*Acceptance.*

- For K = Q_p and x ∈ Q_p(μ_{p^m}), R_0(x) = p^{−m}Tr(x); R_0(ζ_{p^m}) = 0 for m ≥ 2 and R_0(1) = 1.

*Uses.* `PadicHodgeTheory:R06.1/tate-trace-almost-surjective`, `PadicHodgeTheory:R06.1/ax-sen-tate-invariants`.

*Sources.*

- Theory of p-adic Galois representations, Appendix A.4.2, Proposition A.97, p. 204: “(2) The operator γn − 1 is bijective on Xn and has a continuous inverse” Statements (4)–(5) with the constant d.
- CMI Summer School notes on p-adic Hodge theory, §14.1, Proposition 14.1.7, p. 240: “Axiom (TS3) is satisfied in Sen's situation for any c3 ∈ R>1 .” B-C verify the Tate–Sen axioms (TS2) (Proposition 14.1.6) and (TS3) for C.

#### Theorem. Almost étale descent: cohomology of H_K with coefficients in C-representations

*Node* `PadicHodgeTheory:R06.1/tate-sen-vanishing-on-hk`.

In the notation of R06.1/tate-sen-axioms-cyclotomic, let W be a finite-dimensional C-vector space with a continuous semilinear G_K-action. Then H^n_cont(H_K, W) = 0 for all n ≥ 1, H^1_cont(H_K, GL_d(C)) = 1, W = C ⊗_{K̂_∞} W^{H_K}, and inflation H^n_cont(Γ_K, W^{H_K}) → H^n_cont(G_K, W) is an isomorphism for all n ≥ 0.

*Hypotheses.* W a C-representation of G_K (B-C Definition 2.2.1); continuous cohomology with continuous cochains (Mathlib continuousCohomology).

*Proof outline.*

1. F-O Lemma 3.9: a cocycle U on an open H_0 ⊆ H_K with v(U_σ − 1) ≥ a can be improved to v(M^{-1}U_σσ(M) − 1) ≥ a + 1, using α ∈ C^{H_1} with Σ_{τ ∈ H_0/H_1} τ(α) = 1 and v(α) ≥ −a/2 (Tate's almost surjective trace, R06.1/tate-trace-almost-surjective).
2. Iterate and pass to the limit (Corollary 3.10) to trivialise the cocycle on H_0; the finite quotient H_K/H_0 is handled by Hilbert 90 (R06.1/semilinear-galois-descent), giving H^1_cont(H_K, GL_d(C)) = 1 (F-O Proposition 3.11), i.e. W = C ⊗ W^{H_K}.
3. Higher cohomology and additive coefficients: the same averaging with α gives contracting homotopies (B-C Lemma 14.3.1, Proposition 14.3.2), so H^n(H_K, W) = 0 for n ≥ 1; inflation-restriction/Hochschild–Serre then identifies H^n(G_K, W) with H^n(Γ_K, W^{H_K}) (B-C Proposition 14.3.3).

*Acceptance.*

- For W = C: C^{H_K} = K̂_∞ (Ax–Sen–Tate) and H^1(H_K, C) = 0.

*Uses.* `PadicHodgeTheory:R06.1/tate-trace-almost-surjective`, `PadicHodgeTheory:R06.1/semilinear-galois-descent`, `PadicHodgeTheory:R06.1/ax-sen-tate-invariants`, `mathlib:continuousCohomology`.

*Sources.*

- Theory of p-adic Galois representations, §3.2.1, Proposition 3.11, p. 45: “Hcont (H, GLn (C)) = 1.” The almost étale descent statement (the superscript 1 is on the previous line in the extraction).
- CMI Summer School notes on p-adic Hodge theory, Proposition 14.3.3, p. 253: “If W ∈ RepCK (GK ), then Hn (H, W ) = 0 for all n ⩾ 1 and the inflation map Hn (G/H, W H ) → Hn (G, W ) is an isomorphism for all n ⩾ 0.” The cohomological statement.

#### Theorem. Tate–Sen theorem: invariants and H^1 of twists of C

*Node* `PadicHodgeTheory:R06.1/tate-sen-theorem`.

Let K/Q_p be finite and η: G_K → O_K^× a continuous character whose image η(G_K) is a commutative p-adic Lie group of dimension at most 1 (i.e. finite or containing Z_p as an open subgroup); write C(η) for C with g·c = η(g)g(c). If η(I_K) is infinite then H^0_cont(G_K, C(η)) = H^1_cont(G_K, C(η)) = 0; if η(I_K) is finite these are 1-dimensional K-vector spaces. In particular C^{G_K} = K, C(r)^{G_K} = 0 and H^1_cont(G_K, C(r)) = 0 for r ≠ 0 (C(r) = C ⊗ Q_p(r)), and H^1_cont(G_K, C) is the 1-dimensional K-space spanned by the class of log χ.

*Hypotheses.* η continuous with values in O_K^× (or Z_p^×); η(G_K) a p-adic Lie group of dimension ≤ 1 — this covers every continuous character with values in Z_ℓ^× for ℓ = p, in particular χ^r and all characters requested by FaltingsFinitenessAndIsogenyTheorems and MordellLawrenceVenkatesh.

*Proof outline.*

1. η(I_K) infinite: by R06.1/tate-sen-vanishing-on-hk applied to the splitting tower of η (a Z_p-extension up to a finite layer, B-C Theorem 14.3.4 proof), H^i(G_K, C(η)) ≅ H^i(Gal(K_∞/K), K̂_∞(η)); after a finite extension (harmless: finite-group cohomology of a Q-vector space vanishes) Gal(K_∞/K) ≅ Z_p with generator γ and λ = η(γ) a principal unit that is not a root of unity.
2. Then x ↦ γ·x − x = λγ(x) − x is bijective on K̂_∞ (R06.1/tate-sen-axioms-cyclotomic (5)), which kills H^0, and a continuous 1-cocycle c is determined by c(γ) through (γ − 1)c(g) = (g − 1)c(γ), so H^1 = 0.
3. η(I_K) finite: for η unramified, C(η)^{G_K} = (K̂^{ur}(η))^{G_k} is 1-dimensional by completed unramified descent (R06.1/semilinear-galois-descent (ii)); in general pass to a finite Galois K'/K killing η|_{I_K} and descend by Hilbert 90.
4. H^1(G_K, C): by R06.1/tate-sen-vanishing-on-hk and the decomposition K̂_∞ = K ⊕ X_0 with γ − 1 bijective on X_0 (after passing to K_n), H^1(G_K, C) ≅ Hom_cont(Γ_K, K), spanned by log χ; the twisted case with η(I_K) finite reduces to it after a finite extension and unramified descent.

*Acceptance.*

- C(1)^{G_{Q_p}} = 0 and C^{G_{Q_p}} = Q_p.
- For p odd, K = Q_p and η = ⟨χ⟩^s = exp(s log χ) with s ∈ Z_p ∖ Z: η χ^{−q} has infinite image on inertia for every q ∈ Z (PARI: the exponent s − q is a nonzero p-adic number for q = −3,…,3 with s = 1/2), so C(ηχ^{−q})^{G_K} = 0 for all q.
- For η of finite order (e.g. a quadratic character), C(η)^{G_K} is a K-line spanned by a generator of the splitting field (Kummer/Hilbert 90).

*Uses.* `PadicHodgeTheory:R06.1/tate-sen-vanishing-on-hk`, `PadicHodgeTheory:R06.1/tate-sen-axioms-cyclotomic`, `PadicHodgeTheory:R06.1/semilinear-galois-descent`, `PadicHodgeTheory:R06.1/ax-sen-tate-invariants`, `mathlib:cyclotomicCharacter`, `mathlib:continuousCohomology`.

*Planet:* Tate–Sen theorem.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Theorem 2.2.7 (Tate–Sen), p. 15: “and CK (r)GK = 0 for r 6= 0 (i.e., if x ∈ CK and g(x) = χ(g)−r x for all g ∈ GK and some r 6= 0 then x = 0).” The r ≠ 0 statement; the same theorem states the η version.
- CMI Summer School notes on p-adic Hodge theory, Theorem 14.3.4 with proof, pp. 253–255: “If η(IK ) is infinite then Hicont (GK , CK (η)) = 0 for i = 0, 1 and these cohomologies are 1- dimensional over K when η(IK ) is finite” Statement and proof of the general η case.
- Theory of p-adic Galois representations, Proposition 5.25, p. 96: “(1) if i 6= 0, then H n (GK , C(i)) = 0 for all n;” F-O's version with all n, proved with Tate's normalized trace.

#### Lemma. The generator ξ = [p^♭] − p of ker θ and the J-adic separation of A_inf[1/p]

*Node* `PadicHodgeTheory:R06.1/explicit-generator-of-ker-theta`.

Let A_inf = W(O_C^♭) and θ: A_inf → O_C Mathlib's fontaineTheta (surjective by R06.1/cp-integers-p-adically-complete). (1) ker θ = ξ A_inf with ξ = [p^♭] − p; an element w = (r_0, r_1, …) ∈ ker θ (Witt coordinates) generates ker θ if and only if r_1 ∈ (O_C^♭)^×; ξ is not a zero-divisor. (2) θ is G_K-equivariant, W(k̄)-linear and open. (3) With θ_Q: A_inf[1/p] → C the p-inverted map (Mathlib fontaineThetaInvertP), ker θ_Q = ξ A_inf[1/p], A_inf ∩ (ker θ_Q)^j = (ker θ)^j for all j ≥ 1, and ⋂_j (ker θ_Q)^j = 0.

*Hypotheses.* O_C^♭ as in R06.1/tilt-of-cp-and-special-elements; A_inf[1/p] = Localization.Away (p : W(O_C^♭)).

*Proof outline.*

1. θ(ξ) = (p^♭)^♯ − p = 0. Since O_C has no p-torsion, ker θ ∩ p^n A_inf = p^n ker θ, and A_inf is p-adically complete, so it suffices that ker θ ⊆ (ξ, p) = ([p^♭], p): for w ∈ ker θ, v^♭(r_0) = v_p(r_0^♯) ≥ 1 = v^♭(p^♭) (B-C Proposition 4.4.3(1)). This special case is also given by PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel.
2. Generator criterion: w = ξ·(r'_0, r'_1, …) has first coordinates (p^♭r'_0, (p^♭)^p r'_1 − r'_0{}^p, …), so r_1 is a unit iff r'_0 is, iff the multiplier is a unit (B-C Proposition 4.4.3(2)).
3. Openness and W(k̄)-linearity: B-C Proposition 4.4.2 (images of basic open ideals are open; θ([j(c)]) = h([c]) on Teichmüller digits). Equivariance: R06.1/galois-action-on-cp.
4. (3): A_inf/ker θ = O_C is p-torsion free, which gives A_inf ∩ ξA_inf[1/p] = ξA_inf and by induction the j-th powers; an element of ⋂(ker θ)^j has first Witt coordinate divisible by all powers of p^♭, hence 0, so it lies in ⋂ p^n A_inf = 0 (B-C Corollary 4.4.5).

*Acceptance.*

- [ε] − 1 ∈ ker θ; it generates ker θ when p = 2 and does not when p > 2, since v^♭(ε − 1) = p/(p − 1) (B-C Example 4.4.4 with the criterion (1)).
- The element μ/φ^{-1}(μ) with μ = [ε] − 1 (AInfCohomology AI.0's ξ) satisfies the criterion (1), so it generates ker θ as well.

*Uses.* `mathlib:WittVector`, `mathlib:WittVector.fontaineTheta`, `mathlib:WittVector.fontaineTheta_teichmuller`, `mathlib:surjective_fontaineTheta`, `mathlib:fontaineThetaInvertP`, `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`, `PadicHodgeTheory:R06.1/tilt-of-cp-and-special-elements`, `PadicHodgeTheory:R06.1/galois-action-on-cp`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Proposition 4.4.3, p. 58: “(1) The ideal ker θ ⊆ W(R) is the principal ideal generated by ξ.” Statement (1); (2) is the generator criterion.
- CMI Summer School notes on p-adic Hodge theory, Corollary 4.4.5, p. 59: “Also, ∩(ker θ)j = ∩(ker θQ )j = 0.” Statement (3).
- Theory of p-adic Galois representations, Proposition 5.12, p. 92: “The kernel of θ, Ker θ is the principal ideal generated by” F-O's version with ξ = [ϖ] + p, ϖ^{(0)} = −p (a different but equivalent generator).

#### Theorem. B_dR^+ is a complete discrete valuation ring with residue field C; Mathlib's B_dR is its fraction field

*Node* `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`.

(1) The natural map A_inf[1/p] → B_dR^+ is injective. (2) B_dR^+ is a complete discrete valuation ring with residue field C (via θ_dR), and every generator of ker θ_Q (e.g. ξ) is a uniformiser; the projection B_dR^+ → A_inf[1/p]/(ker θ_Q)^j is reduction modulo the j-th power of the maximal ideal. (3) B_dR = BDeRham O_C p is the fraction field of B_dR^+ and equals B_dR^+[1/ξ]; the filtration Fil^i B_dR = ξ^i B_dR^+ is the valuation filtration.

*Hypotheses.* As in R06.1/de-rham-period-ring.

*Proof outline.*

1. (1) is ⋂_j (ker θ_Q)^j = 0 (R06.1/explicit-generator-of-ker-theta (3)).
2. (2) ker θ_Q is a nonzero principal maximal ideal of the domain A_inf[1/p] with residue field C, so each A_inf[1/p]/(ker θ_Q)^j is an artinian local ring whose ideals are the (ker θ_Q)^i/(ker θ_Q)^j; an element of the limit is a unit iff its image under θ_dR is nonzero; a non-unit b has compatible quotients b_j with b = ξ b_j mod (ker θ_Q)^j, which assemble to b' with b = ξb'. Hence the maximal ideal is ξB_dR^+, ξ is a nonzerodivisor, B_dR^+ is ξ-adically separated and complete (B-C Proposition 4.4.6).
3. (3) Every generator of ker θ_Q is ξ times a unit of A_inf[1/p], so localising at the set of generators (Mathlib's BDeRham) is localising at ξ, which for a DVR is the fraction field.

*Acceptance.*

- θ_dR(ξ) = 0 and ξ ∉ (ker θ_Q)^2.

*Uses.* `PadicHodgeTheory:R06.1/de-rham-period-ring`, `PadicHodgeTheory:R06.1/explicit-generator-of-ker-theta`, `mathlib:AdicCompletion`, `mathlib:BDeRham`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Proposition 4.4.6, p. 60: “The ring BdR is a complete discrete valuation ring with residue field” Statement (2) (B_dR^+ in the source; the superscript + is on a separate line of the extraction).
- Theory of p-adic Galois representations, §5.2.2, after Definition 5.13, p. 93: “is a complete valuation ring whose residue field is C.” Same statement in F-O.

#### Lemma. The canonical G_K-equivariant embedding of K̄ into B_dR^+

*Node* `PadicHodgeTheory:R06.1/algebraic-closure-in-bdr-plus`.

(1) There is a unique K_0-algebra embedding K̄ → B_dR^+ lifting the inclusion K̄ ⊆ C (composition with θ_dR is the identity), and it is G_K-equivariant; in particular B_dR^+ is a K-algebra and θ_dR is K-linear. (2) Every extension K'/K_0 inside K̄ with finite ramification index receives its valuation topology from the natural topology of B_dR^+, and is closed if complete. (3) Every finite-dimensional K-subspace of B_dR^+ or of B_dR^+/t^m is closed and carries its natural K-linear topology.

*Hypotheses.* Natural topology of R06.1/bdr-natural-topology.

*Proof outline.*

1. (1) B_dR^+ is a complete DVR with residue field C of characteristic 0 containing K_0; each element of K̄ is separable algebraic over K_0, so Hensel's lemma lifts it uniquely to B_dR^+; uniqueness gives equivariance and multiplicativity (B-C Lemma 4.4.10).
2. (2) The topology question reduces, via Exercise 4.5.3(3) (K̂_0^{ur} = W(k̄)[1/p] closed with p-adic topology) and a K̂_0^{ur}-basis, to continuity of θ_Q (B-C Lemma 4.4.10 proof).
3. (3) A finite-dimensional vector space over a complete field has a unique Hausdorff linear topology (Bourbaki); closedness follows by completeness (B-C Lemma 4.4.12).

*Acceptance.*

- θ_dR(ζ) = ζ for the lifted p-power roots of unity ζ ∈ K̄ ⊆ B_dR^+.
- θ_dR([ε]) = 1 = θ_dR(1), but [ε] − 1 ∈ Fil^1 ∖ Fil^2: the Teichmüller element [ε] is not the lift of any element of K̄.

*Uses.* `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`, `PadicHodgeTheory:R06.1/bdr-natural-topology`, `PadicHodgeTheory:R06.1/galois-action-on-cp`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Lemma 4.4.10, p. 62: “contains a unique copy of K as a subfield over K0 , and this lifting from the residue field is compatible with the action of GK0 .” Statement (1) (the K there is K̄ with the bar lost in extraction).
- CMI Summer School notes on p-adic Hodge theory, Lemma 4.4.12, p. 63: “is closed and acquires its natural K-linear topology as its subspace topology.” Statement (3).

#### Theorem. Filtration and graded ring of B_dR: Fil^i = t^iB_dR^+ and gr B_dR ≅ ⊕ C(i)

*Node* `PadicHodgeTheory:R06.1/bdr-filtration-and-graded`.

(1) Fil^i B_dR = t^i B_dR^+ for all i ∈ Z; the filtration is exhaustive, separated and G_K-stable, and B_dR = B_dR^+[1/t]. (2) For every i, θ_dR(t^{−i}·) induces a G_K-equivariant C-linear isomorphism gr^i B_dR ≅ C(i) (C with G_K acting through χ^i times the action on C); gr^• B_dR ≅ B_HT = ⊕_i C(i) as graded C-algebras with G_K-action (R06.1/hodge-tate-period-ring).

*Hypotheses.* As in R06.1/de-rham-period-ring.

*Proof outline.*

1. (1) t is a uniformiser (R06.1/fontaine-element-t), and Fil^i = ξ^iB_dR^+ = t^iB_dR^+ since t/ξ is a unit.
2. (2) Multiplication by t^i identifies B_dR^+/t → Fil^i/Fil^{i+1}, and g(t^i b) = χ(g)^i t^i g(b) gives the twist; multiplicativity gives the ring structure (F-O Proposition 5.22).
3. Stability: G_K preserves t^iB_dR^+ since g(t) = χ(g)t with χ(g) ∈ Z_p^×.

*Acceptance.*

- gr^0 B_dR = C with its usual G_K-action; gr^1 B_dR = C·t̄ ≅ C(1).
- PARI-free check: g(t^i) = χ(g)^i t^i.

*Uses.* `PadicHodgeTheory:R06.1/fontaine-element-t`, `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`, `PadicHodgeTheory:R06.1/hodge-tate-period-ring`.

*Sources.*

- Theory of p-adic Galois representations, §5.2.3, Proposition 5.22, p. 96: “gr BdR = BHT = C(t, 1t ) ⊂ Bd” Statement (2) (the extraction garbles C[t, 1/t] ⊂ B̂_HT = C((t))).
- CMI Summer School notes on p-adic Hodge theory, Proposition 4.4.8 and the paragraph before it, p. 61: “The element t = log([ε]) in BdR is a uniformizer.” Statement (2) as a consequence of t being a uniformiser.

#### Theorem. Galois invariants of B_dR: B_dR^{G_K} = (B_dR^+)^{G_K} = K

*Node* `PadicHodgeTheory:R06.1/de-rham-invariants`.

For K/Q_p finite (more generally any complete discretely valued K ⊆ C with perfect residue field), (B_dR^+)^{G_K} = B_dR^{G_K} = K, the K being embedded by R06.1/algebraic-closure-in-bdr-plus.

*Hypotheses.* K ⊆ C complete discretely valued; G_K = Aut_cont(C/K).

*Proof outline.*

1. K ⊆ (B_dR^+)^{G_K} ⊆ B_dR^{G_K} by equivariance of the embedding of K̄.
2. The filtration is G_K-stable, so B_dR^{G_K} is filtered with gr(B_dR^{G_K}) ⊆ (gr B_dR)^{G_K} = (⊕ C(i))^{G_K} = K (R06.1/bdr-filtration-and-graded and the Tate–Sen theorem), which is 1-dimensional over K; hence dim_K B_dR^{G_K} = 1 (B-C Theorem 4.4.13, F-O Proposition 5.24).

*Acceptance.*

- B_dR^{G_{Q_p}} = Q_p; t ∉ B_dR^{G_K} since g(t) = χ(g)t.

*Uses.* `PadicHodgeTheory:R06.1/bdr-filtration-and-graded`, `PadicHodgeTheory:R06.1/tate-sen-theorem`, `PadicHodgeTheory:R06.1/algebraic-closure-in-bdr-plus`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Theorem 4.4.13, p. 64: “The inclusion K ⊆ BdR is an equality.” Statement (B_dR^{G_K} in the source, superscript lost in extraction).
- Theory of p-adic Galois representations, Proposition 5.24 with proof, p. 96: “Now b − b ∈ BdR and b − b ∈ (Fili BdR )GK for some i ≥ 1, hence b − b = 0.” F-O's proof via gr.

#### Lemma. The ideals I^{[r]}A_inf = {a : φ^n(a) ∈ Fil^r for all n} are generated by ([ε] − 1)^r

*Node* `PadicHodgeTheory:R06.1/frobenius-kernel-ideals-of-ainf`.

For r ∈ N put I^{[r]}A_inf = {a ∈ A_inf : φ^n(a) ∈ Fil^r B_dR for all n ≥ 0}. Then I^{[r]}A_inf = π_ε^r A_inf with π_ε = [ε] − 1, and a ∈ I^{[r]}A_inf generates it iff v^♭(ā) = rp/(p − 1) (ā the image in O_C^♭). For r = 1: a = (a_0, a_1, …) ∈ I^{[1]} generates iff v^♭(a_0) = p/(p − 1), iff v^♭(a_n) = p/(p − 1) for all n. Moreover τ = 1 + [ε^{1/p}] + … + [ε^{1/p}]^{p−1} generates ker θ and π_ε = φ^{-1}(π_ε)τ.

*Hypotheses.* A_inf ⊆ B_dR^+ (R06.1/bdr-plus-complete-dvr); Fil^r A_inf = A_inf ∩ Fil^r B_dR.

*Proof outline.*

1. Lemma 6.19 of F-O: writing α_n = a_n^{(0)}, the vanishing θ(φ^m a) = Σ p^n α_n^{p^m} = 0 for all m gives by double induction v(α_m) ≥ p^{−m}(1 + p^{−1} + … + p^{−r}) for all r, hence v^♭(a_n) ≥ p/(p − 1); with v^♭(ε − 1) = p/(p − 1) this gives IA_inf ⊆ (π_ε, p) and then IA_inf = (π_ε) since O_C^N is p-torsion free.
2. Proposition 6.18: induct on r, using that gr^i A_inf = Fil^i/Fil^{i+1} is free of rank one over O_C generated by θ_1(τ)^i and θ_1(φ^n(π_ε)) = p^n(ε^{(1)} − 1)θ_1(τ) ≠ 0.
3. τ generates ker θ because θ(τ) = Σ (ε^{(1)})^i = 0 and v^♭(τ̄) = p/(p−1) − 1/(p−1) = 1 (criterion of R06.1/explicit-generator-of-ker-theta).

*Acceptance.*

- π_ε ∈ I^{[1]}A_inf: θ(φ^n([ε] − 1)) = 1 − 1 = 0 for all n.

*Uses.* `PadicHodgeTheory:R06.1/explicit-generator-of-ker-theta`, `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`, `PadicHodgeTheory:R06.1/tilt-of-cp-and-special-elements`, `mathlib:WittVector.frobenius`.

*Source.* Theory of p-adic Galois representations, Proposition 6.18 and Lemma 6.19, p. 123: “(1) The ideal I [r] W (R) is the principal ideal generated by πεr . In particular,” The statement (the r-th power of π_ε).

#### Lemma. t lies in A_cris, t^{p−1} ∈ pA_cris, and ker θ_cris has divided powers

*Node* `PadicHodgeTheory:R06.1/t-in-acris`.

(1) The series t = Σ_{n≥1} (−1)^{n+1}([ε] − 1)^n/n converges p-adically in A_cris and its image under j is Fontaine's t ∈ B_dR^+. (2) t^{p−1} ∈ pA_cris, hence t^p/p! ∈ A_cris; more generally t^m/m! ∈ A_cris and a^m/m! ∈ A_cris for every a ∈ ker(θ_cris: A_cris → O_C) and m ≥ 1 (ker θ_cris is a PD ideal); also ker(A_cris → O_C/p) = (ker θ_cris, p) is a PD ideal. (3) Consequently A_cris[1/t] = A_cris[1/t, 1/p] (inverting t inverts p).

*Hypotheses.* A_cris from CrystallineCohomology:CR.0; ε from R06.1/tilt-of-cp-and-special-elements.

*Proof outline.*

1. (1) [ε] − 1 = wξ with w ∈ A_inf, so ([ε] − 1)^n/n = (n − 1)! w^n γ_n(ξ) and (n − 1)! → 0 p-adically (B-C (9.1.3), F-O Proposition 6.6); continuity of j identifies the limits.
2. (2) Modulo p only the terms n ≤ p matter; [ε] − 1 ≡ [ε − 1] mod pA_inf and (ε − 1)^{p−1} = (p^♭)^p·(unit) since v^♭(ε − 1) = p/(p − 1); [p^♭]^p = (ξ + p)^p ≡ ξ^p mod p and ξ^p = p·(p − 1)!·γ_p(ξ) ∈ pA_cris, so ([ε] − 1)^{p−1} ∈ pA_cris and t^{p−1} ∈ pA_cris.
3. PD property: for a = Σ a_nγ_n(ξ), expand γ_m(a) using γ_m(x + y) = Σ γ_i(x)γ_j(y), γ_m(wx) = w^mγ_m(x) and the integrality of (mn)!/(m!(n!)^m); pass to the p-adic limit (B-C Proposition 9.1.3, F-O Propositions 6.4–6.5).
4. (3) t^{p−1} = p·a with a ∈ A_cris, so p·(a·t^{1−p}) = 1 in A_cris[1/t].

*Acceptance.*

- θ_cris(t) = 0.
- t^{p−1}/p ∈ A_cris, so t^p/p! ∈ A_cris (for p = 3: t^2/3 ∈ A_cris).

*Uses.* `CrystallineCohomology:CR.0`, `PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus`, `PadicHodgeTheory:R06.1/fontaine-element-t`, `PadicHodgeTheory:R06.1/tilt-of-cp-and-special-elements`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Proposition 9.1.3, p. 130: “We have t ∈ Acris and tp−1 ∈ pAcris , so tp /p! ∈ Acris .” Statements (1)–(2).
- Theory of p-adic Galois representations, Proposition 6.6 with proof, p. 115: “One has t ∈ Acris and tp−1 ∈ pAcris .” Same statement and proof in F-O.

#### Theorem. Fontaine's description A_cris ≅ W(O_C^♭) ⊗̂_S Λ

*Node* `PadicHodgeTheory:R06.1/acris-completed-tensor-description`.

Let W = W(k) ⊆ A_inf (k the residue field of K, K_0 = W[1/p]), S_ε = W[[π_ε]] ⊆ A_cris (π_ε = [ε] − 1 = e^t − 1), and Λ_ε ⊆ K_0[[t]] the ring of series Σ a_n t^{\{n\}} with a_n ∈ W, a_n → 0 p-adically, where t^{\{n\}} = t^{r(n)}γ_{q(n)}(t^{p−1}/p) for n = r(n) + (p − 1)q(n), 0 ≤ r(n) < p − 1. Let S ⊆ S_ε and Λ ⊆ Λ_ε be the subrings fixed by the torsion subgroup Δ of Gal(K_0(μ_{p^∞})/K_0), S = W[[π_0]] with π_0 = Tr(π_ε). Then π_0 generates I^{[p−1]}A_inf (resp. I^{[2]} for p = 2), φ(π_0) = uπ_0 q^{p−1} (q = p + π_0, u ∈ S^×), and the maps a ⊗ γ_m(π_0/p) ↦ aγ_m(π_0/p) induce isomorphisms of W(O_C^♭)-algebras W(O_C^♭) ⊗̂_S Λ ≅ A_cris ≅ W(O_C^♭) ⊗̂_{S_ε} Λ_ε (p-adically completed tensor products), continuous for the p-adic topologies.

*Hypotheses.* p-adic completed tensor products of p-adically separated complete algebras; A_cris from CrystallineCohomology:CR.0 (with its description A_cris/p ≅ (O_C^♭/(p^♭)^p)[Y_0, Y_1, …]/(Y_i^p), B-C Exercise 9.4.1(3)).

*Proof outline.*

1. Proposition 6.20 of F-O: π_0 and the norm π_1 = Π_{a∈F_p^×}([ε]^{[a]} − 1) generate the same ideal, and π_1 generates I^{[p−1]}A_inf by R06.1/frobenius-kernel-ideals-of-ainf; q' = φ^{-1}(q) and τ both generate ker θ on W[[π_ε^{1/p}]], giving φ(π_0) = uπ_0q^{p−1}.
2. Theorem 6.21: both sides are p-adically separated, complete and p-torsion free, so it suffices to compare modulo p; A_cris/p is the divided-power envelope of O_C^♭ along q', free over O_C^♭/q'^p = O_C^♭/π_0 with basis γ_m(π_0/p) (using π_0 = u'(q'^p − pq'^{p−1})), and the same holds for W(O_C^♭) ⊗̂_S Λ modulo p.

*Acceptance.*

- t = π_ε·(Σ (−1)^nπ_ε^n/(n + 1)) = π_ε·(unit of Λ_ε); t^{p−1}/p ∈ Λ.

*Uses.* `CrystallineCohomology:CR.0`, `PadicHodgeTheory:R06.1/frobenius-kernel-ideals-of-ainf`, `PadicHodgeTheory:R06.1/t-in-acris`, `PadicHodgeTheory:R06.1/frobenius-on-acris`.

*Sources.*

- Theory of p-adic Galois representations, §6.2.2, Proposition 6.20 and Theorem 6.21, pp. 125–126: “Theorem 6.21. One has an isomorphism of W (R)-algebras” The completed tensor description (the display W(R)⊗̂_S Λ → A_cris follows in the source).
- CMI Summer School notes on p-adic Hodge theory, Exercise 9.4.1(3), pp. 153–154: “Deduce the important description” The mod p description of A_cris used in the proof.

#### Theorem. Injectivity of A_cris → B_dR^+

*Node* `PadicHodgeTheory:R06.1/acris-embedding-injective`.

The map j: A_cris → B_dR^+ of R06.1/acris-embedding-into-bdr-plus is injective. Consequently A_cris is a domain, A^0_cris → A_cris is injective, and A_cris, B_cris^+ = A_cris[1/p] and B_cris are identified with subrings of B_dR^+ and B_dR.

*Hypotheses.* As in R06.1/acris-embedding-into-bdr-plus.

*Proof outline.*

1. Neither public source read here contains a proof: Brinon–Conrad state 'Rather more effort (which we omit) is required to prove that j is actually injective', and Fontaine–Ouyang leave the injectivity of A^0_cris → A_cris as Exercise 6.3 and then use A_cris ⊆ B_dR^+ 'by continuity'. The proof route recorded for the formaliser: use the explicit description A_cris ≅ W(O_C^♭) ⊗̂_S Λ (R06.1/acris-completed-tensor-description) and Colmez's expansion isomorphism θ_v: B_dR^+ ≅ C[[X]] (Colmez 2002, §8.4) to show that a p-adically convergent series Σ a_nγ_n(ξ) whose image vanishes in every B_dR^+/Fil^j has all partial sums in p^N A_cris for every N (see the gap 'A_cris → B_dR^+ injectivity').
2. Consequences: a subring of the domain B_dR^+ is a domain; A^0_cris ⊆ A_inf[1/p] ⊆ B_dR^+ factors through A_cris.

*Acceptance.*

- t ∈ A_cris maps to the nonzero element t ∈ B_dR^+.

*Uses.* `PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus`, `PadicHodgeTheory:R06.1/acris-completed-tensor-description`, `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, §9.1, after display (9.1.2), p. 129: “Rather more effort (which we omit) is required to prove that j is actually injective.” The statement, with the proof omitted in the source.
- Theory of p-adic Galois representations, §6.1.1, Exercise 6.3, p. 114: “The map A0cris → Acris is injective. We shall identify A0cris as a” F-O leave the related injectivity as an exercise.

#### Lemma. Continuity of the Galois action on A_cris

*Node* `PadicHodgeTheory:R06.1/galois-action-on-acris-continuous`.

The action of G_K on A_cris is continuous for the p-adic topology; equivalently, for every r ≥ 1 every element of A_cris/p^r has an open stabilizer in G_K.

*Hypotheses.* A_cris with the description of R06.1/acris-completed-tensor-description.

*Proof outline.*

1. By R06.1/acris-completed-tensor-description, A_cris/p^r is generated over W_r(O_C^♭) by the images of elements of Λ ⊆ K_0[[t]], on which G_K acts through χ mod p^r (g(t^{\{n\}}) = χ(g)^n t^{\{n\}}); passing to the open subgroup where χ ≡ 1 mod p^r these generators are fixed.
2. It remains that A_cris/p^r is a W_r(O_C^♭/a)-algebra for an open ideal a of O_C^♭, since G_K acts discretely on O_C^♭/a. By Teichmüller expansions it suffices to take r = 1: ξ^p ∈ pA_cris gives [p^♭]^p ∈ pA_cris, so (p^♭)^p lies in the kernel of O_C^♭ → A_cris/p (B-C Proposition 9.1.2).

*Acceptance.*

- The stabilizer of t mod p^r is {g : χ(g) ≡ 1 mod p^r}, open in G_K.

*Uses.* `PadicHodgeTheory:R06.1/acris-completed-tensor-description`, `PadicHodgeTheory:R06.1/galois-action-on-cp`, `PadicHodgeTheory:R06.1/t-in-acris`.

*Source.* CMI Summer School notes on p-adic Hodge theory, Proposition 9.1.2 with proof, p. 129: “The GK -action on Acris is continuous for the p-adic topology. Equiva- lently, for any r ⩾ 1, the GK -action on Acris /(pr ) has open stabilizers.” The statement; B-C's proof uses Fontaine's tensor description [21, 5.2.7], replaced here by F-O Theorem 6.21.

#### Lemma. The Frobenius-stable ideals I^{[r]} of A_cris

*Node* `PadicHodgeTheory:R06.1/filtration-i-r-of-acris`.

For r ∈ N let I^{[r]} = {a ∈ A_cris : φ^n(a) ∈ Fil^r B_dR for all n ≥ 0}. For r ≥ 1, I^{[r]} is a divided-power ideal of A_cris, equal to the closed W(O_C^♭)-submodule generated by the t^{\{s\}}, s ≥ r. The quotients A^r_cris = A_cris/I^{[r]} and W^r = A_inf/I^{[r]}A_inf are p-torsion free, W^r → A^r_cris is injective, and its cokernel is killed by p^m m!, where m is the largest integer with (p − 1)m < r.

*Hypotheses.* A_cris ⊆ B_dR^+ (R06.1/acris-embedding-injective).

*Proof outline.*

1. The submodule I(r) generated by t^{\{s\}}, s ≥ r, is a PD ideal contained in I^{[r]}.
2. Induction on r: write a = Σ_{s≥r−1} a_s t^{\{s\}} (a_s ∈ A_inf, a_s → 0); then φ^n(a_{r−1}t^{\{r−1\}}) = c_{r,n}φ^n(a_{r−1})t^{r−1} with c_{r,n} ∈ Q^× forces a_{r−1} ∈ I^{[1]} ∩ A_inf = π_εA_inf (R06.1/frobenius-kernel-ideals-of-ainf), and t = π_ε·unit gives a_{r−1}t^{\{r−1\}} ∈ I(r) (F-O Proposition 6.22).
3. A^r_cris embeds into (A_cris/Fil^r A_cris)^N via x ↦ (φ^n x mod Fil^r), which is torsion free; A^r_cris is generated over W(O_C^♭) by the γ_s(π_0/p) with (p − 1)s < r, and p^s s!γ_s(π_0/p) ∈ A_inf (F-O Proposition 6.23).

*Acceptance.*

- t ∈ I^{[1]} ∖ I^{[2]}: φ^n(t) = p^n t ∈ Fil^1 ∖ Fil^2.

*Uses.* `PadicHodgeTheory:R06.1/acris-completed-tensor-description`, `PadicHodgeTheory:R06.1/frobenius-kernel-ideals-of-ainf`, `PadicHodgeTheory:R06.1/acris-embedding-injective`.

*Source.* Theory of p-adic Galois representations, §6.2.3, Propositions 6.22 and 6.23, p. 127: “I [r] is a divided power ideal of Acris which is the associated sub-W (R)-module (and also an ideal) of Acris generated by t{s} for s ≥ r.” The description of I^{[r]}; Proposition 6.23 gives the torsion statements.

#### Lemma. The exact sequence 0 → Z_p t^{\{r\}} → Fil^r_p A_cris → A_cris → 0

*Node* `PadicHodgeTheory:R06.1/divided-frobenius-exact-sequence`.

For r ∈ N let Fil^r A_cris = A_cris ∩ Fil^rB_dR and Fil^r_p A_cris = {a ∈ Fil^r A_cris : φ(a) ∈ p^r A_cris}. Then (1) the sequence 0 → Z_p t^{\{r\}} → Fil^r_p A_cris → A_cris → 0, with second map p^{−r}φ − 1, is exact; (2) Fil^r_p A_cris is the W(O_C^♭)-submodule generated by q'^jγ_n(t^{p−1}/p) with j + (p − 1)n ≥ r (q' = φ^{-1}(q)); (3) p^m m!·Fil^rA_cris ⊆ Fil^r_pA_cris for m the largest integer with (p − 1)m < r.

*Hypotheses.* As in R06.1/filtration-i-r-of-acris.

*Proof outline.*

1. ker(p^{−r}φ − 1): an element x in the kernel lies in I^{[r]}, so x = Σ_{s≥r} a_s t^{\{s\}}; (p^{−r}φ)^n(x) ≡ φ^n(a_r)t^{\{r\}} mod p^n forces x = bt^{\{r\}} with φ(b) = b, b ∈ A_inf, hence b ∈ Z_p (F-O Proposition 6.24).
2. Surjectivity and (2): the submodule N generated by the q'^jγ_n(t^{p−1}/p) lies in Fil^r_p (compute φ on the generators); by p-adic completeness it suffices to solve p^{−r}φ(x) − x ≡ a mod p with x ∈ N, reducing to the Artin–Schreier-type equation φ(y) − q'^{r−(p−1)i}y = b in A_inf, solvable because O_C^♭ is algebraically closed.
3. (3) from R06.1/filtration-i-r-of-acris (the cokernel bound).

*Acceptance.*

- For r = 0, Fil^0_pA_cris = A_cris and the sequence is 0 → Z_p → A_cris → A_cris → 0 with map φ − 1: φ − 1 is surjective on A_cris with kernel Z_p.

*Uses.* `PadicHodgeTheory:R06.1/filtration-i-r-of-acris`, `PadicHodgeTheory:R06.1/acris-completed-tensor-description`, `PadicHodgeTheory:R06.1/frobenius-on-acris`.

*Source.* Theory of p-adic Galois representations, §6.2.3, Proposition 6.24 with proof, p. 128: “the ideal Filrp Acris is the associated sub-W (R)-module of Acris generated by q 0j γn (p−1 tp−1 ), for j + (p − 1)n ≥ r.” Statement (2); statement (1) is the displayed exact sequence.

#### Theorem. The exact sequences 0 → Q_p(r) → Fil^rB_cris → B_cris → 0 (map p^{−r}φ − 1)

*Node* `PadicHodgeTheory:R06.1/bcris-twisted-frobenius-sequences`.

(1) Let B'_cris = {x ∈ B_cris : φ^n(x) ∈ Fil^0 B_cris for all n ∈ N}; then φ(B'_cris) ⊆ B_cris^+ ⊆ B'_cris for p ≠ 2 (and φ^2(B'_cris) ⊆ B_cris^+ ⊆ B'_cris for p = 2). (2) For r ∈ N the sequence 0 → Q_p(r) → Fil^rB_cris^+ → B_cris^+ → 0, with second map p^{−r}φ − 1, is exact (Q_p(r) = Q_pt^r). (3) For r ∈ Z the sequence 0 → Q_p(r) → Fil^rB_cris → B_cris → 0 with map p^{−r}φ − 1 is exact.

*Hypotheses.* B_cris ⊆ B_dR with Fil^r B_cris = B_cris ∩ Fil^rB_dR.

*Proof outline.*

1. (2) invert p in R06.1/divided-frobenius-exact-sequence (Fil^r_p and Fil^r agree after inverting p by its part (3); Z_pt^{\{r\}} ⊗ Q = Q_pt^r).
2. (3) twist (2) with index r + i by Q_p(−i), i.e. multiply by t^{−i}, and pass to the direct limit over i (F-O Theorem 6.25(3)).
3. (1) write x = t^{−r}p^{−j}y with y ∈ I^{[r]} (R06.1/filtration-i-r-of-acris), expand y = Σ a_mt^{\{m+r\}} and estimate the coefficients of φ(x) (F-O Theorem 6.25(1)).

*Acceptance.*

- r = 0 in (3): 0 → Q_p → Fil^0B_cris → B_cris → 0, so (Fil^0B_cris)^{φ=1} = Q_p.

*Uses.* `PadicHodgeTheory:R06.1/divided-frobenius-exact-sequence`, `PadicHodgeTheory:R06.1/filtration-i-r-of-acris`, `PadicHodgeTheory:R06.1/crystalline-period-ring`.

*Source.* Theory of p-adic Galois representations, §6.2.3, Theorem 6.25 with proof, p. 129: “The assertion (2) follows directly from Proposition 6.24.” The source of statements (1)–(3).

#### Theorem. The fundamental exact sequence 0 → Q_p → B_cris^{φ=1} → B_dR/B_dR^+ → 0

*Node* `PadicHodgeTheory:R06.1/fundamental-exact-sequence`.

(1) (Fil^0B_cris)^{φ=1} = B_cris^{φ=1} ∩ B_dR^+ = Q_p, and 0 → Q_p → B_cris ∩ B_dR^+ → B_cris → 0 (map φ − 1) is exact. (2) φ − 1: B_cris → B_cris is surjective, with kernel B_e := B_cris^{φ=1}. (3) (Fundamental exact sequence) 0 → Q_p → B_e → B_dR/B_dR^+ → 0 is exact, i.e. Q_p = B_e ∩ B_dR^+ and B_dR = B_e + B_dR^+. (4) Variants: for r ≥ 0, 0 → Q_p → (Fil^{−r}B_cris)^{φ=1} → Fil^{−r}B_dR/B_dR^+ → 0 is exact; for r ≥ 1, (Fil^rB_cris)^{φ=p^r} = Q_pt^r and Fil^1(B_cris)^{φ=1} = 0. All maps are G_K-equivariant.

*Hypotheses.* B_cris ⊆ B_dR via R06.1/acris-embedding-injective.

*Proof outline.*

1. (1) is R06.1/bcris-twisted-frobenius-sequences (3) with r = 0.
2. (2) surjectivity of φ − 1 on B_cris: given b choose, by (1), x ∈ Fil^0 with (φ − 1)x = b.
3. (3) the 3×3 diagram of F-O Theorem 6.26 with rows (1) and (2): B_e/Q_p ≅ B_cris/(B_cris ∩ B_dR^+) ≅ B_dR/B_dR^+, the last because B_dR = B_cris + B_dR^+ (A_inf[1/p] ⊆ B_cris^+ surjects onto B_dR^+/t^n and t^{−n} ∈ B_cris).
4. (4) restrict (3) to Fil^{−r}; the φ = p^r eigenspace statement is (3) of R06.1/bcris-twisted-frobenius-sequences twisted by t^r.

*Acceptance.*

- The variant used by weak admissibility (B-C Lemma 9.3.7): for r > 0 the space (Fil^{−r}B_cris)^{φ=1} is infinite-dimensional over Q_p, since Fil^{−r}B_dR/B_dR^+ is an infinite-dimensional C-space.
- Kummer check: for u ∈ O_K^× not a root of unity and a compatible system of p-power roots, log_cris[ũ] ∈ B_cris^+ with φ(log[ũ]) = p log[ũ] (B-C Example 9.2.8), so log[ũ]/t ∈ B_e is a lift of the class of log(u)/t ∈ B_dR/B_dR^+.

*Uses.* `PadicHodgeTheory:R06.1/bcris-twisted-frobenius-sequences`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:R06.1/bdr-filtration-and-graded`.

*Planet:* Fundamental exact sequence.

*Sources.*

- Theory of p-adic Galois representations, §6.2.3, Theorem 6.26 and Remark 6.27, p. 130: “The third exact sequence is the so-called fundamental exact se- quence” Statements (1)–(3) with proof.
- CMI Summer School notes on p-adic Hodge theory, Theorem 9.1.10, p. 134: “The space (Fil0 Bcris )φ=1 = {b ∈ Fil0 (Bcris ) | φ(b) = b} of φ-invariant elements in the 0th filtered piece of Bcris is equal to Qp .” Statement (1); B-C give no proof ('This is difficult; see [21, 5.3.7]').
- CMI Summer School notes on p-adic Hodge theory, Proof of Lemma 9.3.7, display (9.3.1), p. 151: “that is valid for all r ⩾ 0. A proof of this exactness can be found in [14, Prop. 1.3(v)]” Variant (4); B-C cite the unavailable Colmez–Fontaine paper, F-O's proof is used.

#### Theorem. Colmez: K ⊗_{K_0} B_max^+ → B_dR^+ is injective

*Node* `PadicHodgeTheory:R06.1/k-tensor-bmax-injective`.

For K/Q_p finite, the natural map K ⊗_{K_0} B_max^+ ≅ B_max,K^+ → B_dR^+ is injective. In particular (K = K_0) B_max^+ → B_dR^+ is injective, and B_max^+ is identified with a subring of B_dR^+.

*Hypotheses.* K/Q_p finite, v a generator of J_K = ker(θ on A_{inf,K}[1/π_K]).

*Proof outline.*

1. Colmez §8.4: fix a continuous K-linear section s of θ and a generator v of J_K; the recursion a_0(x) = x, b_n(x) = θ(a_n(x)), a_{n+1}(x) = (a_n(x) − s(b_n(x)))/v defines a Q_p-linear topological isomorphism θ_v: B_dR^+ ≅ C[[X]], x ↦ Σ b_n(x)X^n (not a ring map).
2. With v = ([π̃_K] − π_K)/π_K (the element adjoined to A_{inf,K} to form A_{max,K}), the expansion restricts to isomorphisms A_max,K ≅ O_C{X} and B_max,K^+ ≅ C{X} (restricted power series) of topological O_K-modules.
3. The commutative square B_max,K^+ → C{X} ⊆ C[[X]] ← B_dR^+ (via θ_v) shows that B_max,K^+ → B_dR^+ is injective; K ⊗_{K_0} B_max^+ ≅ B_max,K^+ (R06.1/bmax-period-ring).

*Acceptance.*

- For K = K_0 the statement says that a p-adically convergent series Σ a_n(ξ/p)^n (a_n ∈ A_inf, a_n → 0) vanishing in B_dR^+ vanishes in B_max^+.

*Uses.* `PadicHodgeTheory:R06.1/bmax-period-ring`, `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`, `PadicHodgeTheory:R06.1/bdr-natural-topology`.

*Sources.*

- Espaces de Banach de dimension finie, §8.5, Proposition 8.14 with proof, p. 62: “max dans BdR,K = BdR est injectif.” The statement (with the superscripts + lost in extraction).
- Espaces de Banach de dimension finie, §8.4, the expansion θ_v, p. 60: “phisme de Qp -espaces vectoriels topologiques de BdR,K (Λ) (resp. Bm,K (Λ)) sur Λ[[X]]” The expansion isomorphism used in the proof (take Λ = C).

#### Theorem. K ⊗_{K_0} B_cris → B_dR is injective and compatible with gradings

*Node* `PadicHodgeTheory:R06.1/k-tensor-bcris-injective`.

For K/Q_p finite, the natural G_K-equivariant map K ⊗_{K_0} B_cris → B_dR is injective; giving K ⊗_{K_0} B_cris the subspace filtration, the induced map gr(K ⊗_{K_0} B_cris) → gr B_dR = B_HT is an isomorphism. Consequently K ⊗_{K_0} Frac(B_cris) → B_dR is injective.

*Hypotheses.* B_cris^+ ⊆ B_dR^+ via R06.1/acris-embedding-injective.

*Proof outline.*

1. Reduce to B_cris^+: K ⊗ B_cris = (K ⊗ B_cris^+)[1/t] and t is invertible in the field B_dR.
2. By R06.1/bmax-period-ring (3), B_cris^+ ⊆ B_max^+ inside B_dR^+; K is flat over K_0, so K ⊗_{K_0} B_cris^+ → K ⊗_{K_0} B_max^+ is injective, and K ⊗_{K_0} B_max^+ → B_dR^+ is injective by R06.1/k-tensor-bmax-injective.
3. Graded statement: t ∈ B_cris and A_cris surjects onto O_C, so each gr^i(K ⊗ B_cris) → C(i) is surjective; injectivity on gr is automatic for a subspace filtration (B-C proof of Theorem 9.1.5).
4. Fraction field: B_dR is a field, so a K-linear dependence in K ⊗ Frac(B_cris) clears denominators to one in K ⊗ B_cris.

*Acceptance.*

- For K = Q_p(p^{1/2}) the elements 1 ⊗ 1 and p^{1/2} ⊗ 1 stay K_0-linearly independent over B_cris inside B_dR.

*Uses.* `PadicHodgeTheory:R06.1/k-tensor-bmax-injective`, `PadicHodgeTheory:R06.1/bmax-period-ring`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:R06.1/bdr-filtration-and-graded`, `PadicHodgeTheory:R06.1/t-in-acris`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Theorem 9.1.5 with proof, p. 131: “Unfortuntately, the proof of injectivity in [21, §4.1.2–4.1.3] is incomplete when e(K) > 1” B-C state the theorem, note that Fontaine's proof is incomplete when e > 1 and omit the repair; the node repairs it with Colmez's Proposition 8.14.
- Espaces de Banach de dimension finie, §8.5, after Proposition 8.14, p. 62: “La proposition 8.14 ci-dessus permet de considérer B+” The identification used for the repair.

#### Lemma. Extensions of the p-adic logarithm to K̄^× and the choice log p = 0

*Node* `PadicHodgeTheory:R06.1/log-extension-to-kbar`.

Let log: O_{K̄}^× → K̄ be the p-adic logarithm, trivial on roots of unity (Teichmüller lifts). For q ∈ m_K ∖ {0} and c ∈ K there is a unique homomorphism log_K: K̄^× → K̄ extending log with log_K(q) = c; it is G_K-equivariant, and changing c to c' changes log_K(x) by (v_p(x)/v_p(q))(c' − c). The standard (Iwasawa) choice is q = p, c = 0.

*Hypotheses.* q ∈ m_K ∖ {0}, c ∈ K (so G_K-equivariance holds).

*Proof outline.*

1. Uniqueness: for x ∈ K̄^× write v_p(x) = (m/n)v_p(q); then x^n/q^m ∈ O_{K̄}^× and necessarily log_K(x) = (log(x^n/q^m) + mc)/n.
2. Well-definedness and additivity: the formula is invariant under scaling (m, n) and additive by direct computation (B-C Lemma 9.2.6); equivariance since q, c are G_K-fixed and log commutes with G_K.

*Acceptance.*

- With log_K(p) = 0: log_K(p^{1/2}) = 0 and log_K(−p) = log(−1) + 0 = 0.

*Uses.* `PadicHodgeTheory:R06.1/galois-action-on-cp`.

*Source.* CMI Summer School notes on p-adic Hodge theory, Lemma 9.2.6 with proof, pp. 139–140: “There is a unique homomorphism logK : K → K extending log on OK and satisfying logK (q) = c.” The statement (bars and superscripts × lost in extraction).

#### Theorem. log([p^♭]/p) is transcendental over Frac(B_cris)

*Node* `PadicHodgeTheory:R06.1/log-p-flat-transcendental`.

The element ι(u) = log_dR([p^♭]/p) ∈ B_dR^+ does not lie in Frac(B_cris) (fraction field inside B_dR), and it is transcendental over Frac(B_cris) and over Frac(K ⊗_{K_0} B_cris).

*Hypotheses.* B_cris ⊆ B_dR (R06.1/acris-embedding-injective).

*Proof outline.*

1. Lemma (F-O Lemma 6.12): let β = ξ/p and S = W(O_C^♭)[[β]] ⊆ B_dR^+ (power series with A_inf-coefficients); A_cris ⊆ S, so Frac(B_cris) ⊆ Frac(S). One shows α·ι(u) ∉ S for α ∈ S ∖ {0}, using that θ_i(Fil^iS) = O_C while suitable truncations of α·Σβ^n/n land outside S. This uses that S is p-adically separated, which F-O assert without proof; it follows from Colmez's expansion θ_v (R06.1/k-tensor-bmax-injective), which identifies S with O_C[[X]] as O_C-modules (packet-authored repair, recorded as a source issue).
2. Transcendence (F-O Proposition 6.11): if d ≥ 1 is the degree of the minimal polynomial of ι(u) over C_cris = Frac(B_cris), applying g ∈ G_{K_0} (g ι(u) = ι(u) + c(g)t) and uniqueness of the minimal polynomial gives c := c_{d−1} + dι(u) ∈ B_dR^{G_{K_0}} = K_0, so ι(u) ∈ C_cris, contradicting the lemma.
3. Over Frac(K ⊗ B_cris), a finite extension of C_cris by R06.1/k-tensor-bcris-injective, transcendence persists.

*Acceptance.*

- ι(u) ∉ B_cris although t ∈ B_cris and g(ι(u)) − ι(u) ∈ Z_pt.

*Uses.* `PadicHodgeTheory:R06.1/bst-embedding-into-bdr`, `PadicHodgeTheory:R06.1/k-tensor-bmax-injective`, `PadicHodgeTheory:R06.1/k-tensor-bcris-injective`, `PadicHodgeTheory:R06.1/de-rham-invariants`, `PadicHodgeTheory:R06.1/crystalline-period-ring`.

*Sources.*

- Theory of p-adic Galois representations, §6.1.3, Proposition 6.11 and Lemma 6.12 with proofs, pp. 119–121: “Since S is separated by the p-adic topology, it suffices to show that if r ∈ N and α ∈ S − pS” The proof, including the unproved separatedness claim.
- CMI Summer School notes on p-adic Hodge theory, Proof sketch of Theorem 9.2.10, p. 143: “the (non-noetherian) subring of BdR consisting of sums n⩾0 wn (ξ/p)n with wn ∈ W(R) is p- adically separated.” B-C identify the separatedness as the key point and refer to [21, §4.3.2–4.3.3].

#### Theorem. K ⊗_{K_0} B_st → B_dR is injective

*Node* `PadicHodgeTheory:R06.1/k-tensor-bst-injective`.

For every choice of log_K(p) ∈ K_0, the G_K-equivariant K ⊗_{K_0} B_cris-algebra map K ⊗_{K_0} B_st → B_dR induced by ι is injective; hence B_cris ⊆ B_st ⊆ B_dR, K ⊗_{K_0} B_st carries the subspace filtration, and gr(K ⊗ B_st) → gr B_dR is injective.

*Hypotheses.* log_K(p) ∈ K_0.

*Proof outline.*

1. K ⊗_{K_0} B_st = (K ⊗_{K_0} B_cris)[u]; K ⊗ B_cris ⊆ B_dR (R06.1/k-tensor-bcris-injective) and ι(u) is transcendental over Frac(K ⊗ B_cris) (R06.1/log-p-flat-transcendental), so the polynomial ring embeds (F-O Theorem 6.14(2), B-C Theorem 9.2.10).
2. Changing log_K(p) ∈ K_0 changes ι(u) by an element of K_0, preserving transcendence.

*Acceptance.*

- The images of 1, u, u^2 are K ⊗ B_cris-linearly independent in B_dR.

*Uses.* `PadicHodgeTheory:R06.1/k-tensor-bcris-injective`, `PadicHodgeTheory:R06.1/log-p-flat-transcendental`, `PadicHodgeTheory:R06.1/bst-embedding-into-bdr`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Theorem 9.2.10, p. 143: “Choosing logK (p) ∈ K0 , the resulting GK -equivariant K ⊗K0 Bcris -algebra” The statement (superscripts + dropped).
- Theory of p-adic Galois representations, Theorem 6.14(2) with proof, p. 121: “Note that Frac(K ⊗K0 Bcris ) is a finite extension over Ccris , thus log[$] is transcendental over Frac(K ⊗K0 Bcris ).” F-O's proof, which presupposes injectivity of K ⊗ B_cris → B_dR (supplied here by R06.1/k-tensor-bcris-injective).

#### Theorem. Galois invariants: (B_cris^+)^{G_K} = B_cris^{G_K} = B_st^{G_K} = Frac(B_st)^{G_K} = K_0

*Node* `PadicHodgeTheory:R06.1/crystalline-semistable-invariants`.

For K/Q_p finite with maximal unramified subfield K_0 = W(k)[1/p]: K_0 = (B_cris^+)^{G_K} = B_cris^{G_K} = B_st^{G_K} = Frac(B_cris)^{G_K} = Frac(B_st)^{G_K}. More generally for any complete discretely valued K' ⊆ C, B_st^{G_{K'}} = K'_0 = W(k')[1/p].

*Hypotheses.* log_K(p) ∈ K_0 (the invariants do not depend on it).

*Proof outline.*

1. K_0 = W(k)[1/p] = (A_inf[1/p])^{G_K} ⊆ (B_cris^+)^{G_K} ⊆ … ⊆ Frac(B_st)^{G_K} (W(O_C^♭)^{G_K} = W((O_C^♭)^{G_K}) = W(k)).
2. By R06.1/k-tensor-bst-injective, K ⊗_{K_0} Frac(B_st)^{G_K} ⊆ B_dR^{G_K} = K (R06.1/de-rham-invariants); comparing K_0-dimensions forces Frac(B_st)^{G_K} = K_0 (F-O Theorem 6.14(1)).

*Acceptance.*

- B_cris^{G_{Q_p}} = Q_p; for K = Q_p(p^{1/2}), B_cris^{G_K} = Q_p ≠ K.

*Uses.* `PadicHodgeTheory:R06.1/k-tensor-bst-injective`, `PadicHodgeTheory:R06.1/de-rham-invariants`, `PadicHodgeTheory:R06.1/semistable-period-ring`.

*Sources.*

- Theory of p-adic Galois representations, Theorem 6.14(1) with proof, p. 121: “Thus (1) follows from (2).” The invariants follow from the injectivity K ⊗ B_st ↪ B_dR.
- CMI Summer School notes on p-adic Hodge theory, §8, introduction, p. 101: “so for K0 -dimension reasons the inclusion K0 ⊆ Bcris is an equality.” The same argument for B_cris.

#### Theorem. Galois invariants of the period rings

*Node* `PadicHodgeTheory:R06.1/period-ring-invariants`.

Let K/Q_p be finite, K_0 its maximal unramified subfield. Then: (1) C^{G_K} = K and C(i)^{G_K} = 0 for i ≠ 0 (Tate); (2) B_HT^{G_K} = Frac(B_HT)^{G_K} = K; (3) (B_dR^+)^{G_K} = B_dR^{G_K} = K; (4) (B_cris^+)^{G_K} = B_cris^{G_K} = Frac(B_cris)^{G_K} = K_0 and B_st^{G_K} = Frac(B_st)^{G_K} = K_0; (5) (Fil^0B_cris)^{φ=1} = Q_p. The same holds with K replaced by any finite extension K' ⊆ K̄ (with K'_0) or by K̂^{ur} (with K̂_0^{ur}).

*Hypotheses.* K/Q_p finite; the rings of R06.1.

*Proof outline.*

1. (1): R06.1/tate-sen-theorem. (2): R06.1/hodge-tate-period-ring. (3): R06.1/de-rham-invariants. (4): R06.1/crystalline-semistable-invariants. (5): R06.1/fundamental-exact-sequence.
2. The rings depend only on C, so replacing K by K' or K̂^{ur} changes only the group (B-C Remark 4.4.9).

*Acceptance.*

- CohomologyComparisons CP.2 and MordellLawrenceVenkatesh LV.4 use B_cris^{G_K} = W(k)[1/p]: for K = Q_p this is Q_p.
- C(1)^{G_K} = 0: t̄ ∈ gr^1B_dR is not invariant since g(t) = χ(g)t.

*Uses.* `PadicHodgeTheory:R06.1/tate-sen-theorem`, `PadicHodgeTheory:R06.1/hodge-tate-period-ring`, `PadicHodgeTheory:R06.1/de-rham-invariants`, `PadicHodgeTheory:R06.1/crystalline-semistable-invariants`, `PadicHodgeTheory:R06.1/fundamental-exact-sequence`.

*Sources.*

- Theory of p-adic Galois representations, Proposition 6.28(2), p. 131: “(2) Bcris = Bst = Cst = K0 ,” The crystalline and semistable invariants (superscripts G_K lost in extraction).
- CMI Summer School notes on p-adic Hodge theory, Example 5.1.3, p. 67: “We have seen in Theorem 4.4.13 (using that the associated graded ring to BdR is BHT ) that C G = K, so B G = K too.” The de Rham invariants, including the fraction field.

#### Comparison. Fontaine's arithmetic construction of the period rings agrees with the perfectoid/Mathlib construction

*Node* `PadicHodgeTheory:R06.1/arithmetic-and-perfectoid-constructions-agree`.

Let R_F = lim_{x↦x^p} O_{K̄}/p (Fontaine's ring R, built from the arithmetic object O_{K̄}) and let θ_F: W(R_F) → O_C, Σ[c_n]p^n ↦ Σ c_n^{(0)}p^n, be Fontaine's map. Then: (1) the reduction map O_{K̄}/p → O_C/p is an isomorphism and induces a G_K-equivariant ring isomorphism R_F ≅ PreTilt O_C p = O_C^♭ matching x ↦ x^{(0)} with PreTilt.untilt; (2) under W of this isomorphism θ_F corresponds to Mathlib's fontaineTheta (both are ring maps agreeing on Teichmüller lifts and p-adically continuous); (3) Fontaine's B_dR^+ = lim W(R_F)[1/p]/(ker θ_{F,Q})^j is G_K-equivariantly and filtered isomorphic to BDeRhamPlus 𝓞_ℂ_[p] p (R06.1/de-rham-period-ring) and to Scholze's B_dR^+(C, O_C) (R06.1/bdr-plus-of-perfectoid-affinoid-algebras), compatibly with θ; (4) Fontaine's A_cris (the p-adic completion of W(R_F)[ξ^m/m!]) is isomorphic to the p-completed PD envelope of (A_inf, ker θ) of CrystallineCohomology:CR.0, compatibly with θ, Frobenius and G_K; hence B_cris, B_st and their structures built from either presentation agree.

*Hypotheses.* All identifications are G_K-equivariant; K enters only through G_K.

*Proof outline.*

1. (1) O_{K̄} is dense in O_C, so O_{K̄}/p = O_C/p; R(−) is functorial (B-C Proposition 4.3.1: R(O/pO) ≅ lim_{x↦x^p} O for p-adically complete O).
2. (2) Mathlib's fontaineTheta_teichmuller: θ([x]) = x.untilt; Fontaine's θ_F([x]) = x^{(0)}; both are ring maps W(R) → O_C, continuous for the p-adic topology, and W(R) is generated topologically by Teichmüller lifts over Z_p (every element is Σ p^n[x_n]).
3. (3) the two completions are the completion of the same localised ring along the same ideal (Localization.Away p and W(R)[1/p] agree); for Scholze's ring with (R, R^+) = (C, O_C) the definitions coincide literally (decomposition node, acceptance).
4. (4) A^0_cris = A_inf[ξ^m/m!] is the PD envelope of the regular principal ideal ξA_inf in the p-torsion free ring A_inf (the explicit envelope for regular principal ideals exported by CR.0; B-C Exercise 9.4.1(1)); p-adic completions agree; the Frobenius lifts agree because both extend the Witt Frobenius.

*Acceptance.*

- θ_F([p^♭]) = p = fontaineTheta([p^♭]); both kernels are generated by ξ = [p^♭] − p.

*Uses.* `mathlib:PreTilt`, `mathlib:PreTilt.untilt`, `mathlib:WittVector.fontaineTheta`, `mathlib:WittVector.fontaineTheta_teichmuller`, `mathlib:BDeRhamPlus`, `PadicHodgeTheory:R06.1/de-rham-period-ring`, `PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras`, `PadicHodgeTheory:R06.1/explicit-generator-of-ker-theta`, `CrystallineCohomology:CR.0`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:R06.1/semistable-period-ring`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Proposition 4.3.1, p. 52: “In particular, R(O/pO) → R(O/a) is an isomorphism, and this common ring is a domain if O is a domain.” The identification of Fontaine's R with the tilt of O_C.
- CMI Summer School notes on p-adic Hodge theory, §4.4, definition of θ, p. 56: “Our definition for θ as a set-theoretic map is simple and explicit:” Fontaine's θ on W(R), compared with Mathlib's fontaineTheta.
- CMI Summer School notes on p-adic Hodge theory, Exercise 9.4.1(1), p. 153: “This gives a concrete description of A0cris .” The PD envelope of (A_inf, ker θ) as A_inf[X^n/n!]/(X − ξ).

### What is missing

- Coverage status: `partial`. All R06.1 targets have nodes: C_p and its Galois action, Ax–Sen–Tate and the Tate–Sen theorem (with Tate's normalised traces), the tilt and ker θ = (ξ), B_dR^+/B_dR with filtration Fil^i = t^iB_dR^+, gr B_dR = ⊕C(i), natural topology and continuity of G_K, t = log[ε], B_HT, A_cris → B_dR^+ (A_cris imported from CR.0), B_cris^+, B_cris with Frobenius, B_max^+ (auxiliary), B_st = B_cris[u] with φ, N and G_K, the embedding B_st → B_dR for log p = 0 and injectivity of K ⊗ B_st, the fundamental exact sequence and its variants, all Galois invariants, and the comparison of Fontaine's arithmetic construction with the Mathlib/perfectoid one. Baseline: Mathlib's ℂ_[p], PreTilt/Tilt, fontaineTheta, BDeRhamPlus/BDeRham are cited, not re-planned.
- Proof of injectivity of A_cris → B_dR^+ (gap 'Injectivity of A_cris → B_dR^+').
- Verification of the packet-authored repair of Fontaine–Ouyang Lemma 6.12 (gap 'p-adic separatedness').
- Tate's ramification estimates rest on the upstream LocalFieldsRamification layer 3 (upper numbering, Herbrand, different) through a request.
- **Gap: Injectivity of A_cris → B_dR^+.** The continuous map j: A_cris → B_dR^+ is constructed (R06.1/acris-embedding-into-bdr-plus), but neither public source read proves that it is injective: Brinon–Conrad write 'Rather more effort (which we omit) is required to prove that j is actually injective' (§9.1, p. 129) and Fontaine–Ouyang leave A^0_cris → A_cris injective as Exercise 6.3 and then assume A_cris ⊆ B_dR^+ 'by continuity'. Everything downstream (B_cris ⊆ B_dR, the fundamental exact sequence, K ⊗ B_cris ↪ B_dR) uses it. NEXT ACTION: either (a) read a public proof — candidates: O. Brinon, 'Représentations p-adiques cristallines et de de Rham dans le cas relatif', Mém. SMF 112 (2008), §6 (A_cris of a perfectoid-type ring and its map to B_dR^+), or Colmez's 'Espaces vectoriels de dimension finie et représentations de de Rham' (Astérisque 319) — and record the locator; or (b) write the packet proof suggested in the node: combine Fontaine–Ouyang's description A_cris ≅ W(O_C^♭) ⊗̂_S Λ (Theorem 6.21) with Colmez's expansion θ_v: B_dR^+ ≅ C[[X]] (Colmez 2002 §8.4) to show that an element of A_cris with zero image lies in ⋂ p^N A_cris = 0. Needed by `PadicHodgeTheory:R06.1/acris-embedding-injective`.
- **Gap: p-adic separatedness of W(O_C^♭)[[ξ/p]] ⊆ B_dR^+ (Fontaine–Ouyang Lemma 6.12).** Fontaine–Ouyang's proof that log([p^♭]/p) ∉ Frac(B_cris) uses 'S is separated by the p-adic topology' without proof; Brinon–Conrad identify this as the delicate point and refer to Fontaine's unavailable Astérisque paper. The node repairs it by Colmez's expansion: with β = ξ/p and a section s of θ with s(O_C) ⊆ A_inf, the recursion a_{n+1} = (a_n − s(θ(a_n)))/β preserves S (since w − s(θ(w)) ∈ ξA_inf = pβA_inf for w ∈ A_inf), so θ_β maps S bijectively onto O_C[[X]] compatibly with multiplication by p, and O_C[[X]] is p-adically separated. NEXT ACTION: have the reviewer check this packet-authored argument (Q_p-linearity of θ_β and compatibility with p^N) or find it in print (Colmez 2002 §8.4–8.5 treats the analogous B_max statement). Needed by `PadicHodgeTheory:R06.1/log-p-flat-transcendental`.
- **Request to `CrystallineCohomology:CR.0`.** For A_inf = W(O_C^♭) (O_C = 𝓞_ℂ_[p]) and J = ker(θ: A_inf → O_C) = ξA_inf (ξ = [p^♭] − p a nonzerodivisor): the divided-power envelope D_J(A_inf) over (Z_p, (p), γ) and its p-adic completion A_cris, with the PD map θ_cris: A_cris → O_C and the PD ideal ker θ_cris; p-torsion-freeness of A_cris; the explicit envelope of a regular principal ideal in a p-torsion-free ring, D_J(A_inf) = A_inf[ξ^m/m!]_{m≥1} ⊆ A_inf[1/p] (Brinon–Conrad Exercise 9.4.1(1)); the description A_cris/p ≅ (O_C^♭/(p^♭)^p)[Y_0, Y_1, …]/(Y_i^p) (Exercise 9.4.1(3)); functoriality of the envelope for ring maps preserving J up to (J, p) (used for the Frobenius lift and for the G_K-action). Needed by `PadicHodgeTheory:R06.1/acris-embedding-into-bdr-plus`, `PadicHodgeTheory:R06.1/t-in-acris`, `PadicHodgeTheory:R06.1/frobenius-on-acris`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:R06.1/acris-completed-tensor-description`, `PadicHodgeTheory:R06.1/bmax-period-ring`, `PadicHodgeTheory:R06.1/arithmetic-and-perfectoid-constructions-agree`.
- **Request to `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.** For finite Galois extensions of p-adic fields: the upper numbering ramification filtration and Herbrand's theorem (compatibility with quotients), the formula v_K(D_{L/K}) = ∫_{−1}^{∞}(1 − |G^v|^{-1})dv for the different in terms of upper ramification groups, and the relation between the different and the image of the trace (Tr(O_L) ⊇ m_K^{r} when v(D_{L/K}) is small). Tate's estimates for Z_p-extensions (Brinon–Conrad §13.1, Fontaine–Ouyang A.4) are planned in R06.1 on top of these. Needed by `PadicHodgeTheory:R06.1/tate-trace-almost-surjective`, `PadicHodgeTheory:R06.1/tate-sen-axioms-cyclotomic`.

## P7:annulus-foundations Early analytic coefficient rings

This layer builds the Laurent-series rings of annuli over a complete nonarchimedean field of characteristic 0, with:

- Gauss norms and their multiplicativity, the Fréchet topology and restriction maps;
- the identity principle and Newton-polygon breaks, and Weierstrass preparation on circles;
- the derivation;
- the Robba, bounded, integral and Amice rings;
- coefficient extension and the completed tensor identity.

It then builds the cyclotomic rings over an unramified base, in the variable π, with $\varphi$, the $\Gamma$-action, $t$, the operators ∂ and ∇ and the localisations at the points $\zeta_{p^n}-1$.

These are exactly the rings that ColemanIntegration and RD.0 requested. The ramified case needs the field of norms and is in P7. Acceptance: $t = \log(1+\pi)$ is in $\mathcal R$ but not in $\mathcal R^{\mathrm{bd}}$, and $\sum p^n\pi^{-p^n}$ is in $\mathcal E$ but not in $\mathcal R$.

### Objects

#### Definition. The ring O_K(I) of Laurent series convergent on an annulus

*Module* `TauCeti/NumberTheory/PadicHodge/Annulus/Basic.lean`. *Node* `PadicHodgeTheory:P7:annulus-foundations/annulus-laurent-ring`.

For K as in the hypotheses and a nonempty interval I in (0, infinity), O_K(I) is the set of two-sided coefficient families a : Z -> K such that |a_n| rho^n -> 0 as |n| -> infinity for every rho in I (the Laurent series sum_{n in Z} a_n T^n converging on the annulus {|T| in I}). It is a K-submodule of the K-module of all families Z -> K, and a commutative K-algebra under the Cauchy product (fg)_n = sum_{i+j=n} a_i b_j, each such sum converging absolutely in K. It contains the Laurent polynomials K[T, T^{-1}] as a K-subalgebra, and T is a unit with inverse T^{-1}. For an annulus with centre e in K (ColemanIntegration's A(e; r, s) with 0 <= r < s <= infinity) one takes I = (r, s) and reads T as z - e; the ring does not depend on e.

*Hypotheses.* K is a field complete for a nontrivial nonarchimedean absolute value |.| (Kedlaya–Liu's 'analytic field'); O_K = {|x| <= 1}, m_K = {|x| < 1}, k = O_K/m_K. Characteristic 0 is assumed only where stated. I is a nonempty interval contained in (0, +infinity): open, closed or half-open, possibly a single point, possibly unbounded above. The radius variable rho ranges over I. No condition relates I to the value group |K^x|; for closed endpoints outside the divisible hull of |K^x| the ring is still defined (Berkovich's convention, Kedlaya overview Remark 3.2.4).

*API.*

- `annulusCoeffs` (*constructor*) — The K-submodule of Z -> K of families with |a_n| rho^n -> 0 along the cofinite filter of Z for every rho in I.
- `AnnulusRing` (*data*) — The type O_K(I) of elements of annulusCoeffs K I.
- `AnnulusRing.coeff` (*projection*) — The coefficient family f -> (a_n)_{n in Z}.
- `AnnulusRing.ext` (*extensionality*) — Two elements with the same coefficients are equal.
- `AnnulusRing.instCommRing` (*instance*) — Commutative ring structure with the Cauchy product; K-algebra structure through constants.
- `AnnulusRing.coeff_mul` (*simp*) — coeff (f * g) n = sum over i + j = n of coeff f i * coeff g j (an absolutely convergent sum).
- `AnnulusRing.T` (*constructor*) — The coordinate T (coefficient family Pi.single 1 1).
- `AnnulusRing.T_isUnit` (*characterisation*) — T is a unit with inverse the family Pi.single (-1) 1.
- `AnnulusRing.C` (*constructor*) — Constants c in K (family Pi.single 0 c); C is the algebra map.
- `AnnulusRing.ofLaurentPolynomial` (*coercion*) — The injective K-algebra map K[T, T^{-1}] -> O_K(I) (Mathlib LaurentPolynomial).
- `AnnulusRing.annulusCoeffs_antitone` (*relation*) — If I is contained in J then annulusCoeffs K J <= annulusCoeffs K I.
- `AnnulusRing.annulusCoeffs_one_eq_twoSidedRestricted` (*compatibility*) — annulusCoeffs K {1} = TauCeti.Huber.twoSidedRestrictedSubmodule K K, and the product is twoSidedRestrictedMul.

*Used by.*

- `ColemanIntegration:L0/annulus-residue` — the carrier O_K(A(e; r, s)) whose T^{-1}-coefficient is the residue
- `ColemanIntegration:L0/annulus-exact-iff-residue-zero` — termwise integration inside O_K(I)
- `PadicDifferentialEquationsAndRigidCohomology:RD.0/robba-ring` — the rings of functions on annuli whose union is the Robba ring, compared with Kedlaya analytic rings
- Berger 2002, Section 2 (H_F^alpha) and Proposition 2.31 — B^{dagger,r}_{rig,K} is identified with such a ring in the variable pi_K
- Kedlaya–Liu, Definition 4.1.2 — R^r_K is O_K([omega^r, 1))

*Unit tests.* A wrong definition fails one of these.

- `AnnulusRing.test_T_mul_Tinv` (computation) — In O_K(I), T * T^{-1} = 1, i.e. Pi.single 1 1 convolved with Pi.single (-1) 1 is Pi.single 0 1.
- `AnnulusRing.test_geometric` (computation) — In O_K((0,1)) the family a_n = 1 (n >= 0), 0 (n < 0) lies in the ring and (1 - T) times it equals 1.
- `AnnulusRing.test_geometric_not_mem` (non-example) — The family a_n = 1 (n >= 0), 0 (n < 0) does not lie in O_K({1}): its coefficients do not tend to 0. A definition requiring convergence only as n -> +infinity fails this.
- `AnnulusRing.test_unit_circle` (compatibility) — annulusCoeffs K {1} equals TauCeti.Huber.twoSidedRestrictedSubmodule K K.
- `AnnulusRing.test_polynomial_mem` (degenerate) — Every Laurent polynomial (finitely supported family) lies in annulusCoeffs K I for every I.

*Construction.*

1. Submodule: the condition is preserved by sums (ultrametric inequality |a_n + b_n| rho^n <= max) and scalar multiples.
2. Convergence of the Cauchy product: for fixed n and rho in I, |a_i b_{n-i}| = (|a_i| rho^i)(|b_{n-i}| rho^{n-i}) rho^{-n} tends to 0 as |i| -> infinity, so the sum converges in the complete field K (Lazard 1962, Proposition 1 and (2.3)-(2.4)).
3. Closure: |c_n| rho^n <= sup_i (|a_i| rho^i)(|b_{n-i}| rho^{n-i}), and for |n| large at least one of |i|, |n - i| is large, so |c_n| rho^n -> 0.
4. Ring axioms: associativity, commutativity and distributivity are identities of absolutely convergent double sums in a complete nonarchimedean field (Mathlib's DiscreteConvolution.ringConvolution API, additive version, and the Tau Ceti convolution lemmas for two-sided restricted families).
5. T and T^{-1} are the families concentrated in degree 1 and -1; their product is the unit family.

*Acceptance.*

- For rho = 1 the coefficient submodule of O_K({1}) equals Tau Ceti's twoSidedRestrictedSubmodule K K and the product equals twoSidedRestrictedMul.
- In O_K((0,1)): (1 - T) * sum_{n >= 0} T^n = 1, while sum_{n >= 0} T^n is not in O_K({1}).

*Uses.* `mathlib:DiscreteConvolution.ringConvolution`, `mathlib:LaurentPolynomial`, `mathlib:IsUltrametricDist`, `tauceti:TauCeti.Huber.twoSidedRestrictedSubmodule`, `tauceti:TauCeti.Huber.twoSidedRestrictedMul`.

*Planet:* Ring of analytic functions on an annulus.

*Sources.*

- Relative p-adic Hodge theory: Foundations, Definition 4.1.2, p. 103: “In other words, RrK consists of formal sums” Kedlaya–Liu's R^r_K is O_K([omega^r, 1)) in this notation.
- Relative p-adic Hodge theory: Foundations, Definition 4.1.2, p. 103: “The set RrK forms a ring under formal series addition and multiplication” The ring structure by formal (Cauchy) multiplication.
- Local monodromy of p-adic differential equations: an overview, Definition 3.2.1, p. 10: “The elements of RI can be described as formal Laurent series” Rings of functions on annuli A(I) as Laurent series.
- Les zéros des fonctions analytiques d’une variable sur un corps valué complet, Proposition 1, p. 50 (numdam OCR layer): “La relation (3) implique que l'anneau L^I est intègre.” Lazard's L_K I is O_K(I) written in the valuation variable mu = -log rho; Proposition 1 makes it a ring (integral domain).

#### Definition. The rho-Gauss norm |.|_rho

*Module* `TauCeti/NumberTheory/PadicHodge/Annulus/Basic.lean`. *Node* `PadicHodgeTheory:P7:annulus-foundations/gauss-norm`.

For rho > 0 and a coefficient family a : Z -> K put |a|_rho = sup_n |a_n| rho^n in [0, infinity]. For f in O_K(I) and rho in I, |f|_rho is finite, the supremum is a maximum attained on a nonempty finite set of indices (the dominant indices D(f, rho), with least element n(f, rho) and greatest element N(f, rho)), and |.|_rho is a norm on the K-vector space O_K(I): |f|_rho = 0 iff f = 0, |f + g|_rho <= max(|f|_rho, |g|_rho), |c f|_rho = |c| |f|_rho, and |a_n| rho^n <= |f|_rho (Cauchy inequality); |T^n|_rho = rho^n.

*Hypotheses.* K is a field complete for a nontrivial nonarchimedean absolute value |.| (Kedlaya–Liu's 'analytic field'); O_K = {|x| <= 1}, m_K = {|x| < 1}, k = O_K/m_K. Characteristic 0 is assumed only where stated. I is a nonempty interval contained in (0, +infinity): open, closed or half-open, possibly a single point, possibly unbounded above. The radius variable rho ranges over I.

*API.*

- `gaussNorm` (*data*) — |a|_rho = iSup over n of |a n| * rho^n.
- `gaussNorm_nonneg` (*other*) — 0 <= |f|_rho.
- `AnnulusRing.gaussNorm_eq_zero_iff` (*characterisation*) — For rho in I and f in O_K(I): |f|_rho = 0 iff f = 0.
- `AnnulusRing.gaussNorm_add_le` (*relation*) — |f + g|_rho <= max(|f|_rho, |g|_rho).
- `AnnulusRing.gaussNorm_smul` (*simp*) — |c f|_rho = |c| |f|_rho.
- `AnnulusRing.gaussNorm_T_zpow` (*simp*) — |T^n|_rho = rho^n for n in Z.
- `AnnulusRing.norm_coeff_mul_le_gaussNorm` (*relation*) — |a_n| rho^n <= |f|_rho (Cauchy inequality).
- `AnnulusRing.exists_dominant` (*characterisation*) — For f != 0 and rho in I the set of n with |a_n| rho^n = |f|_rho is finite and nonempty.
- `AnnulusRing.gaussNorm_eq_powerSeries_gaussNorm` (*compatibility*) — For f with a_n = 0 for n < 0, |f|_rho = PowerSeries.gaussNorm (fun x => |x|) rho f.

*Used by.*

- `ColemanIntegration:L0/annulus-log-transcendence` — Gauss norms detect the dominant monomial on a sub-annulus
- `PadicDifferentialEquationsAndRigidCohomology:RD.0/robba-ring` — w_s(f) = -log_{|pi|} |f|_{|pi|^s} compares Kedlaya's partial valuations with the Gauss norm
- Berger 2002, Section 2.1 (valuations V_I) — the norms defining the Frechet topology of B^{dagger,r}_{rig}

*Unit tests.* A wrong definition fails one of these.

- `gaussNorm.test_one_add_T` (computation) — |1 + T|_rho = max(1, rho).
- `gaussNorm.test_constant` (degenerate) — |C c|_rho = |c| for every rho.
- `gaussNorm.test_not_pointwise` (non-example) — If varpi in K has |varpi| = rho, then |varpi - T|_rho = rho > 0 although the series vanishes at T = varpi: the Gauss norm is not the absolute value at a point.
- `gaussNorm.test_powerSeries` (compatibility) — For a power series f (no negative coefficients), gaussNorm rho f = PowerSeries.gaussNorm (fun x => |x|) rho f.

*Construction.*

1. Finiteness and attainment: |a_n| rho^n -> 0 as |n| -> infinity, so only finitely many n have |a_n| rho^n >= |f|_rho / 2 when f != 0; the supremum over this finite set is attained.
2. Norm axioms are coefficientwise consequences of the ultrametric inequality in K.
3. For f supported in n >= 0 the value agrees with Mathlib's PowerSeries.gaussNorm (norm, rho) of the corresponding power series (PowerSeries.gaussNorm_eq).

*Acceptance.*

- |1 + T|_rho = max(1, rho); for |varpi| = rho < 1, |varpi - T|_rho = rho although varpi - T vanishes at T = varpi.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/annulus-laurent-ring`, `mathlib:PowerSeries.gaussNorm`, `mathlib:IsUltrametricDist`.

*Sources.*

- Local monodromy of p-adic differential equations: an overview, Definition 3.2.1, p. 10: “the spectral seminorm on the subspace |t| = r of A(I), restricted to RI , is equal to the norm | · |r given by the formula” The Gauss norm |.|_r is the sup of |c_i| r^i.
- Les zéros des fonctions analytiques d’une variable sur un corps valué complet, (1.7), p. 49 (numdam OCR): “le plus petit (resp. le plus grand) entier i tel que” Lazard's n(f, mu) and N(f, mu): least and greatest dominant indices.

#### Construction. The Frechet topology of O_K(I)

*Module* `TauCeti/NumberTheory/PadicHodge/Annulus/Basic.lean`. *Node* `PadicHodgeTheory:P7:annulus-foundations/frechet-topology`.

O_K(I) carries the initial uniform structure of the family of norms |.|_rho, rho in I (equivalently, rho in any countable subset of I containing the endpoints of a cofinal sequence of compact subintervals). With it O_K(I) is a complete metrizable (Frechet) topological K-algebra; a sequence f_k converges to f iff |f_k - f|_rho -> 0 for every rho in I, iff it converges uniformly on every compact subinterval J of I for |.|_J := sup_{rho in J} |.|_rho = max(|.|_{min J}, |.|_{max J}). For compact I = [a,b] the topology is that of the complete submultiplicative norm |.|_I (a Banach K-algebra). The Laurent polynomials are dense: for f = sum a_n T^n the partial sums sum_{|n| <= N} a_n T^n converge to f.

*Hypotheses.* K is a field complete for a nontrivial nonarchimedean absolute value |.| (Kedlaya–Liu's 'analytic field'); O_K = {|x| <= 1}, m_K = {|x| < 1}, k = O_K/m_K. Characteristic 0 is assumed only where stated. I is a nonempty interval contained in (0, +infinity): open, closed or half-open, possibly a single point, possibly unbounded above. The radius variable rho ranges over I.

*API.*

- `AnnulusRing.instUniformSpace` (*instance*) — The uniform structure inf over rho in I of the pseudometrics d_rho(f,g) = |f - g|_rho.
- `AnnulusRing.instIsTopologicalRing` (*instance*) — Addition and multiplication are continuous.
- `AnnulusRing.instCompleteSpace` (*instance*) — O_K(I) is complete.
- `AnnulusRing.tendsto_iff_gaussNorm` (*characterisation*) — f_k -> f iff |f_k - f|_rho -> 0 for every rho in I.
- `AnnulusRing.hasSum_monomial` (*characterisation*) — The family n -> C(a_n) T^n is summable with sum f.
- `AnnulusRing.denseRange_ofLaurentPolynomial` (*characterisation*) — The image of K[T, T^{-1}] is dense.
- `AnnulusRing.supNorm` (*other*) — For compact I = [a,b]: |f|_I = max(|f|_a, |f|_b), a complete submultiplicative K-algebra norm inducing the topology.
- `AnnulusRing.instFirstCountableTopology` (*instance*) — The topology is first countable (in fact metrizable).

*Used by.*

- Kedlaya–Liu, Remark 4.1.4 — the formal sum sum c_i T^i converges in the Frechet topology; used to define Frobenius lifts by substitution
- `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-frobenius` — phi(f) is defined as a convergent sum sum sigma(a_n) u^n
- `PadicHodgeTheory:P7/robba-ring-of-p-adic-field` — B^{dagger,r}_{rig,K} is the Frechet completion of B^{dagger,r}_K
- Berger 2002, Theoreme 4.10 (Forster) via RD.0/vector-bundles-on-half-open-intervals-free — closed submodules for the Frechet topology

*Unit tests.* A wrong definition fails one of these.

- `frechet.test_Tpow_not_tendsto` (non-example) — In O_K((1/2, 2)) the sequence T^n does not tend to 0 although every coefficient sequence does: coefficientwise convergence is strictly weaker.
- `frechet.test_partialSums` (computation) — In O_K((0,1)) the partial sums sum_{n<=N} T^n converge to (1 - T)^{-1}.
- `frechet.test_singleton_banach` (degenerate) — For I = {rho} the topology is the norm topology of |.|_rho.

*Construction.*

1. Seminorm family: each |.|_rho is a K-norm (gauss-norm). The topology is generated by the balls {|f|_rho < epsilon}; by the maximum principle (gauss-norm-maximum-principle (b)) it suffices to use the endpoints of compact subintervals, and a countable exhausting sequence of compact subintervals gives metrizability.
2. Continuity of multiplication: |fg|_rho = |f|_rho |g|_rho (gauss-norm-multiplicative).
3. Completeness: a Cauchy sequence is Cauchy coefficientwise (|a_n| rho^n <= |f|_rho); the coefficientwise limit satisfies the defining decay for each rho because the decay is uniform along a Cauchy sequence (standard epsilon/3 argument); this is Lazard (2.5)-(2.6): L_K I is separated and complete.
4. Density: |f - sum_{|n|<=N} a_n T^n|_rho = sup_{|n| > N} |a_n| rho^n -> 0 for each rho in I, uniformly on compact subintervals by (b) of the maximum principle.

*Acceptance.*

- In O_K((1/2, 2)) the sequence T^n tends to 0 coefficientwise but not in the Frechet topology, since |T^n|_{3/2} = (3/2)^n.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/gauss-norm`, `PadicHodgeTheory:P7:annulus-foundations/gauss-norm-multiplicative`, `PadicHodgeTheory:P7:annulus-foundations/gauss-norm-maximum-principle`, `mathlib:WithSeminorms`, `mathlib:Seminorm`.

*Sources.*

- Relative p-adic Hodge theory: Foundations, Definition 4.1.3(b), p. 104: “Those rings contained in RrK carry a Fréchet topology, in which a sequence converges if and only if it converges under the ω s -Gauss norm for all s ∈ (0, r].” The Frechet topology via Gauss norms; completeness stated there.
- Les zéros des fonctions analytiques d’une variable sur un corps valué complet, (2.5)-(2.6), p. 51 (numdam OCR): “LKÏ devient une algèbre séparée et complète.” Lazard's topology on L_K I for closed I and its extension to general I as the coarsest topology making restrictions continuous.
- An introduction to the theory of p-adic representations, IV.2, p. 26-27: “annuli, and that it contains B†,r K” Berger: B^{dagger,r}_{rig,K} is a Frechet space for the sup norms on closed annuli, containing B^{dagger,r}_K densely.

#### Construction. Restriction maps between annuli

*Module* `TauCeti/NumberTheory/PadicHodge/Annulus/Basic.lean`. *Node* `PadicHodgeTheory:P7:annulus-foundations/restriction-maps`.

For intervals I contained in J in (0, infinity), restriction res_{J,I} : O_K(J) -> O_K(I) is the identity on coefficient families. It is an injective continuous K-algebra homomorphism with dense image, preserves |.|_rho for rho in I, and satisfies res_{I,I} = id and res_{J,I} o res_{L,J} = res_{L,I}. It commutes with evaluation at points of the smaller annulus and with d/dT.

*Hypotheses.* K is a field complete for a nontrivial nonarchimedean absolute value |.| (Kedlaya–Liu's 'analytic field'); O_K = {|x| <= 1}, m_K = {|x| < 1}, k = O_K/m_K. Characteristic 0 is assumed only where stated. I, J nonempty intervals in (0, infinity) with I contained in J.

*API.*

- `AnnulusRing.res` (*constructor*) — res (h : I subset J) : O_K(J) ->a[K] O_K(I).
- `AnnulusRing.coeff_res` (*simp*) — coeff (res h f) = coeff f.
- `AnnulusRing.res_injective` (*characterisation*) — res h is injective.
- `AnnulusRing.continuous_res` (*instance*) — res h is continuous.
- `AnnulusRing.denseRange_res` (*characterisation*) — res h has dense image.
- `AnnulusRing.res_id` (*functoriality*) — res (subset_refl I) = id.
- `AnnulusRing.res_comp` (*functoriality*) — res h1 o res h2 = res (h1.trans h2).
- `AnnulusRing.gaussNorm_res` (*simp*) — |res h f|_rho = |f|_rho for rho in I.

*Used by.*

- `PadicHodgeTheory:P7:annulus-foundations/robba-ring` — the colimit along restrictions to (r,1) as r -> 1
- `ColemanIntegration:L0/annulus-log-ring` — restriction to the end germ of a residue disc
- `PadicDifferentialEquationsAndRigidCohomology:RD.0/robba-ring` — Kedlaya's restriction Gamma_J -> Gamma_I, injective with dense image

*Unit tests.* A wrong definition fails one of these.

- `res.test_T` (computation) — res h T = T and res h (T^{-1}) = T^{-1}.
- `res.test_id` (degenerate) — res (subset_refl I) f = f.
- `res.test_not_surjective` (non-example) — sum_{n>=0} T^n is in O_K((0,1)) but not in the range of res : O_K((0,2)) -> O_K((0,1)).

*Construction.*

1. Well defined: the decay condition for all rho in J implies it for rho in I (annulusCoeffs_antitone).
2. Ring hom: the Cauchy product is computed by the same formula in both rings.
3. Continuity: |res f|_rho = |f|_rho for rho in I. Dense image: Laurent polynomials are dense in O_K(I) (frechet-topology).
4. Injectivity is immediate on coefficients (the analytic-continuation statement of Brinon–Conrad 10.3 for the Robba ring).

*Acceptance.*

- The restriction O_K((0,2)) -> O_K((0,1)) is not surjective: sum_{n >= 0} T^n lies in the target only.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/annulus-laurent-ring`, `PadicHodgeTheory:P7:annulus-foundations/frechet-topology`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Section 10.3, p. 164: “Observe that the transition maps in the direct limit are injective, thanks to analytic continuation” Restriction between annuli is injective.
- Les zéros des fonctions analytiques d’une variable sur un corps valué complet, (2.5), p. 51 (numdam OCR): “contenu dans I, alors l'inclusion de L^I dans L^J est une application continue” Restriction (inclusion L_K I -> L_K J for J closed in I) is continuous.

#### Construction. Evaluation of Laurent series at points of an annulus

*Module* `TauCeti/NumberTheory/PadicHodge/Annulus/Basic.lean`. *Node* `PadicHodgeTheory:P7:annulus-foundations/evaluation-at-points`.

Let L be a complete valued extension of K and e in K. For z in L with |z - e| in I, ev_{e,z}(f) := sum_{n in Z} a_n (z - e)^n converges in L. The map ev_{e,z} : O_K(I) -> L is a continuous K-algebra homomorphism with ev(T) = z - e, |ev_{e,z}(f)| <= |f|_{|z - e|}, compatible with restriction to sub-annuli containing |z - e| and with field embeddings L -> L' over K. On Laurent polynomials it is Mathlib's evaluation of Laurent polynomials. The functions z |-> ev_{e,z}(f) on A_L(e; I) = {z in L : |z - e| in I} are the rigid analytic functions of ColemanIntegration L0.

*Hypotheses.* K is a field complete for a nontrivial nonarchimedean absolute value |.| (Kedlaya–Liu's 'analytic field'); O_K = {|x| <= 1}, m_K = {|x| < 1}, k = O_K/m_K. Characteristic 0 is assumed only where stated. I is a nonempty interval contained in (0, +infinity): open, closed or half-open, possibly a single point, possibly unbounded above. The radius variable rho ranges over I. L is a field containing K, complete for an absolute value extending that of K (for example C_p for K a complete subfield of C_p); e in K is a centre.

*API.*

- `AnnulusRing.eval` (*data*) — eval e z f = tsum over n of algebraMap K L (a_n) * (z - e)^n, for |z - e| in I.
- `AnnulusRing.evalAlgHom` (*structure*) — For |z - e| in I, eval e z is a K-algebra homomorphism O_K(I) -> L.
- `AnnulusRing.eval_T` (*simp*) — eval e z T = z - e.
- `AnnulusRing.eval_C` (*simp*) — eval e z (C c) = algebraMap K L c.
- `AnnulusRing.norm_eval_le` (*relation*) — |eval e z f| <= |f|_{|z - e|}.
- `AnnulusRing.eval_res` (*compatibility*) — eval e z (res h f) = eval e z f when |z - e| lies in the smaller interval.
- `AnnulusRing.eval_ofLaurentPolynomial` (*compatibility*) — On K[T, T^{-1}], eval e z agrees with LaurentPolynomial.eval₂ at z - e.
- `AnnulusRing.continuous_eval` (*other*) — For fixed z, f |-> eval e z f is continuous.
- `AnnulusRing.eval_map` (*functoriality*) — For a K-embedding tau : L -> L' of complete valued fields, tau (eval e z f) = eval e (tau z) f.

*Used by.*

- `ColemanIntegration:L0/annulus-log-ring` — the realisation rho_a sends f in O_K(A) to the function z |-> f(z)
- `ColemanIntegration:L0/annulus-log-transcendence` — relations among functions are tested pointwise on A(C_p)
- `PadicHodgeTheory:P7:annulus-foundations/localisation-at-roots-of-unity` — theta_n evaluates at zeta_{p^n} - 1
- Berger 2002, Lemma 4.6 — divisibility is checked by zeros at the points zeta - 1

*Unit tests.* A wrong definition fails one of these.

- `eval.test_geometric` (computation) — For |z| < 1 in L: eval 0 z (sum_{n>=0} T^n) = (1 - z)^{-1}.
- `eval.test_const` (degenerate) — eval e z (C c) = c.
- `eval.test_laurentPolynomial` (compatibility) — For a Laurent polynomial P, eval e z P = LaurentPolynomial.eval₂ (algebraMap K L) (z - e) P (as a unit of L).
- `eval.test_outside` (non-example) — For z = 1 the series sum_{n>=0} T^n has terms of norm 1 and does not converge: evaluation is only defined for |z - e| in I.

*Construction.*

1. Convergence: |a_n (z-e)^n| = |a_n| rho^n with rho = |z - e| in I tends to 0 as |n| -> infinity; L is complete.
2. Multiplicativity: rearrangement of the absolutely convergent double series sum_{i,j} a_i b_j (z-e)^{i+j} in a complete nonarchimedean field, grouped by i + j (the Cauchy product formula of annulus-laurent-ring).
3. Bound: ultrametric inequality termwise. Continuity: ev is K-linear and bounded by |.|_{|z-e|}, a continuous norm (frechet-topology).

*Acceptance.*

- ev_{0,z}(sum_{n>=0} T^n) = 1/(1 - z) for |z| < 1.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/annulus-laurent-ring`, `PadicHodgeTheory:P7:annulus-foundations/gauss-norm`, `PadicHodgeTheory:P7:annulus-foundations/frechet-topology`, `mathlib:LaurentPolynomial.eval₂`.

*Sources.*

- Les zéros des fonctions analytiques d’une variable sur un corps valué complet, Section 1, p. 48 (numdam OCR): “par un élément x de K ou d'une extension valuée complète de K, lorsque la série” Laurent series are evaluated at elements of K or of a complete valued extension where the series converges.
- Local monodromy of p-adic differential equations: an overview, Definition 3.2.1, p. 10: “Let RI = RI,K denote the ring Γ(O, A(I)) of rigid analytic functions on A(I).” O_K(I) as functions on the annulus A(I).

#### Definition. The Robba ring R_K

*Module* `TauCeti/NumberTheory/PadicHodge/Annulus/Robba.lean`. *Node* `PadicHodgeTheory:P7:annulus-foundations/robba-ring`.

R_K is the union, inside the K-module of families Z -> K, of the rings O_K((r, 1)) for r in (0,1) (equivalently the colimit of the injective restrictions O_K((r,1)) -> O_K((r',1)), r < r' < 1): germs of Laurent series converging on some annulus r < |T| < 1. It is a commutative K-algebra and an integral domain, with the LF (limit-of-Frechet) topology: the locally convex inductive limit of the Frechet topologies; a sequence converges iff it lies in one O_K((r,1)) and converges there. For f in R_K the Gauss norms |f|_rho are defined for rho close to 1. The ring O_K((0,1))_{>=0} of functions on the open unit disc (coefficients vanishing in negative degrees) is a subring. With a centre e, the elements of R_K are ColemanIntegration's end germs colim_{r->1} O_K(A(e; r, 1)).

*Hypotheses.* K is a field complete for a nontrivial nonarchimedean absolute value |.| (Kedlaya–Liu's 'analytic field'); O_K = {|x| <= 1}, m_K = {|x| < 1}, k = O_K/m_K. Characteristic 0 is assumed only where stated.

*API.*

- `robbaCoeffs` (*constructor*) — The K-submodule of Z -> K of families lying in annulusCoeffs K (Ioo r 1) for some r < 1.
- `RobbaRing` (*data*) — The type R_K, with its Cauchy product.
- `RobbaRing.instCommRing` (*instance*) — Commutative ring and K-algebra structure.
- `RobbaRing.instIsDomain` (*instance*) — R_K is an integral domain.
- `RobbaRing.ofAnnulus` (*constructor*) — For r < 1, the injective K-algebra map O_K((r,1)) -> R_K.
- `RobbaRing.mem_iff` (*characterisation*) — a lies in R_K iff there is r < 1 with |a_n| rho^n -> 0 for all rho in (r,1).
- `RobbaRing.lfTopology` (*instance*) — The LF topology: locally convex inductive limit of the Frechet topologies of the O_K((r,1)).
- `RobbaRing.tendsto_iff` (*characterisation*) — A sequence converges iff it lies in some O_K((r,1)) and converges there.
- `RobbaRing.T` (*constructor*) — The coordinate T, a unit.
- `RobbaRing.openDisc` (*other*) — The subring of power series converging on the open unit disc (Berger B^+_{rig}).
- `RobbaRing.derivative` (*other*) — The derivation d/dT (annulus-derivation on each O_K((r,1))).
- `RobbaRing.toLaurentSeries` (*compatibility*) — On elements with finitely many negative coefficients, the injective ring map to Mathlib LaurentSeries K.

*Used by.*

- `ColemanIntegration:L0/annulus-residue` — residues of differentials on the end germ R_e of a residue disc
- `PadicDifferentialEquationsAndRigidCohomology:RD.0/robba-ring` — compared with Kedlaya's analytic ring Gamma_an,con; the source of Bezout, units and vector bundles theory
- `PadicDifferentialEquationsAndRigidCohomology:RD.0/frobenius-lift-on-robba-ring` — Frobenius lifts act on R_K
- Kedlaya–Liu, Theorem 4.1.9 — slope theory of phi-modules over R_K
- Berger 2002, Section 2.6 — B^dagger_{rig,K} = R_{F'}(pi_K)

*Unit tests.* A wrong definition fails one of these.

- `robba.test_log_mem` (computation) — For K containing Q_p, the family a_n = (-1)^{n-1}/n (n >= 1), 0 otherwise, lies in robbaCoeffs K.
- `robba.test_one_sub_T_unit` (computation) — 1 - T is a unit of R_K with inverse sum_{n>=0} T^n.
- `robba.test_const` (degenerate) — The constants form a copy of K in R_K and C is injective.
- `robba.test_amice_not_mem` (non-example) — For K containing Q_p, the family a_{-p^n} = p^n (n >= 0), 0 otherwise, is not in robbaCoeffs K: |p^n| rho^{-p^n} is unbounded for every rho < 1.
- `robba.test_laurentSeries` (compatibility) — The map from elements of R_K with finitely many negative coefficients to LaurentSeries K is an injective ring homomorphism.

*Construction.*

1. Union of an increasing family of K-subalgebras (restriction-maps) is a K-subalgebra; the domain property is inherited (gauss-norm-multiplicative).
2. LF topology: final locally convex topology for the maps O_K((r,1)) -> R_K (Kedlaya–Liu Definition 4.1.3(c)).
3. Open disc: a power series converging on |T| < 1 converges on every (r, 1).

*Acceptance.*

- log(1 + T) lies in R_{Q_p} (it converges on the open unit disc); sum_{n>=0} p^n T^{-p^n} does not.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/annulus-laurent-ring`, `PadicHodgeTheory:P7:annulus-foundations/restriction-maps`, `PadicHodgeTheory:P7:annulus-foundations/frechet-topology`, `PadicHodgeTheory:P7:annulus-foundations/gauss-norm-multiplicative`, `mathlib:LaurentSeries`.

*Planet:* Robba ring.

*Sources.*

- Local monodromy of p-adic differential equations: an overview, Definition 3.5.1, p. 15: “Let R = RK denote the direct limit of the rings R(a,1) over all a ∈ (0, 1); the ring R is called the Robba ring over K.” Definition of the Robba ring as a direct limit of annulus rings.
- Relative p-adic Hodge theory: Foundations, Definition 4.1.3(c), p. 104: “Those rings contained in RK carry a limit-of-Fréchet topology, or LF topology.” The LF topology.
- An introduction to the theory of p-adic representations, IV.2, p. 27: “is the Robba ring RK of p-adic differential equations” Berger: B^dagger_{rig,K} is the Robba ring.

#### Definition. The Amice ring E and its integral subring O_E

*Module* `TauCeti/NumberTheory/PadicHodge/Annulus/Amice.lean`. *Node* `PadicHodgeTheory:P7:annulus-foundations/amice-ring`.

O_{E,K} is the set of families a : Z -> O_K with a_n -> 0 as n -> -infinity, and E_K = O_{E,K}[1/varpi] the set of bounded families a : Z -> K with a_n -> 0 as n -> -infinity; with the Cauchy product both are commutative rings (O_K-, resp. K-algebras). The Gauss norm |f|_1 = sup_n |a_n| is multiplicative and E_K is complete for it (the varpi-adic topology). O_{E,K} also carries the weak (levelwise) topology: the inverse limit over m of the T-adic topologies on O_{E,K}/varpi^m O_{E,K} = (O_K/varpi^m)((T)); O_{E,K} is complete for both. Reduction modulo m_K gives a surjective ring map O_{E,K} -> k((T)) with kernel {f : all |a_n| < 1}. O_K[[T]][T^{-1}] is dense in O_{E,K} for |.|_1, so O_{E,K} is its varpi-adic completion.

*Hypotheses.* K is a field complete for a nontrivial nonarchimedean absolute value |.| (Kedlaya–Liu's 'analytic field'); O_K = {|x| <= 1}, m_K = {|x| < 1}, k = O_K/m_K. Characteristic 0 is assumed only where stated.

*API.*

- `amiceCoeffs` (*constructor*) — The K-submodule of bounded families tending to 0 at -infinity.
- `AmiceRing` (*data*) — The ring E_K with the Cauchy product.
- `AmiceRing.integral` (*constructor*) — The subring O_{E,K} of families with values in O_K.
- `AmiceRing.gaussNormOne` (*data*) — The multiplicative norm |f|_1 = sup_n |a_n|.
- `AmiceRing.instCompleteSpace` (*instance*) — E_K is complete for |.|_1.
- `AmiceRing.weakTopology` (*other*) — The weak topology on O_{E,K}: inverse limit of the T-adic topologies modulo varpi^m.
- `AmiceRing.reduction` (*projection*) — The surjective ring map O_{E,K} -> k((T)) (Mathlib LaurentSeries k), a |-> (reduction of a_n).
- `AmiceRing.dense_laurentSeries` (*characterisation*) — O_K[[T]][T^{-1}] is dense in O_{E,K} for |.|_1.

*Used by.*

- `PadicDifferentialEquationsAndRigidCohomology:RD.0/frobenius-lift-on-robba-ring` — Frobenius lifts are defined on O_E first, continuous for the weak topology
- `PhiGammaModulesAndIwasawaCohomology:PG.0` — A_{Q_p} = O_{E,Z_p} and B_{Q_p} = E_{Q_p} in the variable pi
- Kedlaya–Liu, Proposition 4.1.8(a) — phi-modules over E_K
- Berger 2008, Section I.2 — B_F is the completion of B^dagger_F, a two-dimensional local field

*Unit tests.* A wrong definition fails one of these.

- `amice.test_inverse` (computation) — In O_E, (1 - T^{-1}) * (-sum_{n>=1} T^n) = 1.
- `amice.test_series_mem` (computation) — For K containing Q_p, the family a_{-p^n} = p^n lies in O_{E,K}.
- `amice.test_not_robba` (non-example) — That family is not in R_K (acceptance of the stage: an element of E not in R).
- `amice.test_reduction` (compatibility) — reduction is a ring map to LaurentSeries k and sends T to the variable X.
- `amice.test_const` (degenerate) — The constants: K -> E_K is injective and |C c|_1 = |c|.

*Construction.*

1. Cauchy product: for fixed n, a_i b_{n-i} -> 0 as |i| -> infinity because one of i, n-i tends to -infinity and the other family is bounded; the product family is bounded and tends to 0 at -infinity.
2. Multiplicativity of |.|_1: |fg|_1 <= |f|_1 |g|_1 termwise. For the reverse inequality, first let f, g be T^{-N} times power series with bounded coefficients: then |f|_1 = lim_{rho -> 1^-} |f|_rho, because each |a_n| rho^n increases to |a_n|, and |.|_rho is multiplicative for rho < 1 (gauss-norm-multiplicative). In general approximate f, g by their truncations f_N = sum_{n >= -N} a_n T^n: |f - f_N|_1 = sup_{n < -N} |a_n| -> 0, and pass to the limit using submultiplicativity. No discreteness of |K^x| is used.
3. Completeness: a |.|_1-Cauchy sequence converges uniformly coefficientwise; the limit is bounded and still tends to 0 at -infinity.
4. Reduction and weak topology: coefficientwise; density of O_K[[T]][T^{-1}]: truncate the negative part.

*Acceptance.*

- (1 - T^{-1})^{-1} = -sum_{n>=1} T^n in O_E, not the formal series sum_{n>=0} T^{-n} (which is not in O_E).

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/gauss-norm`, `PadicHodgeTheory:P7:annulus-foundations/gauss-norm-multiplicative`, `mathlib:LaurentSeries`.

*Planet:* Amice ring.

*Sources.*

- Relative p-adic Hodge theory: Foundations, Definition 4.1.2, p. 103: “The completion of the field Rbd K is the field” E_K = bounded families tending to 0 at -infinity.
- Relative p-adic Hodge theory: Foundations, Definition 4.1.3(a), p. 104: “Those rings contained in EK carry both a p-adic topology (the metric topology defined by the Gauss norm) and a weak topology” The two topologies.
- Theory of p-adic Galois representations, Section 4.3.2, eq. (4.8), p. 80: “the p-adic completion of W [[πε ]][ π1ε ].” O_{E_0} as the p-adic completion of W[[pi]][1/pi].
- An introduction to the theory of p-adic representations, III.1.1, p. 21: “so that AK /p = kK ((πK )).” A_K/p = k_K((pi_K)).

#### Definition. The bounded Robba ring R^bd and its integral subring R^int

*Module* `TauCeti/NumberTheory/PadicHodge/Annulus/Robba.lean`. *Node* `PadicHodgeTheory:P7:annulus-foundations/bounded-robba-ring`.

R^int_K is the set of f in R_K all of whose coefficients lie in O_K, and R^bd_K the set of f in R_K with bounded coefficients; both are subrings, and R^bd_K = R^int_K[1/varpi] for any varpi in K with 0 < |varpi| < 1. Equivalently f in R_K lies in R^bd_K iff sup_{rho in (r,1)} |f|_rho < infinity for some r < 1 (f is bounded on some annulus r < |T| < 1). The Gauss norm |f|_1 := sup_n |a_n| = lim_{rho -> 1} |f|_rho is a multiplicative norm on R^bd_K. Every f in R_K has a_n -> 0 as n -> -infinity, so R^bd_K = R_K cap E_K and R^int_K = R_K cap O_{E,K} inside the families Z -> K.

*Hypotheses.* K is a field complete for a nontrivial nonarchimedean absolute value |.| (Kedlaya–Liu's 'analytic field'); O_K = {|x| <= 1}, m_K = {|x| < 1}, k = O_K/m_K. Characteristic 0 is assumed only where stated.

*API.*

- `RobbaRing.bounded` (*constructor*) — The subring R^bd of elements with bounded coefficients.
- `RobbaRing.integral` (*constructor*) — The subring R^int of elements with all coefficients in O_K.
- `RobbaRing.bounded_eq_localization` (*characterisation*) — R^bd = R^int[1/varpi] for 0 < |varpi| < 1.
- `RobbaRing.mem_bounded_iff` (*characterisation*) — f in R^bd iff sup_{rho in (r,1)} |f|_rho < infinity for some r < 1.
- `RobbaRing.gaussNormOne` (*data*) — |f|_1 = sup_n |a_n|, a multiplicative norm on R^bd with |f|_1 = lim_{rho -> 1} |f|_rho.
- `RobbaRing.bounded_eq_inf_amice` (*relation*) — R^bd = R cap E and R^int = R cap O_E inside Z -> K.
- `RobbaRing.integral_le_bounded` (*relation*) — R^int is contained in R^bd.

*Used by.*

- `PadicDifferentialEquationsAndRigidCohomology:RD.0/bounded-robba-ring` — R^int is a henselian DVR and R^bd its fraction field (RD.0 proves the algebraic structure)
- `PadicDifferentialEquationsAndRigidCohomology:RD.0/units-of-robba-ring` — units of R are the nonzero elements of R^bd
- Kedlaya–Liu, Proposition 4.1.8 — phi-modules over R^bd pure of slope s
- Berger 2002, Section 1.3 — B^dagger_F = R^bd_F and A^dagger_F = R^int_F in the cyclotomic variable

*Unit tests.* A wrong definition fails one of these.

- `bounded.test_log_not_mem` (non-example) — For K containing Q_p: log(1 + T) is in R_K but not in R^bd_K (acceptance of the stage).
- `bounded.test_Tinv_mem` (computation) — T^{-1} lies in R^int although |T^{-1}|_rho = rho^{-1} > 1 for rho < 1.
- `bounded.test_gaussNormOne` (computation) — |varpi^{-1} + T|_1 = |varpi|^{-1}.
- `bounded.test_const` (degenerate) — K is contained in R^bd and O_K in R^int.

*Construction.*

1. Subrings: bounded (resp. integral) coefficient families are closed under the convergent Cauchy product by the ultrametric inequality.
2. Localisation: a bounded family becomes integral after multiplying by a power of varpi.
3. Boundedness on an annulus: for rho in (r0, 1), |f|_rho <= max(sup_{n >= 0} |a_n|, sup_{n < 0} |a_n| r0^n) when the coefficients are bounded; conversely |a_n| = lim_{rho -> 1} |a_n| rho^n <= sup_rho |f|_rho.
4. Multiplicativity of |.|_1: limit rho -> 1 of |fg|_rho = |f|_rho |g|_rho (gauss-norm-multiplicative, gauss-norm-maximum-principle (c)).
5. a_n -> 0 as n -> -infinity: |a_n| <= |a_n| rho^n for n < 0 and rho < 1, and the right side tends to 0.

*Acceptance.*

- Acceptance (stage): t = log(1 + T) lies in R_{Q_p} but not in R^bd_{Q_p}, since the coefficient of T^{p^k} has absolute value p^k (checked with PARI/GP).

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/robba-ring`, `PadicHodgeTheory:P7:annulus-foundations/amice-ring`, `PadicHodgeTheory:P7:annulus-foundations/gauss-norm-multiplicative`, `PadicHodgeTheory:P7:annulus-foundations/gauss-norm-maximum-principle`.

*Sources.*

- Relative p-adic Hodge theory: Foundations, Definition 4.1.2, p. 103: “be the subring of RrK consisting of series whose coefficients have norm at most 1” R^{int,r}_K; R^{bd} = R^{int}[p^{-1}].
- Local monodromy of p-adic differential equations: an overview, Definition 3.5.1, p. 15: “denote the subring of R consisting of series with ci ∈ oK for all i ∈ Z” R^int.
- CMI Summer School notes on p-adic Hodge theory, Section 10.3, p. 165: “denotes the subring of O{r<|u|<1} consisting of those functions which are bounded” The bounded Robba ring as germs of bounded functions.

#### Construction. The derivation d/dT on annulus rings

*Module* `TauCeti/NumberTheory/PadicHodge/Annulus/Basic.lean`. *Node* `PadicHodgeTheory:P7:annulus-foundations/annulus-derivation`.

d = d/dT : O_K(I) -> O_K(I), sum a_n T^n |-> sum n a_n T^{n-1}, is a continuous K-linear derivation with |df|_rho <= rho^{-1} |f|_rho for rho in I, commuting with restriction maps. If char K = 0 then ker d = K and the image of d is the set of f whose T^{-1}-coefficient vanishes; the T^{-1}-coefficient of df is always 0. For L complete over K and z with |z - e| in the interior of I, ev_{e,z}(df) is the derivative at z of the function w |-> ev_{e,w}(f).

*Hypotheses.* K is a field complete for a nontrivial nonarchimedean absolute value |.| (Kedlaya–Liu's 'analytic field'); O_K = {|x| <= 1}, m_K = {|x| < 1}, k = O_K/m_K. Characteristic 0 is assumed only where stated. I is a nonempty interval contained in (0, +infinity): open, closed or half-open, possibly a single point, possibly unbounded above. The radius variable rho ranges over I. Characteristic 0 is used only for the kernel and image statements (division by n).

*API.*

- `AnnulusRing.derivative` (*constructor*) — The K-linear derivation d/dT : Derivation K O_K(I) O_K(I).
- `AnnulusRing.coeff_derivative` (*simp*) — coeff (d f) n = (n + 1) * coeff f (n + 1).
- `AnnulusRing.gaussNorm_derivative_le` (*relation*) — |d f|_rho <= rho^{-1} |f|_rho.
- `AnnulusRing.derivative_res` (*compatibility*) — d commutes with res.
- `AnnulusRing.continuous_derivative` (*other*) — d is continuous for the Frechet topology.
- `AnnulusRing.derivative_eq_zero_iff` (*characterisation*) — In characteristic 0: d f = 0 iff f is a constant.
- `AnnulusRing.coeff_neg_one_derivative` (*simp*) — The T^{-1}-coefficient of d f is 0.
- `AnnulusRing.hasDerivAt_eval` (*compatibility*) — The function w |-> eval e w f has derivative eval e z (d f) at interior points z.

*Used by.*

- `ColemanIntegration:L0/annulus-exact-iff-residue-zero` — exactness of f dz and uniqueness of primitives up to constants
- `ColemanIntegration:L0/annulus-log-transcendence` — the derivation theta = (z - e) d/dz
- `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-derivation` — partial = (1 + pi) d/dpi
- `PadicDifferentialEquationsAndRigidCohomology:RD.0/derivation-on-robba-ring` — operator and spectral norms, continuous differentials and the Frobenius chain rule are built on this derivation

*Unit tests.* A wrong definition fails one of these.

- `derivative.test_T_zpow` (computation) — d (T^n) = n T^{n-1} for every n in Z.
- `derivative.test_const` (degenerate) — d (C c) = 0.
- `derivative.test_polynomial` (compatibility) — On polynomials K[T] contained in O_K(I), d agrees with Mathlib Polynomial.derivative.
- `derivative.test_Tinv_not_exact` (non-example) — T^{-1} is not d f for any f in O_K(I) (its T^{-1}-coefficient is 1).

*Construction.*

1. Well defined and bounded: |n a_n| rho^{n-1} <= rho^{-1} |a_n| rho^n since |n| <= 1 in K.
2. Leibniz rule: coefficientwise identity (i + j) a_i b_j = i a_i b_j + j a_i b_j in the Cauchy product (absolutely convergent sums).
3. Kernel: n a_n = 0 for all n forces a_n = 0 for n != 0 in characteristic 0. Image: the T^{-1}-coefficient of df is 0 * a_0 = 0; conversely sum_{n != -1} c_n T^n has the primitive sum c_n T^{n+1}/(n+1), which converges on I because |1/(n+1)| <= |n+1| (as real numbers) grows at most linearly while |c_n| rho^n decays geometrically after slightly enlarging rho inside I (Berger 2002 Proposition 4.4 proof; ColemanIntegration L0/formal-primitive-radius). For I with a closed endpoint the image statement is taken on the interior.
4. Derivative of the function: expand (z + h - e)^n binomially for |h| < |z - e| and rearrange (evaluation-at-points).

*Acceptance.*

- d(T^{-1}) = -T^{-2}; T^{-1} is not in the image of d.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/annulus-laurent-ring`, `PadicHodgeTheory:P7:annulus-foundations/frechet-topology`, `PadicHodgeTheory:P7:annulus-foundations/evaluation-at-points`, `mathlib:Derivation`, `mathlib:Polynomial.derivative`.

*Sources.*

- Local monodromy of p-adic differential equations: an overview, Remark 4.1.3, p. 17: “so Ω1 is freely generated by dt and Ω2 vanishes.” On an annulus the differentials are free on dt; d/dt generates the derivations.
- Représentations p-adiques et équations différentielles, Proposition 4.4, p. 40: “La connexion ∂ réalise une surjection” Surjectivity of the derivation up to the logarithmic class, proved by termwise integration.

#### Construction. The cyclotomic coefficient rings B^dagger_F and B^dagger_{rig,F} in the variable pi

*Module* `TauCeti/NumberTheory/PadicHodge/Cyclotomic/Rings.lean`. *Node* `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`.

In the setting of the hypotheses, with the variable pi: A^+_F = O_F[[pi]], B^+_F = A^+_F[1/p]; A_F = O_{E,F} (integral Amice ring in pi) and B_F = E_F = A_F[1/p]; for r > 0, B^{dagger,r}_{rig,F} = O_F([p^{-1/r}, 1)) (Laurent series in pi converging on C[r;1[), B^{dagger,r}_F its subring of bounded elements (R^bd cap B^{dagger,r}_{rig,F}), A^{dagger,r}_F the subring of elements with |f|_rho <= 1 for all rho in [p^{-1/r}, 1) (bounded by 1 on C[r;1[); B^dagger_{rig,F} = union over r of B^{dagger,r}_{rig,F} = R_F, B^dagger_F = R^bd_F, A^dagger_F = A_F cap B^dagger_F = R^int_F; B^+_{rig,F} = the functions on the open unit disc (power series in pi converging on |pi| < 1). Inclusions: A^+_F in A^dagger_F in A_F; B^+_F in B^+_{rig,F} in B^dagger_{rig,F}; B^dagger_F = B^dagger_{rig,F} cap B_F; B^{dagger,r}_{rig,F} in B^{dagger,s}_{rig,F} for r <= s. Dictionary with Kedlaya's notation: R = B^dagger_{rig,F}, R^bd = B^dagger_F, R^int = A^dagger_F, E = B_F, O_E = A_F.

*Hypotheses.* p is a prime, k a perfect field of characteristic p, F = W(k)[1/p] with |p| = p^{-1} and sigma its Witt vector Frobenius (an isometric automorphism of F); pi is a variable. zeta_{p^n} (n >= 1) is a compatible system of primitive p^n-th roots of unity in a fixed algebraic closure of F (the epsilon of the shared conventions), F_n = F(zeta_{p^n}), F_infinity = union of the F_n, and chi : Gal(F_infinity/F) -> Z_p^x the cyclotomic character, an isomorphism since F/Q_p is unramified. Berger's radius convention: for r > 0, C[r;1[ = {z : p^{-1/r} <= |z| < 1}; r_n = p^{n-1}(p-1), so that |zeta_{p^n} - 1| = p^{-1/r_n}.

*API.*

- `CycRing.Aplus` (*constructor*) — A^+_F = O_F[[pi]] as a subring of B^dagger_{rig,F} cap A_F.
- `CycRing.A` (*constructor*) — A_F = integral Amice ring O_{E,F} in the variable pi.
- `CycRing.B` (*constructor*) — B_F = E_F.
- `CycRing.BrigR` (*constructor*) — B^{dagger,r}_{rig,F} = O_F([p^{-1/r}, 1)).
- `CycRing.Brig` (*constructor*) — B^dagger_{rig,F} = R_F.
- `CycRing.Bdag` (*constructor*) — B^dagger_F = R^bd_F.
- `CycRing.AdagR` (*constructor*) — A^{dagger,r}_F: elements bounded by 1 on C[r;1[.
- `CycRing.BrigPlus` (*constructor*) — B^+_{rig,F}: power series converging on the open unit disc.
- `CycRing.rn` (*data*) — r_n = p^{n-1}(p-1).
- `CycRing.BrigR_mono` (*relation*) — r <= s implies B^{dagger,r}_{rig,F} is contained in B^{dagger,s}_{rig,F}.
- `CycRing.Bdag_eq_Brig_inf_B` (*characterisation*) — B^dagger_F = B^dagger_{rig,F} cap B_F inside Z -> F.
- `CycRing.pi_isUnit_BrigR` (*simp*) — pi is a unit of B^{dagger,r}_{rig,F} for every r > 0.

*Used by.*

- Berger 2002, Sections 1.3 and 2 — B^{dagger,r}_F and H_F^alpha: the carriers of overconvergent (phi,Gamma)-modules
- `PhiGammaModulesAndIwasawaCohomology:PG.0` — imports the analytic carriers; constructs A_K, B_K by the field of norms
- `PadicHodgeTheory:P7/robba-ring-of-p-adic-field` — the unramified case K = F of B^dagger_{rig,K}
- `PhiGammaModulesAndIwasawaCohomology:PG.6` — Wach modules live over A^+_F and B^+_F; D_cris = (B^+_{rig,F} tensor N(V))^Gamma
- `PadicDifferentialEquationsAndRigidCohomology:RD.2/berger-form-of-local-monodromy` — B^dagger_{rig,F} as Robba ring with Frobenius and derivation

*Unit tests.* A wrong definition fails one of these.

- `cyc.test_pi_unit` (computation) — pi is a unit of B^{dagger,r}_{rig,F} (r > 0) and of A_F, but not of A^+_F nor of B^+_{rig,F}.
- `cyc.test_Adag_ne_union` (non-example) — pi^{-1} lies in A^dagger_F = A_F cap B^dagger_F but in no A^{dagger,r}_F: A^dagger_F is not the union of the A^{dagger,r}_F.
- `cyc.test_rn` (computation) — For p = 3 the Newton slopes of Phi_{3^n}(1 + pi) are 1/r_n = 1/2, 1/6, 1/18 for n = 1, 2, 3 (PARI/GP newtonpoly), i.e. |zeta_{p^n} - 1| = p^{-1/r_n}.
- `cyc.test_Qp` (degenerate) — For k = F_p, F = Q_p and sigma = id; B^dagger_{rig,Q_p} = R_{Q_p}.

*Construction.*

1. Specialise annulus-laurent-ring, robba-ring, bounded-robba-ring and amice-ring to K = F and T = pi.
2. A^{dagger,r}_F is a ring because |.|_rho is multiplicative and the bound is uniform in rho; it is contained in R^int since |a_n| = lim_{rho->1} |a_n| rho^n <= 1.
3. A^dagger_F = A_F cap B^dagger_F contains pi^{-1} (whereas pi^{-1} is in no A^{dagger,r}_F since |pi^{-1}|_rho = rho^{-1} > 1), matching Berger's definition A^dagger = A cap B~^dagger rather than the union of the A^{dagger,r}.
4. B^dagger_F = B^dagger_{rig,F} cap B_F: bounded-robba-ring (R^bd = R cap E).

*Acceptance.*

- t = log(1 + pi) lies in B^+_{rig,Q_p} and not in B^dagger_{Q_p}; pi is a unit of B^{dagger,r}_{rig,F} and of A_F but not of A^+_F or B^+_{rig,F}.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/annulus-laurent-ring`, `PadicHodgeTheory:P7:annulus-foundations/robba-ring`, `PadicHodgeTheory:P7:annulus-foundations/bounded-robba-ring`, `PadicHodgeTheory:P7:annulus-foundations/amice-ring`, `PadicHodgeTheory:P7:annulus-foundations/amice-ring-complete-dvf`, `mathlib:WittVector`, `mathlib:PerfectRing`.

*Planet:* Overconvergent cyclotomic rings.

*Sources.*

- An introduction to the theory of p-adic representations, VI.2, p. 39: “let C[r; 1[ be the annulus{z ∈ C, p−1/r ≤ |z|p < 1}” Berger's radius convention.
- An introduction to the theory of p-adic representations, VI.2, p. 39: “Laurent series f (T ), convergent on C[r; 1[, and bounded by 1” A^{dagger,r}_F.
- An introduction to the theory of p-adic representations, VI.2, p. 39: “f (T ) ∈ F [[T ]], f (T ) converges on the open unit disk D[0; 1[” B^+_{rig,F}.
- Représentations p-adiques et équations différentielles, Section 2, p. 13: “l’application f 7→ f (πK ) de BF dans B†K est un isomorphisme.” B^dagger is the ring of bounded Laurent series converging near the boundary (for K = F with pi_F = pi).

#### Construction. The cyclotomic Frobenius phi(pi) = (1+pi)^p - 1

*Module* `TauCeti/NumberTheory/PadicHodge/Cyclotomic/Rings.lean`. *Node* `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-frobenius`.

Let u = (1 + pi)^p - 1 = pi^p + sum_{i=1}^{p-1} binom(p,i) pi^i. For rho in (p^{-1/(p-1)}, 1), |u|_rho = rho^p and u is a unit of O_F((p^{-1/(p-1)}, 1)). For r > (p-1)/p (in particular r >= r_1 = p - 1) and f = sum a_n pi^n in B^{dagger,r}_{rig,F}, the series phi(f) = sum sigma(a_n) u^n converges in B^{dagger,pr}_{rig,F}; this defines a sigma-semilinear injective ring homomorphism phi : B^{dagger,r}_{rig,F} -> B^{dagger,pr}_{rig,F}, continuous for the Frechet topologies, with |phi(f)|_rho = |f|_{rho^p} for rho in (p^{-1/(p-1)}, 1) and phi(pi) = u. It induces endomorphisms of B^dagger_{rig,F}, B^dagger_F, A^dagger_F, A_F, B_F (continuous for the weak and p-adic topologies), A^+_F, B^+_F and B^+_{rig,F}. phi is a Frobenius lift: phi(pi) - pi^p lies in p A^+_F, so phi reduces to x |-> x^p on A_F/p = k((pi)); A_F is a free phi(A_F)-module with basis 1, (1+pi), ..., (1+pi)^{p-1}, and likewise B_F over phi(B_F).

*Hypotheses.* p is a prime, k a perfect field of characteristic p, F = W(k)[1/p] with |p| = p^{-1} and sigma its Witt vector Frobenius (an isometric automorphism of F); pi is a variable. zeta_{p^n} (n >= 1) is a compatible system of primitive p^n-th roots of unity in a fixed algebraic closure of F (the epsilon of the shared conventions), F_n = F(zeta_{p^n}), F_infinity = union of the F_n, and chi : Gal(F_infinity/F) -> Z_p^x the cyclotomic character, an isomorphism since F/Q_p is unramified. Berger's radius convention: for r > 0, C[r;1[ = {z : p^{-1/r} <= |z| < 1}; r_n = p^{n-1}(p-1), so that |zeta_{p^n} - 1| = p^{-1/r_n}.

*API.*

- `CycRing.phi` (*constructor*) — phi : B^dagger_{rig,F} ->+* B^dagger_{rig,F}, sigma-semilinear, phi(pi) = (1+pi)^p - 1.
- `CycRing.phi_pi` (*simp*) — phi pi = (1 + pi)^p - 1.
- `CycRing.phi_C` (*simp*) — phi (C a) = C (sigma a).
- `CycRing.phi_mapsTo_BrigR` (*relation*) — For r > (p-1)/p, phi maps B^{dagger,r}_{rig,F} into B^{dagger,pr}_{rig,F}.
- `CycRing.gaussNorm_phi` (*relation*) — |phi f|_rho = |f|_{rho^p} for rho in (p^{-1/(p-1)}, 1).
- `CycRing.phi_mapsTo` (*relation*) — phi preserves A^+_F, B^+_F, A^dagger_F, B^dagger_F, A_F, B_F and B^+_{rig,F}.
- `CycRing.phi_injective` (*characterisation*) — phi is injective.
- `CycRing.continuous_phi` (*other*) — phi is continuous (Frechet/LF on B^dagger_{rig,F}; weak and p-adic on A_F).
- `CycRing.phi_sub_pow_mem` (*characterisation*) — phi(pi) - pi^p lies in p A^+_F: phi is a Frobenius lift of x |-> x^p on k((pi)).
- `CycRing.phi_basis` (*structure*) — A_F is free over phi(A_F) with basis (1+pi)^i, 0 <= i < p.

*Used by.*

- `PadicDifferentialEquationsAndRigidCohomology:RD.0/frobenius-lift-on-robba-ring` — phi is a q = p Frobenius lift with u = phi(pi) in R^int, the standard cyclotomic example
- `PadicDifferentialEquationsAndRigidCohomology:RD.2/berger-form-of-local-monodromy` — Berger's Frobenius on B^dagger_{rig,F}
- `PhiGammaModulesAndIwasawaCohomology:PG.0` — the Frobenius on A_{Q_p}, B_{Q_p} whose Witt-vector realisation PG.0 computes
- `PhiGammaModulesAndIwasawaCohomology:PG.4` — psi is the normalised left inverse of phi through the basis (1+pi)^i
- Berger 2002, Theorem 3.6 — phi on D^dagger_rig(V) and B^dagger_{log,K}

*Unit tests.* A wrong definition fails one of these.

- `phi.test_p2` (computation) — For p = 2: phi(pi) = pi^2 + 2 pi.
- `phi.test_q` (computation) — q = phi(pi)/pi lies in A^+_F and q is congruent to p modulo pi.
- `phi.test_frobeniusLift` (compatibility) — Modulo p, phi induces Mathlib frobenius (x |-> x^p) on LaurentSeries k after the reduction A_F -> k((pi)).
- `phi.test_not_surjective` (non-example) — pi is not in phi(A_F): its coordinate on the basis vector (1+pi) is 1.
- `phi.test_one` (degenerate) — phi(1) = 1 and phi(C p) = C p.

*Construction.*

1. |u|_rho: the coefficients binom(p,i), 1 <= i <= p-1, have absolute value p^{-1}; p^{-1} rho^i < rho^p iff rho > p^{-1/(p-1)} (checked with PARI/GP for p = 2, 3, 5, 7). So u = pi^p (1 + h) with |h|_rho < 1 there, and u is a unit (newton-polygon-breaks (c)).
2. Convergence: |sigma(a_n) u^n|_rho = |a_n| rho^{pn} (gauss-norm-multiplicative, sigma isometric), which tends to 0 for rho^p in [p^{-1/r}, 1), i.e. rho in [p^{-1/(pr)}, 1); the hypothesis r > (p-1)/p makes p^{-1/(pr)} > p^{-1/(p-1)}. The partial sums converge in the Frechet topology (frechet-topology) and the norm identity follows termwise with a single dominant index argument.
3. Ring homomorphism: substitution is a ring map on Laurent polynomials; extend by continuity and density (frechet-topology, restriction-maps).
4. On A^+_F: u has zero constant term, so substitution converges pi-adically. On A_F: u = pi^p(1 + p w) with w in O_F[pi^{-1}], a unit of A_F; extend by p-adic continuity (amice-ring). The two definitions agree on A^dagger_F = A_F cap B^dagger_F.
5. Basis over phi(A_F): reduce modulo p, where it is the statement that 1, (1+pi), ..., (1+pi)^{p-1} is a basis of k((pi)) over k((pi^p)) = k((pi))^p (Fontaine–Ouyang Lemma 4.26 (1)), and lift by p-adic completeness (Nakayama).

*Acceptance.*

- For p = 2: phi(pi) = pi^2 + 2 pi; q := phi(pi)/pi = pi + 2 is congruent to p = 2 modulo pi.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PadicHodgeTheory:P7:annulus-foundations/gauss-norm-multiplicative`, `PadicHodgeTheory:P7:annulus-foundations/newton-polygon-breaks`, `PadicHodgeTheory:P7:annulus-foundations/frechet-topology`, `PadicHodgeTheory:P7:annulus-foundations/amice-ring`, `mathlib:WittVector.frobenius`.

*Planet:* Cyclotomic Frobenius.

*Sources.*

- An introduction to the theory of p-adic representations, III.1.1, p. 21: “The exact formulas depend on K, but if K = F then ϕ(πK ) = (1 + πK )p − 1 and” The formula phi(pi) = (1+pi)^p - 1.
- Équations différentielles p-adiques et (φ,N)-modules filtrés, Section I.2, p. 5: “linéaire sur les coefficients et tel que ϕ(X) = (1 + X)p − 1.” phi : B^{dagger,r}_F -> B^{dagger,pr}_F, sigma-semilinear with phi(X) = (1+X)^p - 1.
- Relative p-adic Hodge theory: Foundations, Example 4.3.2, p. 111: “For the Frobenius lift ϕ(T ) = (T +1)p −1 and ω = p−p/(p−1) , sϕ is isometric for the ω r -Gauss norm for r ∈ (0, 1).” Norm identity for this Frobenius lift on the relevant range of radii.
- Theory of p-adic Galois representations, Lemma 4.26, p. 83: “(1) {1, ε, · · · , εp−1 } is a basis of E0 over ϕ(E0 );” The phi-basis 1, epsilon, ..., epsilon^{p-1} (epsilon = 1 + pi) modulo p.

#### Construction. The cyclotomic Gamma-action gamma_a(pi) = (1+pi)^a - 1

*Module* `TauCeti/NumberTheory/PadicHodge/Cyclotomic/Rings.lean`. *Node* `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-gamma-action`.

For a in Z_p^x let (1+pi)^a = sum_{n>=0} binom(a,n) pi^n in Z_p[[pi]], with binom(a,n) = a(a-1)...(a-n+1)/n! in Z_p. Then gamma_a(pi) = (1+pi)^a - 1 = a pi (1 + h_a) with h_a in pi Z_p[[pi]], and for every interval I in (0,1) the substitution gamma_a(f) = sum a_n gamma_a(pi)^n defines an F-linear ring automorphism of O_F(I) with |gamma_a(f)|_rho = |f|_rho for all rho in I. This gives an action of the group Z_p^x on B^{dagger,r}_{rig,F}, B^dagger_{rig,F}, B^dagger_F, A^dagger_F, A_F, B_F, A^+_F, B^+_F and B^+_{rig,F} by isometric continuous ring automorphisms, with gamma_a gamma_b = gamma_{ab}, gamma_1 = id, gamma_a phi = phi gamma_a, and the action map Z_p^x x B^{dagger,r}_{rig,F} -> B^{dagger,r}_{rig,F} continuous. For K/F finite, Gamma_K = Gal(K_infinity/K) acts through the cyclotomic character chi : Gamma_K -> Z_p^x.

*Hypotheses.* p is a prime, k a perfect field of characteristic p, F = W(k)[1/p] with |p| = p^{-1} and sigma its Witt vector Frobenius (an isometric automorphism of F); pi is a variable. zeta_{p^n} (n >= 1) is a compatible system of primitive p^n-th roots of unity in a fixed algebraic closure of F (the epsilon of the shared conventions), F_n = F(zeta_{p^n}), F_infinity = union of the F_n, and chi : Gal(F_infinity/F) -> Z_p^x the cyclotomic character, an isomorphism since F/Q_p is unramified. a ranges over Z_p^x; for a not a unit, (1+pi)^a - 1 does not define an automorphism.

*API.*

- `CycRing.padicBinom` (*data*) — binom(a, n) = a(a-1)...(a-n+1)/n! for a in Z_p, computed in Q_p.
- `CycRing.padicBinom_mem_padicInt` (*characterisation*) — binom(a, n) lies in Z_p for a in Z_p.
- `CycRing.gammaAct` (*constructor*) — For a in Z_p^x, the F-linear ring automorphism gamma_a of B^dagger_{rig,F}.
- `CycRing.gammaAct_pi` (*simp*) — gamma_a pi = sum_{n>=1} binom(a,n) pi^n.
- `CycRing.gammaAct_C` (*simp*) — gamma_a (C c) = C c.
- `CycRing.gammaAct_one` (*simp*) — gamma_1 = id.
- `CycRing.gammaAct_mul` (*functoriality*) — gamma_a o gamma_b = gamma_{ab}.
- `CycRing.gaussNorm_gammaAct` (*simp*) — |gamma_a f|_rho = |f|_rho for rho in (0,1).
- `CycRing.gammaAct_mapsTo` (*relation*) — gamma_a preserves every B^{dagger,r}_{rig,F}, B^dagger_F, A^dagger_F, A_F, B_F, A^+_F, B^+_{rig,F}.
- `CycRing.gammaAct_phi` (*relation*) — gamma_a o phi = phi o gamma_a.
- `CycRing.continuous_gammaAct` (*other*) — The action map Z_p^x x B^{dagger,r}_{rig,F} -> B^{dagger,r}_{rig,F} is continuous.
- `CycRing.galoisAct` (*compatibility*) — For g in Gal(Fbar/F), g acts by gamma_{chi(g)} with chi Mathlib cyclotomicCharacter.

*Used by.*

- `PhiGammaModulesAndIwasawaCohomology:PG.0` — the Gamma-action on A_{Q_p}, B_{Q_p} whose Galois realisation PG.0 computes
- `PhiGammaModulesAndIwasawaCohomology:PG.3` — the Herr complex uses gamma - 1
- `PadicHodgeTheory:P7/nabla-operator-on-robba-ring` — nabla = log(gamma)/log chi(gamma)
- Berger 2004, Proposition II.1.1 — Gamma acts trivially on N(T)/pi N(T)

*Unit tests.* A wrong definition fails one of these.

- `gamma.test_minus_one` (computation) — gamma_{-1}(pi) = -pi/(1+pi).
- `gamma.test_linear_term` (computation) — gamma_a(pi) is congruent to a pi modulo pi^2.
- `gamma.test_one` (degenerate) — gamma_1 = id.
- `gamma.test_cyclotomicCharacter` (compatibility) — For g in the Galois group, the action of g is gamma_{cyclotomicCharacter g}.
- `gamma.test_non_unit_exponent` (non-example) — For a = p (not a unit) the substitution pi |-> (1+pi)^p - 1 is not surjective on A_F: gamma_a is only defined for a in Z_p^x.

*Construction.*

1. binom(a,n) in Z_p: it is a p-adic limit of binom(a_k, n) in Z for integers a_k -> a (continuity of the polynomial a |-> a(a-1)...(a-n+1)/n!).
2. gamma_a(pi)/pi has constant term a in Z_p^x and coefficients in Z_p, so |gamma_a(pi)/pi - a|_rho <= rho < 1 = |a| for rho < 1; hence gamma_a(pi) = a pi (1 + h_a), |gamma_a(pi)^n|_rho = rho^n and gamma_a(pi) is a unit of O_F(I) (newton-polygon-breaks (c)).
3. Convergence and |gamma_a f|_rho <= |f|_rho termwise; equality by applying gamma_{a^{-1}} (group law).
4. Group law and commutation with phi: identities of power series (1+pi)^{ab} = ((1+pi)^b)^a and ((1+pi)^a)^p = ((1+pi)^p)^a, extended by continuity.
5. Continuity in a: a |-> binom(a,n) is continuous and uniformly bounded, so a |-> gamma_a(f) is continuous for each Gauss norm.

*Acceptance.*

- gamma_{-1}(pi) = (1+pi)^{-1} - 1 = -pi/(1+pi); gamma_{1+p}(pi) = (1+pi)^{1+p} - 1 has linear coefficient 1 + p (checked with PARI/GP for p = 3).

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PadicHodgeTheory:P7:annulus-foundations/newton-polygon-breaks`, `PadicHodgeTheory:P7:annulus-foundations/gauss-norm-multiplicative`, `PadicHodgeTheory:P7:annulus-foundations/frechet-topology`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-frobenius`, `mathlib:PadicInt`, `mathlib:cyclotomicCharacter`.

*Planet:* Cyclotomic Gamma-action.

*Sources.*

- An introduction to the theory of p-adic representations, III.1.1, p. 21: “if γ ∈ ΓK , then γ(πK ) = (1 + πK )χ(γ) − 1.” The formula gamma(pi) = (1+pi)^{chi(gamma)} - 1.
- Équations différentielles p-adiques et (φ,N)-modules filtrés, Section I.2, p. 5: “Cet anneau est muni d’une action de ΓF , qui est triviale sur les coefficients et donnée par” Gamma_F acts trivially on coefficients and by gamma(X) = (1+X)^{chi(gamma)} - 1.
- Theory of p-adic Galois representations, Section 4.3.2, eq. (4.10), p. 80: “therefore g(πε ) = (1 + πε )χ(g) − 1.” The Galois action on pi_epsilon.

#### Construction. The element t = log(1 + pi)

*Module* `TauCeti/NumberTheory/PadicHodge/Cyclotomic/Rings.lean`. *Node* `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-log-element-t`.

t = log(1 + pi) = sum_{n>=1} (-1)^{n-1} pi^n / n lies in B^+_{rig,Q_p}, contained in B^+_{rig,F} and in every B^{dagger,r}_{rig,F}, but not in B^dagger_F: the coefficient of pi^{p^k} has absolute value p^k. It satisfies phi(t) = p t, gamma_a(t) = a t, partial t = 1 for partial = (1+pi) d/dpi, and t = lim_N ((1+pi)^{p^N} - 1)/p^N = pi prod_{n>=1} phi^{n-1}(q)/p in the Frechet topology of B^+_{rig,F}, where q = phi(pi)/pi and phi^{n-1}(q) = Phi_{p^n}(1 + pi) (cyclotomic polynomial). Its zeros in the open unit disc of an algebraically closed complete extension are exactly the zeta - 1 with zeta in mu_{p^infinity}, all simple; for n >= 1 the zeros on the circle |z| = p^{-1/r_n} are the zeta_{p^n}^j - 1 with p not dividing j.

*Hypotheses.* p is a prime, k a perfect field of characteristic p, F = W(k)[1/p] with |p| = p^{-1} and sigma its Witt vector Frobenius (an isometric automorphism of F); pi is a variable. zeta_{p^n} (n >= 1) is a compatible system of primitive p^n-th roots of unity in a fixed algebraic closure of F (the epsilon of the shared conventions), F_n = F(zeta_{p^n}), F_infinity = union of the F_n, and chi : Gal(F_infinity/F) -> Z_p^x the cyclotomic character, an isomorphism since F/Q_p is unramified. Berger's radius convention: for r > 0, C[r;1[ = {z : p^{-1/r} <= |z| < 1}; r_n = p^{n-1}(p-1), so that |zeta_{p^n} - 1| = p^{-1/r_n}.

*API.*

- `CycRing.tElt` (*constructor*) — t = log(1 + pi), coefficient family n |-> (-1)^{n-1}/n for n >= 1.
- `CycRing.coeff_tElt` (*simp*) — coeff t n = (-1)^{n-1}/n for n >= 1 and 0 otherwise.
- `CycRing.tElt_mem_BrigPlus` (*relation*) — t lies in B^+_{rig,F}.
- `CycRing.tElt_not_mem_Bdag` (*characterisation*) — t is not in B^dagger_F.
- `CycRing.phi_tElt` (*simp*) — phi t = p t.
- `CycRing.gammaAct_tElt` (*simp*) — gamma_a t = a t.
- `CycRing.tendsto_tElt` (*characterisation*) — ((1+pi)^{p^N} - 1)/p^N -> t in B^+_{rig,F}.
- `CycRing.tElt_zeros` (*characterisation*) — The zeros of t in the open unit disc are the zeta - 1, zeta in mu_{p^infinity}, all simple.

*Used by.*

- Berger 2002, Theorem 3.6 — D_cris(V) = (D^dagger_rig(V)[1/t])^{Gamma_K}
- Berger 2002, Lemma 4.6 — divisibility by t is tested at the zeros zeta_{p^n} - 1
- `PadicHodgeTheory:P7/localisation-maps-p-adic-field` — iota_n(t) = t/p^n compared with Fontaine's t in B_dR^+
- Berger 2004, Proposition V.1.2 — determinant of the comparison isomorphism is a power of t times a unit

*Unit tests.* A wrong definition fails one of these.

- `t.test_coeff_valuation` (computation) — The coefficient of pi^{p^k} in t has p-adic valuation -k (PARI/GP for p = 3, k = 0..5).
- `t.test_unbounded` (non-example) — t lies in B^dagger_{rig,F} but not in B^dagger_F.
- `t.test_phi` (computation) — phi(t) = p t and gamma_a(t) = a t.
- `t.test_product` (compatibility) — pi prod_{n=1}^N Phi_{p^n}(1+pi)/p = ((1+pi)^{p^N} - 1)/p^N with Mathlib Polynomial.cyclotomic (telescoping identity, PARI/GP).
- `t.test_zero_at_zero` (degenerate) — t has constant term 0 and linear coefficient 1: t = pi + O(pi^2).

*Construction.*

1. Convergence on |pi| < 1: |pi^n / n|_rho = rho^n p^{v_p(n)} <= n rho^n -> 0.
2. phi(t) = log((1+pi)^p) = p log(1+pi) and gamma_a(t) = log((1+pi)^a) = a t: identities of power series (functional equation of log on 1 + pi Z_p[[pi]]).
3. Product formula: prod_{n=1}^N Phi_{p^n}(X) = (X^{p^N} - 1)/(X - 1), so pi prod_{n=1}^N phi^{n-1}(q)/p = ((1+pi)^{p^N} - 1)/p^N (checked in PARI/GP), and binom(p^N, k)/p^N -> (-1)^{k-1}/k in Q_p coefficientwise, uniformly in the Gauss norms on compact subintervals (PARI/GP: agreement modulo p^{N-2} for k <= 8, p = 3).
4. Zeros: evaluation commutes with the logarithm series, so t(z) = log(1 + z) for |z| < 1 (evaluation-at-points); the p-adic logarithm on 1 + m_L vanishes exactly on mu_{p^infinity} (if log(1+z) = 0 then (1+z)^{p^N} lies in 1 + p^2 m_L for N large, where log is injective, so (1+z)^{p^N} = 1). The zeros are simple because partial t = 1, i.e. the derivative of t is (1+z)^{-1} != 0 (annulus-derivation). The zeros on |z| = p^{-1/r_n} are those of Phi_{p^n}(1+pi), whose Newton slopes are 1/r_n (PARI/GP newtonpoly for p = 3, n = 1, 2, 3); weierstrass-preparation-on-circles counts them.

*Acceptance.*

- Acceptance (stage): an explicit series in R but not in R^bd: t (PARI/GP: v_3 of the coefficient of pi^{3^k} is -k for k = 0..5).

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-frobenius`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-gamma-action`, `PadicHodgeTheory:P7:annulus-foundations/weierstrass-preparation-on-circles`, `PadicHodgeTheory:P7:annulus-foundations/frechet-topology`, `PadicHodgeTheory:P7:annulus-foundations/evaluation-at-points`, `PadicHodgeTheory:P7:annulus-foundations/annulus-derivation`, `mathlib:Polynomial.cyclotomic`.

*Sources.*

- An introduction to the theory of p-adic representations, IV.2, p. 26-27: “A typical element of Brig,K is t = log(1 + π).” t is the typical element of B^dagger_{rig}.
- An introduction to the theory of p-adic representations, V.1.1, p. 34: “so that t = log(1 + π) = π log− (1 + π) log+ (1 + π).” Product decomposition of t over the factors Phi_{p^n}(1+pi)/p.
- Équations différentielles p-adiques et (φ,N)-modules filtrés, Section I.2, p. 6: “Par exemple, si on pose t = log(1 + X), alors” t in B^{dagger,r}_{rig,F} for every r.

#### Construction. The derivation partial = (1+pi) d/dpi and the Lie action nabla = t partial

*Module* `TauCeti/NumberTheory/PadicHodge/Cyclotomic/Rings.lean`. *Node* `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-derivation`.

partial = (1 + pi) d/dpi is a continuous F-linear derivation of B^{dagger,r}_{rig,F} (each r), B^dagger_{rig,F}, B^dagger_F, A_F, B_F, A^+_F and B^+_{rig,F}, with partial(pi) = 1 + pi, partial(t) = 1, partial o phi = p phi o partial and partial o gamma_a = a gamma_a o partial. Its kernel on B^dagger_{rig,F} is F, and B^dagger_{rig,F} = partial(B^dagger_{rig,F}) + F (1+pi)/pi, a direct sum ((1+pi)/pi is not a derivative). The derivation nabla = t partial is the infinitesimal generator of the Gamma-action: for f in B^{dagger,r}_{rig,F}, nabla(f) = lim (gamma_a(f) - f)/log_p(a) as a -> 1 in Z_p^x with a != 1, in the Frechet topology. Consequently (B^dagger_{rig,F})^{Z_p^x} = F.

*Hypotheses.* p is a prime, k a perfect field of characteristic p, F = W(k)[1/p] with |p| = p^{-1} and sigma its Witt vector Frobenius (an isometric automorphism of F); pi is a variable. zeta_{p^n} (n >= 1) is a compatible system of primitive p^n-th roots of unity in a fixed algebraic closure of F (the epsilon of the shared conventions), F_n = F(zeta_{p^n}), F_infinity = union of the F_n, and chi : Gal(F_infinity/F) -> Z_p^x the cyclotomic character, an isomorphism since F/Q_p is unramified. Berger's radius convention: for r > 0, C[r;1[ = {z : p^{-1/r} <= |z| < 1}; r_n = p^{n-1}(p-1), so that |zeta_{p^n} - 1| = p^{-1/r_n}. log_p : 1 + p Z_p -> p Z_p is the p-adic logarithm; the limit is taken along a in 1 + p^2 Z_p.

*API.*

- `CycRing.partialOp` (*constructor*) — partial = (1 + pi) d/dpi : Derivation F B^dagger_{rig,F} B^dagger_{rig,F}.
- `CycRing.partial_pi` (*simp*) — partial pi = 1 + pi.
- `CycRing.partial_tElt` (*simp*) — partial t = 1.
- `CycRing.partial_phi` (*relation*) — partial (phi f) = p phi (partial f).
- `CycRing.partial_gammaAct` (*relation*) — partial (gamma_a f) = a gamma_a (partial f).
- `CycRing.ker_partial` (*characterisation*) — partial f = 0 iff f in F.
- `CycRing.partial_range_sup` (*characterisation*) — B^dagger_{rig,F} = range partial + F (1+pi)/pi, and (1+pi)/pi is not in range partial.
- `CycRing.nabla` (*constructor*) — nabla = t partial.
- `CycRing.tendsto_nabla` (*characterisation*) — (gamma_a f - f)/log_p a -> nabla f as a -> 1.
- `CycRing.invariants_gammaAct` (*characterisation*) — The elements fixed by every gamma_a are the constants F.

*Used by.*

- `PadicDifferentialEquationsAndRigidCohomology:RD.2/berger-form-of-local-monodromy` — the derivation partial of Berger, with partial_M o phi = p phi o partial_M
- `PadicHodgeTheory:P7/nabla-operator-on-robba-ring` — nabla = log(gamma)/log chi(gamma) = t partial on B^dagger_{rig,K}
- `PadicHodgeTheory:P7/connection-on-robba-realisation` — the connection nabla_V is over nabla
- Berger 2002, Proposition 4.4 — primitives exist in B^dagger_{log,K}

*Unit tests.* A wrong definition fails one of these.

- `partial.test_pi` (computation) — partial(pi) = 1 + pi and partial(pi^{-1}) = -(1+pi)/pi^2.
- `partial.test_t` (computation) — partial(t) = 1.
- `partial.test_const` (degenerate) — partial(C c) = 0.
- `partial.test_derivative` (compatibility) — partial = (1 + pi) * (AnnulusRing.derivative) on each B^{dagger,r}_{rig,F}.
- `partial.test_log_class` (non-example) — (1+pi)/pi is not partial of any element of B^dagger_{rig,F}.

*Construction.*

1. partial = (1+pi) d/dpi with d/dpi from annulus-derivation; 1 + pi is a unit of each ring so partial preserves them; continuity from gaussNorm_derivative_le.
2. partial o phi = p phi o partial: d/dpi [f^sigma((1+pi)^p - 1)] = f^sigma'(u) p (1+pi)^{p-1}, multiplied by 1 + pi; similarly partial o gamma_a = a gamma_a o partial. partial t = (1+pi) (1+pi)^{-1} = 1.
3. Kernel and cokernel: annulus-derivation (kernel K, image = vanishing pi^{-1}-coefficient) applied to f/(1+pi); the class of (1+pi)/pi = partial(log pi) is the obstruction (Berger 2002 Proposition 4.4 for K = F).
4. Lie action: d/ds gamma_{exp(s)}(f) at s = 0 equals f'(pi) (1+pi) log(1+pi) = t partial f; convergence of the difference quotients in each Gauss norm from the power series expansion of s |-> (1+pi)^{exp(s)} (Berger 2002 Lemme 4.1-4.2).
5. Invariants: if gamma_a f = f for all a then nabla f = t partial f = 0, so partial f = 0 (B^dagger_{rig,F} is a domain) and f in F.

*Acceptance.*

- partial(pi^{-1}) = -(1+pi)/pi^2; nabla(pi) = t (1+pi).

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/annulus-derivation`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-frobenius`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-gamma-action`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-log-element-t`, `PadicHodgeTheory:P7:annulus-foundations/gauss-norm-multiplicative`, `mathlib:Derivation`.

*Sources.*

- Représentations p-adiques et équations différentielles, Lemme 4.2, p. 39: “Lemme 4.2. La restriction de ∇ à B†,r rig,K vérifie ∇ = t · ∂ où ∂(x) = (1 + π)dx/dπ.” nabla = t partial with partial = (1+pi) d/dpi.
- An introduction to the theory of p-adic representations, III.1.2, p. 22: “defined by δ(f (π)) = (1 + π)df /dπ on the field BF .” The operator (1+pi) d/dpi on B_F and its relation with phi.
- An introduction to the theory of p-adic representations, III.1.2, p. 22: “satisfy δ ◦ ϕ = pϕ ◦ δ.” partial o phi = p phi o partial.
- Représentations p-adiques et équations différentielles, Proposition 4.4, p. 40: “La connexion ∂ réalise une surjection” Surjectivity of partial onto B^dagger_{rig,K} from B^dagger_{rig,K} + F log(pi_K).

#### Construction. The localisation maps iota_n at zeta_{p^n} - 1

*Module* `TauCeti/NumberTheory/PadicHodge/Cyclotomic/Rings.lean`. *Node* `PadicHodgeTheory:P7:annulus-foundations/localisation-at-roots-of-unity`.

For n >= 1 and 0 < r <= r_n (so that z_n = zeta_{p^n} - 1 lies on the annulus C[r;1[), put theta_n(f) = (sigma^{-n} f)(z_n) in F_n, where sigma^{-n} acts on coefficients, and iota_n(f) = sum_{j>=0} p^{-nj} theta_n(partial^j f)/j! t^j in the formal power series ring F_n[[t]]. Then iota_n : B^{dagger,r}_{rig,F} -> F_n[[t]] is an injective ring homomorphism, sigma^{-n}-semilinear on F, with iota_n(pi) = zeta_{p^n} exp(t/p^n) - 1 and iota_n(t) = t/p^n; iota_{n+1} o phi = iota_n on B^{dagger,r}_{rig,F} for r <= r_n; iota_n o gamma_a = gamma_a o iota_n, where gamma_a acts on F_n[[t]] by zeta_{p^n} |-> zeta_{p^n}^a on F_n and t |-> a t. The constant term theta_n : B^{dagger,r}_{rig,F} -> F_n is surjective with kernel phi^{n-1}(q) B^{dagger,r}_{rig,F}, where phi^{n-1}(q) = Phi_{p^n}(1+pi); so B^{dagger,r}_{rig,F}/phi^{n-1}(q) = F_n.

*Hypotheses.* p is a prime, k a perfect field of characteristic p, F = W(k)[1/p] with |p| = p^{-1} and sigma its Witt vector Frobenius (an isometric automorphism of F); pi is a variable. zeta_{p^n} (n >= 1) is a compatible system of primitive p^n-th roots of unity in a fixed algebraic closure of F (the epsilon of the shared conventions), F_n = F(zeta_{p^n}), F_infinity = union of the F_n, and chi : Gal(F_infinity/F) -> Z_p^x the cyclotomic character, an isomorphism since F/Q_p is unramified. Berger's radius convention: for r > 0, C[r;1[ = {z : p^{-1/r} <= |z| < 1}; r_n = p^{n-1}(p-1), so that |zeta_{p^n} - 1| = p^{-1/r_n}. iota_n is only defined when z_n lies in the annulus, i.e. r <= r_n; the embedding of F_n[[t]] into B_dR^+ (t |-> Fontaine's t) is not used here and is made in PadicHodgeTheory:P7/localisation-maps-p-adic-field.

*API.*

- `CycRing.thetaN` (*constructor*) — theta_n f = (sigma^{-n} f)(zeta_{p^n} - 1) in F_n.
- `CycRing.iotaN` (*constructor*) — iota_n : B^{dagger,r}_{rig,F} -> PowerSeries F_n, sum_j p^{-nj} theta_n(partial^j f)/j! t^j.
- `CycRing.iotaN_ringHom` (*structure*) — iota_n is a ring homomorphism, sigma^{-n}-semilinear on F.
- `CycRing.iotaN_pi` (*simp*) — iota_n pi = zeta_{p^n} exp(t/p^n) - 1.
- `CycRing.iotaN_tElt` (*simp*) — iota_n t = t/p^n.
- `CycRing.iotaN_phi` (*relation*) — iota_{n+1} (phi f) = iota_n f.
- `CycRing.iotaN_gammaAct` (*relation*) — iota_n (gamma_a f) = gamma_a (iota_n f).
- `CycRing.iotaN_injective` (*characterisation*) — iota_n is injective on B^{dagger,r}_{rig,F} for r <= r_n.
- `CycRing.ker_thetaN` (*characterisation*) — ker theta_n = phi^{n-1}(q) B^{dagger,r}_{rig,F} and theta_n is surjective onto F_n.

*Used by.*

- Berger 2002, Sections 2.2 and 4 — iota_n = phi^{-n} : B^{dagger,r_n}_{rig} -> B_dR^+ localises at zeta_{p^n} - 1
- `PadicHodgeTheory:P7/localisation-maps-p-adic-field` — extension to B^{dagger,r}_{rig,K} and to B_dR^+
- `PadicHodgeTheory:P7/t-divisibility-criterion` — divisibility by t via the kernels of theta_n
- Berger 2004, Section III.2 — the Wach module evaluated at epsilon^{(n)} - 1 computes the Sen module

*Unit tests.* A wrong definition fails one of these.

- `iota.test_t` (computation) — iota_n(t) = t/p^n.
- `iota.test_q` (computation) — theta_n(Phi_{p^n}(1+pi)) = 0 and theta_n(Phi_{p^m}(1+pi)) != 0 for m != n.
- `iota.test_phi` (compatibility) — iota_{n+1}(phi(pi)) = iota_n(pi): (zeta_{p^{n+1}} exp(t/p^{n+1}))^p - 1 = zeta_{p^n} exp(t/p^n) - 1 in F_{n+1}[[t]].
- `iota.test_const` (degenerate) — iota_n(C c) = C(sigma^{-n} c).
- `iota.test_outside` (non-example) — For r > r_n the element 1/Phi_{p^n}(1+pi) lies in B^{dagger,r}_{rig,F} but has a pole at zeta_{p^n} - 1: iota_n is not defined on B^{dagger,r}_{rig,F} for r > r_n.

*Construction.*

1. Taylor expansion: f |-> sum_j (sigma^{-n} f)^{(j)}(z_n) w^j / j! is a ring map to F_n[[w]] (Leibniz rule, evaluation-at-points, annulus-derivation); substituting w = zeta_{p^n}(exp(t/p^n) - 1) gives iota_n, because d/dt of zeta exp(t/p^n) - 1 is (1 + pi)/p^n along the substitution, so (d/dt)^j corresponds to p^{-nj} partial^j.
2. iota_n(pi) and iota_n(t): partial^j pi = 1 + pi for j >= 1; theta_n(t) = log(zeta_{p^n}) = 0 and partial t = 1 (cyclotomic-log-element-t, cyclotomic-derivation).
3. Compatibility with phi: theta_{n+1}(phi f) = theta_n(f) because (1 + z_{n+1})^p - 1 = z_n, and partial phi = p phi partial gives the factor p^{-(n+1)j} p^j = p^{-nj}; compatibility with gamma_a: check on pi, (zeta exp(t/p^n))^a = zeta^a exp(a t/p^n).
4. Injectivity: if iota_n(f) = 0, sigma^{-n} f vanishes on a disc around z_n inside the circle |z| = |z_n|, hence at infinitely many points of that circle, so f = 0 (weierstrass-preparation-on-circles).
5. Kernel of theta_n: [F_n : F] = p^{n-1}(p-1) = deg Phi_{p^n} because F/Q_p is unramified, so Phi_{p^n}(1+pi) is the minimal polynomial of z_n over F; f in ker theta_n iff Phi_{p^n}(1+pi) divides sigma^{-n} f (annulus-factor-theorem) iff it divides f (it has Z_p-coefficients). Surjectivity: theta_n(pi) = z_n generates F_n over F.

*Acceptance.*

- theta_n(phi^{n-1}(q)) = Phi_{p^n}(zeta_{p^n}) = 0 while theta_n(phi^{m-1}(q)) != 0 for m != n; iota_1(pi) = zeta_p exp(t/p) - 1.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PadicHodgeTheory:P7:annulus-foundations/evaluation-at-points`, `PadicHodgeTheory:P7:annulus-foundations/annulus-derivation`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-derivation`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-log-element-t`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-frobenius`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-gamma-action`, `PadicHodgeTheory:P7:annulus-foundations/annulus-factor-theorem`, `PadicHodgeTheory:P7:annulus-foundations/weierstrass-preparation-on-circles`, `mathlib:PowerSeries.exp`, `mathlib:IsPrimitiveRoot`, `mathlib:Polynomial.cyclotomic`.

*Sources.*

- Équations différentielles p-adiques et (φ,N)-modules filtrés, Section I.2, p. 6: “de 1 et ιn agit par σ −n sur les coefficients.” For K = K_0, iota_n(X) = epsilon^{(n)} exp(t/p^n) - 1 and iota_n acts by sigma^{-n} on coefficients.
- Équations différentielles p-adiques et (φ,N)-modules filtrés, Section I.2, p. 6: “L’application ιn se prolonge en une application injective ιn : B†,r rig,K → Kn [[t]].” iota_n extends injectively to B^{dagger,r}_{rig,K}.
- Représentations p-adiques et équations différentielles, Lemme 4.9, p. 42: “La proposition est triviale dans le cas K = F (on a déjà B†,r rig,F /ϕ n−1 (q) =” B^{dagger,r}_{rig,F}/phi^{n-1}(q) = F_n.
- An introduction to the theory of p-adic representations, IV.3.2, p. 28: “we have for n ≥ 1 a filtration on Brig , which corresponds to the order” iota_n = phi^{-n} localises at zeta_{p^n} - 1.

#### Construction. The logarithmic Robba ring B^dagger_{log,F} = B^dagger_{rig,F}[log pi]

*Module* `TauCeti/NumberTheory/PadicHodge/Cyclotomic/Rings.lean`. *Node* `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-log-robba-ring`.

B^dagger_{log,F} = B^dagger_{rig,F}[l] is the polynomial ring in one variable l = 'log pi', with: phi extended by phi(l) = p l + log(phi(pi)/pi^p), where phi(pi)/pi^p - 1 has Gauss norm < 1 on (p^{-1/(p-1)}, 1) so the logarithm lies in B^{dagger,r}_F for r > p - 1; gamma_a extended by gamma_a(l) = l + log(gamma_a(pi)/pi) with log(gamma_a(pi)/pi) = log_p(a) + log(1 + h_a) in B^+_{rig,F} (log_p the Iwasawa logarithm on Z_p^x, h_a as in cyclotomic-gamma-action); partial extended by partial(l) = (1+pi)/pi; and the monodromy operator N = -(p/(p-1)) d/dl, the B^dagger_{rig,F}-linear derivation with N(l) = -p/(p-1). These satisfy N phi = p phi N, N gamma_a = gamma_a N, N partial = partial N, gamma_a gamma_b = gamma_{ab}, gamma_a phi = phi gamma_a, partial phi = p phi partial, and ker N = B^dagger_{rig,F}.

*Hypotheses.* p is a prime, k a perfect field of characteristic p, F = W(k)[1/p] with |p| = p^{-1} and sigma its Witt vector Frobenius (an isometric automorphism of F); pi is a variable. zeta_{p^n} (n >= 1) is a compatible system of primitive p^n-th roots of unity in a fixed algebraic closure of F (the epsilon of the shared conventions), F_n = F(zeta_{p^n}), F_infinity = union of the F_n, and chi : Gal(F_infinity/F) -> Z_p^x the cyclotomic character, an isomorphism since F/Q_p is unramified. Berger's radius convention: for r > 0, C[r;1[ = {z : p^{-1/r} <= |z| < 1}; r_n = p^{n-1}(p-1), so that |zeta_{p^n} - 1| = p^{-1/r_n}. Normalisation: Berger 2002 uses N = -d/dl; Berger 2008 Appendix B corrects it to N(l) = -p/(p-1) so that the comparison with Fontaine's N = -d/du on B_st (u = log[p~], p~^{(0)} = p) holds; this node uses the corrected normalisation. If R06.1 normalises u differently, the scalar changes accordingly (PadicHodgeTheory:P7/berger-dcris-dst-dictionary).

*API.*

- `CycRing.LogRing` (*data*) — B^dagger_{log,F} = Polynomial (B^dagger_{rig,F}), with l = X.
- `CycRing.logPhi` (*constructor*) — phi on B^dagger_{log,F} with phi(l) = p l + log(phi(pi)/pi^p).
- `CycRing.logGamma` (*constructor*) — gamma_a on B^dagger_{log,F} with gamma_a(l) = l + log(gamma_a(pi)/pi).
- `CycRing.monodromyN` (*constructor*) — N = -(p/(p-1)) d/dl, a B^dagger_{rig,F}-linear derivation.
- `CycRing.monodromyN_phi` (*relation*) — N o phi = p phi o N.
- `CycRing.monodromyN_gamma` (*relation*) — N o gamma_a = gamma_a o N.
- `CycRing.ker_monodromyN` (*characterisation*) — ker N = B^dagger_{rig,F}.
- `CycRing.logPartial` (*constructor*) — partial extended by partial(l) = (1+pi)/pi, commuting with N.

*Used by.*

- `PadicDifferentialEquationsAndRigidCohomology:RD.2/berger-form-of-local-monodromy` — B^dagger_{log,K} = B^dagger_{rig,K}[log pi], the solution ring of the monodromy theorem
- `PadicDifferentialEquationsAndRigidCohomology:RD.2/log-robba-ring` — Kedlaya's R_log = R[log u] with u = pi and q = p is this ring (same phi, derivation and N up to the scalar p/(p-1))
- `PadicHodgeTheory:P7/berger-dcris-dst-dictionary` — D_st(V) = (D^dagger_log(V)[1/t])^{Gamma_K}
- `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem` — quasi-unipotence is solved in B^dagger_{log,L}

*Unit tests.* A wrong definition fails one of these.

- `log.test_N_phi` (computation) — N(phi(l)) = p phi(N(l)) = -p^2/(p-1).
- `log.test_gamma_cocycle` (computation) — gamma_a(gamma_b(l)) = gamma_{ab}(l).
- `log.test_ker_N` (degenerate) — N vanishes exactly on B^dagger_{rig,F} (degree 0 polynomials).
- `log.test_not_in_Brig` (non-example) — No element f of B^dagger_{rig,F} satisfies partial f = (1+pi)/pi, so l must be adjoined as a new variable.
- `log.test_kedlaya` (compatibility) — With u = pi and q = p, phi(l) = q l + log(phi(u)/u^q) is the Frobenius of RD.2/log-robba-ring.

*Construction.*

1. Convergence: phi(pi)/pi^p = 1 + h with h = sum_{i=1}^{p-1} binom(p,i) pi^{i-p}, |h|_rho = p^{-1} rho^{1-p} < 1 for rho > p^{-1/(p-1)} and bounded by a constant < 1 on [rho_0, 1); log(1+h) = sum (-1)^{k-1} h^k/k converges and is bounded (gauss-norm-maximum-principle, frechet-topology). For gamma_a: |h_a|_rho <= rho, so log(1 + h_a) converges on the open unit disc.
2. Well defined ring endomorphisms: extension of ring maps to a polynomial ring by choosing the image of l. Cocycle identities: gamma_a gamma_b(l) = gamma_{ab}(l) because gamma_{ab}(pi)/pi = gamma_a(gamma_b(pi)/pi) gamma_a(pi)/pi and log is a homomorphism on these units; gamma_a phi(l) = phi gamma_a(l) similarly.
3. N phi = p phi N: N(phi(l)) = p N(l) = -p^2/(p-1) = p phi(N(l)); the other relations are checked on l and on B^dagger_{rig,F} (where N = 0).
4. partial extended by partial(l) = (1+pi)/pi is compatible with phi: partial(phi(l)) = p (1+pi)^p/((1+pi)^p - 1) = p phi((1+pi)/pi).

*Acceptance.*

- N(l) = -p/(p-1), N(phi(l)) = -p^2/(p-1) = p phi(N(l)).

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-frobenius`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-gamma-action`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-derivation`, `PadicHodgeTheory:P7:annulus-foundations/gauss-norm-maximum-principle`, `PadicHodgeTheory:P7:annulus-foundations/frechet-topology`, `mathlib:Polynomial`, `mathlib:Derivation`.

*Sources.*

- Représentations p-adiques et équations différentielles, Section 2.6, p. 29: “On définit aussi B†log,K = B†rig,K [log(π)], cet anneau est stable par” Definition of B^dagger_{log,K}.
- Représentations p-adiques et équations différentielles, Section 2.6, p. 29: “les actions de ϕ et de ΓK étant donné que ϕ(log(π)) = log(ϕ(π)) =” phi(log pi) = p log pi + log(phi(pi)/pi^p) and gamma(log pi) = log pi + log(gamma(pi)/pi).
- Équations différentielles p-adiques et (φ,N)-modules filtrés, Appendice B, Erratum à [Ber02], p. 27: “Monodromie : pour retrouver le (ϕ, N)-module Dst (·), il faut prendre N(log(π)) = −p/(p − 1) au lieu de N(log(π)) = −1.” The corrected normalisation of N.

### Lemmas, theorems and comparisons

#### Lemma. Multiplicativity of the Gauss norms; O_K(I) is a domain

*Node* `PadicHodgeTheory:P7:annulus-foundations/gauss-norm-multiplicative`.

For f, g in O_K(I) and rho in I: |fg|_rho = |f|_rho |g|_rho, and for f, g nonzero n(fg, rho) = n(f, rho) + n(g, rho) and N(fg, rho) = N(f, rho) + N(g, rho). Consequently O_K(I) is an integral domain.

*Hypotheses.* K is a field complete for a nontrivial nonarchimedean absolute value |.| (Kedlaya–Liu's 'analytic field'); O_K = {|x| <= 1}, m_K = {|x| < 1}, k = O_K/m_K. Characteristic 0 is assumed only where stated. I is a nonempty interval contained in (0, +infinity): open, closed or half-open, possibly a single point, possibly unbounded above. The radius variable rho ranges over I.

*Proof outline.*

1. Let r = n(f, rho), s = n(g, rho). For the coefficient c_{r+s} of fg, the term a_r b_s has |a_r b_s| rho^{r+s} = |f|_rho |g|_rho, and every other term a_i b_{r+s-i} has i < r or r+s-i < s, hence strictly smaller size (Lazard, Proposition 1 proof).
2. The ultrametric inequality gives |c_n| rho^n <= |f|_rho |g|_rho for all n and strict inequality for n < r + s; so |fg|_rho = |f|_rho |g|_rho and n(fg, rho) = r + s. The statement for N is symmetric.
3. Domain: if f, g != 0 then |fg|_rho != 0, so fg != 0 (gauss-norm, gaussNorm_eq_zero_iff).

*Acceptance.*

- |(1 + T)^2|_rho = max(1, rho)^2; (T - varpi)(T + varpi) = T^2 - varpi^2 has Gauss norm rho^2 at rho = |varpi|, the product of the two norms.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/gauss-norm`, `PadicHodgeTheory:P7:annulus-foundations/annulus-laurent-ring`, `mathlib:IsDomain`.

*Sources.*

- Les zéros des fonctions analytiques d’une variable sur un corps valué complet, Proposition 1, p. 50 (numdam OCR): “La relation (3) implique que l'anneau L^I est intègre.” Proposition 1 proves n(fg) = n(f)+n(g), N(fg) = N(f)+N(g) and v(fg, mu) = v(f, mu) + v(g, mu), hence integrality.
- Relative p-adic Hodge theory: Foundations, Definition 2.2.15, p. 28: “which is easily seen to be submultiplicative (resp. power-multiplicative, multiplicative) if the seminorm on A is” The same argument for Tate algebras: the Gauss norm is multiplicative when the base norm is.

#### Lemma. Maximum principle and Hadamard three circles for Gauss norms

*Node* `PadicHodgeTheory:P7:annulus-foundations/gauss-norm-maximum-principle`.

For f in O_K(I): (a) (three circles) for a, b in I and c in [0,1], with rho = a^c b^{1-c}, |f|_rho <= |f|_a^c |f|_b^{1-c}; equivalently log |f|_rho is a convex function of log rho on I; (b) hence for a closed interval [a,b] contained in I, sup_{rho in [a,b]} |f|_rho = max(|f|_a, |f|_b); (c) rho -> |f|_rho is continuous on I; (d) if f has no negative coefficients then rho -> |f|_rho is nondecreasing.

*Hypotheses.* K is a field complete for a nontrivial nonarchimedean absolute value |.| (Kedlaya–Liu's 'analytic field'); O_K = {|x| <= 1}, m_K = {|x| < 1}, k = O_K/m_K. Characteristic 0 is assumed only where stated. I is a nonempty interval contained in (0, +infinity): open, closed or half-open, possibly a single point, possibly unbounded above. The radius variable rho ranges over I.

*Proof outline.*

1. (a) Termwise, |a_n| rho^n = (|a_n| a^n)^c (|a_n| b^n)^{1-c} <= |f|_a^c |f|_b^{1-c}; take the supremum (Kedlaya overview Lemma 3.2.2(b)).
2. (b) A convex function of log rho on [log a, log b] attains its maximum at an endpoint.
3. (c) On a compact subinterval only finitely many indices can be dominant (proof of newton-polygon-breaks (a)), so |f|_rho is locally a maximum of finitely many functions |a_n| rho^n, hence continuous.
4. (d) For n >= 0 each |a_n| rho^n is nondecreasing in rho (Kedlaya overview Lemma 3.2.2(a)).

*Acceptance.*

- For f = T + T^{-1} and I = (1/2, 2): |f|_rho = max(rho, 1/rho), convex in log rho with minimum 1 at rho = 1.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/gauss-norm`.

*Sources.*

- Local monodromy of p-adic differential equations: an overview, Section 3.2, p. 10, before Lemma 3.2.2: “One has analogues of the maximum modulus principle and the Hadamard three circles theorem for | · |r .” States the two properties.
- Représentations p-adiques et équations différentielles, Corollaire 2.20, p. 23: “Corollaire 2.20 (Principe du maximum).” The same maximum principle for Berger's valuations V_I on closed intervals.

#### Theorem. Annulus/limit comparison, gluing and Laurent splitting

*Node* `PadicHodgeTheory:P7:annulus-foundations/annulus-limit-comparison`.

(a) (limit) For every interval I, the restrictions induce an isomorphism of topological K-algebras O_K(I) -> lim_J O_K(J), J running over the compact subintervals of I ordered by inclusion (each O_K(J) a Banach algebra). (b) (gluing) For intervals I, J with I cap J nonempty, the sequence 0 -> O_K(I cup J) -> O_K(I) x O_K(J) -> O_K(I cap J), f |-> (f, f), (g, h) |-> g - h, is exact; equivalently O_K(I cup J) = O_K(I) cap O_K(J) inside O_K(I cap J). (c) (Laurent splitting) If moreover every rho in I is <= some element of I cap J and every rho in J is >= some element of I cap J (I is the inner and J the outer piece), then O_K(I) x O_K(J) -> O_K(I cap J) is surjective: f = f_{>=0} + f_{<0} with f_{>=0} = sum_{n>=0} a_n T^n in O_K(I) and f_{<0} = sum_{n<0} a_n T^n in O_K(J).

*Hypotheses.* K is a field complete for a nontrivial nonarchimedean absolute value |.| (Kedlaya–Liu's 'analytic field'); O_K = {|x| <= 1}, m_K = {|x| < 1}, k = O_K/m_K. Characteristic 0 is assumed only where stated. I, J nonempty intervals in (0, infinity); in (b), (c) I cap J is nonempty (so I cup J is an interval).

*Proof outline.*

1. (a) The map is injective on coefficients; a compatible family (f_J) has one coefficient family, which decays for every rho in I since each rho lies in some compact J. The topologies agree because the Frechet topology is defined by the norms |.|_J of compact subintervals (frechet-topology).
2. (b) A family whose decay holds for all rho in I and for all rho in J holds for all rho in I cup J (coefficientwise; annulusCoeffs_antitone gives the other inclusions).
3. (c) For n >= 0 and rho <= rho' in I cap J, |a_n| rho^n <= |a_n| rho'^n, so the non-negative part converges on I; for n < 0 and rho >= rho', |a_n| rho^n <= |a_n| rho'^n, so the negative part converges on J (gauss-norm).

*Acceptance.*

- For I = [1/4, 1/2], J = [1/3, 1]: f = T^{-1}/(1 - T) restricted to [1/3, 1/2] splits as sum_{n>=0} T^n (inner part, in O_K([1/4,1/2])) plus T^{-1} (outer part, in O_K([1/3,1])).

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/restriction-maps`, `PadicHodgeTheory:P7:annulus-foundations/frechet-topology`, `PadicHodgeTheory:P7:annulus-foundations/gauss-norm`.

*Sources.*

- Les zéros des fonctions analytiques d’une variable sur un corps valué complet, (2.6), p. 51 (numdam OCR): “topologie de L^I comme la moins fine de celles qui rendent continues les inclusions de L^I dans LjgJ,” The topology of L_K I is the limit topology over closed subintervals.
- Représentations p-adiques et équations différentielles, Lemme 2.18, p. 22: “Lemme 2.18. On a une suite exacte” The analogous Mayer–Vietoris splitting for Berger's rings B~_I, proved by splitting off the plus part.
- Relative p-adic Hodge theory: Foundations, Definition 4.1.2, p. 103: “converge on the annulus ω r ≤ |T | < 1.” Rings of half-open annuli, the union over compact subintervals.

#### Lemma. The Gauss norm is the supremum norm on a circle, and is attained

*Node* `PadicHodgeTheory:P7:annulus-foundations/gauss-norm-is-spectral-norm`.

Let L be algebraically closed and complete over K, e in K, f in O_K(I), and rho in I cap |L^x|. Then sup {|ev_{e,z}(f)| : z in L, |z - e| = rho} = |f|_rho, and the supremum is attained. More precisely, if f != 0, there are finitely many residue discs D_1, ..., D_m of radius rho in the circle {|z - e| = rho} such that |ev_{e,z}(f)| = |f|_rho for every z on the circle outside D_1 cup ... cup D_m.

*Hypotheses.* K is a field complete for a nontrivial nonarchimedean absolute value |.| (Kedlaya–Liu's 'analytic field'); O_K = {|x| <= 1}, m_K = {|x| < 1}, k = O_K/m_K. Characteristic 0 is assumed only where stated. I is a nonempty interval contained in (0, +infinity): open, closed or half-open, possibly a single point, possibly unbounded above. The radius variable rho ranges over I. L is an algebraically closed field containing K, complete for an absolute value extending that of K (for example C_p when K is a complete subfield of C_p); |L^x| is then divisible and contains the divisible hull of |K^x|.

*Proof outline.*

1. Upper bound: evaluation-at-points, norm_eval_le.
2. Rescaling: choose c in L with |c| = rho and a dominant index j; put g(w) = ev_{e, e + c w}(f) / (a_j c^j), a Laurent series over L in w converging on |w| = 1 with Gauss norm |g|_1 = 1 and coefficients tending to 0 in both directions.
3. Reduction: the reduction g-bar in k_L[w, w^{-1}] (k_L the residue field of L) is a nonzero Laurent polynomial (finitely many coefficients of absolute value 1).
4. k_L is algebraically closed, hence infinite; g-bar has finitely many zeros in k_L^x. For u in O_L^x whose residue u-bar is not a zero, |g(u)| = 1, i.e. |ev_{e, e+cu}(f)| = |f|_rho; the exceptional residue classes are the lifts of the zeros (Kedlaya overview Definition 3.2.1: the Gauss norm equals the spectral seminorm on the circle).

*Acceptance.*

- For f = T - varpi with |varpi| = rho: |f(z)| = rho = |f|_rho for all z with |z| = rho outside the residue disc of varpi, and f(varpi) = 0 inside it.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/evaluation-at-points`, `PadicHodgeTheory:P7:annulus-foundations/gauss-norm`, `mathlib:IsAlgClosed`.

*Source.* Local monodromy of p-adic differential equations: an overview, Definition 3.2.1, p. 10: “the spectral seminorm on the subspace |t| = r of A(I), restricted to RI , is equal to the norm | · |r given by the formula” For r in I cap Gamma*, the sup norm on the circle |t| = r equals the Gauss norm.

#### Theorem. Identity principle for Laurent series on annuli

*Node* `PadicHodgeTheory:P7:annulus-foundations/identity-principle`.

Let L be algebraically closed and complete over K, e in K, and I an interval meeting |L^x| (automatic if I has nonempty interior, since |L^x| is dense in (0, infinity) when K is nontrivially valued and L algebraically closed). If f in O_K(I) satisfies ev_{e,z}(f) = 0 for every z in L with |z - e| in I, then f = 0. More sharply, it suffices that ev_{e,z}(f) = 0 for all z on one circle |z - e| = rho with rho in I cap |L^x|, or on a subset of that circle meeting infinitely many residue discs of radius rho. Hence O_K(I) -> {functions A_L(e; I) -> L} is injective, and so is the passage to germs O_K((r, 1)) -> R_K.

*Hypotheses.* K is a field complete for a nontrivial nonarchimedean absolute value |.| (Kedlaya–Liu's 'analytic field'); O_K = {|x| <= 1}, m_K = {|x| < 1}, k = O_K/m_K. Characteristic 0 is assumed only where stated. I is a nonempty interval contained in (0, +infinity): open, closed or half-open, possibly a single point, possibly unbounded above. The radius variable rho ranges over I. L is an algebraically closed field containing K, complete for an absolute value extending that of K (for example C_p when K is a complete subfield of C_p); |L^x| is then divisible and contains the divisible hull of |K^x|.

*Proof outline.*

1. Pick rho in I cap |L^x|. By gauss-norm-is-spectral-norm, |f|_rho = sup over the circle of |f(z)| = 0 (resp. |f|_rho is attained at points of every residue disc outside finitely many, which the hypothesis excludes unless |f|_rho = 0).
2. |f|_rho = 0 forces f = 0 (gauss-norm, gaussNorm_eq_zero_iff).
3. Density of |L^x|: it is a divisible subgroup of R_{>0} containing |K^x| != {1}, hence dense.

*Acceptance.*

- The function f = sum_{n>=0} p^n T^{p^n} in O_{Q_p}((0,1)) is nonzero, so it has a point z of C_p with |z| = p^{-1/2} and |f(z)| = |f|_{p^{-1/2}}.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/gauss-norm-is-spectral-norm`, `PadicHodgeTheory:P7:annulus-foundations/gauss-norm`.

*Sources.*

- Local monodromy of p-adic differential equations: an overview, Definition 3.2.1, p. 10: “for r ∈ I ∩ Γ , the spectral seminorm on the subspace |t| = r of” The spectral (sup) seminorm on a circle is the Gauss norm, which vanishes only for f = 0.
- CMI Summer School notes on p-adic Hodge theory, Section 10.3, p. 164: “Observe that the transition maps in the direct limit are injective, thanks to analytic continuation” Analytic continuation for germs.

#### Lemma. Newton polygon: discreteness of breaks and units on sub-annuli

*Node* `PadicHodgeTheory:P7:annulus-foundations/newton-polygon-breaks`.

Let f in O_K(I) be nonzero. (a) For rho in I let n(f,rho) <= N(f,rho) be the least and greatest dominant indices. Both are nondecreasing functions of rho, and on every compact subinterval of I they take finitely many values. (b) The break radii {rho in I : n(f,rho) < N(f,rho)} form a discrete subset of I (finite in every compact subinterval). (c) On an open subinterval I' of I containing no break radius, n(f,.) = N(f,.) = j is constant, f = a_j T^j (1 + h) with h in O_K(I') and |h|_rho < 1 for all rho in I', and f is a unit of O_K(I') with inverse a_j^{-1} T^{-j} sum_{k>=0} (-h)^k. More generally f is a unit of O_K(J) for a compact interval J = [rho_1, rho_2] iff N(f, rho_1) = n(f, rho_2). (d) Hence if I has nonempty interior, f restricts to a unit on some nonempty open subinterval. (e) log |f|_rho is a piecewise affine function of log rho whose right (left) derivative at rho is N(f,rho) (n(f,rho)). (f) If L is algebraically closed and complete over K and ev_{e,z}(f) = 0 with |z - e| = rho in I, then rho is a break radius.

*Hypotheses.* K is a field complete for a nontrivial nonarchimedean absolute value |.| (Kedlaya–Liu's 'analytic field'); O_K = {|x| <= 1}, m_K = {|x| < 1}, k = O_K/m_K. Characteristic 0 is assumed only where stated. I is a nonempty interval contained in (0, +infinity): open, closed or half-open, possibly a single point, possibly unbounded above. The radius variable rho ranges over I.

*Proof outline.*

1. (a) If n > N(f,rho) then |a_n| rho^n < |a_N| rho^N; multiplying by (rho'/rho)^n with rho' < rho shows n cannot become dominant at rho'; so dominant indices can only increase with rho. On a compact [rho_1, rho_2] the dominant indices lie between n(f, rho_1) and N(f, rho_2) (Lazard (1.8)).
2. (b) Between the finitely many candidate indices, each function log |a_n| + n log rho is affine in log rho, and the upper envelope of finitely many affine functions has finitely many corners.
3. (c) With a single dominant index j on I', h = (f - a_j T^j)/(a_j T^j) has |h|_rho < 1 for rho in I'; on each compact subinterval sup |h|_rho < 1 by continuity and compactness (gauss-norm-maximum-principle), so the geometric series converges in O_K(I') (frechet-topology). The closed-interval criterion is Lazard Proposition 4(1); necessity follows from additivity of n and N (gauss-norm-multiplicative).
4. (d) Take I' between two consecutive break radii inside the interior of I.
5. (e) On a break-free interval |f|_rho = |a_j| rho^j.
6. (f) If only one index j dominates at rho = |z - e| then |f(z) - a_j (z - e)^j| < |a_j| rho^j, so f(z) != 0.

*Acceptance.*

- f = T - varpi with |varpi| = 1/2 on I = (1/4, 1): the only break radius is 1/2; f is a unit on (1/4, 1/2) (dominant index 0) and on (1/2, 1) (dominant index 1), and not on any interval containing 1/2.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/gauss-norm`, `PadicHodgeTheory:P7:annulus-foundations/gauss-norm-multiplicative`, `PadicHodgeTheory:P7:annulus-foundations/gauss-norm-maximum-principle`, `PadicHodgeTheory:P7:annulus-foundations/frechet-topology`, `PadicHodgeTheory:P7:annulus-foundations/evaluation-at-points`.

*Sources.*

- Les zéros des fonctions analytiques d’une variable sur un corps valué complet, (1.8), p. 49 (numdam OCR): “a une intersection finie avec tout intervalle fermé [m, M] contenu dans Conv(/).” Break points are finite in every closed subinterval of the convergence interval.
- Les zéros des fonctions analytiques d’une variable sur un corps valué complet, Proposition 4(1), p. 55 (numdam OCR): “est inversible dans L^E^i, m^\ si et seulement si” Unit criterion on a closed annulus: N(f, m_1) = n(f, m_2) (OCR layer).
- Les zéros des fonctions analytiques d’une variable sur un corps valué complet, Remark after Proposition 4 bis, p. 56 (numdam OCR): “qui correspondent respectivement à un côté et à un sommet du polygone de Newton” Newton polygon vocabulary: sides and vertices correspond to the decompositions.

#### Lemma. Weierstrass preparation on a circle and zeros on an annulus

*Node* `PadicHodgeTheory:P7:annulus-foundations/weierstrass-preparation-on-circles`.

Let f in O_K(I) be nonzero, rho in I, and s = N(f, rho) - n(f, rho). Then there is a unique polynomial P in K[T] of degree s with P(0) = 1 all of whose roots (in an algebraic closure, with the unique extended absolute value) have absolute value rho, and g in O_K({rho}) with a single dominant index n(f, rho) at rho (hence a unit of O_K({rho})), such that res f = P g in O_K({rho}). Consequently, for L algebraically closed and complete over K and e in K, f has exactly s zeros on the circle {z in L : |z - e| = rho} counted with multiplicity, finitely many zeros on each circle, and none on circles that are not break radii.

*Hypotheses.* K is a field complete for a nontrivial nonarchimedean absolute value |.| (Kedlaya–Liu's 'analytic field'); O_K = {|x| <= 1}, m_K = {|x| < 1}, k = O_K/m_K. Characteristic 0 is assumed only where stated. I is a nonempty interval contained in (0, +infinity): open, closed or half-open, possibly a single point, possibly unbounded above. The radius variable rho ranges over I. The polynomial P is Lazard's m-extremal polynomial with m = -log rho.

*Proof outline.*

1. Reduce to n(f,rho) = 0, N(f,rho) = s by multiplying by T^{-n(f,rho)}.
2. Hensel iteration in the Banach algebra O_K({rho}): start from P_1 = the dominant part sum_{0<=i<=s} a_i T^i; divide f = P_n g_n + Q_n with deg Q_n < s (division by an extremal polynomial, Lazard Lemme 2) and put P_{n+1} = P_n + Q_n; the corrections tend to 0 and the limits give f = P g (Lazard Proposition 2).
3. Uniqueness: Lazard Proposition 3.
4. Zeros: g has no zeros on the circle (newton-polygon-breaks (f)) and the zeros of P are its s roots of absolute value rho; zeros of f on the circle are those of P by multiplicativity of evaluation (evaluation-at-points).

*Acceptance.*

- For K = Q_p (p odd), rho = p^{-1/2} and f = T^2 - p: n(f,rho) = 0, N(f,rho) = 2, P = 1 - T^2/p, g = -p, and f has the two zeros +-sqrt(p) on the circle |z| = p^{-1/2}; on the circle |z| = p^{-1/3} it has none.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/newton-polygon-breaks`, `PadicHodgeTheory:P7:annulus-foundations/frechet-topology`, `PadicHodgeTheory:P7:annulus-foundations/evaluation-at-points`, `mathlib:Polynomial`.

*Sources.*

- Les zéros des fonctions analytiques d’une variable sur un corps valué complet, Proposition 2, p. 53-54 (numdam OCR): “Ces conditions déterminent univoquement P et g, et on a de plus” Existence and uniqueness of f = P g with P m-extremal of degree N - n and P(0) = 1.
- Les zéros des fonctions analytiques d’une variable sur un corps valué complet, Introduction, p. 47 (numdam OCR): “f a les mêmes zéros qu'un polynôme à coefficients dans K, compte tenu des multiplicités.” On every closed disc f has the same zeros as a polynomial, with multiplicities.

#### Theorem. Coefficient extension along finite extensions of the base field

*Node* `PadicHodgeTheory:P7:annulus-foundations/coefficient-extension`.

Let L/K be a finite extension, with the unique extension of the absolute value (so L is complete). (a) For every interval I the L-algebra map L tensor_K O_K(I) -> O_L(I), lambda tensor f |-> lambda f, is an isomorphism of topological L-algebras, where L tensor_K O_K(I) = O_K(I)^{[L:K]} via any K-basis of L; it preserves Gauss norms on O_K(I). Likewise L tensor_K R_K = R_L, L tensor_K R^bd_K = R^bd_L and L tensor_K E_K = E_L. (b) If O_L is a free O_K-module of finite rank (for example K discretely valued), then O_L tensor_{O_K} R^int_K = R^int_L and O_L tensor_{O_K} O_{E,K} = O_{E,L}. (c) If L/K is Galois with group G acting on coefficients, then O_L(I)^G = O_K(I), R_L^G = R_K, (R^bd_L)^G = R^bd_K and E_L^G = E_K.

*Hypotheses.* K is a field complete for a nontrivial nonarchimedean absolute value |.| (Kedlaya–Liu's 'analytic field'); O_K = {|x| <= 1}, m_K = {|x| < 1}, k = O_K/m_K. Characteristic 0 is assumed only where stated. L/K finite; in (b) O_L is finite free over O_K; in (c) L/K Galois.

*Proof outline.*

1. Coordinates: for a K-basis (omega_i) of L, the coordinate maps L -> K are K-linear and continuous (finite-dimensional normed spaces over the complete field K: LinearMap.continuous_of_finiteDimensional), hence bounded: |c_i(x)| <= C |x|.
2. Given f = sum a_n T^n in O_L(I), the families f_i = sum c_i(a_n) T^n satisfy |c_i(a_n)| rho^n <= C |a_n| rho^n, so f_i in O_K(I) and f = sum omega_i f_i; uniqueness from linear independence coefficientwise. The same bound gives the statements for R, R^bd, E (the conditions are decay and boundedness conditions).
3. (b): for x in O_L the coordinates in an O_K-basis of O_L lie in O_K.
4. (c): if f is G-invariant, its coefficients lie in L^G = K.

*Acceptance.*

- For K = Q_p and L = Q_p(sqrt p): R_L = R_{Q_p} + sqrt(p) R_{Q_p}, and log(1+T)/sqrt(p) lies in R_L but not in R_{Q_p}.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/annulus-laurent-ring`, `PadicHodgeTheory:P7:annulus-foundations/robba-ring`, `PadicHodgeTheory:P7:annulus-foundations/bounded-robba-ring`, `PadicHodgeTheory:P7:annulus-foundations/amice-ring`, `mathlib:LinearMap.continuous_of_finiteDimensional`, `mathlib:FiniteDimensional.complete`, `mathlib:IsGalois`.

*Sources.*

- Relative p-adic Hodge theory: Foundations, Definition 2.2.1, p. 27: “For K an analytic field, any finite extension of K admits a unique structure of an analytic field extending K” Finite extensions of the base field carry the unique extended norm.
- Équations différentielles p-adiques et (φ,N)-modules filtrés, Section I.3, Proposition I.3.2, p. 7: “est un (ϕ, ΓK )-module et D =” Galois descent for modules over B^dagger_{rig,L} (the coefficient-level statement is (c)).
- Représentations p-adiques et équations différentielles, Proposition 3.15, p. 37: “Proposition 3.15. On a (B†rig )HK = B†rig,K .” Invariants of a coefficient/tensor extension are computed coefficientwise.

#### Lemma. Division by the minimal polynomial of a zero

*Node* `PadicHodgeTheory:P7:annulus-foundations/annulus-factor-theorem`.

Let alpha be algebraic over K with |alpha| in I (absolute value extended uniquely to K(alpha)), and let P in K[T] be its minimal polynomial. If f in O_K(I) satisfies ev_{0,alpha}(f) = 0, then f = P g for a unique g in O_K(I). More generally, if P in K[T] is separable, all its roots have absolute value in I, and f vanishes at every root of P, then P divides f in O_K(I).

*Hypotheses.* K is a field complete for a nontrivial nonarchimedean absolute value |.| (Kedlaya–Liu's 'analytic field'); O_K = {|x| <= 1}, m_K = {|x| < 1}, k = O_K/m_K. Characteristic 0 is assumed only where stated. I is a nonempty interval contained in (0, +infinity): open, closed or half-open, possibly a single point, possibly unbounded above. The radius variable rho ranges over I. Roots are taken in a finite Galois extension L of K, with the unique extension of the absolute value (Kedlaya–Liu Definition 2.2.1); separability is automatic in characteristic 0.

*Proof outline.*

1. All conjugates beta of alpha have |beta| = |alpha| (uniqueness of the extension of the absolute value), and ev_{0,beta}(f) = tau(ev_{0,alpha}(f)) = 0 for the K-embedding tau with tau(alpha) = beta (evaluation-at-points, eval_map).
2. Division by T - beta over L: g_beta = sum_m b_m T^m with b_m = sum_{n > m} a_n beta^{n-1-m} for m >= 0 and b_m = -sum_{n <= m} a_n beta^{n-1-m} for m < 0; using sum_n a_n beta^n = 0 both formulas hold for all m, and choosing for each rho the formula whose terms are bounded by |a_n| rho^{n-1} (the first for rho >= |beta|, the second for rho <= |beta|) shows g_beta in O_L(I) and (T - beta) g_beta = f.
3. Iterate over the distinct roots (a root beta' != beta of P is a zero of g_beta since beta' - beta != 0 and O_L(I) -> L is a ring map).
4. Descent: the quotient f / P is fixed by Gal(L/K) acting on coefficients and unique (O_L(I) is a domain, gauss-norm-multiplicative), so it lies in O_K(I) (coefficient-extension).

*Acceptance.*

- For K = Q_p, I = [p^{-1/(p-1)}, 1) and f = t = log(1 + T): f vanishes at zeta_p - 1, so Phi_p(1 + T) = ((1+T)^p - 1)/T divides t in O_K(I).

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/evaluation-at-points`, `PadicHodgeTheory:P7:annulus-foundations/gauss-norm-multiplicative`, `PadicHodgeTheory:P7:annulus-foundations/coefficient-extension`, `mathlib:minpoly`, `mathlib:IsGalois`.

*Sources.*

- Représentations p-adiques et équations différentielles, Lemme 4.6, proof, p. 41: “car une série est divisible Qn (πK ) si et seulement si les zéros de la première ont un ordre ⩾ à ceux de la seconde, ce que l’on peut vérifier localement.” Divisibility by a polynomial is decided by the zeros; used for Q_n = phi^{n-1}(q).
- Les zéros des fonctions analytiques d’une variable sur un corps valué complet, Section 2 title, p. 50 (numdam OCR): “a. Multiplication des séries de Laurent; division par des polynômes.” Division of Laurent series by polynomials.

#### Lemma. For discretely valued K, E_K is a complete discretely valued field

*Node* `PadicHodgeTheory:P7:annulus-foundations/amice-ring-complete-dvf`.

If K is discretely valued with uniformiser pi_K and residue field k, then O_{E,K} is a complete discrete valuation ring with maximal ideal pi_K O_{E,K} and residue field k((T)), and E_K = O_{E,K}[1/pi_K] is its fraction field, a complete discretely valued field for |.|_1 with valuation ring O_{E,K}. No perfectness of k is needed.

*Hypotheses.* K is a field complete for a nontrivial nonarchimedean absolute value |.| (Kedlaya–Liu's 'analytic field'); O_K = {|x| <= 1}, m_K = {|x| < 1}, k = O_K/m_K. Characteristic 0 is assumed only where stated. K discretely valued with uniformiser pi_K; for K not discretely valued E_K is not a field in general (Kedlaya overview Remark 3.5.3).

*Proof outline.*

1. Every nonzero f in E_K is pi_K^m u with |u|_1 = 1: the supremum of |a_n| is attained because |K^x| is discrete and a_n -> 0 at -infinity.
2. If |u|_1 = 1, the reduction of u in k((T)) is nonzero (amice-ring, reduction), hence a unit; lift its inverse to v in O_{E,K}; then uv = 1 - w with |w|_1 < 1, and sum_k w^k converges (amice-ring completeness), so u is a unit.
3. Hence O_{E,K} is local with maximal ideal pi_K O_{E,K}, noetherian of dimension one, i.e. a DVR, complete for |.|_1.

*Acceptance.*

- For K = Q_p: E_{Q_p} is Fontaine's field B_{Q_p} in the variable pi; its residue field is F_p((pi)).

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/amice-ring`, `mathlib:IsDiscreteValuationRing`.

*Sources.*

- Theory of p-adic Galois representations, Section 4.3.2, p. 80: “Note that OE0 is a complete discrete ring, whose maximal ideal is generated by p and whose residue field is E0 .” O_{E_0} is a complete DVR with uniformiser p and residue field k((pi)).
- Équations différentielles p-adiques et (φ,N)-modules filtrés, Section I.2, p. 5-6: “norme de Gauss et on appelle BF son complété qui est un corps local de dimension 2 dont le corps résiduel s’identifie à kK ((X)).” B_F is a two-dimensional local field with residue field k((X)).

#### Lemma. Completed tensor identity for annulus rings

*Node* `PadicHodgeTheory:P7:annulus-foundations/completed-base-change`.

Let L be a complete valued extension of K (not necessarily finite) and I = [a, b] a compact interval in (0, infinity). Equip O_K(I) with |.|_I = max(|.|_a, |.|_b) and L with its absolute value. Then the natural map L tensor_K O_K(I) -> O_L(I) is an isometry for the product seminorm of Kedlaya–Liu Definition 2.1.10 and extends to an isometric isomorphism L hat-tensor_K O_K(I) -> O_L(I). For an arbitrary interval I, O_L(I) = lim_J L hat-tensor_K O_K(J) over compact J contained in I.

*Hypotheses.* K is a field complete for a nontrivial nonarchimedean absolute value |.| (Kedlaya–Liu's 'analytic field'); O_K = {|x| <= 1}, m_K = {|x| < 1}, k = O_K/m_K. Characteristic 0 is assumed only where stated. L complete valued extension of K; I compact for the first statement.

*Proof outline.*

1. Orthogonal basis: |sum a_n T^n|_I = sup_n |a_n| |T^n|_I with |T^n|_I = max(a^n, b^n) (gauss-norm; maximum principle).
2. Product seminorm: for x = sum_j mu_j tensor e_j with e_j = sum_n c_{jn} T^n, the coefficient lambda_n = sum_j mu_j c_{jn} of T^n satisfies |lambda_n| |T^n|_I <= max_j |mu_j| |e_j|_I, so the image norm is at most the product seminorm; the presentation x = sum lambda_n tensor T^n attains it. Hence the map is isometric (no spherical completeness needed).
3. Density: L[T, T^{-1}] is dense in O_L(I) (frechet-topology), so the completion maps onto O_L(I).
4. General I: annulus-limit-comparison (a).

*Acceptance.*

- For K = Q_p, L = C_p and I = {1}: C_p hat-tensor Q_p<T, T^{-1}> = C_p<T, T^{-1}>.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/frechet-topology`, `PadicHodgeTheory:P7:annulus-foundations/gauss-norm`, `PadicHodgeTheory:P7:annulus-foundations/annulus-limit-comparison`, `mathlib:TensorProduct`.

*Sources.*

- Relative p-adic Hodge theory: Foundations, Definition 2.1.10, p. 27: “called the completed tensor product of B and C over A” Definition of the completed tensor product for the product seminorm.
- Relative p-adic Hodge theory: Foundations, Definition 2.2.15, p. 28: “complete for the Gauss norm” Tate algebras with radii, complete for the Gauss norm; the annulus ring O_K([a,b]) is the analogous Laurent algebra.

### What is missing

- Coverage status: `source_decomposed`. All stage targets are planned: Laurent-series rings on annuli with Gauss norms, Frechet topology, restriction maps, limit/gluing/splitting comparison, evaluation, identity principle, Newton polygon and Weierstrass preparation on circles, the derivation, Robba/bounded/integral/Amice rings, coefficient extension along finite extensions and the completed tensor identity; the cyclotomic rings over an unramified F in the variable pi with Frobenius, Gamma-action, t, partial, nabla, iota_n and B^dagger_{log,F}. The ColemanIntegration and PadicDifferentialEquationsAndRigidCohomology requests are served (see the report). The identification B^dagger_{rig,K} = R_{F'}(pi_K) for ramified K needs the field of norms (PG.0, a consumer of this stage) and is planned in P7.

## P8:local-rational Period sheaves and local Poincaré lemma

Scholze's pro-étale period sheaves, from the rational side, built as follows:

- structure sheaves and affinoid perfectoid objects;
- the period sheaves $\mathbb A_{\mathrm{inf}}$, $\mathbb B_{\mathrm{dR}}^+$ and $\mathbb B_{\mathrm{dR}}$ with their values on affinoid perfectoids;
- the corrected structural sheaves $\mathcal O\mathbb B_{\mathrm{dR}}^+$ and $\mathcal O\mathbb B_{\mathrm{dR}}$ of the erratum, with their local description over a torus chart;
- the relative Poincaré lemma, whose tensor product is corrected to a completed one (a new source issue), and Faltings's extension;
- the pushforward to the étale site.

The crystalline period sheaves and their Poincaré lemma follow Tan–Tong §2. The integral inputs are imported from AInfCohomology AI.3, whose stage text must cover every locally noetherian space (restructure). The construction nodes do not depend on any comparison theorem, as the stage text requires.

### Objects

#### Definition. The structure sheaves O_X and Ô_X on X_proét and the continuous valuations on their sections

*Module* `TauCeti/PadicHodge/PeriodSheaves/StructureSheaves.lean`. *Node* `PadicHodgeTheory:P8:local-rational/proetale-structure-sheaves-and-valuations`.

Let X be a locally noetherian adic space over Spa(Q_p, Z_p) with pro-étale site X_proét and projection ν: X_proét → X_ét. Define the (uncompleted) structure sheaf O_X := ν^*O_{X_ét} and the completed structure sheaf Ô_X := Ô_X^+[1/p], where O_X^+ = ν^*O^+_{X_ét} and Ô_X^+ = lim_n O_X^+/p^n is the completed integral structure sheaf imported from AInfCohomology AI.3; the map O_X → Ô_X is the localisation at p of O_X^+ → Ô_X^+. For qcqs U = lim U_i in X_proét: O_X(U) = colim_i O_X(U_i) and Ô_X(U) = Ô_X^+(U)[1/p]. Every x ∈ |U| defines a continuous valuation f ↦ |f(x)| on O_X(U), assembled from the valuations at the images x_i ∈ |U_i|, and it extends to a continuous valuation on Ô_X(U): for f ∈ Ô_X^+(U) with reductions f_n ∈ (O_X^+/p^n)(U), set |f(x)| = |f_n(x̃)| whenever max(|f_n(x̃)|, |p|^n) > |p|^n for some n (x̃ a preimage of x on a cover where f_n lifts), and |f(x)| = 0 otherwise.

*Hypotheses.* X locally noetherian over Spa(Q_p, Z_p); X_proét is the pro-étale site with Scholze's corrected covers (erratum item (1)), supplied by AdicEtaleGeometry A1. Imported from AI.3: O_X^+ and Ô_X^+ with O_X^+/p^n ≅ Ô_X^+/p^n and Ô_X^+(U) flat over Z_p and p-adically complete (Lemma 4.2 (iii)). The source cautions that density of O_X(U) in Ô_X(U) and the adic-space structure of (|U|, Ô_X, valuations) are unknown for general U; they hold on affinoid perfectoid U (next nodes).

*API.*

- `UncompletedStructureSheaf` (*data*) — O_X := ν^*O_{X_ét} as a sheaf of rings on X_proét, with O_X^+ ⊂ O_X.
- `CompletedStructureSheaf` (*data*) — Ô_X := Ô_X^+[1/p] as a sheaf of rings on X_proét, with the ring map O_X → Ô_X.
- `UncompletedStructureSheaf.sections_limit` (*characterisation*) — For qcqs U = lim U_i in X_proét, O_X(U) = colim_i O_X(U_i).
- `CompletedStructureSheaf.sections_qcqs` (*characterisation*) — For qcqs U in X_proét, Ô_X(U) = Ô_X^+(U)[1/p].
- `CompletedStructureSheaf.valuation` (*constructor*) — For x ∈ |U|, the continuous valuation f ↦ |f(x)| on Ô_X(U), restricting to the valuation at x on O_X(U).
- `CompletedStructureSheaf.valuation_restrict` (*functoriality*) — For V → U in X_proét and y ∈ |V| over x ∈ |U|, |f|_V(y)| = |f(x)|.
- `CompletedStructureSheaf.topology` (*instance*) — Ô_X(U) is a topological ring with basis of neighbourhoods p^n Ô_X^+(U), n ≥ 0, and every valuation f ↦ |f(x)| is continuous.

*Used by.*

- Scholze, p-adic Hodge theory for rigid-analytic varieties, Lemma 4.10 and Remark 4.11 — Ô_X(U) = R on affinoid perfectoid U, the basis on which the sheaves behave as expected
- Scholze, Definition 6.1 and Proposition 6.7 — θ: B_inf → Ô_X and gr^i B_dR ≅ Ô_X(i)
- Scholze, Corollaries 6.14 and 6.19 — Faltings's extension 0 → Ô_X(1) → gr¹OB_dR^+ → Ô_X ⊗ Ω¹ → 0 and ν_*Ô_X = O_{X_ét}
- PerfectoidSpaces P9/function-descent-along-tower — descent of O and O^+ along pro-étale towers uses ν_*Ô_X = O_{X_ét}
- HodgeTateAndCanonicalSubgroups T2 — the relative Hodge–Tate sequence is a sequence of Ô_X-modules on the pro-étale site
- Tan–Tong, Crystalline comparison isomorphisms, §2.1 — Ô_X^+ and Ô_X are the targets of θ for the crystalline sheaves

*Unit tests.* A wrong definition fails one of these.

- `CompletedStructureSheaf.sections_perfectoidTorus` (computation) — For X = Tⁿ over a perfectoid field K and U = T̃ⁿ = lim Spa(K⟨T_i^{±1/p^m}⟩, K^+⟨T_i^{±1/p^m}⟩), Ô_X(U) = K⟨T₁^{±1/p^∞}, …, Tₙ^{±1/p^∞}⟩.
- `CompletedStructureSheaf.sections_etale` (compatibility) — For qcqs U ∈ X_ét, O_X(U) = O_{X_ét}(U) and the valuation at x ∈ |U| is the valuation of the adic space U at x.
- `CompletedStructureSheaf.point` (degenerate) — For X = Spa(C, O_C) with C complete algebraically closed, the object X is affinoid perfectoid and Ô_X(X) = C with its absolute value.
- `UncompletedStructureSheaf.not_complete` (non-example) — For X = T¹ over a perfectoid K, O_X(T̃¹) = colim_m K⟨T^{±1/p^m}⟩ is not p-adically complete: Σ_{m≥1} p^m T^{1/p^m} lies in Ô_X(T̃¹) but not in O_X(T̃¹).

*Construction.*

1. O_X(U) = colim O_X(U_i) for qcqs U by the case i = 0 of Lemma 3.16 (A1); a point of |U| = lim |U_i| is a compatible family of points x_i, so the valuations of O_{X_ét}(U_i) at x_i combine (Lemma 4.2 (i)).
2. For f ∈ Ô_X^+(U) the quantity max(|f_n(x̃)|, |p|^n) is independent of the local lift f_n ∈ O_X^+ and of the preimage x̃, because two lifts differ by p^n O_X^+; this defines |f(x)|, which is multiplicative and continuous (Lemma 4.2 (iv)); it extends to Ô_X(U) = Ô_X^+(U)[1/p] by |f/p^m (x)| = |f(x)|·|p|^{-m}.
3. Ô_X(U) = Ô_X^+(U)[1/p] for qcqs U: the localisation is the filtered colimit along multiplication by p, and sections over coherent objects commute with filtered colimits (A1, coherence of X_proét, Proposition 3.12).

*Acceptance.*

- On a qcqs U ∈ X_ét, O_X(U) = O_{X_ét}(U) and the valuations are those of the adic space U.
- On affinoid perfectoid U with Û = Spa(R, R^+), Ô_X(U) = R and the valuations are those of Spa(R, R^+) (node completed-structure-sheaf-on-affinoid-perfectoids).

*Uses.* `AdicEtaleGeometry:A1`, `AInfCohomology:AI.3`.

*Sources.*

- p-adic Hodge theory for rigid-analytic varieties, Section 4, Definition 4.1 and Lemma 4.2 (i), (iv) with proofs, pp. 21-22 (extraction lines 1134-1187): “(iv) For any x ∈ |U|, the valuation f ↦ |f(x)| extends to a continuous valuation on ÔX(U).” The extension of the valuations to the completed structure sheaf, the API item valuation.
- p-adic Hodge theory for rigid-analytic varieties, Section 4, Definition 4.1 (ii), p. 21 (extraction lines 1141-1144): “The integral completed structure sheaf Ô+X = lim O+X/pn, and the completed structure sheaf ÔX = Ô+X[1/p].” The definition of Ô_X from the integral sheaf that AI.3 supplies.

#### Definition. The period sheaves B_inf and B_dR^+ with θ and the ker θ-adic filtration

*Module* `TauCeti/PadicHodge/PeriodSheaves/DeRham.lean`. *Node* `PadicHodgeTheory:P8:local-rational/period-sheaves-definitions`.

Let X be a locally noetherian adic space over Spa(Q_p, Z_p), and let A_inf = W(Ô^+_{X♭}) with θ: A_inf → Ô_X^+ be the integral period sheaf of AInfCohomology AI.3. Define B_inf := A_inf[1/p] (sheafification of the sectionwise localisation; on qcqs U it is the sectionwise localisation), with θ: B_inf → Ô_X the localisation of θ; the positive de Rham sheaf B_dR^+ := lim_n B_inf/(ker θ)^n (quotients formed as sheaves, limit in sheaves of rings), with filtration Fil^i B_dR^+ := lim_{n≥i} (ker θ)^i/(ker θ)^n for i ≥ 0 and Fil^i = B_dR^+ for i ≤ 0, and θ: B_dR^+ → Ô_X the projection to n = 1. These are sheaves of Q_p-algebras (p is invertible in B_inf, hence in B_dR^+), functorial in X, and on X_proét/X_C (C a completed algebraic closure of a field k over which X lies) they are algebras over Fontaine's rings A_inf(O_C) ⊂ B_inf(C) ⊂ B_dR^+(C) of R06.1.

*Hypotheses.* A_inf = W(Ô^+_{X♭}), Ô^+_{X♭} = lim_Φ O_X^+/p and θ are AI.3's (Scholze Definition 5.9 and Definition 6.1 (i)); the construction here starts from them and adds the rational steps: inverting p and completing along ker θ. The value of these sheaves on affinoid perfectoid objects and their acyclicity are the next nodes; that ker θ is locally principal (generated by ξ) is Theorem 6.5 (i).

*API.*

- `InfinitesimalPeriodSheaf` (*data*) — B_inf := A_inf[1/p] on X_proét with θ: B_inf → Ô_X.
- `DeRhamPlusSheaf` (*data*) — B_dR^+ := lim_n B_inf/(ker θ)^n as a sheaf of Q_p-algebras on X_proét.
- `DeRhamPlusSheaf.theta` (*projection*) — θ: B_dR^+ → Ô_X, surjective with kernel Fil¹B_dR^+.
- `DeRhamPlusSheaf.fil` (*structure*) — The decreasing filtration Fil^i B_dR^+ with Fil^i·Fil^j ⊂ Fil^{i+j}, Fil⁰ = B_dR^+ and B_dR^+ = lim_n B_dR^+/Fil^n.
- `DeRhamPlusSheaf.map` (*functoriality*) — For f: Y → X, the map f^{-1}B_dR^+_X → B_dR^+_Y compatible with θ and Fil, with map_id and map_comp.
- `DeRhamPlusSheaf.algebraMap_fontaine` (*compatibility*) — On X_proét/X_C the sheaf B_dR^+ is a B_dR^+(C)-algebra, the structure map being the value on Spa(C, O_C) of the functoriality map.
- `InfinitesimalPeriodSheaf.sections_qcqs` (*characterisation*) — For qcqs U, B_inf(U) = A_inf(U)[1/p].

*Used by.*

- Scholze, Theorem 6.5 and Corollary 6.6 — values and acyclicity on affinoid perfectoid objects and on U × S
- Scholze, Proposition 6.7 — gr^i B_dR ≅ Ô_X(i)
- Scholze, erratum item (3) and Proposition 6.10 — OB_dR^+ is a B_dR^+-algebra and locally B_dR^+[[X_1, …, X_n]]
- Scholze, Theorems 7.2 and 8.4 — B_dR^+-local systems M = L ⊗ B_dR^+ and the étale-to-B_dR^+ comparison
- CohomologyComparisons CP.3 (BMS1 Theorem 13.1, proof on p. 115) — the agreement with Scholze's comparison runs through B_dR^+(R_∞,Σ) → OB_dR^+(R_∞,Σ)
- HodgeTateAndCanonicalSubgroups T6:comparison — the logarithmic period sheaves are built over B_dR^+ on the pro-Kummer-étale site
- Tan–Tong, Proposition 2.23 — B_cris^+ embeds into B_dR^+ as a filtered subsheaf

*Unit tests.* A wrong definition fails one of these.

- `DeRhamPlusSheaf.sections_point` (compatibility) — For X = Spa(C, O_C) with C = completion of an algebraic closure of Q_p, B_dR^+(Spa C) is isomorphic to Mathlib's BDeRhamPlus (PadicComplexInt p) p, compatibly with θ.
- `DeRhamPlusSheaf.gr_one` (computation) — gr¹B_dR^+ = Fil¹/Fil² is isomorphic to Ô_X(1) (node graded-de-rham-period-sheaf-tate-twist).
- `DeRhamPlusSheaf.theta_surjective` (characterisation) — θ: B_dR^+ → Ô_X is surjective with kernel Fil¹, and B_dR^+ → lim_n B_dR^+/Fil^n is an isomorphism.
- `DeRhamPlusSheaf.p_isUnit` (non-example) — p is a unit in B_dR^+(U) for every U, so B_dR^+ is not the p-adic completion of A_inf (in which p is not a unit).
- `InfinitesimalPeriodSheaf.not_complete` (non-example) — On Spa(C, O_C) with ξ = [p♭] − p: the element 1 − ξ/p ∈ B_inf(C) = W(O_C♭)[1/p] is a unit of B_dR^+(C) (its θ-value is 1 and B_dR^+ is ker θ-adically complete) but not of B_inf(C), because p(1 − ξ/p) = 2p − [p♭] is neither divisible by p in W(O_C♭) (its reduction is −p♭ ≠ 0) nor a unit (it maps to 0 in the residue field); so B_inf ≠ B_dR^+.

*Construction.*

1. B_inf := A_inf[1/p] and θ[1/p]: B_inf → Ô_X = Ô_X^+[1/p].
2. The ideal sheaf ker θ ⊂ B_inf, its powers and the quotient sheaves B_inf/(ker θ)^n; the transition maps are surjective.
3. B_dR^+ := lim_n B_inf/(ker θ)^n in sheaves of rings (limits of sheaves are computed sectionwise); Fil^i as the limit of the images of (ker θ)^i.
4. Functoriality: a morphism Y → X induces Y_proét → X_proét and compatible maps of A_inf, θ (AI.3), hence of B_inf, B_dR^+ and Fil.

*Acceptance.*

- On an affinoid perfectoid U with Û = Spa(R, R^+): B_inf(U) = W(R♭+)[1/p] and B_dR^+(U) = B_dR^+(R, R^+) (node period-sheaves-on-affinoid-perfectoids).
- On X = Spa(C, O_C): B_dR^+(Spa C) is Mathlib's BDeRhamPlus O_C p (a type-level identity after the identification of R06.1).

*Uses.* `AInfCohomology:AI.3`, `PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras`, `mathlib:BDeRhamPlus`, `mathlib:fontaineThetaInvertP`, `mathlib:AdicCompletion`.

*Planet:* Positive de Rham sheaf B_dR^+.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 6, Definition 6.1 (i)-(ii), p. 35 (extraction lines 2008-2018): “The sheaf Ainf = W(Ô+X♭), and its rational version Binf = Ainf[1/p]. Note that we have θ : Ainf → Ô+X extending to θ : Binf → ÔX.” The definition of B_inf and θ that the node records; (ii) continues with B+dR = lim Binf/(ker θ)^n and its filtration (ker θ)^i B+dR.

#### Definition. The de Rham period sheaf B_dR = B_dR^+[1/t] and its filtration

*Module* `TauCeti/PadicHodge/PeriodSheaves/DeRham.lean`. *Node* `PadicHodgeTheory:P8:local-rational/de-rham-period-sheaf`.

Let X be locally noetherian over Spa(Q_p, Z_p). The de Rham sheaf B_dR is the sheaf associated to U ↦ B_dR^+(U)[1/t_U], where t_U is any generator of Fil¹B_dR^+(U) that is a nonzerodivisor (such generators exist on the affinoid perfectoid basis and are unique up to units), with the filtration Fil^i B_dR := Σ_{j∈Z} t^{-j} Fil^{i+j} B_dR^+. Equivalently, on X_proét/X_K with K the completion of Q_p(μ_{p^∞}), B_dR = B_dR^+[1/t] for t = log([ε]) (R06.1/fontaine-element-t), and this sheaf descends to X_proét because Gal(Q_p(μ_{p^∞})/Q_p) multiplies t by a unit.

*Hypotheses.* Well-definedness: two local generators differ by a unit, so the localisations agree (previous nodes). t = log([ε]) ∈ Fil¹B_dR^+(K, K^+) generates Fil¹ and γ(t) = χ(γ)t (R06.1/fontaine-element-t).

*API.*

- `DeRhamSheaf` (*data*) — B_dR := B_dR^+[1/t] on X_proét, a sheaf of B_dR^+-algebras.
- `DeRhamSheaf.fil` (*structure*) — The exhaustive separated decreasing filtration Fil^i B_dR = Σ_j t^{-j}Fil^{i+j}B_dR^+, multiplicative, with Fil⁰B_dR = B_dR^+.
- `DeRhamSheaf.t_isUnit` (*characterisation*) — Every local generator of Fil¹B_dR^+ is a unit in B_dR, and Fil^i B_dR = t^i B_dR^+ locally.
- `DeRhamSheaf.sections_affinoidPerfectoid` (*compatibility*) — B_dR(U) = B_dR(R, R^+) with Fil^i = ξ^i B_dR^+(R, R^+) on affinoid perfectoid U.
- `DeRhamSheaf.gr` (*characterisation*) — gr^i B_dR ≅ Ô_X(i) for every i ∈ Z (node graded-de-rham-period-sheaf-tate-twist).
- `DeRhamSheaf.map` (*functoriality*) — Functoriality in X compatible with Fil, extending that of B_dR^+.

*Used by.*

- Scholze, Definition 6.8 (iv) — OB_dR = OB_dR^+[t^{-1}] uses the same generator
- Scholze, Theorem 7.6 and Definition 7.5 — associated local systems compare M ⊗ OB_dR with E ⊗ OB_dR
- Scholze, Theorems 7.11 and 8.4 — H^i(X_k̄, M) ⊗ B_dR ≅ H^i_dR(X, E) ⊗ B_dR
- PadicHodgeTheory R06.2 (period functors) — the value of B_dR on geometric points is Fontaine's B_dR used by D_dR
- Tan–Tong, Corollary 2.25 — B_cris ⊂ B_dR with Fil^i B_cris = B_cris ∩ Fil^i B_dR

*Unit tests.* A wrong definition fails one of these.

- `DeRhamSheaf.sections_point` (compatibility) — For X = Spa(C, O_C) with C the completion of an algebraic closure of Q_p, B_dR(Spa C) is Fontaine's B_dR, isomorphic to Mathlib's BDeRham (PadicComplexInt p) p compatibly with the maps from BDeRhamPlus.
- `DeRhamSheaf.fil_zero` (characterisation) — Fil⁰B_dR = B_dR^+ as subsheaves of B_dR.
- `DeRhamSheaf.gr_neg_one` (computation) — gr^{-1}B_dR ≅ Ô_X(−1), generated locally by the class of t^{-1}.
- `DeRhamSheaf.not_p_localization` (non-example) — B_dR^+[1/p] = B_dR^+ ≠ B_dR: inverting p does not invert t, and t^{-1} ∉ B_dR^+(U) for U affinoid perfectoid.

*Construction.*

1. On the affinoid perfectoid basis define B_dR(U) = B_dR^+(U)[1/ξ]; for U → V the restriction map sends a generator to a generator, so these glue to a presheaf on the basis satisfying the sheaf condition (it is a filtered colimit of copies of B_dR^+ along multiplication by ξ, and B_dR^+ is a sheaf; cohomology of coherent objects commutes with filtered colimits).
2. The filtration is the colimit filtration; locally Fil^j B_dR^+ = t^j B_dR^+ for j ≥ 0, so t^{-j}Fil^{i+j}B_dR^+ = t^i B_dR^+ for i + j ≥ 0 and Fil^i B_dR = t^i B_dR^+; in particular Fil⁰B_dR = B_dR^+.
3. Over X_K use t = log[ε]; the Galois group Gal(Q_p(μ_{p^∞})/Q_p) acts on t through χ, so the subsheaf B_dR^+[1/t] is Galois-stable and descends along X_K → X (Proposition 3.15, A1).

*Acceptance.*

- On an affinoid perfectoid U: B_dR(U) = B_dR^+(R, R^+)[1/ξ] = B_dR(R, R^+) with Fil^i = ξ^i B_dR^+(R, R^+) (R06.1).
- On X = Spa(C, O_C): B_dR(Spa C) is Fontaine's field B_dR, i.e. Mathlib's BDeRham (PadicComplexInt p) p after R06.1's identification.

*Uses.* `PadicHodgeTheory:P8:local-rational/period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/rational-acyclicity-of-de-rham-period-sheaves`, `PadicHodgeTheory:R06.1/fontaine-element-t`, `PadicHodgeTheory:R06.1/de-rham-period-ring`, `AdicEtaleGeometry:A1`, `mathlib:BDeRham`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 6, Definition 6.1 (iii) and Remark 6.2, p. 35 (extraction lines 2019-2029): “We will see that locally on Xproét, the element t exists, is unique up to a unit and is not a zero-divisor. This shows that the sheaf BdR and its filtration are well-defined.” The definition of B_dR as B_dR^+[t^{-1}] and the reason it is well defined.

#### Definition. The positive structural de Rham sheaf OB_dR^+ (corrected definition) with θ and its filtration

*Module* `TauCeti/PadicHodge/PeriodSheaves/StructuralDeRham.lean`. *Node* `PadicHodgeTheory:P8:local-rational/corrected-structural-de-rham-sheaf`.

Let X be smooth over Spa(k, O_k), k a complete discretely valued extension of Q_p with perfect residue field κ; set Ω^i_X := ν^*Ω^i_{X_ét} on X_proét. For an affinoid perfectoid U = lim U_i in X_proét with U_i = Spa(R_i, R_i^+) and completed direct limit (R, R^+), let S_i(U) be the ker θ-adic completion of (R_i^+ ⊗̂_{W(κ)} A_inf(R, R^+))[1/p], where ⊗̂ is the p-adic completion of the tensor product (A_inf(R, R^+) = W(R♭+) is a W(κ)-algebra through κ → R♭+) and θ: (R_i^+ ⊗̂_{W(κ)} A_inf(R, R^+))[1/p] → R is the tensor product of R_i^+ → R^+ with θ: A_inf(R, R^+) → R^+, inverted at p. The positive structural de Rham sheaf OB_dR^+ is the sheaf on X_proét associated to the presheaf U ↦ colim_i S_i(U) on the affinoid perfectoid basis. It carries θ: OB_dR^+ → Ô_X, the filtration Fil^r OB_dR^+ := (ker θ)^r OB_dR^+ (closure of the r-th power in the ker θ-adic topology, r ≥ 0), and ring maps O_X → OB_dR^+ (from R_i → S_i) and B_dR^+ → OB_dR^+ (from A_inf(R, R^+)[1/p] → S_i, completed) compatible with θ. The original definition lim_n (O_X ⊗_{W(κ)} B_inf)/(ker θ)^n of Definition 6.8 (iii) is not used.

*Hypotheses.* X smooth over Spa(k, O_k), where k is a complete discretely valued extension of Q_p with perfect residue field κ and W(κ) ⊂ O_k. A_inf(R, R^+) = W(R♭+) and θ are the values of AI.3's A_inf on affinoid perfectoids (period-sheaves-on-affinoid-perfectoids); the affinoid perfectoid basis of X_proét is AI.3's. The presheaf is defined on the affinoid perfectoid basis; the colimit over i is independent of the presentation because cofinal presentations give the same colimit (erratum item (3); the source asserts this implicitly).

*API.*

- `StructuralDeRhamPlusSheaf` (*data*) — OB_dR^+ on X_proét, a sheaf of B_dR^+-algebras and of O_X-algebras.
- `StructuralDeRhamPlusSheaf.sectionRing` (*constructor*) — For an affinoid perfectoid presentation U = lim Spa(R_i, R_i^+), the ring S_i(U) = ker θ-adic completion of (R_i^+ ⊗̂_{W(κ)} W(R♭+))[1/p] and the map colim_i S_i(U) → OB_dR^+(U).
- `StructuralDeRhamPlusSheaf.theta` (*projection*) — θ: OB_dR^+ → Ô_X, surjective, restricting to O_X → Ô_X and to θ on B_dR^+.
- `StructuralDeRhamPlusSheaf.fil` (*structure*) — The ker θ-adic filtration Fil^r OB_dR^+, decreasing, multiplicative, with OB_dR^+ = lim_r OB_dR^+/Fil^r and B_dR^+ ∩ Fil^r OB_dR^+ = Fil^r B_dR^+.
- `StructuralDeRhamPlusSheaf.algebraMap_O` (*structure*) — The ring map O_X → OB_dR^+ compatible with θ.
- `StructuralDeRhamPlusSheaf.algebraMap_BdR` (*structure*) — The ring map B_dR^+ → OB_dR^+ compatible with θ and filtrations.
- `StructuralDeRhamPlusSheaf.map` (*functoriality*) — For a morphism g: X' → X of smooth adic spaces over k, g^{-1}OB_dR^+_X → OB_dR^+_{X'} compatible with θ, Fil and the structure maps.

*Used by.*

- Scholze, Proposition 6.10 and the erratum's strengthened form — local description B_dR^+[[X_1, …, X_n]]
- Scholze, Corollaries 6.13-6.15 — Poincaré lemma, Faltings's extension and gr^• OB_dR
- Scholze, Theorems 7.2 and 7.6 — OB_dR^+-modules with integrable connection and association with filtered modules
- CohomologyComparisons CP.3 (BMS1 Theorem 13.1, proof on p. 115) — the lower row R_K ⊗̂_K B_dR^+ → OB_dR^+(R_∞,Σ) encodes Scholze's comparison
- HodgeTateAndCanonicalSubgroups T6:comparison — the logarithmic structural de Rham sheaves follow the same corrected construction on pro-Kummer-étale sites
- Tan–Tong, Proposition 2.23 — OB_cris^+ embeds into OB_dR^+

*Unit tests.* A wrong definition fails one of these.

- `StructuralDeRhamPlusSheaf.torus_sections` (computation) — For X = Tⁿ over k, K a perfectoid completion of an algebraic extension of k and U = X̃_K: OB_dR^+(U) ≅ B_dR^+(R̃, R̃^+)[[X_1, …, X_n]] with R̃ = K⟨T_i^{±1/p^∞}⟩ and X_i ↦ T_i ⊗ 1 − 1 ⊗ [T_i♭].
- `StructuralDeRhamPlusSheaf.point` (degenerate) — For X = Spa(k, O_k) (dimension 0), B_dR^+ → OB_dR^+ is an isomorphism: for affinoid perfectoid U over X presented by finite extensions k_i of k, S_i(U) is the ker θ-adic completion of k_i ⊗_{K_0} B_inf(U), and k_i ⊗_{K_0} B_dR^+(U) is a finite product of copies of B_dR^+(U) indexed by the K_0-embeddings of k_i, of which θ selects one; so S_i(U) = B_dR^+(U).
- `StructuralDeRhamPlusSheaf.theta_restrict` (characterisation) — θ ∘ (O_X → OB_dR^+) is the canonical map O_X → Ô_X and θ ∘ (B_dR^+ → OB_dR^+) is θ of B_dR^+.
- `StructuralDeRhamPlusSheaf.uncorrected_non_example` (non-example) — For X = T¹ and U = X̃_K, the ker θ-adic completion S_i^old of (R_i^+ ⊗_{W(κ)} A_inf(R, R^+))[1/p] without p-adic completion does not satisfy S_i^old → B_dR^+(R, R^+)[[X]] → S_i^old = identity (erratum item (3)); the corrected S_i does.

*Construction.*

1. For each i, form the p-adically completed tensor product R_i^+ ⊗̂_{W(κ)} W(R♭+), invert p, and complete along ker θ (Mathlib's AdicCompletion construction, as in BDeRhamPlus).
2. Transition maps R_i^+ → R_{i+1}^+ induce S_i(U) → S_{i+1}(U); take the colimit; maps U' → U of affinoid perfectoids induce maps of presentations and hence of colimits.
3. Sheafify on the basis (A1); θ, Fil, and the maps from O_X and B_dR^+ are defined on the presheaf level and pass to the sheaf.

*Acceptance.*

- For X = Tⁿ and U ∈ X_proét/X̃_K affinoid perfectoid: OB_dR^+(U) = B_dR^+(R, R^+)[[X_1, …, X_n]] with X_i ↦ T_i ⊗ 1 − 1 ⊗ [T_i♭] (node local-structure-of-structural-de-rham-sheaf).
- The corrected and the original definitions differ: with the original (uncompleted) tensor product the composite S_i → B_dR^+(R, R^+)[[X]] → S_i of the erratum is not the identity.

*Uses.* `PadicHodgeTheory:P8:local-rational/period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/proetale-structure-sheaves-and-valuations`, `AInfCohomology:AI.3`, `AdicEtaleGeometry:A1`, `AdicEtaleGeometry:A2`, `mathlib:AdicCompletion`, `mathlib:Algebra.TensorProduct.instCommRing`, `mathlib:WittVector.fontaineTheta`.

*Planet:* Structural de Rham sheaf OB_dR^+.

*Sources.*

- Erratum to p-adic Hodge theory for rigid-analytic varieties, Item (3), pp. 1-2: “Then OB+dR is the sheafification of the presheaf sending U to the direct limit over i of the ker θ-adic completion of (Ri+ ⊗̂W(κ) Ainf(R, R+))[1/p]. Here, the completed tensor product is the p-adic completion of the tensor product” The corrected construction required verbatim by the P8 stage text.
- p-adic Hodge theory for rigid-analytic varieties, Section 6, Definition 6.8 (i)-(iii), p. 37 (extraction lines 2145-2156): “(i) The sheaf of differentials Ω1X = ν∗Ω1Xét, and its exterior powers ΩiX.” The differentials used for the connection; items (ii)-(iii) of the definition are superseded by the erratum.

#### Construction. The connection ∇ on the corrected OB_dR^+

*Module* `TauCeti/PadicHodge/PeriodSheaves/StructuralDeRham.lean`. *Node* `PadicHodgeTheory:P8:local-rational/structural-de-rham-sheaf-connection`.

X smooth over Spa(k, O_k), where k is a complete discretely valued extension of Q_p with perfect residue field κ and W(κ) ⊂ O_k. There is a unique B_dR^+-linear map ∇: OB_dR^+ → OB_dR^+ ⊗_{O_X} Ω¹_X satisfying the Leibniz rule, continuous for the ker θ-adic topology and restricting to d: O_X → Ω¹_X on O_X; it is integrable (∇ ∘ ∇ = 0 on the de Rham complex OB_dR^+ ⊗ Ω^•_X) and satisfies Griffiths transversality ∇(Fil^r OB_dR^+) ⊂ Fil^{r−1}OB_dR^+ ⊗_{O_X} Ω¹_X.

*Hypotheses.* X smooth over Spa(k, O_k), where k is a complete discretely valued extension of Q_p with perfect residue field κ and W(κ) ⊂ O_k. Ω¹ of R_i: the continuous differentials Ω¹_{R_i} = Ω̂¹_{R_i^+/W(κ)}[1/p], finite projective over R_i and étale-local (A2); Ω¹_{R_{i+1}} = R_{i+1} ⊗_{R_i} Ω¹_{R_i} for étale R_i → R_{i+1}. The source (Remark 6.9) constructs ∇ for the superseded definition; the erratum does not restate it. This construction supplies it for the corrected sheaf (packet-authored), closing the gap recorded by the reviewed decomposition.

*API.*

- `StructuralDeRhamPlusSheaf.connection` (*constructor*) — ∇: OB_dR^+ → OB_dR^+ ⊗_{O_X} Ω¹_X, B_dR^+-linear, continuous for the ker θ-adic topology.
- `StructuralDeRhamPlusSheaf.connection_leibniz` (*relation*) — ∇(fg) = f∇g + g∇f and ∇ restricts to d on O_X.
- `StructuralDeRhamPlusSheaf.connection_integrable` (*relation*) — The induced maps OB_dR^+ ⊗ Ω^i_X → OB_dR^+ ⊗ Ω^{i+1}_X compose to zero.
- `StructuralDeRhamPlusSheaf.connection_griffiths` (*relation*) — ∇(Fil^r OB_dR^+) ⊂ Fil^{r−1}OB_dR^+ ⊗ Ω¹_X for r ≥ 1.
- `StructuralDeRhamPlusSheaf.connection_unique` (*characterisation*) — Any B_dR^+-linear, ker θ-adically continuous derivation OB_dR^+ → OB_dR^+ ⊗ Ω¹_X restricting to d on O_X equals ∇.
- `StructuralDeRhamPlusSheaf.connection_map` (*functoriality*) — For an étale g: X' → X, g^{-1}∇_X = ∇_{X'} under g^{-1}OB_dR^+_X ≅ OB_dR^+_{X'}.

*Used by.*

- Scholze, Corollary 6.13 — the Poincaré lemma is the exactness of the de Rham complex of ∇
- Scholze, Theorems 7.2 and 7.6 — horizontal sections of M ⊗ OB_dR^+ recover the B_dR^+-local system
- Scholze, Proposition 8.5 — the relative connection ∇_{X/Y} is ∇ followed by Ω¹_X → Ω¹_{X/Y}
- Reviewed decomposition, gap 'Connection on the corrected OB_dR^+' — the construction and ∇(u_i) = dT_i ⊗ 1 are needed by the Poincaré lemma
- HodgeTateAndCanonicalSubgroups T6:comparison — the logarithmic connection extends this one

*Unit tests.* A wrong definition fails one of these.

- `StructuralDeRhamPlusSheaf.connection_coordinates` (computation) — Under OB_dR^+|_{X̃} ≅ B_dR^+|_{X̃}[[X_1, …, X_n]], ∇(X_i) = dT_i and ∇(f) = Σ_i ∂f/∂X_i ⊗ dT_i.
- `StructuralDeRhamPlusSheaf.connection_kernel` (characterisation) — The kernel of ∇ on OB_dR^+ is the image of B_dR^+.
- `StructuralDeRhamPlusSheaf.connection_dim_zero` (degenerate) — For X = Spa(k, O_k), Ω¹_X = 0 and ∇ = 0.
- `StructuralDeRhamPlusSheaf.connection_not_O_linear` (non-example) — ∇ is not O_X-linear: on X = T¹, ∇(T ⊗ 1) = dT while ∇(1) = 0.

*Construction.*

1. On R_i^+ ⊗_{W(κ)} W(R♭+) put ∇_i := d ⊗ 1 with values in (R_i^+ ⊗ W(R♭+)) ⊗_{R_i^+} Ω̂¹_{R_i^+}; it is W(R♭+)-linear, satisfies Leibniz and is p-adically continuous, so it extends to the p-adic completion and to the localisation at p.
2. Leibniz gives ∇_i((ker θ)^m) ⊂ (ker θ)^{m−1}·(… ⊗ Ω¹), so ∇_i is continuous for the ker θ-adic topology and extends to S_i(U) with values in S_i(U) ⊗_{R_i} Ω¹_{R_i} (finite projective, so completion commutes with ⊗).
3. Compatibility with i → i + 1 from Ω¹_{R_{i+1}} = R_{i+1} ⊗ Ω¹_{R_i}; pass to the colimit and sheafify; the target becomes OB_dR^+ ⊗_{O_X} Ω¹_X as Ω¹_X = ν^*Ω¹_{X_ét} has sections colim Ω¹_{R_i} on U.
4. Uniqueness: a B_dR^+-linear continuous derivation extending d is determined on the image of O_X ⊗ B_inf, which is dense for the ker θ-adic topology in each S_i(U).
5. Integrability and Griffiths transversality hold on R_i ⊗ W(R♭+)[1/p] (d ∘ d = 0; Leibniz) and pass to completions.

*Acceptance.*

- In the coordinates of node local-structure-of-structural-de-rham-sheaf, ∇(X_i) = dT_i and ∇ = Σ_i ∂/∂X_i ⊗ dT_i (node connection-and-filtration-in-local-coordinates).
- The horizontal sections are B_dR^+ (degree 0 of the Poincaré lemma).

*Uses.* `PadicHodgeTheory:P8:local-rational/corrected-structural-de-rham-sheaf`, `AdicEtaleGeometry:A2`, `AdicEtaleGeometry:A1`, `mathlib:KaehlerDifferential`, `mathlib:AdicCompletion`.

*Sources.*

- p-adic Hodge theory for rigid-analytic varieties, Section 6, Remark 6.9, p. 37 (extraction lines 2169-2180): “Also note that the sheaf OBinf admits a unique Binf-linear connection ∇ : OBinf → OBinf ⊗OX Ω1X, extending the one on OX. This connection extends uniquely to the completion” The connection for the superseded definition; transferred here to the corrected completion.
- Erratum to p-adic Hodge theory for rigid-analytic varieties, Item (3), p. 2: “We correct the definition as follows; the results of the paper are not affected.” The erratum asserts that the results, including those using ∇, survive; the node supplies the construction.

#### Construction. The O_X-algebra structure on B_dR^+[[X_1, …, X_n]] over the perfectoid toric cover

*Module* `TauCeti/PadicHodge/PeriodSheaves/StructuralDeRham.lean`. *Node* `PadicHodgeTheory:P8:local-rational/structural-algebra-structure-on-bdr-power-series`.

X smooth over Spa(k, O_k), where k is a complete discretely valued extension of Q_p with perfect residue field κ and W(κ) ⊂ O_k, with an étale map X → Tⁿ which is a composite of rational embeddings and finite étale maps; K a perfectoid completion of an algebraic extension of k, X̃ = X ×_{Tⁿ} T̃ⁿ and X̃_K its base change, viewed in X_proét. There is a unique structure of O_X|_{X̃_K}-algebra on B_dR^+|_{X̃_K}[[X_1, …, X_n]] such that T_i ↦ [T_i♭] + X_i and the composite O_X → B_dR^+[[X]] → B_dR^+[[X]]/(ker θ') = Ô_X is the canonical map (θ'(X_i) = 0).

*Hypotheses.* X smooth over Spa(k, O_k), where k is a complete discretely valued extension of Q_p with perfect residue field κ and W(κ) ⊂ O_k. T_i♭ = (T_i, T_i^{1/p}, …) ∈ Ô^+_{X♭}(X̃) = lim_Φ O_X^+/p; [T_i♭] ∈ A_inf(X̃) with θ([T_i♭]) = T_i (AI.3). B_dR^+(U)[[X]] is complete for the ideal ker θ' = (ξ, X_1, …, X_n) with quotient R = Ô_X(U) on affinoid perfectoid U (period-sheaves-on-affinoid-perfectoids).

*API.*

- `PowerSeriesStructure.algebraMap` (*constructor*) — The ring map O_X|_{X̃_K} → B_dR^+|_{X̃_K}[[X_1, …, X_n]].
- `PowerSeriesStructure.algebraMap_T` (*simp*) — T_i ↦ [T_i♭] + X_i, and T_i^{-1} ↦ ([T_i♭] + X_i)^{-1}.
- `PowerSeriesStructure.theta_comp` (*compatibility*) — θ' ∘ algebraMap equals the canonical O_X → Ô_X.
- `PowerSeriesStructure.unique` (*characterisation*) — Any ring map O_X|_{X̃_K} → B_dR^+[[X]] with T_i ↦ [T_i♭] + X_i compatible with θ' equals algebraMap.
- `PowerSeriesStructure.map_etale` (*functoriality*) — For X' → X étale over Tⁿ, the structures are compatible under restriction.

*Used by.*

- Scholze, Proposition 6.10 and erratum item (3) — induces OB_dR^+|_{X̃_K} → B_dR^+[[X]], inverse to X_i ↦ u_i
- CohomologyComparisons CP.3 (BMS1 §13) — the analogous embedding systems D_Σ(R) → B_dR^+ lift coordinates the same way
- Tan–Tong, Lemma 2.14 — the crystalline analogue O^{ur}_X → A_cris{⟨u⟩}, T_i ↦ u_i + [T_i♭]

*Unit tests.* A wrong definition fails one of these.

- `PowerSeriesStructure.algebraMap_inv_T` (computation) — The image of T_i^{-1} is [T_i♭]^{-1} Σ_{m≥0} (−X_i/[T_i♭])^m.
- `PowerSeriesStructure.torus` (degenerate) — For X = T¹, the image of T^{1/p} (in the finite étale cover T¹ → T¹, T ↦ T^p, viewed inside X̃) is [T^{♭,1/p}]·Σ_m binom(1/p, m)(X/[T♭])^m.
- `PowerSeriesStructure.theta_comp_test` (compatibility) — θ'(algebraMap(f)) = f in Ô_X for f ∈ O_X, e.g. θ'([T♭] + X) = T.
- `PowerSeriesStructure.not_equivariant` (non-example) — The specialisation X_i ↦ 0 is not Z_p^n-equivariant: γ_i([T_i♭]) = [ε][T_i♭] ≠ [T_i♭] while γ_i(T_i) = T_i.

*Construction.*

1. W(κ)[1/p][T^{±1}] → B_dR^+|_{X̃_K}[[X]], T_i ↦ [T_i♭] + X_i: well defined since [T_i♭] + X_i ≡ [T_i♭] modulo ker θ' and [T_i♭] is invertible (T_i is), so [T_i♭] + X_i is invertible in the complete ring.
2. For affinoid perfectoid U = lim U_i over X̃_K, apply Lemma 6.12 (node etale-algebras-over-torus-models) to U_i → Tⁿ to get R_{i0}^+ with R_{i0} étale over W(κ)[1/p][T^{±1}].
3. Hensel (formal étaleness along the complete ideal ker θ'): R_{i0} → R_i → R lifts uniquely to R_{i0} → B_dR^+(U)[[X]] over the map on W(κ)[1/p][T^{±1}]; this gives lifts of R_{i0}^+.
4. Extend to the p-adic completion R_i^+ by Lemma 6.11 (node bdr-plus-power-series-extension-lemma), invert p to get R_i = O_X(U_i) → B_dR^+(U)[[X]]; take the colimit over i (O_X(U) = colim O_X(U_i)) and sheafify; uniqueness at each step gives independence of choices and functoriality in U.

*Acceptance.*

- For X = Tⁿ the structure is the substitution T_i ↦ [T_i♭] + X_i on K_0[T^{±1}] extended by continuity.
- Specialising X_i ↦ 0 gives a lift O_X|_{X̃_K} → B_dR^+|_{X̃_K} which is not Z_p^n-equivariant, so it does not descend to X.

*Uses.* `PadicHodgeTheory:P8:local-rational/period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/bdr-plus-power-series-extension-lemma`, `PadicHodgeTheory:P8:local-rational/etale-algebras-over-torus-models`, `PadicHodgeTheory:P8:local-rational/proetale-structure-sheaves-and-valuations`, `AInfCohomology:AI.3`, `mathlib:MvPowerSeries`.

*Sources.*

- p-adic Hodge theory for rigid-analytic varieties, Section 6, proof of Proposition 6.10, pp. 38-39 (extraction lines 2203-2207): “The crucial point is to show that B+dR|X̃K[[X1, ..., Xn]] admits a unique OX|X̃K-algebra structure, sending Ti to [Ti♭] + Xi and compatible with the structure on B+dR[[X1, ..., Xn]]/(ker θ) = ÔX.” The statement of the construction.
- p-adic Hodge theory for rigid-analytic varieties, Section 6, end of the proof of Proposition 6.10, p. 39 (extraction lines 2254-2265): “By Hensel’s lemma, we can lift Ri0 uniquely to B+dR(U)[[X1, ..., Xn]], hence we get lifts of R+i0. These extend to the p-adic completion, hence we get lifts of OX+(Ui), and thus of OX(Ui).” The lifting argument.

#### Definition. The structural de Rham sheaf OB_dR = OB_dR^+[1/t] with filtration and connection

*Module* `TauCeti/PadicHodge/PeriodSheaves/StructuralDeRham.lean`. *Node* `PadicHodgeTheory:P8:local-rational/structural-de-rham-sheaf`.

X smooth over Spa(k, O_k), where k is a complete discretely valued extension of Q_p with perfect residue field κ and W(κ) ⊂ O_k. Define OB_dR := OB_dR^+[1/t] for a local generator t of Fil¹B_dR^+ (well defined as in node de-rham-period-sheaf), with Fil^r OB_dR := Σ_{j∈Z} t^{-j} Fil^{r+j} OB_dR^+ and the B_dR-linear extension ∇: OB_dR → OB_dR ⊗_{O_X} Ω¹_X (∇(t) = 0). The filtration is decreasing, separated and exhaustive, Fil⁰OB_dR ⊇ OB_dR^+ and OB_dR^+ ∩ Fil^r OB_dR = Fil^r OB_dR^+ for r ≥ 0; ∇ satisfies Griffiths transversality.

*Hypotheses.* X smooth over Spa(k, O_k), where k is a complete discretely valued extension of Q_p with perfect residue field κ and W(κ) ⊂ O_k. t ∈ Fil¹B_dR^+ ⊂ Fil¹OB_dR^+ is a nonzerodivisor on OB_dR^+ (local description).

*API.*

- `StructuralDeRhamSheaf` (*data*) — OB_dR := OB_dR^+[1/t], a sheaf of B_dR-algebras and O_X-algebras on X_proét.
- `StructuralDeRhamSheaf.fil` (*structure*) — The exhaustive separated decreasing filtration Fil^r OB_dR, multiplicative, with Fil^r OB_dR·Fil^s B_dR ⊂ Fil^{r+s} OB_dR.
- `StructuralDeRhamSheaf.connection` (*constructor*) — The B_dR-linear integrable connection ∇ on OB_dR satisfying Griffiths transversality.
- `StructuralDeRhamSheaf.plus_inter_fil` (*characterisation*) — OB_dR^+ ∩ Fil^r OB_dR = Fil^r OB_dR^+ for r ≥ 0.
- `StructuralDeRhamSheaf.gr` (*characterisation*) — gr^r OB_dR is locally isomorphic to gr⁰OB_dR, a polynomial ring in n = dim X variables over Ô_X (node graded-structural-de-rham-sheaf-local-description).
- `StructuralDeRhamSheaf.pushforward` (*compatibility*) — ν_*OB_dR = O_{X_ét} (node pushforward-of-structural-de-rham-sheaf).

*Used by.*

- Scholze, Definition 7.5 and Theorem 7.6 — M ⊗ OB_dR ≅ E ⊗ OB_dR defines association; M = Fil⁰(E ⊗ OB_dR)^{∇=0}
- Scholze, Proposition 6.16 and Corollary 6.19 — cohomology of gr^i OB_dR and ν_*OB_dR = O_{X_ét}
- Scholze, Theorems 7.11 and 8.8 — DR(E) ⊗ OB_dR computes the de Rham side of the comparison
- Tan–Tong, Corollaries 2.25-2.26 — OB_cris ⊂ OB_dR and w_*OB_cris = O_{X_ét}[1/p]
- HodgeTateAndCanonicalSubgroups T1 — E ⊗ OB_dR for E = H¹_dR of an abelian family

*Unit tests.* A wrong definition fails one of these.

- `StructuralDeRhamSheaf.gr_zero_torus` (computation) — Over X̃_K for X = Tⁿ: gr⁰OB_dR = Ô_X[V_1, …, V_n] with V_i the class of t^{-1}log([T_i♭]/T_i).
- `StructuralDeRhamSheaf.point` (degenerate) — For X = Spa(k, O_k): OB_dR = B_dR with the t-adic filtration and ∇ = 0.
- `StructuralDeRhamSheaf.pushforward_eq` (compatibility) — ν_*OB_dR = O_{X_ét} (so global sections on an affinoid X = Spa(R, R^+) are R).
- `StructuralDeRhamSheaf.gr_zero_not_OX` (non-example) — For dim X = n ≥ 1, gr⁰OB_dR ≠ Ô_X: over X̃_K it is a polynomial ring in n variables over Ô_X.

*Construction.*

1. Localise at t locally and glue (as for B_dR).
2. The filtration statements are read off from the local description OB_dR^+ = B_dR^+[[X_1, …, X_n]] with the (ξ, X_1, …, X_n)-adic filtration (node connection-and-filtration-in-local-coordinates): there OB_dR = B_dR^+[[X]][1/ξ] and OB_dR^+ ∩ ξ^{-j}(ξ, X)^{r+j} = (ξ, X)^r because gr of B_dR^+[[X]] is the polynomial ring R[ξ, X_1, …, X_n] in which ξ is a nonzerodivisor.
3. ∇ extends B_dR-linearly since t is horizontal.

*Acceptance.*

- Over X̃_K for X = Tⁿ: gr⁰OB_dR = Ô_X[X_1/ξ, …, X_n/ξ] (node graded-structural-de-rham-sheaf-local-description).
- ν_*OB_dR = O_{X_ét} (node pushforward-of-structural-de-rham-sheaf).

*Uses.* `PadicHodgeTheory:P8:local-rational/corrected-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/structural-de-rham-sheaf-connection`, `PadicHodgeTheory:P8:local-rational/de-rham-period-sheaf`, `PadicHodgeTheory:P8:local-rational/connection-and-filtration-in-local-coordinates`.

*Sources.*

- p-adic Hodge theory for rigid-analytic varieties, Section 6, Definition 6.8 (iv) and Remark 6.9, p. 37 (extraction lines 2157-2180): “Because locally on Xproét, the element t exists and is unique up to a unit and not a zero-divisor, the sheaf OBdR and its filtrations are well-defined.” The definition of OB_dR and its filtration, carried over to the corrected OB_dR^+.
- Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.4, p. 20 (extraction lines 1268-1276): “The filtration on OB+dR is decreasing, separated and exhaustive. Moreover, as in [Bri, 5.2.8, 5.2.9], one shows that OB+dR ∩ Filr OBdR = Filr OB+dR” The intersection property of the filtrations, proved here from the local description instead of Brinon's memoir.

#### Definition. The crystalline period sheaves A_cris, B_cris^+, B_cris and their filtrations

*Module* `TauCeti/PadicHodge/PeriodSheaves/Crystalline.lean`. *Node* `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves`.

Let X a locally noetherian adic space over Spa(k, O_k), k complete discretely valued over Q_p with perfect residue field κ, k̄ an algebraic closure and X_k̄ = lim X_{k'} ∈ X_proét. Define A_cris as the p-adic completion of the PD envelope A_cris^0 of A_inf = W(Ô^+_{X♭}) along the ideal sheaf ker(θ: A_inf → Ô_X^+) (compatible with the canonical divided powers on p), B_cris^+ := A_cris[1/p]; Fil^r A_cris := image of lim_n Fil^r A_cris^0/p^n → A_cris for the PD filtration Fil^r A_cris^0 = (ker θ)^{[r]} (r ≥ 0), Fil^r B_cris^+ := Fil^r A_cris[1/p]. On X_proét/X_k̄, t := log([ε]) = −Σ_{n≥1}(1 − [ε])^n/n ∈ Fil¹A_cris is defined (ε a compatible system of p-power roots of unity), and B_cris := B_cris^+[1/t] with Fil^r B_cris := Σ_{s∈Z} t^{-s}Fil^{r+s}B_cris^+. On X_proét/X_k̄: with ξ = [p♭] − p, ker θ = (ξ) and A_cris^0 = A_inf[ξ^n/n! : n ≥ 0] ⊂ B_inf, Fil^r A_cris^0 = A_inf[ξ^n/n! : n ≥ r], gr^r A_cris ≅ Ô_X^+·ξ^{[r]} ≅ Ô_X^+ and A_cris is p-torsion free.

*Hypotheses.* X locally noetherian over Spa(k, O_k); A_inf and θ from AI.3; PD envelopes of sheaves of rings along ideal sheaves and their p-adic completion from CrystallineCohomology CR.0 (sheafifying the ring-level PD envelope on the affinoid perfectoid basis). t ∈ Fil¹A_cris because 1 − [ε] ∈ ker θ and Fil¹A_cris is a PD ideal; the definition of B_cris is on X_proét/X_k̄ (where ε exists) and descends because g(t) = χ(g)t.

*API.*

- `CrystallinePeriodSheaf.Acris` (*data*) — A_cris on X_proét, the p-adically completed PD envelope of (A_inf, ker θ).
- `CrystallinePeriodSheaf.BcrisPlus` (*data*) — B_cris^+ = A_cris[1/p].
- `CrystallinePeriodSheaf.Bcris` (*data*) — B_cris = B_cris^+[1/t] on X_proét/X_k̄, descended to X_proét with its G_k-semilinear structure.
- `CrystallinePeriodSheaf.fil` (*structure*) — The PD filtration Fil^r A_cris, Fil^r B_cris^+ and Fil^r B_cris, decreasing and multiplicative.
- `CrystallinePeriodSheaf.theta` (*projection*) — θ: A_cris → Ô_X^+ with kernel Fil¹A_cris and gr^r A_cris|_{X_k̄} ≅ Ô_X^+·ξ^{[r]}.
- `CrystallinePeriodSheaf.t` (*constructor*) — t = log([ε]) ∈ Fil¹A_cris over X_k̄, with g(t) = χ(g)t for g ∈ G_k.
- `CrystallinePeriodSheaf.map` (*functoriality*) — Functoriality in X over Spa(k, O_k), compatible with θ, Fil and t.

*Used by.*

- Tan–Tong, Theorem 4.3 — the crystalline primitive comparison H^i(X_k̄,ét, L) ⊗ B_cris ≅ H^i(X_k̄,proét, L ⊗ B_cris)
- Tan–Tong, Definition 3.10 and Theorem 4.5 — crystalline lisse sheaves and the crystalline comparison with coefficients
- PadicHodgeTheory R06.2 and R06.5 — B_cris(Spa C) is Fontaine's B_cris; D_cris of geometric representations
- CohomologyComparisons CP.2 — the rational crystalline comparison uses Fontaine's B_cris, the value of this sheaf at geometric points

*Unit tests.* A wrong definition fails one of these.

- `CrystallinePeriodSheaf.sections_point` (compatibility) — For X = Spa(C, O_C), B_cris(Spa C) is Fontaine's B_cris (R06.1/crystalline-period-ring) and Fil^r B_cris(Spa C) = B_cris ∩ Fil^r B_dR.
- `CrystallinePeriodSheaf.gr_zero` (computation) — gr⁰A_cris = Ô_X^+ and gr^r A_cris|_{X_k̄} = Ô_X^+·ξ^{[r]} for r ≥ 0.
- `CrystallinePeriodSheaf.pTorsionFree` (characterisation) — A_cris has no p-torsion, so A_cris ⊂ B_cris^+.
- `CrystallinePeriodSheaf.xi_pow_div` (non-example) — ξ^p/p lies in A_cris(Spa C) but not in A_inf(Spa C) = W(O_C♭): ξ^p ≡ [p♭]^p mod p and (p♭)^p ≠ 0 in O_C♭, so ξ^p is not divisible by p in W(O_C♭); A_cris is not a completion of A_inf.

*Construction.*

1. Form the PD envelope of (A_inf, ker θ) as a sheaf (CR.0), complete p-adically, invert p; define Fil by the divided power ideals and closure.
2. On X_proét/X_k̄: ker θ = ξA_inf (R06.1 applied on the affinoid perfectoid basis), so the PD envelope is A_inf[ξ^n/n!]; p-torsion freeness and the gr^r computation follow from the exact sequences 0 → Fil^{r+1}A_cris^0 → Fil^r A_cris^0 → Ô_X^+ → 0 (aξ^{[r]} ↦ θ(a)) and their p-adic completions (Ô_X^+ is p-torsion free and p-adically complete).
3. t = log[ε] converges in A_cris; invert t.

*Acceptance.*

- On X = Spa(C, O_C) (C = completion of k̄): A_cris(Spa C) is Fontaine's A_cris of R06.1/crystalline-period-ring (up to the almost ambiguity of node crystalline-period-sheaves-on-affinoid-perfectoids, which vanishes after inverting t).
- gr⁰A_cris = Ô_X^+ and gr^r A_cris|_{X_k̄} ≅ Ô_X^+ (generated by ξ^{[r]}).

*Uses.* `AInfCohomology:AI.3`, `CrystallineCohomology:CR.0`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras`, `PadicHodgeTheory:R06.1/fontaine-element-t`, `mathlib:DividedPowers`, `mathlib:WittVector`.

*Sources.*

- Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.1, Definition 2.1, Proposition 2.2 and Corollary 2.3, pp. 5-6 (extraction lines 271-337): “Define Acris to be the p-adic completion of the PD-envelope A0cris of Ainf with respect to the ideal sheaf ker(θ) ⊂ Ainf, and define B+cris := Acris[1/p].” The definition of the crystalline period sheaves.
- Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.1, Definition 2.4, p. 6 (extraction lines 348-351): “Define Bcris = B+cris[1/t]. For r ∈ Z, set Filr Bcris = Σ_{s∈Z} t^{−s} Filr+s B+cris ⊂ Bcris.” B_cris and its filtration.

#### Construction. Frobenius φ on A_cris, B_cris^+ and B_cris

*Module* `TauCeti/PadicHodge/PeriodSheaves/Crystalline.lean`. *Node* `PadicHodgeTheory:P8:local-rational/frobenius-on-crystalline-period-sheaves`.

Let X a locally noetherian adic space over Spa(k, O_k), k complete discretely valued over Q_p with perfect residue field κ, k̄ an algebraic closure and X_k̄ = lim X_{k'} ∈ X_proét. The Witt vector Frobenius φ on A_inf = W(Ô^+_{X♭}) extends uniquely to a ring endomorphism φ of A_cris^0 (because φ(ξ) = ξ^p + p·b has all divided powers), by p-adic continuity to A_cris and B_cris^+, and to B_cris by φ(1/t) = 1/(pt), using φ(t) = log([ε]^p) = pt. φ is semilinear over the Frobenius of W(κ), commutes with the G_k-action, and does not preserve the filtration.

*Hypotheses.* X a locally noetherian adic space over Spa(k, O_k), k complete discretely valued over Q_p with perfect residue field κ, k̄ an algebraic closure and X_k̄ = lim X_{k'} ∈ X_proét.

*API.*

- `CrystallinePeriodSheaf.frobenius` (*constructor*) — The ring endomorphism φ of A_cris, B_cris^+ and B_cris extending the Witt vector Frobenius of A_inf.
- `CrystallinePeriodSheaf.frobenius_teichmuller` (*simp*) — φ([x]) = [x^p] for x ∈ Ô^+_{X♭}.
- `CrystallinePeriodSheaf.frobenius_t` (*simp*) — φ(t) = pt.
- `CrystallinePeriodSheaf.frobenius_galois` (*compatibility*) — φ commutes with the G_k-action on the sheaves over X_k̄.
- `CrystallinePeriodSheaf.frobenius_sections` (*compatibility*) — On affinoid perfectoid U, φ is induced by the Witt vector Frobenius of W(R♭+) through A_cris(R, R^+) → A_cris(U).

*Used by.*

- Tan–Tong, §2.3 and §3 — Frobenius on OA_cris and the Frobenius compatibility of crystalline comparisons
- PadicHodgeTheory R06.2 — D_cris(V) = (B_cris ⊗ V)^{G_K} with its Frobenius
- CohomologyComparisons CP.2 — Frobenius compatibility of the rational crystalline comparison

*Unit tests.* A wrong definition fails one of these.

- `CrystallinePeriodSheaf.frobenius_point` (compatibility) — On Spa(C, O_C), φ agrees with Fontaine's Frobenius on B_cris (R06.1/crystalline-period-ring).
- `CrystallinePeriodSheaf.frobenius_xi` (computation) — φ(ξ) = [p♭]^p − p and φ(ξ) ≡ ξ^p mod p A_inf.
- `CrystallinePeriodSheaf.frobenius_t_test` (computation) — φ(t) = pt, so φ(t^{-1}) = p^{-1}t^{-1}.
- `CrystallinePeriodSheaf.frobenius_not_filtered` (non-example) — φ does not preserve Fil¹: θ(φ(ξ)) = p^p − p ≠ 0 (checked for p ≤ 7 with PARI/GP).

*Construction.*

1. φ(a) ≡ a^p mod p on A_inf, so φ(ξ) = ξ^p + pb; ξ^p has divided powers (ξ^p/p = (p−1)!ξ^{[p]}) and p has divided powers in Z_p-flat rings, so φ(ker θ) generates a PD-compatible ideal and φ extends to the PD envelope (universal property, CR.0).
2. Continuity for the p-adic topology gives φ on A_cris; invert p; φ(t) = pt since φ([ε]) = [ε]^p, so φ extends to B_cris.

*Acceptance.*

- φ on B_cris(Spa C) is Fontaine's Frobenius (R06.1/crystalline-period-ring).
- θ(φ(ξ)) = p^p − p ≠ 0, so φ(Fil¹) ⊄ Fil¹.

*Uses.* `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves`, `CrystallineCohomology:CR.0`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `mathlib:WittVector.frobenius`.

*Source.* Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.3, pp. 18-19 (extraction lines 1141-1149): “Note that ϕ(t) = log([ǫp]) = pt. Consequently ϕ is extended to Bcris by setting ϕ(1/t) = 1/(pt).” The Frobenius on the crystalline period sheaves.

#### Definition. The structural crystalline period sheaves OA_cris, OB_cris^+, OB_cris with filtration and connection

*Module* `TauCeti/PadicHodge/PeriodSheaves/Crystalline.lean`. *Node* `PadicHodgeTheory:P8:local-rational/structural-crystalline-period-sheaves`.

Let k absolutely unramified (k = W(κ)[1/p], κ perfect); 𝔛 a smooth formal scheme over O_k = W(κ) of relative dimension d with rigid generic fibre X; w: X_proét → 𝔛_ét the morphism of topoi induced by Y ↦ Y_k (for Y étale over 𝔛). Put O_X^{ur+} := w^{-1}O_{𝔛_ét}, O_X^{ur} := O_X^{ur+}[1/p], OA_inf := O_X^{ur+} ⊗_{O_k} A_inf and θ_X: OA_inf → Ô_X^+ the O_X^{ur+}-linear extension of θ. Define OA_cris as the p-adic completion of the PD envelope OA_cris^0 of OA_inf along ker θ_X, OB_cris^+ := OA_cris[1/p], OB_cris := OB_cris^+[1/t]; Fil^r OA_cris := image of lim_n Fil^r OA_cris^0/p^n (Fil^r OA_cris^0 = (ker θ_X)^{[r]}), Fil^r OB_cris^+ := Fil^r OA_cris[1/p], Fil^r OB_cris := Σ_s t^{-s}Fil^{r+s}OB_cris^+. With Ω^{1,ur+}_{X/k} := w^{-1}Ω¹_{𝔛/O_k} (locally free of rank d over O_X^{ur+}), OA_inf has a unique A_inf-linear connection ∇ extending d on O_X^{ur+}; it extends uniquely to an A_cris-linear connection ∇: OA_cris → OA_cris ⊗_{O_X^{ur+}} Ω^{1,ur+}_{X/k}, and to B_cris^+- and B_cris-linear connections on OB_cris^+ and OB_cris. θ_X extends to OA_cris → Ô_X^+ with kernel Fil¹OA_cris.

*Hypotheses.* k absolutely unramified (k = W(κ)[1/p], κ perfect); 𝔛 a smooth formal scheme over O_k = W(κ) of relative dimension d with rigid generic fibre X; w: X_proét → 𝔛_ét the morphism of topoi induced by Y ↦ Y_k (for Y étale over 𝔛). The pro-étale site of X and A_inf, θ (A1, AI.3); the formal scheme 𝔛, its étale site and the generic-fibre functor (AdicSpacesPartII R2); PD envelopes (CR.0).

*API.*

- `StructuralCrystallineSheaf.OAcris` (*data*) — OA_cris on X_proét, an O_X^{ur+}-algebra and A_cris-algebra.
- `StructuralCrystallineSheaf.OBcris` (*data*) — OB_cris^+ = OA_cris[1/p] and OB_cris = OB_cris^+[1/t].
- `StructuralCrystallineSheaf.fil` (*structure*) — The PD filtration Fil^r on OA_cris, OB_cris^+ and OB_cris, with Fil¹OA_cris = ker θ_X.
- `StructuralCrystallineSheaf.connection` (*constructor*) — The A_cris-linear integrable connection ∇: OA_cris → OA_cris ⊗ Ω^{1,ur+}_{X/k}, extended to OB_cris^+ and OB_cris.
- `StructuralCrystallineSheaf.connection_griffiths` (*relation*) — ∇(Fil^r OA_cris) ⊂ Fil^{r−1}OA_cris ⊗ Ω^{1,ur+}_{X/k}.
- `StructuralCrystallineSheaf.theta` (*projection*) — θ_X: OA_cris → Ô_X^+, surjective, kernel Fil¹OA_cris.
- `StructuralCrystallineSheaf.map` (*functoriality*) — Functoriality for morphisms of smooth formal schemes over O_k, compatible with θ, Fil, ∇.

*Used by.*

- Tan–Tong, Definition 3.10 — L is crystalline if E ⊗ OB_cris ≅ L ⊗ OB_cris compatibly with ∇, Fil and φ
- Tan–Tong, Theorems 4.5 and 5.5 — the crystalline comparison with coefficients, absolute and relative
- Faltings's crystalline comparison (as cited by Tan–Tong) — association of lisse sheaves with filtered F-isocrystals
- CohomologyComparisons CP.2 — the rational crystalline comparison with coefficients extends CP.2's trivial-coefficient theorem through these sheaves

*Unit tests.* A wrong definition fails one of these.

- `StructuralCrystallineSheaf.torus_sections` (computation) — For 𝔛 étale over Spf O_k{T_1^{±1}, …, T_d^{±1}}, OA_cris|_{X̃} ≅ A_cris{⟨u_1, …, u_d⟩}|_{X̃} with u_i ↦ T_i ⊗ 1 − 1 ⊗ [T_i♭].
- `StructuralCrystallineSheaf.point` (degenerate) — For 𝔛 = Spf O_k, OA_cris = A_cris and ∇ = 0.
- `StructuralCrystallineSheaf.embeds_OBdR` (compatibility) — OB_cris^+ ↪ OB_dR^+ as a filtered subsheaf with gr^i OB_cris^+ ≅ gr^i OB_dR^+ (node structural-crystalline-to-de-rham-embedding).
- `StructuralCrystallineSheaf.not_OBdR` (non-example) — OB_cris^+ ≠ OB_dR^+: for d ≥ 1 the series Σ_n p^{-n}u_1^n lies in OB_dR^+ but not in OB_cris^+, since its coefficients in the basis u_1^{[n]} are n!/p^n, whose p-adic valuations v_p(n!) − n are unbounded below (checked with PARI/GP).

*Construction.*

1. O_X^{ur+} is the sheaf associated to U ↦ colim_{(Y, a: U → Y_k)} O_𝔛(Y) over étale Y → 𝔛; the canonical map O_X^{ur+} → O_X^+ gives θ_X.
2. Form the PD envelope of (OA_inf, ker θ_X), complete p-adically, invert p and t; define Fil by PD ideals and closures.
3. ∇ on OA_inf = O_X^{ur+} ⊗ A_inf is d ⊗ 1; it preserves the PD structure (∇(x^{[n]}) = x^{[n−1]}∇x), so it extends to OA_cris^0 and by continuity to OA_cris; A_cris-linearity is inherited.

*Acceptance.*

- For 𝔛 = Spf O_k (d = 0), OA_cris = A_cris.
- Over X̃ = X ×_{Tᵈ} T̃ᵈ for 𝔛 étale over the formal torus: OA_cris ≅ A_cris{⟨u_1, …, u_d⟩} (node local-structure-of-structural-crystalline-sheaf).

*Uses.* `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves`, `AInfCohomology:AI.3`, `AdicEtaleGeometry:A1`, `AdicSpacesPartII:R2`, `CrystallineCohomology:CR.0`, `mathlib:DividedPowers`, `mathlib:KaehlerDifferential`.

*Planet:* Crystalline period sheaf OB_cris.

*Sources.*

- Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.2, Definition 2.9, p. 13 (extraction lines 769-782): “Let OAcris be the p-adic completion of the PD-envelope OA0cris of OAinf with respect to the ideal sheaf ker(θX) ⊂ OAinf, OB+cris := OAcris[1/p], and OBcris := OB+cris[1/t] with t = log([ǫ]) defined in (2.1.6).” The definition of the structural crystalline period sheaves.
- Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.2, the paragraph after Corollary 2.16, p. 16 (extraction lines 976-1001): “An important feature of OAcris is that it has an Acris-linear connection on it.” The connection on OA_cris, OB_cris^+ and OB_cris.

#### Construction. Frobenius on OA_cris from a Frobenius lift, its horizontality and dependence on the lift

*Module* `TauCeti/PadicHodge/PeriodSheaves/Crystalline.lean`. *Node* `PadicHodgeTheory:P8:local-rational/frobenius-on-structural-crystalline-sheaf`.

Let k absolutely unramified (k = W(κ)[1/p], κ perfect); 𝔛 a smooth formal scheme over O_k = W(κ) of relative dimension d with rigid generic fibre X; w: X_proét → 𝔛_ét the morphism of topoi induced by Y ↦ Y_k (for Y étale over 𝔛), and let σ be a lift to 𝔛 of the absolute Frobenius of 𝔛_κ compatible with the Frobenius of O_k (it exists locally: on 𝔛 étale over the formal torus there is a unique lift with T_i ↦ T_i^p). Then σ induces a σ-semilinear endomorphism φ of O_X^{ur+}, and φ := σ ⊗ φ on OA_inf extends uniquely to OA_cris^0, OA_cris, OB_cris^+, OB_cris (compatibly with node frobenius-on-crystalline-period-sheaves on A_cris); under α, φ(u_i) = σ(T_i) − [T_i♭]^p. φ is horizontal: ∇ ∘ φ = (φ ⊗ dσ) ∘ ∇. For two lifts σ_1, σ_2 on a small 𝔛 with ∇ = Σ N_i ⊗ dT_i: φ_2 = Σ_{n∈N^d} Π_i (σ_2(T_i) − σ_1(T_i))^{[n_i]}·(φ_1 ∘ Π_i N_i^{n_i}).

*Hypotheses.* k absolutely unramified (k = W(κ)[1/p], κ perfect); 𝔛 a smooth formal scheme over O_k = W(κ) of relative dimension d with rigid generic fibre X; w: X_proét → 𝔛_ét the morphism of topoi induced by Y ↦ Y_k (for Y étale over 𝔛). σ exists locally (Tan–Tong Remark 2.20); φ depends on σ, but its restriction to OB_cris^{∇=0} = B_cris does not.

*API.*

- `StructuralCrystallineSheaf.frobenius` (*constructor*) — φ_σ on OA_cris, OB_cris^+, OB_cris induced by a Frobenius lift σ of 𝔛.
- `StructuralCrystallineSheaf.frobenius_u` (*simp*) — φ_σ(u_i) = σ(T_i) − [T_i♭]^p under the local description.
- `StructuralCrystallineSheaf.frobenius_horizontal` (*relation*) — ∇ ∘ φ_σ = (φ_σ ⊗ dσ) ∘ ∇.
- `StructuralCrystallineSheaf.frobenius_change_of_lift` (*relation*) — φ_{σ_2} = Σ_n Π_i(σ_2(T_i) − σ_1(T_i))^{[n_i]}·(φ_{σ_1} ∘ Π_i N_i^{n_i}).
- `StructuralCrystallineSheaf.frobenius_restrict` (*compatibility*) — φ_σ restricts on A_cris ⊂ OA_cris to the Frobenius of node frobenius-on-crystalline-period-sheaves.

*Used by.*

- Tan–Tong, §3 and Theorem 4.5 — Frobenius compatibility of the association E ⊗ OB_cris ≅ L ⊗ OB_cris for filtered F-isocrystals
- Tan–Tong, Proposition 5.1 (2) — the relative Frobenius is horizontal for ∇_{X/Y}
- PadicHodgeTheory R06.2 — the Frobenius on D_cris of crystalline representations arising from families

*Unit tests.* A wrong definition fails one of these.

- `StructuralCrystallineSheaf.frobenius_standard_lift` (computation) — With σ(T) = T^p on the formal torus, φ(u) = (u + [T♭])^p − [T♭]^p = Σ_{j≥1} binom(p, j)[T♭]^{p−j}u^j.
- `StructuralCrystallineSheaf.frobenius_point` (degenerate) — For 𝔛 = Spf O_k (d = 0), φ_σ is the Frobenius of A_cris.
- `StructuralCrystallineSheaf.frobenius_horizontal_sections` (characterisation) — On OB_cris^{∇=0} = B_cris, φ_σ is independent of σ.
- `StructuralCrystallineSheaf.frobenius_depends_on_lift` (non-example) — For σ_1(T) = T^p and σ_2(T) = T^p + pT on the formal torus, φ_{σ_2}(u) − φ_{σ_1}(u) = pT ≠ 0: φ on OA_cris is not independent of the lift.

*Construction.*

1. For Y étale over 𝔛, étaleness gives a unique σ_Y lifting Frobenius over σ; these define φ on O_X^{ur+}.
2. φ(ker θ_X) is contained in an ideal with divided powers modulo p (as for A_cris), so φ extends to the PD envelope and by continuity to OA_cris; invert p and t (φ(t) = pt).
3. Horizontality: check on u_i^{[n]} under α (A_cris-linearity), using ∇(φ(u_i)) = dσ(T_i).
4. Change of lift: both sides are A_cris-φ-semilinear; evaluate on u^{[m]}: Σ_n (φ_2(u) − φ_1(u))^{[n]}φ_1(u)^{[m−n]} = φ_2(u)^{[m]}; convergence modulo p^n because σ_2(T_i) − σ_1(T_i) ∈ pO_X^{ur+} and N^l(a) = 0 for |l| large on local sections of OA_cris/p^n.

*Acceptance.*

- For σ(T) = T^p: φ(u) = (u + [T♭])^p − [T♭]^p.
- On d = 0 it is φ of A_cris.

*Uses.* `PadicHodgeTheory:P8:local-rational/structural-crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-crystalline-sheaf`, `PadicHodgeTheory:P8:local-rational/frobenius-on-crystalline-period-sheaves`, `AdicSpacesPartII:R2`, `CrystallineCohomology:CR.0`.

*Sources.*

- Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.3, Lemma 2.21, p. 19 (extraction lines 1179-1183): “The Frobenius ϕ on OAcris is horizontal with respect to the connection ∇ : OAcris → OAcris ⊗ Ω1,ur+X/k. Similar assertions hold for OB+cris and for OBcris.” Horizontality.
- Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.3, Lemma 2.22, pp. 19-20 (extraction lines 1204-1216): “Let σ1, σ2 be two Frobenius liftings on X, and let ϕ1 and ϕ2 be the induced Frobenius maps on OAcris, respectively.” The comparison of Frobenius structures for different lifts.

#### Definition. The semistable period sheaves B_st^+ = B_cris^+[u] and B_st = B_cris[u] with φ, N and G_k-action

*Module* `TauCeti/PadicHodge/PeriodSheaves/Semistable.lean`. *Node* `PadicHodgeTheory:P8:local-rational/semistable-period-sheaves`.

Let X be a locally noetherian adic space over Spa(k, O_k), k complete discretely valued with perfect residue field, uniformiser π_k with a fixed compatible system π♭ = (π_k, π_k^{1/p}, …) ∈ O_C♭, C the completion of k̄. On X_proét/X_k̄ (≅ X_k̄,proét) define B_st^+ := B_cris^+ ⊗_{B_cris^+(C)} B_st^+(C) and B_st := B_cris ⊗_{B_cris(C)} B_st(C), where B_st(C) = B_cris(C)[u] is R06.1/semistable-period-ring (u = log[π♭], transcendental over B_cris(C)); thus B_st^+ = B_cris^+[u] and B_st = B_cris[u] are polynomial sheaves. They carry: the Frobenius φ extending that of B_cris with φ(u) = pu; the monodromy N := −d/du (B_cris-linear derivation); the G_k-semilinear action g(u) = u + c(g)t, c: G_k → Z_p the Kummer cocycle of π♭ (g(π♭) = ε^{c(g)}π♭); and, for the choice log(p) of R06.1, the G_k-equivariant embedding ι: B_st → B_dR extending B_cris ⊂ B_dR with ι(u) = log([π♭]/π_k) + log(π_k), inducing Fil^r B_st := ι^{-1}(Fil^r B_dR) on k ⊗_{K_0} B_st. Then Nφ = pφN and B_st^{N=0} = B_cris.

*Hypotheses.* B_cris^+, B_cris, φ from nodes crystalline-period-sheaves and frobenius-on-crystalline-period-sheaves; B_st(C) with φ, N, embedding from R06.1/semistable-period-ring (normalisation u = log[π♭], N = −d/du, as fixed in the shared conventions). Packet-authored sheaf construction: no public source read defines B_st on the pro-étale site; the definition extends R06.1's ring by base change along the constant subring B_cris(C) ⊂ B_cris(U) (U over X_k̄). The logarithmic structural sheaf for semistable formal models is not constructed here (gap).

*API.*

- `SemistablePeriodSheaf` (*data*) — B_st^+ = B_cris^+[u] and B_st = B_cris[u] on X_proét/X_k̄ with G_k-semilinear action.
- `SemistablePeriodSheaf.frobenius` (*structure*) — φ extending φ of B_cris with φ(u) = pu.
- `SemistablePeriodSheaf.monodromy` (*structure*) — N = −d/du, a B_cris-linear derivation of B_st.
- `SemistablePeriodSheaf.monodromy_frobenius` (*relation*) — N ∘ φ = p·φ ∘ N.
- `SemistablePeriodSheaf.galois` (*other*) — g(u) = u + c(g)t for g ∈ G_k, with c the Kummer cocycle of π♭; N is G_k-equivariant.
- `SemistablePeriodSheaf.embedding` (*constructor*) — ι_{log p}: k ⊗_{K_0} B_st → B_dR, G_k-equivariant, extending B_cris ⊂ B_dR, with image independent of log(p).
- `SemistablePeriodSheaf.ker_monodromy` (*characterisation*) — B_st^{N=0} = B_cris.

*Used by.*

- PadicHodgeTheory R06.2 — D_st(V) = (B_st ⊗ V)^{G_K} with φ and N; the value of this sheaf at geometric points
- CohomologyComparisons CP.4 — the semistable comparison is compatible with G_k, φ, N and the filtration after B_st → B_dR
- PadicHodgeTheory R06.5 — semistability of H^i_ét of varieties with semistable reduction
- PadicHodgeTheory P8/proper-smooth-de-rham-comparison-application — B_st-comparison of CP.4 read through the period sheaves

*Unit tests.* A wrong definition fails one of these.

- `SemistablePeriodSheaf.monodromy_frobenius_test` (computation) — N(φ(u^m)) = −m p^m u^{m−1} = p·φ(N(u^m)) for all m ≥ 0.
- `SemistablePeriodSheaf.ker_monodromy_test` (characterisation) — B_st^{N=0} = B_cris (N kills exactly the polynomials of degree 0 in u).
- `SemistablePeriodSheaf.sections_point` (compatibility) — On U = Spa C over X_k̄ for X = Spa(k, O_k), B_st(U) is the ring B_st of R06.1/semistable-period-ring with the same φ, N and G_k-action.
- `SemistablePeriodSheaf.u_not_crystalline` (non-example) — u ∉ B_cris(U): u is transcendental over B_cris (Brinon–Conrad Theorem 9.2.10), so B_st ≠ B_cris and N ≠ 0.

*Construction.*

1. On X_proét/X_k̄ the sheaf B_cris^+ is a B_cris^+(C)-algebra (its value on Spa C over X_k̄); base change the B_cris^+(C)-algebra B_st^+(C) = B_cris^+(C)[u].
2. φ, N and the G_k-action are the base changes of those on B_st(C); the identities Nφ = pφN and g ∘ N = N ∘ g hold in B_st(C) and are preserved.
3. ι: base change of R06.1's ι: k ⊗_{K_0} B_st(C) → B_dR(C) along B_cris → B_dR (node crystalline-to-de-rham-period-sheaf-embedding); injectivity of k ⊗ B_st → B_dR as sheaves reduces to transcendence of ι(u) over Frac(B_cris) on each affinoid perfectoid (Brinon–Conrad Theorem 9.2.10 in the field case; for general U packet-authored and recorded as a gap).

*Acceptance.*

- On X = Spa(k, O_k) and U = Spa C over X_k̄: B_st(U) = B_st(C) of R06.1.
- N φ(u^m) = −m p^m u^{m−1} = p φ(N u^m) (checked symbolically with PARI/GP for m ≤ 10).

*Uses.* `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/frobenius-on-crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/crystalline-to-de-rham-period-sheaf-embedding`, `PadicHodgeTheory:P8:local-rational/de-rham-period-sheaf`, `PadicHodgeTheory:R06.1/semistable-period-ring`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `mathlib:Polynomial.derivative`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Section 9.2, Definition 9.2.3 and the following paragraphs, p. 138 (extraction lines 6820-6849): “Non-canonically, B+st ≃ B+cris[X] and Bst ≃ Bcris[X] upon choosing y ∈ Frac(R)× with y ∉ R× (and setting X = λst(y)).” The ring-level definition that the sheaf construction base-changes; φ(X) = pX is fixed in the same paragraph.
- CMI Summer School notes on p-adic Hodge theory, Section 9.2, Theorem 9.2.10, p. 143 (extraction lines 7134-7137): “Choosing logK(p) ∈ K0, the resulting GK-equivariant K ⊗K0 B+cris-algebra map K ⊗K0 B+st → B+dR is injective.” The embedding into B_dR and its dependence on the choice of log(p).

#### Definition. The structural semistable sheaf OB_st = OB_cris[u] on the pro-étale site of a smooth formal scheme

*Module* `TauCeti/PadicHodge/PeriodSheaves/Semistable.lean`. *Node* `PadicHodgeTheory:P8:local-rational/structural-semistable-period-sheaves`.

Let k absolutely unramified (k = W(κ)[1/p], κ perfect); 𝔛 a smooth formal scheme over O_k = W(κ) of relative dimension d with rigid generic fibre X; w: X_proét → 𝔛_ét the morphism of topoi induced by Y ↦ Y_k (for Y étale over 𝔛). On X_proét/X_k̄ define OB_st^+ := OB_cris^+ ⊗_{B_cris^+} B_st^+ = OB_cris^+[u] and OB_st := OB_cris ⊗_{B_cris} B_st = OB_cris[u], with ∇ extended by ∇(u) = 0, N := −d/du (OB_cris-linear), φ := φ_σ ⊗ φ (φ(u) = pu) for a Frobenius lift σ, the G_k-action g(u) = u + c(g)t, and the filtration pulled back along ι: k ⊗_{K_0} OB_st → OB_dR. Then OB_st^{∇=0} = B_st, N∇ = ∇N, Nφ = pφN.

*Hypotheses.* k absolutely unramified (k = W(κ)[1/p], κ perfect); 𝔛 a smooth formal scheme over O_k = W(κ) of relative dimension d with rigid generic fibre X; w: X_proét → 𝔛_ét the morphism of topoi induced by Y ↦ Y_k (for Y étale over 𝔛). Packet-authored, as for node semistable-period-sheaves; for a smooth 𝔛 the structural semistable sheaf is the base change of the structural crystalline one. Semistable (non-smooth) formal models need a logarithmic structural sheaf on a log site, which is not constructed here (CohomologyComparisons CP.4 and HodgeTateAndCanonicalSubgroups T6 own the log sites; gap).

*API.*

- `StructuralSemistableSheaf` (*data*) — OB_st^+ = OB_cris^+[u] and OB_st = OB_cris[u] on X_proét/X_k̄.
- `StructuralSemistableSheaf.connection` (*constructor*) — ∇ extended from OB_cris with ∇(u) = 0.
- `StructuralSemistableSheaf.monodromy` (*structure*) — N = −d/du, OB_cris-linear, with N∇ = ∇N and Nφ = pφN.
- `StructuralSemistableSheaf.horizontal` (*characterisation*) — OB_st^{∇=0} = B_st.
- `StructuralSemistableSheaf.embedding` (*constructor*) — ι: k ⊗_{K_0} OB_st → OB_dR extending OB_cris ⊂ OB_dR and ι of B_st.

*Used by.*

- PadicHodgeTheory P8/proper-smooth-de-rham-comparison-application — reading CP.4's B_st comparison with connection on smooth families
- CohomologyComparisons CP.4 — the good-reduction case of the semistable comparison (N = 0 on cohomology)
- PadicHodgeTheory R06.2 — relative D_st for local systems on smooth formal schemes

*Unit tests.* A wrong definition fails one of these.

- `StructuralSemistableSheaf.horizontal_test` (characterisation) — The horizontal sections of OB_st are B_st.
- `StructuralSemistableSheaf.point` (degenerate) — For 𝔛 = Spf O_k, OB_st = B_st.
- `StructuralSemistableSheaf.commute` (computation) — N(∇(f u^m)) = ∇(N(f u^m)) = −m ∇(f) u^{m−1} for f ∈ OB_cris.
- `StructuralSemistableSheaf.not_crystalline` (non-example) — u ∈ OB_st but u ∉ OB_cris: OB_st is a polynomial ring in u over OB_cris.

*Construction.*

1. Base change of OB_cris along B_cris → B_st; ∇ is OB_cris-linear-extended with ∇u = 0, N = −d/du commutes with ∇ since ∇ acts on coefficients.
2. Horizontal sections: (OB_cris[u])^{∇=0} = OB_cris^{∇=0}[u] = B_cris[u] = B_st by the crystalline Poincaré lemma (node crystalline-poincare-lemma).

*Acceptance.*

- For 𝔛 = Spf O_k: OB_st = B_st.
- N φ = p φ N on OB_st as on B_st.

*Uses.* `PadicHodgeTheory:P8:local-rational/semistable-period-sheaves`, `PadicHodgeTheory:P8:local-rational/structural-crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/crystalline-poincare-lemma`, `PadicHodgeTheory:P8:local-rational/frobenius-on-structural-crystalline-sheaf`, `PadicHodgeTheory:P8:local-rational/structural-crystalline-to-de-rham-embedding`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Section 9.2, Definition 9.2.3 and the following paragraphs, p. 138 (extraction lines 6820-6849): “Non-canonically, B+st ≃ B+cris[X] and Bst ≃ Bcris[X] upon choosing y ∈ Frac(R)× with y ∉ R× (and setting X = λst(y)).” The polynomial presentation that the structural version inherits.
- Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 1, Introduction, p. 3 (extraction lines 128-136): “Here, OurX is the pullback to Xproét of OXét and OBcris is the crystalline period sheaf of OurX-module with connection ∇ such that OB∇=0cris = Bcris.” The horizontal-sections property that the structural semistable sheaf inherits.

### Lemmas, theorems and comparisons

#### Lemma. Local toric charts on smooth adic spaces (étale maps to Tⁿ through rational embeddings and finite étale maps)

*Node* `PadicHodgeTheory:P8:local-rational/toric-charts-for-smooth-spaces`.

Let K be a complete nonarchimedean field, V an affinoid adic space smooth over Spa(K, O_K), x ∈ V and M = closure of {x} in V. Then there is a rational subset U ⊂ V containing M and an étale map U → Tⁿ = Spa(K⟨T₁^{±1}, …, Tₙ^{±1}⟩, O_K⟨T₁^{±1}, …, Tₙ^{±1}⟩) which factors as a composite of rational embeddings and finite étale maps. Consequently every smooth adic space X over Spa(K, O_K) is covered by affinoid opens U with such toric charts, and these U can be chosen inside any given open neighbourhood of any point.

*Hypotheses.* K complete nonarchimedean (any characteristic-0 field in the applications: k discretely valued, or a perfectoid K); V affinoid and smooth of pure dimension n over Spa(K, O_K). Inputs from adic geometry (AdicEtaleGeometry A2, requested): a smooth affinoid admits, after shrinking to a rational subset containing M, an étale map to the unit ball Bⁿ (Huber, Étale cohomology of rigid analytic varieties, Corollary 1.6.10, with the open set chosen to contain M); an étale map f: V → Bⁿ becomes, over a rational W ∋ f(x) and after restriction, an open embedding into a finite étale cover of W (Huber Lemma 2.2.8).

*Proof outline.*

1. M is the intersection of the rational subsets containing it, so it suffices to produce the chart on some rational subset containing M.
2. Shrink V to a rational subset containing M with an étale f: V → Bⁿ (Huber 1.6.10, open set chosen to contain M).
3. With y = f(x) and N its closure, choose a rational W ⊂ Bⁿ containing N such that f^{-1}(W) → W factors as an open embedding f^{-1}(W) → Z followed by a finite étale Z → W (Huber 2.2.8); choose U ⊂ f^{-1}(W) containing M and rational in Z.
4. Embed Bⁿ into Tⁿ as the rational subset {|T_i − 1| ≤ |p|}; then U → W ⊂ Bⁿ ⊂ Tⁿ is a composite of rational embeddings and a finite étale map.

*Acceptance.*

- For V = Tⁿ itself the identity is such a chart; for V = Bⁿ (unit ball) the chart is the translation-rescaling T_i ↦ 1 + pT_i onto {|T_i − 1| ≤ |p|}.
- Used in Proposition 6.16, Corollary 6.19 and Lemma 8.6, which need charts that are composites of rational embeddings and finite étale maps (not merely étale maps).

*Uses.* `AdicEtaleGeometry:A2`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 5, Lemma 5.2 with proof, p. 28 (extraction lines 1537-1553): “Then there exists a rational subset U ⊂ V containing M, together with an étale map U → Tn which factors as a composite of rational embeddings and finite étale maps.” The statement of the node, and its proof via Huber 1.6.10 and 2.2.8.

#### Lemma. Integral elements of O_X(U) and Ô_X(U) are those with |f(x)| ≤ 1 at every point

*Node* `PadicHodgeTheory:P8:local-rational/integral-elements-via-valuations`.

For X locally noetherian over Spa(Q_p, Z_p) and every U ∈ X_proét: (i) O_X^+(U) = {f ∈ O_X(U) : |f(x)| ≤ 1 for all x ∈ |U|}; (ii) Ô_X^+(U) = {f ∈ Ô_X(U) : |f(x)| ≤ 1 for all x ∈ |U|}. In particular Ô_X^+(U) is integrally closed in Ô_X(U), and f ∈ Ô_X^+(U) with |f(x)| ≤ |p|^n for all x lies in p^n Ô_X^+(U).

*Hypotheses.* X locally noetherian over Spa(Q_p, Z_p); the statements are local in U, so U may be taken qcqs with a pro-étale presentation U = lim U_i (A1). Imported from AI.3: O_X^+/p^n ≅ Ô_X^+/p^n (Lemma 4.2 (iii)).

*Proof outline.*

1. (i): choose i with |U| → |U_i| surjective (possible for large i as transition maps are eventually surjective); if f = image of f_i ∈ O_X(U_i) has |f(x)| ≤ 1 everywhere then |f_i(x_i)| ≤ 1 on |U_i|, so f_i ∈ O^+_{X_ét}(U_i) by the corresponding property of affinoid adic spaces.
2. (ii): the inclusion ⊂ is by construction of the valuations. Conversely, as Ô_X(U) = Ô_X^+(U)[1/p], reduce to: f ∈ Ô_X^+(U) with |f(x)| ≤ |p|^n everywhere lies in p^n Ô_X^+(U). On a cover Ũ write f = f_0 + p^n g with f_0 ∈ O_X^+(Ũ), g ∈ Ô_X^+(Ũ) (Lemma 4.2 (iii); the source prints g ∈ p^n Ô_X^+(Ũ), recorded as a misprint in the reviewed decomposition); then |f_0| ≤ |p|^n, so f_0 ∈ p^n O_X^+(Ũ) by (i) applied to f_0/p^n; glue.
3. Integral closedness: an element integral over Ô_X^+(U) has |f(x)| ≤ 1 everywhere.

*Acceptance.*

- For U = T̃ⁿ over a perfectoid K: Ô_X^+(U) = K^+⟨T_i^{±1/p^∞}⟩ is the subring of power-bounded elements of K⟨T_i^{±1/p^∞}⟩ when K^+ = O_K.
- The element p^{-1}·T ∈ Ô_X(T̃¹) has |p^{-1}T(x)| = |p|^{-1} > 1 and so is not in Ô_X^+.

*Uses.* `PadicHodgeTheory:P8:local-rational/proetale-structure-sheaves-and-valuations`, `AdicEtaleGeometry:A1`, `AInfCohomology:AI.3`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 4, Lemma 4.2 (ii), (v) with proof, pp. 21-22 (extraction lines 1148-1198): “In particular, Ô+X(U) ⊂ ÔX(U) is integrally closed.” Consequence (ii) of the node; the characterisation by valuations precedes it in the statement.

#### Theorem. Rational local acyclicity of Ô_X: Ô_X(U) = R and H^i(U, Ô_X) = 0 on affinoid perfectoid U

*Node* `PadicHodgeTheory:P8:local-rational/completed-structure-sheaf-on-affinoid-perfectoids`.

Let K be a perfectoid field of characteristic 0 with open bounded valuation subring K^+, X locally noetherian over Spa(K, K^+) and U ∈ X_proét affinoid perfectoid with Û = Spa(R, R^+). Then Ô_X(U) = R and H^i(U, Ô_X) = 0 for all i > 0; for every profinite set S, Ô_X(U × S) = Hom_cont(S, R). In particular (|U|, Ô_X restricted to |U|, valuations) is the perfectoid space Û for every perfectoid U. By Proposition 3.15 the same holds on the affinoid perfectoid basis of X_proét for every locally noetherian X over Spa(Q_p, Z_p), taking K the completion of an algebraic extension of Q_p that is perfectoid.

*Hypotheses.* Imported from AI.3: Scholze Lemma 4.10 (i)-(v): Ô_X^+(U) = R^+, and H^i(U, Ô_X^+) is almost zero for i > 0 for the almost structure (K^+, ideal m of topologically nilpotent elements); and the integral statement Ô_X^+(U × S) = Hom_cont(S, R^+) (Corollary 6.6 for Ô_X^+). Imported from A1: U is a coherent (qcqs) object, so H^i(U, −) commutes with filtered colimits; X_{L,proét} ≅ X_proét/X_L (Proposition 3.15).

*Proof outline.*

1. Ô_X = colim(Ô_X^+ →p Ô_X^+ →p …), and on the coherent object U cohomology commutes with this filtered colimit, so H^i(U, Ô_X) = H^i(U, Ô_X^+)[1/p].
2. An almost zero K^+-module M satisfies mM = 0, and p ∈ m (as K is perfectoid, |p| < 1 and p is topologically nilpotent), so pM = 0 and M[1/p] = 0; hence H^i(U, Ô_X) = 0 for i > 0 and Ô_X(U) = R^+[1/p] = R.
3. For U × S: Ô_X(U × S) = Hom_cont(S, R^+)[1/p] = Hom_cont(S, R) because S is compact (a continuous map to R has bounded image, so lands in p^{-N}R^+).
4. Over Spa(Q_p, Z_p): an affinoid perfectoid object lies over some X_L with L perfectoid, and X_{L,proét} ≅ X_proét/X_L (Proposition 3.15, A1) transports the statement.

*Acceptance.*

- For U = T̃ⁿ over K: Ô_X(U) = K⟨T_i^{±1/p^∞}⟩ and H^1(U, Ô_X) = 0, whereas H^1(U, Ô_X^+) is almost zero but need not be zero.
- For X = Spa(C, O_C): Ô_X(Spa C × Z_p) = Hom_cont(Z_p, C).

*Uses.* `PadicHodgeTheory:P8:local-rational/proetale-structure-sheaves-and-valuations`, `AInfCohomology:AI.3`, `AdicEtaleGeometry:A1`.

*Sources.*

- p-adic Hodge theory for rigid-analytic varieties, Section 4, Lemma 4.10 (iii), (v) and the final assertion, pp. 26-27 (extraction lines 1426-1444): “(iii) We have Ô+X(U) = R+, ÔX(U) = R.” The values of the completed sheaves on affinoid perfectoids; (v) supplies the almost acyclicity that inverting p upgrades.
- p-adic Hodge theory for rigid-analytic varieties, Section 4, Remark 4.11, p. 26 (extraction lines 1445-1447): “This gives the promised base of the topology on which the sheaves Ô+X and ÔX behave as expected. Note that by Proposition 3.15, such a base of the topology exists for all locally noetherian adic spaces over Spa(Qp, Zp).” The extension of the basis statement to all locally noetherian X over Spa(Q_p, Z_p).

#### Lemma. Étale pullbacks of affinoid perfectoid objects: Ô_X(V_j ×_{U_j} U) = S_j ⊗̂_{R_j} R

*Node* `PadicHodgeTheory:P8:local-rational/affinoid-perfectoid-objects-and-etale-pullbacks`.

Let K be a perfectoid field of characteristic 0 with open bounded valuation subring K^+, X locally noetherian over Spa(K, K^+), and U = lim U_i ∈ X_proét affinoid perfectoid with U_i = Spa(R_i, R_i^+) and Û = Spa(R, R^+) (AI.3). Let V_j = Spa(S_j, S_j^+) → U_j be étale and a composite of rational embeddings and finite étale maps, and V = V_j ×_{U_j} U. Then V is affinoid perfectoid, V̂ = V_j ×_{U_j} Û, and Ô_X(V) = S_j ⊗̂_{R_j} R, the completion of S_j ⊗_{R_j} R for the topology in which the image of S_j^+ ⊗_{R_j^+} R^+ is open and bounded. The integral comparison A_j → Ô_X^+(V), with A_j the p-adic completion of the p-torsion-free quotient of S_j^+ ⊗_{R_j^+} R^+, is injective with cokernel killed by a power of p (by p^ε for every ε > 0 in log Γ after enlarging j).

*Hypotheses.* Scholze Lemma 4.5 (i)-(iii) and Lemma 4.6 are part of the affinoid perfectoid basis requested from AInfCohomology AI.3 (with the perfectoid inputs Sch12 Theorem 6.3 (ii), Lemma 6.4, Theorem 7.9 (iii), Lemma 7.3 (iv), Proposition 7.10). This node records the rational consequence used by the period-sheaf computations (Lemma 6.18, Lemma 8.7 (i), the erratum's S_i).

*Proof outline.*

1. By Lemma 4.5 (i)-(ii) (AI.3), V is affinoid perfectoid with V̂ = V_j ×_{U_j} Û, S = A_j[1/p], and coker(A_j → S^+) is killed by p^N.
2. Hence Ô_X^+(V) = S^+ (node completed-structure-sheaf-on-affinoid-perfectoids) and Ô_X(V) = S = A_j[1/p]; since A_j is the p-adic completion of the image of S_j^+ ⊗ R^+, A_j[1/p] is the completed tensor product S_j ⊗̂_{R_j} R.
3. Injectivity of A_j → S^+ holds because A_j is p-torsion free and the map becomes an isomorphism after inverting p.

*Acceptance.*

- For X = T¹, U = T̃¹ and the nonempty rational subset V₀ = {|T − 1| ≤ |p|}: Ô_X(V₀ ×_{T¹} T̃¹) = K⟨T^{±1}, (T−1)/p⟩ ⊗̂_{K⟨T^{±1}⟩} K⟨T^{±1/p^∞}⟩ (the set {|T| ≤ |p|} is empty on T¹ and gives no test).
- For V_j → U_j finite étale of degree d, Ô_X(V) is finite étale of degree d over R (almost purity through Lemma 4.5).

*Uses.* `PadicHodgeTheory:P8:local-rational/completed-structure-sheaf-on-affinoid-perfectoids`, `AInfCohomology:AI.3`.

*Sources.*

- p-adic Hodge theory for rigid-analytic varieties, Section 4, Lemma 4.5 (i) with proof, pp. 23-24 (extraction lines 1242-1290): “Moreover, V̂ = Vj ×Uj Û in the category of adic spaces over K, and S = Aj[1/p] for any j ≥ i.” The rational identification recorded by the node.
- p-adic Hodge theory for rigid-analytic varieties, Section 6, Lemma 6.18 with proof, p. 40 (extraction lines 2337-2350): “This is an immediate consequence of Lemma 4.5 (ii).” The use of the rational étale-pullback formula in the torus computation.

#### Theorem. Values of B_inf, B_dR^+ on affinoid perfectoids; ξ generates Fil¹ locally

*Node* `PadicHodgeTheory:P8:local-rational/period-sheaves-on-affinoid-perfectoids`.

Let K be a perfectoid field of characteristic 0 with open bounded valuation subring K^+, X locally noetherian over Spa(K, K^+), and U ∈ X_proét affinoid perfectoid with Û = Spa(R, R^+). Then B_inf(U) = B_inf(R, R^+) = W(R♭+)[1/p], (B_inf/(ker θ)^n)(U) = B_inf(R, R^+)/ξ^n, and B_dR^+(U) = B_dR^+(R, R^+) = lim_n W(R♭+)[1/p]/ξ^n, compatibly with θ and filtrations: Fil^i B_dR^+(U) = ξ^i B_dR^+(R, R^+). Here ξ ∈ A_inf(K, K^+) is the element of R06.1/bdr-plus-of-perfectoid-affinoid-algebras; it generates Fil¹B_dR^+(U), is a nonzerodivisor and is unique up to a unit. In particular Fil¹B_dR^+ is locally on X_proét generated by a nonzerodivisor.

*Hypotheses.* Imported from AI.3: A_inf(U) = W(R♭+) and H^i(U, A_inf) almost zero for i > 0 (Theorem 6.5 (i)-(ii) for A_inf, via Lemma 5.10 and the almost version of Lemma 3.18); A_inf(U) → Ô_X^+(U) is Fontaine's θ for (R, R^+). From R06.1/bdr-plus-of-perfectoid-affinoid-algebras (Lemma 6.3, Corollary 6.4): ξ generates ker θ on W(R♭+) and on W(R♭+)[1/p] and is a nonzerodivisor. The step from 'almost' to 'exact' uses that [π] maps to the unit π♯ of K under θ (the next node records the resulting vanishing).

*Proof outline.*

1. B_inf(U) = A_inf(U)[1/p] = W(R♭+)[1/p] since U is coherent (A1) and localisation is a filtered colimit.
2. Sheaf exact sequence 0 → B_inf →ξ^n B_inf → B_inf/(ker θ)^n → 0 on X_proét/U: locally ker θ = ξ B_inf by R06.1 applied on the affinoid perfectoid basis; ξ^n is injective as ξ is a nonzerodivisor.
3. Taking sections: 0 → B_inf(U) → B_inf(U) → (B_inf/(ker θ)^n)(U) → H^1(U, B_inf); the defect lies in the ξ^n-torsion of the almost zero group H^1(U, B_inf) (almost zero for the ideal generated by all [π^{1/p^N}]).
4. (B_inf/(ker θ)^n)(U) and the defect are modules over B_inf(K, K^+)/(ker θ)^n, in which [π] is a unit because it maps to π♯ ∈ K^× modulo ker θ and ker θ is nilpotent modulo (ker θ)^n; an almost zero module on which [π] acts invertibly is zero, so (B_inf/(ker θ)^n)(U) = B_inf(R, R^+)/ξ^n.
5. Pass to the inverse limit: sections commute with limits of sheaves, so B_dR^+(U) = lim_n B_inf(R, R^+)/ξ^n = B_dR^+(R, R^+); Fil^i(U) = ξ^i B_dR^+(R, R^+) from the same sequences.

*Acceptance.*

- For U = Spa(C, O_C) over X = Spa(C, O_C): B_dR^+(U) = B_dR^+(C) with gr^i = C·ξ^i.
- For U = T̃ⁿ: B_dR^+(U) = lim_n W((O_K⟨T^{±1/p^∞}⟩)♭)[1/p]/ξ^n and gr^i B_dR^+(U) = ξ^i K⟨T^{±1/p^∞}⟩.

*Uses.* `PadicHodgeTheory:P8:local-rational/period-sheaves-definitions`, `PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras`, `AInfCohomology:AI.3`, `AdicEtaleGeometry:A1`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 6, Theorem 6.5 (i) with proof, p. 36 (extraction lines 2084-2106): “(i) We have a canonical isomorphism Ainf(U) = Ainf(R, R+), and analogous statements for Binf, B+dR and BdR. In particular, there is an element ξ generating Fil1 B+dR(U), unique up to a unit, and it is not a zero-divisor.” The values of the rational period sheaves; the A_inf part is imported from AI.3.

#### Theorem. Rational local acyclicity of B_dR^+, B_dR, their filtration steps and graded pieces on affinoid perfectoids

*Node* `PadicHodgeTheory:P8:local-rational/rational-acyclicity-of-de-rham-period-sheaves`.

In the situation of the previous node: H^i(U, B_inf) is almost zero for i > 0 (almost structure: A_inf(K, K^+) with the ideal generated by all [π^{1/p^N}]); and H^i(U, F) = 0 for all i > 0 and F ∈ {B_inf/(ker θ)^n, Fil^r B_dR^+, B_dR^+, gr^r B_dR^+, Fil^r B_dR, B_dR, gr^r B_dR} (r ∈ Z). In particular [π] is invertible in B_dR^+(U) and B_dR(U).

*Hypotheses.* X locally noetherian over Spa(K, K^+), K perfectoid of characteristic 0, U affinoid perfectoid. Inputs: the sequences and the unit [π] from the previous node; Scholze Lemma 3.18 (exact version) for inverse limits on the affinoid perfectoid basis, requested from AI.3; cohomology of the coherent object U commutes with filtered colimits (A1).

*Proof outline.*

1. H^i(U, B_inf) = H^i(U, A_inf)[1/p] is almost zero (AI.3 and coherence of U).
2. From 0 → B_inf → B_inf → B_inf/(ker θ)^n → 0: H^i(U, B_inf/(ker θ)^n) is almost zero for i > 0 and is a module over B_inf(K, K^+)/(ker θ)^n where [π] is a unit, hence zero.
3. Lemma 3.18 applies to the inverse system B_inf/(ker θ)^n on the affinoid perfectoid basis: R^1 lim of the sections vanishes (surjective transitions B_inf(R,R^+)/ξ^{n+1} → B_inf(R,R^+)/ξ^n) and higher cohomology vanishes; hence H^i(U, B_dR^+) = 0 for i > 0. The same argument applies to Fil^r B_dR^+ = lim_n (ker θ)^r/(ker θ)^n and to gr^r = (ker θ)^r/(ker θ)^{r+1} ≅ Ô_X·ξ^r locally.
4. For B_dR = colim_j t^{-j}B_dR^+ (next nodes) and Fil^r B_dR = colim_j t^{-j} Fil^{r+j}B_dR^+: cohomology of U commutes with the filtered colimit.

*Acceptance.*

- H^1(Spa(C, O_C), B_dR^+) = 0 whereas H^1(Spa(C, O_C), A_inf) need not vanish, only be almost zero.
- A non-example that fixes the hypothesis: on U = X_K for X = Tⁿ over k (not affinoid perfectoid), H^1(X_K, gr⁰OB_dR) = 0 holds but H^1(X, gr⁰OB_dR) = R·log χ ≠ 0 (node cohomology-of-graded-structural-de-rham-sheaf), so acyclicity is a property of the perfectoid basis, not of all objects.

*Uses.* `PadicHodgeTheory:P8:local-rational/period-sheaves-on-affinoid-perfectoids`, `AInfCohomology:AI.3`, `AdicEtaleGeometry:A1`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 6, Theorem 6.5 (ii)-(iii), p. 36 (extraction lines 2091-2094): “(iii) In B+dR(U) and BdR(U) the element [π] becomes invertible, in particular the cohomology groups Hi(U, F) vanish for these sheaves.” The rational local acyclicity demanded by the stage text.

#### Lemma. Values of the period sheaves on U × S for profinite S (continuous maps)

*Node* `PadicHodgeTheory:P8:local-rational/period-sheaves-on-profinite-products`.

Let X be locally noetherian over Spa(K, K^+), K perfectoid of characteristic 0, U ∈ X_proét affinoid perfectoid, S a profinite set and V = U × S (the pullback of S from the pro-finite-étale site of the base). Then V is affinoid perfectoid and F(V) = Hom_cont(S, F(U)) for F ∈ {Ô_X, B_inf, B_dR^+, B_dR, Fil^r B_dR^+, gr^i B_dR}, where Ô_X(U) has the p-adic topology of R, B_inf(U) the direct-limit topology, (B_inf/(ker θ)^n)(U) the quotient topology, B_dR^+(U) the inverse-limit topology and B_dR(U) the direct-limit topology. The integral cases F ∈ {Ô_X^+, Ô^+_{X♭}, A_inf} are imported from AI.3.

*Hypotheses.* The object U × S and its affinoid perfectoid presentation U × S = lim U × S_j (S = lim S_j finite) come from A1 (profinite sets pulled back from Spa(K, K^+)_profét). Imported from AI.3: Ô_X^+(U × S) = Hom_cont(S, R^+) and A_inf(U × S) = Hom_cont(S, W(R♭+)) with the (p, ker θ)-adic topology.

*Proof outline.*

1. Û × S has completed ring Hom_cont(S, R^+)[1/p] (completion of colim_j Map(S_j, R^+)), so Ô_X(U × S) = Hom_cont(S, R) by node completed-structure-sheaf-on-affinoid-perfectoids.
2. B_inf(U × S) = Hom_cont(S, A_inf(U))[1/p] = Hom_cont(S, B_inf(U)) for the direct-limit topology (S compact).
3. (B_inf/(ker θ)^n)(U × S) = B_inf(U × S)/ξ^n = Hom_cont(S, B_inf(U))/ξ^n = Hom_cont(S, B_inf(U)/ξ^n) for the quotient topology, using that ξ^n is a closed embedding with a continuous section on bounded sets (packet-authored check of the source's 'go through all identifications').
4. Pass to inverse limits over n (Hom_cont(S, −) commutes with limits) and then to the colimit along t^{-1} (S compact).

*Acceptance.*

- For the Z_p^n-torsor X̃_K → X_K of the torus, X̃_K ×_{X_K} X̃_K ≅ X̃_K × Z_p^n, so F(X̃_K ×_{X_K} X̃_K) = Hom_cont(Z_p^n, F(X̃_K)); this turns the Čech complex into the continuous cochain complex of Z_p^n.
- For S a finite set, F(U × S) = F(U)^S.

*Uses.* `PadicHodgeTheory:P8:local-rational/completed-structure-sheaf-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/de-rham-period-sheaf`, `AInfCohomology:AI.3`, `AdicEtaleGeometry:A1`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 6, Corollary 6.6 with proof, p. 36 (extraction lines 2107-2121): “Further, let S be some profinite set, and V = U × S ∈ Xproét, which is again affinoid perfectoid. Then F(V) = Homcont(S, F(U))” The statement; its proof in the source is 'Go through all identifications'.

#### Theorem. gr^i B_dR ≅ Ô_X(i)

*Node* `PadicHodgeTheory:P8:local-rational/graded-de-rham-period-sheaf-tate-twist`.

Let X be locally noetherian over Spa(Q_p, Z_p), Ẑ_p = lim Z/p^n and Ẑ_p(1) = lim μ_{p^n} as sheaves on X_proét, and F(1) := F ⊗_{Ẑ_p} Ẑ_p(1). For every i ∈ Z there is a canonical isomorphism gr^i B_dR ≅ Ô_X(i) of Ô_X-modules on X_proét which over X_proét/X_K sends the class of t^i f to f ⊗ ε^{⊗i}; in particular gr^i B_dR^+ ≅ Ô_X(i) for i ≥ 0 and gr⁰B_dR = Ô_X.

*Hypotheses.* K the completion of Q_p(μ_{p^∞}), ε = (1, ζ_p, ζ_{p²}, …) ∈ O_K♭, t = log([ε]) ∈ Fil¹B_dR^+(K, K^+) generating Fil¹ with g(t) = χ(g)t (R06.1/fontaine-element-t). X_{K,proét} ≅ X_proét/X_K (Proposition 3.15, A1).

*Proof outline.*

1. Over X_proét/X_K: gr^i B_dR = t^i Ô_X because t generates Fil¹ locally and is a nonzerodivisor (previous nodes; θ(t/ξ) is a unit when ξ is a generator).
2. Define gr^i B_dR → Ô_X(i) over X_K by t^i f ↦ f ⊗ ε^{⊗i}; the Galois group of K/Q_p acts on t and on ε by χ, so the map is equivariant, hence descends along X_K → X (Galois descent for sheaves on X_proét along the pro-finite-étale cover X_K → X).

*Acceptance.*

- For X = Spa(C, O_C): gr^i B_dR(C) = C(i) as a G_{Q_p}-module, recovering Fontaine's gr^i B_dR = C(i); with the convention HT(χ) = +1 this has Hodge–Tate weight i.
- gr¹B_dR^+ ≅ Ô_X(1) is the first term of Faltings's extension.

*Uses.* `PadicHodgeTheory:P8:local-rational/de-rham-period-sheaf`, `PadicHodgeTheory:R06.1/fontaine-element-t`, `AdicEtaleGeometry:A1`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 6, Proposition 6.7 with proof, p. 37 (extraction lines 2127-2144): “For all i ∈ Z, we have gri BdR ≅ ÔX(i), where (i) denotes a Tate twist” The statement; the proof uses t = log([ε]) over X_K and descent through the cyclotomic action.

#### Lemma. Maps of finitely generated O_k-algebras into B_dR^+(R, R^+)[[X]] extend to p-adic completions

*Node* `PadicHodgeTheory:P8:local-rational/bdr-plus-power-series-extension-lemma`.

Let K be a perfectoid field of characteristic 0 and (R, R^+) a perfectoid affinoid (K, O_K)-algebra, and let θ': B_dR^+(R, R^+)[[X_1, …, X_n]] → R be θ with X_i ↦ 0. Let S be a finitely generated O_k-algebra and f: S → B_dR^+(R, R^+)[[X_1, …, X_n]] a ring homomorphism with θ'(f(S)) ⊂ R^+. Then f extends uniquely to a ring homomorphism from the p-adic completion Ŝ, continuous for the ker θ'-adic topology on the target modulo each power.

*Hypotheses.* (R, R^+) perfectoid affinoid over (K, O_K) (the source's hypothesis K^+ = O_K); ξ as in R06.1 (Lemma 6.3) generates ker θ; gr^i B_dR^+(R, R^+) ≅ R (Corollary 6.4).

*Proof outline.*

1. It suffices to extend modulo (ker θ')^i for every i, compatibly (then pass to the limit, B_dR^+[[X]] being ker θ'-adically complete).
2. With generators s_1, …, s_m of S: θ'(f(s_j)) ∈ R^+ = θ(W(R♭+)), so f(s_j) ∈ W(R♭+)[[X]] + ker θ'; hence the image of S modulo (ker θ')^i lies in the subalgebra (W(R♭+)[[X]]/(ker θ')^i)[ξ/p^k, X_1/p^k, …, X_n/p^k] for some k.
3. That subalgebra is p-adically complete: it is a finite successive extension of finitely generated R^+-submodules of the graded pieces gr^j ≅ R, and finitely generated R^+-submodules of R are p-adically complete (R^+ is p-adically complete and R^+ ⊂ R bounded). So f mod (ker θ')^i extends to Ŝ.

*Acceptance.*

- For S = O_k[T^{±1}] and f(T) = [T♭] + X: the extension to O_k⟨T^{±1}⟩ sends Σ a_m T^m to Σ a_m([T♭] + X)^m, convergent modulo each (ker θ')^i.

*Uses.* `PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras`, `mathlib:MvPowerSeries`, `mathlib:AdicCompletion`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 6, Lemma 6.11 with proof, p. 38 (extraction lines 2218-2232): “Then any morphism f : S → B+dR(R, R+)[[X1, ..., Xn]] such that θ(f(S)) ⊂ R+ extends to the p-adic completion of S.” The statement; the proof reduces to p-adic completeness of the subalgebra generated by ξ/p^k and X_i/p^k.

#### Lemma. Affinoids étale over the torus have finitely generated étale algebraic models

*Node* `PadicHodgeTheory:P8:local-rational/etale-algebras-over-torus-models`.

Let U = Spa(R, R^+) be an affinoid adic space of finite type over Spa(W(κ)[1/p], W(κ)) with an étale map U → Tⁿ. Then there is a finitely generated W(κ)[T_1^{±1}, …, T_n^{±1}]-algebra R_0^+ such that R_0 = R_0^+[1/p] is étale over W(κ)[1/p][T_1^{±1}, …, T_n^{±1}] and R^+ is the p-adic completion of R_0^+. Over k (finite over W(κ)[1/p]) one applies this to the composite U_i → Tⁿ_k → Tⁿ_{W(κ)[1/p]}, which is étale.

*Hypotheses.* κ perfect, so W(κ) is a complete discrete valuation ring, hence excellent. Inputs: Huber, Étale cohomology of rigid analytic varieties, Corollary 1.7.3 (iii) (an algebraic étale model (R_0, R_0^+) of U) and Remark 1.2.6 (iii) (R_0^+ is the integral closure of a finitely generated R_1^+ with R_1^+[1/p] = R_0), requested from AdicSpacesPartII R0; finiteness of normalisation for finitely generated reduced flat W(κ)-algebras (excellence), requested from AlgebraicModuliForArithmeticGeometry A0-extension ('finite normalization under excellence').

*Proof outline.*

1. Huber 1.7.3 (iii) gives (R_0, R_0^+) with R_0 étale over W(κ)[1/p][T^{±1}] and R^+ the p-adic completion of R_0^+.
2. Huber 1.2.6 (iii): R_0^+ is the integral closure in R_0 of a finitely generated W(κ)[T^{±1}]-algebra R_1^+ ⊂ R_0^+ with R_1^+[1/p] = R_0.
3. W(κ) excellent ⇒ the normalisation of the reduced flat finitely generated R_1^+ in R_1^+[1/p] is finite over R_1^+; hence R_0^+ is finitely generated.

*Acceptance.*

- For U = Tⁿ itself, R_0^+ = W(κ)[T^{±1}].
- For U the rational subset {|T − 1| ≤ |p|} of T¹, R_0^+ = W(κ)[T^{±1}, (T − 1)/p].

*Uses.* `AdicSpacesPartII:R0`, `AlgebraicModuliForArithmeticGeometry:A0-extension`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 6, Lemma 6.12 with proof, p. 38 (extraction lines 2235-2246): “But W (κ) is excellent, in particular for any reduced flat finitely generated W (κ)-algebra S+, the normalization of S+ inside S+[p−1] is finite over S+, giving the desired result.” The finiteness input that makes R_0^+ finitely generated.

#### Theorem. OB_dR^+|_{X̃} ≅ B_dR^+|_{X̃}[[X_1, …, X_n]] (strengthened form of the erratum)

*Node* `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-de-rham-sheaf`.

X smooth over Spa(k, O_k), where k is a complete discretely valued extension of Q_p with perfect residue field κ and W(κ) ⊂ O_k, with an étale map X → Tⁿ, X̃ = X ×_{Tⁿ} T̃ⁿ and u_i = T_i ⊗ 1 − 1 ⊗ [T_i♭], a section of Fil¹OB_dR^+ over X̃. (a) The map B_dR^+|_{X̃}[[X_1, …, X_n]] → OB_dR^+|_{X̃}, X_i ↦ u_i, is an isomorphism of sheaves on X_proét/X̃, compatible with θ (θ'(X_i) = 0) and with the filtrations ((ξ, X_1, …, X_n)-adic on the left). (b) For affinoid perfectoid U = lim Spa(R_i, R_i^+) in X_proét/X̃_K with completed limit (R, R^+) and i sufficiently large, S_i(U) ≅ B_dR^+(R, R^+)[[X_1, …, X_n]] via this map, independently of i; hence OB_dR^+(U) = B_dR^+(R, R^+)[[X_1, …, X_n]] and the right-hand side is already a sheaf on X_proét/X̃.

*Hypotheses.* X smooth over Spa(k, O_k), where k is a complete discretely valued extension of Q_p with perfect residue field κ and W(κ) ⊂ O_k; X → Tⁿ étale (a composite of rational embeddings and finite étale maps after localising, node toric-charts-for-smooth-spaces). It suffices to check (a) over X_proét/X̃_K since X̃_K → X̃ is a pro-étale cover.

*Proof outline.*

1. The algebra structure of node structural-algebra-structure-on-bdr-power-series gives (O_X ⊗_{W(κ)} W(Ô^+_{X♭}))|_{X̃_K} → B_dR^+|_{X̃_K}[[X]], compatible with θ, hence on each U maps R_i^+ ⊗̂ A_inf(R, R^+) → B_dR^+(R, R^+)[[X]] (the target is p-adically complete modulo each power of ker θ'), and after inverting p and completing along ker θ, maps S_i(U) → B_dR^+(R, R^+)[[X]].
2. B_dR^+(R, R^+)[[X]] → S_i(U) → B_dR^+(R, R^+)[[X]] is the identity: both are continuous B_dR^+-algebra maps and send X_j ↦ u_j ↦ ([T_j♭] + X_j) − [T_j♭] = X_j.
3. S_i(U) → B_dR^+[[X]] → S_i(U) is the identity (erratum): it suffices that (B_dR^+(R, R^+)/ξ^r)[X]/(X)^r → (R_i^+ ⊗̂ A_inf(R, R^+))[1/p]/(ker θ)^r is surjective for each r. The map R_i^+[X]/(X)^r → (R_i^+ ⊗̂_{W(κ)} R_i^+)/(ker θ_i)^r (θ_i the multiplication) is injective with cokernel killed by a power of p (étaleness over the torus); base change along R_i^+ → (B_dR(R, R^+)/ξ^r)_0, an open bounded subring through which R_i^+ → B_dR/ξ^r factors (proof of Proposition 6.10), gives an isomorphism up to bounded p-power torsion; invert p and use (ker θ_i)^r ⊗̂ (B_dR/ξ^r)_0 ⊂ (ker θ)^r.
4. Hence OB_dR^+(U) = colim_i S_i(U) = B_dR^+(R, R^+)[[X]] for affinoid perfectoid U over X̃_K; the right-hand side is a sheaf on the basis (products of the sheaf B_dR^+), so no sheafification is needed; (a) follows.

*Acceptance.*

- For X = Tⁿ and U = X̃_K: OB_dR^+(U) = B_dR^+(R̃, R̃^+)[[X_1, …, X_n]] with R̃ = K⟨T^{±1/p^∞}⟩ and u_i = T_i − [T_i♭].
- With the original (uncompleted) definition the composite S_i → B_dR^+[[X]] → S_i is not the identity (erratum).

*Uses.* `PadicHodgeTheory:P8:local-rational/corrected-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/structural-algebra-structure-on-bdr-power-series`, `PadicHodgeTheory:P8:local-rational/period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/toric-charts-for-smooth-spaces`, `PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras`, `AdicEtaleGeometry:A1`.

*Sources.*

- p-adic Hodge theory for rigid-analytic varieties, Section 6, Proposition 6.10 with proof, pp. 38-39 (extraction lines 2197-2215): “The map B+dR|X̃[[X1, ..., Xn]] → OB+dR|X̃ sending Xi to ui is an isomorphism of sheaves over Xproét/X̃.” Statement (a).
- Erratum to p-adic Hodge theory for rigid-analytic varieties, Item (3), strengthened Proposition 6.10 and its proof, pp. 2-3: “We claim that with the corrected definition, also the composite Si → B+dR(R, R+)[[X1, ..., Xn]] → Si is the identity; the analogue of this assertion fails with the original definition of OB+dR.” Statement (b) and the reason the corrected definition is needed.

#### Lemma. ∇ and the filtrations of OB_dR^+ and OB_dR in the coordinates X_i = u_i

*Node* `PadicHodgeTheory:P8:local-rational/connection-and-filtration-in-local-coordinates`.

In the situation of node local-structure-of-structural-de-rham-sheaf: (i) under OB_dR^+|_{X̃} ≅ B_dR^+|_{X̃}[[X_1, …, X_n]], ∇ corresponds to Σ_i ∂/∂X_i ⊗ dT_i, i.e. ∇(u_i) = dT_i ⊗ 1 and ∇ is B_dR^+-linear; (ii) Fil^r OB_dR^+ corresponds to (ξ, X_1, …, X_n)^r, with gr^r = ⊕_{a+|m|=r} Ô_X·ξ^a X^m; (iii) OB_dR|_{X̃} = B_dR^+[[X]][1/ξ], Fil^r OB_dR = Σ_j ξ^{-j}(ξ, X)^{r+j}, and OB_dR^+ ∩ Fil^r OB_dR = Fil^r OB_dR^+ for r ≥ 0.

*Hypotheses.* X smooth over Spa(k, O_k), where k is a complete discretely valued extension of Q_p with perfect residue field κ and W(κ) ⊂ O_k.

*Proof outline.*

1. (i): ∇ is B_dR^+-linear and continuous (node structural-de-rham-sheaf-connection), so it is determined by ∇(u_i) = ∇(T_i ⊗ 1) − ∇(1 ⊗ [T_i♭]) = dT_i − 0; on power series in the u_i it is Σ ∂/∂X_i ⊗ dT_i (packet-authored; the source uses this implicitly in 'this is obvious').
2. (ii): ker θ' = (ξ, X_1, …, X_n) on B_dR^+(R, R^+)[[X]]; its powers are the images of (ker θ)^r; ξ, X_1, …, X_n is a regular sequence with quotient R, giving gr = R[ξ, X_1, …, X_n].
3. (iii): since gr of B_dR^+[[X]] is the polynomial ring R[ξ, X] in which ξ is a nonzerodivisor, x ∈ B_dR^+[[X]] with ξ^j x ∈ (ξ, X)^{r+j} lies in (ξ, X)^r.

*Acceptance.*

- For n = 1: ∇(Σ a_m X^m) = Σ m a_m X^{m−1} ⊗ dT, and X ∈ Fil¹ but X/ξ ∈ Fil⁰OB_dR \ OB_dR^+.
- The class of X_i/ξ in gr⁰OB_dR equals V_i = t^{-1}log([T_i♭]/T_i) up to the unit θ(t/ξ) (used in Proposition 6.16).

*Uses.* `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/structural-de-rham-sheaf-connection`, `mathlib:MvPowerSeries.pderiv`.

*Sources.*

- p-adic Hodge theory for rigid-analytic varieties, Section 6, proof of Corollary 6.13, p. 39 (extraction lines 2268-2277): “Proof. Using the description of Proposition 6.10, this is obvious.” The source leaves the coordinate form of ∇ and of the filtration implicit; the node makes it explicit.
- Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.2, proof of Corollary 2.17, p. 16 (extraction lines 1018-1027): “Moreover ∇(ui[n]) = ui[n−1] ⊗ dTi for any i, n ≥ 1, since the connection ∇ on OAcris is Acris-linear.” The crystalline analogue of (i), written out by Tan and Tong.

#### Lemma. Formal Poincaré lemma for power series over a Q-algebra, with strictness

*Node* `PadicHodgeTheory:P8:local-rational/formal-poincare-lemma`.

Let B be a Q-algebra and I = (ξ) + … an ideal-adic filtration on B[[X_1, …, X_n]] given by Fil^r = Σ_{a+|m|=r} Fil^a B · X^m for a complete separated decreasing filtration Fil^• B with ξ ∈ Fil¹B. Then the de Rham complex 0 → B → B[[X]] →d B[[X]] ⊗ Λ¹ → … → B[[X]] ⊗ Λⁿ → 0 (Λ^j free on dX_{i_1} ∧ … ∧ dX_{i_j}, d = Σ ∂/∂X_i dX_i) is exact, and it is strictly exact when Λ^j is placed in filtration degree j (i.e. the complex Fil^r B[[X]] → Fil^{r−1} ⊗ Λ¹ → … is exact for every r, and so is its associated graded).

*Hypotheses.* B a Q-algebra (the applications: B = B_dR^+(R, R^+) with Fil = ξ-adic, and B = A_cris-type PD versions in the crystalline node).

*Proof outline.*

1. Degree by degree in the monomial grading, the complex is the Koszul-type complex of the operators ∂/∂X_i, which on monomials multiply by exponents; over a Q-algebra the homotopy h(f dX_I) = Σ (integration in the first variable of I) gives exactness in positive degrees and kernel B in degree 0 (packet-authored, standard).
2. The homotopy preserves the filtration after the shift by one (integration raises the X-degree by 1 while dX_i has filtration degree 1), so each Fil^r-subcomplex and the graded complex are exact: strictness.

*Acceptance.*

- n = 1: d/dX: B[[X]] → B[[X]] is surjective with kernel B; this is Mathlib's PowerSeries.derivative over a Q-algebra.
- Non-example: over Z the statement fails, since X^{p−1}dX is not exact in Z[[X]] (its primitive X^p/p is not integral); this is why the crystalline version uses divided powers.

*Uses.* `mathlib:PowerSeries.derivative`, `mathlib:MvPowerSeries.pderiv`, `mathlib:MvPowerSeries`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 7, proof of Theorem 7.2, p. 42 (extraction lines 2437-2441): “Then it follows from Proposition 6.10 and the fact for any Q-algebra R, any module with integrable connection over R[[X1, ..., Xn]] has enough horizontal sections.” The formal fact over Q-algebras on which the Poincaré lemma and Theorem 7.2 rest.

#### Theorem. The Poincaré lemma for OB_dR^+: exactness, Griffiths transversality and strict exactness

*Node* `PadicHodgeTheory:P8:local-rational/poincare-lemma-and-faltings-extension`.

Let X be an n-dimensional smooth adic space over Spa(k, O_k), k complete discretely valued over Q_p with perfect residue field. The sequence 0 → B_dR^+ → OB_dR^+ →∇ OB_dR^+ ⊗_{O_X} Ω¹_X →∇ … →∇ OB_dR^+ ⊗_{O_X} Ωⁿ_X → 0 of sheaves on X_proét is exact; ∇ satisfies Griffiths transversality; and with Ω^i_X in filtration degree i the sequence is strict exact, i.e. for every r the subsequence 0 → Fil^r B_dR^+ → Fil^r OB_dR^+ → Fil^{r−1}OB_dR^+ ⊗ Ω¹ → … → Fil^{r−n}OB_dR^+ ⊗ Ωⁿ → 0 is exact. The same holds after inverting t: 0 → B_dR → OB_dR → OB_dR ⊗ Ω¹ → … is strict exact, and taking gr^r gives exact sequences 0 → gr^r B_dR → gr^r OB_dR → gr^{r−1}OB_dR ⊗ Ω¹ → … .

*Hypotheses.* X smooth over Spa(k, O_k), where k is a complete discretely valued extension of Q_p with perfect residue field κ. Exactness is local on X_proét; X is covered by opens with toric charts (node toric-charts-for-smooth-spaces) and X̃_K → X is a pro-étale cover.

*Proof outline.*

1. Reduce to X with an étale map to Tⁿ and to X_proét/X̃_K.
2. There OB_dR^+ = B_dR^+[[X_1, …, X_n]] with ∇ = Σ ∂/∂X_i ⊗ dT_i and the (ξ, X)-adic filtration (nodes local-structure-of-structural-de-rham-sheaf, connection-and-filtration-in-local-coordinates); Ω¹_X is free on dT_1, …, dT_n.
3. Apply the formal Poincaré lemma (node formal-poincare-lemma) sectionwise on affinoid perfectoid U with B = B_dR^+(U) (a Q-algebra), giving exactness and strict exactness; Griffiths transversality is ∂/∂X_i((ξ, X)^r) ⊂ (ξ, X)^{r−1}.
4. Inverting t (a horizontal nonzerodivisor in Fil¹) preserves strict exactness of the filtered complex; gr^r of a strict exact sequence is exact.

*Acceptance.*

- For n = 0 the lemma reads B_dR^+ = OB_dR^+ (node corrected-structural-de-rham-sheaf, test point).
- For X = T¹: the element X ∈ OB_dR^+ has ∇X = dT, and dT = ∇(u_1) is exact while u_1 ∉ B_dR^+.

*Uses.* `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/connection-and-filtration-in-local-coordinates`, `PadicHodgeTheory:P8:local-rational/formal-poincare-lemma`, `PadicHodgeTheory:P8:local-rational/toric-charts-for-smooth-spaces`, `PadicHodgeTheory:P8:local-rational/structural-de-rham-sheaf`, `AdicEtaleGeometry:A2`.

*Planet:* Poincaré lemma for OB_dR^+.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 6, Corollary 6.13 with proof, p. 39 (extraction lines 2268-2277): “Moreover, the derivation ∇ satisfies Griffiths transversality with respect to the filtration on OB+dR, and with respect to the grading giving ΩiX degree i, the sequence is strict exact.” The Poincaré lemma and strictness as stated.

#### Theorem. Faltings's extension 0 → Ô_X(1) → gr¹OB_dR^+ → Ô_X ⊗_{O_X} Ω¹_X → 0

*Node* `PadicHodgeTheory:P8:local-rational/faltings-extension`.

X smooth over Spa(k, O_k), where k is a complete discretely valued extension of Q_p with perfect residue field κ. There is a short exact sequence of Ô_X-modules on X_proét, 0 → Ô_X(1) → gr¹OB_dR^+ →gr(∇) Ô_X ⊗_{O_X} Ω¹_X → 0, where the first map is gr¹B_dR^+ ≅ Ô_X(1) followed by gr¹ of B_dR^+ → OB_dR^+, and the second is the graded piece of ∇ (gr¹OB_dR^+ → gr⁰OB_dR^+ ⊗ Ω¹ = Ô_X ⊗ Ω¹). Locally over X̃_K it is split, gr¹OB_dR^+ = Ô_X·ξ ⊕ ⊕_i Ô_X·X_i with X_i ↦ dT_i.

*Hypotheses.* X smooth over Spa(k, O_k), where k is a complete discretely valued extension of Q_p with perfect residue field κ.

*Proof outline.*

1. Take the graded piece in degree 1 of the strict exact Poincaré sequence (node poincare-lemma-and-faltings-extension): 0 → gr¹B_dR^+ → gr¹OB_dR^+ → gr⁰OB_dR^+ ⊗ Ω¹ → gr^{-1}(…) = 0.
2. gr¹B_dR^+ ≅ Ô_X(1) (node graded-de-rham-period-sheaf-tate-twist) and gr⁰OB_dR^+ = Ô_X (θ is surjective with kernel Fil¹).
3. Locally: gr¹ of B_dR^+[[X]] is Ô_X ξ ⊕ ⊕ Ô_X X_i and gr(∇)(X_i) = dT_i (node connection-and-filtration-in-local-coordinates).

*Acceptance.*

- The connecting map ν_*(Ô_X ⊗ Ω¹) = Ω¹_{X_ét} → R¹ν_*Ô_X(1) is an isomorphism (node pushforward-of-structural-de-rham-sheaf).
- For X = Spa(k, O_k) the extension is 0 → Ô_X(1) → Ô_X(1) → 0 → 0.

*Uses.* `PadicHodgeTheory:P8:local-rational/poincare-lemma-and-faltings-extension`, `PadicHodgeTheory:P8:local-rational/graded-de-rham-period-sheaf-tate-twist`, `PadicHodgeTheory:P8:local-rational/connection-and-filtration-in-local-coordinates`.

*Planet:* Faltings's extension.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 6, Corollary 6.14 with proof, p. 39 (extraction lines 2278-2285): “In particular, we get the following short exact sequence, often called Faltings’s extension.” The statement; the proof is 'the first graded piece of the Poincaré lemma'.

#### Lemma. gr^i OB_dR ≅ ξ^i Ô_X[X_1/ξ, …, X_n/ξ] over the toric cover

*Node* `PadicHodgeTheory:P8:local-rational/graded-structural-de-rham-sheaf-local-description`.

In the situation of node local-structure-of-structural-de-rham-sheaf, for every i ∈ Z there is an isomorphism of sheaves on X_proét/X̃_K, gr^i OB_dR ≅ ξ^i·Ô_X[X_1/ξ, …, X_n/ξ]; hence gr^• OB_dR ≅ Ô_X[ξ^{±1}, X_1, …, X_n] with ξ and all X_i in degree 1. Writing V_i for the class in gr⁰ of t^{-1}log([T_i♭]/T_i) = −t^{-1}log(1 + X_i/[T_i♭]) (as T_i = [T_i♭] + X_i), gr⁰OB_dR = Ô_X[V_1, …, V_n] over X̃_K.

*Hypotheses.* X smooth over Spa(k, O_k), where k is a complete discretely valued extension of Q_p with perfect residue field κ.

*Proof outline.*

1. By node connection-and-filtration-in-local-coordinates, OB_dR = B_dR^+[[X]][1/ξ] with Fil^r = Σ_j ξ^{-j}(ξ, X)^{r+j}; gr of B_dR^+[[X]] is Ô_X[ξ, X] (a polynomial ring), so gr of its localisation at ξ is Ô_X[ξ^{±1}, X] and gr^i = ξ^i Ô_X[X/ξ].
2. log([T_i♭]/T_i) = log(1 − u_i/T_i) ∈ Fil¹OB_dR^+ has leading term −X_i/T_i; dividing by t (= ξ·unit, θ(t/ξ) a unit) gives V_i ≡ −θ(ξ/t)·T_i^{-1}·X_i/ξ in gr⁰, so Ô_X[V] = Ô_X[X/ξ] (packet-authored; the source states the corollary without proof).

*Acceptance.*

- For n = 0, gr^i OB_dR = ξ^i Ô_X = Ô_X(i).
- The V_i are algebraically independent over Ô_X(U) in gr⁰OB_dR(U) for affinoid perfectoid U over X̃_K.

*Uses.* `PadicHodgeTheory:P8:local-rational/connection-and-filtration-in-local-coordinates`, `PadicHodgeTheory:P8:local-rational/structural-de-rham-sheaf`, `PadicHodgeTheory:R06.1/fontaine-element-t`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 6, Corollary 6.15, p. 39 (extraction lines 2286-2295): “gr• OBdR ≅ ÔX[ξ±1, X1, ..., Xn], where ξ and all Xi have degree 1.” The statement, given in the source without proof.

#### Theorem. The relative Poincaré lemma for a smooth morphism (with the completed tensor product)

*Node* `PadicHodgeTheory:P8:local-rational/relative-poincare-lemma`.

Let f: X → Y be a smooth morphism of relative dimension d between smooth adic spaces over Spa(k, O_k), with relative derivation ∇_{X/Y}: OB_dR,X^+ → OB_dR,X^+ ⊗_{O_X} Ω¹_{X/Y} (∇ followed by Ω¹_X → Ω¹_{X/Y}). Let B_dR,X^+ ⊗̂_{f^{-1}B_dR,Y^+} f^{-1}OB_dR,Y^+ denote the completion of the tensor product for the filtration induced by Fil^• (on sections over the toric covers: B_dR,X^+[[X_1, …, X_m]] where X_1, …, X_m are the base coordinates). Then 0 → B_dR,X^+ ⊗̂_{f^{-1}B_dR,Y^+} f^{-1}OB_dR,Y^+ → OB_dR,X^+ →∇_{X/Y} OB_dR,X^+ ⊗ Ω¹_{X/Y} → … → OB_dR,X^+ ⊗ Ω^d_{X/Y} → 0 is exact and strict exact for the filtration giving Ω^i_{X/Y} degree i. With the uncompleted tensor product printed in the source, exactness fails at OB_dR,X^+ (source issue PadicHodgeTheory/E12).

*Hypotheses.* f: X → Y smooth of relative dimension d; X, Y smooth over Spa(k, O_k). Locally f is, up to étale maps, the projection Tⁿ → T^{n−d} onto the first m = n − d coordinates (toric charts compatible with f; A2 supplies relative étale charts).

*Proof outline.*

1. Reduce to X = Tⁿ → Y = T^{n−d} (étale-local charts) and to X_proét/X̃_K.
2. There OB_dR,X^+ = B_dR,X^+[[X_1, …, X_n]], f^{-1}OB_dR,Y^+ = f^{-1}B_dR,Y^+ ⊗ (power series in X_1, …, X_m) and ∇_{X/Y} = Σ_{i>m} ∂/∂X_i ⊗ dT_i.
3. The formal Poincaré lemma in the variables X_{m+1}, …, X_n over the Q-algebra B_dR,X^+[[X_1, …, X_m]] gives exactness and strictness with kernel B_dR,X^+[[X_1, …, X_m]], which is the filtration-completion of B_dR,X^+ ⊗ f^{-1}OB_dR,Y^+ (packet-authored identification).
4. The uncompleted tensor product is strictly smaller: on T² → T¹ the section Σ_k [T_2♭]^k X_1^k of the kernel has coefficients spanning an infinitely generated f^{-1}B_dR,Y^+-module, so it is not in the image of the uncompleted tensor product.

*Acceptance.*

- For Y = Spa(k, O_k) (d = n) it reduces to the absolute Poincaré lemma since OB_dR,Y^+ = B_dR,Y^+.
- For f = id (d = 0) it reads OB_dR,X^+ = B_dR,X^+ ⊗̂_{B_dR,X^+} OB_dR,X^+.

*Uses.* `PadicHodgeTheory:P8:local-rational/poincare-lemma-and-faltings-extension`, `PadicHodgeTheory:P8:local-rational/formal-poincare-lemma`, `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/connection-and-filtration-in-local-coordinates`, `AdicEtaleGeometry:A2`.

*Planet:* Relative Poincaré lemma.

*Sources.*

- p-adic Hodge theory for rigid-analytic varieties, Section 8, Proposition 8.5 with proof, p. 49 (extraction lines 2937-2956): “It is strict exact with respect to the filtration giving ΩiX/Y degree i. Proof. It is enough to check the assertion in the case X = Tn, Y = Tn−d, with the evident projection.” The relative Poincaré lemma; the source's first term is an uncompleted tensor product (corrected here).
- Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 5, Proposition 5.1 (1), p. 43 (extraction lines 2652-2665): “(Relative Poincaré lemma) The following sequence of pro-étale sheaves is exact and strict with respect to the filtration” The crystalline analogue, printed with a completed tensor product Acris,X ⊗̂ fk^{-1}OAcris,Y as its first term.

#### Lemma. The Z_p^n-action on the log coordinates V_j of gr⁰OB_dR

*Node* `PadicHodgeTheory:P8:local-rational/gamma-action-on-log-coordinates`.

Let X → Tⁿ be étale, K ⊃ μ_{p^∞} perfectoid, X̃_K → X_K the Z_p^n-torsor with γ_i ∈ Z_p^n acting on T_i♭ by multiplication by ε and trivially on T_j♭ (j ≠ i), and V_j ∈ gr⁰OB_dR(X̃_K) the class of t^{-1}log([T_j♭]/T_j). Then γ_i(V_j) = V_j for i ≠ j and γ_i(V_i) = V_i + 1. Consequently gr⁰OB_dR(X̃_K) = R̃[V_1, …, V_n] with R̃ = Ô_X(X̃_K), and γ_i acts on polynomials in V_i by P(V_i) ↦ P(V_i + 1) (coefficients in R̃ acted on through the action on R̃).

*Hypotheses.* t = log([ε]) with γ(t) = t on X̃_K (the torsor action is K-linear; ε ∈ K♭ is fixed). T_j ∈ O_X is fixed by the torsor action.

*Proof outline.*

1. γ_i([T_i♭]) = [ε][T_i♭], so γ_i(log([T_i♭]/T_i)) = log([ε]) + log([T_i♭]/T_i) = t + log([T_i♭]/T_i); divide by t.
2. For j ≠ i, γ_i fixes [T_j♭] and T_j.
3. gr⁰OB_dR(X̃_K) = R̃[V_1, …, V_n] by node graded-structural-de-rham-sheaf-local-description.

*Acceptance.*

- For n = 1: (γ − 1)V^m = (V + 1)^m − V^m = mV^{m−1} + …; the operator γ − 1 on Q[V] has kernel Q and is surjective (checked with PARI/GP on degrees ≤ 8).
- log([T♭]/T) itself is not γ-invariant, so V is not a section of gr⁰OB_dR over X_K.

*Uses.* `PadicHodgeTheory:P8:local-rational/graded-structural-de-rham-sheaf-local-description`, `PadicHodgeTheory:R06.1/fontaine-element-t`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 6, Lemma 6.17 with proof, p. 40 (extraction lines 2325-2327): “The action of γi on Vj is given by γi(Vj) = Vj if i ≠ j and γi(Vi) = Vi + 1.” The statement and its one-line proof.

#### Lemma. R̃ = R ⊗̂_{k⟨T^{±1}⟩} K⟨T^{±1/p^∞}⟩ for the perfectoid toric cover

*Node* `PadicHodgeTheory:P8:local-rational/perfectoid-torus-cover-completed-tensor`.

Let X = Spa(R, R^+) be affinoid of finite type over Spa(k, O_k) with an étale map X → Tⁿ which is a composite of rational embeddings and finite étale maps, K ⊃ k perfectoid, and X̂̃_K = Spa(R̃, R̃^+). Then R^+ ⊗̂_{O_k⟨T^{±1}⟩} O_K⟨T^{±1/p^∞}⟩ → R̃^+ is injective with cokernel killed by a power of p; in particular R̃ = R ⊗̂_{k⟨T^{±1}⟩} K⟨T^{±1/p^∞}⟩.

*Hypotheses.* k complete discretely valued over Q_p; X affinoid of finite type with the stated toric chart.

*Proof outline.*

1. X̃_K = X ×_{Tⁿ} T̃ⁿ_K with T̃ⁿ_K affinoid perfectoid and X → Tⁿ a composite of rational embeddings and finite étale maps: apply the integral comparison of node affinoid-perfectoid-objects-and-etale-pullbacks (Lemma 4.5 (ii)) with U = T̃ⁿ_K, U_j the finite levels Tⁿ_K with T^{1/p^j}, and V_j the pullback of X.

*Acceptance.*

- For X = Tⁿ: R̃ = K⟨T^{±1/p^∞}⟩.
- For X = {|T − 1| ≤ |p|} ⊂ T¹: R̃ = k⟨T^{±1}, (T − 1)/p⟩ ⊗̂_{k⟨T^{±1}⟩} K⟨T^{±1/p^∞}⟩.

*Uses.* `PadicHodgeTheory:P8:local-rational/affinoid-perfectoid-objects-and-etale-pullbacks`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 6, Lemma 6.18 with proof, p. 40 (extraction lines 2337-2350): “This is an immediate consequence of Lemma 4.5 (ii).” The proof; the statement is the displayed injectivity with p-power-torsion cokernel.

#### Lemma. Continuous Γ_k-cohomology of R ⊗̂_k K̂_∞(i) (Tate's normalised traces, relative form)

*Node* `PadicHodgeTheory:P8:local-rational/tate-descent-for-completed-cyclotomic-tensor`.

Let k be complete discretely valued over Q_p with perfect residue field, k_∞ = k(μ_{p^∞}), K = k̂_∞, Γ_k = Gal(k_∞/k) acting on Q_p(i) through χ^i, and R a k-Banach algebra (e.g. an affinoid k-algebra) with trivial Γ_k-action. Then the inclusion R(i) → R ⊗̂_k K(i) induces isomorphisms H^q_cont(Γ_k, R(i)) ≅ H^q_cont(Γ_k, R ⊗̂_k K(i)) for all q, and H^q_cont(Γ_k, R(i)) = R ⊗_{Q_p} H^q_cont(Γ_k, Q_p(i)), which is R for i = 0 and q ∈ {0, 1} (H¹ spanned by log χ), and 0 otherwise.

*Hypotheses.* Brinon–Conrad, Lemma 14.1.9 and its proof: a Γ-equivariant splitting K̂_∞ = K_n ⊕ X_n of K-Banach spaces (Tate's normalised trace, axiom (TS3) for Sen's situation) with γ − λ bijective with bounded inverse on X_n for λ a 1-unit that is not a root of unity and γ a topological generator of an open pro-cyclic subgroup. Γ_k is an open subgroup of Z_p^× (χ injective on Γ_k), virtually pro-cyclic; finite-group cohomology of Q-vector spaces vanishes.

*Proof outline.*

1. Replace Γ_k by an open pro-cyclic subgroup Γ_n = γ^{Z_p} (inflation-restriction; the finite quotient contributes nothing on Q-vector spaces), and k by k_n.
2. Completed tensor with R of the splitting K = k_n ⊕ X_n gives R ⊗̂ K = R ⊗ k_n ⊕ R ⊗̂ X_n (R-linear, Γ-equivariant, bounded), and γ − χ(γ)^{-i} stays bijective with bounded inverse on R ⊗̂ X_n (the bounded inverse extends to completed tensor products); so H^q(Γ_n, R ⊗̂ X_n(i)) = 0 for all q (cohomology of Z_p on a module where γ − 1 is invertible) (packet-authored extension of Brinon–Conrad 14.1.9 to Banach coefficients).
3. On R ⊗ k_n(i) = R(i) ⊗ k_n: H^0 = ker(χ(γ)^i − 1), H^1 = coker(χ(γ)^i − 1); for i ≠ 0, χ(γ)^i − 1 ≠ 0 is invertible in Q_p, so both vanish; for i = 0, H^0 = H^1 = R ⊗ k_n and taking Gal(k_n/k)-invariants gives R; H^q = 0 for q ≥ 2 (cohomological dimension 1 of Z_p on Q-vector spaces).

*Acceptance.*

- R = k, i = 0: H¹_cont(Γ_k, K) = k·log χ, the classical statement of Tate (Brinon–Conrad Theorem 2.2.7 for C_K).
- Numerical check (PARI/GP, p = 5, χ(γ) = 1 + p): v_p((1+p)^i − 1) = 1 + v_p(i) for 1 ≤ |i| ≤ 30, so χ(γ)^i − 1 ≠ 0 and the twisted H¹ vanishes rationally; integrally it is killed by p^{1+v_p(i)}.

*Uses.* `mathlib:continuousCohomology`, `mathlib:cyclotomicCharacter`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Section 14.1, Lemma 14.1.9, p. 242 (extraction lines 12189-12193): “For any λ ∈ 1 + mK that is not a p-power root of unity, the bounded K-linear operator γ − λ on K̂∞ is bijective.” Tate's key lemma, whose proof supplies the splitting K̂_∞ = K ⊕ X used here.
- p-adic Hodge theory for rigid-analytic varieties, Section 6, proof of Proposition 6.16 (ii), p. 41 (extraction lines 2389-2394): “Similarly to Lemma 5.5, the map R(i) → R ⊗̂k K(i) induces an isomorphism on continuous Γk-cohomology.” The step of Scholze's proof that this node proves; it is a Tate-type descent, not a consequence of Lemma 5.5.

#### Theorem. H^q(X_K, gr⁰OB_dR) = 0 for q > 0 and = R ⊗̂_k K for q = 0

*Node* `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`.

Let X = Spa(R, R^+) be affinoid of finite type over Spa(k, O_k) with an étale map X → Tⁿ that is a composite of rational embeddings and finite étale maps, and let K be a perfectoid field containing k and all p-power roots of unity (K the completion of an algebraic extension of k). Then H^q(X_K, gr⁰OB_dR) = 0 for q > 0 and H^0(X_K, gr⁰OB_dR) = R ⊗̂_k K; the same holds for every gr^i OB_dR, which is isomorphic to gr⁰OB_dR on X_proét/X_K (multiplication by t^i).

*Hypotheses.* X_K ∈ X_proét is the base change to K; X̃_K → X_K is a pro-finite-étale Z_p^n-torsor whose fibre powers X̃_K ×_{X_K} … ×_{X_K} X̃_K ≅ X̃_K × Z_p^{n(m−1)} are affinoid perfectoid. Inputs: Cartan–Leray spectral sequence for this torsor and H^i(pt, F_M) = H^i_cont(G, M) for the corrected pro-finite-étale site (A1, H0); continuous Z_p^n-cohomology of the perfectoid torus via the Koszul complex (Scholze Lemma 5.5, requested from AI.3).

*Proof outline.*

1. By node rational-acyclicity-of-de-rham-period-sheaves and the local description, gr⁰OB_dR = Ô_X[V_1, …, V_n] has no higher cohomology on affinoid perfectoids over X̃_K (free Ô_X-module, Ô_X acyclic there); its values on X̃_K × S are Hom_cont(S, R̃[V]) (node period-sheaves-on-profinite-products applied to Ô_X termwise; the source asserts this 'version of Corollary 6.6').
2. Cartan–Leray: H^q(X_K, gr⁰OB_dR) = H^q_cont(Z_p^n, R̃[V_1, …, V_n]).
3. (R ⊗̂_k K)[V] ⊂ R̃[V] induces an isomorphism on continuous Z_p^n-cohomology: filter by total V-degree; on the graded pieces Z_p^n acts trivially on the V's (node gamma-action-on-log-coordinates), so it suffices that R ⊗̂ K ⊂ R̃ does; by node perfectoid-torus-cover-completed-tensor R̃ = R ⊗̂ K⟨T^{±1/p^∞}⟩, and by Lemma 5.5 (AI.3) the non-integral exponents contribute cohomology killed by ζ_p − 1, which vanishes after inverting p, compatibly with the completed base change.
4. Compute H^q_cont(Z_p^n, S[V_1, …, V_n]) for S = R ⊗̂ K inductively: γ_i − 1 acts on S'[V_i] (S' = S[V_1, …, V_{i−1}]) by P(V_i) ↦ P(V_i + 1) − P(V_i), with kernel S' and trivial cokernel (Q-algebra); so H^0 = S and H^q = 0 for q > 0.

*Acceptance.*

- For X = Tⁿ: H^0(X_K, gr⁰OB_dR) = K⟨T^{±1}⟩ and all higher cohomology vanishes.
- The polynomial computation (γ − 1 on Q[V] has kernel Q and is surjective) was checked with PARI/GP in degrees ≤ 8.

*Uses.* `PadicHodgeTheory:P8:local-rational/gamma-action-on-log-coordinates`, `PadicHodgeTheory:P8:local-rational/perfectoid-torus-cover-completed-tensor`, `PadicHodgeTheory:P8:local-rational/graded-structural-de-rham-sheaf-local-description`, `PadicHodgeTheory:P8:local-rational/rational-acyclicity-of-de-rham-period-sheaves`, `PadicHodgeTheory:P8:local-rational/period-sheaves-on-profinite-products`, `AInfCohomology:AI.3`, `AdicEtaleGeometry:A1`, `ClassicalAdicEtaleCohomology:H0`, `mathlib:continuousCohomology`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 6, Proposition 6.16 (i) with proof, pp. 39-40 (extraction lines 2296-2365): “Assume that K contains all p-power roots of unity. Then Hq(XK, gr0 OBdR) = 0 unless q = 0, in which case it is given by R ⊗̂k K.” The statement; the proof follows Brinon's Proposition 4.1.2 through Lemmas 6.17 and 6.18.

#### Theorem. H^q(X, gr^i OB_dR) over k: only R (q = 0) and R·log χ (q = 1) for i = 0

*Node* `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf`.

Let X = Spa(R, R^+) be affinoid of finite type over Spa(k, O_k) with an étale map X → Tⁿ that is a composite of rational embeddings and finite étale maps. Then H^q(X, gr^i OB_dR) = 0 unless i = 0 and q ∈ {0, 1}; (gr⁰OB_dR)(X) = R and H¹(X, gr⁰OB_dR) = R·log χ, where χ: Gal(k̄/k) → Z_p^× is the cyclotomic character and log χ ∈ Hom_cont(Gal(k̄/k), Q_p) = H¹_cont(Gal(k̄/k), Q_p).

*Hypotheses.* K the completion of k(μ_{p^∞}), Γ_k = Gal(k(μ_{p^∞})/k); X_K → X is a pro-finite-étale Γ_k-torsor with X_K^{m/X} ≅ X_K × Γ_k^{m−1}.

*Proof outline.*

1. On X_proét/X_K, gr^i OB_dR ≅ gr⁰OB_dR(i) (multiplication by t^i), so node cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base gives H^q(X_K, gr^i OB_dR) = 0 for q > 0 and (R ⊗̂ K)(i) for q = 0.
2. H^q(X_K^{m/X}, gr^i OB_dR) = Hom_cont(Γ_k^{m−1}, H^q(X_K, gr^i OB_dR)): compute on the cover X̃_K ×_{X_K} X_K^{m/X} with the profinite-product formula at each step (the source's 'inspection of the proof').
3. Cartan–Leray for X_K → X: H^q(X, gr^i OB_dR) = H^q_cont(Γ_k, R ⊗̂_k K(i)).
4. Node tate-descent-for-completed-cyclotomic-tensor: this is R for i = 0, q ∈ {0, 1} (the class in degree 1 is log χ) and 0 otherwise.

*Acceptance.*

- For X = Tⁿ over k: H¹(X, gr⁰OB_dR) = k⟨T^{±1}⟩·log χ ≠ 0; in particular R¹ν_* gr⁰OB_dR = O_{X_ét}·log χ ≠ 0 over k, so higher direct images of gr⁰OB_dR do not vanish over a discretely valued base (they do over X_K).
- gr^i for i ≠ 0 is acyclic including H^0: (gr^i OB_dR)(X) = 0 for i ≠ 0.

*Uses.* `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `PadicHodgeTheory:P8:local-rational/tate-descent-for-completed-cyclotomic-tensor`, `PadicHodgeTheory:P8:local-rational/period-sheaves-on-profinite-products`, `PadicHodgeTheory:R06.1/fontaine-element-t`, `AdicEtaleGeometry:A1`, `ClassicalAdicEtaleCohomology:H0`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 6, Proposition 6.16 (ii) with proof, pp. 39-41 (extraction lines 2302-2394): “If i = 0, we have (gr0 OBdR)(X) = R and H1(X, gr0 OBdR) = R log χ.” The statement; Tate's computation of H^q_cont(Γ_k, Q_p(i)) is the last step.

#### Theorem. ν_*OB_dR = O_{X_ét}, ν_*Ô_X = O_{X_ét}, ν_*Ô_X(n) = 0 (n ≥ 1), R¹ν_*Ô_X(1) ≅ Ω¹_{X_ét}, R¹ν_*Ô_X(n) = 0 (n ≥ 2)

*Node* `PadicHodgeTheory:P8:local-rational/pushforward-of-structural-de-rham-sheaf`.

X smooth over Spa(k, O_k), where k is a complete discretely valued extension of Q_p with perfect residue field κ, and ν: X_proét → X_ét. Then: (i) ν_*OB_dR = O_{X_ét} (and ν_* gr⁰OB_dR = O_{X_ét}); (ii) ν_*Ô_X = O_{X_ét}; (iii) ν_*Ô_X(n) = 0 for n ≥ 1; (iv) the connecting map of Faltings's extension Ω¹_{X_ét} = ν_*(Ô_X ⊗ Ω¹_X) → R¹ν_*Ô_X(1) is an isomorphism; (v) R¹ν_*Ô_X(n) = 0 for n ≥ 2.

*Hypotheses.* X smooth over Spa(k, O_k), where k is a complete discretely valued extension of Q_p with perfect residue field κ. X is covered by affinoids with toric charts that are composites of rational embeddings and finite étale maps (node toric-charts-for-smooth-spaces), so Proposition 6.16 computes the stalks of R^qν_* gr^i OB_dR.

*Proof outline.*

1. (i) (the source says 'The first part is clear'; packet-authored argument): a section of OB_dR over a qcqs X lies in t^{-j}OB_dR^+ for some j, so ν_*OB_dR = colim_j ν_*(t^{-j}OB_dR^+). The sheaf F = t^{-j}OB_dR^+ carries the complete separated filtration F^r = t^{-j}Fil^{r+j}OB_dR^+ (OB_dR^+ is ker θ-adically complete), with gr^r F = t^{-j}gr^{r+j}OB_dR^+, which over X̃_K is the part of V-degree ≤ r + j of gr^r OB_dR = t^r Ô_X[V_1, …, V_n] (node connection-and-filtration-in-local-coordinates).
2. On an affinoid X with a toric chart, H^0 of gr^r F is computed as in Proposition 6.16: Z_p^n-invariants of the degree-bounded polynomials are the constants (induction on the top degree using γ_i(V_i) = V_i + 1), and Γ_k-invariants of (R ⊗̂ K)(r) are R for r = 0 and 0 otherwise (node tate-descent-for-completed-cyclotomic-tensor). So ν_* gr^r F = 0 for r ≠ 0 and ν_* gr⁰F = O_{X_ét}.
3. Left exactness of ν_* and ν_*(lim) = lim ν_* give ν_*F^1 = lim_r ν_*(F^1/F^r) = 0 and ν_*(F/F^0) = 0, hence ν_*F ↪ ν_*(F/F^1) = ν_* gr⁰F = O_{X_ét}; as O_{X_ét} → ν_*OB_dR^+ → ν_*F, ν_*F = O_{X_ét} for every j and ν_*OB_dR = O_{X_ét}.
4. (ii): the gr⁰ of the t-inverted Poincaré sequence is 0 → Ô_X → gr⁰OB_dR → gr^{-1}OB_dR ⊗ Ω¹ → …; applying ν_* gives ν_*Ô_X ↪ ν_* gr⁰OB_dR = O_{X_ét}, and O_{X_ét} → ν_*Ô_X splits it.
5. (iii)-(v): the gr^n pieces 0 → Ô_X(n) → gr^n OB_dR → gr^{n−1}OB_dR ⊗ Ω¹ → … with the vanishing of ν_* and R¹ν_* of gr^j OB_dR for j ≠ 0 give ν_*Ô_X(n) = 0 for n ≥ 1, R¹ν_*Ô_X(n) = 0 for n ≥ 2, and for n = 1 an isomorphism R¹ν_*Ô_X(1) ≅ ν_*(gr⁰OB_dR ⊗ Ω¹)/(image) = Ω¹_{X_ét}; that it is the connecting map of Faltings's extension is checked on the explicit local description (source: 'one directly checks').

*Acceptance.*

- For X = Spa(k, O_k): ν_*Ô_X = k and R¹ν_*Ô_X(1) = 0 = Ω¹, recovering H^0(G_k, C) = k and H¹(G_k, C(1)) = 0 (Brinon–Conrad Theorem 2.2.7).
- For X = T¹: R¹ν_*Ô_X(1) is free of rank one over O_{X_ét}, generated by the image of dT/T.

*Uses.* `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `PadicHodgeTheory:P8:local-rational/tate-descent-for-completed-cyclotomic-tensor`, `PadicHodgeTheory:P8:local-rational/connection-and-filtration-in-local-coordinates`, `PadicHodgeTheory:P8:local-rational/poincare-lemma-and-faltings-extension`, `PadicHodgeTheory:P8:local-rational/faltings-extension`, `PadicHodgeTheory:P8:local-rational/toric-charts-for-smooth-spaces`, `PadicHodgeTheory:P8:local-rational/structural-de-rham-sheaf`, `ClassicalAdicEtaleCohomology:H0`, `AdicEtaleGeometry:A1`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 6, Corollary 6.19 with proof, p. 41 (extraction lines 2396-2417): “Let X be a smooth adic space over Spa(k, Ok). Then ν∗OBdR = OXét. Moreover, ν∗ÔX = OXét, ν∗ÔX(n) = 0 for n ≥ 1, R1ν∗ÔX(1) ≅ Ω1Xét via the connecting map in Faltings’s extension, and R1ν∗ÔX(n) = 0 for n ≥ 2.” The statement.

#### Theorem. R^iν_*Ô_X(j) = Ω^j_{X_ét} (i = j), Ω^j_{X_ét}·log χ (i = j + 1), 0 otherwise

*Node* `PadicHodgeTheory:P8:local-rational/higher-direct-images-of-twisted-completed-structure-sheaf`.

X smooth over Spa(k, O_k), where k is a complete discretely valued extension of Q_p with perfect residue field κ. For all i ≥ 0 and j ∈ Z: R^iν_*Ô_X(j) = Ω^j_{X_ét} if i = j, Ω^j_{X_ét}·log χ if i = j + 1, and 0 otherwise (Ω^j = 0 for j < 0 or j > dim X). Equivalently Rν_*Ô_X(j) ≅ Ω^j_{X_ét}[−j] ⊕ Ω^j_{X_ét}·log χ[−j−1]. (The source prints Ω^i for i = j + 1, a misprint recorded by the reviewed decomposition.)

*Hypotheses.* X smooth over Spa(k, O_k), where k is a complete discretely valued extension of Q_p with perfect residue field κ. Stated in the source without proof; the proof below is packet-authored.

*Proof outline.*

1. The t-inverted Poincaré lemma gives, in graded degree j, a resolution 0 → Ô_X(j) → gr^j OB_dR → gr^{j−1}OB_dR ⊗ Ω¹ → … → gr^{j−n}OB_dR ⊗ Ωⁿ → 0 (node poincare-lemma-and-faltings-extension).
2. By node cohomology-of-graded-structural-de-rham-sheaf, Rν_* gr^m OB_dR = 0 for m ≠ 0 and Rν_* gr⁰OB_dR = O_{X_ét} ⊕ O_{X_ét}·log χ[−1] (a direct sum because log χ is a class pulled back from the base); only the term gr⁰OB_dR ⊗ Ω^j (position j in the resolution) contributes.
3. Hence Rν_*Ô_X(j) ≅ (O_{X_ét} ⊕ O_{X_ét} log χ[−1]) ⊗ Ω^j[−j].

*Acceptance.*

- j = 0: R⁰ν_*Ô_X = O_{X_ét} and R¹ν_*Ô_X = O_{X_ét}·log χ; the printed Ω^i for i = j + 1 would give Ω¹ here, contradicting Corollary 6.19 applied with the gr⁰ computation.
- j = 1: recovers R¹ν_*Ô_X(1) = Ω¹ and R²ν_*Ô_X(1) = Ω¹·log χ.

*Uses.* `PadicHodgeTheory:P8:local-rational/pushforward-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/poincare-lemma-and-faltings-extension`, `ClassicalAdicEtaleCohomology:H0`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 6, Remark 6.20, p. 41 (extraction lines 2403-2404): “One could compute all Ri ν∗ÔX(j). They are 0 if i < j or i > j + 1” The statement (with the misprint corrected as recorded by the reviewed decomposition).

#### Lemma. Almost inverse-limit lemma for p-adically complete A_cris-modules on affinoid perfectoids

*Node* `PadicHodgeTheory:P8:local-rational/almost-limit-lemma-for-acris-modules`.

Let X a locally noetherian adic space over Spa(k, O_k), k complete discretely valued over Q_p with perfect residue field κ, k̄ an algebraic closure and X_k̄ = lim X_{k'} ∈ X_proét, and I ⊂ A_cris(O_C) the ideal generated by [ε]^{1/p^N} − 1 and [p♭]^{1/p^N} (N ≥ 0), so that I·(A_cris/p^n) = I²·(A_cris/p^n) (almost setting). Let F be a p-adically complete sheaf of A_cris-modules on X_proét, flat over Z_p, F_n = F/p^n. Assume that for every affinoid perfectoid U over X_k̄ there are a p-adically complete Z_p-flat A_cris-module F(U) and a map α_U: F(U) → F(U) with α_U mod p: F(U)/p → F_1(U) an almost isomorphism, and H^i(U, F_1) almost zero for i > 0. Then for such U, n ≥ 1, i > 0: α_U mod p^n: F(U)/p^n → F_n(U) is an almost isomorphism and H^i(U, F_n) is almost zero; I·R¹lim F_n(U) = 0; ker α_U and coker α_U are killed by I²; I²·R^i lim F_n = 0; and I^{2i+1}·H^i(U, F) = 0.

*Hypotheses.* X a locally noetherian adic space over Spa(k, O_k), k complete discretely valued over Q_p with perfect residue field κ, k̄ an algebraic closure and X_k̄ = lim X_{k'} ∈ X_proét.

*Proof outline.*

1. Induction on n with 0 → F_1 → F_{n+1} → F_n → 0 (Z_p-flatness) and the five lemma, using I = I² modulo p^n (Brinon, Lemme 6.3.1, quoted by Tan–Tong).
2. The inverse-limit functor on sheaves factors as sheaves → presheaves → lim of presheaves → sheafification; with injective resolutions and the exact sequence 0 → R¹lim′ R^{i−1}σ → R^iτ → lim′ R^iσ → 0 of presheaves, I² kills R^i lim F_n for i > 0.
3. The spectral sequence H^i(U, R^j lim F_n) ⇒ H^{i+j}(U, R lim F_n) and 0 → R¹lim H^{i−1}(U, F_n) → H^i(U, R lim F_n) → lim H^i(U, F_n) → 0 give the bound I^{2i+1}.

*Acceptance.*

- F = A_cris and F(U) = A_cris(R, R^+) (node crystalline-period-sheaves-on-affinoid-perfectoids).
- After inverting t (a multiple of [ε] − 1 ∈ I) all almost statements become exact.

*Uses.* `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves`, `AdicEtaleGeometry:A1`, `ClassicalAdicEtaleCohomology:H0`.

*Source.* Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.1, Lemma 2.6 with proof, pp. 7-9 (extraction lines 410-530): “Let F be a p-adically complete sheaf of Acris-modules on Xproét, flat over Zp. Set Fn = F/pn, n ∈ Z≥1.” The hypotheses of the lemma; conclusions (1)-(2) follow in the source.

#### Theorem. Values and acyclicity of A_cris, B_cris^+, B_cris on affinoid perfectoids

*Node* `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves-on-affinoid-perfectoids`.

Let X a locally noetherian adic space over Spa(k, O_k), k complete discretely valued over Q_p with perfect residue field κ, k̄ an algebraic closure and X_k̄ = lim X_{k'} ∈ X_proét and U ∈ X_proét an affinoid perfectoid over X_k̄ with Û = Spa(R, R^+). Let A_cris(R, R^+) be the p-adic completion of W(R♭+)[ξ^n/n!], with its PD filtration closure Fil^r, B_cris^+(R, R^+) = A_cris(R, R^+)[1/p], B_cris(R, R^+) = B_cris^+(R, R^+)[1/t]. Then (a) the natural filtered map A_cris(R, R^+) → A_cris(U) induces almost isomorphisms Fil^r A_cris(R, R^+)/p^n → (Fil^r A_cris/p^n)(U), and H^i(U, Fil^r A_cris/p^n) is almost zero for i > 0; (b) the kernel and cokernel of Fil^r A_cris(R, R^+) → Fil^r A_cris(U) are killed by I², I²·R^i lim_n Fil^r A_cris/p^n = 0 and I^{2i+1}·H^i(U, Fil^r A_cris) = 0; (c) B_cris(R, R^+) → B_cris(U) and Fil^r B_cris(R, R^+) → Fil^r B_cris(U) are isomorphisms for all r ∈ Z, and H^i(U, B_cris) = H^i(U, Fil^r B_cris) = 0 for i ≥ 1.

*Hypotheses.* X a locally noetherian adic space over Spa(k, O_k), k complete discretely valued over Q_p with perfect residue field κ, k̄ an algebraic closure and X_k̄ = lim X_{k'} ∈ X_proét. Imported from AI.3: Lemma 4.10 (Ô_X^+(U) = R^+ with almost acyclicity) and Lemma 5.10 (Ô^+_{X♭}(U) = R♭+ with almost acyclicity). Brinon's identification A_cris(R, R^+)/p ≅ (R♭+/(p♭)^p)[δ_i : i ∈ N]/(δ_i^p) (Brinon, Proposition 6.1.2, quoted by Tan–Tong; Brinon's memoir is not available here) and its sheaf analogue on X_proét/X_k̄.

*Proof outline.*

1. The PD structure on Fil¹A_cris(U) gives the filtered map A_cris(R, R^+) → A_cris(U).
2. By Lemma 2.6 (node almost-limit-lemma-for-acris-modules) reduce (a) to n = 1; by the exact sequences 0 → Fil^{r+1}/p → Fil^r/p → Ô_X^+/p → 0 and Lemma 4.10 reduce to r = 0.
3. For r = 0, n = 1: A_cris/p ≅ ⊕ copies of Ô^+_{X♭}/(p♭)^p (Brinon's description), and Lemma 4.10/5.10 give the almost isomorphism and almost acyclicity.
4. (b) is Lemma 2.6 (2). (c): invert t (divisible by [ε] − 1 ∈ I, so I·B_cris = B_cris) for B_cris; for Fil^r B_cris twist to r = 0 and use gr^s B_cris^+ = Ô_X·ξ^{[s]} (acyclic, correct sections by Lemma 4.10) and the fact that t^s kills H^i(U, Fil^s B_cris^+) for s ≥ 2i + 1, then pass to the colimit over s.

*Acceptance.*

- For X = Spa(C, O_C) and U = Spa C: B_cris(U) = Fontaine's B_cris (exact, not only almost).
- Non-example: A_cris(R, R^+) → A_cris(U) need not be an isomorphism; only its kernel and cokernel are killed by I² (Tan–Tong, Corollary 2.8 (1)).

*Uses.* `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/almost-limit-lemma-for-acris-modules`, `PadicHodgeTheory:P8:local-rational/completed-structure-sheaf-on-affinoid-perfectoids`, `AInfCohomology:AI.3`, `AdicEtaleGeometry:A1`.

*Sources.*

- Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.1, Lemma 2.7, p. 9 (extraction lines 531-536): “Then there is a natural filtered morphism Acris(R, R+) → Acris(U) of Acris-algebras, inducing an almost isomorphism Filr Acris(R, R+)/pn → (Filr Acris/pn)(U) for any r ≥ 0 and n ≥ 1. Moreover, Hi(U, Filr Acris/pn)a = 0 for any i > 0.” Statement (a).
- Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.1, Corollary 2.8 (2), pp. 10-11 (extraction lines 603-616): “Moreover, Hi(U, Bcris) = Hi(U, Filr Bcris) = 0 for i ≥ 1.” Statement (c): rational local acyclicity of the crystalline period sheaves.

#### Theorem. B_cris^+ ↪ B_dR^+ and B_cris ↪ B_dR as filtered subsheaves

*Node* `PadicHodgeTheory:P8:local-rational/crystalline-to-de-rham-period-sheaf-embedding`.

Let X be the generic fibre of a smooth formal scheme over O_k, k absolutely unramified (the setting of Tan–Tong §§2.2-2.4; the maps exist for any locally noetherian X over Spa(k, O_k)). There are injective filtered maps B_cris^+ → B_dR^+ and B_cris → B_dR of sheaves on X_proét extending A_inf → B_dR^+; Fil^i B_cris^+ = Fil^i B_dR^+ ∩ B_cris^+ (i ≥ 0) and Fil^i B_cris = Fil^i B_dR ∩ B_cris (i ∈ Z); the induced maps gr^i B_cris^+ → gr^i B_dR^+ and gr^i B_cris → gr^i B_dR are isomorphisms; over X_proét/X_k̄ the sheaves A_cris and B_cris^+ have no t-torsion. In particular the filtrations on B_cris^+ and B_cris are decreasing, separated and exhaustive.

*Hypotheses.* As in Tan–Tong §2.4. Injectivity of B_cris^+ → B_dR^+ is proved in the source only by reference to Brinon, Proposition 6.2.1 ('we omit the detail here'); recorded as gap and source issue PadicHodgeTheory/E17.

*Proof outline.*

1. A_inf → B_dR^+ extends to A_cris^0 because B_dR^+ is a Q-algebra; modulo Fil^n B_dR^+ the image of A_cris^0 lies in p^{-n}(W(Ô^+_{X♭})/(ker θ)^n), which is p-adically complete, so it extends to A_cris; take lim_n and invert p.
2. Filtration compatibility: gr^r B_cris^+|_{X_k̄} = Ô_X·ξ^r/r! → gr^r B_dR^+ = Ô_X·ξ^r is an isomorphism (1/r! a unit); strictness of the filtered map follows.
3. Injectivity: reduce to affinoid perfectoid U over X_k̄ and to A_cris(R, R^+) → B_dR^+(R, R^+) (Tan–Tong refer to Brinon 6.2.1; gap).
4. No t-torsion: B_dR^+ has no t-torsion (ξ, hence t, is a nonzerodivisor), so neither has its subsheaf B_cris^+; invert t for B_cris ⊂ B_dR.

*Acceptance.*

- On Spa(C, O_C): recovers Fontaine's B_cris ⊂ B_dR with Fil^i B_cris = B_cris ∩ t^i B_dR^+ (R06.1).
- gr⁰B_cris = gr⁰B_dR = Ô_X.

*Uses.* `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/period-sheaves-definitions`, `PadicHodgeTheory:P8:local-rational/de-rham-period-sheaf`, `PadicHodgeTheory:R06.1/crystalline-period-ring`.

*Sources.*

- Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.4, Proposition 2.23 (1)-(2) with proof, pp. 21-22 (extraction lines 1281-1390): “There are injective filtered morphisms B+cris ↪ B+dR and OB+cris ↪ OB+dR.” The embedding; the B_cris part is this node, the OB_cris part is node structural-crystalline-to-de-rham-embedding.
- Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.4, proof of Proposition 2.23 (1), p. 22 (extraction lines 1380-1382): “This can be done in the same way as [Bri, Proposition 6.2.1], and we omit the detail here.” The omitted injectivity argument (gap).

#### Theorem. OA_cris|_{X̃} ≅ A_cris{⟨u_1, …, u_d⟩}|_{X̃}, strictly compatible with filtrations

*Node* `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-crystalline-sheaf`.

Let k absolutely unramified (k = W(κ)[1/p], κ perfect); 𝔛 a smooth formal scheme over O_k = W(κ) of relative dimension d with rigid generic fibre X; w: X_proét → 𝔛_ét the morphism of topoi induced by Y ↦ Y_k (for Y étale over 𝔛), and assume 𝔛 is small: there is an étale map 𝔛 → Spf O_k{T_1^{±1}, …, T_d^{±1}}. Let X̃ = X ×_{Tᵈ} T̃ᵈ, T_i♭ = (T_i, T_i^{1/p}, …) ∈ Ô^+_{X♭}(X̃), and A_cris{⟨u_1, …, u_d⟩} the p-adic completion of the PD polynomial sheaf A_cris^0⟨u_1, …, u_d⟩ ⊂ B_inf[u], with Fil^r = closure of Σ_i Fil^{r−|i|}A_cris^0·u^{[i]}. Then α: A_cris{⟨u⟩}|_{X̃} → OA_cris|_{X̃}, u_i ↦ T_i ⊗ 1 − 1 ⊗ [T_i♭], is an isomorphism strictly compatible with the filtrations; after inverting p and t, B_cris^+{⟨u⟩} ≅ OB_cris^+ and B_cris{⟨u⟩} ≅ OB_cris strictly filtered. In particular OA_cris is p-torsion free, OA_cris ⊂ OB_cris^+ ⊂ OB_cris.

*Hypotheses.* k absolutely unramified (k = W(κ)[1/p], κ perfect); 𝔛 a smooth formal scheme over O_k = W(κ) of relative dimension d with rigid generic fibre X; w: X_proét → 𝔛_ét the morphism of topoi induced by Y ↦ Y_k (for Y étale over 𝔛); 𝔛 small. k̄ an algebraic closure; the isomorphism is checked over X_proét/X̃_k̄, X̃_k̄ → X̃ being a pro-étale cover.

*Proof outline.*

1. (Lemma 2.14) Over X̃_k̄, O_X^{ur+} → A_cris{⟨u⟩}, T_i ↦ u_i + [T_i♭]: for U affinoid perfectoid over X̃_k̄ and Y = Spf(A) étale over 𝔛 with U → Y_k, lift A → R^+ (reduction of θ') modulo p^n through the nilpotent-kernel map A_cris(R, R^+){⟨u⟩}/p^n → R^+/p^n by étaleness of O_k{T^{±1}} → A (u_i + [T_i♭] is invertible as u_i has divided powers), take the limit, then use A_cris(R, R^+){⟨u⟩} → A_cris{⟨u⟩}(U) (Lemma 2.7) and sheafify.
2. Extending scalars gives β: OA_inf|_{X̃_k̄} → A_cris{⟨u⟩}, with θ' ∘ β = θ_X; ker θ' has divided powers, so β extends to OA_cris^0 and, by p-adic completeness, to OA_cris; β preserves Fil.
3. α and β are inverse (both send u_i ↔ T_i ⊗ 1 − 1 ⊗ [T_i♭] and are A_cris-linear continuous); strictness follows because both preserve filtrations.
4. p-torsion freeness reduces to that of A_cris^0⟨u⟩ (node crystalline-period-sheaves).

*Acceptance.*

- For d = 0: OA_cris = A_cris.
- ∇(u_i^{[n]}) = u_i^{[n−1]} ⊗ dT_i under α (A_cris-linearity).

*Uses.* `PadicHodgeTheory:P8:local-rational/structural-crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves`, `AInfCohomology:AI.3`, `AdicEtaleGeometry:A1`.

*Source.* Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.2, Proposition 2.13, Lemma 2.14 with proofs, Corollaries 2.15-2.16, pp. 14-16 (extraction lines 841-975): “The morphism α of (2.2.4) is an isomorphism. Moreover, α is strictly compatible with the filtrations on both sides, i.e., the inverse of the isomorphism α respects also the filtrations of both sides.” The local description.

#### Theorem. The crystalline Poincaré lemma for OA_cris, OB_cris^+ and OB_cris

*Node* `PadicHodgeTheory:P8:local-rational/crystalline-poincare-lemma`.

Let k absolutely unramified (k = W(κ)[1/p], κ perfect); 𝔛 a smooth formal scheme over O_k = W(κ) of relative dimension d with rigid generic fibre X; w: X_proét → 𝔛_ét the morphism of topoi induced by Y ↦ Y_k (for Y étale over 𝔛). The sequence 0 → A_cris → OA_cris →∇ OA_cris ⊗_{O_X^{ur+}} Ω^{1,ur+}_{X/k} →∇ … →∇ OA_cris ⊗ Ω^{d,ur+}_{X/k} → 0 of sheaves on X_proét is exact and strictly exact for the filtration giving Ω^{i,ur+}_{X/k} degree i; ∇ is integrable and satisfies Griffiths transversality. The same holds for B_cris^+ → OB_cris^+ and B_cris → OB_cris.

*Hypotheses.* k absolutely unramified (k = W(κ)[1/p], κ perfect); 𝔛 a smooth formal scheme over O_k = W(κ) of relative dimension d with rigid generic fibre X; w: X_proét → 𝔛_ét the morphism of topoi induced by Y ↦ Y_k (for Y étale over 𝔛).

*Proof outline.*

1. The question is local on 𝔛; take 𝔛 small and use the local description (node local-structure-of-structural-crystalline-sheaf): OA_cris|_{X̃} = A_cris{⟨u⟩} with Fil^i the completion of Σ Fil^{i−|m|}A_cris u^{[m]} and ∇(u_i^{[n]}) = u_i^{[n−1]} ⊗ dT_i.
2. The PD de Rham complex of A{⟨u_1, …, u_d⟩} over any Z_p-flat A resolves A (divided powers make every PD monomial u^{[n]}du_i exact: it is d(u^{[n+1]})), strictly for the filtration; p-adic completion preserves exactness of this complex of p-torsion-free sheaves (Mittag-Leffler), and inverting p, t preserves it.

*Acceptance.*

- For d = 1: u^{[n]} ⊗ dT = ∇(u^{[n+1]}), so every 1-form is exact integrally (contrast: over Z_p[[u]] the form u^{p−1}du is not exact).
- The kernel of ∇ on OB_cris is B_cris (Tan–Tong introduction: OB_cris^{∇=0} = B_cris).

*Uses.* `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-crystalline-sheaf`, `PadicHodgeTheory:P8:local-rational/structural-crystalline-period-sheaves`, `AdicSpacesPartII:R2`.

*Source.* Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.2, Corollary 2.17 with proof, p. 16 (extraction lines 1003-1027): “(Crystalline Poincaré lemma). Let X be a smooth formal scheme of dimension d over Ok. Then there is an exact sequence of pro-étale sheaves” The statement; strict exactness and Griffiths transversality are part of it.

#### Theorem. Values and acyclicity of OA_cris and OB_cris on affinoid perfectoids

*Node* `PadicHodgeTheory:P8:local-rational/structural-crystalline-sheaf-on-affinoid-perfectoids`.

Let k absolutely unramified (k = W(κ)[1/p], κ perfect); 𝔛 a smooth formal scheme over O_k = W(κ) of relative dimension d with rigid generic fibre X; w: X_proét → 𝔛_ét the morphism of topoi induced by Y ↦ Y_k (for Y étale over 𝔛), U = Spf(A) ⊂ 𝔛 an affine open étale over the formal torus with generic fibre U, Ũ = U ×_{Tᵈ} T̃ᵈ, and V an affinoid perfectoid of X_proét over Ũ_k̄ with V̂ = Spa(R, R^+). Let OA_cris(R, R^+) be the p-adic completion of the PD envelope of A ⊗_{O_k} W(R♭+) along the kernel of θ_A: A ⊗ W(R♭+) → R^+, with filtration closure, OB_cris^+(R, R^+) = OA_cris(R, R^+)[1/p] and OB_cris(R, R^+) = OB_cris^+(R, R^+)[1/t]. Then OA_cris(R, R^+) → OA_cris(V) induces almost isomorphisms Fil^r OA_cris(R, R^+)/p^n → (Fil^r OA_cris/p^n)(V) with H^i(V, Fil^r OA_cris/p^n) almost zero for i > 0, and OB_cris(R, R^+) → OB_cris(V) is an isomorphism strictly compatible with filtrations with H^i(V, Fil^r OB_cris) = H^i(V, OB_cris) = 0 for i > 0 and r ∈ Z.

*Hypotheses.* k absolutely unramified (k = W(κ)[1/p], κ perfect); 𝔛 a smooth formal scheme over O_k = W(κ) of relative dimension d with rigid generic fibre X; w: X_proét → 𝔛_ét the morphism of topoi induced by Y ↦ Y_k (for Y étale over 𝔛).

*Proof outline.*

1. The PD structure on ker θ_X(V) gives the filtered map ι: OA_cris(R, R^+) → OA_cris(V).
2. Both sides are PD power series over A_cris(R, R^+), resp. A_cris(V), in u_1, …, u_d (ring-level analogue of Proposition 2.13 and node local-structure-of-structural-crystalline-sheaf), compatibly with ι; so the statements reduce termwise to node crystalline-period-sheaves-on-affinoid-perfectoids.
3. For OB_cris: kernel and cokernel killed by I², and I·(A ⊗ B_cris) = A ⊗ B_cris; gr^s OB_cris^+ is free over Ô_X with basis ξ^{[i_0]}u^{[i]}, |i| + i_0 = s, acyclic with the correct sections by Lemma 4.10 (AI.3); conclude as for B_cris.

*Acceptance.*

- For 𝔛 = Spf O_k: recovers node crystalline-period-sheaves-on-affinoid-perfectoids.
- Note the misprint p^r for p^n in the proof of Lemma 2.18 (source issue PadicHodgeTheory/E15).

*Uses.* `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-crystalline-sheaf`, `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/almost-limit-lemma-for-acris-modules`, `AInfCohomology:AI.3`.

*Source.* Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.2, Lemma 2.18 and Corollary 2.19, pp. 17-18 (extraction lines 1052-1135): “Moreover, Hi(V, Filr OBcris) = Hi(V, OBcris) = 0 for any i > 0 and r ∈ Z.” The rational local acyclicity of the structural crystalline sheaf.

#### Theorem. OB_cris^+ ↪ OB_dR^+, OB_cris ↪ OB_dR as filtered subsheaves; w_*OB_cris = O_{𝔛_ét}[1/p]

*Node* `PadicHodgeTheory:P8:local-rational/structural-crystalline-to-de-rham-embedding`.

Let k absolutely unramified (k = W(κ)[1/p], κ perfect); 𝔛 a smooth formal scheme over O_k = W(κ) of relative dimension d with rigid generic fibre X; w: X_proét → 𝔛_ét the morphism of topoi induced by Y ↦ Y_k (for Y étale over 𝔛). There are injective filtered maps OB_cris^+ → OB_dR^+ and OB_cris → OB_dR compatible with the connections and with B_cris^+ ⊂ B_dR^+; Fil^i OB_cris = OB_cris ∩ Fil^i OB_dR, Fil^i OB_cris^+ = OB_cris^+ ∩ Fil^i OB_dR^+, and gr^i OB_cris ≅ gr^i OB_dR; over X_proét/X_k̄ the sheaves OA_cris and OB_cris^+ have no t-torsion. Moreover w_*OB_cris ≅ O_{𝔛_ét}[1/p].

*Hypotheses.* k absolutely unramified (k = W(κ)[1/p], κ perfect); 𝔛 a smooth formal scheme over O_k = W(κ) of relative dimension d with rigid generic fibre X; w: X_proét → 𝔛_ét the morphism of topoi induced by Y ↦ Y_k (for Y étale over 𝔛).

*Proof outline.*

1. OB_dR^+ is an O_X ⊗_{O_k} W(Ô^+_{X♭})-algebra, so OA_inf → OB_dR^+; it extends to the PD envelope (OB_dR^+ is a Q-algebra) and, modulo Fil^n OB_dR^+, to the p-adic completion because on V over X̃_k̄ the image lies in p^{-a}⊕_{|m|≤n}(W(Ô^+_{X♭})/ξ^{n−|m|})u^m, which is p-adically complete (uses OB_dR^+|_V = B_dR^+|_V[[u]], node local-structure-of-structural-de-rham-sheaf); pass to the limit over n.
2. Compatibility with the local descriptions (A_cris{⟨u⟩} ⊂ B_dR^+[[u]]) and node crystalline-to-de-rham-period-sheaf-embedding give injectivity, the filtration identities and the gr isomorphisms.
3. w_*OB_cris: O_{𝔛_ét}[1/p] → w_*OB_cris ↪ w_*OB_dR = ν'_*ν_*OB_dR = ν'_*O_{X_ét} = O_{𝔛_ét}[1/p] (node pushforward-of-structural-de-rham-sheaf; ν': X_ét → 𝔛_ét), so all maps are isomorphisms.

*Acceptance.*

- For 𝔛 = Spf O_k: B_cris ⊂ B_dR (node crystalline-to-de-rham-period-sheaf-embedding) and w_*B_cris = k.
- The element u_1^{[n]} = u_1^n/n! maps to u_1^n/n! ∈ B_dR^+[[u]].

*Uses.* `PadicHodgeTheory:P8:local-rational/structural-crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-crystalline-sheaf`, `PadicHodgeTheory:P8:local-rational/crystalline-to-de-rham-period-sheaf-embedding`, `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/pushforward-of-structural-de-rham-sheaf`, `AdicSpacesPartII:R2`.

*Source.* Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.4, Proposition 2.23 and Corollaries 2.24-2.26, pp. 21-22 (extraction lines 1281-1424): “Let X be a smooth formal scheme over Ok, with X its generic fiber. Then w∗OBcris ≃ OXét[1/p].” Corollary 2.26; Proposition 2.23 and Corollary 2.25 give the filtered embeddings.

### What is missing

- Coverage status: `partial`. Decomposed: Scholze §§4-6 (rational part), Lemma 5.2, Proposition 8.5 (relative Poincaré lemma, with the corrected completed tensor product), the erratum, and Tan–Tong §2 (crystalline period sheaves, crystalline Poincaré lemma, acyclicity, Frobenius, comparison with the de Rham sheaves). The nine accepted decomposition ids are kept; the integral content of three of them (Definition 4.1/Lemma 4.2 (iii), Definition 4.3-Proposition 4.8, Lemma 4.10) is requested from AInfCohomology AI.3 and the ids carry the rational statements. Semistable sheaves are planned as base changes of the crystalline ones (packet-authored).
- Injectivity of B_cris^+ → B_dR^+ and OB_cris^+ → OB_dR^+ (Tan–Tong omit it; Brinon Proposition 6.2.1 unavailable): gap.
- Brinon's description of A_cris(R, R^+)/p used in Tan–Tong Lemma 2.7: gap.
- Transcendence of u over B_cris(R, R^+) for general perfectoid (R, R^+), and the logarithmic structural semistable sheaf for semistable formal models: gap and restructure entry.
- The integral inputs requested from AI.3 must be stated in Scholze's generality (all locally noetherian X over Spa(Q_p, Z_p)); AI.3's stage text names only generic fibres of smooth formal schemes (restructure entry).
- **Gap: Injectivity of B_cris^+ → B_dR^+ on the pro-étale site is proved only by reference to an unavailable source.** Tan–Tong, proof of Proposition 2.23 (1): 'This can be done in the same way as [Bri, Proposition 6.2.1], and we omit the detail here.' Brinon's memoir (Mém. SMF 112) is not available here. The node reduces the claim to injectivity of A_cris(R, R^+) → B_dR^+(R, R^+) for perfectoid (R, R^+) over C. NEXT ACTION: prove it from the explicit description A_cris(R, R^+) = p-adic completion of W(R♭+)[ξ^n/n!] (every element is Σ a_n ξ^n/n! with a_n → 0 p-adically, and its image in B_dR^+/ξ^m determines a_0, …, a_{m−1} modulo the kernel, using that W(R♭+)/ξ = R^+ is p-torsion free), or obtain Brinon's Proposition 6.2.1; R06.1/crystalline-period-ring covers the field case (R = C). Needed by `PadicHodgeTheory:P8:local-rational/crystalline-to-de-rham-period-sheaf-embedding`, `PadicHodgeTheory:P8:local-rational/structural-crystalline-to-de-rham-embedding`, `PadicHodgeTheory:P8:local-rational/semistable-period-sheaves`.
- **Gap: Brinon's description of A_cris(R, R^+)/p used in Tan–Tong Lemma 2.7.** Tan–Tong's proof of Lemma 2.7 uses A_cris(R, R^+)/p ≅ (R♭+/(p♭)^p)[δ_i : i ∈ N]/(δ_i^p) (Brinon, Proposition 6.1.2) and its sheaf analogue, from an unavailable memoir. NEXT ACTION: derive it from the PD envelope of W(R♭+) along (ξ) modulo p (the PD polynomial algebra over W(R♭+)/(p, ξ^p) = R♭+/(p♭)^p in the divided power ξ^{[p]}, and δ_i the images of ξ^{[p^{i+1}]}), as a lemma of R06.1/crystalline-period-ring stated for all perfectoid (R, R^+). Needed by `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves-on-affinoid-perfectoids`.
- **Gap: Semistable period sheaves: packet-authored construction; no public source read; logarithmic version not constructed.** No public source read defines B_st or OB_st on the pro-étale site (Colmez–Nizioł arXiv:1905.04721 was checked and works with syntomic and η-étale methods instead). The nodes base-change R06.1's ring B_st = B_cris[u] along B_cris(C) → B_cris over X_k̄ and OB_cris → OB_st. Two inputs are unproved: transcendence of u over B_cris(R, R^+) (hence the polynomial description and injectivity of ι on affinoid perfectoids) is known only for R = C (Brinon–Conrad Theorem 9.2.10); and the structural semistable sheaf for semistable (non-smooth) formal models requires log structures, which are not constructed here. NEXT ACTION: prove transcendence of log[π♭] over Frac of B_cris(R, R^+) fibrewise at the points of Spa(R, R^+) (reduce to completed residue fields, which are perfectoid fields); decide the owner of the logarithmic structural sheaf (see restructure). Needed by `PadicHodgeTheory:P8:local-rational/semistable-period-sheaves`, `PadicHodgeTheory:P8:local-rational/structural-semistable-period-sheaves`.
- **Gap: Packet-authored arguments for steps the sources only assert.** The following are written out in this packet because the sources assert them: Corollary 6.6 ('Go through all identifications') and its gr⁰OB_dR version; the Cartan–Leray formula over X_K^{m/X} ('inspection of the proof'); ν_*OB_dR = O_{X_ét} ('The first part is clear'; the filtration of OB_dR is not complete, so the packet argues through t^{-j}OB_dR^+); the Γ_k-descent R(i) → R ⊗̂ K(i) ('Similarly to Lemma 5.5'; a relative form of Tate's normalised traces); Corollary 6.15 and Remark 6.20 (no proofs); the connection on the corrected OB_dR^+ (not restated by the erratum); tensor and cup-product compatibility (not stated). NEXT ACTION: independent review of these arguments; they are labelled packet-authored in the nodes. Needed by `PadicHodgeTheory:P8:local-rational/period-sheaves-on-profinite-products`, `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/pushforward-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/higher-direct-images-of-twisted-completed-structure-sheaf`, `PadicHodgeTheory:P8:local-rational/graded-structural-de-rham-sheaf-local-description`, `PadicHodgeTheory:P8:local-rational/tate-descent-for-completed-cyclotomic-tensor`, `PadicHodgeTheory:P8:local-rational/structural-de-rham-sheaf-connection`, `PadicHodgeTheory:P8/tensor-compatibility-of-associated-local-systems`, `PadicHodgeTheory:P8/proper-smooth-de-rham-comparison-application`.
- **Request to `AInfCohomology:AI.3`.** For every locally noetherian adic space X over Spa(Q_p, Z_p) (not only generic fibres of smooth formal schemes), on X_proét with Scholze's corrected covers: (a) O_X^+ = ν^*O^+_{X_ét} and Ô_X^+ = lim O_X^+/p^n with O_X^+/p^n ≅ Ô_X^+/p^n and Ô_X^+(U) Z_p-flat and p-adically complete (Sch13 Definition 4.1, Lemma 4.2 (iii)); (b) affinoid perfectoid objects U with Û = Spa(R, R^+) independent of the presentation, Lemma 4.5 (i)-(iii), Lemma 4.6, Corollary 4.7 and Proposition 4.8 (the basis, for X over Spa(Q_p, Z_p) through Proposition 3.15), and the perfectoid completed universal cover of a connected noetherian affinoid used in Theorem 4.9; (c) Lemma 4.10: Ô_X^+(U) = R^+, Ô_X^+(U) is the p-adic completion of O_X^+(U), H^i(U, Ô_X^+) almost zero for i > 0; (d) Ô^+_{X♭} = lim_Φ O_X^+/p and Lemma 5.10; (e) A_inf = W(Ô^+_{X♭}) with θ: A_inf → Ô_X^+ surjective, A_inf(U) = W(R♭+) and H^i(U, A_inf) almost zero (Theorem 6.5 for A_inf), and the integral cases of Corollary 6.6 (Ô_X^+(U × S) = Hom_cont(S, R^+), A_inf(U × S) = Hom_cont(S, W(R♭+))); (f) Lemma 3.18 in its exact and almost forms; (g) Lemma 5.5 (continuous Z_p^n-cohomology of O_K⟨T^{±1/p^∞}⟩ by the Koszul complex, non-integral part killed by ζ_p − 1, compatibility with completed base change). Needed by `PadicHodgeTheory:P8:local-rational/proetale-structure-sheaves-and-valuations`, `PadicHodgeTheory:P8:local-rational/integral-elements-via-valuations`, `PadicHodgeTheory:P8:local-rational/completed-structure-sheaf-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/affinoid-perfectoid-objects-and-etale-pullbacks`, `PadicHodgeTheory:P8:local-rational/period-sheaves-definitions`, `PadicHodgeTheory:P8:local-rational/period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/rational-acyclicity-of-de-rham-period-sheaves`, `PadicHodgeTheory:P8:local-rational/period-sheaves-on-profinite-products`, `PadicHodgeTheory:P8:local-rational/corrected-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/structural-algebra-structure-on-bdr-power-series`, `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/structural-crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-crystalline-sheaf`, `PadicHodgeTheory:P8:local-rational/structural-crystalline-sheaf-on-affinoid-perfectoids`, `PadicHodgeTheory:P8/affinoid-k-pi-one-for-p-torsion`, `PadicHodgeTheory:P8/lisse-sheaves-etale-proetale-equivalence`, `PadicHodgeTheory:P8/etale-to-bdr-plus-comparison-for-lisse-sheaves`, `PadicHodgeTheory:P8/relative-completed-structure-sheaf-computations`, `PadicHodgeTheory:P8/relative-bdr-plus-local-system-comparison`.
- **Request to `AdicEtaleGeometry:A1`.** Scholze's pro-étale site X_proét of a locally noetherian adic space with the erratum's transfinite covers, ν: X_proét → X_ét, Lemma 3.10, Proposition 3.12 (U = lim of affinoids is qcqs; the topos is coherent, so cohomology of qcqs objects commutes with filtered colimits), Proposition 3.15 (X_{L,proét} ≅ X_proét/X_L), Lemma 3.16 and Corollary 3.17 (i)-(ii), the objects U × S for profinite S pulled back from the pro-finite-étale site of the base, Proposition 3.7 (ii)-(iii) with corrected covers (H^i(pt, F_M) = H^i_cont(G, M)), and Galois descent of sheaves along pro-finite-étale Galois covers such as X_K → X. Needed by `PadicHodgeTheory:P8:local-rational/proetale-structure-sheaves-and-valuations`, `PadicHodgeTheory:P8:local-rational/integral-elements-via-valuations`, `PadicHodgeTheory:P8:local-rational/completed-structure-sheaf-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/rational-acyclicity-of-de-rham-period-sheaves`, `PadicHodgeTheory:P8:local-rational/de-rham-period-sheaf`, `PadicHodgeTheory:P8:local-rational/period-sheaves-on-profinite-products`, `PadicHodgeTheory:P8:local-rational/graded-de-rham-period-sheaf-tate-twist`, `PadicHodgeTheory:P8:local-rational/corrected-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/structural-de-rham-sheaf-connection`, `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/pushforward-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/almost-limit-lemma-for-acris-modules`, `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/structural-crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-crystalline-sheaf`, `PadicHodgeTheory:P8/vector-bundles-on-analytic-etale-and-proetale-sites`, `PadicHodgeTheory:P8/affinoid-k-pi-one-for-p-torsion`, `PadicHodgeTheory:P8/lisse-zp-sheaf`, `PadicHodgeTheory:P8/lisse-sheaves-etale-proetale-equivalence`, `PadicHodgeTheory:P8/etale-to-bdr-plus-comparison-for-lisse-sheaves`, `PadicHodgeTheory:P8/relative-pushforward-of-graded-structural-sheaf`, `PadicHodgeTheory:P8/relative-bdr-plus-local-system-comparison`.
- **Request to `AdicEtaleGeometry:A2`.** For smooth adic spaces over a complete nonarchimedean field: étale maps to the unit ball near a given point with the open set containing its closure (Huber, Étale cohomology of rigid analytic varieties, Corollary 1.6.10), the factorisation of an étale map over a rational subset as an open embedding into a finite étale cover (Huber Lemma 2.2.8), compatible local toric charts for smooth morphisms, and the sheaf Ω¹_{X_ét} of continuous Kähler differentials (locally free of rank dim X) with Ω^i = ∧^iΩ¹ and relative Ω¹_{X/Y}. Needed by `PadicHodgeTheory:P8:local-rational/toric-charts-for-smooth-spaces`, `PadicHodgeTheory:P8:local-rational/corrected-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/structural-de-rham-sheaf-connection`, `PadicHodgeTheory:P8:local-rational/poincare-lemma-and-faltings-extension`, `PadicHodgeTheory:P8:local-rational/relative-poincare-lemma`, `PadicHodgeTheory:P8/filtered-module-with-integrable-connection`.
- **Request to `ClassicalAdicEtaleCohomology:H0`.** Derived direct images Rν_* and Rf_* for sheaves of modules on pro-étale and étale sites, R^qν_* as the sheafification of U ↦ H^q(U, −), the Čech-to-derived comparison and the Cartan–Leray spectral sequence for a cover (SGA 4 V 3.3), and Leray spectral sequences. Needed by `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/pushforward-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/higher-direct-images-of-twisted-completed-structure-sheaf`, `PadicHodgeTheory:P8:local-rational/almost-limit-lemma-for-acris-modules`, `PadicHodgeTheory:P8/position-of-associated-local-system`, `PadicHodgeTheory:P8/proper-smooth-bdr-local-system-comparison`, `PadicHodgeTheory:P8/affinoid-k-pi-one-for-p-torsion`.
- **Request to `AdicSpacesPartII:R0`.** Huber, Étale cohomology of rigid analytic varieties, Corollary 1.7.3 (iii) and Remark 1.2.6 (iii): an affinoid U = Spa(R, R^+) of finite type over Spa(W(κ)[1/p], W(κ)) with an étale map to Tⁿ has an algebraic model (R_0, R_0^+) with R_0 étale over W(κ)[1/p][T^{±1}], R_0^+ the integral closure in R_0 of a finitely generated W(κ)[T^{±1}]-algebra R_1^+ with R_1^+[1/p] = R_0, and R^+ the p-adic completion of R_0^+ (Sch13 Lemma 6.12). Needed by `PadicHodgeTheory:P8:local-rational/etale-algebras-over-torus-models`.
- **Request to `AdicSpacesPartII:R2`.** Smooth formal schemes 𝔛 over W(κ), their étale sites and the rigid generic fibre functor Y ↦ Y_k (giving, with AdicEtaleGeometry A1, the morphism of topoi w: X_proét → 𝔛_ét used by Tan–Tong), Ω¹_{𝔛/W(κ)} locally free, and Frobenius lifts on formal schemes étale over the formal torus (unique lift with T_i ↦ T_i^p). Needed by `PadicHodgeTheory:P8:local-rational/structural-crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/crystalline-poincare-lemma`, `PadicHodgeTheory:P8:local-rational/frobenius-on-structural-crystalline-sheaf`, `PadicHodgeTheory:P8:local-rational/structural-crystalline-to-de-rham-embedding`.
- **Request to `CrystallineCohomology:CR.0`.** PD envelopes of a ring along an ideal compatible with the divided powers of p, their sheafification on a site and p-adic completion, the PD filtration, and the universal property used to extend ring maps (in particular Frobenius) to PD envelopes; applied to (A_inf, ker θ) and (O_X^{ur+} ⊗ A_inf, ker θ_X). Needed by `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/frobenius-on-crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/structural-crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/frobenius-on-structural-crystalline-sheaf`.
- **Request to `AlgebraicModuliForArithmeticGeometry:A0-extension`.** Finiteness of normalisation for finitely generated reduced flat W(κ)-algebras S^+ inside S^+[1/p] (W(κ) a complete discrete valuation ring, hence excellent), used in Sch13 Lemma 6.12. Needed by `PadicHodgeTheory:P8:local-rational/etale-algebras-over-torus-models`.

## P8 Shared relative period sheaves

Scholze's §§7–8:

- $\mathbb B_{\mathrm{dR}}^+$-local systems;
- filtered modules with integrable connection;
- the de Rham comparison for proper smooth rigid-analytic varieties;
- the application of the comparison theorems of CohomologyComparisons CP.3–CP.4;
- tensor compatibility;
- the degree-one abelian comparison that HodgeTateAndCanonicalSubgroups T1 consumes.

Scholze's primitive comparison theorem has no owner in the atlas. It is requested from CP.3, and a restructuring entry proposes an owner.

### Objects

#### Definition. B_dR^+-local systems and OB_dR^+-modules with integrable connection

*Module* `TauCeti/PadicHodge/RelativeComparison/LocalSystems.lean`. *Node* `PadicHodgeTheory:P8/bdr-plus-local-system`.

Let X smooth over Spa(k, O_k), k a complete discretely valued extension of Q_p with perfect residue field κ. (i) A B_dR^+-local system is a sheaf of B_dR^+-modules M on X_proét that is locally on X_proét free of finite rank. (ii) An OB_dR^+-module with integrable connection is a sheaf of OB_dR^+-modules ℳ on X_proét, locally free of finite rank, with an integrable connection ∇_ℳ: ℳ → ℳ ⊗_{O_X} Ω¹_X satisfying the Leibniz rule for ∇ on OB_dR^+. Morphisms are module maps, compatible with ∇ in (ii). A B_dR^+-local system M has the filtration Fil^i M = Fil^i B_dR^+·M and gr⁰M = M/Fil¹M, a locally free Ô_X-module; every lisse Ẑ_p-sheaf L gives the B_dR^+-local system L ⊗_{Ẑ_p} B_dR^+.

*Hypotheses.* X smooth over Spa(k, O_k), k a complete discretely valued extension of Q_p with perfect residue field κ.

*API.*

- `BdRPlusLocalSystem` (*data*) — A sheaf of B_dR^+-modules on X_proét locally free of finite rank.
- `OBdRPlusConnection` (*data*) — A locally free OB_dR^+-module of finite rank with an integrable connection satisfying the Leibniz rule for ∇.
- `BdRPlusLocalSystem.ofLisse` (*constructor*) — L ↦ L ⊗_{Ẑ_p} B_dR^+ for a lisse Ẑ_p-sheaf L.
- `BdRPlusLocalSystem.tensor` (*structure*) — Tensor product, dual and internal Hom (and the tensor connection in (ii)).
- `BdRPlusLocalSystem.gr0` (*projection*) — gr⁰M = M/Fil¹B_dR^+·M, a locally free Ô_X-module of the same rank.
- `BdRPlusLocalSystem.pullback` (*functoriality*) — Pullback along morphisms of smooth adic spaces over k.

*Used by.*

- Scholze, Theorems 7.2 and 7.6 — equivalence with OB_dR^+-modules with connection; association with filtered modules
- Scholze, Definition 8.3 and Theorems 8.4, 8.8 — M = L ⊗ B_dR^+ and its cohomology
- HodgeTateAndCanonicalSubgroups T1 — R¹f_*Ẑ_p ⊗ B_dR^+ for abelian families
- HodgeTateAndCanonicalSubgroups T6:comparison — logarithmic Riemann–Hilbert extends the equivalence
- CohomologyComparisons CP.3 — the B_dR^+-lattice H^i(X_C, L ⊗ B_dR^+) compared with H^i_crys(X/B_dR^+)

*Unit tests.* A wrong definition fails one of these.

- `BdRPlusLocalSystem.trivial` (degenerate) — B_dR^+ is a B_dR^+-local system of rank 1 with associated OB_dR^+-module (OB_dR^+, ∇).
- `BdRPlusLocalSystem.ofLisse_tate` (computation) — Ẑ_p(1) ⊗ B_dR^+ ≅ Fil¹B_dR^+ = t·B_dR^+ as B_dR^+-modules, via ε ⊗ b ↦ tb (locally, t a nonzerodivisor).
- `BdRPlusLocalSystem.gr0_rank` (characterisation) — gr⁰(L ⊗ B_dR^+) = L ⊗ Ô_X is locally free over Ô_X of rank rk L.
- `BdRPlusLocalSystem.ohat_non_example` (non-example) — Ô_X with B_dR^+ acting through θ is not a B_dR^+-local system (it is killed by the nonzero ideal Fil¹B_dR^+).

*Construction.*

1. Definitions; tensor products, duals and internal Hom of locally free modules are again locally free; the tensor connection is ∇ ⊗ 1 + 1 ⊗ ∇.

*Acceptance.*

- M = B_dR^+ and ℳ = OB_dR^+ with ∇.
- Ô_X, viewed as a B_dR^+-module through θ, is killed by Fil¹ and is not a B_dR^+-local system.

*Uses.* `PadicHodgeTheory:P8:local-rational/period-sheaves-definitions`, `PadicHodgeTheory:P8:local-rational/corrected-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/structural-de-rham-sheaf-connection`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 7, Definition 7.1, pp. 41-42 (extraction lines 2422-2428): “(i) A B+dR-local system is a sheaf of B+dR-modules M that is locally on Xproét free of finite rank.” Definition (i); (ii) defines OB+dR-modules with integrable connection in the same way.

#### Definition. Filtered O_X-modules with integrable connection, and association with OB_dR^+-modules

*Module* `TauCeti/PadicHodge/RelativeComparison/LocalSystems.lean`. *Node* `PadicHodgeTheory:P8/filtered-module-with-integrable-connection`.

Let X smooth over Spa(k, O_k), k a complete discretely valued extension of Q_p with perfect residue field κ. A filtered O_X-module with integrable connection is a locally free O_X-module E of finite rank on X (equivalently on X_an, X_ét or X_proét by the previous node) with a separated exhaustive decreasing filtration Fil^i E (i ∈ Z) by local direct summands and an integrable connection ∇: E → E ⊗ Ω¹_X satisfying Griffiths transversality ∇(Fil^i E) ⊂ Fil^{i−1}E ⊗ Ω¹_X. Its de Rham complex DR(E) = (E → E ⊗ Ω¹ → …) is filtered by Fil^m DR(E) = (Fil^m E → Fil^{m−1}E ⊗ Ω¹ → …). An OB_dR^+-module with integrable connection ℳ and such an E are associated if there is an isomorphism ℳ ⊗_{OB_dR^+} OB_dR ≅ E ⊗_{O_X} OB_dR of sheaves on X_proét compatible with filtrations (Fil on E ⊗ OB_dR is the tensor filtration) and connections.

*Hypotheses.* X smooth over Spa(k, O_k), k a complete discretely valued extension of Q_p with perfect residue field κ.

*API.*

- `FilteredConnection` (*data*) — A locally free O_X-module E with a separated exhaustive filtration by local direct summands and an integrable Griffiths-transversal connection.
- `FilteredConnection.deRham` (*constructor*) — The filtered de Rham complex DR(E) with Fil^m DR(E) = (Fil^m E → Fil^{m−1}E ⊗ Ω¹ → …).
- `FilteredConnection.tensor` (*structure*) — Tensor product and dual with tensor filtration and connection.
- `FilteredConnection.shift` (*other*) — The shift E[n] with Fil^i E[n] = Fil^{i+n}E.
- `FilteredConnection.Associated` (*other*) — The relation 'ℳ and E are associated': ℳ ⊗ OB_dR ≅ E ⊗ OB_dR compatibly with Fil and ∇.
- `FilteredConnection.pullback` (*functoriality*) — Pullback along morphisms of smooth adic spaces, compatible with DR and with association.

*Used by.*

- Scholze, Theorems 7.6, 7.11, 8.4, 8.8 — the de Rham side of the comparison theorems
- HodgeTateAndCanonicalSubgroups T1 — H¹_dR of abelian families with Gauss–Manin connection and Hodge filtration
- Tan–Tong, Definition 3.10 — the crystalline analogue with filtered F-isocrystals

*Unit tests.* A wrong definition fails one of these.

- `FilteredConnection.trivial` (degenerate) — (O_X, d, Fil⁰ = O_X ⊃ Fil¹ = 0) is a filtered module with integrable connection with DR(E) = Ω^•_X.
- `FilteredConnection.twist` (computation) — (O_X, d) with Fil^{−1} = O_X ⊃ Fil⁰ = 0 (jump at −1) is associated to Fil¹B_dR^+ ⊗ OB_dR^+ = t·OB_dR^+ (the B_dR^+-local system of Ẑ_p(1)).
- `FilteredConnection.dR_graded` (characterisation) — gr^j DR(E) = (gr^j E → gr^{j−1}E ⊗ Ω¹ → …) with O_X-linear differentials; for E trivial, gr^j DR(O_X) = Ω^j_X[−j].
- `FilteredConnection.griffiths_non_example` (non-example) — On T¹, E = O e_1 ⊕ O e_2 with ∇e_1 = e_2 ⊗ dT/T, ∇e_2 = 0, Fil⁰ = E, Fil¹ = Fil² = O e_1, Fil³ = 0 is not a filtered module with integrable connection: ∇(Fil²) ⊄ Fil¹ ⊗ Ω¹.

*Construction.*

1. Definitions. Tensor products and duals of filtered modules with integrable connection carry the tensor filtration and tensor connection, which again satisfy Griffiths transversality.

*Acceptance.*

- (O_X, d) with Fil⁰ = O_X, Fil¹ = 0 is associated to OB_dR^+ (M = B_dR^+).
- For a proper smooth family f: A → S, (H¹_dR(A/S), ∇_GM, Fil) is a filtered O_S-module with integrable connection (Griffiths transversality of Gauss–Manin).

*Uses.* `PadicHodgeTheory:P8/vector-bundles-on-analytic-etale-and-proetale-sites`, `PadicHodgeTheory:P8/bdr-plus-local-system`, `PadicHodgeTheory:P8:local-rational/structural-de-rham-sheaf`, `AdicEtaleGeometry:A2`.

*Planet:* Filtered modules with integrable connection.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 7, Definitions 7.4-7.5, p. 42 (extraction lines 2466-2476): “A filtered OX-module with integrable connection is a locally free OX-module E on X, together with a separated and exhaustive decreasing filtration Fili E, i ∈ Z, by locally direct summands, and an integrable connection ∇ satisfying Griffiths transversality” Definition 7.4; Definition 7.5 defines 'associated'.

#### Construction. The B_dR^+-local system M(E) = Fil⁰(E ⊗ OB_dR)^{∇=0} associated to a filtered module with connection

*Module* `TauCeti/PadicHodge/RelativeComparison/LocalSystems.lean`. *Node* `PadicHodgeTheory:P8/associated-bdr-plus-local-system`.

Let X smooth over Spa(k, O_k), k a complete discretely valued extension of Q_p with perfect residue field κ. (i) If ℳ is an OB_dR^+-module with integrable connection with horizontal sections M, associated to a filtered O_X-module with integrable connection E, then M = Fil⁰(E ⊗_{O_X} OB_dR)^{∇=0} and E_ét ≅ ν_*(M ⊗_{B_dR^+} OB_dR) with its filtration and connection. (ii) For every filtered O_X-module with integrable connection E, M(E) := Fil⁰(E ⊗_{O_X} OB_dR)^{∇=0} is a B_dR^+-local system and E is associated to M(E) ⊗_{B_dR^+} OB_dR^+. Hence E ↦ M(E) is a fully faithful functor from filtered O_X-modules with integrable connection to B_dR^+-local systems.

*Hypotheses.* X smooth over Spa(k, O_k), k a complete discretely valued extension of Q_p with perfect residue field κ.

*API.*

- `associatedLocalSystem` (*constructor*) — E ↦ M(E) = Fil⁰(E ⊗_{O_X} OB_dR)^{∇=0}, a B_dR^+-local system with E associated to M(E) ⊗ OB_dR^+.
- `associatedLocalSystem.recover` (*characterisation*) — E_ét ≅ ν_*(M(E) ⊗_{B_dR^+} OB_dR) as filtered O_{X_ét}-modules with connection.
- `associatedLocalSystem.fullyFaithful` (*characterisation*) — Hom(E, E') ≅ Hom(M(E), M(E')) for filtered modules with integrable connection E, E'.
- `associatedLocalSystem.map` (*functoriality*) — Functoriality in E and compatibility with pullback along morphisms of smooth adic spaces.
- `associatedLocalSystem.shift` (*compatibility*) — M(E[1]) = Fil¹B_dR·M(E) = t·M(E) inside M(E) ⊗ B_dR.

*Used by.*

- Scholze, Definition 8.3 — L is de Rham iff L ⊗ B_dR^+ ≅ M(E) for some E
- Scholze, Theorems 7.11, 8.4 and 8.8 — cohomology of M(E) versus de Rham cohomology of E
- HodgeTateAndCanonicalSubgroups T1 — the B_dR^+-lattice of H¹ of abelian families is M(H¹_dR)
- HodgeTateAndCanonicalSubgroups T6:comparison — the canonical local systems and their filtered de Rham bundles are compared through the logarithmic analogue

*Unit tests.* A wrong definition fails one of these.

- `associatedLocalSystem.trivial_filtration` (computation) — For E = (O_X, d, Fil⁰ = O_X, Fil¹ = 0), M(E) = Fil⁰B_dR = B_dR^+.
- `associatedLocalSystem.tate` (computation) — For E = (O_X, d) with filtration jump at −1, M(E) = Fil¹B_dR = t·B_dR^+ ≅ Ẑ_p(1) ⊗ B_dR^+.
- `associatedLocalSystem.shift_test` (compatibility) — M(E[1]) = t·M(E) for every E.
- `associatedLocalSystem.filtration_matters` (non-example) — The trivial and the shifted filtration on (O_X, d) give different B_dR^+-lattices B_dR^+ ≠ t·B_dR^+ in B_dR: M(E) depends on Fil, not only on (E, ∇).

*Construction.*

1. (i): M = Fil⁰(M ⊗ B_dR) = Fil⁰(ℳ ⊗ OB_dR)^{∇=0} = Fil⁰(E ⊗ OB_dR)^{∇=0} (Theorem 7.2 and the Poincaré lemma); E_ét = ν_*(E ⊗ OB_dR) = ν_*(M ⊗ OB_dR) by ν_*OB_dR = O_{X_ét} (the source cites 'lemma 6.19', a misprint for Corollary 6.19, source issue PadicHodgeTheory/E13); the filtration and connection are recovered.
2. (ii): first M_0 := (E ⊗ OB_dR^+)^{∇=0}, a B_dR^+-local system with E ⊗ OB_dR^+ ≅ M_0 ⊗ OB_dR^+ (Theorem 7.2, ignoring Fil). Induct on m − n where Fil^n E = E, Fil^{m+1}E = 0: if n = m take M = Fil^{−n}(M_0 ⊗ B_dR); otherwise twist to m = 0, let Fil' drop the last step, get M' by induction, and consider the 3 × (d + 1) diagram of Lemma 7.7 whose columns are M' ⊗ (0 → B_dR^+ → Fil⁰OB_dR → Fil^{−1}OB_dR ⊗ Ω¹ → …), the middle column, and Fil⁰E ⊗ gr⁰ of the Poincaré sequence.
3. (Lemma 7.7) rows and columns are complexes and commute; all rows but the first are exact; the outer columns are exact (Poincaré lemma, strict); so the whole diagram is exact and M := kernel of the first ∇ in the middle column sits in 0 → M' → M → Fil⁰E ⊗ Ô_X → 0; tensoring with Fil⁰OB_dR (flat over B_dR^+) and the five lemma give M ⊗ Fil⁰OB_dR ≅ Fil⁰(E ⊗ OB_dR), so M is locally free and associated.
4. Full faithfulness: by (i), E is recovered from M(E).

*Acceptance.*

- E = (O_X, d, trivial filtration) gives M = B_dR^+; E with its filtration shifted by one (Fil^i E[1] = Fil^{i+1}E) gives M(E[1]) = t·M(E).
- The functor is not essentially surjective onto B_dR^+-local systems in general (it is fully faithful); de Rham lisse sheaves are those whose L ⊗ B_dR^+ is in the essential image.

*Uses.* `PadicHodgeTheory:P8/filtered-module-with-integrable-connection`, `PadicHodgeTheory:P8/bdr-plus-local-systems-and-integrable-connections`, `PadicHodgeTheory:P8:local-rational/poincare-lemma-and-faltings-extension`, `PadicHodgeTheory:P8:local-rational/pushforward-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/structural-de-rham-sheaf`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 7, Theorem 7.6 and Lemma 7.7 with proofs, pp. 42-44 (extraction lines 2477-2621): “In particular, the notion of being associated gives rise to a fully faithful functor from filtered OX-modules with integrable connection to B+dR-local systems.” The construction and full faithfulness.

#### Definition. Lisse Z_p-sheaves on X_ét and lisse Ẑ_p-sheaves on X_proét

*Module* `TauCeti/PadicHodge/RelativeComparison/LisseSheaves.lean`. *Node* `PadicHodgeTheory:P8/lisse-zp-sheaf`.

Let X be a locally noetherian adic space over Spa(Q_p, Z_p). A lisse Z_p-sheaf on X_ét is an inverse system L_• = (L_n) of sheaves of Z/p^n-modules, each locally on X_ét constant with finitely generated fibres, isomorphic in the pro-category to a system with L_{n+1}/p^n ≅ L_n. With Ẑ_p := lim Z/p^n on X_proét, a lisse Ẑ_p-sheaf is a sheaf of Ẑ_p-modules L on X_proét locally isomorphic to Ẑ_p ⊗_{Z_p} M for a finitely generated Z_p-module M. The functor L_• ↦ L̂_• := lim ν^*L_n sends lisse Z_p-sheaves to lisse Ẑ_p-sheaves; Q̂_p := Ẑ_p[1/p] and L ⊗ Q̂_p is the associated Q̂_p-local system.

*Hypotheses.* X locally noetherian over Spa(Q_p, Z_p); X_proét and ν from A1.

*API.*

- `LisseZpSheaf` (*data*) — A sheaf of Ẑ_p-modules on X_proét locally isomorphic to Ẑ_p ⊗ M with M finitely generated over Z_p.
- `LisseZpSheaf.ofEtale` (*constructor*) — L_• ↦ lim ν^*L_n from lisse Z_p-sheaves on X_ét.
- `LisseZpSheaf.tensor` (*structure*) — Tensor product and dual of lisse Ẑ_p-sheaves.
- `LisseZpSheaf.rational` (*other*) — L ⊗_{Ẑ_p} Q̂_p, the associated Q̂_p-local system.
- `LisseZpSheaf.tate` (*constructor*) — Ẑ_p(n) = Ẑ_p(1)^{⊗n}, Ẑ_p(1) = lim μ_{p^n}.
- `LisseZpSheaf.pullback` (*functoriality*) — Pullback along morphisms of locally noetherian adic spaces, compatible with ofEtale.

*Used by.*

- Scholze, Proposition 8.2 and Theorems 8.4, 8.8 — the coefficients of the comparison theorems
- HodgeTateAndCanonicalSubgroups T1 — R¹f_*Ẑ_p of an abelian family (the dual Tate module local system)
- Tan–Tong, §3.2 — crystalline lisse Ẑ_p-sheaves

*Unit tests.* A wrong definition fails one of these.

- `LisseZpSheaf.constant` (degenerate) — Ẑ_p = lim ν^*Z/p^n is a lisse Ẑ_p-sheaf of rank 1.
- `LisseZpSheaf.tate_test` (computation) — Ẑ_p(1) is lisse of rank 1 and becomes isomorphic to Ẑ_p over X_proét/X_K for K the completion of Q_p(μ_{p^∞}) (choice of ε).
- `LisseZpSheaf.sections_profinite` (characterisation) — For U affinoid perfectoid and S profinite, Ẑ_p(U × S) = Hom_cont(S, Z_p) when |U| is connected.
- `LisseZpSheaf.naive_non_example` (non-example) — The pullback ν^*Z_p of the constant étale sheaf Z_p is not Ẑ_p: on U × Z_p its sections are the locally constant maps Z_p → Z_p, which exclude the identity map, a section of Ẑ_p.

*Construction.*

1. Definitions; lim is taken in sheaves on X_proét.

*Acceptance.*

- Ẑ_p = lim ν^*(Z/p^n) is itself lisse.
- Ẑ_p(1) = lim μ_{p^n}.

*Uses.* `AdicEtaleGeometry:A1`, `PadicHodgeTheory:P8:local-rational/proetale-structure-sheaves-and-valuations`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 8, Definition 8.1, p. 48 (extraction lines 2826-2834): “Then a lisse Ẑp-sheaf on Xproét is a sheaf L of Ẑp-modules on Xproét, such that locally in Xproét, L is isomorphic to Ẑp ⊗Zp M, where M is a finitely generated Zp-module.” The definition of lisse Ẑ_p-sheaves; lisse Z_p-sheaves on X_ét are defined just before.

#### Definition. De Rham lisse Ẑ_p-sheaves

*Module* `TauCeti/PadicHodge/RelativeComparison/LisseSheaves.lean`. *Node* `PadicHodgeTheory:P8/de-rham-lisse-sheaf`.

Let X smooth over Spa(k, O_k), k a complete discretely valued extension of Q_p with perfect residue field κ. A lisse Ẑ_p-sheaf L on X_proét is de Rham if its B_dR^+-local system M = L ⊗_{Ẑ_p} B_dR^+ is isomorphic to M(E) for some filtered O_X-module with integrable connection (E, ∇, Fil) (node associated-bdr-plus-local-system); E is then unique up to unique isomorphism (full faithfulness) and is called the filtered module associated to L. Scholze states the definition for proper smooth X; it is used for smooth X in Theorem 8.8.

*Hypotheses.* X smooth over Spa(k, O_k), k a complete discretely valued extension of Q_p with perfect residue field κ.

*API.*

- `LisseZpSheaf.IsDeRham` (*other*) — The property that L ⊗ B_dR^+ ≅ M(E) for some filtered O_X-module with integrable connection E.
- `LisseZpSheaf.IsDeRham.associated` (*data*) — The associated filtered module with integrable connection E, unique up to unique isomorphism.
- `LisseZpSheaf.IsDeRham.tensor` (*structure*) — De Rham sheaves are stable under ⊗ and duals, with associated E ⊗ E' and E^∨ (node tensor-compatibility-of-associated-local-systems).
- `LisseZpSheaf.IsDeRham.point` (*compatibility*) — For X = Spa(k, O_k): L is de Rham iff L ⊗ Q_p is a de Rham G_k-representation (R06.2), with E = D_dR.
- `LisseZpSheaf.IsDeRham.pullback` (*functoriality*) — Stable under pullback, with E pulled back.

*Used by.*

- Scholze, Theorems 8.4 and 8.8 — hypothesis and conclusion of the comparison theorems
- HodgeTateAndCanonicalSubgroups T1 — R¹f_*Ẑ_p of an abelian family is de Rham with associated H¹_dR
- PadicHodgeTheory R06.2 — de Rham representations of G_k are the case X = Spa(k, O_k)

*Unit tests.* A wrong definition fails one of these.

- `LisseZpSheaf.IsDeRham.constant` (degenerate) — Ẑ_p is de Rham with associated (O_X, d, Fil⁰ = O_X, Fil¹ = 0).
- `LisseZpSheaf.IsDeRham.tate` (computation) — Ẑ_p(n) is de Rham with associated (O_X, d) and filtration jump at −n; for X = Spa(k), D_dR(Q_p(n)) has its unique jump in degree −n (consumer MordellLawrenceVenkatesh LV.1).
- `LisseZpSheaf.IsDeRham.point_compat` (compatibility) — For X = Spa(k, O_k), IsDeRham(L) iff dim_k D_dR(L ⊗ Q_p) = rank L (R06.2/admissible-representations).
- `LisseZpSheaf.IsDeRham.non_example` (non-example) — For p odd and s ∈ Z_p \ Z, the character χ^s: G_{Q_p} → 1 + pZ_p (through the projection of χ to 1 + pZ_p) gives a lisse sheaf on Spa(Q_p, Z_p) which is not de Rham: it is not even Hodge–Tate, since C(χ^s)^{G} = 0 and C(χ^s)(j)^G = 0 for all j ∈ Z (Brinon–Conrad Theorem 2.2.7).

*Construction.*

1. Definition; uniqueness of E from full faithfulness of E ↦ M(E).

*Acceptance.*

- Ẑ_p is de Rham with E = (O_X, d, trivial filtration).
- For X = Spa(k, O_k), L de Rham ⇔ the G_k-representation V = L ⊗ Q_p is de Rham in the sense of R06.2 (D_dR(V) = E(k)).

*Uses.* `PadicHodgeTheory:P8/associated-bdr-plus-local-system`, `PadicHodgeTheory:P8/lisse-zp-sheaf`, `PadicHodgeTheory:P8/bdr-plus-local-system`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 8, Definition 8.3, p. 48 (extraction lines 2854-2859): “A lisse Ẑp-sheaf L is said to be de Rham if the associated B+dR-local system M = L ⊗Ẑp B+dR is associated to some filtered module with integrable connection (E, ∇, Fil•).” The definition.

### Lemmas, theorems and comparisons

#### Theorem. B_dR^+-local systems are equivalent to OB_dR^+-modules with integrable connection

*Node* `PadicHodgeTheory:P8/bdr-plus-local-systems-and-integrable-connections`.

Let X smooth over Spa(k, O_k), k a complete discretely valued extension of Q_p with perfect residue field κ. The functor M ↦ (ℳ, ∇_ℳ) = (M ⊗_{B_dR^+} OB_dR^+, id ⊗ ∇) is an equivalence between the category of B_dR^+-local systems and the category of OB_dR^+-modules with integrable connection, with quasi-inverse ℳ ↦ ℳ^{∇_ℳ = 0}.

*Hypotheses.* X smooth over Spa(k, O_k), k a complete discretely valued extension of Q_p with perfect residue field κ.

*Proof outline.*

1. (M ⊗ OB_dR^+)^{∇=0} = M ⊗ (OB_dR^+)^{∇=0} = M by the Poincaré lemma in degree 0 (M locally free).
2. Essential surjectivity: every ℳ has enough horizontal sections; this is local, so assume X étale over Tⁿ and work over X̃_K where OB_dR^+ = B_dR^+[[X_1, …, X_n]] with ∇ = Σ ∂/∂X_i ⊗ dT_i (nodes local-structure-of-structural-de-rham-sheaf, connection-and-filtration-in-local-coordinates).
3. Over a Q-algebra B, a finite free B[[X]]-module with integrable connection has a basis of horizontal sections (the formal Taylor series e ↦ Σ_m (−X)^m/m!·∇_∂^m(e) converges X-adically and is horizontal) (packet-authored expansion of the source's 'the fact for any Q-algebra').

*Acceptance.*

- For M = B_dR^+: ℳ = OB_dR^+ and ℳ^{∇=0} = B_dR^+.
- For dim X = 0 both categories are finite free B_dR^+-modules and the functor is the identity.

*Uses.* `PadicHodgeTheory:P8/bdr-plus-local-system`, `PadicHodgeTheory:P8:local-rational/poincare-lemma-and-faltings-extension`, `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/connection-and-filtration-in-local-coordinates`, `PadicHodgeTheory:P8:local-rational/formal-poincare-lemma`.

*Planet:* B_dR^+-local systems and integrable connections.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 7, Theorem 7.2 with proof, p. 42 (extraction lines 2431-2441): “induces an equivalence of categories between the category of B+dR-local systems and the category of OB+dR-modules with integrable connection.” The statement; the proof reduces to Proposition 6.10 and power series over Q-algebras.

#### Lemma. Vector bundles on X_an, X_ét and X_proét agree

*Node* `PadicHodgeTheory:P8/vector-bundles-on-analytic-etale-and-proetale-sites`.

Let X smooth over Spa(k, O_k), k a complete discretely valued extension of Q_p with perfect residue field κ, with morphisms of sites ν: X_proét → X_ét and λ: X_ét → X_an. Pullback induces equivalences between: (i) O_{X_an}-modules locally free of finite rank on X_an; (ii) O_{X_ét}-modules locally free of finite rank on X_ét; (iii) O_X-modules locally free of finite rank on X_proét.

*Hypotheses.* X smooth over Spa(k, O_k), k a complete discretely valued extension of Q_p with perfect residue field κ. O_{X_an} = λ_*O_{X_ét} and O_{X_ét} = ν_*O_X (Lemma 3.16, A1); descent along finite étale maps of affinoids (de Jong–van der Put, Proposition 3.2.2, reduces étale descent to finite étale covers), requested from AdicSpacesPartII R3 (coherent sheaves and descent).

*Proof outline.*

1. Full faithfulness of both pullbacks from O_{X_an} = λ_*O_{X_ét} and O_{X_ét} = ν_*O_X.
2. Analytic → étale: locally free sheaves form a stack for the étale topology; reduce to finite étale covers Spa(S, S^+) → Spa(R, R^+) of affinoids, where R → S is faithfully flat and projective modules descend.
3. Étale → pro-étale: if E becomes trivial on U = lim U_i → U_0 (finite étale surjective transitions, U_0 = Spa(R, R^+)), then O_X(U) = colim R_i is faithfully flat over R, so E descends to a projective R-module of finite rank, free after shrinking U_0.

*Acceptance.*

- O_X itself corresponds to O_{X_an}.
- Non-example: the analogous statement fails for Ô_X-modules: Ô_X(1) is a locally free Ô_X-module on X_proét which does not come from any O_{X_ét}-module (ν_*Ô_X(1) = 0 by node pushforward-of-structural-de-rham-sheaf).

*Uses.* `PadicHodgeTheory:P8:local-rational/proetale-structure-sheaves-and-valuations`, `AdicEtaleGeometry:A1`, `AdicSpacesPartII:R3`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 7, Lemma 7.3 with proof, p. 42 (extraction lines 2443-2465): “(iii) The category of OX-modules E over Xproét that are locally on Xproét free of finite rank.” Item (iii) of the equivalence; items (i)-(ii) precede it.

#### Lemma. The extension class of M_0/Fil²M_0 is −∇ under R¹ν_*Ô_X(1) ≅ Ω¹

*Node* `PadicHodgeTheory:P8/boundary-map-of-associated-local-system`.

Let X smooth over Spa(k, O_k), k a complete discretely valued extension of Q_p with perfect residue field κ, (E, ∇) a locally free O_X-module with integrable connection, M_0 := (E ⊗ OB_dR^+)^{∇=0} (trivial filtration). Then E ⊗_{O_X} Ô_X ≅ gr⁰M_0, and the boundary map E_ét → E_ét ⊗ R¹ν_*Ô_X(1) of ν_* applied to 0 → E ⊗ Ô_X(1) → M_0/Fil²M_0 → E ⊗ Ô_X → 0 is identified, under R¹ν_*Ô_X(1) ≅ Ω¹_{X_ét} (Faltings), with −∇.

*Hypotheses.* X smooth over Spa(k, O_k), k a complete discretely valued extension of Q_p with perfect residue field κ.

*Proof outline.*

1. Reduce E ⊗ OB_dR^+ ≅ M_0 ⊗ OB_dR^+ modulo ker θ to get E ⊗ Ô_X ≅ gr⁰M_0.
2. Pull back the sequence along E → E ⊗ Ô_X to get F; F has two maps to E ⊗ OB_dR^+/Fil² (via M_0/Fil² and via E), agreeing modulo Fil¹; their difference F → E ⊗ gr¹OB_dR^+ fits into a map of extensions to Faltings's extension tensored with E, with −∇ on the quotients.
3. The boundary of Faltings's extension induces E_ét ⊗ Ω¹ ≅ E_ét ⊗ R¹ν_*Ô_X(1) (node pushforward-of-structural-de-rham-sheaf).

*Acceptance.*

- For (E, ∇) = (O_X, d): the boundary map O_{X_ét} → R¹ν_*Ô_X(1) = Ω¹ is −d.
- The sign −1 is part of the statement and must be kept.

*Uses.* `PadicHodgeTheory:P8/associated-bdr-plus-local-system`, `PadicHodgeTheory:P8:local-rational/faltings-extension`, `PadicHodgeTheory:P8:local-rational/pushforward-of-structural-de-rham-sheaf`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 7, Lemma 7.8 with proof, p. 45 (extraction lines 2640-2681): “Under the canonical isomorphism R1ν∗(ÔX(1)) ≅ Ω1Xét, this map is identified with −1 times the connection on E.” The statement.

#### Theorem. M(E) ⊂ M_0 ⊗ B_dR is the unique lattice with graded pieces Fil^{−i}E ⊗ Ô_X(i)

*Node* `PadicHodgeTheory:P8/position-of-associated-local-system`.

Let X smooth over Spa(k, O_k), k a complete discretely valued extension of Q_p with perfect residue field κ, (E, ∇, Fil) a filtered O_X-module with integrable connection, M_0 the B_dR^+-local system of (E, ∇) with trivial filtration, and M = M(E). Then M ⊂ M_0 ⊗_{B_dR^+} B_dR and (M ∩ Fil^i M_0)/(M ∩ Fil^{i+1}M_0) = Fil^{−i}E ⊗_{O_X} Ô_X(i) ⊂ gr^i M_0 ≅ E ⊗ Ô_X(i) for all i ∈ Z; conversely M is the unique B_dR^+-submodule of M_0 ⊗ B_dR with this property. The uniqueness rests on: Ext¹(Fil⁰E, M_0') ↪ Hom(Fil⁰E, Fil^{−1}E ⊗ Ω¹_X) and Ext¹(Fil⁰E, Fil¹M_0) ↪ Hom(Fil⁰E, E ⊗ Ω¹_X) (Ext in abelian sheaves on X_proét), which in turn rest on Ext¹(F_1, F_2 ⊗ Ô_X(k)) = Hom(F_1, F_2 ⊗ Ω¹_X) for k = 1 and 0 for k ≥ 2 (F_1, F_2 locally free O_X-modules).

*Hypotheses.* X smooth over Spa(k, O_k), k a complete discretely valued extension of Q_p with perfect residue field κ.

*Proof outline.*

1. The containment and the graded pieces follow from the construction of M (induction on the filtration length, node associated-bdr-plus-local-system).
2. R Hom(ν^*F_1, F_2 ⊗ Ô_X(k)) = R Hom(F_1,ét, Rν_*(F_2 ⊗ Ô_X(k))); by node pushforward-of-structural-de-rham-sheaf, Rν_* vanishes in degrees 0, 1 for k ≥ 2 and in degree 0 for k = 1, with R¹ν_* = F_2 ⊗ Ω¹ for k = 1: this gives the Ext computation, and the two injections follow since M_0' and Fil¹M_0 are successive extensions of F ⊗ Ô_X(k), k ≥ 1.
3. Uniqueness: the sheaf N in the pull-back diagram along Fil⁰E → E ⊗ Ô_X is determined by its extension class, which by the injections is determined by its image in Hom(…, Ω¹) (Griffiths transversality governs existence).

*Acceptance.*

- For E with Fil⁰ = E, Fil¹ = 0: M = M_0.
- For the jump at −1: M = t·M_0, with graded piece Fil¹… = E ⊗ Ô_X(1) in degree 1.

*Uses.* `PadicHodgeTheory:P8/associated-bdr-plus-local-system`, `PadicHodgeTheory:P8/boundary-map-of-associated-local-system`, `PadicHodgeTheory:P8:local-rational/pushforward-of-structural-de-rham-sheaf`, `ClassicalAdicEtaleCohomology:H0`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 7, Proposition 7.9 and Lemma 7.10 with proofs, pp. 45-46 (extraction lines 2683-2738): “Conversely, there is a unique such B+dR-submodule in M0 ⊗B+dR BdR.” The uniqueness statement; Lemma 7.10 supplies the Ext injections.

#### Lemma. M(E) is a tensor functor: M(E ⊗ E') = M(E) ⊗ M(E'), M(E^∨) = M(E)^∨

*Node* `PadicHodgeTheory:P8/tensor-compatibility-of-associated-local-systems`.

Let X smooth over Spa(k, O_k), k a complete discretely valued extension of Q_p with perfect residue field κ and E, E' filtered O_X-modules with integrable connection. The multiplication map M(E) ⊗_{B_dR^+} M(E') → Fil⁰((E ⊗ E') ⊗ OB_dR)^{∇=0} = M(E ⊗ E') is an isomorphism, M(O_X) = B_dR^+, M(E^∨) = M(E)^∨ (dual B_dR^+-module), compatibly with the association isomorphisms, with symmetry and associativity; the essential image of M is closed under ⊗ and duals. Consequently a lisse Ẑ_p-sheaf L ⊗ L' (resp. L^∨) is de Rham with associated E ⊗ E' (resp. E^∨) whenever L, L' are de Rham with associated E, E'.

*Hypotheses.* X smooth over Spa(k, O_k), k a complete discretely valued extension of Q_p with perfect residue field κ. Not stated in the source; packet-authored from the uniqueness of node position-of-associated-local-system.

*Proof outline.*

1. M(E) ⊗ M(E') ⊂ (M_0 ⊗ M_0') ⊗ B_dR = M_0(E ⊗ E') ⊗ B_dR (Theorem 7.2 is a tensor equivalence: horizontal sections of a tensor product).
2. Its graded pieces relative to Fil^•(M_0 ⊗ M_0') are Σ_{a+b=i} Fil^{−a}E ⊗ Fil^{−b}E' ⊗ Ô_X(i) = Fil^{−i}(E ⊗ E') ⊗ Ô_X(i) (tensor filtration, local direct summands), so by uniqueness (node position-of-associated-local-system) it equals M(E ⊗ E').
3. Duals: M(E)^∨ ⊂ M_0^∨ ⊗ B_dR has graded pieces Fil^{−i}(E^∨) ⊗ Ô_X(i) (dual filtration Fil^i E^∨ = (Fil^{1−i}E)^⊥), so equals M(E^∨).

*Acceptance.*

- M(O_X(−1)) ⊗ M(O_X(1)) = M(O_X) where O_X(n) denotes (O_X, d) with filtration jump at −n: t^{-1}B_dR^+ · tB_dR^+ = B_dR^+.
- For an abelian family, the cup product H¹ ⊗ H¹ → H² and the polarisation pairing are respected (used by node degree-one-abelian-comparison).

*Uses.* `PadicHodgeTheory:P8/associated-bdr-plus-local-system`, `PadicHodgeTheory:P8/position-of-associated-local-system`, `PadicHodgeTheory:P8/bdr-plus-local-systems-and-integrable-connections`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 7, Proposition 7.9, p. 45 (extraction lines 2683-2692): “The B+dR-local system M associated to (E, ∇, Fil•) is contained in M0 ⊗B+dR BdR, and it has the property” The characterisation by graded pieces from which tensor compatibility is derived (packet-authored).

#### Lemma. RΓ(X_k̄, A) ⊗ gr^i B_dR ≅ RΓ(X_k̄, A ⊗ gr^i OB_dR) for proper smooth X

*Node* `PadicHodgeTheory:P8/coherent-cohomology-against-graded-structural-sheaf`.

Let X be proper smooth over Spa(k, O_k) and A a locally free O_X-module of finite rank. For every i ∈ Z the natural map RΓ(X_k̄, A) ⊗_{k̄} gr^i B_dR → RΓ(X_k̄, A ⊗_{O_X} gr^i OB_dR) is a quasi-isomorphism (cohomology on X_proét/X_k̄; RΓ(X_k̄, A) = RΓ(X, A) ⊗_k k̄).

*Hypotheses.* X proper smooth over k; coherent cohomology of proper adic spaces is finite-dimensional and commutes with extension of the complete base field (Kiehl; requested from AdicSpacesPartII R3).

*Proof outline.*

1. Twist to i = 0: gr⁰B_dR = Ĉ (= completion of k̄).
2. Cover X by affinoids with toric charts on which A is free; by node cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base (Proposition 6.16 (i)) over K = Ĉ, the right-hand side is computed by the Čech complex of A ⊗ (R ⊗̂_k Ĉ), i.e. it is H^i(X_Ĉ,an, A_Ĉ).
3. Finite-dimensionality of H^i(X_an, A) and compatibility with the base change k → Ĉ give H^i(X_an, A) ⊗_k Ĉ ≅ H^i(X_Ĉ, A_Ĉ).

*Acceptance.*

- For X = P¹ over k and A = O: H⁰ = Ĉ, H¹ = 0 on both sides; for A = Ω¹: H¹ = Ĉ on both sides.
- Properness is needed: for X = the open unit disc, H⁰(X, O) ⊗ Ĉ ≠ H⁰(X_Ĉ, O).

*Uses.* `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `PadicHodgeTheory:P8:local-rational/toric-charts-for-smooth-spaces`, `AdicSpacesPartII:R3`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 7, Lemma 7.13 with proof, p. 47 (extraction lines 2793-2808): “But coherent cohomology of proper adic spaces is finite-dimensional and commutes with extension of the base-field, so we get the desired result.” The last step of the proof; the statement precedes it.

#### Theorem. de Rham comparison for B_dR^+-local systems from filtered modules on proper smooth X

*Node* `PadicHodgeTheory:P8/proper-smooth-bdr-local-system-comparison`.

Let X be proper smooth over Spa(k, O_k), (E, ∇, Fil) a filtered O_X-module with integrable connection with associated B_dR^+-local system M = M(E), k̄ an algebraic closure with completion Ĉ and B_dR = B_dR(Ĉ) Fontaine's field. Then there is a canonical Gal(k̄/k)-equivariant isomorphism H^i(X_k̄, M) ⊗_{B_dR^+} B_dR ≅ H^i_dR(X, E) ⊗_k B_dR compatible with filtrations, and a Gal(k̄/k)-equivariant isomorphism H^i(X_k̄, gr⁰M) ≅ ⊕_j H^{i−j,j}_Hodge(X, E) ⊗_k Ĉ(−j), where H^{i−j,j}_Hodge(X, E) = H^i(X, gr^j DR(E)).

*Hypotheses.* X proper smooth over k; cohomology of M on X_proét/X_k̄; the de Rham and Hodge cohomology may be computed on X_an, X_ét or X_proét (Lemma 7.3).

*Proof outline.*

1. M ⊗ B_dR is quasi-isomorphic to the filtered complex DR(E) ⊗_{O_X} OB_dR (Poincaré lemma tensored with E; association).
2. The natural map of filtered complexes DR(E) → DR(E) ⊗ OB_dR induces RΓ(X_k̄, DR(E)) ⊗_{k̄} B_dR → RΓ(X_k̄, DR(E) ⊗ OB_dR) in the filtered derived category.
3. It is a filtered quasi-isomorphism: check on gradeds and, using the naive filtration of DR(E), reduce to node coherent-cohomology-against-graded-structural-sheaf for A = gr^j E ⊗ Ω^m.
4. Hodge–Tate: the i-th cohomology of gr⁰(DR(E) ⊗ OB_dR) is ⊕_j H^i(X_k̄, gr^j DR(E)) ⊗ gr^{−j}B_dR = ⊕_j H^{i−j,j}_Hodge(X, E) ⊗ Ĉ(−j).

*Acceptance.*

- For E = (O_X, d, trivial filtration) and X a smooth proper curve of genus g: H¹(X_k̄, gr⁰M) ≅ H¹(X, O) ⊗ Ĉ ⊕ H⁰(X, Ω¹) ⊗ Ĉ(−1), of dimensions g and g; with HT(χ) = +1 the Ĉ(−1)-summand has Hodge–Tate weight −1.
- For X = Spa(k, O_k) (dimension 0): H⁰(M) ⊗ B_dR = E ⊗_k B_dR with the tensor filtration.

*Uses.* `PadicHodgeTheory:P8/associated-bdr-plus-local-system`, `PadicHodgeTheory:P8/coherent-cohomology-against-graded-structural-sheaf`, `PadicHodgeTheory:P8/vector-bundles-on-analytic-etale-and-proetale-sites`, `PadicHodgeTheory:P8:local-rational/poincare-lemma-and-faltings-extension`, `PadicHodgeTheory:P8:local-rational/de-rham-period-sheaf`, `PadicHodgeTheory:R06.1/de-rham-period-ring`, `ClassicalAdicEtaleCohomology:H0`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 7, Theorem 7.11 with proof, pp. 46-47 (extraction lines 2739-2822): “Then there is a canonical isomorphism Hi(Xk̄, M) ⊗B+dR BdR ≅ HidR(X, E) ⊗k BdR, compatible with filtration and Gal(k̄/k)-action.” The statement; the Hodge–Tate part follows in the source.

#### Theorem. Connected affinoid noetherian adic spaces are K(π,1) for p-torsion coefficients

*Node* `PadicHodgeTheory:P8/affinoid-k-pi-one-for-p-torsion`.

Let X = Spa(A, A^+) be a connected affinoid noetherian adic space over Spa(Q_p, Z_p) and x̄ a geometric point. For every p-torsion local system L on X_ét, the natural map H^i_cont(π_1(X, x̄), L_x̄) → H^i(X_ét, L) is an isomorphism for all i ≥ 0. Equivalently, every class in H^i(U_ét, L) (i > 0, U → X étale) is killed by a finite étale cover of U.

*Hypotheses.* Inputs: a universal cover A_∞ = colim A_i of faithfully flat finite étale A-algebras without nontrivial idempotents such that every faithfully flat finite étale A_∞-algebra has a section, whose p-adically completed plus-ring gives a perfectoid affinoid (Â_∞, Â_∞^+) over C_p (a consequence of the construction of Proposition 4.8 and almost purity; requested with the affinoid perfectoid basis from AI.3). X_∞ = Spa(Â_∞, Â_∞^+) ~ lim X_i (tilde-limit) and H^j(X_∞,ét, L) = colim H^j(X_i,ét, L) (Sch12 Corollary 7.18: PerfectoidSpaces P7/tilde-limits-and-etale-topos-comparison); tilting of étale sites (PerfectoidSpaces P3/etale-site-tilting-and-etale-almost-acyclicity); finite étale covers of the completed residue algebra come from the uncompleted one and tilting of finite étale algebras (Sch12 Lemma 7.5 (i), Theorem 5.25: PerfectoidSpaces P3/almost-purity-theorem, P3/tilting-finite-etale-algebras-fully-faithful).

*Proof outline.*

1. With f: X_ét → X_fét, it suffices that R^if_*L = 0 for i > 0 (f_*L = L is clear): every class of H^i(U_ét, L) dies on a finite étale cover; reduce to U = X connected, L trivial (after the cover trivialising L), L = F_p.
2. H^j(X_∞,ét, F_p) = colim_i H^j(X_i,ét, F_p) (tilde-limit comparison), so it suffices that H^j(X_∞,ét, F_p) = 0 for j > 0.
3. Tilt: X_∞,ét ≅ X_∞♭,ét; Artin–Schreier 0 → F_p → O → O → 0 on the characteristic-p perfectoid space X_∞♭ gives H^j = 0 for j ≥ 2 and H¹ = coker(x ↦ x^p − x on Â_∞♭); A_∞ has no nontrivial finite étale covers, hence neither Â_∞ nor Â_∞♭ (Sch12 7.5 (i), 5.25), so Artin–Schreier is surjective and H¹ = 0.

*Acceptance.*

- For X = Spa(Q_p⟨T⟩, Z_p⟨T⟩) (the closed disc) and L = F_p: H¹(X_ét, F_p) = Hom_cont(π_1(X), F_p).
- Non-example: the statement is for p-torsion coefficients on affinoids; it is used on the basis of 'universal covers' to verify the hypotheses of Lemma 3.18 in Proposition 8.2.

*Uses.* `PerfectoidSpaces:P7/tilde-limits-and-etale-topos-comparison`, `PerfectoidSpaces:P3/etale-site-tilting-and-etale-almost-acyclicity`, `PerfectoidSpaces:P3/almost-purity-theorem`, `PerfectoidSpaces:P3/tilting-finite-etale-algebras-fully-faithful`, `AInfCohomology:AI.3`, `AdicEtaleGeometry:A1`, `ClassicalAdicEtaleCohomology:H0`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 4, Theorem 4.9 with proof, pp. 25-26 (extraction lines 1378-1425): “Then X is a K(π, 1) for p-torsion coefficients, i.e. for all p-torsion local systems L on Xét, the natural map Hicont(π1(X, x̄), Lx̄) → Hi(Xét, L) is an isomorphism” The statement; the proof uses the perfectoid universal cover and Artin–Schreier on the tilt.

#### Theorem. Lisse Z_p-sheaves on X_ét are equivalent to lisse Ẑ_p-sheaves on X_proét, with R^j lim ν^*L_n = 0

*Node* `PadicHodgeTheory:P8/lisse-sheaves-etale-proetale-equivalence`.

Let X be a locally noetherian adic space over Spa(Q_p, Z_p) and L_• a lisse Z_p-sheaf on X_ét. Then L̂_• = lim ν^*L_n is a lisse Ẑ_p-sheaf on X_proét, R^j lim ν^*L_n = 0 for j > 0, and L_• ↦ L̂_• is an equivalence of categories. For a proper smooth f: X → Y with R^if_ét* L_• lisse, (R^if_ét* L_•)^ = R^if_proét* L̂_•.

*Hypotheses.* Theorem 4.9 (node affinoid-k-pi-one-for-p-torsion); Lemma 3.18 (exact version, requested from AI.3); Corollary 3.17 (ii) (A1).

*Proof outline.*

1. Basis B: objects U = lim U_i with U_0 affinoid connected and U → U_0 a universal pro-finite-étale cover; on U, each L_n is constant and H^j(U, ν^*L_n) = colim H^j(U_i, L_n) = 0 for j > 0 by Theorem 4.9 (Lemma 3.16 for the colimit, A1); R¹lim L_n(U) = 0 since the transition maps are surjective.
2. Lemma 3.18 gives R^j lim ν^*L_n = 0 and (lim ν^*L_n)(U) = lim L_n(U) = Ẑ_p ⊗ M on B: L̂ is lisse.
3. Equivalence: the functor is fully faithful by Corollary 3.17 (i) at each finite level; essential surjectivity by reducing a lisse Ẑ_p-sheaf modulo p^n (a locally constant sheaf on X_proét with finite fibres descends to X_ét).
4. Pushforward: R^j lim vanishing and Corollary 3.17 (ii).

*Acceptance.*

- For L_• = (Z/p^n): L̂ = Ẑ_p.
- The source writes 'one immediately verifies'; the argument above is the packet's expansion.

*Uses.* `PadicHodgeTheory:P8/lisse-zp-sheaf`, `PadicHodgeTheory:P8/affinoid-k-pi-one-for-p-torsion`, `AInfCohomology:AI.3`, `AdicEtaleGeometry:A1`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 8, Proposition 8.2, p. 48 (extraction lines 2835-2843): “Then L = L̂• = lim ν∗Ln is a lisse sheaf of Ẑp-modules on Xproét. This functor is an equivalence of categories. Moreover, Rj lim ν∗Ln = 0 for j > 0.” The statement, introduced by 'Using Theorem 4.9 and Lemma 3.18, one immediately verifies'.

#### Theorem. H^i(X_k̄, L) ⊗ B_dR^+ ≅ H^i(X_k̄, L ⊗ B_dR^+) for proper smooth X

*Node* `PadicHodgeTheory:P8/etale-to-bdr-plus-comparison-for-lisse-sheaves`.

Let X be proper smooth over Spa(k, O_k), L a lisse Ẑ_p-sheaf on X_proét, M = L ⊗_{Ẑ_p} B_dR^+. Then there is a Gal(k̄/k)-equivariant isomorphism H^i(X_k̄, L) ⊗_{Z_p} B_dR^+ ≅ H^i(X_k̄, M), where B_dR^+ = B_dR^+(Ĉ); in particular H^i(X_k̄, M) is a free B_dR^+-module of finite rank when H^i(X_k̄, L) is torsion free, and in general H^i(X_k̄, M) ⊗ B_dR = H^i(X_k̄, L) ⊗ B_dR.

*Hypotheses.* Primitive comparison theorem (Scholze Theorem 5.1): for X proper smooth over algebraically closed (C, C^+) and an F_p-local system L', H^i(X_ét, L') is finite and H^i(X_ét, L') ⊗ C^{+a}/p ≅ H^i(X_ét, L' ⊗ O^{+a}/p); requested from CohomologyComparisons CP.3 together with its consequence H^i(X_k̄, L_n) ⊗ A_inf^a ≅ H^i(X_k̄, L_n ⊗ A_inf^a) (gap: no atlas stage owns Scholze §5). The almost version of Lemma 3.18 and the A_inf sheaf with its almost acyclicity (AI.3); X_{L,proét} ≅ X_proét/X_L (Proposition 3.15, A1); ξ as in R06.1.

*Proof outline.*

1. H^i(X_k̄, L_n) ⊗ A_inf^a ≅ H^i(X_k̄, L_n ⊗ A_inf^a) for all n (primitive comparison, CP.3), then pass to lim_n by the almost Lemma 3.18: H^i(X_k̄, L) ⊗ A_inf^a ≅ H^i(X_k̄, L ⊗ A_inf^a).
2. Invert p: almost isomorphism with B_inf.
3. Multiplication by ξ^k: H^i(X_k̄, L) ⊗ B_inf/(ker θ)^k ≅ H^i(X_k̄, L ⊗ B_inf/(ker θ)^k), now a genuine isomorphism since the almost ideal becomes the unit ideal in B_inf/(ker θ)^k ([π] is a unit there).
4. Lemma 3.18 (exact) for the system L ⊗ B_inf/(ker θ)^k gives H^i(X_k̄, L) ⊗ B_dR^+ ≅ H^i(X_k̄, L ⊗ B_dR^+) (finite generation of H^i(X_k̄, L) makes ⊗ commute with lim).

*Acceptance.*

- For L = Ẑ_p and X an elliptic curve: H¹(X_k̄, L ⊗ B_dR^+) is free of rank 2 over B_dR^+.
- For X = Spa(k, O_k): H⁰(X_k̄, L ⊗ B_dR^+) = L_x̄ ⊗ B_dR^+.

*Uses.* `PadicHodgeTheory:P8/lisse-sheaves-etale-proetale-equivalence`, `PadicHodgeTheory:P8:local-rational/rational-acyclicity-of-de-rham-period-sheaves`, `PadicHodgeTheory:P8:local-rational/period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras`, `CohomologyComparisons:CP.3`, `AInfCohomology:AI.3`, `AdicEtaleGeometry:A1`.

*Sources.*

- p-adic Hodge theory for rigid-analytic varieties, Section 8, Theorem 8.4, p. 48 (extraction lines 2862-2868): “For any lisse Ẑp-sheaf L on Xproét with associated B+dR-local system M = L ⊗Ẑp B+dR, we have a Gal(k̄/k)-equivariant isomorphism Hi(Xk̄, L) ⊗Zp B+dR ≅ Hi(Xk̄, M).” The first assertion of Theorem 8.4.
- p-adic Hodge theory for rigid-analytic varieties, Section 8, proof of Theorem 8.4, p. 49: “This follows inductively from Theorem 5.1 (using Proposition 3.15)” The dependence on the primitive comparison theorem.

#### Theorem. Hodge–de Rham degeneration and H^i(X_k̄, L) ⊗ B_dR ≅ H^i_dR(X, E) ⊗ B_dR for de Rham L

*Node* `PadicHodgeTheory:P8/de-rham-comparison-for-de-rham-lisse-sheaves`.

Let X be proper smooth over Spa(k, O_k) and L a de Rham lisse Ẑ_p-sheaf with associated filtered module with integrable connection (E, ∇, Fil). Then the Hodge–de Rham spectral sequence H^{i−j,j}_Hodge(X, E) ⇒ H^i_dR(X, E) degenerates, and there are Gal(k̄/k)-equivariant isomorphisms H^i(X_k̄, L) ⊗_{Z_p} B_dR ≅ H^i_dR(X, E) ⊗_k B_dR preserving filtrations and H^i(X_k̄, L) ⊗_{Z_p} Ĉ ≅ ⊕_j H^{i−j,j}_Hodge(X, E) ⊗_k Ĉ(−j). In particular H^i(X_k̄, L) ⊗ Q_p is a de Rham G_k-representation with D_dR = H^i_dR(X, E) and Hodge filtration; with the convention HT(χ) = +1, H^{i−j,j}_Hodge contributes Hodge–Tate weight −j.

*Hypotheses.* X proper smooth over k; L de Rham with associated E.

*Proof outline.*

1. By node etale-to-bdr-plus-comparison-for-lisse-sheaves, H^i(X_k̄, M) ⊗ B_dR = H^i(X_k̄, L) ⊗ B_dR and dim_Ĉ H^i(X_k̄, gr⁰M) = dim_{B_dR}(H^i(X_k̄, M) ⊗ B_dR) (H^i(X_k̄, M) ⊗ B_dR^+-free up to torsion of H^i(L)).
2. Theorem 7.11 (node proper-smooth-bdr-local-system-comparison) translates this into Σ_j dim_k H^{i−j,j}_Hodge(X, E) = dim_k H^i_dR(X, E), i.e. degeneration.
3. The filtered isomorphism and the Hodge–Tate decomposition are Theorem 7.11 composed with the previous node.

*Acceptance.*

- X a smooth proper curve of genus g over Q_p, L = Ẑ_p: H¹_ét(X_Q̄p, Q_p) ⊗ Ĉ ≅ Ĉ^g ⊕ Ĉ(−1)^g, Hodge–Tate weights 0 and −1 each with multiplicity g (HT(χ) = +1).
- X = P¹: H²(X_k̄, Z_p) ⊗ B_dR ≅ H²_dR(P¹) ⊗ B_dR with H²_dR in Fil¹, matching H² = Z_p(−1).

*Uses.* `PadicHodgeTheory:P8/etale-to-bdr-plus-comparison-for-lisse-sheaves`, `PadicHodgeTheory:P8/proper-smooth-bdr-local-system-comparison`, `PadicHodgeTheory:P8/de-rham-lisse-sheaf`.

*Planet:* de Rham comparison with coefficients.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 8, Theorem 8.4 and its proof, pp. 48-49 (extraction lines 2869-2933): “If L is de Rham, with associated filtered module with integrable connection (E, ∇, Fil•), then the Hodge-de Rham spectral sequence” The second half of Theorem 8.4 (degeneration, filtered comparison and Hodge–Tate decomposition).

#### Application. Application of CP.3–CP.4: the proper-smooth de Rham/semistable comparison realised by the period sheaves, with tensor compatibility

*Node* `PadicHodgeTheory:P8/proper-smooth-de-rham-comparison-application`.

Let k be a finite extension of Q_p (more generally complete discretely valued with perfect residue field), X proper smooth over Spa(k, O_k), C = k̄^, G_k = Gal(k̄/k). (a) (de Rham, from CP.3) The G_k-equivariant filtered comparison isomorphism c_dR: H^i_ét(X_C, Q_p) ⊗_{Q_p} B_dR ≅ H^i_dR(X/k) ⊗_k B_dR supplied by CohomologyComparisons CP.3 coincides with the period-sheaf isomorphism of node de-rham-comparison-for-de-rham-lisse-sheaves for L = Ẑ_p (E = O_X), i.e. with the composite H^i(X_C, Ẑ_p) ⊗ B_dR ≅ H^i(X_C, B_dR) ≅ H^i(X_C, DR(O_X) ⊗ OB_dR) ≅ H^i_dR(X/k) ⊗ B_dR (Poincaré lemma, Lemma 7.13); hence H^i_ét(X_C, Q_p) is de Rham with D_dR ≅ H^i_dR(X/k) as filtered k-vector spaces (Hodge filtration), and the Hodge–de Rham spectral sequence degenerates. (b) (tensor compatibility) c_dR is compatible with cup products H^i ⊗ H^j → H^{i+j}, with the trace H^{2d}_ét(X_C, Q_p(d)) ≅ Q_p ↔ H^{2d}_dR(X/k) ≅ k for X geometrically connected of dimension d, with pullback and pushforward along morphisms of proper smooth spaces, and, for de Rham lisse sheaves L, L', with ⊗ of coefficients (associated E ⊗ E'). (c) (semistable, from CP.4) If X is the generic fibre of a proper flat semistable formal O_k-scheme, the B_st-comparison of CohomologyComparisons CP.4, H^i_ét(X_C, Q_p) ⊗ B_st ≅ H^i_HK ⊗_{K_0} B_st (compatible with G_k, φ, N), composed with ι: k ⊗_{K_0} B_st → B_dR (choice of log p), equals c_dR after identifying k ⊗_{K_0} H^i_HK ≅ H^i_dR(X/k) by the Hyodo–Kato isomorphism; hence H^i_ét(X_C, Q_p) is semistable with D_st = H^i_HK and D_dR-filtration the Hodge filtration; N = 0 on cohomology in the good-reduction case, recovering the crystalline case.

*Hypotheses.* The comparison theorems themselves (construction of c_dR through the canonical B_dR^+-deformation, its agreement with the rational pro-étale period-sheaf construction, and the B_st comparison with its compatibilities) are owned by CohomologyComparisons CP.3 and CP.4 and imported (requests). This node applies them; it does not feed CP.3/CP.4 into any construction node of P8:local-rational (the construction nodes do not depend on this one). Hodge–Tate weight convention HT(χ) = +1: the summand H^{i−j}(X, Ω^j) ⊗ C(−j) of H^i_ét ⊗ C has weight −j.

*Proof outline.*

1. (a): node de-rham-comparison-for-de-rham-lisse-sheaves gives the period-sheaf isomorphism for L = Ẑ_p; CP.3 proves that its comparison agrees with the rational pro-étale period-sheaf construction (CP.3 stage text: 'prove agreement with the rational pro-étale period-sheaf construction supplied by PadicHodgeTheory P8:local-rational'); de Rham-ness follows by taking G_k-invariants (R06.2 formalism, B_dR^{G_k} = k).
2. (b): cup product: the period-sheaf isomorphism is multiplicative because every map in the composite is induced by multiplicative maps of sheaves of rings (Ẑ_p → B_dR → OB_dR ← O_X, the Poincaré quasi-isomorphism being one of dg-algebras) and by node tensor-compatibility-of-associated-local-systems for coefficients; the trace compatibility for d-dimensional X follows from multiplicativity and the one-dimensional case H^{2d} (packet-authored).
3. (c): CP.4 states compatibility of the B_st comparison with the filtration after B_st → B_dR and with the B_dR^+-deformation of CP.3; combine with (a); D_st = (H^i_ét ⊗ B_st)^{G_k} = H^i_HK ⊗ B_st^{G_k} = H^i_HK.

*Acceptance.*

- Good-reduction elliptic curve E/Q_p: D_dR(H¹_ét(E_C, Q_p)) = H¹_dR(E/Q_p) with Fil¹ = H⁰(E, Ω¹) of dimension 1; Hodge–Tate weights 0 and −1 (HT(χ) = +1); N = 0 (CP.4 recovers CP.2).
- Tate curve E_q over Q_p: D_st(H¹_ét) is 2-dimensional with N ≠ 0 (CP.4 acceptance); its D_dR-filtration equals the Hodge filtration of H¹_dR(E_q).
- Cup product H¹ × H¹ → H² for an elliptic curve corresponds under c_dR to the de Rham cup product, and the trace H²_ét(E_C, Q_p(1)) ≅ Q_p to H²_dR(E) ≅ k.

*Uses.* `PadicHodgeTheory:P8/de-rham-comparison-for-de-rham-lisse-sheaves`, `PadicHodgeTheory:P8/tensor-compatibility-of-associated-local-systems`, `PadicHodgeTheory:P8/proper-smooth-bdr-local-system-comparison`, `PadicHodgeTheory:P8:local-rational/poincare-lemma-and-faltings-extension`, `PadicHodgeTheory:P8:local-rational/semistable-period-sheaves`, `CohomologyComparisons:CP.3`, `CohomologyComparisons:CP.4`, `PadicHodgeTheory:R06.1/semistable-period-ring`, `PadicHodgeTheory:R06.1/de-rham-period-ring`.

*Sources.*

- p-adic Hodge theory for rigid-analytic varieties, Introduction, Theorem 1.6 and Corollary 1.8 (statements), p. 4 (extraction lines 146-182): “and the p-adic étale cohomology Hi(Xét, Qp) is de Rham, with associated filtered k-vector space HidR(X).” The conclusion of Corollary 1.8 that part (a) of the node re-derives and identifies with CP.3's comparison.
- p-adic Hodge theory for rigid-analytic varieties, Section 8, Theorem 8.4, p. 48 (extraction lines 2869-2881): “then the Hodge-de Rham spectral sequence Hi−j,jHodge(X, E) ⇒ HidR(X, E) degenerates, and there is a Gal(k̄/k)-equivariant isomorphism Hi(Xk̄, L) ⊗Zp BdR ≅ HidR(X, E) ⊗k BdR preserving filtrations.” The period-sheaf isomorphism with which the CP.3 comparison is identified.

#### Lemma. Completed-tensor computations for a proper smooth f: X → Y with toric charts

*Node* `PadicHodgeTheory:P8/relative-completed-structure-sheaf-computations`.

Let f: X → Y be a proper smooth morphism of smooth adic spaces over Spa(k, O_k), Y affinoid with an étale map Y → T^m (composite of rational embeddings and finite étale maps), K the completion of k̄, Ỹ = Y ×_{T^m} T̃^m_K, U a pro-finite-étale cover of Ỹ, X_• an open simplicial affinoid cover of X with étale maps X_i → Tⁿ over the projection Tⁿ → T^m, X̃_i = X_i ×_{Tⁿ} T̃ⁿ_K, W_i = U ×_Y X_i, W̃_i = U ×_Ỹ X̃_i. All completed tensor products are of Banach spaces. (i) Ô_X(W_i) = Ô_Y(U) ⊗̂_{O_Y(Y)} O_X(X_i) and Ô_X(W̃_i) = Ô_X(W_i) ⊗̂_{K⟨T_{m+1}^{±1}, …, T_n^{±1}⟩} K⟨T_{m+1}^{±1/p^∞}, …, T_n^{±1/p^∞}⟩. (ii) Ô_Y^+(U) is flat over O_Y^+(Y) up to a bounded p-power: some p^N kills Tor₁(M, Ô_Y^+(U)) for all O_Y^+(Y)-modules M. (iii) In the Čech complex C: 0 → F(X_1) → F(X_2) → … computing (Rf_proét* F)(Y) for F = A a locally free O_X-module, all differentials have closed image. (iv) (gr⁰OB_dR,X)(W_i) = Ô_X(W_i)[V_1, …, V_m] with V_a the class of t^{-1}log([T_a♭]/T_a), and H^q(W_i, gr⁰OB_dR,X) = 0 for q > 0.

*Hypotheses.* As stated; U → Ỹ pro-finite étale, Ỹ and X̃_i perfectoid.

*Proof outline.*

1. (i): Lemma 6.18 (node perfectoid-torus-cover-completed-tensor) for Ỹ and X̃_i, rewrite, use that U → Ỹ is pro-finite étale and almost purity (Ô^{+a}_X(W̃_i) = Ô^{+a}_Y(U) ⊗̂ Ô^{+a}_X(X̃_i)), then take Z_p^{n−m}-invariants as in Lemma 5.5 (AI.3).
2. (ii): Ô_Y^+(U) is almost flat over Ô_Y^+(Ỹ) (almost purity), which up to a bounded p-power is O_Y^+(Y) ⊗̂ O_K⟨T^{±1/p^∞}⟩, topologically free over O_Y^+(Y) ⊗̂ O_K, flat over O_Y^+(Y).
3. (iii): finiteness of coherent cohomology for proper maps (Kiehl; AdicSpacesPartII R3) gives closed images.
4. (iv): Čech cohomology of W̃_i → W_i, computed exactly as in Proposition 6.16 (i) from (i) (node cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base).

*Acceptance.*

- For f = id: Ô_X(W_i) = Ô_Y(U) ⊗̂ O_X(X_i) is Ô_Y(U ×_Y X_i).
- For Y = Spa(k, O_k), m = 0: (iv) is Proposition 6.16 (i) for X_i.

*Uses.* `PadicHodgeTheory:P8:local-rational/perfectoid-torus-cover-completed-tensor`, `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `PadicHodgeTheory:P8:local-rational/completed-structure-sheaf-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/toric-charts-for-smooth-spaces`, `PerfectoidSpaces:P3/almost-purity-theorem`, `AInfCohomology:AI.3`, `AdicSpacesPartII:R3`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 8, Lemma 8.7 with proof, pp. 50-51 (extraction lines 2983-3074): “(iii) This follows from the finiteness of cohomology, proved by Kiehl, [13].” Part (iii) of the proof; parts (i), (ii), (iv) precede and follow it.

#### Lemma. (Rf_*A) ⊗_{O_Y} gr⁰OB_dR,Y ≅ Rf_*(A ⊗_{O_X} gr⁰OB_dR,X) for proper smooth f

*Node* `PadicHodgeTheory:P8/relative-pushforward-of-graded-structural-sheaf`.

Let f: X → Y be a proper smooth morphism of smooth adic spaces over Spa(k, O_k) and A a locally free O_X-module of finite rank. Then the natural morphism (Rf_proét* A) ⊗_{O_Y} gr⁰OB_dR,Y → Rf_proét*(A ⊗_{O_X} gr⁰OB_dR,X) is an isomorphism in the derived category of sheaves on Y_proét.

*Hypotheses.* f proper smooth; coherent base change along étale maps (Scholze Proposition 9.2 (ii): H^i(X, F) ⊗_{O_S(S)} O_T(T) ≅ H^i(X ×_S T, F) for T → S étale) and coherence of R^if_*A (Kiehl), requested from AdicSpacesPartII R3; Corollary 3.17 (ii) (A1).

*Proof outline.*

1. Check on U pro-étale over Y; reduce to U pro-finite étale over Ỹ, Y affinoid with a toric chart, and choose the simplicial cover X_• of node relative-completed-structure-sheaf-computations.
2. By (iv) of that node, (Rf_*(A ⊗ gr⁰OB_dR,X))(U) is computed by the complex of W_• = U ×_Y X_•, which by (i) and (iv) is (C ⊗̂_{O_Y(Y)} Ô_Y(U))[V_1, …, V_m].
3. By (ii) ⊗̂ Ô_Y(U) is exact on strictly exact sequences of Banach O_Y(Y)-modules and by (iii) C has closed images, so cohomology commutes: (R^if_*(A ⊗ gr⁰))(U) = ((R^if_*A)(Y) ⊗̂ Ô_Y(U))[V]; replace ⊗̂ by ⊗ since (R^if_*A)(Y) is coherent.
4. Ô_Y(U)[V] = gr⁰OB_dR,Y(U) (Proposition 6.16 (i) proof) and (R^if_*A)(U) = (R^if_*A)(Y) ⊗ O_Y(U) (Corollary 3.17 (ii), Proposition 9.2 (ii)).

*Acceptance.*

- For Y = Spa(k, O_k): Lemma 7.13 in degree 0 (node coherent-cohomology-against-graded-structural-sheaf).
- For f = id: tautological.

*Uses.* `PadicHodgeTheory:P8/relative-completed-structure-sheaf-computations`, `PadicHodgeTheory:P8/coherent-cohomology-against-graded-structural-sheaf`, `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `AdicSpacesPartII:R3`, `AdicEtaleGeometry:A1`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 8, Lemma 8.6 with proof, pp. 49-51 (extraction lines 2957-3093): “Then the morphism (Rfproét∗A) ⊗OY gr0 OBdR,Y → Rfproét∗(A ⊗OX gr0 OBdR,X) is an isomorphism in the derived category.” The statement.

#### Theorem. R^if_*(L ⊗ B_dR,X^+) ≅ R^if_*L ⊗ B_dR,Y^+ for proper smooth f

*Node* `PadicHodgeTheory:P8/relative-bdr-plus-local-system-comparison`.

Let f: X → Y be a proper smooth morphism of smooth adic spaces over Spa(k, O_k), L a lisse Ẑ_p-sheaf on X_proét with M = L ⊗ B_dR,X^+, and assume R^if_proét* L is a lisse Ẑ_p-sheaf on Y_proét. Then there is a canonical isomorphism R^if_proét* M ≅ R^if_proét* L ⊗_{Ẑ_p} B_dR,Y^+; in particular R^if_proét* M is a B_dR,Y^+-local system associated with R^if_proét* L.

*Hypotheses.* Relative primitive comparison (Scholze Corollary 5.11): (R^if_ét* L') ⊗ O_Y^{+a}/p ≅ R^if_ét*(L' ⊗ O_X^{+a}/p) for F_p-local systems L' and proper smooth f; requested from CohomologyComparisons CP.3 with Theorem 5.1 (gap: no atlas stage owns Scholze §5). Corollary 3.17 (ii) (A1); Lemma 3.18 and its almost version, A_inf and O^+_{X♭} (AI.3). The lisseness hypothesis holds when f and L are analytifications of algebraic objects (Remark 8.9 via Huber's comparison, Theorem 9.3) and for abelian families (node degree-one-abelian-comparison).

*Proof outline.*

1. Work on Y_proét/Y_K, K = completion of k̄. From Corollary 5.11 and Corollary 3.17 (ii): (R^if_* L') ⊗ O_Y^{+a}/p ≅ R^if_proét*(L' ⊗ O_X^{+a}/p); with π ∈ O_K♭, π♯ = p, this is (R^if_* L') ⊗ O^{+a}_{Y♭}/π ≅ R^if_*(L' ⊗ O^{+a}_{X♭}/π), and by induction on m, modulo π^m.
2. Hence (R^if_* L_n) ⊗ A_inf,Y^a/[π]^m ≅ R^if_*(L_n ⊗ A_inf,X^a/[π]^m); lisseness of R^if_*L_n and Lemma 3.18 pass to lim_m, then lim_n: R^if_*L ⊗ A_inf,Y^a ≅ R^if_*(L ⊗ A_inf,X^a).
3. Invert p, multiply by ξ^k and pass to B_dR^+ exactly as in node etale-to-bdr-plus-comparison-for-lisse-sheaves.

*Acceptance.*

- For Y = Spa(k, O_k): node etale-to-bdr-plus-comparison-for-lisse-sheaves.
- For an abelian scheme f: A → S and i = 1: R¹f_*M ≅ (T_pA)^∨ ⊗ B_dR,S^+ (node degree-one-abelian-comparison).

*Uses.* `PadicHodgeTheory:P8/etale-to-bdr-plus-comparison-for-lisse-sheaves`, `PadicHodgeTheory:P8/lisse-sheaves-etale-proetale-equivalence`, `PadicHodgeTheory:P8:local-rational/period-sheaves-on-affinoid-perfectoids`, `CohomologyComparisons:CP.3`, `AInfCohomology:AI.3`, `AdicEtaleGeometry:A1`.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 8, Theorem 8.8 (i) with proof, pp. 51-52 (extraction lines 3094-3156): “There is a canonical isomorphism Ri fproét∗M ≅ Ri fproét∗L ⊗Ẑp B+dR,Y.” Part (i); the proof starts from Corollary 5.11.

#### Theorem. Relative de Rham comparison: R^if_*L is de Rham with associated R^if_dR*(E) (Gauss–Manin)

*Node* `PadicHodgeTheory:P8/relative-de-rham-comparison`.

In the situation of the previous node, assume L de Rham with associated filtered O_X-module with integrable connection (E, ∇, Fil). Then the relative Hodge cohomology R^{i−j,j}f_Hodge*(E) = R^if_*(gr^j DR_{X/Y}(E)) is a locally free O_Y-module of finite rank for all i, j, the relative Hodge–de Rham spectral sequence R^{i−j,j}f_Hodge*(E) ⇒ R^if_dR*(E) degenerates, and R^if_proét* L is de Rham with associated filtered O_Y-module with integrable connection R^if_dR*(E) = R^if_*(DR_{X/Y}(E)) (Hodge filtration and Gauss–Manin connection). Moreover R^if_dR*(E) ⊗_{O_Y} OB_dR,Y ≅ R^if_proét*M ⊗_{B_dR,Y^+} OB_dR,Y compatibly with filtrations and connections.

*Hypotheses.* As in the previous node; DR_{X/Y}(E) = (E → E ⊗ Ω¹_{X/Y} → …) with its natural filtration; the Gauss–Manin connection on R^if_dR*(E) is the one induced by the Katz–Oda filtration, compatible with ∇ on OB_dR,Y through the relative Poincaré lemma (packet-authored identification).

*Proof outline.*

1. Rf_*(DR_{X/Y}(E)) ⊗_{O_Y} OB_dR,Y → Rf_*(DR_{X/Y}(E) ⊗_{O_X} OB_dR,X) is a filtered quasi-isomorphism: reduce on gradeds and by the naive filtration to Lemma 8.6 (node relative-pushforward-of-graded-structural-sheaf).
2. By the relative Poincaré lemma with the completed tensor product (node relative-poincare-lemma), the right side is Rf_*(M ⊗̂_{f^{-1}B_dR,Y^+} f^{-1}OB_dR,Y), which equals (Rf_*M) ⊗_{B_dR,Y^+} OB_dR,Y since Rf_*M is a B_dR,Y^+-local system (previous node) and OB_dR,Y is locally a completed polynomial/power-series extension (projection formula checked on gradeds, where gr^i OB_dR,Y is locally a direct sum of copies of Ô_Y).
3. In degree 0 of gr: ⊕_j R^{i−j,j}f_Hodge*(E) ⊗ gr⁰OB_dR,Y(−j) ≅ (gr⁰R^if_*M) ⊗_{Ô_Y} gr⁰OB_dR,Y, a locally free gr⁰OB_dR,Y-module; gr⁰OB_dR,Y is locally faithfully flat over O_Y, so each R^{i−j,j}f_Hodge*(E) is locally free.
4. Similarly R^if_dR*(E) ⊗ OB_dR,Y ≅ R^if_*M ⊗ OB_dR,Y with filtrations and connections; counting ranks gives degeneration; with (i), R^if_*L is de Rham with associated R^if_dR*(E).

*Acceptance.*

- For Y = Spa(k, O_k): node de-rham-comparison-for-de-rham-lisse-sheaves.
- For an elliptic curve f: E → S and i = 1: R¹f_*Ẑ_p is de Rham with associated (H¹_dR(E/S), ∇_GM, Fil¹ = f_*Ω¹_{E/S}); rank 2 with Hodge numbers (1, 1).

*Uses.* `PadicHodgeTheory:P8/relative-bdr-plus-local-system-comparison`, `PadicHodgeTheory:P8/relative-pushforward-of-graded-structural-sheaf`, `PadicHodgeTheory:P8/de-rham-lisse-sheaf`, `PadicHodgeTheory:P8/associated-bdr-plus-local-system`, `PadicHodgeTheory:P8:local-rational/relative-poincare-lemma`, `PadicHodgeTheory:P8:local-rational/structural-de-rham-sheaf`, `AdicSpacesPartII:R3`.

*Planet:* Relative de Rham comparison.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 8, Theorem 8.8 (ii), pp. 51-52 (extraction lines 3111-3117): “Then the relative Hodge cohomology Ri−j,j fHodge∗(E) is a locally free OY-module of finite rank for all i, j, the relative Hodge-de Rham spectral sequence” Part (ii); the conclusion that Ri fproét∗L is de Rham with associated Ri fdR∗(E) follows in the statement.

#### Theorem. Degree-one comparison for abelian families: R¹f_*Ẑ_p ⊗ OB_dR,S ≅ H¹_dR(A/S) ⊗ OB_dR,S

*Node* `PadicHodgeTheory:P8/degree-one-abelian-comparison`.

Let S be a smooth adic space over Spa(k, O_k) and f: A → S a proper smooth morphism with geometrically connected fibres such that R¹f_ét* Z/p^n is locally constant with finite fibres for all n (e.g. the analytification of an abelian scheme over a smooth k-scheme, or an abelian family with R¹f_*Z/p^n ≅ Hom(A[p^n], Z/p^n)). Put T := R¹f_proét* Ẑ_p (for abelian families the dual of the Tate-module local system T_pA). Then: (i) T is a lisse Ẑ_p-sheaf and is de Rham, with associated filtered O_S-module with integrable connection (H¹_dR(A/S), ∇_GM, Fil), where Fil⁰ = H¹_dR, Fil¹ = f_*Ω¹_{A/S} (the Hodge subbundle), Fil² = 0, and H¹_dR(A/S), f_*Ω¹_{A/S}, R¹f_*O_A are locally free; (ii) there is an isomorphism T ⊗_{Ẑ_p} OB_dR,S ≅ H¹_dR(A/S) ⊗_{O_S} OB_dR,S of sheaves on S_proét compatible with filtrations and connections, and T ⊗ B_dR,S^+ = Fil⁰(H¹_dR(A/S) ⊗ OB_dR,S)^{∇=0}; (iii) the isomorphism is functorial in A/S (homomorphisms of families, in particular endomorphisms and isogenies) and compatible with base change S' → S; (iv) it is compatible with tensor structures: the cup product R¹f_*Ẑ_p ⊗ R¹f_*Ẑ_p → R²f_*Ẑ_p and the de Rham cup product (hence with polarisations and the Weil pairing through the Tate twist Ẑ_p(−1) ↔ (O_S, d, jump at 1)), and with duals.

*Hypotheses.* f proper smooth with R¹f_*Z/p^n locally constant (the hypothesis of Theorem 8.8 in degree 1); the identification R¹f_*Ẑ_p = (T_pA)^∨ for abelian families and the verification of the hypothesis for T1's families are HodgeTateAndCanonicalSubgroups T1's (it owns the abelian/automorphic comparison and its identification with T0). Theorem 8.8 applied with L = Ẑ_p, E = (O_A, d, trivial filtration), i = 1; relative Hodge–de Rham degeneration gives the Hodge filtration.

*Proof outline.*

1. R¹f_*Ẑ_p is lisse by the hypothesis and Proposition 8.2 (node lisse-sheaves-etale-proetale-equivalence).
2. Apply node relative-de-rham-comparison to L = Ẑ_p (de Rham with E = O_A): R¹f_*Ẑ_p is de Rham with associated R¹f_dR*(O_A) = H¹_dR(A/S); gr of the Hodge filtration is R^{1−j,j}f_Hodge* = R^{1−j}f_*Ω^j, i.e. R¹f_*O_A (j = 0) and f_*Ω¹ (j = 1), locally free.
3. (ii) is the conclusion R¹f_dR* ⊗ OB_dR ≅ R¹f_*M ⊗ OB_dR together with node relative-bdr-plus-local-system-comparison (R¹f_*M = T ⊗ B_dR,S^+) and node associated-bdr-plus-local-system.
4. (iii): every step is functorial in (A → S) and compatible with base change of the period sheaves.
5. (iv): multiplicativity of the relative comparison (as in node proper-smooth-de-rham-comparison-application (b), relative version) and node tensor-compatibility-of-associated-local-systems; R²f_*Ẑ_p for relative curves/abelian families is lisse under the same hypothesis in degree 2.

*Acceptance.*

- Elliptic curve E/S: T has rank 2, Hodge numbers (1, 1); over a point S = Spa(k, O_k) with good reduction, D_dR(H¹_ét(E_C, Q_p)) = H¹_dR(E/k) with Fil¹ = H⁰(E, Ω¹) (1-dimensional) and Hodge–Tate weights {0, −1} (HT(χ) = +1).
- Weil pairing: ∧²R¹f_*Ẑ_p ≅ R²f_*Ẑ_p ≅ Ẑ_p(−1) for elliptic curves corresponds to ∧²H¹_dR ≅ H²_dR ≅ O_S with filtration jump at 1 (the filtered module associated to Ẑ_p(−1)).

*Uses.* `PadicHodgeTheory:P8/relative-de-rham-comparison`, `PadicHodgeTheory:P8/relative-bdr-plus-local-system-comparison`, `PadicHodgeTheory:P8/tensor-compatibility-of-associated-local-systems`, `PadicHodgeTheory:P8/lisse-sheaves-etale-proetale-equivalence`, `PadicHodgeTheory:P8/associated-bdr-plus-local-system`, `PadicHodgeTheory:P8/proper-smooth-de-rham-comparison-application`.

*Planet:* Degree-one abelian comparison.

*Source.* p-adic Hodge theory for rigid-analytic varieties, Section 8, Theorem 8.8 and Remark 8.9, pp. 51-52 (extraction lines 3094-3119): “By Theorem 9.3, the assumption is satisfied whenever f : X → Y and L come as the analytification of corresponding algebraic objects.” The lisseness hypothesis for algebraic (e.g. abelian-scheme) families; Theorem 8.8 is applied in degree 1.

### What is missing

- Coverage status: `partial`. Decomposed: Scholze §7 (B_dR^+-local systems, filtered modules with integrable connection, Theorems 7.2, 7.6, 7.11, Lemmas 7.3, 7.7, 7.8, 7.10, 7.13, Proposition 7.9) and §8 (Proposition 8.2, Definition 8.3, Theorems 8.4, 8.8, Lemmas 8.6-8.7) with Theorem 4.9; the application of CP.3-CP.4 (interface id P8/proper-smooth-de-rham-comparison-application); tensor compatibility; the degree-one abelian comparison supplied to HodgeTateAndCanonicalSubgroups T1.
- The primitive comparison theorem (Sch13 Theorem 5.1, Corollary 5.11) has no owner stage; requested from CohomologyComparisons CP.3 pending the restructure decision.
- Tan–Tong §§3-6 (crystalline lisse sheaves, crystalline primitive comparison, crystalline comparison with coefficients and in families, Andreatta–Brinon acyclicity) are not planned here; owner proposed in restructure (CohomologyComparisons CP.2 with coefficients).
- The semistable comparison with coefficients and in families (log period sheaves) is not planned here (CP.4 / HodgeTateAndCanonicalSubgroups T6).
- **Gap: No atlas owner for Scholze's primitive comparison theorem (Sch13 §5).** Theorem 5.1 (finiteness of H^i(X_ét, L) for F_p-local systems on proper smooth X over algebraically closed (C, C^+) and the almost isomorphism with H^i(X_ét, L ⊗ O^{+a}/p)), its proof through Lemmas 5.3-5.8 and 2.12 and Lemma 4.12, and Corollary 5.11 (relative form, via Huber's proper base change Proposition 2.6.1) are the inputs of Theorem 8.4 (i) and Theorem 8.8 (i). No stage text in the atlas names them; the CohomologyComparisons packet records the same absence for Scholze's Theorem 5.1/8.4. This packet requests them from CP.3, whose stage text owns 'the comparison after B_dR-inversion with p-adic étale cohomology'. NEXT ACTION: the restructure decision below (CP.3 absorbs Sch13 §5, or a new CohomologyComparisons prefix stage upstream of CP.3 and AI.4 is created), then a node-level decomposition of §5 there. Needed by `PadicHodgeTheory:P8/etale-to-bdr-plus-comparison-for-lisse-sheaves`, `PadicHodgeTheory:P8/relative-bdr-plus-local-system-comparison`.
- **Gap: Packet-authored arguments for steps the sources only assert.** The following are written out in this packet because the sources assert them: Corollary 6.6 ('Go through all identifications') and its gr⁰OB_dR version; the Cartan–Leray formula over X_K^{m/X} ('inspection of the proof'); ν_*OB_dR = O_{X_ét} ('The first part is clear'; the filtration of OB_dR is not complete, so the packet argues through t^{-j}OB_dR^+); the Γ_k-descent R(i) → R ⊗̂ K(i) ('Similarly to Lemma 5.5'; a relative form of Tate's normalised traces); Corollary 6.15 and Remark 6.20 (no proofs); the connection on the corrected OB_dR^+ (not restated by the erratum); tensor and cup-product compatibility (not stated). NEXT ACTION: independent review of these arguments; they are labelled packet-authored in the nodes. Needed by `PadicHodgeTheory:P8:local-rational/period-sheaves-on-profinite-products`, `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/pushforward-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/higher-direct-images-of-twisted-completed-structure-sheaf`, `PadicHodgeTheory:P8:local-rational/graded-structural-de-rham-sheaf-local-description`, `PadicHodgeTheory:P8:local-rational/tate-descent-for-completed-cyclotomic-tensor`, `PadicHodgeTheory:P8:local-rational/structural-de-rham-sheaf-connection`, `PadicHodgeTheory:P8/tensor-compatibility-of-associated-local-systems`, `PadicHodgeTheory:P8/proper-smooth-de-rham-comparison-application`.
- **Request to `AInfCohomology:AI.3`.** For every locally noetherian adic space X over Spa(Q_p, Z_p) (not only generic fibres of smooth formal schemes), on X_proét with Scholze's corrected covers: (a) O_X^+ = ν^*O^+_{X_ét} and Ô_X^+ = lim O_X^+/p^n with O_X^+/p^n ≅ Ô_X^+/p^n and Ô_X^+(U) Z_p-flat and p-adically complete (Sch13 Definition 4.1, Lemma 4.2 (iii)); (b) affinoid perfectoid objects U with Û = Spa(R, R^+) independent of the presentation, Lemma 4.5 (i)-(iii), Lemma 4.6, Corollary 4.7 and Proposition 4.8 (the basis, for X over Spa(Q_p, Z_p) through Proposition 3.15), and the perfectoid completed universal cover of a connected noetherian affinoid used in Theorem 4.9; (c) Lemma 4.10: Ô_X^+(U) = R^+, Ô_X^+(U) is the p-adic completion of O_X^+(U), H^i(U, Ô_X^+) almost zero for i > 0; (d) Ô^+_{X♭} = lim_Φ O_X^+/p and Lemma 5.10; (e) A_inf = W(Ô^+_{X♭}) with θ: A_inf → Ô_X^+ surjective, A_inf(U) = W(R♭+) and H^i(U, A_inf) almost zero (Theorem 6.5 for A_inf), and the integral cases of Corollary 6.6 (Ô_X^+(U × S) = Hom_cont(S, R^+), A_inf(U × S) = Hom_cont(S, W(R♭+))); (f) Lemma 3.18 in its exact and almost forms; (g) Lemma 5.5 (continuous Z_p^n-cohomology of O_K⟨T^{±1/p^∞}⟩ by the Koszul complex, non-integral part killed by ζ_p − 1, compatibility with completed base change). Needed by `PadicHodgeTheory:P8:local-rational/proetale-structure-sheaves-and-valuations`, `PadicHodgeTheory:P8:local-rational/integral-elements-via-valuations`, `PadicHodgeTheory:P8:local-rational/completed-structure-sheaf-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/affinoid-perfectoid-objects-and-etale-pullbacks`, `PadicHodgeTheory:P8:local-rational/period-sheaves-definitions`, `PadicHodgeTheory:P8:local-rational/period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/rational-acyclicity-of-de-rham-period-sheaves`, `PadicHodgeTheory:P8:local-rational/period-sheaves-on-profinite-products`, `PadicHodgeTheory:P8:local-rational/corrected-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/structural-algebra-structure-on-bdr-power-series`, `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/structural-crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-crystalline-sheaf`, `PadicHodgeTheory:P8:local-rational/structural-crystalline-sheaf-on-affinoid-perfectoids`, `PadicHodgeTheory:P8/affinoid-k-pi-one-for-p-torsion`, `PadicHodgeTheory:P8/lisse-sheaves-etale-proetale-equivalence`, `PadicHodgeTheory:P8/etale-to-bdr-plus-comparison-for-lisse-sheaves`, `PadicHodgeTheory:P8/relative-completed-structure-sheaf-computations`, `PadicHodgeTheory:P8/relative-bdr-plus-local-system-comparison`.
- **Request to `AdicEtaleGeometry:A1`.** Scholze's pro-étale site X_proét of a locally noetherian adic space with the erratum's transfinite covers, ν: X_proét → X_ét, Lemma 3.10, Proposition 3.12 (U = lim of affinoids is qcqs; the topos is coherent, so cohomology of qcqs objects commutes with filtered colimits), Proposition 3.15 (X_{L,proét} ≅ X_proét/X_L), Lemma 3.16 and Corollary 3.17 (i)-(ii), the objects U × S for profinite S pulled back from the pro-finite-étale site of the base, Proposition 3.7 (ii)-(iii) with corrected covers (H^i(pt, F_M) = H^i_cont(G, M)), and Galois descent of sheaves along pro-finite-étale Galois covers such as X_K → X. Needed by `PadicHodgeTheory:P8:local-rational/proetale-structure-sheaves-and-valuations`, `PadicHodgeTheory:P8:local-rational/integral-elements-via-valuations`, `PadicHodgeTheory:P8:local-rational/completed-structure-sheaf-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/rational-acyclicity-of-de-rham-period-sheaves`, `PadicHodgeTheory:P8:local-rational/de-rham-period-sheaf`, `PadicHodgeTheory:P8:local-rational/period-sheaves-on-profinite-products`, `PadicHodgeTheory:P8:local-rational/graded-de-rham-period-sheaf-tate-twist`, `PadicHodgeTheory:P8:local-rational/corrected-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/structural-de-rham-sheaf-connection`, `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/pushforward-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/almost-limit-lemma-for-acris-modules`, `PadicHodgeTheory:P8:local-rational/crystalline-period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/structural-crystalline-period-sheaves`, `PadicHodgeTheory:P8:local-rational/local-structure-of-structural-crystalline-sheaf`, `PadicHodgeTheory:P8/vector-bundles-on-analytic-etale-and-proetale-sites`, `PadicHodgeTheory:P8/affinoid-k-pi-one-for-p-torsion`, `PadicHodgeTheory:P8/lisse-zp-sheaf`, `PadicHodgeTheory:P8/lisse-sheaves-etale-proetale-equivalence`, `PadicHodgeTheory:P8/etale-to-bdr-plus-comparison-for-lisse-sheaves`, `PadicHodgeTheory:P8/relative-pushforward-of-graded-structural-sheaf`, `PadicHodgeTheory:P8/relative-bdr-plus-local-system-comparison`.
- **Request to `AdicEtaleGeometry:A2`.** For smooth adic spaces over a complete nonarchimedean field: étale maps to the unit ball near a given point with the open set containing its closure (Huber, Étale cohomology of rigid analytic varieties, Corollary 1.6.10), the factorisation of an étale map over a rational subset as an open embedding into a finite étale cover (Huber Lemma 2.2.8), compatible local toric charts for smooth morphisms, and the sheaf Ω¹_{X_ét} of continuous Kähler differentials (locally free of rank dim X) with Ω^i = ∧^iΩ¹ and relative Ω¹_{X/Y}. Needed by `PadicHodgeTheory:P8:local-rational/toric-charts-for-smooth-spaces`, `PadicHodgeTheory:P8:local-rational/corrected-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/structural-de-rham-sheaf-connection`, `PadicHodgeTheory:P8:local-rational/poincare-lemma-and-faltings-extension`, `PadicHodgeTheory:P8:local-rational/relative-poincare-lemma`, `PadicHodgeTheory:P8/filtered-module-with-integrable-connection`.
- **Request to `ClassicalAdicEtaleCohomology:H0`.** Derived direct images Rν_* and Rf_* for sheaves of modules on pro-étale and étale sites, R^qν_* as the sheafification of U ↦ H^q(U, −), the Čech-to-derived comparison and the Cartan–Leray spectral sequence for a cover (SGA 4 V 3.3), and Leray spectral sequences. Needed by `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf-over-cyclotomic-base`, `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/pushforward-of-structural-de-rham-sheaf`, `PadicHodgeTheory:P8:local-rational/higher-direct-images-of-twisted-completed-structure-sheaf`, `PadicHodgeTheory:P8:local-rational/almost-limit-lemma-for-acris-modules`, `PadicHodgeTheory:P8/position-of-associated-local-system`, `PadicHodgeTheory:P8/proper-smooth-bdr-local-system-comparison`, `PadicHodgeTheory:P8/affinoid-k-pi-one-for-p-torsion`.
- **Request to `AdicSpacesPartII:R3`.** Kiehl's finiteness for proper morphisms (R^if_* of a coherent sheaf is coherent; Čech differentials have closed image), finite-dimensionality of coherent cohomology of proper adic spaces over a field and its compatibility with extension of the complete base field (Sch13 Lemma 7.13), base change of coherent cohomology of a proper f along étale T → S of affinoids (Sch13 Proposition 9.2 (ii)), and étale descent of finite projective modules along finite étale maps of affinoids (for Sch13 Lemma 7.3). Needed by `PadicHodgeTheory:P8/vector-bundles-on-analytic-etale-and-proetale-sites`, `PadicHodgeTheory:P8/coherent-cohomology-against-graded-structural-sheaf`, `PadicHodgeTheory:P8/relative-completed-structure-sheaf-computations`, `PadicHodgeTheory:P8/relative-pushforward-of-graded-structural-sheaf`, `PadicHodgeTheory:P8/relative-de-rham-comparison`.
- **Request to `CohomologyComparisons:CP.3`.** (a) The de Rham comparison for proper smooth X over a complete discretely valued k with perfect residue field (trivial coefficients): the G_k-equivariant filtered isomorphism H^i_ét(X_C, Q_p) ⊗ B_dR ≅ H^i_dR(X/k) ⊗_k B_dR and its agreement with the rational pro-étale period-sheaf construction of P8:local-rational (CP.3 stage text). (b) The primitive comparison theorem Sch13 Theorem 5.1 (finiteness of H^i(X_ét, L) for F_p-local systems L on proper smooth X over algebraically closed (C, C^+), vanishing above 2 dim X, and the almost isomorphism H^i(X_ét, L) ⊗ C^{+a}/p ≅ H^i(X_ét, L ⊗ O_X^{+a}/p)), its relative form Corollary 5.11 for proper smooth f with the almost setting of O_Y^+, and the resulting almost isomorphisms H^i(X_C, L_n) ⊗ A_inf^a ≅ H^i(X_C, L_n ⊗ A_inf^a) (first step of the proof of Theorem 8.4); no atlas stage currently owns Scholze §5 (see restructure and gaps). Needed by `PadicHodgeTheory:P8/etale-to-bdr-plus-comparison-for-lisse-sheaves`, `PadicHodgeTheory:P8/proper-smooth-de-rham-comparison-application`, `PadicHodgeTheory:P8/relative-bdr-plus-local-system-comparison`.
- **Request to `CohomologyComparisons:CP.4`.** The B_st comparison for proper flat semistable formal O_k-models: H^i_ét(X_C, Q_p) ⊗ B_st ≅ H^i_HK ⊗_{K_0} B_st, compatible with G_k, φ, N and, after ι: k ⊗_{K_0} B_st → B_dR, with the Hodge filtration and with CP.3's B_dR^+-deformation; the Hyodo–Kato isomorphism k ⊗_{K_0} H^i_HK ≅ H^i_dR(X/k). Needed by `PadicHodgeTheory:P8/proper-smooth-de-rham-comparison-application`.

## R06.2 Period functors and admissibility

The regular $(G_K, B)$-ring formalism and the period functors $D_{\mathrm{HT}}$, $D_{\mathrm{dR}}$, $D_{\mathrm{cris}}$ and $D_{\mathrm{st}}$, with:

- their dimension bounds, exactness, tensor and dual compatibility, descent and coefficient base change;
- Tate's theorems on $C(\psi)$ and the Hodge–Tate decomposition;
- the implications crystalline ⇒ semistable ⇒ de Rham ⇒ Hodge–Tate;
- filtered $(\varphi,N)$-modules with descent data, $t_H$ and $t_N$;
- weak admissibility, and the proof that admissible implies weakly admissible;
- the definition of Hodge–Tate weights with its convention.

The Colmez–Fontaine theorem (weakly admissible implies admissible) is stated here. So are its reduction to the bigness criterion and the rank-one case. Its proof, after Berger 2008, needs P7, PG.1–PG.2 and RD.1–RD.2, which come later, so the restructuring proposes to place it in R06.3.

### Objects

#### Definition. (F, G)-regular rings

*Module* `TauCeti/PadicHodge/PeriodFunctors.lean`. *Node* `PadicHodgeTheory:R06.2/regular-period-ring`.

Let F be a field, G a group, and B an F-algebra which is a domain with an action of G by F-algebra automorphisms such that E := B^G is a field; let C = Frac(B) with the induced G-action. B is (F, G)-regular if (i) C^G = B^G, and (ii) every nonzero b ∈ B such that the F-line Fb is G-stable is a unit of B.

*Hypotheses.* No topology on F, G or B is required (B-C §5.1).

*API.*

- `IsRegularPeriodRing` (*structure*) — The predicate: B a domain, (Frac B)^G = B^G, and nonzero b spanning a G-stable F-line is a unit.
- `IsRegularPeriodRing.of_isField` (*instance*) — A field with G-action is regular.
- `IsRegularPeriodRing.invariants_isField` (*characterisation*) — If B is regular then B^G is a field (hypothesis) equal to (Frac B)^G.
- `IsRegularPeriodRing.unit_of_stable_line` (*projection*) — The unit property for stable lines.
- `IsRegularPeriodRing.character_of_stable_line` (*other*) — A G-stable F-line Fb defines a character η: G → F^× with g(b) = η(g)b.

*Used by.*

- Brinon–Conrad Theorem 5.2.1 — the admissibility formalism requires B regular
- `PadicHodgeTheory:R06.2/period-rings-are-regular` — B_HT, B_dR, B_cris, B_st are regular
- `PadicHodgeRegulators:L0` — realisations of Galois representations in regular period rings

*Unit tests.* A wrong definition fails one of these.

- `isRegularPeriodRing_field` (degenerate) — A field L with a G-action by F-algebra automorphisms is (F, G)-regular.
- `isRegularPeriodRing_BdR` (compatibility) — B_dR = BDeRham 𝓞_ℂ_[p] p with the G_K-action is (Q_p, G_K)-regular (it is a field).
- `not_isRegularPeriodRing_BdRPlus` (non-example) — B_dR^+ with the G_K-action is not (Q_p, G_K)-regular: t is a non-unit spanning a stable line.
- `isRegularPeriodRing_polynomial_trivial` (computation) — F[X] with trivial G-action is not regular (X spans a stable line and is not a unit), while F(X) is.

*Construction.*

1. Definition; the G-action extends to C by g(b_1/b_2) = g(b_1)/g(b_2).

*Acceptance.*

- Every field with a G-action is (F, G)-regular.
- B_dR^+ is not (Q_p, G_K)-regular: t spans a G_K-stable Q_p-line but is not a unit (B-C Example 5.1.3).

*Uses.* `mathlib:IsDomain`, `mathlib:FractionRing`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, §5.1, Definition 5.1.1, p. 66: “We say B is (F, G)-regular if C G = B G and if every nonzero b ∈ B whose F -linear span F b is G-stable is a unit in B.” The definition.
- Theory of p-adic Galois representations, §2.1.2, Definition 2.8, p. 21: “We say that B is (F, G)-regular if the following conditions” Same definition in F-O.

#### Definition. The category Fil_F of finite-dimensional filtered vector spaces

*Module* `TauCeti/PadicHodge/PeriodFunctors.lean`. *Node* `PadicHodgeTheory:R06.2/filtered-vector-spaces`.

For a field F, an object of Fil_F is a finite-dimensional F-vector space D with a decreasing Z-indexed filtration by subspaces Fil^iD that is exhaustive (Fil^iD = D for i ≪ 0) and separated (Fil^iD = 0 for i ≫ 0); morphisms are linear maps T with T(Fil^iD') ⊆ Fil^iD. Kernels carry the subspace filtration and cokernels the quotient filtration; T is strict if the quotient and subspace filtrations on T(D') agree (coim T ≅ im T). A short exact sequence is one that is exact with D' ⊆ D carrying the subspace filtration and D'' the quotient filtration, equivalently 0 → Fil^iD' → Fil^iD → Fil^iD'' → 0 exact for all i. Tensor product: Fil^n(D ⊗ D') = Σ_{p+q=n} Fil^pD ⊗ Fil^qD'; dual: Fil^i(D^∨) = (Fil^{1−i}D)^⊥; unit F[0] (Fil^0 = F, Fil^1 = 0); shift D[n] with Fil^i(D[n]) = Fil^{i+n}D; gr^i D = Fil^iD/Fil^{i+1}D; Hom-filtration Fil^i Hom(D', D) = {T : T(Fil^jD') ⊆ Fil^{i+j}D}. Fil_F is additive but not abelian.

*Hypotheses.* F any field (F = K for D_dR, F = K' for descent).

*API.*

- `FilteredSpace` (*structure*) — A finite-dimensional F-space D with an antitone family fil: Z → Submodule F D, exhaustive and separated.
- `FilteredSpace.Hom` (*structure*) — Filtration-preserving linear maps.
- `FilteredSpace.IsStrict` (*other*) — T is strict: T(Fil^iD') = Fil^iD ∩ T(D') for all i.
- `FilteredSpace.tensor` (*constructor*) — Fil^n(D ⊗ D') = Σ_{p+q=n} Fil^p ⊗ Fil^q.
- `FilteredSpace.dual` (*constructor*) — Fil^i D^∨ = (Fil^{1−i}D)^⊥.
- `FilteredSpace.shift` (*constructor*) — D[n] with Fil^i(D[n]) = Fil^{i+n}D.
- `FilteredSpace.gr` (*projection*) — gr^i D = Fil^i/Fil^{i+1}; Σ_i dim gr^i D = dim D.
- `FilteredSpace.unit` (*constructor*) — F[0].
- `FilteredSpace.ShortExact` (*structure*) — Short exact sequences (strict at both ends).
- `FilteredSpace.isIso_iff_gr` (*characterisation*) — A morphism is an isomorphism iff it is bijective and strict iff gr of it is an isomorphism.
- `FilteredSpace.isModuleFiltration` (*compatibility*) — fil is an IsModuleFiltration over the trivially filtered ring F in Mathlib's sense.

*Used by.*

- Brinon–Conrad §6.3 — D_dR takes values in Fil_K
- `PadicHodgeTheory:R06.2/filtered-phi-n-modules` — the filtration on D_K
- MordellLawrenceVenkatesh LV.1/filtration-weight — weight of a filtered space t_H(D)/dim D

*Unit tests.* A wrong definition fails one of these.

- `filteredSpace_unit_dual` (degenerate) — F[0]^∨ ≅ F[0] (the 1 − i in the dual filtration).
- `filteredSpace_bijective_not_iso` (non-example) — id: (F^2, jump at 0) → (F^2, jump at 4) is a bijective morphism but not an isomorphism.
- `filteredSpace_gr_dim` (computation) — For D = F^2 with Fil^0 = D, Fil^1 = F·e_1, Fil^2 = 0: dim gr^0 = dim gr^1 = 1.
- `filteredSpace_mathlib_filtration` (compatibility) — fil is antitone and gives Mathlib's IsModuleFiltration for the ring filtration of F concentrated in degrees ≤ 0.

*Construction.*

1. Definitions; exhaustiveness/separatedness of ⊗ and dual are checked with bases adapted to the filtrations; gr is exact on short exact sequences and gr(D ⊗ D') ≅ gr D ⊗ gr D' (B-C §6.2).

*Acceptance.*

- The identity map from D with the trivial filtration (jump at 0) to D with jump at 4 is a bijective morphism that is not an isomorphism (B-C Example 6.2.1).

*Uses.* `mathlib:IsModuleFiltration`, `mathlib:Submodule`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, §6.2, p. 74: “We let FilF denote the category of finite-dimensional filtered vector spaces (D, {Fili (D)}) over F equipped with an exhaustive and separated filtration” The category.
- CMI Summer School notes on p-adic Hodge theory, Definition 6.2.5, p. 75: “A morphism T : D ′ → D in FilF is strict if the canonical map coim T → im T is an isomorphism, which is to say that the quotient and subspace filtrations on T (D ′ ) coincide.” Strictness.

#### Definition. Fontaine's period functors D_HT, D_dR, D_cris, D_st and their comparison maps

*Module* `TauCeti/PadicHodge/PeriodFunctors.lean`. *Node* `PadicHodgeTheory:R06.2/period-functors`.

For a p-adic representation V of G_K (finite-dimensional Q_p-vector space with continuous linear G_K-action) put D_B(V) = (B ⊗_{Q_p} V)^{G_K} for B ∈ {B_HT, B_dR, B_cris, B_st}. Structures: D_HT(V) is a finite-dimensional graded K-vector space (grading from B_HT); D_dR(V) is a finite-dimensional K-vector space with the exhaustive separated filtration Fil^iD_dR(V) = (t^iB_dR^+ ⊗ V)^{G_K}; D_cris(V) is a finite-dimensional K_0-vector space with the σ-semilinear Frobenius φ ⊗ 1 and the filtration on D_cris(V)_K = K ⊗_{K_0} D_cris(V) ⊆ D_dR(V) induced from D_dR(V); D_st(V) is a finite-dimensional K_0-vector space with φ, monodromy N ⊗ 1 and the induced filtration on D_st(V)_K ⊆ D_dR(V) (via Iwasawa's log p = 0). The comparison maps α_V: B ⊗_{B^{G_K}} D_B(V) → B ⊗_{Q_p} V are B-linear, G_K-equivariant and compatible with all structures. Contravariant versions D*_B(V) = Hom_{Q_p[G_K]}(V, B) = D_B(V^∨); inverse functors V_cris(D) = Fil^0(B_cris ⊗_{K_0} D)^{φ=1} and V_st(D) = Fil^0(B_st ⊗_{K_0} D)^{φ=1, N=0}. Hodge–Tate weight convention (pinned): h ∈ Z is a Hodge–Tate weight of V with multiplicity dim_K gr^{−h}D_dR(V) = dim_K (C(−h) ⊗ V)^{G_K}; thus Q_p(1) has Hodge–Tate weight +1 (HT(χ) = +1), which is the negative of Brinon–Conrad's convention (their weights are the degrees of D_HT, and C(q) has B-C weight −q).

*Hypotheses.* V a continuous Q_p-representation of G_K on a finite-dimensional space; K ⊗_{K_0} D_st(V) ⊆ D_dR(V) by R06.1/k-tensor-bst-injective.

*API.*

- `DHT` (*constructor*) — D_HT(V) = (B_HT ⊗ V)^{G_K} as a graded K-vector space.
- `DdR` (*constructor*) — D_dR(V) = (B_dR ⊗ V)^{G_K} with its filtration Fil^iD_dR(V) = (t^iB_dR^+ ⊗ V)^{G_K}.
- `Dcris` (*constructor*) — D_cris(V) = (B_cris ⊗ V)^{G_K} with φ and the filtration on K ⊗_{K_0} D_cris(V).
- `Dst` (*constructor*) — D_st(V) = (B_st ⊗ V)^{G_K} with φ, N and filtration.
- `comparisonMap` (*data*) — α_V: B ⊗_{B^{G_K}} D_B(V) → B ⊗ V.
- `Dcris_eq_Dst_ker_monodromy` (*characterisation*) — D_cris(V) = D_st(V)^{N=0}.
- `Dst_to_DdR` (*coercion*) — K ⊗_{K_0} D_st(V) → D_dR(V) is injective and strict for the filtrations.
- `DB_map` (*functoriality*) — D_B is a functor: D_B(f∘g) = D_B(f)∘D_B(g), D_B(id) = id.
- `DdR_twist` (*relation*) — D_dR(V(n)) = t^{−n}D_dR(V) ⊗ e_n with Fil^i D_dR(V(n)) = Fil^{i+n}D_dR(V) (shift).
- `Vcris` (*constructor*) — V_cris(D) = Fil^0(B_cris ⊗_{K_0} D)^{φ=1} for D ∈ MF^φ_K.
- `Vst` (*constructor*) — V_st(D) = Fil^0(B_st ⊗_{K_0} D)^{φ=1, N=0}.
- `DdR_contravariant` (*equivalence*) — D*_dR(V) := Hom_{Q_p[G_K]}(V, B_dR) ≅ D_dR(V^∨).
- `hodgeTateMultiplicity` (*data*) — m_h(V) = dim_K gr^{−h}D_dR(V) (convention HT(χ) = +1).
- `hodgeTateMultiplicity_eq_BC` (*compatibility*) — m_h(V) equals Brinon–Conrad's multiplicity of the weight −h, i.e. dim_K (C(−h) ⊗ V)^{G_K} = dim D_HT(V)_{−h}.

*Used by.*

- Brinon–Conrad §§2.4, 6, 8, 9 — the functors and their comparison isomorphisms
- MordellLawrenceVenkatesh LV.1, LV.4, LV.6, LV.7 — D_dR with its filtration and D_cris ∈ MF^φ_K of local Galois representations
- CohomologyComparisons CP.2, CP.5 — D_cris(H^i_ét) = H^i_cris[1/p] and D_dR(V) ⊗ B_dR^+ lattices
- FaltingsFinitenessAndIsogenyTheorems R28.2 — Hodge–Tate decomposition of Tate modules
- `PadicHodgeTheory:R06.3 (part D)` — D_pst and the Weil–Deligne parameter
- `PadicHodgeTheory:R06.4 (part D)` — the Hodge–Tate weight convention HT(χ_p) = +1
- `PhiGammaModulesAndIwasawaCohomology:PG.6` — comparison of Wach modules with D_cris
- `PadicHodgeRegulators:L0` — realisations imported with no second carrier

*Unit tests.* A wrong definition fails one of these.

- `DdR_trivial` (degenerate) — D_dR(Q_p) = K with Fil^0 = K and Fil^1 = 0.
- `DdR_tate_twist` (computation) — D_dR(Q_p(1)) = K·t^{−1} ⊗ e_1 with gr^{−1} ≠ 0; hodgeTateMultiplicity 1 (Q_p(1)) = 1.
- `Dcris_trivial_compat_isocrystal` (compatibility) — D_cris(Q_p) with its Frobenius is the unit isocrystal: Mathlib's StandardOneDimIsocrystal of slope 0 over K_0 = K(p, k).
- `DHT_nonHT_character` (non-example) — For p odd, K = Q_p and η = ⟨χ⟩^s with s ∈ Z_p ∖ Z, D_HT(Q_p(η)) = 0.
- `Dcris_ne_DdR_ramified` (non-example) — For K/K_0 ramified and V = Q_p, D_cris(V) = K_0 while D_dR(V) = K (different base fields).

*Construction.*

1. D_B(V) are E-vector spaces (E = B^{G_K}) of dimension ≤ dim V by R06.2/admissibility-dimension-bound and R06.2/period-rings-are-regular.
2. The filtration on D_dR(V) is exhaustive and separated because D_dR(V) is finite-dimensional and Fil^• B_dR is exhaustive and separated.
3. φ on D_cris(V) and D_st(V) is bijective for crystalline/semistable V by R06.2/dcris-dst-filtered-phi-n-modules; for arbitrary V it is an injective σ-semilinear map of a finite-dimensional space.
4. K ⊗_{K_0} D_st(V) = ((K ⊗ B_st) ⊗ V)^{G_K} ⊆ D_dR(V) by exactness of K ⊗_{K_0} − and injectivity of K ⊗ B_st → B_dR.

*Acceptance.*

- D_dR(Q_p(n)) = Kt^{−n} with unique jump at −n; Q_p(n) has Hodge–Tate weight n (R06.2/ddr-of-tate-twists).
- D_cris(Q_p) = K_0 with φ = σ and trivial filtration.

*Uses.* `PadicHodgeTheory:R06.1/de-rham-period-ring`, `PadicHodgeTheory:R06.1/hodge-tate-period-ring`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:R06.1/semistable-period-ring`, `PadicHodgeTheory:R06.1/bst-embedding-into-bdr`, `PadicHodgeTheory:R06.1/k-tensor-bst-injective`, `PadicHodgeTheory:R06.2/admissibility-dimension-bound`, `PadicHodgeTheory:R06.2/period-rings-are-regular`, `PadicHodgeTheory:R06.2/filtered-vector-spaces`, `mathlib:Representation.invariants`, `mathlib:Representation.tprod`, `ArithmeticGaloisRepresentations:R01.1`.

*Planet:* Fontaine's period functors.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, §6.1, definition of D_dR, p. 73: “we define the covariant functor DdR : RepQp (GK ) → VecK valued in the category VecK of finite-dimensional K-vector spaces by” D_dR; D_HT is Definition 2.4.12, D_cris §8 intro, D_st §9.2.
- CMI Summer School notes on p-adic Hodge theory, §6.3, Example 6.3.1 and the discussion of Hodge–Tate weights, p. 76: “Since DdR (Qp (n)) is a line with nontrivial gr−n , we have that Qp (n) has Hodge–Tate weight −n (with multiplicity 1).” B-C's convention, of which ours is the negative (translation recorded).
- An introduction to the theory of p-adic representations, §II.2.3, p. 12: “one sees easily that the jumps of the filtration on DdR (V ) are precisely the opposites of Hodge-Tate weights of V” Berger's convention, which is ours (V_p E has weights 0 and 1).
- Theory of p-adic Galois representations, Definition 6.52, p. 140: “Vst (D) = {v ∈ Bst ⊗ D | ϕv = v, N v = 0, 1 ⊗ v ∈ Fil0 (K ⊗K0 (Bst ⊗ D))}.” The inverse functor V_st.

#### Definition. Hodge–Tate, de Rham, crystalline and semistable representations

*Module* `TauCeti/PadicHodge/PeriodFunctors.lean`. *Node* `PadicHodgeTheory:R06.2/admissible-representations`.

A p-adic representation V of G_K is Hodge–Tate, de Rham, crystalline, or semistable if it is B-admissible for B = B_HT, B_dR, B_cris, B_st respectively, i.e. dim_{B^{G_K}} D_B(V) = dim_{Q_p} V (K, K, K_0, K_0 respectively). The full subcategories Rep^{HT}, Rep^{dR}, Rep^{cris}, Rep^{st} of Rep_{Q_p}(G_K) are stable under subquotients, ⊗, duals, exterior and symmetric powers (R06.2/admissible-category-tannakian). V is potentially semistable (resp. potentially crystalline) if its restriction to G_{K'} is semistable (resp. crystalline) for some finite K'/K.

*Hypotheses.* B-admissibility in the sense of R06.2/admissibility-dimension-bound.

*API.*

- `IsHodgeTate` (*structure*) — dim_K D_HT(V) = dim_{Q_p} V.
- `IsDeRham` (*structure*) — dim_K D_dR(V) = dim_{Q_p} V.
- `IsCrystalline` (*structure*) — dim_{K_0} D_cris(V) = dim_{Q_p} V.
- `IsSemistable` (*structure*) — dim_{K_0} D_st(V) = dim_{Q_p} V.
- `IsPotentiallySemistable` (*structure*) — ∃ K'/K finite with V|_{G_{K'}} semistable.
- `isDeRham_iff_comparison_bijective` (*characterisation*) — V is de Rham iff α_V: B_dR ⊗_K D_dR(V) → B_dR ⊗ V is bijective.
- `IsCrystalline.sub` (*other*) — Subrepresentations and quotients of crystalline representations are crystalline.
- `IsDeRham.tensor` (*other*) — Tensor products, duals, exterior and symmetric powers of de Rham representations are de Rham.

*Used by.*

- MordellLawrenceVenkatesh LV.1, LV.4 — de Rham/crystalline local representations of abelian varieties; subrepresentations of crystalline representations
- `CohomologyComparisons:CP.2` — crystallinity of H^i_ét(X_C, Q_p) by dimension equality
- LocalGaloisDeformationRings L7, R08.3 — potentially semistable deformation conditions
- `PadicHodgeTheory:R06.3 (part D)` — de Rham ⇒ potentially semistable

*Unit tests.* A wrong definition fails one of these.

- `isCrystalline_trivial` (degenerate) — Q_p (trivial representation) is crystalline.
- `isCrystalline_tateTwist` (computation) — Q_p(n) is crystalline for every n ∈ Z, with D_cris(Q_p(n)) = K_0t^{−n}.
- `isDeRham_of_isCrystalline` (compatibility) — IsCrystalline V → IsDeRham V (R06.2/crystalline-semistable-de-rham-implications).
- `not_isHodgeTate_nonalgebraic` (non-example) — For p odd, the character ⟨χ⟩^s of G_{Q_p} with s ∈ Z_p ∖ Z is not Hodge–Tate, hence not de Rham.

*Construction.*

1. Definition; closure properties are R06.2/admissible-category-tannakian applied to the regular rings of R06.2/period-rings-are-regular.

*Acceptance.*

- Q_p(n) is crystalline for all n; unramified characters are crystalline (R06.2/dcris-of-tate-twists-and-unramified).

*Uses.* `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.2/admissible-category-tannakian`, `PadicHodgeTheory:R06.2/period-rings-are-regular`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, §5.2, before Theorem 5.2.1, p. 68: “For the ring BdR and Fontaine's finer period rings Bcris , and Bst the corresponding notions are called being a de Rham, crystalline, and semi-stable representation respectively.” The definitions.
- Theory of p-adic Galois representations, Definition 6.29, p. 131: “A p-adic representation V of GK is called crystalline if it is Bcris - admissible, i.e., the map αcris (V ) is an isomorphism.” Crystalline and semistable in F-O.

#### Definition. The Hodge number t_H of a filtered vector space

*Module* `TauCeti/PadicHodge/PeriodFunctors.lean`. *Node* `PadicHodgeTheory:R06.2/hodge-number-tH`.

For D ∈ Fil_F put t_H(D) = Σ_{i∈Z} i·dim_F gr^iD (the right endpoint height of the Hodge polygon). Properties: t_H(D) = t_H(det D) with det D the top exterior power with the quotient filtration from D^{⊗d}; t_H(D^∨) = −t_H(D); t_H(D ⊗ D') = (dim D)t_H(D') + (dim D')t_H(D); t_H is additive on short exact sequences in Fil_F; t_H(D[n]) = t_H(D) − n·dim D (where Fil^i(D[n]) = Fil^{i+n}D); if h: D' → D is a bijective morphism then t_H(D') ≤ t_H(D), with equality iff h is an isomorphism in Fil_F.

*Hypotheses.* D ∈ Fil_F (R06.2/filtered-vector-spaces).

*API.*

- `hodgeNumber` (*constructor*) — t_H(D) = Σ_i i·dim gr^iD ∈ Z.
- `hodgeNumber_det` (*simp*) — t_H(det D) = t_H(D).
- `hodgeNumber_dual` (*simp*) — t_H(D^∨) = −t_H(D).
- `hodgeNumber_tensor` (*simp*) — t_H(D ⊗ D') = dim D·t_H(D') + dim D'·t_H(D).
- `hodgeNumber_shortExact` (*relation*) — t_H(D) = t_H(D') + t_H(D'') for a short exact sequence in Fil_F.
- `hodgeNumber_shift` (*simp*) — t_H(D[n]) = t_H(D) − n·dim D.
- `hodgeNumber_le_of_bijective` (*relation*) — A bijective morphism D' → D has t_H(D') ≤ t_H(D), with equality iff it is an isomorphism.
- `hodgeWeight` (*other*) — weight(D) = t_H(D)/dim D ∈ Q for D ≠ 0 (MordellLawrenceVenkatesh's filtration weight).

*Used by.*

- Brinon–Conrad Definition 8.2.1 — weak admissibility compares t_H with t_N
- MordellLawrenceVenkatesh LV.1/filtration-weight and LV.1/hodge-weight-pure-representation — t_H(det D) = t_H(D) and additivity
- Brinon–Conrad Theorem 8.2.11 — strictness of morphisms of weakly admissible objects via the bijective-morphism inequality

*Unit tests.* A wrong definition fails one of these.

- `hodgeNumber_unit` (degenerate) — t_H(F[0]) = 0.
- `hodgeNumber_elliptic` (computation) — For D = F^2 with Fil^0 = D, Fil^1 = F e_1, Fil^2 = 0: t_H(D) = 1.
- `hodgeNumber_tateTwist` (compatibility) — t_H(D_dR(Q_p(n))) = −n.
- `hodgeNumber_not_monotone_subobject` (non-example) — t_H is not monotone for subobjects: for D = F e_1 ⊕ F e_2 with Fil^1 = F e_1 (jumps 0, 1), the subobject F e_1 has t_H = 1 = t_H(D) and F e_2 has t_H = 0.

*Construction.*

1. Choose a basis adapted to the filtration: t_H(D) = Σ i_j over the jumps with multiplicity; the determinant has the single jump Σ i_j (B-C text before Proposition 8.1.2; F-O Definition 6.44, Proposition 6.45).
2. Dual, tensor and short exact sequences reduce to the 1-dimensional case through the canonical isomorphisms det(D^∨) ≅ (det D)^∨, det(D)^{d'} ⊗ det(D')^{d} ≅ det(D ⊗ D'), det D' ⊗ det D'' ≅ det D in Fil_F (B-C Proposition 8.1.2).
3. Bijective morphisms: pass to det h: det D' → det D, a nonzero map of lines, which forces jump(det D') ≤ jump(det D), with equality iff det h is an isomorphism iff h is (B-C proof of Proposition 8.2.10).

*Acceptance.*

- MordellLawrenceVenkatesh LV.1/filtration-weight: for Fil^0 = D and jumps ≥ 0, t_H(D)/dim D = Σ_{j≥0} j dim gr^j D/dim D; for D = H^1_dR of an elliptic curve (jumps 0, 1) t_H = 1.

*Uses.* `PadicHodgeTheory:R06.2/filtered-vector-spaces`, `mathlib:finsum`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Definition 8.1.1 and Proposition 8.1.2, pp. 102–103: “Moreover, tH is additive on short exact sequences in FilF in the sense that if 0 → D ′ → D → D ′′ → 0 is a short exact sequence in FilF then” Additivity; the proposition also gives the dual and tensor formulas.
- Theory of p-adic Galois representations, Definition 6.44 and Proposition 6.45, p. 137: “Proposition 6.45. One has” t_H via adapted bases, t_H = Σ i dim gr^i.

#### Definition. Filtered (φ, N)-modules MF^{φ,N}_K and filtered φ-modules MF^φ_K

*Module* `TauCeti/PadicHodge/FilteredPhiNModules.lean`. *Node* `PadicHodgeTheory:R06.2/filtered-phi-n-modules`.

Let K/Q_p be finite with residue field k, K_0 = W(k)[1/p] (Mathlib's K(p, k) = FractionRing (WittVector p k)) with Frobenius σ. A (φ, N)-module is an isocrystal (D, φ) over K_0 — a finite-dimensional K_0-space with a bijective σ-semilinear φ (Mathlib WittVector.Isocrystal) — with a K_0-linear N: D → D such that Nφ = pφN. A filtered (φ, N)-module over K is a (φ, N)-module D together with an exhaustive separated decreasing filtration on D_K = K ⊗_{K_0} D (an object of Fil_K). Morphisms are K_0-linear maps commuting with φ and N whose K-linear extension preserves the filtrations; MF^{φ,N}_K is the category, and MF^φ_K ⊆ MF^{φ,N}_K is the full subcategory with N = 0 (filtered φ-modules). Constructions: subobjects are φ- and N-stable K_0-subspaces D' with the subspace filtration on D'_K; quotients carry the quotient filtration; D ⊗ D' with φ ⊗ φ, N ⊗ 1 + 1 ⊗ N and the tensor filtration; D^∨ with φ_{D^∨}(ℓ) = σ ∘ ℓ ∘ φ^{-1}, N_{D^∨} = −N^t and the dual filtration; the unit K_0[0]; the Tate twist, covariant normalisation: D⟨i⟩ has the same D and N, φ_{D⟨i⟩} = p^{−i}φ_D and Fil^r(D⟨i⟩_K) = Fil^{r+i}(D_K), so that D_st(V(i)) ≅ D_st(V)⟨i⟩ (Brinon–Conrad's Definition 8.3.1 is the contravariant normalisation, with i replaced by −i). For K = K_0 unramified, MF^φ_K consists of triples (D, φ, Fil^•) with Fil on D itself; an isomorphism in MF^φ_K is a φ-equivariant K-linear bijection carrying Fil^i onto Fil^i for all i.

*Hypotheses.* K/Q_p finite; D finite-dimensional over K_0; φ bijective (injectivity suffices, B-C Exercise 7.4.10).

*API.*

- `FilteredPhiNModule` (*structure*) — An isocrystal D over K(p, k) (Mathlib WittVector.Isocrystal) with N: D →ₗ D, N ∘ φ = p·φ ∘ N, and a FilteredSpace structure on K ⊗_{K_0} D.
- `FilteredPhiModule` (*structure*) — The full subcategory N = 0.
- `FilteredPhiNModule.Hom` (*structure*) — Morphisms: K_0-linear, commuting with φ and N, filtered after ⊗K.
- `FilteredPhiNModule.sub` (*constructor*) — Subobject from a φ, N-stable K_0-subspace, with the subspace filtration.
- `FilteredPhiNModule.quot` (*constructor*) — Quotient object with the quotient filtration.
- `FilteredPhiNModule.tensor` (*constructor*) — D ⊗ D' with φ ⊗ φ, N ⊗ 1 + 1 ⊗ N, tensor filtration.
- `FilteredPhiNModule.dual` (*constructor*) — D^∨ with φ(ℓ) = σ∘ℓ∘φ^{-1}, N = −N^t, dual filtration.
- `FilteredPhiNModule.twist` (*constructor*) — D⟨i⟩: φ ↦ p^{−i}φ, Fil^r ↦ Fil^{r+i} (covariant normalisation).
- `FilteredPhiNModule.unit` (*constructor*) — K_0[0].
- `FilteredPhiNModule.toIsocrystal` (*projection*) — The underlying Mathlib isocrystal; Hom maps to IsocrystalHom.
- `FilteredPhiNModule.det` (*constructor*) — det D = top exterior power with induced φ, N (= 0) and filtration.
- `FilteredPhiNModule.isIso_iff` (*characterisation*) — A morphism is an isomorphism iff it is bijective and strict for the filtrations.

*Used by.*

- Brinon–Conrad §8 — target category of D_cris and D_st; weak admissibility
- MordellLawrenceVenkatesh LV.4/fibre-representation-crystalline, LV.4/fibre-filtered-phi-transport, LV.4/filtered-phi-orbit — MF^φ_K for unramified K and isomorphisms carrying filtrations onto filtrations
- `PadicHodgeTheory:R06.3 (part D)` — (φ, N, G_{L/K})-modules and the Weil–Deligne parameter
- FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3–R07.4 — Fontaine–Laffaille and Breuil–Kisin modules map to MF^φ_K after inverting p
- `PhiGammaModulesAndIwasawaCohomology:PG.6` — Wach modules recover D_cris ∈ MF^φ_K

*Unit tests.* A wrong definition fails one of these.

- `filteredPhiNModule_unit_tH_tN` (degenerate) — For the unit K_0[0]: t_H = t_N = 0.
- `filteredPhiNModule_isocrystal_compat` (compatibility) — The underlying isocrystal of K_0[0]⟨n⟩ is Mathlib's StandardOneDimIsocrystal p k (−n) (φ = p^{−n}σ) and t_N = −n.
- `filteredPhiNModule_tensor_monodromy` (computation) — For D with basis e_0, e_1, φe_0 = e_0, φe_1 = pe_1, Ne_1 = e_0, N ⊗ 1 + 1 ⊗ N on D ⊗ D satisfies Nφ = pφN.
- `filteredPhiNModule_not_abelian` (non-example) — The identity of K_0 e with Fil jump 0 → K_0 e with Fil jump 1 is a bijective morphism which is not an isomorphism.
- `filteredPhiNModule_twist_sign` (characterisation) — D_cris(Q_p(1)) ≅ K_0[0]⟨1⟩ in the covariant normalisation (φ = p^{−1}σ, jump at −1).

*Construction.*

1. Definitions; Nφ = pφN on tensor products and duals is checked directly (B-C Definition 8.2.5 and the formulas following it).
2. MF^{φ,N}_K is additive, with kernels, cokernels, images and coimages, but not abelian (a bijective morphism need not be an isomorphism), as for Fil_K.

*Acceptance.*

- K_0[0] ⊗ D ≅ D; D^∨∨ ≅ D; (D⟨i⟩)⟨j⟩ = D⟨i + j⟩.
- MordellLawrenceVenkatesh LV.4/filtered-phi-orbit: for L unramified, (W, φ, F) ≅ (W, φ, F') in MF^φ_L iff F' = gF for g in the centraliser Z(φ)^×.

*Uses.* `mathlib:WittVector.Isocrystal`, `mathlib:WittVector.IsocrystalHom`, `PadicHodgeTheory:R06.2/filtered-vector-spaces`, `mathlib:Module.Finite`.

*Planet:* Filtered (φ,N)-modules.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Definition 8.2.5, p. 112: “A filtered (φ, N)-module (over K) is a (φ, N)-module D over K0 for which DK is endowed with a structure of object in FilK .” The definition; Definition 7.3.4 is the case N = 0.
- CMI Summer School notes on p-adic Hodge theory, §8.2, formulas after Remark 8.2.5, p. 113: “ND⊗D′ = 1D ⊗ ND′ + ND ⊗ 1D′ , ND∨ = −ND∨ .” Monodromy on tensor products and duals.
- Theory of p-adic Galois representations, Definition 6.36, p. 134: “A filtered (ϕ, N )-module over K consists of a (ϕ, N )-” F-O's definition.

#### Definition. The Newton number t_N of an isocrystal

*Module* `TauCeti/PadicHodge/FilteredPhiNModules.lean`. *Node* `PadicHodgeTheory:R06.2/newton-number-tN`.

For an isocrystal (D, φ) over K_0 of dimension h, t_N(D) := v_p(det A) where A is the matrix of φ in any K_0-basis; this is well defined because a change of basis replaces A by σ(P)AP^{-1} and v_p(σ(det P)/det P) = 0. Equivalently t_N(D) = t_N(∧^hD) (the slope of the rank-one isocrystal det D) and t_N(D) = Σ_α α·dim D(α) over the slope decomposition. Properties: additive on short exact sequences of isocrystals; t_N(D ⊗ D') = (dim D')t_N(D) + (dim D)t_N(D'); t_N(D^∨) = −t_N(D); t_N(D⟨i⟩) = t_N(D) − i·dim D. Slopes of D in general are not the valuations of the eigenvalues of A (Katz's example), but t_N is.

*Hypotheses.* φ bijective (so det A ≠ 0).

*API.*

- `newtonNumber` (*constructor*) — t_N(D) = v_p(det(matrix of φ)) ∈ Z.
- `newtonNumber_eq_det` (*characterisation*) — t_N(D) = t_N(det D).
- `newtonNumber_basis_indep` (*other*) — t_N does not depend on the chosen basis.
- `newtonNumber_shortExact` (*relation*) — Additive on short exact sequences of isocrystals.
- `newtonNumber_tensor` (*simp*) — t_N(D ⊗ D') = dim D'·t_N(D) + dim D·t_N(D').
- `newtonNumber_dual` (*simp*) — t_N(D^∨) = −t_N(D).
- `newtonNumber_twist` (*simp*) — t_N(D⟨i⟩) = t_N(D) − i·dim D.
- `newtonNumber_eq_sum_slopes` (*compatibility*) — t_N(D) = Σ_α α·dim D(α) (slope decomposition).

*Used by.*

- Brinon–Conrad Definition 8.2.1 — weak admissibility
- MordellLawrenceVenkatesh LV.6/legendre-generic-simplicity, LV.7/generic-simplicity-sublemma — t_N(D) = v_p(det φ) and weak admissibility force slopes

*Unit tests.* A wrong definition fails one of these.

- `newtonNumber_unit` (degenerate) — t_N(K_0[0]) = 0.
- `newtonNumber_standard` (compatibility) — For Mathlib's StandardOneDimIsocrystal p k m (φ = p^m σ), t_N = m.
- `newtonNumber_katz` (computation) — For Katz's isocrystal over W(F_9)[1/3] with the matrix [[2, 4i], [4i, −2]], t_N = v_3(12) = 1.
- `newtonNumber_not_eigenvalue_valuation` (non-example) — The same matrix has eigenvalues ±2i√3 of valuation 1/2 each, while the slopes are 0 and 1: slopes are not eigenvalue valuations in a non-canonical basis.

*Construction.*

1. Well-definedness: A' = σ(P)AP^{-1} ⇒ det A' = σ(det P)det A/det P, and v_p ∘ σ = v_p (F-O Definition 6.40, Proposition 6.41).
2. Additivity, tensor and dual: block-triangular, Kronecker-product and σ(A^{-1}) matrices (F-O Proposition 6.42).
3. Comparison with slopes: after base change to K̂_0^{ur}, decompose by R06.2/slope-decomposition; on a simple object of slope s/r, det has valuation s (B-C Proposition 8.1.9).

*Acceptance.*

- Katz's example (B-C Example 8.1.3), K_0 = W(F_9)[1/3], matrix [[p − 1, (p + 1)i], [(p + 1)i, −(p − 1)]] with p = 3: det = 4p = 12, v_3 = 1 = t_N, slopes {0, 1}; PARI: charpoly X^2 + 12 (roots of valuation 1/2), confirming that eigenvalue valuations are basis-dependent while v_p(det) is not.
- MordellLawrenceVenkatesh request: for D = D_cris(V) with F unramified, t_N(D) = v_p(det φ) in any F-basis — this is the definition.

*Uses.* `PadicHodgeTheory:R06.2/filtered-phi-n-modules`, `mathlib:WittVector.Isocrystal`, `mathlib:Matrix.det`.

*Sources.*

- Theory of p-adic Galois representations, Definition 6.40 and Proposition 6.41, pp. 135–136: “Moreover ϕ is injective if and only if det A 6= 0, and” t_N = v_p(det A) (the display (6.13) follows).
- CMI Summer School notes on p-adic Hodge theory, Example 8.1.3 (Katz), p. 104: “trix transforms in a semilinear-conjugation manner under a change of basis, so its set of eigenvalues {λi } is not basis-independent in general” Motivation: eigenvalue valuations are not invariants, the determinant is.

#### Definition. Weakly admissible filtered (φ, N)-modules

*Module* `TauCeti/PadicHodge/FilteredPhiNModules.lean`. *Node* `PadicHodgeTheory:R06.2/weak-admissibility`.

D ∈ MF^{φ,N}_K is weakly admissible if t_H(D) = t_N(D) and t_H(D') ≤ t_N(D') for every subobject D' ⊆ D in MF^{φ,N}_K (φ- and N-stable K_0-subspace with the induced filtration on D'_K). Equivalently t_H(D) = t_N(D) and t_H(D'') ≥ t_N(D'') for every quotient D''. MF^{φ,N,wa}_K denotes the full subcategory; MF^{φ,wa}_K = weakly admissible objects with N = 0. Here t_H(D) := t_H(D_K). Equivalent polygon form: for all subobjects D', the Newton polygon of D' lies on or above its Hodge polygon (Fontaine's lemma). Weak admissibility is preserved by duality, Tate twists and scalar extension K_0 → K̂_0^{ur}, and depends on N only through the class of N-stable subobjects.

*Hypotheses.* t_H from R06.2/hodge-number-tH, t_N from R06.2/newton-number-tN.

*API.*

- `IsWeaklyAdmissible` (*structure*) — t_H(D) = t_N(D) ∧ ∀ subobjects D', t_H(D') ≤ t_N(D').
- `isWeaklyAdmissible_iff_quotients` (*characterisation*) — Equivalent form with quotients D'': t_H(D'') ≥ t_N(D'').
- `isWeaklyAdmissible_iff_polygons` (*characterisation*) — Equivalent form: P_N(D') lies on or above P_H(D') for all subobjects, with equal endpoints for D.
- `IsWeaklyAdmissible.dual` (*other*) — D weakly admissible iff D^∨ is.
- `IsWeaklyAdmissible.twist` (*other*) — D weakly admissible iff D⟨i⟩ is.
- `IsWeaklyAdmissible.baseChange_ur` (*compatibility*) — Invariant under K_0 → K̂_0^{ur} (and K → K̂^{ur}).
- `MFwa` (*data*) — The full subcategory MF^{φ,N,wa}_K.

*Used by.*

- Brinon–Conrad Theorem 9.3.4 — D_st(V) is weakly admissible for semistable V
- Colmez–Fontaine theorem (R06.2/colmez-fontaine-theorem) — the essential image of D_st
- MordellLawrenceVenkatesh LV.6, LV.7 — weak admissibility of D_cris(V) forces the slopes of φ on φ-stable lines in F^1
- LocalGaloisDeformationRings L7, R08.3 — potentially semistable deformation rings are defined through weakly admissible modules with descent data

*Unit tests.* A wrong definition fails one of these.

- `isWeaklyAdmissible_unit` (degenerate) — K_0[0] is weakly admissible.
- `isWeaklyAdmissible_rank_one` (characterisation) — A rank-one D with φe = λe and jump r is weakly admissible iff v_p(λ) = r.
- `not_isWeaklyAdmissible_berger` (non-example) — Berger's D (φe = e, φf = pf, Fil^1 = Q_p e) is not weakly admissible.
- `isWeaklyAdmissible_berger_generic` (computation) — Berger's D with Fil^1 = Q_p(e + f) is weakly admissible.
- `isWeaklyAdmissible_depends_on_N` (non-example) — The (e_0, e_1) example with jumps −1, 2 and Fil^0 = Q_p e_1 is weakly admissible with Ne_1 = e_0 and not weakly admissible with N = 0.
- `isWeaklyAdmissible_Dcris_tate` (compatibility) — D_cris(Q_p(n)) = K_0[0]⟨n⟩ is weakly admissible (t_H = t_N = −n).

*Construction.*

1. Quotient form: t_H and t_N are additive on 0 → D' → D → D/D' → 0 (B-C Proposition 8.2.2).
2. Dual: t_H and t_N change sign and subobjects of D^∨ are duals of quotients of D; Tate twist: D' ↦ D'⟨i⟩ is a bijection of subobjects and both t_H, t_N shift by −i·dim.
3. Polygon form and scalar extension: Fontaine's Lemma 8.1.13 in B-C, using the slope decomposition (R06.2/slope-decomposition) and that N maps D(α) to D(α − 1), so the sums of low-slope parts are subobjects.

*Acceptance.*

- Rank one: K_0e with φe = λe and jump r is weakly admissible iff v_p(λ) = r (R06.2/rank-one-filtered-modules).
- Non-example (Berger 2008, Exemple IV.2.8(2)): D = Q_p e ⊕ Q_p f, φe = e, φf = pf, N = 0, Fil^0 = D, Fil^1 = Q_p e, Fil^2 = 0 over K = Q_p: t_H(D) = t_N(D) = 1 but the subobject Q_p e has t_H = 1 > 0 = t_N, so D is not weakly admissible; with Fil^1 = Q_p(e + f) it is weakly admissible (Exemple IV.2.8(1)).
- N matters: D = Q_p e_0 ⊕ Q_p e_1, φe_0 = e_0, φe_1 = pe_1, Ne_1 = e_0, Fil^{−1} = D, Fil^0 = Fil^1 = Fil^2 = Q_p e_1, Fil^3 = 0 (jumps −1, 2): t_H = 1 = t_N; the only proper subobject Q_p e_0 has t_H = −1 ≤ 0, so D is weakly admissible, while the same data with N = 0 has the extra subobject Q_p e_1 with t_H = 2 > 1 = t_N (checked by hand and by the script in checks.out).

*Uses.* `PadicHodgeTheory:R06.2/filtered-phi-n-modules`, `PadicHodgeTheory:R06.2/hodge-number-tH`, `PadicHodgeTheory:R06.2/newton-number-tN`, `PadicHodgeTheory:R06.2/slope-decomposition`.

*Planet:* Weak admissibility.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Definition 8.2.9, p. 114: “(so D ′ is required to be N-stable in D) we have tN (D ′ ) ⩾ tH (D ′ ) with equality for D ′ = D.” The definition.
- Theory of p-adic Galois representations, Definition 6.48, p. 138: “A filtered (ϕ, N )-module D over K is called admissible if” F-O call the same notion 'admissible' (their Remark 6.55 records the change of terminology).
- Équations différentielles p-adiques et (φ,N)-modules filtrés, Exemple IV.2.8(2), pp. 19–20: “Ce D n'est pas admissible.” The non-weakly-admissible example (Berger's 'admissible' = weakly admissible).

#### Definition. Filtered (φ, N, Gal(L/K))-modules (filtered (φ, N)-modules with descent data)

*Module* `TauCeti/PadicHodge/FilteredPhiNModules.lean`. *Node* `PadicHodgeTheory:R06.2/filtered-phi-n-modules-with-descent-data`.

Let L/K be a finite Galois extension inside K̄ with maximal unramified subfield L_0. A filtered (φ, N, Gal(L/K))-module is a finite-dimensional L_0-vector space D with a bijective σ-semilinear φ, an L_0-linear N with Nφ = pφN, and a semilinear action of Gal(L/K) (semilinear for the action of Gal(L/K) on L_0 through Gal(L_0/K_0)) commuting with φ and N, together with an exhaustive separated decreasing filtration of D_L = L ⊗_{L_0} D by Gal(L/K)-stable L-subspaces (equivalently, a filtration of D_K := (D_L)^{Gal(L/K)} with Fil^iD_L = L ⊗_K Fil^iD_K). Morphisms respect all structures. t_H(D) := t_H(D_K) = t_H(D_L), t_N(D) as an isocrystal over L_0; weak admissibility: t_H(D) = t_N(D) and t_H(D') ≤ t_N(D') for all subobjects (φ, N, Gal(L/K)-stable). Passing to the colimit over L gives filtered (φ, N, G_K)-modules. For a representation V of G_K that is semistable on G_L, D_{st,L}(V) = (B_st ⊗ V)^{G_L} is such an object, with K ⊗ … : (L ⊗_{L_0} D_{st,L}(V))^{Gal(L/K)} = D_dR(V).

*Hypotheses.* L/K finite Galois; the same L_0 is used for B_st^{G_L} = L_0.

*API.*

- `FilteredPhiNGaloisModule` (*structure*) — L_0-space with φ, N, semilinear Gal(L/K)-action commuting with φ, N, and a Gal(L/K)-stable filtration on D_L.
- `FilteredPhiNGaloisModule.filK` (*projection*) — The filtration on D_K = (D_L)^{Gal(L/K)}, with Fil^iD_L = L ⊗_K Fil^iD_K.
- `FilteredPhiNGaloisModule.IsWeaklyAdmissible` (*structure*) — Weak admissibility with Gal(L/K)-stable subobjects.
- `FilteredPhiNGaloisModule.ofFilteredPhiN` (*coercion*) — L = K recovers MF^{φ,N}_K.
- `FilteredPhiNGaloisModule.restrict` (*functoriality*) — For K ⊆ K' ⊆ L, restriction to Gal(L/K').
- `DstL` (*constructor*) — D_{st,L}(V) = (B_st ⊗ V)^{G_L} with its Gal(L/K)-action.
- `DstL_dR` (*compatibility*) — (L ⊗_{L_0} D_{st,L}(V))^{Gal(L/K)} ≅ D_dR(V) as filtered K-spaces when V|_{G_L} is semistable.

*Used by.*

- Berger 2008, Théorème A and V.2.1 — the category on which D ↦ M(D) is an equivalence and the Colmez–Fontaine theorem with descent data
- `PadicHodgeTheory:R06.3 (part D)` — D_pst of potentially semistable representations and the Weil–Deligne parameter
- LocalGaloisDeformationRings R08.3 — potentially semistable deformation rings of fixed inertial type

*Unit tests.* A wrong definition fails one of these.

- `descentData_trivial_group` (degenerate) — For L = K the category is MF^{φ,N}_K.
- `descentData_tH_eq` (computation) — t_H(D_K) = t_H(D_L) (Galois descent of the filtration).
- `descentData_DstL_compat` (compatibility) — For V semistable on G_K and L/K Galois, D_{st,L}(V) = L_0 ⊗_{K_0} D_st(V) with Gal(L/K) acting on L_0.
- `descentData_not_forgetful_equivalence` (non-example) — The forgetful functor to MF^{φ,N}_L is not full: the quadratic character of Gal(L/K), L/K ramified quadratic, gives an object whose underlying object is the unit but which is not isomorphic to the unit with trivial action.

*Construction.*

1. Definitions (Berger 2008 §I.1, F-O Definition 6.61). The filtration descends by Galois descent (R06.1/semilinear-galois-descent) since Gal(L/K) acts semilinearly on each Fil^iD_L.
2. For D_{st,L}(V): Gal(L/K) = G_K/G_L acts on (B_st ⊗ V)^{G_L}, semilinearly over B_st^{G_L} = L_0, commuting with φ and N; the identification with D_dR(V) is R06.2/crystalline-semistable-de-rham-implications over L followed by Galois descent (F-O Comments about Theorem B (1)).

*Acceptance.*

- For L = K, a filtered (φ, N, {1})-module is a filtered (φ, N)-module.
- For V a character of G_K trivial on G_L, D_{st,L}(V) = L_0 ⊗ V with Gal(L/K) acting diagonally and trivial φ-slope.

*Uses.* `PadicHodgeTheory:R06.2/filtered-phi-n-modules`, `PadicHodgeTheory:R06.2/weak-admissibility`, `PadicHodgeTheory:R06.1/semilinear-galois-descent`, `PadicHodgeTheory:R06.1/crystalline-semistable-invariants`.

*Sources.*

- Theory of p-adic Galois representations, Definition 6.61, p. 143: “A filtered (ϕ, N, Gal(K 0 /K))-module over K is a finite di-” The definition (K' there = L here).
- Équations différentielles p-adiques et (φ,N)-modules filtrés, §I.1, p. 5: “Un (ϕ, N, GL/K )-module filtré est la donnée d'un (ϕ, N, GL/K )-module D et d'une filtration décroissante exhaustive et separée Fili DL sur DL = L⊗L0 D” Berger's definition with the equivalent filtration on D_K.

#### Definition. The Colmez–Fontaine statement: weakly admissible ⇒ admissible (the proposition, proved in R06.3)

*Module* `TauCeti/PadicHodge/PeriodFunctors.lean`. *Node* `PadicHodgeTheory:R06.2/colmez-fontaine-theorem`.

For K/Q_p finite, ColmezFontaine(K) is the proposition: every weakly admissible D ∈ MF^{φ,N}_K is admissible, i.e. D ≅ D_st(V_st(D)); equivalently D_st: Rep^{st}_{Q_p}(G_K) → MF^{φ,N,wa}_K is an equivalence of categories with quasi-inverse V_st (and then D_cris: Rep^{cris} → MF^{φ,wa}_K is an equivalence with quasi-inverse V_cris). The descent-data form ColmezFontainePst(K): for every finite Galois L/K, every weakly admissible filtered (φ, N, Gal(L/K))-module is D_{st,L}(V) for a representation V of G_K semistable on G_L. This node defines these propositions and records their equivalent forms; it does not assert them. Placement: the proof is not available from R06.1–R06.2 material alone. Berger's proof (Berger 2008, Théorème V.2.1) needs the (φ, Γ)-module M(D) over the Robba ring B†_rig,K (PadicHodgeTheory:P7:annulus-foundations), Kedlaya's slope filtration (PadicDifferentialEquationsAndRigidCohomology:RD.1), the p-adic local monodromy theorem for differential equations (RD.2) through Berger's Corollaire III.2.5, the Cherbonnier–Colmez–Fontaine equivalence (PhiGammaModulesAndIwasawaCohomology:PG.1–PG.2), and the identification D_st(V) = (B†_rig,L[ℓ_X, 1/t] ⊗ D†_rig(V))^{Γ_L} of Berger 2002 (Théorème 3.6), which lives in PadicHodgeTheory:P7 / R06.3; so the theorem is proved in R06.3 (restructure entry), where every input is available, and consumers needing it import it from there.

*Hypotheses.* K/Q_p finite; weak admissibility as in R06.2/weak-admissibility.

*API.*

- `ColmezFontaine` (*structure*) — The proposition ∀ D ∈ MF^{φ,N}_K, IsWeaklyAdmissible D → IsAdmissible D.
- `ColmezFontainePst` (*structure*) — The descent-data proposition for every finite Galois L/K.
- `colmezFontaine_iff_dim` (*characterisation*) — ColmezFontaine K ↔ ∀ D weakly admissible, dim V_st(D) = dim D.
- `colmezFontaine_iff_simple` (*characterisation*) — ColmezFontaine K ↔ ∀ D simple weakly admissible, V_st(D) ≠ 0.
- `colmezFontaine_iff_essSurj` (*equivalence*) — ColmezFontaine K ↔ D_st: Rep^{st} → MF^{φ,N,wa}_K is essentially surjective.
- `colmezFontaine_rank_one` (*example*) — The statement holds for weakly admissible D of rank one.

*Used by.*

- `PadicHodgeTheory:R06.3 (part D)` — proves ColmezFontaine and ColmezFontainePst from Berger 2008
- LocalGaloisDeformationRings L7, R08.3 — potentially semistable deformation rings: characteristic-zero points are weakly admissible modules
- `PotentialModularityAndCompatibleSystems:R24.5:operations` — existence of representations with prescribed D_pst
- FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4 — Kisin's alternative proof via Breuil–Kisin modules (B-C §11.3)

*Unit tests.* A wrong definition fails one of these.

- `colmezFontaine_rank_one_holds` (computation) — For every K, every weakly admissible D of dimension 1 is admissible.
- `colmezFontaine_trivial_filtration` (degenerate) — Every weakly admissible D with trivial filtration (single jump 0) is admissible (unit-root, unramified representations).
- `colmezFontaine_iff_essSurj_test` (compatibility) — ColmezFontaine K ↔ (∀ D, IsWeaklyAdmissible D → ∃ V semistable, Nonempty (D_st V ≅ D)).
- `colmezFontaine_not_for_all_filtered` (non-example) — The statement fails without weak admissibility: Berger's D with Fil^1 = Q_p e is not admissible (admissible objects are weakly admissible).

*Construction.*

1. Definition of the propositions.
2. Equivalent forms (proved here): by R06.2/colmez-fontaine-bigness-criterion, ColmezFontaine(K) ⇔ dim_{Q_p}V_st(D) = dim_{K_0}D for all weakly admissible D ⇔ V_st(D) ≠ 0 for every simple weakly admissible D; by R06.2/dst-exact-tensor-fully-faithful it is equivalent to essential surjectivity of D_st onto MF^{φ,N,wa}_K.

*Acceptance.*

- ColmezFontaine holds for rank-one objects (R06.2/potentially-unramified-and-characters (3)) and for objects with trivial filtration (they are unit-root, R06.2/dcris-of-tate-twists-and-unramified (2)).
- The proof in R06.3 (part D) must produce, for D = Berger's weakly admissible example D = Q_p e ⊕ Q_p f, φe = e, φf = pf, Fil^1 = Q_p(e + f), a 2-dimensional crystalline representation with Hodge–Tate weights 0, 1 (a non-split extension of Q_p by Q_p(1), B-C Theorem 8.3.6).

*Uses.* `PadicHodgeTheory:R06.2/colmez-fontaine-bigness-criterion`, `PadicHodgeTheory:R06.2/weak-admissibility`, `PadicHodgeTheory:R06.2/filtered-phi-n-modules-with-descent-data`, `PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful`.

*Planet:* Colmez–Fontaine theorem.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, §9.3, before Proposition 9.3.6, p. 148: “That is, every weakly admissible filtered (φ, N)-module D over K is isomorphic as such to” The statement.
- Theory of p-adic Galois representations, §6.5.1, Theorem A and Proposition A2, pp. 140–141: “For any object D of MFadK (ϕ, N ), there exists an object V of Repst Qp (G K ) such that Dst (V ) ≃ D.” Proposition A2 = weakly admissible ⇒ admissible.
- Équations différentielles p-adiques et (φ,N)-modules filtrés, Théorème V.2.1 and Remarque V.2.2, pp. 21–22: “Si D est un (ϕ, N, GL/K )-module filtré admissible, alors il existe une représentation p-adique V de GK qui devient semi-stable quand on la restreint à GL et telle que D = Dst,L (V ).” Berger's proof of the descent-data form; its inputs determine the placement.

#### Definition. Hodge–Tate weights with HT(χ_p) = +1, Hodge type, and the dictionary with the sources' conventions

*Module* `TauCeti/PadicHodge/SmallWeight/HodgeTateWeights.lean`. *Node* `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`.

Let K/Q_p be finite, C = C_K, χ = χ_p the p-adic cyclotomic character (Mathlib cyclotomicCharacter) and E/Q_p finite. For a Hodge–Tate E-linear representation V of G_K, h ∈ Z is a Hodge–Tate weight of V with multiplicity m_h := dim_K (C(−h) ⊗_{Q_p} V)^{G_K} > 0, i.e. C(h) occurs in C ⊗ V ≅ ⊕_h C(h)^{m_h}; so Q_p(1) (χ) has weight +1. For V de Rham, m_h = dim_K gr^{−h} D_dR(V), i.e. the weights are the negatives of the filtration jumps of D_dR(V); they are the eigenvalues of Sen's operator Θ_V. The Hodge type of V is the family (HT_τ(V))_{τ: K→Ē} of multisets with HT_τ(V) ∋ h with multiplicity dim_Ē gr^{−h}(D_dR(V) ⊗_{K⊗E, τ⊗1} Ē). Dictionary: Berger (2002, survey) uses the same convention ('V positive' = weights ≤ 0); Brinon–Conrad's covariant convention is the opposite (Q_p(n) has weight −n) and their contravariant D*_dR convention agrees with ours; Fontaine–Laffaille's contravariant U_S sends a filtration jump i to Hodge–Tate weight +i and the covariant V_cris sends it to −i (PadicHodgeTheory:R06.4/fontaine-laffaille-sign-dictionary); Khare–Wintenberger's 'weight k' means Hodge–Tate weights {k−1, 0}.

*Hypotheses.* Weights are integers only for Hodge–Tate V; for general V, Sen's eigenvalues are the generalised Hodge–Tate weights. The convention is the roadmap-wide HT(χ_p) = +1; every source with the opposite convention is translated, never silently re-covarianted.

*API.*

- `filtrationMultiplicity` (*data*) — For a decreasing filtration F on a finite-dimensional K-vector space and h in Z, the multiplicity dim_K gr^{-h}(F); applied to D_dR(V) it is the Hodge-Tate multiplicity m_h(V) of R06.2/period-functors (hodgeTateMultiplicity).
- `hodgeTateWeights` (*constructor*) — The multiset {h with multiplicity m_h(V)}; the Hodge type HT_τ(V) for E-coefficients.
- `hodgeTateWeights_twist` (*relation*) — HT(V(n)) = HT(V) + n.
- `hodgeTateWeights_dual` (*relation*) — HT(V^*) = −HT(V).
- `hodgeTateWeights_tensor` (*relation*) — HT(V ⊗ W) = HT(V) + HT(W) (multiset sum of pairwise sums); HT(det V) = Σ HT(V).
- `hodgeTateWeights_eq_filtrationJumps_neg` (*characterisation*) — For V de Rham: h ∈ HT(V) ⇔ gr^{−h}D_dR(V) ≠ 0.
- `hodgeTateWeights_eq_sen` (*compatibility*) — HT(V) = eigenvalues of Sen's operator Θ_V (PadicHodgeTheory:P7/sen-module).

*Used by.*

- `PadicHodgeTheory:R06.3 (N_dR(V), Theorem 3.6, monodromy theorem)` — 'weights ≤ 0' normalisation of Berger's constructions
- `PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences` — FL intervals [0, p−2] and [0, p−1] are intervals of Hodge–Tate weights
- `LocalGaloisDeformationRings:R08.3` — Hodge type of potentially semistable deformation rings
- CohomologyComparisons:CP.5 and PadicHodgeTheory:R06.5 — HT-sign translation when passing to filtered cohomology or dual Tate modules

*Unit tests.* A wrong definition fails one of these.

- `hodgeTateWeights_tate_twist` (computation) — HT(Q_p(n)) = {n}: gr^{−n}D_dR(Q_p(n)) = K·t^{−n}e_n.
- `hodgeTateWeights_trivial` (degenerate) — HT(Q_p) = {0} and D_dR(Q_p) = Fil^0 = K.
- `hodgeTateWeights_cyclotomic_pos` (non-example) — The weight of Q_p(1) is +1, not −1: the unique jump of D_dR(Q_p(1)) = K·t^{−1}e_1 is at −1 (a convention defined by filtration jumps without the sign would give −1).
- `hodgeTateWeights_cyclotomicCharacter` (compatibility) — For the character g ↦ cyclotomicCharacter(K̄, p)(g) ∈ Z_p^× of Mathlib, the one-dimensional representation it defines is Q_p(1) and has Hodge–Tate weight +1.
- `hodgeTateWeights_elliptic` (computation) — HT(V_p(E)) = {0, 1} for E/K an elliptic curve.

*Construction.*

1. Tate's theorem (R06.2/hodge-tate-decomposition-tate): (C(i))^{G_K} = 0 for i ≠ 0 and = K for i = 0, so m_h = dim_K (C(−h) ⊗ V)^{G_K} counts the copies of C(h).
2. gr B_dR = ⊕_i C(i) with Fil^i B_dR = t^iB_dR^+ (R06.1/de-rham-period-ring, R06.1/fontaine-element-t) gives gr^{−h}D_dR(V) = (C(−h) ⊗ V)^{G_K} for de Rham V (R06.2/period-functors, Brinon–Conrad Proposition 6.3.2).
3. Sen: Θ_{Q_p(h)} = h and Θ_V is semisimple with eigenvalues h of multiplicity m_h for Hodge–Tate V (PadicHodgeTheory:P7/sen-module).

*Acceptance.*

- HT(Q_p(n)) = {n}; HT(V_p(E)) = {0, 1} for an elliptic curve E/K (det V_p(E) = Q_p(1)).
- HT(ρ_f|_{G_{Q_p}}) = {0, k−1} for a newform f of weight k (Khare–Wintenberger's 'Hodge–Tate of weights (k − 1, 0)').

*Uses.* `PadicHodgeTheory:R06.2/hodge-tate-decomposition-tate`, `PadicHodgeTheory:R06.1/de-rham-period-ring`, `PadicHodgeTheory:R06.1/fontaine-element-t`, `PadicHodgeTheory:R06.2/period-functors`, `mathlib:cyclotomicCharacter`, `mathlib:Module.finrank`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, §2.4, p. 17: “For example, CK (q) has −q as its unique Hodge–Tate weight.” Brinon–Conrad's covariant convention is opposite to HT(χ_p) = +1.
- CMI Summer School notes on p-adic Hodge theory, §6.3, p. 76: “Thus, sometimes it is more convenient to define Hodge–Tate weights using the same filtration condition (gri 6= 0) applied to the contravariant functor” Their contravariant convention agrees with ours.
- Représentations p-adiques et équations différentielles, §3.2, p. 31: “Si V a ses poids de Hodge-Tate négatifs, alors” Berger's convention: negative weights ⇔ D_st^+(V) = D_st(V), i.e. HT(χ_p) = +1.
- Serre's modularity conjecture (I), §4, p. 7: “If ρ is Hodge-Tate of weights (k − 1, 0) at p (for k ∈ N, k ≥ 2), we say that ρ is of weight k.” Modular weight k ↔ weights {0, k−1}.

### Lemmas, theorems and comparisons

#### Theorem. The comparison map α_V is injective and dim_E D_B(V) ≤ dim_F V

*Node* `PadicHodgeTheory:R06.2/admissibility-dimension-bound`.

Let B be (F, G)-regular with E = B^G, V a finite-dimensional F-linear representation of G, and D_B(V) = (B ⊗_F V)^G. Then the B-linear G-equivariant map α_V: B ⊗_E D_B(V) → B ⊗_F V is injective, dim_E D_B(V) ≤ dim_F V, and equality holds if and only if α_V is an isomorphism (V is then called B-admissible). Equivalently V is B-admissible iff B ⊗_F V ≅ B^{dim V} compatibly with the B-module structure and the G-action.

*Hypotheses.* B (F, G)-regular (R06.2/regular-period-ring).

*Proof outline.*

1. Injectivity: reduce to C = Frac(B) (flat over B) since D_B(V) ⊆ D_C(V) and E = C^G; for B a field, G-invariant E-linearly independent x_i are B-linearly independent: a minimal relation x_r = Σ_{i<r} b_i x_i is G-stable, so b_i ∈ B^G = E.
2. Dimension bound: compare C-dimensions after the flat base change.
3. Equality ⇒ isomorphism: the determinant of α_V in bases spans a G-stable F-line (G acts on det through det V^{-1}), hence is a unit by regularity (B-C Theorem 5.2.1(1)).
4. Alternative description: B-C Remark 5.2.3.

*Acceptance.*

- V = F (trivial): D_B(F) = E and α is the identity.

*Uses.* `PadicHodgeTheory:R06.2/regular-period-ring`, `mathlib:Representation.invariants`, `mathlib:Representation.tprod`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Theorem 5.2.1(1) with proof, pp. 68–70: “The map αV is always injective and dimE DB (V ) ⩽ dimF V , with equality if and only if αV is an isomorphism.” The statement.
- Theory of p-adic Galois representations, §2.1.2, Theorem 2.13, p. 22: “Assume that B is (F, G)-regular. Then” F-O's version of the same formalism.

#### Theorem. B-admissible representations form a Tannakian subcategory on which D_B is exact, faithful and tensor

*Node* `PadicHodgeTheory:R06.2/admissible-category-tannakian`.

For B (F, G)-regular: (1) D_B restricted to B-admissible representations is exact and faithful into finite-dimensional E-vector spaces; subrepresentations and quotients of B-admissible representations are B-admissible. (2) If V_1, V_2 are B-admissible, D_B(V_1) ⊗_E D_B(V_2) ≅ D_B(V_1 ⊗ V_2), so V_1 ⊗ V_2 is B-admissible; V^∨ is B-admissible and D_B(V) ⊗ D_B(V^∨) → D_B(F) = E is a perfect pairing; exterior and symmetric powers are B-admissible and D_B commutes with them; in particular D_B(det V) = det D_B(V).

*Hypotheses.* B (F, G)-regular.

*Proof outline.*

1. (1) α_V is an isomorphism for admissible V, so exactness can be tested after B ⊗_E −; a short exact sequence gives dim D_B(V) ≤ dim D_B(V') + dim D_B(V'') ≤ dim V' + dim V'' = dim V, forcing equalities.
2. (2) The natural map D_B(V_1) ⊗ D_B(V_2) → D_B(V_1 ⊗ V_2) composed with the inclusion into B ⊗ (V_1 ⊗ V_2) equals α_{V_1} ⊗_B α_{V_2} restricted, hence injective; dimensions force isomorphism. Exterior/symmetric powers are quotients of tensor powers. Duality: reduce to det V via det(V^∨) ⊗ ∧^{d−1}V ≅ V^∨; for dim 1, D_B(V) = E(b ⊗ v_0) with b ∈ B^× and b^{-1} ⊗ v_0^∨ ∈ D_B(V^∨) (B-C Theorem 5.2.1(2)(3)).

*Acceptance.*

- D_B(F) = E; D_B(V ⊕ W) = D_B(V) ⊕ D_B(W).

*Uses.* `PadicHodgeTheory:R06.2/admissibility-dimension-bound`.

*Source.* CMI Summer School notes on p-adic Hodge theory, Theorem 5.2.1(2)–(3), p. 68: “The covariant functor DB : RepB F (G) → VecE to the category of finite-dimensional E-vector spaces is exact and faithful, and any subrepresentation or quotient of a B-admissible representation is B-admissible.” Statement (1); (3) is the tensor/dual statement.

#### Theorem. B_HT, B_dR, B_cris and B_st are (Q_p, G_K)-regular

*Node* `PadicHodgeTheory:R06.2/period-rings-are-regular`.

For K/Q_p finite: (1) B_HT is (Q_p, G_K)-regular with B_HT^{G_K} = K; (2) B_dR is (Q_p, G_K)-regular with B_dR^{G_K} = K; (3) B_cris and B_st are (Q_p, G_K)-regular with B_cris^{G_K} = B_st^{G_K} = K_0. More precisely, if b ∈ B_dR is nonzero and Q_p b is G_K-stable then b ∈ K̄·t^i for some i ∈ Z, and b ∈ B_st forces b ∈ K̂_0^{ur}·t^i ⊆ B_cris^×.

*Hypotheses.* log_K(p) = 0 for the embedding B_st ⊆ B_dR (the statement is independent of the choice).

*Proof outline.*

1. (1) Invariants of B_HT and C(t) by Tate–Sen (R06.1/hodge-tate-period-ring); a stable line Q_p b with b = Σ c_jt^j has character ψ with each c_j ∈ C(ψ^{-1}χ^j)^{G_K}, so at most one j occurs since χ has infinite image on inertia; b = ct^j is a unit (B-C Example 5.1.2).
2. (2) B_dR is a field with B_dR^{G_K} = K (R06.1/de-rham-invariants).
3. (3) (F-O Proposition 6.28) Domains and invariants by R06.1/period-ring-invariants. Stable line Q_p b ⊆ B_dR: after multiplying by t^{-i}, b ∈ B_dR^+ ∖ Fil^1; its residue b̄ ∈ C spans a stable line, so by Tate–Sen the character η has η(I_K) finite and b̄ is algebraic over K̂_0^{ur}; its Hensel lift β ∈ K̄ ⊆ B_dR^+ has the same character, and b − β, if nonzero, would give an invariant in C(χ^rη) with r ≥ 1, impossible; so b = β ∈ K̄. Finally K̄ ∩ B_st = K̂_0^{ur} ∩ K̄ ⊆ B_cris^×: a finite extension L of K̂_0^{ur} inside B_st satisfies L ⊗ … ⊆ B_st^{G_L} = L_0 = K̂_0^{ur} by R06.1/period-ring-invariants applied to L.

*Acceptance.*

- t ∈ B_cris^× and every G_K-stable line in B_cris is K̂_0^{ur}t^i-type.
- B_dR^+ and B_cris^+ are not regular (t is not a unit there).

*Uses.* `PadicHodgeTheory:R06.2/regular-period-ring`, `PadicHodgeTheory:R06.1/period-ring-invariants`, `PadicHodgeTheory:R06.1/tate-sen-theorem`, `PadicHodgeTheory:R06.1/hodge-tate-period-ring`, `PadicHodgeTheory:R06.1/algebraic-closure-in-bdr-plus`, `PadicHodgeTheory:R06.1/k-tensor-bst-injective`.

*Sources.*

- Theory of p-adic Galois representations, Proposition 6.28 with proof, p. 131: “(3) If b ∈ Bcris (resp. Bst ), b 6= 0, such that Qp · b is stable under GK , then b is invertible in Bcris (resp. Bst ).” Regularity of B_cris and B_st.
- CMI Summer School notes on p-adic Hodge theory, Example 5.1.2, p. 66: “We claim that B is (Qp , G)-regular (with B G = K).” Regularity of B_HT.
- CMI Summer School notes on p-adic Hodge theory, Proposition 9.1.6, p. 131: “The domain Bcris is (Qp , GK )-regular.” B-C's statement for B_cris (its proof relies on Theorem 9.1.5).

#### Lemma. The Serre–Tate lemma: ⊕_q C(−q) ⊗_K W{q} → W is injective

*Node* `PadicHodgeTheory:R06.2/serre-tate-injectivity`.

Let W be a C-representation of G_K (finite-dimensional C-vector space with continuous semilinear G_K-action) and W{q} = (W(q))^{G_K} ≅ {w ∈ W : g(w) = χ(g)^{−q}w}. The C-linear G_K-equivariant map ξ_W: ⊕_q C(−q) ⊗_K W{q} → W is injective; hence W{q} = 0 for all but finitely many q, each W{q} is finite-dimensional, Σ_q dim_K W{q} ≤ dim_C W, with equality iff ξ_W is an isomorphism (W is then Hodge–Tate). Equivalently the comparison map γ_W: B_HT ⊗_K D(W) → B_HT ⊗_C W is injective, bijective iff W is Hodge–Tate.

*Hypotheses.* W ∈ Rep_C(G_K) (B-C Definition 2.2.1).

*Proof outline.*

1. Take a nonzero element of ker ξ_W of minimal length (number of elementary tensors); ker ξ_W is a C-subspace, so scale one coefficient to 1; applying g − χ(g)^{q_0} … shows all coefficients lie in C(−q)^{G_K} ⊗ …, and by Tate–Sen (C(r)^{G_K} = 0 for r ≠ 0, C^{G_K} = K) the minimal element has length 1, contradicting injectivity on single summands (B-C Lemma 2.3.1).
2. γ_W on the n-th graded piece is the Q_p(n)-twist of ξ_W (B-C Lemma 2.4.10).

*Acceptance.*

- W = C(r): W{q} = K if q = −r and 0 otherwise.

*Uses.* `PadicHodgeTheory:R06.1/tate-sen-theorem`, `PadicHodgeTheory:R06.1/hodge-tate-period-ring`.

*Source.* CMI Summer School notes on p-adic Hodge theory, Lemma 2.3.1 (Serre–Tate), p. 16: “In particular, W {q} = 0 for all but finitely many q and dimK W {q} < ∞ for all q, with q dimK W {q} ⩽ dimCK W ; equality holds here if and only if ξW is an isomorphism.” The statement (the Σ over q is lost in extraction).

#### Theorem. Tate's theorems on C(ψ) and the Hodge–Tate decomposition

*Node* `PadicHodgeTheory:R06.2/hodge-tate-decomposition-tate`.

Let F/Q_p be finite (p any prime; for FaltingsFinitenessAndIsogenyTheorems read p = ℓ and F = K_i), C the completion of F̄, G_F = Gal(F̄/F), I_F its inertia group. (1) For a continuous character ψ: G_F → Z_p^×: C(ψ) ≅ C as semilinear C-representations if and only if ψ(I_F) is finite; if ψ(I_F) is infinite then H^0(G_F, C(ψ)) = 0 (and H^1 = 0). (2) If V is a continuous Q_p-representation of G_F with finite image then C ⊗_{Q_p} V ≅ C^{dim V} as semilinear representations; more generally this holds whenever ρ(I_F) is finite. (3) (Hodge–Tate decomposition) A C-representation W is Hodge–Tate iff W ≅ ⊕_q C(−q)^{h_q} for integers h_q ≥ 0, and then h_q = dim_F W{q} and the canonical map ⊕_q C(−q) ⊗_F W{q} → W is an isomorphism; in particular a p-adic representation V is Hodge–Tate iff C ⊗ V ≅ ⊕_i C(i)^{m_i}, where m_i is the multiplicity of the Hodge–Tate weight i (HT(χ) = +1). (4) For a Hodge–Tate V the decomposition is compatible with tensor products and duals: C ⊗ (V ⊗ V') ≅ ⊕ C(i + j)^{m_i m'_j}, and det V ⊗ C ≅ C(Σ_i i m_i).

*Hypotheses.* ψ continuous with values in Z_p^× (its image is a commutative p-adic Lie group of dimension ≤ 1, as required by R06.1/tate-sen-theorem).

*Proof outline.*

1. (1) If ψ(I_F) is finite, C(ψ)^{G_F} is a 1-dimensional F-space (R06.1/tate-sen-theorem); a nonzero invariant w gives the C-linear equivariant isomorphism C → C(ψ), c ↦ cw. Conversely C(ψ) ≅ C gives C(ψ)^{G_F} ≅ C^{G_F} = F ≠ 0, so ψ(I_F) is finite by R06.1/tate-sen-theorem (the case η(I) infinite).
2. (2) If ρ has finite image, let L/F be the finite Galois extension with G_L = ker ρ. Then (C ⊗ V)^{G_L} = C^{G_L} ⊗ V = L ⊗ V (Ax–Sen–Tate, R06.1/ax-sen-tate-invariants), a finite-dimensional L-space with semilinear Gal(L/F)-action, which by Hilbert 90 (R06.1/semilinear-galois-descent) is L ⊗_F D_0 with dim_F D_0 = dim V; then C ⊗ V = C ⊗_L (L ⊗_F D_0) ≅ C^{dim V}. If only ρ(I_F) is finite, pass to K̂^{ur} and use completed unramified descent (F-O Propositions 3.51–3.53). (The converse, C-admissible ⇒ ρ(I_F) finite, is F-O Proposition 3.55 and rests on Sen's theorem; it is not part of this node and no consumer requests it.)
3. (3) If W ≅ ⊕ C(−q)^{h_q} then W{q} has dimension h_q by Tate–Sen, so Σ dim W{q} = dim W and W is Hodge–Tate by R06.2/serre-tate-injectivity; the converse is the definition of Hodge–Tate via ξ_W (B-C Example 2.3.5).
4. (4) C(a) ⊗ C(b) ≅ C(a + b) and the decomposition of each factor; the determinant is the top exterior power (B-C §2.4 opening paragraph).

*Acceptance.*

- C(χ^r) ≇ C for r ≠ 0 since χ^r has infinite image on inertia; C(ψ) ≅ C for ψ unramified (e.g. the unramified character with Frob ↦ 2 ∈ Z_5^×).
- FaltingsFinitenessAndIsogenyTheorems R28.2: for G ⊆ A[ℓ^∞] with the hypothesis (H_i), Λ^hV_ℓ(G) ⊗ C_i ≅ C_i(d_i) follows from (2) for the finite-image quotient and from Tate's Hodge–Tate decomposition of V_ℓ(Γ_i) (requested there from HodgeTateAndCanonicalSubgroups:T0) combined with (4).
- Weight bookkeeping: for V_p(E) of an elliptic curve with good reduction, C ⊗ V_p(E) ≅ C ⊕ C(1) (weights 0 and 1).

*Uses.* `PadicHodgeTheory:R06.1/tate-sen-theorem`, `PadicHodgeTheory:R06.1/ax-sen-tate-invariants`, `PadicHodgeTheory:R06.1/semilinear-galois-descent`, `PadicHodgeTheory:R06.2/serre-tate-injectivity`, `PadicHodgeTheory:R06.2/period-functors`.

*Planet:* Hodge–Tate decomposition.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Example 2.3.5, p. 17: “In other words, the intrinsic property of being Hodge–Tate is equivalent to the concrete property of being isomorphic to a finite direct sum of various objects CK (ri ) (with multiplicity permitted).” Statement (3).
- CMI Summer School notes on p-adic Hodge theory, Theorem 2.2.7, p. 15: “Hicont (GK , CK (η)) = 0 for i = 0, 1 when η(IK ) is infinite and these cohomologies are 1- dimensional over K when η(IK ) is finite” The input for (1).
- Theory of p-adic Galois representations, §3.5.2, Proposition 3.53, p. 63: “(2) A p-adic representation of GK is P -admissible if and only if the action of IK is discrete.” Statement (2): discrete inertia action gives triviality over P = K̂^{ur}·K̄-closure, hence over C.

#### Theorem. Insensitivity of D_HT to finite extensions and to K̂^{ur}

*Node* `PadicHodgeTheory:R06.2/hodge-tate-base-change`.

For every C-representation W of G_K: (1) for a finite extension K'/K inside K̄, the natural map K' ⊗_K D_K(W) → D_{K'}(W) of graded K'-spaces is an isomorphism (D_K(W) = ⊕_q (C(q) ⊗ W)^{G_K}); (2) the natural map K̂^{ur} ⊗_K D_K(W) → D_{K̂^{ur}}(W) (invariants under I_K) is an isomorphism. Hence W is Hodge–Tate for G_K iff it is for G_{K'}, iff it is for I_K; the same holds for p-adic representations V (W = C ⊗ V).

*Hypotheses.* W ∈ Rep_C(G_K).

*Proof outline.*

1. (1) Reduce by transitivity to K'/K finite Galois; Gal(K'/K) acts semilinearly on D_{K'}(W) with invariants D_K(W), and Galois descent (R06.1/semilinear-galois-descent (i)) applies.
2. (2) G_k = G_K/I_K acts semilinearly and continuously on the finite-dimensional K̂^{ur}-space D_{K̂^{ur}}(W) (continuity via the Serre–Tate embedding into W), and completed unramified descent (R06.1/semilinear-galois-descent (ii)) applies (B-C Theorem 2.4.6).

*Acceptance.*

- For W = C(χ^r ψ) with ψ finite on inertia, D_{K'}(W) is a K'-line in degree −r for K' splitting ψ|_{I_K}.

*Uses.* `PadicHodgeTheory:R06.1/semilinear-galois-descent`, `PadicHodgeTheory:R06.2/serre-tate-injectivity`.

*Source.* CMI Summer School notes on p-adic Hodge theory, Theorem 2.4.6, p. 20: “In particular, for any finite extension K ′ /K inside of K, an object W in RepCK (GK ) is Hodge–Tate if and only iff it is Hodge–Tate when viewed in RepCK (GK ′ )” The statement (B-C's typo 'if and only iff').

#### Theorem. D_HT on Hodge–Tate representations: exactness, tensor compatibility, and the equivalence with graded vector spaces

*Node* `PadicHodgeTheory:R06.2/hodge-tate-graded-equivalence`.

(1) If 0 → W' → W → W'' → 0 is exact in Rep_C(G_K) and W is Hodge–Tate, then W', W'' are Hodge–Tate and 0 → D(W') → D(W) → D(W'') → 0 is exact in graded K-spaces. (2) D and V(D) := gr^0(B_HT ⊗_K D) are quasi-inverse equivalences between Hodge–Tate C-representations and finite-dimensional graded K-vector spaces, compatible with ⊗ and duals. (3) Consequently D_HT: Rep^{HT}_{Q_p}(G_K) → Gr_{K,f} is exact, faithful and compatible with ⊗ and duals; Rep^{HT} is stable under ⊗, duals, subobjects and quotients but not under extensions (a non-split extension 0 → C → W → C → 0, which exists since H^1(G_K, C) ≠ 0, is not Hodge–Tate).

*Hypotheses.* Hodge–Tate in the sense of R06.2/serre-tate-injectivity.

*Proof outline.*

1. (1) dimension count with the Serre–Tate inequality (B-C Proposition 2.4.4).
2. (2) γ_{V(D)} is an isomorphism and (V(D)(r))^{G_K} = D_r by Tate–Sen, giving D(V(D)) ≅ D; tensor/dual compatibility reduces to C(q) ⊗ C(q') ≅ C(q + q') (B-C Theorem 2.4.11).
3. Non-closure under extensions: B-C Example 2.4.5 using H^1_cont(G_K, C) ≠ 0 (R06.1/tate-sen-theorem).

*Acceptance.*

- D_HT(Q_p(n)) = K in degree −n (B-C grading); D_HT(V ⊗ V') = D_HT(V) ⊗ D_HT(V').

*Uses.* `PadicHodgeTheory:R06.2/serre-tate-injectivity`, `PadicHodgeTheory:R06.1/tate-sen-theorem`, `PadicHodgeTheory:R06.2/hodge-tate-decomposition-tate`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Theorem 2.4.11, p. 23: “The covariant functors D and V between the categories of Hodge–Tate representations in RepCK (GK ) and finite-dimensional objects in GrK are quasi-inverse equiv- alences.” Statement (2).
- CMI Summer School notes on p-adic Hodge theory, Proposition 2.4.4 and Example 2.4.5, p. 19: “Although Proposition 2.4.4 says that any subrepresentation or quotient rep- resentation of a Hodge–Tate representation is again Hodge–Tate, the converse is false” Statements (1) and the non-closure under extensions.

#### Lemma. D_dR and D_cris of Q_p(n)

*Node* `PadicHodgeTheory:R06.2/ddr-of-tate-twists`.

For n ∈ Z, D_dR(Q_p(n)) = K·t^{−n} ⊗ e_n is 1-dimensional with its unique filtration jump in degree −n (gr^{−n} ≠ 0); so Q_p(n) is de Rham with Hodge–Tate weight n in the convention HT(χ) = +1 (weight −n in Brinon–Conrad's convention). Likewise D_cris(Q_p(n)) = K_0·t^{−n} ⊗ e_n with φ = p^{−n}σ, so t_N(D_cris(Q_p(n))) = t_H(D_cris(Q_p(n))) = −n; and D_HT(Q_p(n)) = K in degree −n.

*Hypotheses.* e_n a basis of Q_p(n) with g e_n = χ(g)^n e_n.

*Proof outline.*

1. t^{−n} ⊗ e_n is G_K-invariant; dim ≤ 1 by R06.2/admissibility-dimension-bound; t^{−n} ∈ Fil^{−n} ∖ Fil^{−n+1} (R06.1/bdr-filtration-and-graded); φ(t^{−n}) = p^{−n}t^{−n} (R06.1/frobenius-on-acris).

*Acceptance.*

- PARI/arithmetic check: for n = −2, …, 2, t_N = v_p(p^{−n}) = −n = t_H, and the Hodge–Tate weight is n (checks.out).

*Uses.* `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.1/fontaine-element-t`, `PadicHodgeTheory:R06.1/bdr-filtration-and-graded`, `PadicHodgeTheory:R06.1/frobenius-on-acris`, `PadicHodgeTheory:R06.2/admissibility-dimension-bound`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Example 6.1.1 and Example 6.3.1, pp. 73, 76: “For n ∈ Z, DdR (Qp (n)) is 1-dimensional with its unique filtration jump in degree −n (i.e., gr−n is nonzero).” The de Rham statement.
- CMI Summer School notes on p-adic Hodge theory, Example 9.1.12, p. 135: “Let's calculate Dcris (Qp (r)) = HomQp [GK ] (Qp (r), Bcris ).” The crystalline computation (contravariant; the covariant answer is its dual).

#### Theorem. de Rham representations are Hodge–Tate with gr D_dR = D_HT

*Node* `PadicHodgeTheory:R06.2/de-rham-implies-hodge-tate`.

For every p-adic representation V there is a natural injection of graded K-spaces gr D_dR(V) ↪ D_HT(V); if V is de Rham it is an isomorphism, so V is Hodge–Tate, and the Hodge–Tate weights of V (convention HT(χ) = +1) are the h with gr^{−h}D_dR(V) ≠ 0, with multiplicity dim gr^{−h}. Moreover the de Rham comparison isomorphism B_dR ⊗_K D_dR(V) ≅ B_dR ⊗ V is a filtered isomorphism (its inverse is filtered).

*Hypotheses.* V a p-adic representation of G_K.

*Proof outline.*

1. Left exactness of invariants and gr B_dR = B_HT (R06.1/bdr-filtration-and-graded) give gr D_dR(V) ↪ (B_HT ⊗ V)^{G_K}; then dim D_dR ≤ dim D_HT ≤ dim V with equality in the de Rham case (B-C Proposition 6.3.2, F-O Proposition 5.30).
2. Filtered comparison: gr(α) is the Hodge–Tate comparison B_HT ⊗ D_HT(V) → B_HT ⊗ V, an isomorphism for Hodge–Tate V (R06.2/serre-tate-injectivity), so α is strict (B-C Proposition 6.3.7).

*Acceptance.*

- V = Q_p(n): gr D_dR = K in degree −n = D_HT.
- The inclusion can be an equality for non-de Rham V with D_HT(V) = 0.

*Uses.* `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.1/bdr-filtration-and-graded`, `PadicHodgeTheory:R06.2/serre-tate-injectivity`, `PadicHodgeTheory:R06.2/admissible-representations`.

*Source.* CMI Summer School notes on p-adic Hodge theory, Proposition 6.3.2, p. 76: “If V is de Rham then V is Hodge–Tate and gr(DdR (V )) = DHT (V ) as graded K-vector spaces.” The statement; Proposition 6.3.7 is the filtered comparison.

#### Theorem. D_dR on de Rham representations: exact, strict, and compatible with ⊗, duals and determinants

*Node* `PadicHodgeTheory:R06.2/ddr-exact-strict-tensor`.

The functor D_dR: Rep^{dR}_{Q_p}(G_K) → Fil_K is faithful, carries short exact sequences to short exact sequences in Fil_K (subobjects get the subspace filtration, quotients the quotient filtration), and the natural maps D_dR(V) ⊗ D_dR(V') → D_dR(V ⊗ V') and D_dR(V^∨) → D_dR(V)^∨ are isomorphisms in Fil_K; hence D_dR commutes with exterior powers and D_dR(det V) ≅ det D_dR(V) in Fil_K, t_H(D_dR(det V)) = t_H(D_dR(V)). Also V is de Rham iff V(n) is de Rham, and D_dR(V(n)) = D_dR(V)[n]-shifted: Fil^iD_dR(V(n)) ≅ Fil^{i+n}D_dR(V).

*Hypotheses.* V, V' de Rham.

*Proof outline.*

1. Exactness in Vec_K from R06.2/admissible-category-tannakian; strictness: the sequences gr^i of D_HT are exact (R06.2/hodge-tate-graded-equivalence) and gr D_dR = D_HT (R06.2/de-rham-implies-hodge-tate), so dim Fil^i is additive and 0 → Fil^iD_dR(V') → Fil^iD_dR(V) → Fil^iD_dR(V'') is also right exact (B-C Proposition 6.3.3).
2. Tensor: the Vec_K isomorphism is a morphism in Fil_K since B_dR is a filtered ring; it is an isomorphism in Fil_K iff gr of it is, which is the Hodge–Tate tensor isomorphism; duals likewise.
3. Twist: D_dR(Q_p(n)) (R06.2/ddr-of-tate-twists) and the tensor compatibility (B-C Corollary 6.3.4).

*Acceptance.*

- D_dR(Q_p(a) ⊕ Q_p(b)) has jumps −a, −b; det has jump −a − b.
- MordellLawrenceVenkatesh LV.1/de-rham-character-locally-algebraic uses D_dR(ψχ^k) = D_dR(ψ) ⊗ D_dR(Q_p(k)), shifting the jump by −k.

*Uses.* `PadicHodgeTheory:R06.2/admissible-category-tannakian`, `PadicHodgeTheory:R06.2/hodge-tate-graded-equivalence`, `PadicHodgeTheory:R06.2/de-rham-implies-hodge-tate`, `PadicHodgeTheory:R06.2/ddr-of-tate-twists`, `PadicHodgeTheory:R06.2/filtered-vector-spaces`, `PadicHodgeTheory:R06.2/hodge-number-tH`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Proposition 6.3.3, p. 77: “The faithful functor DdR : RepdR Qp (GK ) → FilK carries short exact sequences to short exact sequences and is compatible with the formation of tensor products and duals.” The statement.
- Theory of p-adic Galois representations, Theorem 5.29, p. 99: “Then DdR : RepdR Qp (GK ) → FilK is an exact, faithful and tensor functor.” F-O's version.

#### Theorem. Descent of D_dR under finite extensions and K̂^{ur}

*Node* `PadicHodgeTheory:R06.2/de-rham-base-change`.

For any complete discretely valued extension K'/K inside C (in particular K' finite over K, or K' = K̂^{ur}) and every p-adic representation V of G_K, the natural map K' ⊗_K D_dR,K(V) → D_dR,K'(V) is an isomorphism in Fil_{K'}. Hence V is de Rham for G_K iff it is de Rham for G_{K'}; the de Rham property can be checked on I_K and is insensitive to finite extensions; potentially de Rham = de Rham.

*Hypotheses.* D_dR,K'(V) = (B_dR ⊗ V)^{G_{K'}}, with the same ring B_dR (it depends only on C).

*Proof outline.*

1. Reduce to K'/K finite Galois and to K' = K̂^{ur}. Finite Galois: each Fil^iD_dR,K'(V) is a K'-space with semilinear Gal(K'/K)-action and invariants Fil^iD_dR,K(V); Galois descent (R06.1/semilinear-galois-descent (i)).
2. K̂^{ur}: completed unramified descent (R06.1/semilinear-galois-descent (ii)) once G_k acts continuously on Fil^iD_dR,K̂^{ur}(V); continuity from the continuity of G_K on t^iB_dR^+ ⊗ V (R06.1/bdr-natural-topology) and the fact that finite-dimensional K'-subspaces of B_dR^+ carry their natural topology (R06.1/algebraic-closure-in-bdr-plus (3)) (B-C Proposition 6.3.8, F-O Proposition 7.15, Proposition 6.58).

*Acceptance.*

- A character with finite image on I_K is de Rham with Hodge–Tate weight 0 (see R06.2/hodge-tate-characters-are-de-rham).

*Uses.* `PadicHodgeTheory:R06.1/semilinear-galois-descent`, `PadicHodgeTheory:R06.1/bdr-natural-topology`, `PadicHodgeTheory:R06.1/algebraic-closure-in-bdr-plus`, `PadicHodgeTheory:R06.2/period-functors`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Proposition 6.3.8, p. 80: “the natural map K ′ ⊗K DdR,K (V ) → DdR,K ′ (V ) is an isomorphism in FilK ′ . In particular, V is de Rham as a GK -representation if and only if V is de Rham as a GK ′ -representation.” The statement.
- Theory of p-adic Galois representations, Proposition 7.15, p. 154: “V is de Rham as a representation of GK if and only if V is de Rham as a representation of IK .” The inertia version.

#### Theorem. D_dR and D_cris of induced representations

*Node* `PadicHodgeTheory:R06.2/induction-and-restriction-of-scalars`.

Let F'/F be finite extensions of Q_p inside F̄ and W a p-adic representation of G_{F'}; put Ind W = Ind_{G_{F'}}^{G_F} W. (1) There is a natural isomorphism D_dR,F(Ind W) ≅ D_dR,F'(W) of filtered F-vector spaces (the right side viewed over F by restriction of scalars, with the same filtration); hence Ind W is de Rham iff W is. (2) If F'/F is unramified, D_cris,F(Ind W) ≅ D_cris,F'(W) as F_0-spaces with Frobenius and filtration (restriction of scalars from F'_0 to F_0), so Ind W is crystalline iff W is; similarly for D_st. (3) de Rham, crystalline and semistable representations are stable under subquotients (R06.2/admissible-category-tannakian).

*Hypotheses.* F'/F finite; for (2), F'/F unramified (F'_0/F_0 of degree [F':F]).

*Proof outline.*

1. Shapiro/Frobenius reciprocity: (B ⊗ Ind W)^{G_F} = (Ind(B ⊗ W))^{G_F} ≅ (B ⊗ W)^{G_{F'}} via evaluation at 1 (B ⊗ Ind W ≅ Ind(B ⊗ W) because Ind is a finite product and B is a G_F-module); the isomorphism preserves Fil^i since the filtration is defined by t^iB_dR^+ ⊗ −, and preserves φ, N.
2. (1) Dimension: dim_F D_dR,F(Ind W) = dim_F D_dR,F'(W) = [F':F]dim_{F'}D_dR,F'(W) ≤ [F':F] dim W = dim Ind W, with equality iff W is de Rham.
3. (2) The same count over F_0 with [F'_0:F_0] = [F':F] when F'/F is unramified.

*Acceptance.*

- F' = F(ζ_3)/F = Q_3 is ramified: Ind Q_3 = Q_3[Gal(F'/F)] is de Rham but not crystalline (R06.2/potentially-unramified-and-characters).

*Uses.* `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.2/admissible-category-tannakian`, `ArithmeticGaloisRepresentations:R01.1`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, §9.3, discussion before Proposition 9.3.1, p. 146: “has trivial GK ′ -action (so it is crystalline as a GK ′ -representation) but has ramified GK -action and hence is non-crystalline by Corollary 9.3.2 below.” Induction from a ramified extension does not preserve crystallinity, motivating the unramified hypothesis in (2).
- CMI Summer School notes on p-adic Hodge theory, Proposition 6.3.8, p. 80: “In particular, V is de Rham as a GK -representation if and only if V is de Rham as a GK ′ -representation.” Used for the restriction direction of (1).

#### Theorem. One-dimensional representations: Hodge–Tate ⇔ de Rham ⇔ χ^i·(finite on inertia)

*Node* `PadicHodgeTheory:R06.2/hodge-tate-characters-are-de-rham`.

For a continuous character η: G_K → Z_p^× (or O_E^× with E/Q_p finite and K containing the Galois closure of E): (1) η is Hodge–Tate iff η = η_0χ^i with i ∈ Z and η_0(I_K) finite, and then i is its unique Hodge–Tate weight (convention HT(χ) = +1); (2) η is de Rham iff it is Hodge–Tate; (3) every representation with finite image on I_K is de Rham with all Hodge–Tate weights 0 and D_dR a direct sum of copies of K[0]; (4) non-example: for p odd, K = Q_p and η = ⟨χ⟩^s (⟨χ⟩ = χ·ω^{-1} with values in 1 + pZ_p), s ∈ Z_p ∖ Z, η is not Hodge–Tate, hence not de Rham. There is no Hodge–Tate character that is not de Rham; a Hodge–Tate representation that is not de Rham has dimension ≥ 2 (see R06.3, part D: a non-split extension of Q_p(1) by Q_p).

*Hypotheses.* η continuous; for E-valued characters use the E-coefficient formalism (B-C Exercise 6.4.3).

*Proof outline.*

1. (1) η is Hodge–Tate iff (C(−i) ⊗ Q_p(η))^{G_K} ≠ 0 for some i, iff C(ηχ^{−i})^{G_K} ≠ 0, iff ηχ^{−i}(I_K) is finite (R06.1/tate-sen-theorem) (F-O Proposition 7.18); uniqueness of i since χ^r(I_K) is infinite for r ≠ 0.
2. (2) Twist by Q_p(−i) (de Rham, R06.2/ddr-of-tate-twists) to reach η_0 with η_0(I_K) finite; after a finite extension K' killing η_0|_{I_K}, η_0 is unramified, hence de Rham over K̂'^{ur} (C(η_0)^{G} is a line); de Rham descends (R06.2/de-rham-base-change) (B-C Example 6.3.9, F-O Proposition 7.19).
3. (3) the same argument for any representation with finite image on inertia.
4. (4) ηχ^{−q} = ⟨χ⟩^{s−q}ω^{−q} has infinite image on I_{Q_p} for every q ∈ Z since s − q ≠ 0 and ⟨χ⟩(I_{Q_p}) = 1 + pZ_p; so D_HT(η) = 0 (PARI check of s − q ≠ 0 for s = 1/2, q = −3,…,3).

*Acceptance.*

- χ^i·(unramified character) is de Rham with weight i; the character ⟨χ⟩^{1/2} of G_{Q_5} is not Hodge–Tate.
- MordellLawrenceVenkatesh LV.1/de-rham-character-locally-algebraic: a de Rham ψ with D_dR jump k has ψχ^{k} of finite order on inertia — this is (1)–(2) with i = −k.

*Uses.* `PadicHodgeTheory:R06.1/tate-sen-theorem`, `PadicHodgeTheory:R06.2/ddr-of-tate-twists`, `PadicHodgeTheory:R06.2/de-rham-base-change`, `PadicHodgeTheory:R06.2/de-rham-implies-hodge-tate`, `PadicHodgeTheory:R06.2/ddr-exact-strict-tensor`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Example 6.3.9, p. 81: “In the 1-dimensional case, the Hodge–Tate and de Rham properties are equivalent.” Statement (2).
- Theory of p-adic Galois representations, Propositions 7.18 and 7.19, p. 156: “η is Hodge-Tate if and only if it can be written as η = η0 χi” Statement (1).
- CMI Summer School notes on p-adic Hodge theory, Example 2.3.3, p. 17: “Thus for s ∈ Zp the map ξCK (χs ) vanishes if s 6∈ Z and it is an isomorphism if s ∈ Z.” The non-Hodge–Tate characters χ^s, s ∉ Z (statement (4), for K ⊇ Q_p(μ_p)).

#### Lemma. Extensions of de Rham representations with separated weights are de Rham

*Node* `PadicHodgeTheory:R06.2/extension-with-separated-weights-de-rham`.

Let 0 → V' → V → V'' → 0 be an exact sequence of p-adic representations of G_K with V', V'' de Rham such that every Hodge–Tate weight of V' is strictly larger than every Hodge–Tate weight of V'' (convention HT(χ) = +1). Then V is de Rham. In particular every extension of Q_p by Q_p(r), r ≥ 1, is de Rham (e.g. the Kummer extensions and V_p of a Tate curve).

*Hypotheses.* V', V'' de Rham; weights of V' > weights of V''.

*Proof outline.*

1. Twist so that the weights of V' are ≥ 1 and those of V'' are ≤ 0; then D_dR(V'') = (B_dR^+ ⊗ V'')^{G_K} and it suffices that (B_dR^+ ⊗ V)^{G_K} → (B_dR^+ ⊗ V'')^{G_K} is surjective.
2. The obstruction is a continuous 1-cocycle with values in B_dR^+ ⊗ V'; H^1_cont(G_K, B_dR^+ ⊗ V') = 0 by successive approximation along t^nB_dR^+ ⊗ V' (topologically exact filtration, R06.1/bdr-natural-topology) since C ⊗ V' ≅ ⊕C(m_i) with m_i ≥ 1 and H^1(G_K, C(m)) = 0 for m ≠ 0 (R06.1/tate-sen-theorem) (B-C Example 6.3.6).

*Acceptance.*

- The Tate-curve representation 0 → Q_p(1) → V_p(E_q) → Q_p → 0 is de Rham (indeed semistable).

*Uses.* `PadicHodgeTheory:R06.1/tate-sen-theorem`, `PadicHodgeTheory:R06.1/bdr-natural-topology`, `PadicHodgeTheory:R06.2/hodge-tate-decomposition-tate`, `PadicHodgeTheory:R06.2/de-rham-implies-hodge-tate`, `PadicHodgeTheory:R06.2/ddr-of-tate-twists`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Example 6.3.6, pp. 78–79: “are all strictly larger than those of V ′′ , the representation V is de Rham.” The statement. Read in B-C's own convention (§2.3, C(q) has weight −q) the printed inequality is reversed and false (source issue PadicHodgeTheory/E24); the node states it in the convention HT(χ) = +1, which is the one B-C's proof and example actually use.
- Theory of p-adic Galois representations, Remark 5.32, p. 100: “Any extension of Qp by Qp (1) is de Rham. (Kummer Theory)” The special case.

#### Lemma. N is nilpotent on every (φ, N)-module

*Node* `PadicHodgeTheory:R06.2/monodromy-nilpotent`.

If D is a finite-dimensional K_0-space with bijective σ-semilinear φ and K_0-linear N with Nφ = pφN, then N is nilpotent; in particular N = 0 if dim D = 1. More precisely N maps the slope-α part D(α) into D(α − 1).

*Hypotheses.* dim_{K_0} D < ∞, φ bijective.

*Proof outline.*

1. F-O Proposition 6.43: if N is not nilpotent let D' = N^h(D) = N^{h+1}(D) = … ; D' is φ- and N-stable and N, φ are surjective on it; with matrices A, B of φ, N one has BA = pAσ(B), so v_p(det B) = 1 + v_p(det σ(B)) = 1 + v_p(det B), impossible.
2. Slope shift: for v with φ^r v = p^s v over K̂_0^{ur}, φ^r(Nv) = p^{−r}Nφ^r v = p^{s−r}Nv (B-C Example 8.2.7, Lemma 8.2.8).

*Acceptance.*

- The Tate curve module: N e_1 = e_0 with slopes 1 and 0, N^2 = 0.

*Uses.* `PadicHodgeTheory:R06.2/filtered-phi-n-modules`.

*Sources.*

- Theory of p-adic Galois representations, Proposition 6.43 with proof, p. 136: “If D is a (ϕ, N )-module such that dimK0 D < ∞ and ϕ is bijective, then N is nilpotent.” The statement and determinant proof.
- CMI Summer School notes on p-adic Hodge theory, Lemma 8.2.8, p. 113: “For any D ∈ Modφ,N K0 , the monodromy operator ND on D is nilpotent.” The slope-shift proof.

#### Theorem. Slope decomposition of isocrystals over K_0

*Node* `PadicHodgeTheory:R06.2/slope-decomposition`.

Every isocrystal D over K_0 = W(k)[1/p] (k perfect) has a unique decomposition D = ⊕_{α∈Q} D(α) into φ-stable subspaces with D(α) isoclinic of slope α (i.e. K̂_0^{ur} ⊗ D(α) is a sum of copies of the simple object of slope α of the Dieudonné–Manin classification). Every morphism of isocrystals respects the decomposition; for a (φ, N)-module, N(D(α)) ⊆ D(α − 1), so ⊕_{α≤a} D(α) is N-stable. The Newton polygon P_N(D) has slopes α with multiplicity dim D(α) and endpoint (dim D, t_N(D)).

*Hypotheses.* k perfect of characteristic p.

*Proof outline.*

1. Over k̄: the Dieudonné–Manin classification with its unique slope decomposition (PadicDifferentialEquationsAndRigidCohomology:RD.1/dieudonne-manin-classical, with O = W(k̄), q = p).
2. Descent: each K̂_0^{ur}-isoclinic part is G_k-stable (spanned by the v with φ^r v = p^s v), so completed unramified descent (R06.1/semilinear-galois-descent (ii)) gives D(α) = (K̂_0^{ur} ⊗ D)(α)^{G_k} with K̂_0^{ur} ⊗ D(α) ≅ (K̂_0^{ur} ⊗ D)(α) (B-C Lemma 8.1.11).
3. N-compatibility: R06.2/monodromy-nilpotent.

*Acceptance.*

- The isocrystal of an ordinary elliptic curve over F_5 (charpoly X^2 + 2X + 5, PARI: slopes 0 and 1) splits as D(0) ⊕ D(1); for a supersingular curve over F_3 (charpoly X^2 + 3) D = D(1/2).

*Uses.* `PadicDifferentialEquationsAndRigidCohomology:RD.1/dieudonne-manin-classical`, `PadicHodgeTheory:R06.1/semilinear-galois-descent`, `PadicHodgeTheory:R06.2/monodromy-nilpotent`, `PadicHodgeTheory:R06.2/newton-number-tN`, `mathlib:WittVector.isocrystal_classification`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Lemma 8.1.11, p. 107: “there is a unique decomposition D = ⊕D(αi ) into a direct sum of nonzero subobjects that are isoclinic with respective slopes α1 < · · · < αn .” The statement over a general perfect k.
- CMI Summer School notes on p-adic Hodge theory, Theorem 8.1.4 (Dieudonné–Manin), p. 104: “the category ModφK0 of isocrystals over K0 = W(k)[1/p] is semisimple” The classification over algebraically closed k (imported from RD.1).

#### Lemma. Weak admissibility in short exact sequences

*Node* `PadicHodgeTheory:R06.2/weakly-admissible-two-out-of-three`.

If 0 → D' → D → D'' → 0 is a short exact sequence in MF^{φ,N}_K and two of D', D, D'' are weakly admissible, so is the third.

*Hypotheses.* Short exact in MF^{φ,N}_K: D' has the subspace and D'' the quotient filtration.

*Proof outline.*

1. D, D'' ⇒ D': subobjects of D' are subobjects of D, and t_H(D') = t_H(D) − t_H(D'') = t_N(D) − t_N(D'') = t_N(D'); dualise for D, D' ⇒ D''.
2. D', D'' ⇒ D: for D_1 ⊆ D put D'_1 = D' ∩ D_1 and D''_1 = D_1/D'_1 ↪ D''; the bijection D''_1 → j(D''_1) (subspace filtration from D'') satisfies t_H(D''_1) ≤ t_H(j(D''_1)) ≤ t_N(j(D''_1)) = t_N(D''_1) by R06.2/hodge-number-tH (B-C Proposition 8.2.10).

*Acceptance.*

- Q_p ⊕ Q_p(1) (as D_cris) is weakly admissible, being an extension of weakly admissible objects.

*Uses.* `PadicHodgeTheory:R06.2/weak-admissibility`, `PadicHodgeTheory:R06.2/hodge-number-tH`, `PadicHodgeTheory:R06.2/newton-number-tN`.

*Source.* CMI Summer School notes on p-adic Hodge theory, Proposition 8.2.10, p. 114: “and any two of the three terms are weakly admissible then so is the third.” The statement.

#### Theorem. MF^{φ,N,wa}_K is abelian and morphisms are strict

*Node* `PadicHodgeTheory:R06.2/weakly-admissible-category-abelian`.

Every morphism h: D → D' between weakly admissible filtered (φ, N)-modules is strict (coim h → im h is an isomorphism in MF^{φ,N}_K), and ker h, coker h (with subspace and quotient filtrations) and im h are weakly admissible. Hence MF^{φ,N,wa}_K is an abelian category (artinian: simple objects are the nonzero D with t_H(D') < t_N(D') for all proper nonzero subobjects). In particular a morphism of weakly admissible objects that is a K_0-linear isomorphism is an isomorphism in MF^{φ,N}_K.

*Hypotheses.* D, D' weakly admissible.

*Proof outline.*

1. t_N(coim h) ≤ t_H(coim h) (quotient of D) ≤ t_H(im h) (bijective morphism, R06.2/hodge-number-tH) ≤ t_N(im h) (subobject of D'), and the outer terms are equal because coim h ≅ im h as isocrystals; so equality holds and h is strict (B-C Theorem 8.2.11).
2. Weak admissibility of ker and coker then follows from R06.2/weakly-admissible-two-out-of-three.

*Acceptance.*

- The identity K_0e (jump 0) → K_0e (jump 1) is not a morphism of weakly admissible objects (the target with φe = e is not weakly admissible), consistent with strictness.

*Uses.* `PadicHodgeTheory:R06.2/weakly-admissible-two-out-of-three`, `PadicHodgeTheory:R06.2/hodge-number-tH`, `PadicHodgeTheory:R06.2/weak-admissibility`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Theorem 8.2.11, p. 115: “and ker h and coker h with their respective subspace and quotient filtration structures are weakly admissible.” The statement.
- Theory of p-adic Galois representations, Proposition 6.50 and Remark 6.51, p. 138: “The category MFad K (ϕ, N ) is abelian.” F-O's version and the description of simple objects.

#### Lemma. Classification of rank-one filtered (φ, N)-modules

*Node* `PadicHodgeTheory:R06.2/rank-one-filtered-modules`.

A 1-dimensional D ∈ MF^{φ,N}_K has N = 0, D = K_0e with φe = λe (λ ∈ K_0^×, well defined up to σ(c)/c, c ∈ K_0^×, so v_p(λ) = t_N(D) is an invariant), and a unique jump r = t_H(D). It is weakly admissible iff v_p(λ) = r. For r fixed, isomorphism classes of weakly admissible ones correspond to W(k)^×/{σ(c)/c}, which is in bijection with continuous unramified characters G_K → Z_p^× (Lang's theorem for W_n^×).

*Hypotheses.* dim_{K_0} D = 1.

*Proof outline.*

1. N = 0 by R06.2/monodromy-nilpotent; base change e ↦ ce changes λ to (σ(c)/c)λ with v_p(σ(c)/c) = 0 (B-C Example 8.3.2).
2. Weak admissibility: the only subobjects are 0 and D.
3. Unramified characters: W(k)^×/℘(W(k)^×) ≅ Hom_cont(G_k, Z_p^×) via the exact sequences 1 → W_n(F_p)^× → W_n^× → W_n^× → 1 (℘(x) = F(x)/x) and H^1(k, W_n^×) = 1 (B-C (8.3.2)).

*Acceptance.*

- D = K_0e, φe = pe, jump 1: weakly admissible; jump 0: not.

*Uses.* `PadicHodgeTheory:R06.2/weak-admissibility`, `PadicHodgeTheory:R06.2/monodromy-nilpotent`, `PadicHodgeTheory:R06.2/newton-number-tN`.

*Source.* CMI Summer School notes on p-adic Hodge theory, Example 8.3.2, p. 117: “(In general, the necessary and sufficient condition for weak admissibility is ordp (λ) = r, where ordp (λ) = tN (D) and r = tH (D).)” The criterion.

#### Lemma. D_cris and D_st take values in filtered (φ, N)-modules

*Node* `PadicHodgeTheory:R06.2/dcris-dst-filtered-phi-n-modules`.

For every p-adic representation V of G_K: D_st(V) with φ = φ_{B_st} ⊗ 1, N = N_{B_st} ⊗ 1 and the filtration on D_st(V)_K induced from D_dR(V) is an object of MF^{φ,N}_K provided φ is bijective on D_st(V); this holds whenever V is semistable (and for D_cris whenever V is crystalline): φ is injective on D_st(V) and bijective on it. D_cris(V) = D_st(V)^{N=0} is an object of MF^φ_K. The functors are faithful on the respective admissible categories.

*Hypotheses.* V semistable (resp. crystalline) for bijectivity of φ; φ is always an injective σ-semilinear map when φ is injective on the relevant periods.

*Proof outline.*

1. φ and N commute with G_K on B_st ⊗ V, hence preserve D_st(V); Nφ = pφN from R06.1/semistable-period-ring; N nilpotent by R06.2/monodromy-nilpotent.
2. Bijectivity of φ without using injectivity of φ on B_cris (packet-authored; B-C Theorem 9.1.8, whose proof is omitted in the source, is thereby avoided): for V semistable of dimension d, det V is semistable and D_st(det V) = ∧^d D_st(V) compatibly with φ (R06.2/admissible-category-tannakian); a nonzero vector of the line D_st(det V) is b ⊗ v with b ∈ B_st^× by regularity (the 1-dimensional case of B-C Theorem 5.2.1(3)), so φ(b ⊗ v) = φ(b) ⊗ v ≠ 0 as φ(b) is a unit; hence ∧^dφ ≠ 0, i.e. φ is injective on D_st(V), and an injective σ-semilinear endomorphism of a finite-dimensional K_0-space is bijective (B-C Exercise 7.4.10: σ is an automorphism of K_0).
3. The filtration: K ⊗_{K_0} D_st(V) ⊆ D_dR(V) (R06.2/period-functors) with the subspace filtration.

*Acceptance.*

- D_st(Q_p(n)) = K_0t^{−n} with φ = p^{−n}σ, N = 0.

*Uses.* `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.2/admissible-category-tannakian`, `PadicHodgeTheory:R06.2/period-rings-are-regular`, `PadicHodgeTheory:R06.2/monodromy-nilpotent`, `PadicHodgeTheory:R06.2/filtered-phi-n-modules`, `PadicHodgeTheory:R06.1/semistable-period-ring`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, §8, introduction, pp. 101–102: “(i) an injective Frobenius- semilinear endomorphism induced by the GK -equivariant injective Frobenius ϕcris on Bcris (so this is bijective by Exercise 7.4.10!)” B-C's argument, which uses injectivity of φ on B_cris (their Theorem 9.1.8, proof omitted); the node replaces it by the determinant argument.
- CMI Summer School notes on p-adic Hodge theory, Theorem 9.1.8, p. 133: “Unfortunately, the proof was omitted from [21]. We do not know of a published reference.” The omitted proof that the node avoids.

#### Theorem. crystalline ⇒ semistable ⇒ de Rham ⇒ Hodge–Tate, with the comparison of D_cris, D_st and D_dR

*Node* `PadicHodgeTheory:R06.2/crystalline-semistable-de-rham-implications`.

For a p-adic representation V of G_K: (1) D_cris(V) = D_st(V)^{N=0} in MF^{φ,N}_K; V is crystalline iff V is semistable and N = 0 on D_st(V). (2) If V is semistable then V is de Rham and K ⊗_{K_0} D_st(V) → D_dR(V) is an isomorphism in Fil_K; if V is crystalline, K ⊗_{K_0} D_cris(V) ≅ D_dR(V) in Fil_K. (3) de Rham ⇒ Hodge–Tate (R06.2/de-rham-implies-hodge-tate). (4) The comparison isomorphisms α_cris: B_cris ⊗ D_cris(V) ≅ B_cris ⊗ V and α_st are compatible with φ, N and G_K, and their scalar extensions to K are filtered isomorphisms (with filtered inverses).

*Hypotheses.* V a p-adic representation of G_K.

*Proof outline.*

1. (1) B_st^{N=0} = B_cris (R06.1/semistable-period-ring) and invariants commute with kernels; dimension count (B-C Lemma 9.2.12).
2. (2) K ⊗ D_st(V) ↪ D_dR(V) is a subobject in Fil_K by definition; for semistable V the source has dimension dim V ≥ dim D_dR(V) (B-C Lemma 9.2.13, Proposition 9.1.9; F-O Proposition 6.31).
3. (4) gr of α_K is identified with the Hodge–Tate comparison isomorphism since gr(K ⊗ B_cris) = gr(K ⊗ B_st) = B_HT on the relevant pieces (R06.1/k-tensor-bcris-injective) (B-C Proposition 9.1.9).

*Acceptance.*

- MordellLawrenceVenkatesh LV.4 uses (2) for unramified L: D_cris(ρ)_L = D_dR(ρ) as filtered spaces (B-C Proposition 9.1.9).
- The Tate curve V_p(E_q) is semistable, not crystalline (N ≠ 0), and de Rham.

*Uses.* `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.2/dcris-dst-filtered-phi-n-modules`, `PadicHodgeTheory:R06.2/de-rham-implies-hodge-tate`, `PadicHodgeTheory:R06.1/k-tensor-bcris-injective`, `PadicHodgeTheory:R06.1/k-tensor-bst-injective`, `PadicHodgeTheory:R06.1/semistable-period-ring`, `PadicHodgeTheory:R06.2/admissible-representations`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Lemma 9.2.13 and the summary after it, p. 145: “Semistable representations are de Rham, and if V is semistable then the natural injective map K ⊗K0 Dst (V ) → DdR (V ) is an isomorphism in FilK .” Statement (2).
- CMI Summer School notes on p-adic Hodge theory, Proposition 9.1.9, p. 133: “If V ∈ Repcris Qp (GK ) then the natural map jV : K ⊗K0 Dcris (V ) → DdR (V ) in FilK is an isomorphism.” The crystalline case and the filtered comparison (4).
- Theory of p-adic Galois representations, Proposition 6.31, p. 132: “If V is a semi-stable p-adic representation of GK , then it is de Rham.” Same in F-O.

#### Theorem. D_st on semistable representations: exact, tensor, fully faithful, with quasi-inverse V_st

*Node* `PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful`.

(1) D_st: Rep^{st}_{Q_p}(G_K) → MF^{φ,N}_K is exact (short exact sequences go to short exact sequences in MF^{φ,N}_K, i.e. strict on filtrations) and compatible with ⊗, duals, exterior powers and determinants. (2) For V semistable, V ≅ V_st(D_st(V)) := Fil^0(B_st ⊗_{K_0} D_st(V))^{φ=1, N=0} naturally and G_K-equivariantly. (3) D_st is fully faithful on semistable representations, with quasi-inverse V_st on its essential image; the same holds for D_cris and V_cris on crystalline representations.

*Hypotheses.* V, V' semistable (resp. crystalline).

*Proof outline.*

1. (1) exactness and tensor compatibility in Vec_{K_0} from R06.2/admissible-category-tannakian; filtrations: K ⊗ D_st = D_dR on semistable representations and R06.2/ddr-exact-strict-tensor.
2. (2) By the comparison isomorphism, V_st(D_st(V)) = Fil^0(B_st ⊗ V)^{φ=1,N=0} = (Fil^0B_cris)^{φ=1} ⊗ V = Q_p ⊗ V (F-O §7.2.1: N = 0 forces coefficients in B_cris, φ = 1 in B_e, Fil^0 in B_dR^+, and the fundamental exact sequence gives Q_p) (R06.1/fundamental-exact-sequence).
3. (3) A morphism T: D_st(V') → D_st(V) extends B_st-linearly to a φ-, N-, G_K- and filtration-compatible map B_st ⊗ V' → B_st ⊗ V, which preserves Fil^0(−)^{φ=1,N=0}, i.e. maps V' to V (B-C Propositions 9.1.11, 9.2.14).

*Acceptance.*

- MordellLawrenceVenkatesh: subrepresentations of crystalline V correspond to φ-stable subspaces with the induced filtration (R06.2/crystalline-subobjects-strict).
- D_cris(Q_p ⊕ Q_p(1)) = K_0 ⊕ K_0⟨1⟩.

*Uses.* `PadicHodgeTheory:R06.2/admissible-category-tannakian`, `PadicHodgeTheory:R06.2/ddr-exact-strict-tensor`, `PadicHodgeTheory:R06.2/crystalline-semistable-de-rham-implications`, `PadicHodgeTheory:R06.1/fundamental-exact-sequence`, `PadicHodgeTheory:R06.2/dcris-dst-filtered-phi-n-modules`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Proposition 9.2.14, p. 146: “The functor Dst : Repst Qp (GK ) → MFK is fully faithful, with quasi- inverse on its essential image given by Vst .” Statement (3).
- Theory of p-adic Galois representations, §7.2.1, end of the construction of the natural isomorphism, p. 153: “we have that bn ∈ Qp . Therefore x ∈ V , which implies that V = Vst (D).” Statement (2).

#### Lemma. Subrepresentations of crystalline representations and φ-stable subobjects

*Node* `PadicHodgeTheory:R06.2/crystalline-subobjects-strict`.

Let V be crystalline (resp. semistable) and V' ⊆ V a G_K-stable subspace. Then V' and V/V' are crystalline (resp. semistable), and D_cris(V') ⊆ D_cris(V) is a φ-stable (resp. φ- and N-stable) K_0-subspace whose filtration on D_cris(V')_K is the one induced from D_cris(V)_K; dim_{K_0} D_cris(V') = dim V'. Conversely, D_cris(V) → D_cris(V/V') is surjective with the quotient filtration.

*Hypotheses.* V crystalline or semistable.

*Proof outline.*

1. Subquotients of admissible representations are admissible (R06.2/admissible-category-tannakian); exactness in MF (strictness) from R06.2/dst-exact-tensor-fully-faithful (1).

*Acceptance.*

- For V = V_p(E) of an elliptic curve over an unramified L with good ordinary reduction and V' a sub-line, D_cris(V') is a φ-stable line.

*Uses.* `PadicHodgeTheory:R06.2/admissible-category-tannakian`, `PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful`.

*Source.* CMI Summer School notes on p-adic Hodge theory, text after Theorem 9.1.8, p. 133: “The same filtration arguments as used earlier for DdR show that as an MFφK -valued functor, the faithful covariant functor Dcris on Repcris Qp (GK ) is exact” Exactness in MF^φ_K.

#### Theorem. Crystalline and semistable properties under unramified base change and finite Galois descent

*Node* `PadicHodgeTheory:R06.2/crystalline-semistable-base-change`.

(1) For K' = K̂^{ur}, K'_0 ⊗_{K_0} D_st,K(V) → D_st,K'(V) is an isomorphism in MF^{φ,N}_{K'}, and likewise for D_cris; V is semistable (crystalline) for G_K iff for I_K. (2) For K'/K finite unramified, the same holds; for K'/K finite Galois, D_st,K(V) = D_st,K'(V)^{Gal(K'/K)} and K'_0 ⊗_{K_0} D_st,K(V) ↪ D_st,K'(V), so semistability ascends to finite extensions but does not descend along ramified ones (a ramified finite-order character is crystalline on the kernel but not over K).

*Hypotheses.* V a p-adic representation of G_K.

*Proof outline.*

1. (1) completed unramified descent (R06.1/semilinear-galois-descent (ii)) as in R06.2/de-rham-base-change, the continuity of the G_k-action on the relevant finite-dimensional spaces following from the de Rham case after ⊗K' (B-C Proposition 9.3.1, F-O Proposition 7.16).
2. (2) invariants in stages; B_st^{G_{K'}} = K'_0 (R06.1/period-ring-invariants); injectivity of K'_0 ⊗ D_st,K → D_st,K' by R06.2/admissibility-dimension-bound applied to B_st as a G_{K'}-ring; non-descent: R06.2/potentially-unramified-and-characters.

*Acceptance.*

- Every unramified representation is crystalline (it is trivial on I_K, and D_cris,K̂^{ur} of the trivial representation is full).

*Uses.* `PadicHodgeTheory:R06.1/semilinear-galois-descent`, `PadicHodgeTheory:R06.2/de-rham-base-change`, `PadicHodgeTheory:R06.1/period-ring-invariants`, `PadicHodgeTheory:R06.2/admissibility-dimension-bound`, `PadicHodgeTheory:R06.2/period-functors`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Proposition 9.3.1, p. 146: “In particular, V is semistable as a GK -representation if and only if it is semistable as a representation of GK ′ = IK , and likewise for the crystalline property.” Statement (1).
- Theory of p-adic Galois representations, Proposition 7.16, p. 154: “V is semi-stable as a p-adic representation of GK if and only if it is semi-stable as a p-adic representation of IK .” Same.

#### Lemma. For k algebraically closed, w ↦ σ(w)/w is surjective on W(k)^×

*Node* `PadicHodgeTheory:R06.2/frobenius-twisted-units-surjective`.

If k is an algebraically closed field of characteristic p, every u ∈ W(k)^× has the form σ(w)/w with w ∈ W(k)^×; equivalently every rank-one isocrystal over W(k)[1/p] with unit Frobenius has a φ-fixed basis vector.

*Hypotheses.* k algebraically closed (Lang's theorem for the Witt unit groups).

*Proof outline.*

1. Mathlib's WittVector.exists_frobenius_solution_fractionRing gives, for a = u^{-1} ≠ 0, some b ≠ 0 in K_0 and m ∈ Z with φ(b)·a = p^m b; comparing p-adic valuations (v(φ(b)) = v(b), v(a) = 0) forces m = 0, and b = p^j w with w a unit gives σ(w)/w = a^{-1} = u.
2. Alternatively by successive approximation: x ↦ x^{p−1} is surjective on k^× and x ↦ x^p − x on k (B-C Lemma 9.3.3).

*Acceptance.*

- u = −1 ∈ W(F̄_p)^×: there is w with σ(w) = −w.

*Uses.* `mathlib:WittVector.exists_frobenius_solution_fractionRing`, `mathlib:WittVector.isocrystal_classification`.

*Source.* CMI Summer School notes on p-adic Hodge theory, Lemma 9.3.3, p. 147: “The map W(k)× → W(k)× defined by w 7→ σ(w)/w is surjective” The statement.

#### Lemma. D_cris of Tate twists and of unramified representations

*Node* `PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified`.

(1) D_cris(Q_p(n)) = K_0t^{−n} ⊗ e_n ≅ K_0[0]⟨n⟩ (φ = p^{−n}σ, jump at −n), so Q_p(n) is crystalline and D_cris(V(n)) ≅ D_cris(V)⟨n⟩. (2) Every unramified representation V of G_K is crystalline, D_cris(V) = (K̂_0^{ur} ⊗ V)^{G_K} with trivial filtration (single jump 0) and φ of slope 0 (unit-root); D_cris induces an equivalence between unramified representations and weakly admissible filtered φ-modules with trivial filtration (equivalently φ-modules over K_0 with a φ-stable W(k)-lattice on which φ is bijective). (3) For an unramified character η: G_K → Z_p^×, D_cris(Q_p(η)) = K_0 e with φe = λe, λ ∈ W(k)^× the parameter of η^{-1} under W(k)^×/℘(W(k)^×) ≅ Hom(G_k, Z_p^×).

*Hypotheses.* V unramified: I_K acts trivially.

*Proof outline.*

1. (1) R06.2/ddr-of-tate-twists with t ∈ B_cris^×, and tensor compatibility.
2. (2) K̂_0^{ur} = W(k̄)[1/p] ⊆ B_cris^+ is G_K-stable with G_K acting through G_k; (K̂_0^{ur} ⊗ V)^{G_K} has dimension dim V by completed unramified descent (R06.1/semilinear-galois-descent (ii)); it lies in Fil^0 ∖ Fil^1 and φ has slope 0. The equivalence: F-O Proposition 7.14 using R06.2/frobenius-twisted-units-surjective.
3. (3) B-C Lemma 8.3.3 (their covariant statement: D_cris(Q_p(η)) = D_{η^{−1}}).

*Acceptance.*

- The unramified character of G_{Q_5} with η(Frob) = 2: D_cris is K_0e with φe = λe, v_5(λ) = 0, t_H = t_N = 0 (PARI: v_5(2) = 0).

*Uses.* `PadicHodgeTheory:R06.2/ddr-of-tate-twists`, `PadicHodgeTheory:R06.1/semilinear-galois-descent`, `PadicHodgeTheory:R06.2/frobenius-twisted-units-surjective`, `PadicHodgeTheory:R06.2/rank-one-filtered-modules`, `PadicHodgeTheory:R06.2/dcris-dst-filtered-phi-n-modules`, `PadicHodgeTheory:R06.1/crystalline-period-ring`.

*Sources.*

- Theory of p-adic Galois representations, Proposition 7.14, p. 153: “Any unramified p-adic representation V of GK is crys- talline and Dst induces an equivalence between Repur Qp (GK ), unramified p- adic representations of GK (equivalently RepQp (Gk )) and admissible filtered (ϕ, N )-modules with trivial filtration” Statement (2).
- CMI Summer School notes on p-adic Hodge theory, Lemma 8.3.3, p. 118: “In terms of the covariant Fontaine functor, Dcris (Qp (η)) = Dη−1 .” Statement (3).

#### Theorem. Representations with open kernel and crystalline characters

*Node* `PadicHodgeTheory:R06.2/potentially-unramified-and-characters`.

(1) If ρ: G_K → GL(V) has finite image on I_K then V is de Rham with all Hodge–Tate weights 0; V is semistable iff crystalline iff unramified. (2) A continuous character η: G_K → Q_p^× is semistable iff crystalline iff η = χ^iη_0 with i ∈ Z and η_0 unramified. (3) Every 1-dimensional weakly admissible filtered (φ, N)-module over K is D_cris of such a character (so Colmez–Fontaine holds in rank one).

*Hypotheses.* V a p-adic representation of G_K.

*Proof outline.*

1. (1) By R06.2/crystalline-semistable-base-change reduce to k algebraically closed (G_K = I_K); if V is semistable with kernel G_L open, B_st^{G_L} = L_0 = K_0 gives D_st(V) = K_0 ⊗ V^{Gal(L/K)}, and dimension forces V = V^{Gal(L/K)} (B-C Corollary 9.3.2, F-O Proposition 7.17).
2. (2) A semistable η is Hodge–Tate of some weight i; twist by Q_p(−i) and apply (1) (B-C Corollary 9.3.2, F-O Proposition 7.20).
3. (3) By R06.2/rank-one-filtered-modules, a weakly admissible D of rank one has φe = λe with v_p(λ) = r = t_H(D); the covariant twist D⟨r⟩ has jump 0 and Frobenius p^{−r}λ, a unit, so it is D_cris(Q_p(η)) for an unramified η (R06.2/dcris-of-tate-twists-and-unramified), and D ≅ D⟨r⟩⟨−r⟩ ≅ D_cris(Q_p(η)(−r)), a crystalline character of Hodge–Tate weight −r.

*Acceptance.*

- A ramified quadratic character of G_{Q_p} is de Rham but not semistable.
- χ^2·η_0 (η_0 unramified) is crystalline with Hodge–Tate weight 2.

*Uses.* `PadicHodgeTheory:R06.2/crystalline-semistable-base-change`, `PadicHodgeTheory:R06.2/hodge-tate-characters-are-de-rham`, `PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified`, `PadicHodgeTheory:R06.2/rank-one-filtered-modules`, `PadicHodgeTheory:R06.1/period-ring-invariants`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Corollary 9.3.2, pp. 146–147: “If ρ : GK → GL(V ) is a p-adic representation with open kernel then ρ is semistable if and only if it is crystalline if and only if it is unramified.” Statements (1)–(2).
- CMI Summer School notes on p-adic Hodge theory, Proposition 8.3.4, p. 118: “The characters arising in this way are precisely the Tate twists of the Z× p -valued unramified characters of GK .” Statement (3) (for the contravariant functor; covariant by duality).

#### Theorem. Coefficients: E-linear representations and base change of coefficients

*Node* `PadicHodgeTheory:R06.2/coefficient-field-base-change`.

Let E/Q_p be finite and V a finite-dimensional E-vector space with a continuous E-linear G_K-action. (1) D_B(V) = (B ⊗_{Q_p} V)^{G_K} is a B^{G_K} ⊗_{Q_p} E-module, and V is B-admissible as a Q_p-representation iff dim_{B^{G_K}} D_B(V) = [E:Q_p]dim_E V; for B = B_dR and B_cris, B_st the filtration and φ, N are E-linear. (2) For E'/E finite, D_B(E' ⊗_E V) ≅ E' ⊗_E D_B(V) compatibly with all structures; hence V is B-admissible iff E' ⊗_E V is. (3) If V is de Rham (resp. crystalline, semistable), D_dR(V) is a free K ⊗_{Q_p} E-module of rank dim_E V (resp. D_cris(V), D_st(V) free over K_0 ⊗_{Q_p} E).

*Hypotheses.* E/Q_p finite; E acts on V commuting with G_K.

*Proof outline.*

1. (1) E acts on B ⊗_{Q_p} V through V, commuting with G_K; admissibility is a Q_p-dimension statement.
2. (2) E' is a finite free E-module, so (B ⊗_{Q_p} (E' ⊗_E V))^{G_K} = E' ⊗_E (B ⊗ V)^{G_K} (invariants commute with finite free base change of the coefficients, G_K acting trivially on E').
3. (3) After enlarging E to contain the Galois closure of K (by (2)), K ⊗_{Q_p} E ≅ ⊕_τ E splits along the embeddings τ: K → E and D_dR(V) = ⊕_τ D_dR(V)_τ; the comparison isomorphism B_dR ⊗_K D_dR(V) ≅ B_dR ⊗_{Q_p} V is E-linear and B_dR ⊗_{Q_p} V is free over B_dR ⊗_{Q_p} E, which forces each τ-component to have dimension dim_E V (B-C Exercise 6.4.3 for the rank-one case).

*Acceptance.*

- For E = K = Q_{p^2} and V = Q_{p^2}(η) with η unramified, D_cris(V) is free of rank one over Q_{p^2} ⊗ Q_{p^2} ≅ Q_{p^2} × Q_{p^2}.

*Uses.* `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.2/admissible-representations`, `PadicHodgeTheory:R06.2/admissibility-dimension-bound`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Exercise 6.4.3, pp. 82–83: “Although p-adic Hodge theory addresses finite-dimensional Qp -linear repre- sentations, in practice one often has to work with continuous linear representations of GK on finite-dimensional vector spaces V over a finite extension E/Qp .” The E-coefficient formalism (stated as an exercise; the node gives the proof).
- Theory of p-adic Galois representations, §7.2.8, Definition 7.23, p. 158: “A Qpr -representation of GK is a finite dimensional Qpr -” Semilinear coefficient extensions in F-O.

#### Lemma. Transport of structure for period functors along field isomorphisms

*Node* `PadicHodgeTheory:R06.2/period-functors-transport-of-structure`.

Let τ: K̄ → K̄' be a field isomorphism carrying K onto K' (K, K' finite over Q_p), and let V, V' be p-adic representations of G_K, G_{K'} with a Q_p-linear isomorphism f: V → V' such that f(gv) = (τgτ^{-1})f(v). Then τ extends uniquely to an isometric isomorphism C_K → C_{K'} and induces isomorphisms of all period rings (B_HT, B_dR^+, B_dR, A_cris, B_cris, B_st with t_{τζ} ↦ …, compatible with θ, filtrations, φ, N and the Galois actions), and D_B(V) ≅ D_B(V') τ-semilinearly (over τ|_K or τ|_{K_0}), compatibly with all structures; in particular V is crystalline iff V' is, and D_cris(V) ≅ τ^*D_cris(V') in MF^φ, i.e. the pair (K, V) ↦ D_cris,K(V) is functorial for isomorphisms of pairs.

*Hypotheses.* τ an isomorphism of fields (automatically isometric for the unique extensions of |·|_p); compatible choices of p-power roots of unity via τ.

*Proof outline.*

1. All period rings are built functorially from the valued field C (R06.1/de-rham-period-ring, R06.1/crystalline-period-ring, R06.1/semistable-period-ring); τ is an isometry (the p-adic absolute value on a finite extension is unique), so it extends to completions, tilts, Witt vectors and completions along ker θ; Iwasawa's normalisation log p = 0 is preserved.
2. Invariants: τ ⊗ f maps (B ⊗ V)^{G_K} onto (B' ⊗ V')^{G_{K'}} since it intertwines the actions.

*Acceptance.*

- For τ ∈ Gal(K̄/Q_p) and V' = τ-conjugate representation of G_{τK}, D_cris(V) and D_cris(V') have the same slopes and Hodge numbers.

*Uses.* `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.1/galois-action-on-cp`, `PadicHodgeTheory:R06.1/de-rham-period-ring`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:R06.1/semistable-period-ring`.

*Source.* CMI Summer School notes on p-adic Hodge theory, §4.4, paragraph after Theorem 4.4.13, p. 64: “Hence, if K → K ′ is a map of p-adic fields and we pick a compatible embedding K → K ′ of algebraic closures then the induced map OCK → OCK′ induces a” Functoriality of the period rings in C, the basis of transport of structure.

#### Theorem. Semistable ⇒ D_st(V) weakly admissible (admissible ⇒ weakly admissible)

*Node* `PadicHodgeTheory:R06.2/admissible-implies-weakly-admissible`.

If V is a semistable p-adic representation of G_K then D_st(V) ∈ MF^{φ,N}_K is weakly admissible; if V is crystalline, D_cris(V) ∈ MF^φ_K is weakly admissible. Hence D_st: Rep^{st} → MF^{φ,N,wa}_K and D_cris: Rep^{cris} → MF^{φ,wa}_K are fully faithful exact tensor functors (an object of their essential image is called admissible).

*Hypotheses.* V semistable (resp. crystalline); K/Q_p finite.

*Proof outline.*

1. Reduce to k algebraically closed (weak admissibility and semistability are insensitive to K → K̂^{ur}: R06.2/weak-admissibility, R06.2/crystalline-semistable-base-change).
2. Reduce to subobjects of dimension 1 by passing to ∧^{d'}V (semistable) and the line det D' ⊆ ∧^{d'}D (t_H and t_N are determinantal).
3. For D = D_st(V) of dimension 1, V = Q_p(n)·(unramified) = Q_p(n) (k closed), and t_H = t_N = −n (R06.2/dcris-of-tate-twists-and-unramified).
4. For a line D' = K_0e' ⊆ D: φe' = λe', N e' = 0; write e' = Σ b_i ⊗ v_i; then φ(b_i) = λb_i, N(b_i) = 0 so b_i ∈ B_cris, and s := t_H(D') is the largest s with all b_i ∈ Fil^s. It suffices: b ∈ Fil^{n+1}B_cris with φ(b) = λb, n = v_p(λ), forces b = 0. Divide by t^n to reach n = 0, λ = u ∈ W(k)^×; by R06.2/frobenius-twisted-units-surjective u = σ(u')/u' and b/u' ∈ (Fil^1B_cris)^{φ=1} = 0 by the fundamental exact sequence (B-C Theorem 9.3.4).

*Acceptance.*

- Q_p(n): D_cris = K_0[0]⟨n⟩, t_H = t_N = −n.
- Elliptic curve with good reduction (given the crystalline comparison of CohomologyComparisons CP.2 / PadicHodgeTheory R06.5, which identifies D_cris(H^1_ét(E_{K̄}, Q_p)) with H^1_cris(E_0)[1/p]): for E: y^2 = x^3 − x (conductor 32), PARI gives a_5 = −2 (ordinary; Frobenius characteristic polynomial T^2 + 2T + 5, Newton slopes 0, 1) and a_3 = 0 (supersingular; T^2 + 3, slopes 1/2, 1/2); in both cases t_N = v_p(det φ) = v_p(p) = 1 = t_H (Hodge jumps 0, 1), and weak admissibility forces, in the ordinary case, the unit-root line to be transverse to Fil^1. For the covariant D_cris(V_p(E)) = D_cris(H^1)⟨1⟩ the polynomial is T^2 − (a_p/p)T + 1/p (PARI: T^2 + (2/5)T + 1/5 at p = 5, slopes 0, −1).
- MordellLawrenceVenkatesh LV.6/LV.7: for crystalline V with F unramified, t_N(D') ≥ t_H(D') for φ-stable D' ⊆ D_cris(V) with the induced filtration.

*Uses.* `PadicHodgeTheory:R06.2/weak-admissibility`, `PadicHodgeTheory:R06.2/crystalline-semistable-base-change`, `PadicHodgeTheory:R06.2/admissible-category-tannakian`, `PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified`, `PadicHodgeTheory:R06.2/frobenius-twisted-units-surjective`, `PadicHodgeTheory:R06.1/fundamental-exact-sequence`, `PadicHodgeTheory:R06.2/dcris-dst-filtered-phi-n-modules`, `PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful`, `PadicHodgeTheory:R06.2/potentially-unramified-and-characters`.

*Planet:* Admissible implies weakly admissible.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Theorem 9.3.4 with proof, pp. 147–148: “If V ∈ Repst Qp (GK ) then Dst (V ) ∈ MFK is weakly admissible.” The statement and proof.
- Theory of p-adic Galois representations, §7.2.7, Proposition A1, p. 157: “Let V be a semi-stable p-adic representation of GK . We want to prove that” F-O's proof ('admissible' in F-O = weakly admissible).
- CMI Summer School notes on p-adic Hodge theory, Example 8.1.10, p. 107: “In particular, for all E we see that PN (D) lies on or above PH (D) and their right endpoints coincide.” The elliptic-curve acceptance example.

#### Lemma. V_st of a rank-one filtered (φ, N)-module

*Node* `PadicHodgeTheory:R06.2/vst-rank-one`.

Let D ∈ MF^{φ,N}_K have dim_{K_0} D = 1. Then V_st(D) is 1-dimensional if t_H(D) = t_N(D) (weakly admissible), 0 if t_H(D) < t_N(D), and infinite-dimensional over Q_p if t_H(D) > t_N(D).

*Hypotheses.* dim D = 1; k algebraically closed after base change (V_st commutes with K → K̂^{ur} on G_K-invariants).

*Proof outline.*

1. N = 0; write φd = λd, λ = p^mu (m = t_N, u ∈ W(k)^×); x = b ⊗ d ∈ V_st(D) iff b ∈ Fil^{−t_H}B_cris and φ(b) = b/λ. With b' = t^{t_H}b and u = σ(w)/w (R06.2/frobenius-twisted-units-surjective), V_st(D) ≅ {b'' ∈ Fil^0B_cris : φ(b'') = p^{t_H − t_N}b''}.
2. r := t_H − t_N: r = 0 gives (Fil^0B_cris)^{φ=1} = Q_p; r < 0 gives b''/t^r ∈ (Fil^1B_cris)^{φ=1} = 0; r > 0 gives the infinite-dimensional (Fil^{−r}B_cris)^{φ=1} by the Fil^{−r} variant of the fundamental exact sequence (B-C Lemma 9.3.7).

*Acceptance.*

- D = K_0e with φe = e and jump 1: t_H = 1 > 0 = t_N, V_st(D) is infinite-dimensional.

*Uses.* `PadicHodgeTheory:R06.1/fundamental-exact-sequence`, `PadicHodgeTheory:R06.2/frobenius-twisted-units-surjective`, `PadicHodgeTheory:R06.2/rank-one-filtered-modules`, `PadicHodgeTheory:R06.2/period-functors`.

*Source.* CMI Summer School notes on p-adic Hodge theory, Lemma 9.3.7, p. 150: “Vst (D) is 1-dimensional when D is weakly admissible (i.e., tH (D) = tN (D)), it vanishes when tH (D) < tN (D), and it is infinite-dimensional when tH (D) > tN (D).” The statement.

#### Lemma. Finite-dimensional G_K-stable subspaces of B_st^n are continuous representations

*Node* `PadicHodgeTheory:R06.2/vst-continuity`.

For n ≥ 1, every G_K-stable finite-dimensional Q_p-subspace V ⊆ B_st^n (in particular every finite-dimensional G_K-stable subspace of V_st(D) ⊆ B_st ⊗_{K_0} D) is a continuous p-adic representation of G_K for its natural topology.

*Hypotheses.* B_st = B_cris[u] with g(u) = u + c(g)t.

*Proof outline.*

1. V lies in a finite free B_cris-submodule B_cris[u]^n_{<d}; bounded t-denominators let one assume V is spanned by Λ = V ∩ A_cris[u]^n_{<d}, a Z_p-lattice since A_cris is p-adically separated.
2. Λ_r = Λ ∩ p^rA_cris[u]^n_{<d} cut out the p-adic topology (Chevalley); on Λ/Λ_r ⊆ (A_cris/p^r)[u]^n_{<d} every orbit has open stabiliser after passing to the finite extension killing c mod p^r, by R06.1/galois-action-on-acris-continuous (B-C Proposition 9.3.6).

*Acceptance.*

- The span of t and u in B_st is the continuous representation with matrix [[χ, c], [0, 1]] (the Tate module of the Tate curve for q = p).

*Uses.* `PadicHodgeTheory:R06.1/galois-action-on-acris-continuous`, `PadicHodgeTheory:R06.1/semistable-period-ring`, `PadicHodgeTheory:R06.1/crystalline-period-ring`.

*Source.* CMI Summer School notes on p-adic Hodge theory, Proposition 9.3.6, p. 149: “For any n ⩾ 1, any Qp [GK ]-submodule V of Bst with finite Qp - dimension has continuous GK -action relative to its natural p-adic topology.” The statement.

#### Theorem. The Colmez–Fontaine criterion: V_st(D) is semistable of dimension ≤ dim D, and D is admissible iff equality holds

*Node* `PadicHodgeTheory:R06.2/colmez-fontaine-bigness-criterion`.

Let D ∈ MF^{φ,N}_K be weakly admissible. Then V := V_st(D) is finite-dimensional over Q_p with dim V ≤ dim_{K_0} D and is a semistable representation; D' := D_st(V) is naturally a weakly admissible subobject of D; D is admissible (≅ D_st of a semistable representation) iff dim_{Q_p} V_st(D) = dim_{K_0} D iff D' = D, and then δ(D): (B_st ⊗ D)^{N=0,φ=1} → (B_dR ⊗_K D_K)/Fil^0 is surjective. If D is a simple object of MF^{φ,N,wa}_K, D is admissible iff V_st(D) ≠ 0. The same holds for MF^φ_K, V_cris and crystalline representations.

*Hypotheses.* D weakly admissible; C_st = Frac(B_st) with (C_st)^{G_K} = K_0.

*Proof outline.*

1. The Q_p-span V of V_st(D) spans a G_K-stable C_st-subspace V' ⊆ C_st ⊗ D of dimension r ≤ s = dim D; G_K-invariance and C_st^{G_K} = K_0 (R06.1/period-ring-invariants) descend V' to a K_0-subspace D' ⊆ D (Grassmannian or basis argument), φ- and N-stable, with V ⊆ B_st ⊗ D'.
2. A C_st-basis v_1, …, v_r of V' inside V gives v_1 ∧ … ∧ v_r = b·d_1 ∧ … ∧ d_r ≠ 0 in V_st(∧^rD'), so t_H(D') ≥ t_N(D') by R06.2/vst-rank-one; weak admissibility gives equality, so D' is weakly admissible and V_st(∧^rD') is a line; wedge arguments show the v_i span V over Q_p: dim V = r.
3. Continuity by R06.2/vst-continuity; Q_pb is G_K-stable so b ∈ B_st^× by regularity (R06.2/period-rings-are-regular), giving B_st ⊗ V ≅ B_st ⊗ D', so D_st(V) = D' and V is semistable; D_st(V) → D' is a bijective morphism of weakly admissible objects, hence an isomorphism (R06.2/weakly-admissible-category-abelian, R06.2/admissible-implies-weakly-admissible).
4. Surjectivity of δ(D) for admissible D reduces to B_cris^{φ=1} → B_dR/B_dR^+ surjective (R06.1/fundamental-exact-sequence) (B-C Proposition 9.3.9; its footnote records that the converse direction — finiteness of V_st(D) and surjectivity of δ(D) imply weak admissibility — is not included).

*Acceptance.*

- Rank one: for weakly admissible D of dimension 1, V_st(D) is a line and D is admissible (R06.2/potentially-unramified-and-characters (3)).
- Berger's non-weakly-admissible D (φe = e, φf = pf, Fil^1 = Q_p e) is excluded from the hypothesis; there V_st(D) ⊇ V_st(Q_p e), which is infinite-dimensional (t_H = 1 > 0 = t_N).

*Uses.* `PadicHodgeTheory:R06.2/vst-rank-one`, `PadicHodgeTheory:R06.2/vst-continuity`, `PadicHodgeTheory:R06.2/period-rings-are-regular`, `PadicHodgeTheory:R06.2/weakly-admissible-category-abelian`, `PadicHodgeTheory:R06.2/admissible-implies-weakly-admissible`, `PadicHodgeTheory:R06.1/period-ring-invariants`, `PadicHodgeTheory:R06.1/fundamental-exact-sequence`, `PadicHodgeTheory:R06.2/weak-admissibility`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Proposition 9.3.9 (Colmez–Fontaine), p. 151: “The vector space Vst (D) is finite-dimensional over Qp with dimension at most dimK0 (D), and it is semistable as a p-adic representation of GK .” The statement; the proof follows on pp. 151–153.
- CMI Summer School notes on p-adic Hodge theory, footnote 2 to Proposition 9.3.9, p. 151: “Should include proof of converse: if V st (D) is finite-dimensional then it is semistable using [14, Prop. 4.5],” The omitted converse, recorded as a source gap.

### What is missing

- Coverage status: `partial`. The regular-ring formalism, D_HT/D_dR/D_cris/D_st with comparison maps, dimension bounds, exactness and tensor/dual/determinant compatibility, descent under finite extension and K̂^{ur}, induction, coefficient base change, transport of structure, Tate's C(ψ) theorems and the Hodge–Tate decomposition, Hodge–Tate/de Rham/crystalline/semistable implications, filtered (φ,N)-modules with and without descent data, t_H, t_N, slope decomposition, weak admissibility, the abelian category of weakly admissible modules, admissible ⇒ weakly admissible, the Colmez–Fontaine bigness criterion and the Colmez–Fontaine statement are planned with full proofs from Brinon–Conrad and Fontaine–Ouyang.
- Proof of the Colmez–Fontaine theorem (weakly admissible ⇒ admissible): defined here as a proposition; its proof is proposed for R06.3 (restructure entry) because it needs P7, PG.1–PG.2, RD.1–RD.2 and Berger 2002.
- The 2-dimensional Hodge–Tate but not de Rham example (non-split 0 → Q_p → V → Q_p(1) → 0, Brinon–Conrad Example 6.3.5) is an acceptance item of R06.3: its only public proof uses de Rham ⇒ potentially semistable. (No Hodge–Tate character is non-de Rham: R06.2/hodge-tate-characters-are-de-rham.)
- The converse half of the Colmez–Fontaine criterion (finite-dimensional V_st(D) with surjective δ(D) ⇒ weakly admissible), omitted by Brinon–Conrad (footnote to Proposition 9.3.9), is not planned; no consumer needs it.
- **Gap: Colmez–Fontaine theorem (weakly admissible ⇒ admissible) is not provable inside R06.2.** R06.2 defines the proposition and proves its reduction (R06.2/colmez-fontaine-bigness-criterion) and the rank-one case, but the proof (Berger 2008, Théorème V.2.1) needs P7's Robba rings B†_rig,K, Kedlaya's slope filtration (PadicDifferentialEquationsAndRigidCohomology:RD.1), the local monodromy theorem for differential equations (RD.2, through Berger's Corollaire III.2.5), PG.1–PG.2 and Berger 2002 Théorème 3.6 (D_st(V) = (B†_rig,L[ℓ_X, 1/t] ⊗ D†_rig(V))^{Γ_L}), all of which come after R06.2 (the stage graph has R06.2 → P7). NEXT ACTION: part D (R06.3) or the lead adopts the restructure entry 'Colmez–Fontaine proof in R06.3' and plans the proof nodes listed there; alternatively Colmez 2002 §11.6 gives a proof via Banach–Colmez spaces (VectorBundlesAndIsocrystals VB3 owns Banach–Colmez spaces) that does not need the monodromy theorem. Needed by `PadicHodgeTheory:R06.2/colmez-fontaine-theorem`.
- **Request to `ArithmeticGaloisRepresentations:R01.1`.** Continuous p-adic representations of profinite groups on finite-dimensional Q_p- (and E-) vector spaces with restriction to open subgroups, induction Ind_{G_{F'}}^{G_F} with its topology and Frobenius reciprocity/Shapiro isomorphism for invariants, duals, tensor products, exterior powers and twists by characters. Needed by `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.2/induction-and-restriction-of-scalars`.

## P7 Robba analytic foundations and representation-theoretic handoffs

This layer covers Berger's Robba ring of a $p$-adic field and its identification with a Robba ring over the maximal unramified subfield of $K_\infty$, which the rigid-cohomology packet requested. From there it builds Berger's dictionary:

- the extended rings $\tilde B^\dagger_{\mathrm{rig}}$ and $\tilde B^\dagger_{\log}$, with the Galois action and the localisation maps $\iota_n$;
- Frobenius regularisation and the decompletion operators;
- the recovery of $D_{\mathrm{cris}}$ and $D_{\mathrm{st}}$ from the Robba realisation, and the comparison isomorphisms;
- the connection $\nabla_V$ and the criterion "semistable over some $K_n$ ⇔ unipotent";
- Sen's module, Fontaine's $D_{\mathrm{dif}}$ and $D_{\mathrm{dR}}$ via $\iota_n$.

The comparison of Wach modules with $D_{\mathrm{cris}}$ and with Fontaine–Laffaille lattices comes last. Wach modules themselves are imported from PG.6.

These steps were drafted twice, once for P7 and once for the monodromy proof. They are planned once, here, and R06.3 cites them. This needs a stage link P7 → R06.3, which creates no cycle. A restructuring entry proposes dividing P7 into the Robba dictionary and the Wach comparison.

### Objects

#### Construction. Berger's Robba ring B^dagger_{rig,K} of a p-adic field

*Module* `TauCeti/NumberTheory/PadicHodge/Robba/PadicField.lean`. *Node* `PadicHodgeTheory:P7/robba-ring-of-p-adic-field`.

Take from PhiGammaModulesAndIwasawaCohomology:PG.0 the overconvergent field-of-norms rings B^{dagger,r}_K (r >= r(K)) with phi : B^{dagger,r}_K -> B^{dagger,pr}_K, the Gamma_K-action, and an element pi_K of A^{dagger,r(K)}_K lifting a uniformiser of E_K, for which f |-> f(pi_K) identifies B^{dagger,r}_K with the bounded Laurent series in pi_K over F' converging on p^{-1/(e_K r)} <= |X| < 1. Define B^{dagger,r}_{rig,K} as the completion of B^{dagger,r}_K for the Frechet topology of uniform convergence on the compact subannuli of that annulus, and B^dagger_{rig,K} = union over r of B^{dagger,r}_{rig,K}. phi and the Gamma_K-action extend by continuity (phi : B^{dagger,r}_{rig,K} -> B^{dagger,pr}_{rig,K}), commute, and extend those of B^dagger_{rig,F} (P7:annulus-foundations/overconvergent-cyclotomic-rings), so t in B^dagger_{rig,K} with phi(t) = p t and gamma(t) = chi(gamma) t. The derivation partial = (1+pi) d/dpi of B^dagger_{rig,F} extends uniquely to a continuous derivation of B^dagger_{rig,K}, with kernel F'. B^dagger_{log,K} = B^dagger_{rig,K} tensor over B^dagger_{rig,F} of B^dagger_{log,F} = B^dagger_{rig,K}[l], l = log pi, with phi, Gamma_K, N and partial extended.

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt. Berger's radius convention: for r > 0, C[r;1[ = {z : p^{-1/r} <= |z| < 1}; r_n = p^{n-1}(p-1), so that |zeta_{p^n} - 1| = p^{-1/r_n}. The coefficient field is F', not F: Berger 2002 Proposition 1.4 and Proposition 2.31 print F; Berger 2008 Appendix B corrects this (sourceIssues).

*API.*

- `RobbaK.BrigR` (*constructor*) — B^{dagger,r}_{rig,K}, the Frechet completion of B^{dagger,r}_K.
- `RobbaK.Brig` (*constructor*) — B^dagger_{rig,K} = union over r.
- `RobbaK.ofBdag` (*coercion*) — The dense injective map B^{dagger,r}_K -> B^{dagger,r}_{rig,K}.
- `RobbaK.ofBrigF` (*coercion*) — The inclusion B^dagger_{rig,F} -> B^dagger_{rig,K} compatible with phi, Gamma_K, partial.
- `RobbaK.phi` (*constructor*) — phi : B^{dagger,r}_{rig,K} -> B^{dagger,pr}_{rig,K}, continuous extension.
- `RobbaK.gammaAct` (*constructor*) — The continuous Gamma_K-action, commuting with phi.
- `RobbaK.partialOp` (*constructor*) — The unique continuous derivation extending (1+pi) d/dpi.
- `RobbaK.ker_partial` (*characterisation*) — ker partial = F'.
- `RobbaK.tElt` (*data*) — t = log(1+pi) in B^dagger_{rig,K}, phi t = p t, gamma t = chi(gamma) t.
- `RobbaK.LogRing` (*constructor*) — B^dagger_{log,K} = B^dagger_{rig,K}[l] with phi, Gamma_K, N, partial.
- `RobbaK.topology_indep` (*other*) — The Frechet topology does not depend on the choice of pi_K.

*Used by.*

- `PadicDifferentialEquationsAndRigidCohomology:RD.2/berger-form-of-local-monodromy` — B^dagger_{rig,K} with phi and partial is the Robba ring of Berger's Theoreme 5.20
- `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem` — N_dR(V) is a B^dagger_{rig,K}-lattice in D^dagger_rig(V)[1/t]
- Berger 2002, Theorem 3.6 — D^dagger_rig(V) = B^dagger_{rig,K} tensor D^dagger(V)
- Berger 2008, Theoreme A — (phi, Gamma_K)-modules over B^dagger_{rig,K} and filtered (phi, N, G_K)-modules

*Unit tests.* A wrong definition fails one of these.

- `robbaK.test_unramified` (degenerate) — For K = F: B^dagger_{rig,K} = B^dagger_{rig,F} of P7:annulus-foundations.
- `robbaK.test_t` (computation) — t lies in B^dagger_{rig,K}, phi(t) = p t, gamma(t) = chi(gamma) t.
- `robbaK.test_ker_partial` (computation) — The kernel of partial on B^dagger_{rig,K} is F'.
- `robbaK.test_coefficients_Fprime` (non-example) — For p odd, u in Z_p^x a non-square and K = Q_p(sqrt(u p*)) with p* = (-1)^{(p-1)/2} p: K is totally ramified (F = Q_p) but sqrt(u) lies in K_1 (Gauss sums), so F' contains Q_{p^2} and ker partial is not contained in F: a definition with coefficients in F (as printed in Berger 2002) fails.

*Construction.*

1. Topology: transport the Frechet topology of the annulus ring O_{F'}([p^{-1/(e_K r)}, 1)) (P7:annulus-foundations/frechet-topology) along f |-> f(pi_K); another choice pi'_K = g(pi_K) with g a bounded unit series gives the same topology because substitution is continuous (as for cyclotomic-frobenius).
2. phi and gamma are continuous for these topologies (they map compact subannuli into compact subannuli, by the radius statement of cyclotomic-frobenius transported along the finite etale extension B^{dagger,r}_K / B^{dagger,r}_F of PG.0), hence extend to completions.
3. Derivation: B^dagger_K is finite etale over B^dagger_F (PG.0), so partial extends uniquely to B^dagger_K (derivations extend uniquely along etale extensions), then by continuity; kernel F' by Berger 2008 Section I.2.
4. B^dagger_{log,K}: base change of the polynomial ring; log(pi/pi_K^{e_K}) is overconvergent (Berger 2002 Proposition 4.4 proof), so B^dagger_{log,K} = B^dagger_{rig,K}[log pi_K] as well.

*Acceptance.*

- For K = F, pi_K = pi, F' = F and B^dagger_{rig,K} is P7:annulus-foundations/overconvergent-cyclotomic-rings' B^dagger_{rig,F}.

*Uses.* `PhiGammaModulesAndIwasawaCohomology:PG.0`, `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PadicHodgeTheory:P7:annulus-foundations/frechet-topology`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-frobenius`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-gamma-action`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-derivation`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-log-element-t`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-log-robba-ring`, `PadicHodgeTheory:P7:annulus-foundations/robba-ring`.

*Planet:* Robba ring of a p-adic field.

*Sources.*

- Représentations p-adiques et équations différentielles, Section 2.6, p. 27: “de BK pour la topologie de Fréchet.” B^{dagger,r}_{rig,K} is the Frechet completion of B^{dagger,r}_K.
- Représentations p-adiques et équations différentielles, Section 2.6, p. 27: “qui devient la topologie de la convergence sur les couronnes définies par un intervalle compact” The topology is uniform convergence on compact subannuli.
- Équations différentielles p-adiques et (φ,N)-modules filtrés, Section I.2, p. 6: “En particulier ∂(f ) = 0 si et seulement si f ∈ K0′ .” Kernel of partial is K_0' = F'.
- Équations différentielles p-adiques et (φ,N)-modules filtrés, Section I.1, p. 4: “Finalement, K0′ désigne l’extension maximale non-ramifiée de K0 contenue dans K∞ .” Definition of F' = K_0'.
- Errata for my articles, Section 1, The ring B dagger K: “As I am regularly asked for an example where K0′ ̸= F , here is one:” Berger's own example of F' != F, used in the non-example test.

#### Construction. Berger's extended ring B~^dagger_rig with its Galois action

*Module* `TauCeti/NumberTheory/PadicHodge/Robba/Extended.lean`. *Node* `PadicHodgeTheory:P7/extended-robba-ring-with-galois-action`.

Let B~^{dagger,r}_{rig} and B~^dagger_{rig} = union over r be the extended Robba ring of PadicDifferentialEquationsAndRigidCohomology:RD.0/extended-robba-ring for l^alg = C^flat (the completed algebraic closure of k((epsilon - 1)), with valuation v normalised by v(epsilon - 1) = 1, i.e. v = ((p-1)/p) v_E) and O = Z_p: with this normalisation Berger's B~^{dagger,r}_{rig} = B~_{[r, +infinity[} is Kedlaya's Gamma^alg_{an,1/r}. Then: (a) G_F acts continuously on B~^dagger_{rig} by ring automorphisms preserving each B~^{dagger,r}_{rig}, extending its action on W(C^flat)[1/p] through the tilt; (b) the Witt vector Frobenius extends to bijections phi : B~^{dagger,r}_{rig} -> B~^{dagger,pr}_{rig} commuting with G_F; (c) B~^+_{rig} = intersection over n of phi^n(B^+_cris) is a G_F- and phi-stable subring of B~^dagger_{rig} (Berger 2002 Section 1.2 uses B^+_max; the intersection is the same); (d) PG.0's embedding B^{dagger,r}_K in B~^{dagger,r} = W(C^flat)[1/p] cap B~^{dagger,r}_{rig} is H_K-invariant, phi- and Gamma_K-equivariant, and B^dagger_F contains pi = [epsilon] - 1; (e) B~^dagger_{log} = B~^dagger_{rig}[X] with phi(X) = p X, g(X) = X + log([g(epsilon - 1)/(epsilon - 1)]) (g in G_F) and N = -(p/(p-1)) d/dX, and log(pi) := X + log(pi/[epsilon - 1]) lies in B~^dagger_{log}, the series log(pi/[epsilon - 1]) converging in B~^{dagger,r}_{rig} for r large.

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt. Radius dictionary: Berger's condition v_E(x_k) + (p r/(p-1)) k -> infinity on Teichmuller coordinates of x = sum p^k [x_k] is Kedlaya's v_{k,s} -> infinity with s = 1/r once v is normalised by v(epsilon - 1) = 1 (proof step 1). G_F acts on C^flat = lim_{x |-> x^p} O_C [1/epsilon-bar] through its action on O_C (PerfectoidSpaces:P1/tilt-of-perfectoid-field).

*API.*

- `ExtRobba.BrigR` (*constructor*) — B~^{dagger,r}_{rig}: RD.0's Gamma^{C^flat}_{an,1/r}.
- `ExtRobba.galoisAct` (*constructor*) — The continuous G_F-action by ring automorphisms.
- `ExtRobba.phi` (*constructor*) — The bijection phi : B~^{dagger,r}_{rig} -> B~^{dagger,pr}_{rig}.
- `ExtRobba.phi_galoisAct` (*relation*) — phi commutes with G_F.
- `ExtRobba.plus` (*constructor*) — B~^+_{rig} = intersection of phi^n(B^+_cris), a subring of B~^dagger_{rig}.
- `ExtRobba.ofBdagK` (*coercion*) — The embedding B^{dagger,r}_K -> (B~^{dagger,r}_{rig})^{H_K}.
- `ExtRobba.LogRing` (*constructor*) — B~^dagger_{log} = B~^dagger_{rig}[X] with phi(X) = pX, Galois action and N = -(p/(p-1)) d/dX.
- `ExtRobba.logPi` (*data*) — log(pi) = X + log(pi/[epsilon - 1]) in B~^dagger_{log}.
- `ExtRobba.radius_dictionary` (*compatibility*) — Berger's B~^{dagger,r}_{rig} equals RD.0's Gamma^{C^flat}_{an,1/r} for v(epsilon - 1) = 1.

*Used by.*

- Berger 2002, Sections 3.1-3.2 — periods of semistable representations live in B~^dagger_{log}[1/t]
- `PadicHodgeTheory:P7/robba-realisation-comparison` — B~^dagger_{rig} tensor D^dagger_rig(V) = B~^dagger_{rig} tensor V
- `PadicHodgeTheory:P7/berger-dcris-dst-dictionary` — decompletion from B~^dagger_{rig,K} to B^dagger_{rig,K}
- Berger 2002, Théorème 3.6 and Propositions 3.2–3.7 — the periods of V in B̃†_log are regularised by φ and decompleted by R_k
- Berger 2008, §V.3 — reconstruction of D†(V) from D_st(V) inside B̃†_rig
- `PadicDifferentialEquationsAndRigidCohomology:RD.0/extended-robba-ring` — Kedlaya's R^alg for ℓ^alg = C^♭ is the same ring (compatibility test below)
- `PadicHodgeTheory:P7/extended-localisation-maps` — source of the maps ι_n into B_dR^+

*Unit tests.* A wrong definition fails one of these.

- `extRobba.test_t` (computation) — t = log[epsilon] lies in B~^+_{rig}, with phi(t) = p t and g(t) = chi(g) t.
- `extRobba.test_pi` (computation) — pi = [epsilon] - 1 lies in B~^{dagger,r}_{rig} and is a unit there.
- `extRobba.test_phi_bijective` (non-example) — phi is bijective on B~^dagger_{rig} but not on B^dagger_{rig,F} (pi is not in phi(B^dagger_{rig,F})).
- `extRobba.test_invariants` (degenerate) — The G_F-invariants of B~^+_{rig} are F.

*Construction.*

1. Dictionary: for x = sum p^k [x_k], Berger's B~^{dagger,r} condition is v_E(x_k) + (pr/(p-1)) k -> infinity; Kedlaya's W_s condition is s v(x_k) + k -> infinity with v = ((p-1)/p) v_E, i.e. v_E(x_k) + (p/((p-1)s)) k -> infinity: the two agree for s = 1/r. The Frechet completions agree because both use the Gauss-type norms on closed intervals (Berger Section 2.1 V_I, Kedlaya w_s).
2. (a) A continuous isometric automorphism of C^flat acts on W(C^flat) preserving the Teichmuller coordinates' valuations, hence all w_s, hence extends to each completion; continuity of the G_F-action on C^flat gives continuity.
3. (b) phi multiplies v by p on Teichmuller coordinates, so it maps W_s onto W_{s/p}, i.e. B~^{dagger,r} onto B~^{dagger,pr}.
4. (c) Berger 2002 Section 1.2 and Lemme 2.18 (B~^+_{rig} contained in B~^{dagger,r}_{rig} through its image in B~_{[0,r_n]}); B^+_cris and B^+_max have the same intersection of phi-iterates (R06.1/crystalline-period-ring).
5. (d) From PG.0 (B^dagger_K = (B^dagger)^{H_K}, the Witt-vector realisation of the cyclotomic rings).
6. (e) Berger 2002 Section 2.4 (Propositions 2.23-2.24) and the normalisation of N from Berger 2008 Appendix B; pi/[epsilon - 1] lies in 1 + (p/[epsilon - 1]) A~^+ because [a + b] - [a] - [b] lies in p W.

*Acceptance.*

- t = log[epsilon] lies in B~^+_{rig}, phi(t) = p t and g(t) = chi(g) t for g in G_F.
- t = log[ε] ∈ B̃+_rig with φ(t) = pt and g(t) = χ(g)t.
- (B̃†_rig)^{φ=1} = Q_p (Berger §5.1, from Proposition 3.2 and (B̃+_rig)^{φ=1} = Q_p).
- For r = s, Ã_[r;r]/p = Ẽ+/(π̄^r)[X, X^{−1}] (Berger Lemma 2.9).

*Uses.* `PadicDifferentialEquationsAndRigidCohomology:RD.0/extended-robba-ring`, `PerfectoidSpaces:P1/tilt-of-perfectoid-field`, `PhiGammaModulesAndIwasawaCohomology:PG.0`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:R06.1/fontaine-element-t`, `mathlib:WittVector`, `mathlib:WittVector.frobenius`, `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PhiGammaModulesAndIwasawaCohomology:PG.2`.

*Sources.*

- Représentations p-adiques et équations différentielles, Définition 2.16, p. 21: “de la topologie de Fréchet” Definition 2.16: B~^{dagger,r}_{rig} = B~_{[r;+infinity[} with its Frechet topology.
- Représentations p-adiques et équations différentielles, Section 1.2, p. 10: “La notation s’explique par le fait que l’on a” B~^+_{rig} = intersection of phi^n(B^+_max).
- Représentations p-adiques et équations différentielles, Section 2.4, p. 24: “c’est-à-dire que N = −d/d log(π).” The monodromy operator on B~^dagger_{log} (normalisation corrected in Berger 2008 Appendix B).
- An introduction to the theory of p-adic representations, VI.1, p. 38: “All the rings with tildes (f) also have versions without a tilde” The tilde rings are the perfected, completed versions.
- Représentations p-adiques et équations différentielles, §2, introduction, p. 13: “Afin de faire le lien entre représentations p-adiques et équations différentielles” Motivation and definition of B̃†_rig = ∪_r ∩_{s≥r} Ã+{p/[π]^r, [π]^s/p}[1/p] (display following this sentence).
- Représentations p-adiques et équations différentielles, Définition 2.16 and Proposition 2.19, pp. 21–22: “Fréchet et contient B comme sous-anneau dense” Fréchet completeness of B̃†,r_rig and density of B̃†,r.
- Équations différentielles p-adiques et (φ,N)-modules filtrés, Appendice B (Erratum à [Ber02]), p. 26: “Example 2.8, 1 : remplacer A+max par Amax .” Correction used for B+_max = B̃_[0;r_0].

#### Construction. The localisation maps iota_n : B^{dagger,r}_{rig,K} -> K_n[[t]] in B_dR^+

*Module* `TauCeti/NumberTheory/PadicHodge/Robba/PadicField.lean`. *Node* `PadicHodgeTheory:P7/localisation-maps-p-adic-field`.

For r >= r(K) and n >= n(r) (the least n with r_n >= r), the map iota_n = phi^{-n} : B^{dagger,r}_K -> K_n[[t]] of PG.0 (Cherbonnier–Colmez) extends by continuity to an injective ring homomorphism iota_n : B^{dagger,r}_{rig,K} -> K_n[[t]], where K_n[[t]] is embedded in (B_dR^+)^{H_K} by t |-> Fontaine's t (PadicHodgeTheory:R06.1/fontaine-element-t). It satisfies iota_{n+1} o phi = iota_n, iota_n o gamma = gamma o iota_n for gamma in Gamma_K, iota_n(t) = t/p^n, iota_n(log pi) in K_n[[t]] for n >= 1, and restricts on B^{dagger,r}_{rig,F} to P7:annulus-foundations/localisation-at-roots-of-unity. With theta : B_dR^+ -> C: ker(theta o iota_n) = phi^{n-1}(q) B^{dagger,r}_{rig,K}, and for n large theta o iota_n induces an isomorphism B^{dagger,r}_{rig,K}/phi^{n-1}(q) -> K_n.

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt. Berger's radius convention: for r > 0, C[r;1[ = {z : p^{-1/r} <= |z| < 1}; r_n = p^{n-1}(p-1), so that |zeta_{p^n} - 1| = p^{-1/r_n}. n(r) = min {n : r_n >= r}; n(K) and r(K) from PG.0.

*API.*

- `RobbaK.iotaN` (*constructor*) — iota_n : B^{dagger,r}_{rig,K} ->+* K_n[[t]] for n >= n(r).
- `RobbaK.iotaN_injective` (*characterisation*) — iota_n is injective.
- `RobbaK.iotaN_phi` (*relation*) — iota_{n+1} o phi = iota_n.
- `RobbaK.iotaN_gamma` (*relation*) — iota_n commutes with Gamma_K.
- `RobbaK.iotaN_tElt` (*simp*) — iota_n t = t/p^n.
- `RobbaK.iotaN_toBdR` (*compatibility*) — Composed with K_n[[t]] -> B_dR^+ (t |-> Fontaine t), iota_n = phi^{-n} on B^{dagger,r_n}_K.
- `RobbaK.ker_theta_iotaN` (*characterisation*) — ker(theta o iota_n) = phi^{n-1}(q) B^{dagger,r}_{rig,K}.
- `RobbaK.quotient_eq_Kn` (*characterisation*) — For n large, B^{dagger,r}_{rig,K}/phi^{n-1}(q) = K_n via theta o iota_n.

*Used by.*

- `PadicHodgeTheory:P7/ddr-via-robba-realisation` — D_dif(V) = K_infinity((t)) tensor_{iota_n} D^{dagger,r_n}(V)
- `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem` — N_dR(V) is defined by iota_n(x) in K_n[[t]] tensor D_dR(V)
- `PadicHodgeTheory:P7/t-divisibility-criterion` — divisibility by t is checked on the kernels of theta o iota_n
- Berger 2008, Theorem V.2.3 and Section V.3 — filtration on D^dagger_rig(V) from iota_n

*Unit tests.* A wrong definition fails one of these.

- `iotaK.test_t` (computation) — iota_n(t) = t/p^n.
- `iotaK.test_unramified` (compatibility) — For K = F, iota_n is P7:annulus-foundations/localisation-at-roots-of-unity followed by F_n[[t]] -> B_dR^+.
- `iotaK.test_const` (degenerate) — iota_n on F' is sigma^{-n} followed by the inclusion F' -> K_n.
- `iotaK.test_outside` (non-example) — For n < n(r), iota_n is not defined on B^{dagger,r}_{rig,K}: 1/phi^{n-1}(q) lies in B^{dagger,r}_{rig,F} for r > r_n.

*Construction.*

1. Continuity: on B^{dagger,r}_K the map iota_n is continuous for the Frechet topology (it is the Taylor expansion at a point of the annulus, P7:annulus-foundations/localisation-at-roots-of-unity, transported by P7/berger-robba-identification), so it extends to the completion; injectivity by the identity principle for Taylor expansions (weierstrass-preparation-on-circles).
2. Compatibility with the B_dR^+-realisation: on B^{dagger,r_n}_K, iota_n = phi^{-n} followed by the inclusion into B_dR^+ (PG.0, R06.1/de-rham-period-ring); its image lies in K_n[[t]] with t Fontaine's element (Berger 2002 Lemme 4.2 proof).
3. Kernel: B^{dagger,r}_{rig,K}/phi^{n-1}(q) = F_n tensor over B^{dagger,r}_F of B^{dagger,r}_K by P7/robba-ring-tensor-identity and localisation-at-roots-of-unity (quotient F_n at the F-level); this is an F_n-algebra of dimension [K_infinity : F_infinity] = [K_n : F_n] for n large, mapping onto K_n (theta o iota_n of B^{dagger,r}_K generates K_n over F_n, PG.0), hence isomorphic to K_n (Berger 2002 Lemme 4.9); so the kernel is phi^{n-1}(q) B^{dagger,r}_{rig,K} (Proposition 4.8).

*Acceptance.*

- For K = F: iota_n(pi) = zeta_{p^n} exp(t/p^n) - 1 and theta(iota_n(phi^{n-1}(q))) = 0.

*Uses.* `PadicHodgeTheory:P7/robba-ring-of-p-adic-field`, `PadicHodgeTheory:P7/berger-robba-identification`, `PadicHodgeTheory:P7/robba-ring-tensor-identity`, `PadicHodgeTheory:P7:annulus-foundations/localisation-at-roots-of-unity`, `PadicHodgeTheory:P7:annulus-foundations/weierstrass-preparation-on-circles`, `PhiGammaModulesAndIwasawaCohomology:PG.0`, `PadicHodgeTheory:R06.1/de-rham-period-ring`, `PadicHodgeTheory:R06.1/fontaine-element-t`.

*Sources.*

- Équations différentielles p-adiques et (φ,N)-modules filtrés, Section I.2, p. 6: “L’application ιn se prolonge en une application injective ιn : B†,r rig,K → Kn [[t]].” iota_n extends injectively to B^{dagger,r}_{rig,K}.
- Représentations p-adiques et équations différentielles, Lemme 4.9, p. 42: “est une extension de Fn de degré eK = [Kn : Fn ] pour n ≫ 0.” Degree count behind the isomorphism B^{dagger,r}_{rig,K}/phi^{n-1}(q) = K_n.
- Représentations p-adiques et équations différentielles, Lemme 4.2, proof, p. 40: “Dans [9] il est démontré que l’image de BK par ιn = ϕ−n” iota_n = phi^{-n} maps B^{dagger,r_n}_K into K_n[[t]] in B_dR^+ (Cherbonnier–Colmez).

#### Construction. The maps iota_n : B~^{dagger,r_n}_{rig} -> B_dR^+ and B~^dagger_log

*Module* `TauCeti/NumberTheory/PadicHodge/Robba/Extended.lean`. *Node* `PadicHodgeTheory:P7/extended-localisation-maps`.

For n >= 0 the map iota_n = iota_0 o phi^{-n} : B~^{dagger,r_n}_{rig} -> B_dR^+ (PadicHodgeTheory:R06.1/de-rham-period-ring), where iota_0 sends sum p^k [x_k] to the B_dR^+-convergent series of the same Teichmuller expansion, is an injective G_F-equivariant ring homomorphism; on B~^+_{rig} it is phi^{-n} followed by B^+_cris in B_dR^+; iota_{n+1} o phi = iota_n; ker(theta o iota_n) = phi^{n-1}(q) B~^{dagger,r_n}_{rig} for n >= 1. It extends to B~^{dagger,r_n}_{log} by iota_n(X) = p^{-n} log[epsilon - 1], where log[epsilon - 1] = (p/(p-1)) u + (element of B~^+_{rig}) with u = log[p~] Fontaine's element (R06.1/semistable-period-ring); the extension is injective, G_F-equivariant and restricts to P7/localisation-maps-p-adic-field on B^{dagger,r}_{rig,K} for n >= n(r).

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt. r_n = p^{n-1}(p-1); iota_0 needs r_0 in the interval (Berger's convention).

*API.*

- `ExtRobba.iotaN` (*constructor*) — iota_n : B~^{dagger,r_n}_{rig} ->+* B_dR^+.
- `ExtRobba.iotaN_injective` (*characterisation*) — iota_n is injective.
- `ExtRobba.iotaN_galois` (*relation*) — iota_n commutes with G_F.
- `ExtRobba.iotaN_phi` (*relation*) — iota_{n+1} o phi = iota_n.
- `ExtRobba.ker_theta_iotaN` (*characterisation*) — ker(theta o iota_n) = phi^{n-1}(q) B~^{dagger,r_n}_{rig} (n >= 1).
- `ExtRobba.iotaN_log` (*constructor*) — Extension to B~^{dagger,r_n}_{log} with iota_n(X) = p^{-n} log[epsilon - 1].
- `ExtRobba.log_eq` (*relation*) — log[epsilon - 1] = (p/(p-1)) u + (element of B~^+_{rig}), u = log[p~].
- `ExtRobba.iotaN_restrict` (*compatibility*) — On B^{dagger,r}_{rig,K} it is P7/localisation-maps-p-adic-field.

*Used by.*

- Berger 2002, Proposition 3.4 — D_n = (B~^{dagger,r_n}_{log} tensor V)^{G_K} injects into D_dR(V) via iota_n, so it is finite-dimensional
- `PadicHodgeTheory:P7/ddr-via-robba-realisation` — iota_n relates D^dagger_rig(V) to (B_dR^+ tensor V)^{H_K}
- `PadicHodgeTheory:P7/berger-dcris-dst-dictionary` — N normalisation: N(log[epsilon - 1]) = -p/(p-1)
- Berger 2002, Propositions 2.25, 3.4, 4.8, 5.7, 5.15 — localisation at ε^{(n)} − 1: comparison with D_dR, D_dif and Sen's theory
- Berger 2008, Théorème III.2.3 and §V.2 — gluing of the local lattices K_n[[t]] ⊗ D†,r_rig(V) and recovery of the filtration
- `PadicHodgeTheory:R06.3/de-rham-differential-equation` — N_s is cut out by the conditions ι_n(x) ∈ K_n[[t]] ⊗ D_dR(V)

*Unit tests.* A wrong definition fails one of these.

- `extIota.test_t` (computation) — iota_n(t) = p^{-n} t.
- `extIota.test_theta` (computation) — theta(iota_n(pi)) = zeta_{p^n} - 1 and theta(iota_n(phi^{n-1}(q))) = 0.
- `extIota.test_plus` (compatibility) — On B~^+_{rig}, iota_0 is the inclusion B~^+_{rig} in B^+_cris in B_dR^+.
- `extIota.test_not_phi_equivariant` (non-example) — iota_n is not phi-equivariant into B_dR^+ (B_dR^+ has no Frobenius): iota_n(phi(x)) = iota_{n-1}(x), not phi(iota_n(x)).

*Construction.*

1. iota_0: a series sum p^k [x_k] with v_E(x_k) + (pr/(p-1))k -> infinity converges in B_dR^+ iff sum p^k x_k^(0) converges in C (Berger 2002 Section 1.3, Proposition 2.11), giving an injective map on A~_J; the kernel of theta o iota_0 is generated by [p~]/p - 1.
2. iota_n = iota_0 o phi^{-n} (Proposition 2.12, Corollaire 2.13); kernel statement Proposition 2.17 (phi^{n-1}(q) and phi^{-n}... generate the same ideal as [p~]^{p^n}/p - 1 on B~_I for I in [r_n, infinity[).
3. Log extension: log[epsilon - 1] in B_dR^+ is defined by Proposition 2.23 (log on C^flat with values in B~^+_{rig}[X]); v_E(epsilon - 1) = p/(p-1) v_E(p~) gives log[epsilon - 1] = (p/(p-1)) u + log[unit] with the last term in B~^+_{rig}. Injectivity on B~^{dagger,r_n}_{rig}[X] is the transcendence of u over iota_n(Frac B~^{dagger,r_n}_{rig}) (Proposition 2.25), which reduces to Fontaine's u not in Frac S (Le corps des periodes p-adiques 4.3.2, unavailable: gap).
4. Compatibility with P7/localisation-maps-p-adic-field: both are continuous and agree on B^{dagger,r}_K = phi^{-n} there (PG.0).

*Acceptance.*

- iota_n(t) = p^{-n} t; iota_n([epsilon]) = [epsilon^{p^{-n}}]; theta(iota_n(pi)) = zeta_{p^n} - 1.
- θ(ι_n(π)) = ε^{(n)} − 1 (a primitive p^n-th root of unity minus 1).
- θ∘ι_n(φ^{n−1}(q)) = 0 while θ∘ι_m(φ^{n−1}(q)) ≠ 0 for m ≠ n (Berger Lemma 5.12).

*Uses.* `PadicHodgeTheory:P7/extended-robba-ring-with-galois-action`, `PadicHodgeTheory:P7/localisation-maps-p-adic-field`, `PadicHodgeTheory:R06.1/de-rham-period-ring`, `PadicHodgeTheory:R06.1/semistable-period-ring`, `PadicHodgeTheory:R06.1/fontaine-element-t`, `PhiGammaModulesAndIwasawaCohomology:PG.0`, `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PhiGammaModulesAndIwasawaCohomology:PG.2`.

*Sources.*

- Représentations p-adiques et équations différentielles, Proposition 2.25, proof, p. 24: “il suffit de montrer que l’élément log[π] est transcendant sur le” Injectivity of iota_n on the log ring reduces to transcendence.
- Représentations p-adiques et équations différentielles, Proposition 2.25, proof, p. 25: “Fontaine a montré que u ∈ / Frac S (cf [22, 4.3.2]).” The transcendence input from Fontaine (unavailable).
- Représentations p-adiques et équations différentielles, Proposition 2.11, p. 17: “Proposition 2.11. L’application x 7→ ι0 (x) est un morphisme in-” iota_0 is an injective morphism into B_dR^+.
- Errata for my articles, Section 1, Propositions 2.11 and 2.12: “These are only true if I is such that” Corrected hypothesis for iota_n on A~_I; the statement here is made on B~^{dagger,r_n}_{rig}, where it holds.
- Représentations p-adiques et équations différentielles, Proposition 2.12, p. 20: “est un morphisme injectif” ι_n = ι_0∘φ^{−n} is an injective morphism into B_dR^+.
- Représentations p-adiques et équations différentielles, §0.3, pp. 4–5: “de plus de morphismes injectifs ιn” Injective maps ι_n from B†,r_n_rig,K to K_n[[t]] intertwining ∇ and t d/dt.
- Représentations p-adiques et équations différentielles, Proof of Lemme 4.2, p. 40: “L’image par ϕ−n de” The image of B†,r_n_rig,K by φ^{−n} lies in K_n[[t]] by continuity from Cherbonnier–Colmez's result on B†,r_n_K.

#### Construction. The operators nabla = log(gamma)/log chi(gamma) and partial on B^dagger_{rig,K}

*Module* `TauCeti/NumberTheory/PadicHodge/Robba/PadicField.lean`. *Node* `PadicHodgeTheory:P7/nabla-operator-on-robba-ring`.

For gamma in Gamma_K close to 1 and a closed interval I in [r, infinity[, V_I((1 - gamma) x) >= V_I(x) + 1 for x in B^{dagger,r}_{rig,K}, so nabla = log(gamma)/log_p chi(gamma) = -(1/log_p chi(gamma)) sum_{n>=1} (1 - gamma)^n/n converges to a continuous operator of B^{dagger,r}_{rig,K}, independent of gamma; nabla is a derivation commuting with phi and Gamma_K, nabla = t partial, and nabla/(1 - gamma_K) is a continuous operator with (1 - gamma_K)(nabla/(1 - gamma_K)) = nabla for a generator gamma_K of Gamma_K modulo torsion. partial = t^{-1} nabla is a derivation of B^dagger_{rig,K} generating the rank-one module of continuous derivations, and partial is surjective from B^dagger_{rig,K} + F' log(pi_K) onto B^dagger_{rig,K} and from B^dagger_{log,K} onto itself; a primitive of an element of B^{dagger,r}_{log,K} lies in B^{dagger,s}_{log,K} for every s > r.

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt. Berger's radius convention: for r > 0, C[r;1[ = {z : p^{-1/r} <= |z| < 1}; r_n = p^{n-1}(p-1), so that |zeta_{p^n} - 1| = p^{-1/r_n}. V_I is the valuation -log_p |.|_I of the compact subannulus I (Berger's normalisation).

*API.*

- `RobbaK.nabla` (*constructor*) — nabla = log(gamma)/log_p chi(gamma), a continuous derivation of B^{dagger,r}_{rig,K}.
- `RobbaK.nabla_indep` (*characterisation*) — nabla does not depend on gamma.
- `RobbaK.nabla_eq_t_mul_partial` (*relation*) — nabla = t partial.
- `RobbaK.nabla_phi` (*relation*) — nabla commutes with phi and Gamma_K.
- `RobbaK.nablaDivOneSubGamma` (*constructor*) — The continuous operator nabla/(1 - gamma_K).
- `RobbaK.partial_surjective` (*characterisation*) — partial maps B^dagger_{rig,K} + F' log pi_K onto B^dagger_{rig,K} and B^dagger_{log,K} onto itself.
- `RobbaK.norm_one_sub_gamma` (*relation*) — V_I((1 - gamma) x) >= V_I(x) + 1 for gamma close to 1.

*Used by.*

- `PadicHodgeTheory:P7/connection-on-robba-realisation` — nabla_V is a connection over nabla
- `PadicHodgeTheory:P7/unipotent-connection-criterion` — primitives in B^dagger_{log,K} (Proposition 4.4) in the proof of Proposition 5.5
- `PadicDifferentialEquationsAndRigidCohomology:RD.2/berger-form-of-local-monodromy` — partial_M o phi = p phi o partial_M
- Berger 2002, §5.1 — ∇_V is a connection over (B†_rig,K, ∇)
- `PadicDifferentialEquationsAndRigidCohomology:RD.2/berger-form-of-local-monodromy` — its ∂ is Berger's derivation ∂ = t^{−1}∇ and ∂_M∘φ = pφ∘∂_M is the Frobenius compatibility
- Berger 2008, §III.1 — local triviality of the Lie algebra action on (φ,Γ_K)-modules over the Robba ring

*Unit tests.* A wrong definition fails one of these.

- `nabla.test_t` (computation) — nabla(t) = t.
- `nabla.test_unramified` (compatibility) — For K = F, nabla = t (1+pi) d/dpi (P7:annulus-foundations/cyclotomic-derivation).
- `nabla.test_const` (degenerate) — nabla vanishes on F'.
- `nabla.test_log_class` (non-example) — partial(log pi_K) = partial(pi_K)/pi_K is not partial of an element of B^dagger_{rig,K}: log pi_K must be adjoined.

*Construction.*

1. Lemma 4.1: reduce by density and linearity to x = pi_K^k, factor gamma(pi_K^k) - pi_K^k through gamma(pi_K)/pi_K - 1, and use V_I(gamma(pi_K)/pi_K - 1) >= 1 for gamma close to 1 (continuity of the Gamma_K-action, P7/robba-ring-of-p-adic-field).
2. Convergence and independence of gamma: formal power series identities for log(1 - X) (Berger 2002 Section 4.1); continuity from the uniform estimate on each I.
3. nabla = t partial: both are continuous derivations; on B^dagger_{rig,F} this is P7:annulus-foundations/cyclotomic-derivation (tendsto_nabla), and a derivation of B^dagger_{rig,F} extends uniquely to the finite etale extension B^dagger_K and then by continuity (P7/robba-ring-tensor-identity), so the identity holds on B^dagger_{rig,K} (this replaces Berger's argument through iota_n, Lemme 4.2).
4. Surjectivity (Proposition 4.4): write F(pi_K)/partial(pi_K) = sum a_n pi_K^n (partial(pi_K) a unit, P7/berger-robba-identification (b)); then F = partial(sum_{n != -1} a_n pi_K^{n+1}/(n+1)) + a_{-1} partial(log pi_K), with the primitive converging on every thinner annulus (P7:annulus-foundations/annulus-derivation); induction on the degree in log pi_K gives the log statement.

*Acceptance.*

- For V = Q_p(r) one has nabla_V = t partial + r on D^dagger_rig(Q_p(r)) (Berger 2002 Exemple 5.3), the case r = 0 being nabla itself.
- ∇(t) = t and ∂(t) = 1.
- ∇(π) = t(1+π).
- ∇ vanishes on the constants F'_K.

*Uses.* `PadicHodgeTheory:P7/robba-ring-of-p-adic-field`, `PadicHodgeTheory:P7/berger-robba-identification`, `PadicHodgeTheory:P7/robba-ring-tensor-identity`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-derivation`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-gamma-action`, `PadicHodgeTheory:P7:annulus-foundations/annulus-derivation`, `mathlib:Derivation`, `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PadicHodgeTheory:P7/extended-localisation-maps`, `PadicHodgeTheory:R06.1/fontaine-element-t`, `PhiGammaModulesAndIwasawaCohomology:PG.0`.

*Sources.*

- Représentations p-adiques et équations différentielles, Section 4.1, p. 39: “argument de séries formelles montre que log(γ)/ log(χ(γ)) ne dépend pas du choix de γ” nabla is independent of gamma.
- Représentations p-adiques et équations différentielles, Lemme 4.2, p. 39: “Lemme 4.2. La restriction de ∇ à B†,r rig,K vérifie ∇ = t · ∂ où ∂(x) = (1 + π)dx/dπ.” nabla = t partial.
- Représentations p-adiques et équations différentielles, Proposition 4.4, p. 40: “La connexion ∂ réalise une surjection” Surjectivity of partial.
- Représentations p-adiques et équations différentielles, §4.1, p. 39: “ne dépend pas du choix de γ” Independence of γ.
- An introduction to the theory of p-adic representations, IV.2, p. 26: “which acts by ∇(f (π)) = log(1 + π)(1 + π)df /dπ” Explicit formula for K = K_0.

#### Construction. Logarithms of Teichmüller lifts and the rings B̃†_log, B̃+_log, B†_log,K with φ, G_K and N

*Module* `TauCeti/PadicHodge/Monodromy/LogRings.lean`. *Node* `PadicHodgeTheory:P7/log-extended-period-rings`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. (a) There is a unique map x ↦ log[x] from (Ẽ)^× = (C^♭)^× to B̃+_rig[X] with log[xy] = log[x] + log[y], log[x] = 0 for x in the multiplicative residue field k̄^×, log[π̄] = X, and log[x] = Σ_{n≥1}(−1)^{n−1}([x]−1)^n/n when v_p(x^{(0)} − 1) ≥ 1; log[x] ∈ B̃+_rig for x ∈ (O_{C^♭})^×. (b) There is a unique multiplicative extension log: (Ã†)∖{0} → B̃†_rig[X] with log([x]) = log[x] and log(p) = 0; in particular log(π) = X + log(π/[π̄]) with log(π/[π̄]) ∈ B̃†_rig. (c) Put u = X = log[π̄] and B̃†,r_log = B̃†,r_rig[u], B̃†_log = ∪_r B̃†,r_log = B̃†_rig[log π], B̃+_log = B̃+_rig[u], B†_log,K = B†_rig,K[log π], with φ(u) = pu, g(u) = u + log[g(π̄)/π̄] (g ∈ G_K), and N is Fontaine's monodromy operator: the B̃†_rig-linear derivation with N(u) = −p/(p−1), equivalently N(log π) = −p/(p−1), equivalently N = −d/du' for u' = log[p^♭] = ((p−1)/p)u − ((p−1)/p)·log[π̄/(p^♭)^{p/(p−1)}]; then Nφ = pφN and N commutes with G_K. (d) For n ≥ 0 and r ≤ r_n, ι_n extends to an injective G_K-equivariant map ι_n: B̃†,r_log → B_dR^+ with ι_n(u) = p^{−n}·log[π̄]_dR, where log[π̄]_dR = log_p(π̄^{(0)}) + log([π̄]/π̄^{(0)}) (log_p(p) = 0); its restriction to B̃+_log is φ^{−n}, and B̃+_log[1/t] ⊂ B_st compatibly with φ, N and G_K.

*Hypotheses.* Berger 2002 defines log only on Ã+ (Proposition 2.24) but uses log(π_K) with π_K ∈ Ã†; the extension to Ã† (Colmez) is required (Berger 2008, Appendix B). Berger 2002 normalises N by N(log π) = −1; to recover Fontaine's (φ,N)-module D_st one must take N(log π) = −p/(p−1) (Berger 2008, Appendix B). This packet uses the corrected, Fontaine normalisation, matching R06.1/semistable-period-ring with u' = log[p^♭]. Transcendence of log[π̄]_dR over ι_n(Frac B̃†,r_n_rig) is needed for injectivity of ι_n on the polynomial ring.

*API.*

- `tLog` (*constructor*) — log[x] ∈ B̃+_rig[u] for x ∈ (C^♭)^×, multiplicative, with log[π̄] = u.
- `LogExtendedRobba` (*constructor*) — B̃†,r_log := B̃†,r_rig[u] (polynomial ring), B̃+_log := B̃+_rig[u], B†_log,K := B†_rig,K[log π].
- `LogExtendedRobba.frobenius_u` (*simp*) — φ(u) = p·u.
- `LogExtendedRobba.galois_u` (*simp*) — g(u) = u + log[g(π̄)/π̄] with log[g(π̄)/π̄] ∈ B̃+_rig.
- `LogExtendedRobba.monodromy` (*structure*) — N: B̃†_rig-linear derivation with N(u) = −p/(p−1); Nφ = pφN; Ng = gN.
- `LogExtendedRobba.iotaMap_injective` (*characterisation*) — ι_n extends injectively to B̃†,r_log (r ≤ r_n), G_K-equivariantly.
- `LogExtendedRobba.plusLog_subset_bst` (*compatibility*) — B̃+_log[1/t] ⊂ B_st, compatibly with φ, N (Fontaine normalisation) and G_K.

*Used by.*

- Berger 2002, Propositions 3.3–3.4 and Théorème 3.6 — periods of semistable representations live in B̃+_log[1/t]
- Berger 2008, Théorème C and §V.2 — B†_rig,L[ℓ_X] = B†_log,L and the monodromy operator on it
- `PadicDifferentialEquationsAndRigidCohomology:RD.2/log-robba-ring` — B†_log,K is Kedlaya's R_log for u = π (its acceptance test)

*Unit tests.* A wrong definition fails one of these.

- `tLog_pi_bar` (computation) — log[π̄] = u and log[ε] = t (so log[ε] ∈ B̃+_rig, no u-component).
- `LogExtendedRobba.monodromy_frobenius` (characterisation) — N(φ(u)) = p·φ(N(u)): both sides equal −p²/(p−1).
- `LogExtendedRobba.ker_monodromy` (degenerate) — ker(N: B̃†_log → B̃†_log) = B̃†_rig.
- `LogExtendedRobba.old_normalisation_wrong` (non-example) — With Berger 2002's N(log π) = −1 the relation D_st(V) ≅ (D†_log(V)[1/t])^{Γ_K} holds only up to scaling N by (p−1)/p: for the Tate curve (Berger intro II.4.3) Fontaine's N(y) = v_p(q)·x would become ((p−1)/p)·v_p(q)·x.
- `LogExtendedRobba.compat_bst` (compatibility) — The inclusion B̃+_log[1/t] ⊂ B_st of R06.1/semistable-period-ring sends u to (p/(p−1))log[p^♭] + log[w] and intertwines N with −d/dlog[p^♭].

*Construction.*

1. Proposition 2.23: on U_1 = {v_p(x^{(0)} − 1) ≥ 1} the series converges in B+_max and log[x] = φ(log[x]/p) lands in B̃+_rig; extend by p-power roots, to (O_{C^♭})^× = k̄^× × (1 + m) and by the choice log[π̄] = X to (C^♭)^× (valuation ring).
2. Proposition 2.24 (with the Colmez extension to Ã†): write x = p^a[x̄](1 − pz), z ∈ Ã†,r, and set log(x) = log[x̄] + log(1 − pz) (series converging p-adically in Ã†,r).
3. Proof of Proposition 2.25: ι_0(B̃†,r_0_rig) lies in the subring S = K_0 ⊗ A_inf[[β]] (β = 1 − [p̃]/p) of B_dR^+; log[p̃] ∉ Frac(S) (Fontaine–Ouyang Lemma 6.12, the published proof of Fontaine's [22, 4.3.2]); then the Galois argument g(u) = u + η(g)t shows transcendence.
4. Normalisation of N: π̄ = (p^♭)^{p/(p−1)}·w with w ∈ (O_{C^♭})^× (v(π̄) = p/(p−1)), so log[π̄] = (p/(p−1))log[p^♭] + log[w] with log[w] ∈ B̃+_rig; hence N = −d/dlog[p^♭] gives N(u) = −p/(p−1) and N(log π) = −p/(p−1) since log(π/[π̄]) ∈ B̃†_rig.
5. B̃+_log[1/t] = B̃+_rig[1/t][log[p^♭]] ⊂ B_cris[log[p^♭]] = B_st (R06.1/semistable-period-ring) using B̃+_rig ⊂ B_cris^+ (PadicHodgeTheory:P7/extended-robba-ring-with-galois-action).

*Acceptance.*

- N(u^k) = −k(p/(p−1))u^{k−1}; N is zero on B̃†_rig.
- ι_n(log π) ∈ F_n[[t]] for K = K_0 and n ≥ 1 (Berger Remark 2.26).

*Uses.* `PadicHodgeTheory:P7/extended-robba-ring-with-galois-action`, `PadicHodgeTheory:P7/extended-localisation-maps`, `PadicHodgeTheory:R06.1/semistable-period-ring`, `PadicHodgeTheory:R06.1/de-rham-period-ring`, `PadicHodgeTheory:R06.1/fontaine-element-t`, `PadicHodgeTheory:R06.1/crystalline-period-ring`.

*Sources.*

- Représentations p-adiques et équations différentielles, Proposition 2.23, p. 23: “Il existe une et une seule application x 7→ log[x]” Existence and uniqueness of log[x].
- Représentations p-adiques et équations différentielles, Proposition 2.25, p. 24: “est injective, commute à l’action de Galois” Injectivity and equivariance of ι_n on B̃†,r_n_rig[X].
- Équations différentielles p-adiques et (φ,N)-modules filtrés, Appendice B (Erratum à [Ber02]), p. 27: “il faut prendre N(log(π)) = −p/(p − 1) au lieu de N(log(π)) = −1” Normalisation of N used here.
- Theory of p-adic Galois representations, Lemma 6.12, p. 119: “The element log[$] is not contained in Ccris” Public proof of the non-membership used for transcendence (the proof shows α log[ϖ] ∉ S for α ∈ S nonzero).

#### Construction. The decompletion operators R_k

*Module* `TauCeti/NumberTheory/PadicHodge/Robba/Extended.lean`. *Node* `PadicHodgeTheory:P7/decompletion-operators`.

For r a large enough integer there are maps R_k : B~^{dagger,r}_{rig,K} -> phi^{-k}(B^{dagger, p^k r}_{rig,K}) (k >= 0) such that (1) R_k is a continuous section of the inclusion phi^{-k}(B^{dagger, p^k r}_{rig,K}) in B~^{dagger,r}_{rig,K}; (2) R_k is phi^{-k}(B^{dagger, p^k r}_{rig,K})-linear; (3) R_k(x) -> x as k -> infinity; (4) R_k commutes with Gamma_K. They extend phi^{-k}(B^{dagger,p^k r}_{rig,K})-linearly to B~^{dagger,r}_{log,K}[1/t] with the same properties, and to B~^{dagger}_{rig,K} tensor_{B^dagger_K} D^dagger(V) by R_k(sum lambda_i e_i) = sum R_k(lambda_i) e_i for a basis (e_i) of D^dagger(V).

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt. B~^{dagger,r}_{rig,K} = (B~^{dagger,r}_{rig})^{H_K}; B~^{dagger,r}_{log,K} = B~^{dagger,r}_{rig,K}[log pi].

*API.*

- `ExtRobba.decompletion` (*constructor*) — R_k : B~^{dagger,r}_{rig,K} -> phi^{-k}(B^{dagger,p^k r}_{rig,K}).
- `ExtRobba.decompletion_section` (*characterisation*) — R_k is the identity on phi^{-k}(B^{dagger,p^k r}_{rig,K}).
- `ExtRobba.decompletion_linear` (*structure*) — R_k is phi^{-k}(B^{dagger,p^k r}_{rig,K})-linear and continuous.
- `ExtRobba.tendsto_decompletion` (*characterisation*) — R_k(x) -> x as k -> infinity.
- `ExtRobba.decompletion_gamma` (*relation*) — R_k commutes with Gamma_K.
- `ExtRobba.decompletion_log` (*other*) — The extension to B~^{dagger,r}_{log,K}[1/t] and to modules B~^dagger_{rig,K} tensor D^dagger(V).

*Used by.*

- `PadicHodgeTheory:P7/berger-dcris-dst-dictionary` — passing from Gamma-invariant periods over B~^dagger_{log,K} to B^dagger_{log,K}
- `PadicHodgeTheory:P7/berger-comparison-isomorphisms` — R_0 shows the comparison matrix has coefficients in B^dagger_{log,K}[1/t]
- Berger 2002, Lemme 5.1 — kernel of theta o iota_n on D^dagger_rig(V)
- Berger 2002, Théorème 3.6 — applied to the matrix of a basis of D_st(V) in a basis of D†(V) to obtain Γ_K-invariants in D†_log(V)[1/t]
- Berger 2002, Propositions 3.7, 4.8 and Lemma 5.1 — R_0 shows that transition matrices and divisors lie in the Robba ring
- `PadicHodgeTheory:P7/theta-iota-kernel` — R_0 descends divisibility by φ^{n−1}(q) from B̃†_rig to B†_rig,K

*Unit tests.* A wrong definition fails one of these.

- `decompletion.test_section` (computation) — R_0(x) = x for x in B^{dagger,r}_{rig,K}.
- `decompletion.test_epsilon` (computation) — For K = F: R_0([epsilon^{1/p}]) = 0 and R_1([epsilon^{1/p}]) = [epsilon^{1/p}].
- `decompletion.test_limit` (degenerate) — For x in phi^{-k}(B^{dagger,p^k r}_{rig,K}), R_m(x) = x for all m >= k.
- `decompletion.test_not_ring_hom` (non-example) — R_0 is not multiplicative: R_0([epsilon^{1/p}]^p) = [epsilon] != 0 = R_0([epsilon^{1/p}])^p.

*Construction.*

1. K = F: every x in E~^+_F is uniquely sum_{i in I} epsilon^i a_i(x) with I = Z[1/p] cap [0,1) and a_i(x) in E^+_F tending to 0; lift to A~^+_F = sum [epsilon^i] a_i with a_i in A^+_F, and put R_k(x) = sum over i in p^{-k} Z cap I of [epsilon^i] a_i(x) (Cherbonnier–Colmez III.2, Berger 2002 Proposition 2.32 proof).
2. Extend to B~^{dagger,r}_{rig,F} = intersection over s >= r of B~^+_F{p/pi^r, pi^s/p} (Berger 2002 Lemme 2.33) coefficientwise on the double series (Lemme 2.34 gives R_k(x) -> x).
3. General K: B^{dagger,r}_K is free over B^{dagger,r}_F with basis (e_i) (P7/robba-ring-tensor-identity); write x = sum T_{K/F}(x e_i*) e_i and put R_k(x) = sum R_k(T_{K/F}(x e_i*)) e_i, independent of the basis by linearity; Gamma_K-commutation because gamma(e_i) = sum g_ij e_j with g_ij in B^{dagger,r}_F.
4. Extension to the log ring and to D^dagger(V): Berger 2002 Definition 2.35 and Section 5.1.

*Acceptance.*

- R_0 restricted to B^{dagger,r}_{rig,K} is the identity; on B~^+_F, R_0([epsilon^{1/p}]) = 0.
- R_0 restricted to B†,r_rig,K is the identity.
- R_0([ε]^{1/p}) = 0 (the index 1/p ∉ Z), so R_0 is not multiplicative.

*Uses.* `PadicHodgeTheory:P7/extended-robba-ring-with-galois-action`, `PadicHodgeTheory:P7/extended-robba-plus-decomposition`, `PadicHodgeTheory:P7/robba-ring-tensor-identity`, `PadicHodgeTheory:P7/berger-robba-identification`, `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PhiGammaModulesAndIwasawaCohomology:PG.0`, `PadicHodgeTheory:P7/log-extended-period-rings`, `PhiGammaModulesAndIwasawaCohomology:PG.2`.

*Sources.*

- Représentations p-adiques et équations différentielles, Proposition 2.32, p. 28: “Proposition 2.32. Si r est un entier assez grand, alors il existe des” Existence of the R_k.
- Représentations p-adiques et équations différentielles, Proposition 2.32, proof, p. 29: “Comme Rk est B†,r F -linéaire, cette définition ne” Definition for general K through a basis, independent of choices.
- An introduction to the theory of p-adic representations, IV.3.3, p. 28-29: “one can finally show” Colmez's decompletion maps finish the proof of the dictionary.
- Représentations p-adiques et équations différentielles, Proposition 2.32 (4) and its proof, pp. 28–29: “Reste à voir que Rk commute à γ ∈ ΓK” Γ_K-equivariance of R_k.
- An introduction to the theory of p-adic representations, IV.3.3, pp. 28–29: “by using Colmez’s decompletion maps, which” The role of R_k as decompletion from B̃†_rig,K to B†_rig,K.

#### Construction. The connection nabla_V on D^dagger_rig(V)

*Module* `TauCeti/NumberTheory/PadicHodge/Robba/Realisation.lean`. *Node* `PadicHodgeTheory:P7/connection-on-robba-realisation`.

For V a p-adic representation of G_K, r >= r(V) and gamma in Gamma_K close to 1, the series nabla_V = log(gamma)/log_p chi(gamma) converges to a continuous operator of D^{dagger,r}_rig(V), independent of gamma, with nabla_V(x) = lim_{gamma -> 1} (gamma(x) - x)/(chi(gamma) - 1); it is a connection over nabla: nabla_V(lambda x) = nabla(lambda) x + lambda nabla_V(x), commuting with phi and Gamma_K. partial_V = t^{-1} nabla_V is a connection over partial on D^dagger_rig(V)[1/t]. For n >= n(r), ker(theta o iota_n : D^{dagger,r}_rig(V) -> C tensor V) = phi^{n-1}(q) D^{dagger,r}_rig(V) (and likewise on D^{dagger,r}(V)); if x in D^{dagger,r}_rig(V) lies in phi^{n-1}(q) D^{dagger,r_n}_rig(V) for all n large then x is in t D^dagger_rig(V). For V = Q_p(r), nabla_V = t partial + r in the basis e_r.

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt. V a p-adic representation; D^{dagger,r}_rig(V) carries the Frechet topology of a free B^{dagger,r}_{rig,K}-module, independent of the basis (open mapping theorem), equal to the topology induced by B~^dagger_{rig} tensor V.

*API.*

- `RobbaRealisation.nablaV` (*constructor*) — nabla_V = log(gamma)/log_p chi(gamma) on D^{dagger,r}_rig(V).
- `RobbaRealisation.nablaV_leibniz` (*relation*) — nabla_V(lambda x) = nabla(lambda) x + lambda nabla_V(x).
- `RobbaRealisation.nablaV_indep` (*characterisation*) — Independent of gamma; nabla_V(x) = lim (gamma(x) - x)/(chi(gamma) - 1).
- `RobbaRealisation.nablaV_phi` (*relation*) — nabla_V commutes with phi and Gamma_K.
- `RobbaRealisation.partialV` (*constructor*) — partial_V = t^{-1} nabla_V on D^dagger_rig(V)[1/t].
- `RobbaRealisation.ker_theta_iotaN` (*characterisation*) — ker(theta o iota_n) = phi^{n-1}(q) D^{dagger,r}_rig(V).
- `RobbaRealisation.mem_t_of_forall` (*characterisation*) — Divisibility by t on D^dagger_rig(V) from divisibility by all phi^{n-1}(q).
- `RobbaRealisation.nablaV_twist` (*simp*) — On Q_p(r): nabla_V(f e_r) = (nabla f + r f) e_r.

*Used by.*

- `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem` — N_dR(V) is the unique free rank-d submodule stable under partial_V (Berger 2002 Theoreme 5.10)
- `PadicHodgeTheory:P7/ddr-via-robba-realisation` — nabla_V on D_dif(V) computes D_dR(V)
- `PadicHodgeTheory:P7/semistability-criterion-unipotent-connection` — unipotence of nabla_V characterises potential semistability over K_n
- Berger 2002, Proposition 5.6 (Théorème 0.4) — V is semistable over some K_n iff ∇_V is unipotent on D†_rig(V)[1/t]
- Berger 2002, Théorème 5.10 — N_dR(V) is the unique rank-d submodule stable by ∂_V
- Berger 2008, Théorème A and §V.1 — (φ,Γ_K)-modules with locally trivial ∇ correspond to filtered (φ,N,G_K)-modules
- `PadicDifferentialEquationsAndRigidCohomology:RD.2/berger-form-of-local-monodromy` — (N_dR(V), ∂_V) is the input p-adic differential equation

*Unit tests.* A wrong definition fails one of these.

- `nablaV.test_twist` (computation) — For V = Q_p(r): nabla_V(e_r) = r e_r and nabla_V = t partial + r.
- `nablaV.test_trivial` (degenerate) — For V = Q_p: nabla_V = nabla = t partial on D^dagger_rig(V) = B^dagger_{rig,K}.
- `nablaV.test_leibniz` (compatibility) — nabla_V(t e_r) = (t + r t) e_r = (1 + r) t e_r, consistent with nabla(t) = t.
- `nablaV.test_poles` (non-example) — partial_V is not defined on D^dagger_rig(V) itself in general: for V = Q_p(1), partial_V(e_1) = t^{-1} e_1, which has poles at the zeta - 1.

*Construction.*

1. Estimate V_I((1 - gamma) x) >= V_I(x) + 1 for gamma close to 1: continuity of the G_K-action on a basis of D^dagger(V) plus P7/nabla-operator-on-robba-ring on coefficients (Berger 2002 Lemme 5.2).
2. Convergence, independence of gamma and the limit formula: as for nabla on B^dagger_{rig,K}; the Leibniz rule from (1 - gamma)(lambda x) = (1 - gamma)(lambda) gamma(x) + lambda (1 - gamma) x.
3. Kernel of theta o iota_n: the analogous statement over B~^dagger_{rig} (P7/extended-localisation-maps) gives x = phi^{n-1}(q) y with y in B~^dagger_{rig,K} tensor D^dagger_rig(V); applying R_0 (P7/decompletion-operators) gives y = R_0(y) in D^dagger_rig(V) (Berger 2002 Lemme 5.1).
4. t-divisibility: P7/t-divisibility-criterion in a basis (Lemme 5.4).
5. Q_p(r): gamma(e_r) = chi(gamma)^r e_r gives nabla_V(e_r) = r e_r.

*Acceptance.*

- V = Q_p(r): nabla_V = t partial + r (Berger 2002 Exemple 5.3); V unramified: nabla_V = t partial in a basis of D^dagger(V) fixed by Gamma_K after an unramified extension.
- Example 5.3: on D†_rig(Q_p(r)) = B†_rig,K·e_r (γ(e_r) = χ(γ)^r e_r), ∇_V(fe_r) = (∇f + rf)e_r, i.e. ∇_{Q_p(r)} = t∂ + r.
- For V with finite image of inertia (C-admissible) ∇_V(D†_rig(V)) ⊂ tD†_rig(V) (Berger §5.6) and ∂_V preserves D†_rig(V).

*Uses.* `PadicHodgeTheory:P7/robba-realisation-comparison`, `PadicHodgeTheory:P7/nabla-operator-on-robba-ring`, `PadicHodgeTheory:P7/extended-localisation-maps`, `PadicHodgeTheory:P7/decompletion-operators`, `PadicHodgeTheory:P7/t-divisibility-criterion`, `PadicHodgeTheory:P7/localisation-maps-p-adic-field`, `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PhiGammaModulesAndIwasawaCohomology:PG.1`, `PhiGammaModulesAndIwasawaCohomology:PG.2`.

*Sources.*

- Représentations p-adiques et équations différentielles, Section 5.1, p. 47: “ce qui fait que, comme (1 − γ)(λx) = (1 − γ)λ · γ(x) + λ · (1 − γ)x,” Leibniz rule for nabla_V.
- Représentations p-adiques et équations différentielles, Exemple 5.3, p. 48: “Exemple 5.3. Un calcul facile montre par exemple que ∇Qp (r) = t∂ +r” nabla on D^dagger_rig(Q_p(r)).
- An introduction to the theory of p-adic representations, IV.2, p. 27: “we see that the formula ∇V = log(γ)/ logp (χ(γ)) gives the” The action of Lie(Gamma_K) on D^dagger_rig(V).
- Représentations p-adiques et équations différentielles, §5.1, p. 47: “C’est donc une connexion au-dessus de l’opérateur ∇” ∇_V is a connection over ∇.

#### Definition. Crystals over B†_rig,K and unipotent (resp. trivial) connections

*Module* `TauCeti/PadicHodge/Monodromy/UnipotentCrystal.lean`. *Node* `PadicHodgeTheory:P7/unipotent-crystal`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. A crystal over B†_rig,K is a free B†_rig,K-module M of finite rank d with a φ-semilinear φ_M (φ^*M ≅ M) and a connection ∇_M over ∇ (∇_M(λx) = ∇(λ)x + λ∇_M(x)) commuting with φ_M. A module M with connection over ∇ is unipotent if the following equivalent conditions hold: (1) ∇_M is trivial on M ⊗ B†_log,K[1/t]: there are e_0, …, e_{d−1} ∈ M ⊗ B†_log,K with ∇_M(e_i) = 0 spanning M ⊗ B†_log,K[1/t] over B†_log,K[1/t]; (2) there are f_0, …, f_{d−1} ∈ M forming a basis of M[1/t] over B†_rig,K[1/t] with ∇_M(f_i) ∈ t·⟨f_{i−1}, …, f_0⟩. It is trivial if the f_i can be chosen with ∇_M(f_i) = 0. Unipotence does not depend on the Frobenius structure.

*Hypotheses.* Connections are over ∇ = t∂ (not over ∂); the Galois-theoretic monodromy N = 1 ⊗ N acts on M ⊗ B†_log,K and commutes with ∇_M.

*API.*

- `RobbaCrystal` (*structure*) — Free B†_rig,K-module with φ_M (φ^*M ≅ M) and a connection over ∇ commuting with φ_M.
- `IsUnipotentConnection` (*constructor*) — Condition (2): a basis f_i of M[1/t] with ∇_M f_i ∈ t⟨f_{i−1},…,f_0⟩.
- `isUnipotentConnection_iff_horizontal` (*characterisation*) — (2) ⇔ (1): M ⊗ B†_log,K[1/t] has a basis of ∇_M-horizontal vectors in M ⊗ B†_log,K.
- `IsTrivialConnection` (*constructor*) — ∃ basis f_i of M[1/t] with ∇_M f_i = 0.
- `isUnipotentConnection_tensor` (*functoriality*) — Unipotent connections are stable under ⊗, duals, subquotients and extensions.

*Used by.*

- Berger 2002, Proposition 5.6 — semistability over K_n ⇔ unipotence of D†_rig(V)[1/t]
- `PadicDifferentialEquationsAndRigidCohomology:RD.2/unipotent-differential-module` — Kedlaya's unipotence for ∂-modules; compatibility test below

*Unit tests.* A wrong definition fails one of these.

- `isTrivialConnection_unit` (degenerate) — (B†_rig,K, ∇) is trivial.
- `isUnipotent_log_example` (computation) — M = B†_rig,F·f_0 ⊕ B†_rig,F·f_1 with ∇f_0 = 0, ∇f_1 = t(1+π)/π·f_0: e_1 = f_1 − log(π)f_0 is horizontal, so M is unipotent.
- `not_isTrivial_log_example` (non-example) — The same M is not trivial: a horizontal basis over B†_rig,F[1/t] would require log π ∈ B†_rig,F[1/t].
- `isUnipotent_iff_kedlaya` (compatibility) — For M with ∇_M(M) ⊂ tM, unipotence of ∇_M is equivalent to unipotence of the ∂-module (M, t^{−1}∇_M) over R_{F'_K}(π_K) in the sense of PadicDifferentialEquationsAndRigidCohomology:RD.2/unipotent-differential-module.

*Construction.*

1. (1) ⇒ (2): N commutes with ∇_M (N commutes with G_F), so it preserves the F'_K-span of the horizontal e_i and is nilpotent there; order the e_i so that N(e_i) ∈ ⟨e_{i−1},…,e_0⟩, expand e_i = Σ_j log^j(π)d_{ji} and take f_i = d_{0,i}; ∇_M(e_i) = 0 gives ∇_M(d_{0,i}) = d_{1,i}·t(1+π)/π with d_{1,i} ∈ ⟨d_{0,i−1},…⟩.
2. (2) ⇒ (1): induction on d; on M/f_0 there are horizontal e'_i with ∇_M(e'_i) = α_i f_0 and α_i ∈ tB†_log,K; choose β_i with ∇(β_i) = α_i (β_i ∈ B†_log,K by PadicHodgeTheory:P7/antiderivatives-on-log-robba-ring applied to t^{−1}α_i) and set e_i = e'_i − β_i f_0 (Berger Proposition 5.5).
3. The transition matrix from (f_i) to (e_i) is unipotent upper triangular, so the e_i span M ⊗ B†_log,K[1/t].

*Acceptance.*

- M = B†_rig,K with ∇_M = ∇ is trivial (f_0 = 1).
- M = (B†_rig,K)^2 with ∇f_0 = 0, ∇f_1 = t·((1+π)/π)·f_0 (K = K_0) is unipotent (e_1 = f_1 − log(π)f_0) but not trivial.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PadicHodgeTheory:P7/nabla-operator-on-robba-ring`, `PadicHodgeTheory:P7/antiderivatives-on-log-robba-ring`, `PadicHodgeTheory:P7/log-extended-period-rings`.

*Sources.*

- Représentations p-adiques et équations différentielles, Proposition 5.5, p. 48: “Les propriétés suivantes sont équivalentes” Equivalence (1) ⇔ (2).
- Représentations p-adiques et équations différentielles, §5.2, p. 48: “Un cristal sur B†rig,K est un B†rig,K -module libre muni d’un Frobenius et d’une connexion qui commutent” Definition of a crystal.

#### Construction. Sen's module D_Sen(V) and Sen's operator Θ_V

*Module* `TauCeti/PadicHodge/Monodromy/Sen.lean`. *Node* `PadicHodgeTheory:P7/sen-module`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. Let C = C_K and W a continuous semilinear C-representation of G_K of dimension d (e.g. W = C ⊗_{Q_p} V). There is a unique G_K-stable d-dimensional K_∞-subspace D_Sen(W) ⊂ W^{H_K} on which H_K acts trivially with C ⊗_{K_∞} D_Sen(W) = W; it is the union of the finite-dimensional Γ_K-stable K_∞-subspaces of W^{H_K} and descends to a continuous semilinear Γ_K-representation over some K_n. There is a unique K_∞-linear endomorphism Θ_W (Sen's operator) with γ(x) = exp(log(χ(γ))·Θ_W)(x) for γ in an open subgroup depending on x; equivalently Θ_W = log(γ)/log χ(γ) for γ close to 1. For W = C ⊗ V write D_Sen(V), Θ_V. With the convention HT(χ_p) = +1, Θ_{Q_p(n)} = n, and V is Hodge–Tate iff Θ_V is semisimple with integer eigenvalues, which are then its Hodge–Tate weights.

*Hypotheses.* The subfield K_∞ (not the character) determines D_Sen; Θ depends on χ only through log χ. The Tate–Sen formalism for (C, K_∞) (normalised traces, (TS1)–(TS3)) is an input (requested from PG.2); Tate's theorem is R06.2/hodge-tate-decomposition-tate.

*API.*

- `senModule` (*constructor*) — D_Sen(W) ⊂ W^{H_K}, the Γ_K-finite vectors; C ⊗_{K_∞} D_Sen(W) = W.
- `senOperator` (*constructor*) — Θ_W: D_Sen(W) → D_Sen(W), K_∞-linear, = log(γ)/log χ(γ) near 1.
- `senModule_equiv` (*equivalence*) — W ↦ D_Sen(W) is an equivalence Rep_C(G_K) ≃ Rep_{K_∞}(Γ_K) compatible with ⊗ and duals.
- `senOperator_ker` (*characterisation*) — K_∞ ⊗_K W^{G_K} = ker Θ_W.
- `senOperator_tensor` (*functoriality*) — Θ_{W⊗W'} = Θ_W ⊗ 1 + 1 ⊗ Θ_{W'}; Θ_{W^*} = −Θ_W^*.

*Used by.*

- Berger 2002, Proposition 5.7 — θ∘ι_n maps D†,r_n(V) onto a K_n-form of D_Sen(V), which gives D_dif^+(V) by Nakayama
- Berger 2002, §5.6 — V is C-admissible iff Θ_V = 0 iff ∇_V(D†_rig(V)) ⊂ tD†_rig(V)
- `PadicHodgeTheory:R06.2/hodge-tate-weight-convention` — generalised Hodge–Tate weights are the eigenvalues of Θ_V (sign convention check)

*Unit tests.* A wrong definition fails one of these.

- `senOperator_tate_twist` (computation) — Θ_{Q_p(n)} = n on D_Sen(Q_p(n)) = K_∞ e_n.
- `senOperator_trivial` (degenerate) — Θ_{Q_p} = 0 and D_Sen(Q_p) = K_∞.
- `senOperator_zero_iff_potentially_unramified` (characterisation) — Θ_V = 0 iff V is C-admissible iff I_K acts on V through a finite quotient (Sen; R06.2/hodge-tate-decomposition-tate).
- `senOperator_nonsplit_nilpotent` (non-example) — For a non-split extension W of C by C, Θ_W is nonzero nilpotent, so W is not Hodge–Tate although Θ has integer eigenvalue 0.

*Construction.*

1. Brinon–Conrad Theorem 15.1.1: inflation H^1(Γ_K, GL_d(K_∞)) → H^1(G_K, GL_d(C)) is bijective (from the Tate–Sen descent Theorem 14.2.8).
2. Brinon–Conrad Theorem 15.1.2: existence and uniqueness of D_Sen(W), W^{H_K} = K̂_∞ ⊗ D_Sen(W).
3. Brinon–Conrad Theorem 15.1.5 / Corollary 15.1.6: D_Sen is the subspace of Γ_K-finite vectors and D_Sen is an equivalence onto Rep_{K_∞}(Γ_K).
4. Brinon–Conrad Theorem 15.1.7 and Corollary 15.1.10: Sen's operator, uniqueness, and K_∞ ⊗_K W^{G_K} = ker Θ.
5. Weights: on D_Sen(Q_p(n)) = K_∞·e_n, γ(e_n) = χ(γ)^n e_n, so Θ = n; the Hodge–Tate decomposition C ⊗ V ≅ ⊕C(h)^{m_h} (R06.2) gives Θ_V semisimple with eigenvalues h of multiplicity m_h.

*Acceptance.*

- D_Sen(Q_p(n)) = K_∞·e_n and Θ = n.
- A non-split extension of C by C (H^1(G_K, C) ≠ 0, R06.2) has nilpotent nonzero Θ.

*Uses.* `PadicHodgeTheory:R06.2/hodge-tate-decomposition-tate`, `PhiGammaModulesAndIwasawaCohomology:PG.2`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Theorem 15.1.2, p. 257: “There exists a unique GK -stable d-dimensional K∞ -subspace DSen (W ) in W on which H acts trivially” Existence and uniqueness of D_Sen.
- CMI Summer School notes on p-adic Hodge theory, Theorem 15.1.7 (Sen), p. 261: “there is a unique K∞ -linear endomorphism” Sen's operator.
- Représentations p-adiques et équations différentielles, §5.3, p. 50: “est un opérateur K∞ -linéaire qui ne dépend pas de γ” Θ_V = log(γ)/log χ(γ) on D_Sen(V).

#### Construction. Fontaine's D_dif^+(V), D_dif(V) and their connection

*Module* `TauCeti/PadicHodge/Monodromy/Dif.lean`. *Node* `PadicHodgeTheory:P7/fontaine-dif-module`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. Put K_∞[[t]] := ∪_n K_n[[t]] ⊂ B_dR^+ and K_∞((t)) = K_∞[[t]][1/t]. For a p-adic representation V of G_K, D_dif^+(V) is the K_∞[[t]]-module of Γ_K-finite vectors of (B_dR^+ ⊗_{Q_p} V)^{H_K} (the union of its finitely generated Γ_K-stable K_∞[[t]]-submodules); it is free of rank d, Γ_K-stable, and B_dR^+ ⊗_{K_∞[[t]]} D_dif^+(V) = B_dR^+ ⊗ V. There is a unique logarithmic connection ∇_V = ∇_{V,0}⊗dt/t on D_dif^+(V) with γ(v) ≡ exp(log χ(γ)·∇_{V,0})(v) mod t^r for γ close to 1 (depending on v, r); equivalently ∇_{V,0} = log(γ)/log χ(γ), a connection over t·d/dt. D_dif(V) := K_∞((t)) ⊗ D_dif^+(V) with the induced meromorphic connection; θ induces D_dif^+(V)/t ≅ D_Sen(V) with ∇_{V,0} mod t = Θ_V.

*Hypotheses.* K_∞[[t]] carries the t-adic topology mixed with the valuation topology on K_∞ (Brinon–Conrad §15.4); the 'de Rham topology' of §15.3 is used only in the descent step. Uses the Tate–Sen formalism (PG.2 request) and Sen's theory (PadicHodgeTheory:P7/sen-module).

*API.*

- `difPlus` (*constructor*) — D_dif^+(V) = ((B_dR^+ ⊗ V)^{H_K})_{Γ_K-finite}, free of rank d over K_∞[[t]].
- `difPlus_comparison` (*equivalence*) — B_dR^+ ⊗_{K_∞[[t]]} D_dif^+(V) ≅ B_dR^+ ⊗_{Q_p} V, G_K-equivariantly.
- `difConnection` (*constructor*) — ∇_V on D_dif^+(V): the unique logarithmic connection with γ = exp(log χ(γ)∇_{V,0}) mod t^r near 1.
- `dif` (*constructor*) — D_dif(V) = K_∞((t)) ⊗ D_dif^+(V) with its meromorphic connection.
- `difPlus_mod_t` (*compatibility*) — θ: D_dif^+(V)/tD_dif^+(V) ≅ D_Sen(V) intertwining ∇_{V,0} with Θ_V.
- `dif_functor` (*functoriality*) — V ↦ D_dif(V) is exact and compatible with ⊗, duals and restriction to G_L (L/K finite, K_∞ replaced by L_∞).

*Used by.*

- Berger 2002, Propositions 5.7 and 5.9 — D_dif^+(V) = K_∞[[t]] ⊗ ι_n(D†,r_n(V)) and D_dR(V) = (ker ∇_V)^{Γ_K}
- Berger 2002, Théorème 5.10 — N_s is defined by ι_n(x) ∈ K_n[[t]] ⊗ D_dR(V), a Γ_K-stable lattice of D_dif(V)
- Berger 2008, §V.2 — L_n[[t]] ⊗ D†,r_rig(V) = Fil^0(L_n((t)) ⊗ D_dR(V)) identifies the filtration

*Unit tests.* A wrong definition fails one of these.

- `difPlus_tate_twist` (computation) — D_dif^+(Q_p(n)) = K_∞[[t]]·e_n with ∇_{V,0}(e_n) = n·e_n.
- `difPlus_trivial` (degenerate) — D_dif^+(Q_p) = K_∞[[t]] with ∇_{V,0} = t d/dt.
- `difPlus_mod_t_sen` (compatibility) — D_dif^+(V)/t ≅ D_Sen(V) with ∇_{V,0} ↦ Θ_V.
- `dif_not_flat_nonsplit` (non-example) — For a non-split extension V of Q_p(1) by Q_p (Hodge–Tate, not de Rham; Brinon–Conrad §6.3), the connection on D_dif(V) is not flat.

*Construction.*

1. Brinon–Conrad Proposition 15.2.4 / Corollary 15.2.5: descent from B_dR^+-representations of G_K to L_dR^+ = (B_dR^+)^{H_K}-representations of Γ_K.
2. Brinon–Conrad Theorem 15.3.8 and Corollary 15.3.10: decompletion to the Γ_K-finite vectors X_f, finitely generated over K_∞[[t]] with L_dR^+ ⊗ X_f ≅ X.
3. Brinon–Conrad Theorem 15.3.11: Rep_{K_∞[[t]]}(Γ_K) ≃ Rep_{B_dR^+}(G_K); D_dif^+(V) is the image of B_dR^+ ⊗ V.
4. Brinon–Conrad Proposition 15.4.5: the unique logarithmic connection; reduction mod t recovers Sen's operator (Theorem 15.1.7).
5. Freeness of rank d: D_dif^+(V) is a finitely generated torsion-free K_∞[[t]]-module (K_∞[[t]] is a union of DVRs K_n[[t]]) with generic rank d.

*Acceptance.*

- D_dif^+(Q_p(n)) = K_∞[[t]]·e_n and ∇_{V,0}(e_n) = n e_n; t^{−n}e_n is horizontal in D_dif(Q_p(n)).
- D_dif^+(Q_p) = K_∞[[t]] with ∇_0 = t d/dt.

*Uses.* `PadicHodgeTheory:R06.1/de-rham-period-ring`, `PadicHodgeTheory:R06.1/fontaine-element-t`, `PadicHodgeTheory:P7/sen-module`, `PhiGammaModulesAndIwasawaCohomology:PG.2`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Definition 15.4.14, p. 285: “we define Ddif (V ) ∈ RK∞ ,t to be the object associated to the canonical K∞ ((t))-descent” Definition of D_dif(V).
- CMI Summer School notes on p-adic Hodge theory, Proposition 15.4.5, p. 280: “there exists a unique connection” The logarithmic connection.
- Représentations p-adiques et équations différentielles, §5.3, p. 50: “contient un plus grand élément” Fontaine's D_dif^+(V) as the largest finitely generated Γ_K-stable K_∞[[t]]-submodule.

#### Construction. The integral lattice D_cris(T) of a crystalline lattice

*Module* `TauCeti/NumberTheory/PadicHodge/Wach/Comparison.lean`. *Node* `PadicHodgeTheory:P7/integral-dcris-lattice`.

For a G_F-stable lattice T of a crystalline V, D_cris(T) is the image of N(T) in D_cris(V) under the isomorphism D_cris(V) = N(V)/pi N(V) of P7/wach-dcris-comparison. It is an O_F-lattice in D_cris(V), stable under phi when the weights are <= 0, with the induced filtration Fil^i_T; T |-> D_cris(T) is inclusion-preserving and injective on the lattices of a fixed V; and, if -r_1, ..., -r_d are the Hodge–Tate weights, the determinant of the comparison isomorphism B_max tensor V = B_max tensor D_cris(V) computed in bases of T and D_cris(T) lies in t^{r_1 + ... + r_d} W(k)^x.

*Hypotheses.* K = F = W(k)[1/p] is absolutely unramified (Wach modules are only claimed over unramified bases). T is a G_F-stable Z_p-lattice in a crystalline representation V of dimension d, with Hodge–Tate weights in [a, b] for the convention HT(chi) = +1 (Berger writes r_j = -(weights) and calls V positive when all weights are <= 0). N(T) and N(V) = B^+_F tensor N(T) are the Wach modules imported from PhiGammaModulesAndIwasawaCohomology:PG.6 (a Wach module over B^+_F must include the condition that B_F tensor N is an etale (phi, Gamma)-module, Berger errata 2026 for Definition III.4.1); q = phi(pi)/pi. V is a p-adic representation of G_K of dimension d; D_st, D_cris, D_dR are the period functors of PadicHodgeTheory:R06.2/period-functors with Fontaine's normalisations (u = log[p~], N = -d/du, N phi = p phi N); HT(chi) = +1, so 'positive' in Berger's sense means Hodge–Tate weights <= 0.

*API.*

- `Wach.dcrisLattice` (*constructor*) — D_cris(T) = image of N(T) in N(V)/pi N(V) = D_cris(V).
- `Wach.dcrisLattice_isLattice` (*characterisation*) — D_cris(T) is a free O_F-submodule of rank d spanning D_cris(V).
- `Wach.dcrisLattice_phi` (*relation*) — phi(D_cris(T)) is contained in D_cris(T) when all Hodge–Tate weights are <= 0.
- `Wach.dcrisLattice_mono` (*functoriality*) — T_1 contained in T_2 implies D_cris(T_1) contained in D_cris(T_2).
- `Wach.dcrisLattice_injective` (*characterisation*) — D_cris(T_1) = D_cris(T_2) iff T_1 = T_2.
- `Wach.det_comparison` (*relation*) — det of B_max tensor V = B_max tensor D_cris(V) in bases of T and D_cris(T) lies in t^{sum r_i} W(k)^x.
- `Wach.filtrationT` (*data*) — Fil^i_T D_cris(T): images of Fil^i N(T) = Fil^i N(V) cap N(T).

*Used by.*

- `PadicHodgeTheory:P7/wach-fontaine-laffaille-comparison` — D_cris(T) is strongly divisible in the Fontaine–Laffaille range
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3` — comparison with the Fontaine–Laffaille lattice
- `PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences` — rational consequences of the integral classification
- Berger 2004, Section V.1 — Tamagawa number computations (Benois–Berger)

*Unit tests.* A wrong definition fails one of these.

- `wachLattice.test_twist` (computation) — For T = Z_p(r), r <= 0: D_cris(T) = O_F t^{-r} e_r.
- `wachLattice.test_det` (computation) — For T = Z_p(r) the comparison determinant is t^{-r} times a unit of W(k).
- `wachLattice.test_trivial` (degenerate) — For T = Z_p: D_cris(T) = O_F.
- `wachLattice.test_not_dual` (non-example) — D_cris(T) depends on T, not only on V: for T and pT (same V) D_cris(pT) = p D_cris(T) != D_cris(T).

*Construction.*

1. Lattice: N(T) is free of rank d over A^+_F (PG.6), so N(T)/pi N(T) is a free O_F-module of rank d inside N(V)/pi N(V).
2. Determinant: the inclusion A^+ tensor N(T) in A^+ tensor T has determinant generating (pi^{r_1+...+r_d}) (PG.6, Berger 2004 Theoreme III.3.1); D_cris(T) is the set of x in (B^+_{rig,F} tensor N(T))^{Gamma_F} with x(0) in N(T)/pi N(T), and the inclusion B^+_{rig,F} tensor D_cris(T) in B^+_{rig,F} tensor N(T) has determinant (t/pi)^{sum r_i} f_0 with f_0 a unit of A^+_F; combine, and use crystallinity to land in W(k)^x (Berger 2004 Proposition V.1.2).
3. Injectivity on lattices: Berger 2004 Remarque V.1.3 (T recovered from N(T) by T = (A tensor N(T))^{phi=1}).

*Acceptance.*

- For T = Z_p(r) (r <= 0): D_cris(T) = O_F t^{-r} e_r and the comparison determinant is t^{-r} up to a unit.

*Uses.* `PadicHodgeTheory:P7/wach-dcris-comparison`, `PhiGammaModulesAndIwasawaCohomology:PG.6`, `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-log-element-t`.

*Sources.*

- Limites de représentations cristallines, Définition V.1.1, p. 28: “Si T est un réseau de V , alors on appelle Dcris (T ) l’image de N(T ) dans Dcris (V ) par l’isomorphisme Dcris (V ) = N(V )/πN(V ).” Definition.
- Limites de représentations cristallines, Proposition V.1.2, p. 28: “alors Dcris (T ) est un OF -réseau de Dcris (V ) (stable par ϕ si les ri sont ≥ 0)” Lattice property.
- Limites de représentations cristallines, Remarque V.1.3, p. 29: “On peut de plus montrer que Dcris (T1 ) = Dcris (T2 ) si et seulement si T1 = T2 .” Injectivity on lattices.

### Lemmas, theorems and comparisons

#### Theorem. Berger's identification B^dagger_{rig,K} = R_{F'}(pi_K)

*Node* `PadicHodgeTheory:P7/berger-robba-identification`.

Assume the hypotheses, and let r >= r(K) and alpha(K,r) = p^{-1/(e_K r)}. (a) f |-> f(pi_K) is an isomorphism of topological rings O_{F'}([alpha(K,r), 1)) -> B^{dagger,r}_{rig,K}, restricting to an isomorphism from the bounded elements onto B^{dagger,r}_K; hence R_{F'} = B^dagger_{rig,K}, R^bd_{F'} = B^dagger_K and R^int_{F'} = A^dagger_K := A_K cap B^dagger_K, in the variable pi_K. (b) Under (a), phi is a Frobenius lift of the Robba ring R_{F'} in the sense of PadicDifferentialEquationsAndRigidCohomology:RD.0/frobenius-lift-on-robba-ring: sigma-semilinear on F', phi(pi_K) in R^int_{F'} and phi(pi_K) - pi_K^p in p R^int_{F'} (q = p); Gamma_K acts by continuous automorphisms, semilinear over F' through Gamma_K -> Gal(F'/F); partial(pi_K) is a unit of B^{dagger,r}_K for r large and partial = partial(pi_K) d/dpi_K, with kernel F'. (c) The Frechet topology on B^{dagger,r}_K from (a) coincides with the topology induced by B~^{dagger,r}_{rig} (P7/extended-robba-ring-with-galois-action), so B^{dagger,r}_{rig,K} is Berger's completion and B^dagger_{rig,K} embeds continuously and equivariantly in (B~^dagger_{rig})^{H_K}.

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt. Berger's radius convention: for r > 0, C[r;1[ = {z : p^{-1/r} <= |z| < 1}; r_n = p^{n-1}(p-1), so that |zeta_{p^n} - 1| = p^{-1/r_n}. The coefficient field of the Laurent series is F' and e_K is the ramification index of K_infinity/F_infinity; Berger 2002 prints F and e_K = [K_infinity : F_infinity], which agree with the corrected statement exactly when F' = F (Berger 2008 Section I.2 and Appendix B).

*Proof outline.*

1. (a) PG.0 gives B^{dagger,r}_K = {f(pi_K) : f bounded in O_{F'}([alpha(K,r),1))} (Berger 2002 Proposition 1.4, corrected to F'). Bounded Laurent series, indeed Laurent polynomials, are dense in O_{F'}([alpha,1)) and the latter is complete (P7:annulus-foundations/frechet-topology), so the completion is O_{F'}([alpha,1)); unions give the statements for R, R^bd; R^int = R cap O_E (bounded-robba-ring).
2. (b) phi on E_K = k_{K_infinity}((pi_K bar)) is the p-power map, so phi(pi_K) is congruent to pi_K^p modulo p A_K; phi(pi_K) is overconvergent because phi maps B^{dagger,r}_K to B^{dagger,pr}_K (PG.0). partial(pi_K) != 0 because pi_K is not in ker partial = F', and B^dagger_K is a field (bounded-robba-ring; RD.0/bounded-robba-ring), so partial(pi_K) is a unit of B^{dagger,r}_K for r large (Berger 2002 Proposition 4.4 proof). The chain rule on B^dagger_K (a finite etale extension of B^dagger_F) and continuity give partial = partial(pi_K) d/dpi_K.
3. (c) Berger 2002 Section 2.6: on B^{dagger,r}_K the topology induced by B~^{dagger,r}_{rig} is that of convergence on compact subannuli. Independence of pi_K: P7/robba-ring-of-p-adic-field.

*Acceptance.*

- For K = Q_p(zeta_p) (F = Q_p, K_infinity = F_infinity): e_K = 1, F' = Q_p, and one may take pi_K = pi; then B^dagger_{rig,K} = B^dagger_{rig,Q_p}. For K = Q_p(sqrt(u p*)) as in the test of P7/robba-ring-of-p-adic-field, F' = Q_{p^2} and the coefficients are in Q_{p^2}.

*Uses.* `PadicHodgeTheory:P7/robba-ring-of-p-adic-field`, `PadicHodgeTheory:P7/extended-robba-ring-with-galois-action`, `PhiGammaModulesAndIwasawaCohomology:PG.0`, `PadicHodgeTheory:P7:annulus-foundations/frechet-topology`, `PadicHodgeTheory:P7:annulus-foundations/bounded-robba-ring`, `PadicHodgeTheory:P7:annulus-foundations/robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/frobenius-lift-on-robba-ring`.

*Planet:* Berger's identification of B^dagger_rig,K.

*Sources.*

- Représentations p-adiques et équations différentielles, Proposition 2.31, p. 27: “qui à f associe f (πK ) est un isomorphisme” The isomorphism H_F^{alpha(K,r)} -> B^{dagger,r}_{rig,K}, f |-> f(pi_K) (with F to be read F').
- Équations différentielles p-adiques et (φ,N)-modules filtrés, Section I.2, p. 6: “suite bornée telle que f (XK ) converge sur la couronne 0 < vp (XK ) ⩽ 1/eK r.” Corrected form: coefficients in K_0', annulus 0 < v_p(X_K) <= 1/(e_K r).
- Équations différentielles p-adiques et (φ,N)-modules filtrés, Appendice B, p. 27: “il est affirmé que l’anneau B†K est un anneau de séries formelles à” Erratum: the coefficient field is the maximal unramified extension of F in K_infinity.
- Représentations p-adiques et équations différentielles, Proposition 4.4, proof, p. 40: “B†rig,K [log(πK )]. Rappelons que B†K est un corps, et on peut donc se” partial(pi_K) and its inverse are overconvergent.

#### Lemma. Tensor identity B^dagger_{rig,K} = B^dagger_{rig,F} tensor B^dagger_K

*Node* `PadicHodgeTheory:P7/robba-ring-tensor-identity`.

For r large, the multiplication map B^{dagger,r}_{rig,F} tensor over B^{dagger,r}_F of B^{dagger,r}_K -> B^{dagger,r}_{rig,K} is an isomorphism of topological rings, compatible with phi and Gamma_K; hence B^dagger_{rig,K} = B^dagger_{rig,F} tensor over B^dagger_F of B^dagger_K, a free B^dagger_{rig,F}-module of rank [K_infinity : F_infinity], and B^dagger_{log,K} = B^dagger_{log,F} tensor over B^dagger_F of B^dagger_K.

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt. Berger's radius convention: for r > 0, C[r;1[ = {z : p^{-1/r} <= |z| < 1}; r_n = p^{n-1}(p-1), so that |zeta_{p^n} - 1| = p^{-1/r_n}.

*Proof outline.*

1. PG.0: for r large, B^{dagger,r}_K is a free B^{dagger,r}_F-module of rank [K_infinity : F_infinity] (Berger 2008 Section I.2), with a basis (e_i).
2. B^{dagger,r}_{rig,F} tensor B^{dagger,r}_K is the free B^{dagger,r}_{rig,F}-module on (e_i), complete for the product topology; its image contains B^{dagger,r}_K densely (Laurent polynomials, hence B^{dagger,r}_F, are dense in B^{dagger,r}_{rig,F}).
3. Topologies agree: the coordinate maps x |-> T_{K/F}(x e_i*) (trace dual basis) are continuous B^{dagger,r}_F-linear maps, bounded on each compact subannulus (the trace is a finite sum of Gamma-conjugates, cf. Berger 2002 proof of Proposition 2.32), and extend to B^{dagger,r}_{rig,K}; so the map is a topological isomorphism onto the completion B^{dagger,r}_{rig,K}.
4. phi and Gamma_K act diagonally; the log statement is base change of the polynomial ring.

*Acceptance.*

- For K = F both sides are B^dagger_{rig,F}.

*Uses.* `PadicHodgeTheory:P7/robba-ring-of-p-adic-field`, `PadicHodgeTheory:P7/berger-robba-identification`, `PhiGammaModulesAndIwasawaCohomology:PG.0`, `PadicHodgeTheory:P7:annulus-foundations/frechet-topology`, `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`.

*Sources.*

- Représentations p-adiques et équations différentielles, Lemme 3.13, p. 37: “Lemme 3.13. On a B†rig,K = B†rig,F ⊗B† B†K .” The tensor identity (Berger refers to Andre's Lemma 4.1 for the proof, not available here).
- Équations différentielles p-adiques et (φ,N)-modules filtrés, Section I.2, p. 6: “qu’il existe r0 (K) tel que si r ⩾ r0 (K), alors B†,r” B^{dagger,r}_K is free of rank [K_infinity : F_infinity] over B^{dagger,r}_F for r >= r_0(K).

#### Lemma. Plus-part splitting of B~^dagger_rig and its H_K-invariants

*Node* `PadicHodgeTheory:P7/extended-robba-plus-decomposition`.

(a) For r > 0 the sequence 0 -> B~^+ -> B~^{dagger,r} (+) B~^+_{rig} -> B~^{dagger,r}_{rig} -> 0, with B~^+ = W(O_C^flat)[1/p], x |-> (x, -x) and (a, b) |-> a + b, is exact: every element of B~^{dagger,r}_{rig} is a bounded element plus an element of B~^+_{rig}. (b) Taking H_K-invariants keeps it exact: 0 -> B~^+_K -> B~^{dagger,r}_K (+) (B~^+_{rig})^{H_K} -> B~^{dagger,r}_{rig,K} -> 0, where B~^{dagger,r}_{rig,K} = (B~^{dagger,r}_{rig})^{H_K}. (c) Every x in (B^+_max)^{H_K} is sum_{i>=0} a_i (omega/p)^i with a_i in B~^+_K tending to 0, omega a generator of ker theta. (d) B~^{dagger,r}_K is dense in B~^{dagger,r}_{rig,K}.

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt.

*Proof outline.*

1. (a) Berger 2002 Lemme 2.18: for r_n >= r, split B~_{[r, r_n]} = B~_{[r, infinity]} + B~_{[0, r_n]} with intersection B~^+ (Lemme 2.15), then pass to the limit over n correcting by elements of B~^+ (the argument of P7:annulus-foundations/annulus-limit-comparison (c) for the Witt-vector rings).
2. (b) The connecting map lands in H^1(H_K, B~^+); after multiplying by [epsilon - 1]^{-1} and a power of p it lands in H^1(H_K, W(m_{C^flat})), which vanishes (Berger 2002 Lemme 2.27, citing Colmez); recorded as a gap below.
3. (c) theta : A~^+_K -> O_{K^_infinity} is surjective (via norm-compatible uniformisers, Berger 2002 Lemme 2.29 proof), then successive division by omega/p in A^+_max; a_i -> 0 by the growth condition defining A^+_max.
4. (d) Berger 2002 Proposition 2.30: by (b) reduce to (B~_{[0, r_{n+m}]})^{H_K}, expand with (c) applied through phi^{n+m} in powers of phi^{n+m-1}(q/p) - 1, which tends to 0 on compact intervals.

*Acceptance.*

- For K = F: B~^{dagger,r}_{rig,F} contains B^{dagger,r}_{rig,F} and t = log[epsilon] is its plus part (t lies in B~^+_{rig}).

*Uses.* `PadicHodgeTheory:P7/extended-robba-ring-with-galois-action`, `PhiGammaModulesAndIwasawaCohomology:PG.0`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:R06.1/de-rham-period-ring`, `PadicHodgeTheory:P7:annulus-foundations/annulus-limit-comparison`.

*Sources.*

- Représentations p-adiques et équations différentielles, Lemme 2.18, p. 22: “Lemme 2.18. On a une suite exacte” Exactness of the plus-part splitting.
- Représentations p-adiques et équations différentielles, Corollaire 2.28, p. 26: “Corollaire 2.28. Dans le cas où I = [0; +∞[, on obtient la suite” H_K-invariant version.
- Représentations p-adiques et équations différentielles, Lemme 2.27, proof, p. 26: “ce dernier espace de cohomologie est nul ([15, IV.2.4] appliqué à la représentation triviale)” The vanishing of H^1(H_K, W(m)) is quoted from Colmez [15].

#### Lemma. Regularisation by Frobenius

*Node* `PadicHodgeTheory:P7/frobenius-regularisation`.

(a) For an integer h >= 0 and r > 0: the intersection over s >= 0 of p^{-hs} A~^{dagger, p^{-s} r} is A~^+, and the intersection over s >= 0 of p^{-hs} A~^{dagger, p^{-s} r}_{rig} is contained in B~^+_{rig}. (b) If A is a u x r matrix with entries in B~^dagger_{log} and P in GL_u(F) satisfies A = P phi^{-1}(A), then A has entries in B~^+_{log} = B~^+_{rig}[X].

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt.

*Proof outline.*

1. (a) For x = sum_{k>=0} p^k [x_k] in the intersection, p^{hs} x in A~^{dagger, p^{-s} r} gives v_E(x_k) >= -(k + hs) r/(p^{s-1}(p-1)); letting s -> infinity gives v_E(x_k) >= 0. For the rig version write x = a_s + b_s with a_s in p^{-hs} A~^{dagger, p^{-s} r} and b_s in B~^+ (P7/extended-robba-plus-decomposition (a)), adjust the b_s so that a_s is constant, and conclude with the first part (Berger 2002 Lemme 3.1).
2. (b) Expand entries in powers of X = log[epsilon - 1]; phi^{-1}(X^n) = p^{-n} X^n; if the coefficients lie in p^{-c} A~^{dagger,r}_{rig}, iterating A = P phi^{-1}(A) puts them in p^{-h-c} A~^{dagger, r/p}_{rig}, then in the intersection of (a) (Berger 2002 Proposition 3.2).

*Acceptance.*

- (B~^dagger_{rig})^{phi = 1} = Q_p: a phi-fixed x satisfies x = phi^{-1}(x), so x lies in B~^+_{rig} by (b), and (B~^+_{rig})^{phi=1} = Q_p (R06.1/crystalline-period-ring).
- t ∈ B̃+_rig satisfies φ(t) = pt, i.e. A = (t), P = (p) (u = r = 1); t^{−1} satisfies φ(t^{−1}) = p^{−1}t^{−1} but t^{−1} ∉ B̃†_rig, consistent with the hypothesis A ∈ M(B̃†_log).

*Uses.* `PadicHodgeTheory:P7/extended-robba-ring-with-galois-action`, `PadicHodgeTheory:P7/extended-robba-plus-decomposition`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:P7/log-extended-period-rings`.

*Sources.*

- Représentations p-adiques et équations différentielles, Proposition 3.2, p. 31: “Proposition 3.2 (Régularisation par le Frobenius).” Statement of the regularisation proposition.
- An introduction to the theory of p-adic representations, IV.3.3, p. 28: “This is what we get by regularization (of the periods).” Periods of V in B~^dagger_rig are regularised into B~^+_rig.

#### Comparison. The Robba realisation D^dagger_rig(V) of a p-adic representation

*Node* `PadicHodgeTheory:P7/robba-realisation-comparison`.

Let V be a p-adic representation of G_K of dimension d. Import from PhiGammaModulesAndIwasawaCohomology:PG.1-PG.2: the etale (phi, Gamma_K)-module D(V) = (B tensor V)^{H_K} over B_K with V = (B tensor_{B_K} D(V))^{phi = 1}, and the overconvergent module D^dagger(V) = (B^dagger tensor V)^{H_K}, free of rank d over B^dagger_K with D(V) = B_K tensor D^dagger(V) and B^dagger tensor_{B^dagger_K} D^dagger(V) = B^dagger tensor_{Q_p} V, and its models D^{dagger,r}(V) for r >= r(V). Define D^dagger_rig(V) = B^dagger_{rig,K} tensor_{B^dagger_K} D^dagger(V), D^{dagger,r}_rig(V) = B^{dagger,r}_{rig,K} tensor D^{dagger,r}(V) and D^dagger_log(V) = B^dagger_{log,K} tensor D^dagger(V). Then: (a) D^dagger_rig(V) is a free B^dagger_{rig,K}-module of rank d with commuting semilinear phi and Gamma_K, and the linearisation of phi is an isomorphism (etale, slope 0 for the slope theory of RD.3); (b) for r >= r(V), phi(D^{dagger,r}_rig(V)) is contained in D^{dagger,pr}_rig(V) and B^{dagger,pr}_{rig,K} tensor phi(D^{dagger,r}_rig(V)) = D^{dagger,pr}_rig(V); (c) B~^dagger_{rig} tensor_{B^dagger_{rig,K}} D^dagger_rig(V) = B~^dagger_{rig} tensor_{Q_p} V, compatibly with phi and G_K, so D^dagger_rig(V) is contained in (B~^dagger_{rig} tensor V)^{H_K} = B~^dagger_{rig,K} tensor D^dagger(V) and V = (B~^dagger_{rig} tensor D^dagger_rig(V))^{phi = 1}; (d) V |-> D^dagger_rig(V) is an exact tensor functor compatible with duals and Tate twists: D^dagger_rig(V(n)) = D^dagger_rig(V) tensor e_n with phi(e_n) = e_n and gamma(e_n) = chi(gamma)^n e_n.

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt. V a finite-dimensional Q_p-vector space with a continuous linear G_K-action; r(V) from PG.2 (Cherbonnier–Colmez).

*Proof outline.*

1. (a), (d): base change of PG.1-PG.2's statements for D^dagger(V) along B^dagger_K -> B^dagger_{rig,K} (P7/robba-ring-of-p-adic-field); etaleness: the matrix of phi in a basis of D^dagger(V) is invertible over B^dagger_K (B^dagger_K is a field, P7/berger-robba-identification).
2. (b): choose a basis of D^{dagger,r}(V) in which the matrix of phi lies in GL_d(B^{dagger,pr}_K) (Berger 2008 Theoreme I.3.3 argument).
3. (c): B^dagger tensor D^dagger(V) = B^dagger tensor V (PG.2) base changed to B~^dagger_{rig} (P7/extended-robba-ring-with-galois-action); H_K-invariants of B~^dagger_{rig} tensor V: the equality with B~^dagger_{rig,K} tensor D^dagger(V) holds since D^dagger(V) has a basis of H_K-invariant vectors; the phi = 1 statement uses (B~^dagger_{rig})^{phi=1} = Q_p (P7/frobenius-regularisation applied to 1 x 1 matrices and B~^+_{rig}^{phi=1} = Q_p from R06.1).

*Acceptance.*

- For V = Q_p(n): D^dagger_rig(V) = B^dagger_{rig,K} e_n with phi(e_n) = e_n and gamma(e_n) = chi(gamma)^n e_n; D^dagger_rig(V)^{Gamma_K} = 0 for n != 0 while (D^dagger_rig(V)[1/t])^{Gamma_K} = F t^{-n} e_n.

*Uses.* `PhiGammaModulesAndIwasawaCohomology:PG.1`, `PhiGammaModulesAndIwasawaCohomology:PG.2`, `PadicHodgeTheory:P7/robba-ring-of-p-adic-field`, `PadicHodgeTheory:P7/berger-robba-identification`, `PadicHodgeTheory:P7/extended-robba-ring-with-galois-action`, `PadicHodgeTheory:P7/frobenius-regularisation`.

*Sources.*

- Représentations p-adiques et équations différentielles, Théorème 1.3, p. 12: “Toute représentation V de GK est surconvergente,” Overconvergence (Cherbonnier–Colmez), imported from PG.2.
- Représentations p-adiques et équations différentielles, Section 3.2, p. 31: “Le théorème 1.3 montre que D†rig (V ) et D†log (V ) sont des B†rig,K -” D^dagger_rig(V), D^dagger_log(V) are free of rank d.
- Représentations p-adiques et équations différentielles, Section 5.1, p. 46: “= Qp et donc que l’on peut récupérer V par la formule” Recovering V as the phi-invariants of B~^dagger_{rig} tensor D^dagger_rig(V).
- An introduction to the theory of p-adic representations, III.3, p. 25: “is a theorem of Colmez and Cherbonnier which shows that every p-adic” Every p-adic representation is overconvergent.
- Errata for my articles, Section 4, Theorem I.3.3: “In item (2), it is better to require that” Part (b) uses the corrected form: B^{dagger,pr}_{rig,K} tensor D_r is generated by phi(D_r).

#### Lemma. Kernel of θ∘ι_n on B̃†_rig, B†_rig,K and D†_rig(V)

*Node* `PadicHodgeTheory:P7/theta-iota-kernel`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. (a) For r ≤ r_n: ker(θ∘ι_n: B̃†,r_n_rig → C) = φ^{n−1}(q)·B̃†,r_n_rig. (b) For r > 0 and n ≥ n(r), n ≥ n(K): ker(θ∘ι_n: B†,r_rig,K → C) = φ^{n−1}(q)·B†,r_rig,K. (c) For a p-adic representation V of G_K with D†,r_rig(V) = B†,r_rig,K ⊗_{B†,r_K} D†,r(V) and n ≥ n(r): ker(θ∘ι_n: D†,r_rig(V) → C ⊗_{Q_p} V) = φ^{n−1}(q)·D†,r_rig(V), and ker(θ∘ι_n: D†,r(V) → C ⊗ V) = φ^{n−1}(q)·D†,r(V).

*Hypotheses.* r is large enough that D†,r(V) has a B†,r_K-basis which is a B_K-basis of D(V) (Cherbonnier–Colmez, PG.2).

*Proof outline.*

1. Proposition 2.12: on Ã_I with r_n ∈ I, ker(θ∘ι_n) = ([p̃^{p^n}]/p − 1)Ã_I.
2. Remark 2.14: [p̃^{p^n}] − p = φ^n([p̃] − p), φ^{n−1}(q) = φ^n(ω), and [p̃] − p and ω generate the same ideal of A_inf (both generate ker θ, R06.1/de-rham-period-ring); hence ker(θ∘ι_n) = φ^{n−1}(q)B̃_I.
3. Proposition 2.17: intersect over the closed I ⊂ [r_n; +∞[ to get (a).
4. Proposition 4.8 for (b): if x ∈ B†,r_rig,K has θ∘ι_n(x) = 0 then x = φ^{n−1}(q)y with y ∈ B̃†,r_rig,K by (a) and H_K-invariance; applying the B†_rig,K-linear section R_0 (PadicHodgeTheory:P7/decompletion-operators) gives x = φ^{n−1}(q)R_0(y), so y = R_0(y) ∈ B†,r_rig,K (φ^{n−1}(q) is a non-zero-divisor).
5. Lemma 5.1 for (c): write x in a basis {e_i} of D†(V) and argue componentwise with R_0 extended to B̃†_rig,K ⊗ D†(V); for D†,r(V) use that an element of B†,r_n_K divisible by φ^{n−1}(q) in B†,r_n_rig,K is divisible in B†,r_n_K.

*Acceptance.*

- θ∘ι_n(t) = 0 and t ∈ φ^{n−1}(q)B†,r_rig,F for every n ≥ n(r), consistent with t = π·Π_{n≥1} φ^{n−1}(q)/p.

*Uses.* `PadicHodgeTheory:P7/extended-robba-ring-with-galois-action`, `PadicHodgeTheory:P7/extended-localisation-maps`, `PadicHodgeTheory:P7/decompletion-operators`, `PadicHodgeTheory:R06.1/de-rham-period-ring`, `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PadicHodgeTheory:P7/robba-realisation-comparison`, `PhiGammaModulesAndIwasawaCohomology:PG.2`.

*Sources.*

- Représentations p-adiques et équations différentielles, Proposition 4.8, p. 42: “ker(θ ◦ ιn : B†,r rig,K → Cp ) = ϕn−1 (q)B†,r rig,K” Statement (b).
- Représentations p-adiques et équations différentielles, Lemme 5.1, p. 46: “Nous aurons besoin du résultat suivant qui est un corollaire immédiat de la proposition 2.17” Statement (c) as a corollary of (a).

#### Lemma. Divisibility by t is detected at the points zeta_{p^n} - 1

*Node* `PadicHodgeTheory:P7/t-divisibility-criterion`.

Let x in B^{dagger,r}_{rig,K} be such that x lies in phi^{n-1}(q) B^{dagger,r_n}_{rig,K} for all n large. Then x lies in t B^dagger_{rig,K}. The same holds for a finite free B^dagger_{rig,K}-module M with a basis, coefficientwise; in particular for M = D^{dagger}_rig(V).

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt. Berger's radius convention: for r > 0, C[r;1[ = {z : p^{-1/r} <= |z| < 1}; r_n = p^{n-1}(p-1), so that |zeta_{p^n} - 1| = p^{-1/r_n}.

*Proof outline.*

1. Reduce to s = r_{n_0} with x in phi^{n-1}(q) B^{dagger,s}_{rig,K} for n >= n_0: an element of B^{dagger,s}_{rig,K} divisible by phi^{n-1}(q) in B^{dagger,r_n}_{rig,K} is divisible in B^{dagger,s}_{rig,K} (divisibility is decided by zeros: P7:annulus-foundations/annulus-factor-theorem, weierstrass-preparation-on-circles).
2. The phi^{n-1}(q) are pairwise coprime, so x = phi^n(pi) p^{-n} x_n with x_n in B^{dagger,s}_{rig,K} (phi^{n_0-1}(pi) is a unit of B^{dagger,s}_{rig,K}).
3. From phi^n(pi) p^{-n} x_n = phi^{n+1}(pi) p^{-n-1} x_{n+1}: x_n - x_{n+1} = x_{n+1}(phi^n(q)/p - 1), and V_I(1 - phi^n(q)/p) -> infinity on every compact I, so (x_n) is Cauchy for each V_I; its limit y satisfies x = t y since phi^n(pi)/p^n -> t (P7:annulus-foundations/cyclotomic-log-element-t, frechet-topology).

*Acceptance.*

- x = t^2 satisfies the hypothesis and x/t = t; x = pi does not (theta o iota_n(pi) = zeta_{p^n} - 1 != 0).
- x = t: t ∈ φ^{n−1}(q)B†,r_n_rig,F for all n ≥ n(r).
- x = π is divisible by no φ^{n−1}(q), n ≥ 1, and π ∉ tB†_rig,F.

*Uses.* `PadicHodgeTheory:P7/berger-robba-identification`, `PadicHodgeTheory:P7/localisation-maps-p-adic-field`, `PadicHodgeTheory:P7:annulus-foundations/annulus-factor-theorem`, `PadicHodgeTheory:P7:annulus-foundations/weierstrass-preparation-on-circles`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-log-element-t`, `PadicHodgeTheory:P7:annulus-foundations/frechet-topology`, `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PadicHodgeTheory:P7/theta-iota-kernel`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/analytic-ring-bezout`, `PadicHodgeTheory:P7/robba-realisation-comparison`.

*Sources.*

- Représentations p-adiques et équations différentielles, Lemme 4.6, p. 41: “Alors x ∈ tB†rig,K .” Lemma 4.6 statement.
- Représentations p-adiques et équations différentielles, Lemme 5.4, p. 48: “Après le choix d’une base de D†rig (V ) cela suit immédiatement de 4.6.” Module version.

#### Lemma. χ^i-eigenvectors in B̃†_log

*Node* `PadicHodgeTheory:P7/cyclotomic-eigenvectors-in-log-ring`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. For i ∈ Z: {x ∈ B̃†_log : g(x) = χ(g)^i x for all g ∈ G_K} = K_0·t^i if i ≥ 0, and = 0 if i < 0.

*Hypotheses.* The ring B̃†_log does not contain t^{−1}; with t inverted the answer would be K_0 t^i for all i.

*Proof outline.*

1. For n ≥ 0 put V_i^n = (B̃†,r_n_log(i))^{G_K}; ι_n maps it injectively into {y ∈ B_dR : g(y) = χ(g)^i y} = K·t^i, so V_i^n is a K_0-space of dimension ≤ [K : K_0], stable by φ (PadicHodgeTheory:P7/log-extended-period-rings (d), R06.1/period-ring-invariants: (B_dR)^{G_K} = K).
2. By Frobenius regularisation (PadicHodgeTheory:P7/frobenius-regularisation) V_i^n = (B̃+_log(i))^{G_K} ⊂ (B_st^+ (i))^{G_K}.
3. x t^{−i} ∈ (B_st)^{G_K} = K_0 (R06.1/period-ring-invariants) gives V_i^n ⊂ K_0 t^i; for i < 0, K_0t^i ∩ B̃+_log = 0 since t^{−1} ∉ B_dR^+ (R06.1/fontaine-element-t); conversely t^i ∈ B̃+_rig for i ≥ 0.
4. V_i = ∪_n V_i^n (Berger Proposition 3.3).

*Acceptance.*

- i = 0: (B̃†_log)^{G_K} = K_0.
- i = 1: the G_K-eigenvectors of weight χ are exactly K_0·t.

*Uses.* `PadicHodgeTheory:P7/log-extended-period-rings`, `PadicHodgeTheory:P7/frobenius-regularisation`, `PadicHodgeTheory:P7/extended-localisation-maps`, `PadicHodgeTheory:R06.1/period-ring-invariants`, `PadicHodgeTheory:R06.1/fontaine-element-t`, `PadicHodgeTheory:R06.1/semistable-period-ring`.

*Sources.*

- Représentations p-adiques et équations différentielles, Proposition 3.3, p. 31: “F t si i ⩾ 0;” The eigenvector space is F t^i for i ≥ 0 (F = K_0 in Berger's notation).
- Représentations p-adiques et équations différentielles, Proof of Proposition 3.3, p. 31: “mension finie (puisque ιn réalise une injection de Vin dans” Finite-dimensionality via ι_n.

#### Theorem. Semistable periods live in B~^dagger_log

*Node* `PadicHodgeTheory:P7/semistable-periods-in-extended-robba-ring`.

(a) For i in Z, {x in B~^dagger_{log} : g(x) = chi(g)^i x for all g in G_K} is F t^i if i >= 0 and 0 if i < 0. (b) For every p-adic representation V of G_K, (B~^dagger_{log} tensor V)^{G_K} is a finite-dimensional F-vector space, and the inclusion B~^+_{log} in B~^dagger_{log} induces an isomorphism of (phi, N)-modules D^+_st(V) = (B~^+_{log} tensor V)^{G_K} -> (B~^dagger_{log} tensor V)^{G_K}. (c) Consequently D_st(V) = (B~^dagger_{log}[1/t] tensor V)^{G_K} and D_cris(V) = (B~^dagger_{rig}[1/t] tensor V)^{G_K}; V is semistable (resp. crystalline) iff it is B~^dagger_{log}[1/t]-admissible (resp. B~^dagger_{rig}[1/t]-admissible); and for V semistable, B~^dagger_{log}[1/t] tensor_F D_st(V) = B~^dagger_{log}[1/t] tensor_{Q_p} V.

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt. V is a p-adic representation of G_K of dimension d; D_st, D_cris, D_dR are the period functors of PadicHodgeTheory:R06.2/period-functors with Fontaine's normalisations (u = log[p~], N = -d/du, N phi = p phi N); HT(chi) = +1, so 'positive' in Berger's sense means Hodge–Tate weights <= 0. D^+_st(V) = (B~^+_log tensor V)^{G_K} equals Fontaine's (B^+_st tensor V)^{G_K} (Berger 2002 Section 1.2); D_st(V) = t^{-d} D^+_st(V(-d)) for d large.

*Proof outline.*

1. (a) V_i^n = (B~^{dagger,r_n}_{log}(i))^{G_K} injects into (B_dR^+)^{G_K} = K via iota_n (P7/extended-localisation-maps, R06.1/period-ring-invariants), so it is finite-dimensional and phi-stable; regularisation (P7/frobenius-regularisation (b)) puts it in (B~^+_{log}(i))^{G_K}, which is F t^i or 0 (R06.1/period-ring-invariants: (B^+_st(i))^{G_K}); take the union over n.
2. (b) D_n = (B~^{dagger,r_n}_{log} tensor V)^{G_K} injects into D_dR(V) via iota_n, so dim_F D_n <= [K:F] d and the union stabilises; choosing bases, the matrix A of the periods satisfies A = phi^{-1}(P) phi^{-1}(A) with P in GL(F) (phi bijective on B~^dagger_{log}), so regularisation gives A over B~^+_{log} (Berger 2002 Proposition 3.4).
3. (c) Twist by V(-d) with d large and invert t; the comparison isomorphism for semistable V follows from the one over B~^+_{log}[1/t] (Berger 2002 Proposition 3.5).

*Acceptance.*

- For V = Q_p(1): (B~^dagger_{rig}[1/t] tensor V)^{G_K} = F t^{-1} e_1 = D_cris(Q_p(1)).
- V = Q_p(−1) (weight −1): (B̃†_rig ⊗ V)^{G_K} = K_0·(t ⊗ e_{−1}) = D_cris(V).
- V = Q_p(1) (weight 1): (B̃†_rig ⊗ V)^{G_K} = 0 while D_cris(V) = K_0·(t^{−1} ⊗ e_1) ⊂ B̃†_rig[1/t] ⊗ V (PadicHodgeTheory:P7/cyclotomic-eigenvectors-in-log-ring).

*Uses.* `PadicHodgeTheory:P7/extended-localisation-maps`, `PadicHodgeTheory:P7/frobenius-regularisation`, `PadicHodgeTheory:P7/extended-robba-ring-with-galois-action`, `PadicHodgeTheory:R06.1/period-ring-invariants`, `PadicHodgeTheory:R06.1/semistable-period-ring`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.2/admissible-representations`, `PadicHodgeTheory:P7/log-extended-period-rings`, `PadicHodgeTheory:P7/cyclotomic-eigenvectors-in-log-ring`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`.

*Sources.*

- Représentations p-adiques et équations différentielles, Proposition 3.3, p. 31: “Proposition 3.3. On a” Periods of Tate twists in B~^dagger_log.
- Représentations p-adiques et équations différentielles, Proposition 3.4, p. 32: “est un isomorphisme de (ϕ, N )-modules.” D^+_st(V) = (B~^dagger_log tensor V)^{G_K}.
- Représentations p-adiques et équations différentielles, Proposition 3.4, proof, p. 32: “de dimension finie ⩽ [K : F ]d, car ιn réalise une injection” Finite-dimensionality through iota_n into D_dR(V).
- Représentations p-adiques et équations différentielles, §3.2, p. 32: “Une représentation V à poids négatifs est donc semi-stable si et” Consequence (c) for negative weights.

#### Theorem. Berger's theorem: D_cris and D_st from the Robba realisation

*Node* `PadicHodgeTheory:P7/berger-dcris-dst-dictionary`.

For every p-adic representation V of G_K: D_st(V) = (D^dagger_log(V)[1/t])^{Gamma_K} and D_cris(V) = (D^dagger_rig(V)[1/t])^{Gamma_K}, as (phi, N)-modules, resp. phi-modules, over F, the equalities taking place inside (B~^dagger_{log}[1/t] tensor V)^{H_K} (which contains D^dagger_log(V)[1/t] by P7/robba-realisation-comparison and whose G_K-invariants are D_st(V) by P7/semistable-periods-in-extended-robba-ring). In particular V is semistable (resp. crystalline) iff (D^dagger_log(V)[1/t])^{Gamma_K} (resp. (D^dagger_rig(V)[1/t])^{Gamma_K}) has F-dimension d = dim V. If V has Hodge–Tate weights <= 0 then D_st(V) = D^dagger_log(V)^{Gamma_K} and D_cris(V) = D^dagger_rig(V)^{Gamma_K}. The identification is compatible with Tate twists: D_cris(V(n)) = t^{-n} D_cris(V) tensor e_n inside D^dagger_rig(V(n))[1/t]. The monodromy operator of D_st corresponds to N on B^dagger_{log,K} normalised by N(log pi) = -p/(p-1).

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt. V is a p-adic representation of G_K of dimension d; D_st, D_cris, D_dR are the period functors of PadicHodgeTheory:R06.2/period-functors with Fontaine's normalisations (u = log[p~], N = -d/du, N phi = p phi N); HT(chi) = +1, so 'positive' in Berger's sense means Hodge–Tate weights <= 0.

*Proof outline.*

1. Inclusion of the invariants in D_st: (D^dagger_log(V)[1/t])^{Gamma_K} is contained in (B~^dagger_{log}[1/t] tensor V)^{G_K} = D_st(V) (P7/robba-realisation-comparison (c), P7/semistable-periods-in-extended-robba-ring (c)); the crystalline case is N = 0.
2. Reverse inclusion: twist so that the weights are <= 0; then D_st(V) = (B~^dagger_{log} tensor V)^{G_K} and (B~^dagger_{log} tensor V)^{H_K} = B~^dagger_{log,K} tensor D^dagger(V). With bases (e_i) of D^dagger(V) and (d_j) of D_st(V), the matrix M with (d_j) = M(e_i) has rank r = dim D_st(V) and satisfies gamma_K(M) G = M, G the matrix of gamma_K.
3. Decompletion: R_m(M) satisfies the same equation and tends to M (P7/decompletion-operators); N = phi^m(R_m(M)) has entries in B^dagger_{log,K}; with Q = phi^{m-1}(P)...phi(P)P (P the matrix of phi, invertible since B^dagger_K is a field) one gets gamma_K(NQ) G = NQ, so NQ gives r Gamma_K-fixed elements of D^dagger_log(V)[1/t], F-linearly independent for m large because R_m(M) -> M has rank r (Berger 2002 Theoreme 3.6).
4. Normalisation of N: P7/extended-localisation-maps (log_eq) and Berger 2008 Appendix B.

*Acceptance.*

- V = Q_p(1): D_cris(V) = F t^{-1} e_1 = (D^dagger_rig(V)[1/t])^{Gamma_K}; V = Q_p(-1) (weight -1 <= 0): D_cris(V) = F t e_{-1} = D^dagger_rig(V)^{Gamma_K} without inverting t. For the Tate curve, Berger's introduction IV.5.4 exhibits a unipotent non-trivial connection, so D_st has N != 0.
- V = Q_p(1), K = Q_p: D†(V) = B†_{Q_p}·e_1 with γ(e_1) = χ(γ)e_1, and (D†_rig(V)[1/t])^{Γ} = Q_p·t^{−1}e_1 = D_cris(Q_p(1)), with φ(t^{−1}e_1) = p^{−1}t^{−1}e_1.
- Tate curve V_p(E_q) over Q_p (k algebraically closed in Berger intro IV.5.4): in the basis (a, b) of D(V) given there, ∂_V(t^{−1}a) = 0 and ∂_V(b) ∈ B†_rig,F·t^{−1}a, and (D†_log(V)[1/t])^{Γ} is two-dimensional with φ-eigenvalues p^{−1}, 1 and N ≠ 0, matching D_st(V) of Berger intro II.4.3 (x = t^{−1} ⊗ e, y = −ut^{−1} ⊗ e + 1 ⊗ f, φ(x) = p^{−1}x, φ(y) = y, N(y) = v_p(q)x).
- A non-semistable de Rham V (e.g. Q_p(ψ) for a ramified finite-order character ψ) has (D†_log(V)[1/t])^{Γ_K} = 0 but (D†_log(V|_{G_L})[1/t])^{Γ_L} one-dimensional for L = K̄^{ker ψ}.

*Uses.* `PadicHodgeTheory:P7/robba-realisation-comparison`, `PadicHodgeTheory:P7/semistable-periods-in-extended-robba-ring`, `PadicHodgeTheory:P7/decompletion-operators`, `PadicHodgeTheory:P7/robba-ring-of-p-adic-field`, `PadicHodgeTheory:P7/extended-localisation-maps`, `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.1/semistable-period-ring`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-log-robba-ring`, `PadicHodgeTheory:P7/extended-robba-ring-with-galois-action`, `PadicHodgeTheory:P7/log-extended-period-rings`, `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PhiGammaModulesAndIwasawaCohomology:PG.1`, `PhiGammaModulesAndIwasawaCohomology:PG.2`.

*Planet:* Berger's D_cris/D_st dictionary.

*Sources.*

- Représentations p-adiques et équations différentielles, Théorème 3.6, p. 33: “Dst (V ) = (D†log (V )[1/t])ΓK et Dcris (V ) = (D†rig (V )[1/t])ΓK” The dictionary.
- Représentations p-adiques et équations différentielles, Introduction, Théorème 0.2, p. 4: “Si V est une représentation p-adique de GK , alors” Theorem 0.2 = Theorem 3.6 + Proposition 3.7.
- An introduction to the theory of p-adic representations, IV.3.1, p. 27: “If the Hodge-Tate weights of V are negative (if V is positive), then Dcris (V ) = D†rig (V )ΓK and Dst (V ) = D†log (V )ΓK .” No inversion of t for weights <= 0.
- Limites de représentations cristallines, Section II.2, p. 13: “est une représentation cristalline positive de GF (et donc” The positive crystalline case as used for Wach modules.
- Représentations p-adiques et équations différentielles, Proof of Théorème 3.6, p. 33: “Les opérateurs Rm introduits au paragraphe 2.6 sont B†log,K -linéaires” Decompletion step.

#### Theorem. Comparison isomorphisms over B^dagger_{rig,K}[1/t] and B^dagger_{log,K}[1/t]

*Node* `PadicHodgeTheory:P7/berger-comparison-isomorphisms`.

(1) If V is semistable, D^dagger(V) tensor_{B^dagger_K} B^dagger_{log,K}[1/t] = D_st(V) tensor_F B^dagger_{log,K}[1/t], compatibly with phi, N and Gamma_K. (2) If V is crystalline, D^dagger(V) tensor B^dagger_{rig,K}[1/t] = D_cris(V) tensor_F B^dagger_{rig,K}[1/t]. If moreover the Hodge–Tate weights of V are <= 0, then D_st(V) is contained in B^dagger_{log,K} tensor D^dagger(V). (3) For V semistable, the determinant of the transition matrix from a basis of D_st(V) to a basis of D^dagger(V) is lambda t^r with r in Z and lambda in B^dagger_K.

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt. V is a p-adic representation of G_K of dimension d; D_st, D_cris, D_dR are the period functors of PadicHodgeTheory:R06.2/period-functors with Fontaine's normalisations (u = log[p~], N = -d/du, N phi = p phi N); HT(chi) = +1, so 'positive' in Berger's sense means Hodge–Tate weights <= 0.

*Proof outline.*

1. Twist so the weights are <= 0; then D_st(V) is in B~^dagger_{log,K} tensor D^dagger(V) with B~^dagger_{log,K}[1/t] tensor D^dagger(V) = B~^dagger_{log,K}[1/t] tensor D_st(V) (P7/semistable-periods-in-extended-robba-ring (c)); write (e_i) = B(d_i) and (d_i) = A(e_i) with A over B^dagger_{log,K}[1/t] (P7/berger-dcris-dst-dictionary) and AB = Id.
2. Apply the B^dagger_{log,K}[1/t]-linear R_0: A R_0(B) = Id, so B = R_0(B) has entries in B^dagger_{log,K}[1/t] and A is invertible there (Berger 2002 Proposition 3.7).
3. (3): reduce to dimension one by taking determinants; a one-dimensional semistable representation is crystalline, of the form omega chi^r with omega unramified, with period beta in W(k^bar) (Berger 2002 Proposition 3.9).

*Acceptance.*

- For V = Q_p(r): D^dagger(V) = B^dagger_K e_r, D_cris(V) = F t^{-r} e_r, and the transition determinant is t^{-r}.
- V = Q_p(r): the transition matrix is (t^{−r}) up to a unit of B†_K.
- For V_p(E_q) (Tate curve) the comparison over B†_log,Q_p[1/t] needs log π: it fails over B†_rig,Q_p[1/t] because V is not crystalline.

*Uses.* `PadicHodgeTheory:P7/berger-dcris-dst-dictionary`, `PadicHodgeTheory:P7/semistable-periods-in-extended-robba-ring`, `PadicHodgeTheory:P7/decompletion-operators`, `PadicHodgeTheory:P7/robba-realisation-comparison`, `PadicHodgeTheory:P7/log-extended-period-rings`, `PadicHodgeTheory:R06.2/admissible-representations`, `PhiGammaModulesAndIwasawaCohomology:PG.2`.

*Sources.*

- Représentations p-adiques et équations différentielles, Proposition 3.7, p. 34: “D† (V ) ⊗B† B†rig,K [1/t] = Dcris (V ) ⊗F B†rig,K [1/t]” Crystalline comparison over B^dagger_{rig,K}[1/t].
- Représentations p-adiques et équations différentielles, Proposition 3.9, p. 34: “Alors il existe r ∈ Z et λ ∈ B†K tels que det(M ) = λtr .” Determinant of the transition matrix.

#### Lemma. ∂ is surjective on B†_log,K and onto B†_rig,K from B†_rig,K + F'_K·log π_K

*Node* `PadicHodgeTheory:P7/antiderivatives-on-log-robba-ring`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. (1) ∂ maps B†_rig,K + F'_K·log(π_K) onto B†_rig,K; (2) ∂ maps B†_log,K = B†_rig,K[log π_K] onto itself; (3) ker(∂: B†_log,K → B†_log,K) = F'_K; (4) if ∂(y) = x with x ∈ B†,r_log,K then y ∈ B†,s_log,K for every s > r (but not necessarily s = r).

*Hypotheses.* B†_log,K = B†_rig,K[log π_K] = B†_rig,K[log π] because log(π/π_K^{e_K}) is overconvergent (e_K = [K_∞ : F_∞]). Berger 2002 writes F·log(π_K); the coefficient field of the Robba ring is F'_K (Berger 2008, Appendix B).

*Proof outline.*

1. Choose r with ∂(π_K) and 1/∂(π_K) in B†,r_K (B†_K is a field, PG.0).
2. For F ∈ B†,r_rig,K write F/∂(π_K) = Σ a_nπ_K^n; then F = ∂(Σ_{n≠−1} a_nπ_K^{n+1}/(n+1) + a_{−1}log π_K), the series converging on every smaller annulus (PadicDifferentialEquationsAndRigidCohomology:RD.2/log-robba-ring-antiderivative in the variable u = π_K).
3. Induction on the log-degree using ∂(G_j log^j π_K) = ∂(G_j) log^j π_K + j G_j log^{j−1}(π_K) ∂(π_K)/π_K gives (2); the kernel statement (3) is the kernel statement of RD.2/log-robba-ring-antiderivative (constants K' = F'_K).
4. (4) (Berger Remark 4.5): the division by n + 1 shrinks the radius of convergence only by a factor tending to 1.

*Acceptance.*

- ∂(log π) = (1+π)/π for K = K_0, so (1+π)/π is not in ∂(B†_rig,F): its antiderivative needs log π.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/log-robba-ring-antiderivative`, `PadicHodgeTheory:P7/log-extended-period-rings`, `PhiGammaModulesAndIwasawaCohomology:PG.0`.

*Sources.*

- Représentations p-adiques et équations différentielles, Proposition 4.4, p. 40: “La connexion ∂ réalise une surjection” Surjectivity statements (1), (2).
- Représentations p-adiques et équations différentielles, Remarque 4.5, p. 40: “alors on ne peut pas dire” Loss of radius (4).

#### Lemma. Two equivalent definitions of a unipotent connection over B^dagger_{rig,K}

*Node* `PadicHodgeTheory:P7/unipotent-connection-criterion`.

Let M be a free B^dagger_{rig,K}-module of rank d with a connection nabla_M over nabla. The following are equivalent: (1) nabla_M is trivial on M tensor B^dagger_{log,K}: there are e_0, ..., e_{d-1} in M tensor B^dagger_{log,K} with nabla_M(e_i) = 0 spanning M tensor B^dagger_{log,K}[1/t] over B^dagger_{log,K}[1/t]; (2) there are f_0, ..., f_{d-1} in M forming a basis of M[1/t] over B^dagger_{rig,K}[1/t] with nabla_M(f_i) in t <f_{i-1}, ..., f_0>. Such M (a 'cristal') is called unipotent; it is trivial if one can take nabla_M(f_i) = 0.

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt. nabla_M is extended to M tensor B^dagger_{log,K} with nabla(log pi) = t (1+pi)/pi; N = 1 tensor N.

*Proof outline.*

1. (1) => (2): N preserves the F-span of the e_i and is nilpotent, so the e_i can be ordered with N(e_i) in <e_{i-1}, ..., e_0>; write e_i = sum_j log^j(pi) d_{j,i} and take f_i = d_{0,i}; nabla_M(e_i) = 0 gives nabla_M(d_{0,i}) = d_{1,i} t (1+pi)/pi in t <d_{0,i-1}, ..., d_{0,0}>, and the f_i span M[1/t] (Berger 2002 Proposition 5.5).
2. (2) => (1): induction on d; given e'_i with nabla_M(e'_i) = alpha_i f_0 and alpha_i in t B^dagger_{log,K}, solve nabla(beta_i) = alpha_i using the surjectivity of partial on B^dagger_{log,K} (P7/nabla-operator-on-robba-ring) and put e_i = e'_i - beta_i f_0.

*Acceptance.*

- M = D^dagger_rig(V) for the Tate curve: with a = t^{-1} e_1-type basis the connection is unipotent and not trivial (Berger introduction IV.5.4).

*Uses.* `PadicHodgeTheory:P7/nabla-operator-on-robba-ring`, `PadicHodgeTheory:P7/robba-ring-of-p-adic-field`, `PadicHodgeTheory:P7/connection-on-robba-realisation`, `PadicHodgeTheory:P7/unipotent-crystal`.

*Source.* Représentations p-adiques et équations différentielles, Proposition 5.5, p. 48-49: “Un cristal qui satisfait les conditions de la proposition précédente est dit unipotent.” Definition of unipotent connections via Proposition 5.5.

#### Theorem. Semistability over K_n iff the Robba connection is unipotent

*Node* `PadicHodgeTheory:P7/semistability-criterion-unipotent-connection`.

Let V be a p-adic representation of G_K. There exists n such that the restriction of V to G_{K_n} is semistable (resp. crystalline) with Hodge–Tate weights <= 0 if and only if D^dagger_rig(V) with nabla_V is unipotent (resp. trivial) in the sense of P7/unipotent-connection-criterion.

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt. V is a p-adic representation of G_K of dimension d; D_st, D_cris, D_dR are the period functors of PadicHodgeTheory:R06.2/period-functors with Fontaine's normalisations (u = log[p~], N = -d/du, N phi = p phi N); HT(chi) = +1, so 'positive' in Berger's sense means Hodge–Tate weights <= 0.

*Proof outline.*

1. If V|G_{K_n} is semistable, a basis of D_st(V|G_{K_n}) satisfies (1) of P7/unipotent-connection-criterion by the comparison isomorphism D_st tensor B^dagger_{log}[1/t] = D^dagger_rig tensor B^dagger_{log}[1/t] (P7/berger-comparison-isomorphisms over K_n, where D^dagger_rig is unchanged and Gamma_{K_n} is open in Gamma_K).
2. Conversely, if nabla_V is unipotent, the horizontal e_i span an F-vector space on which log(gamma) acts trivially, so Gamma_K acts through a finite quotient; the e_i are fixed by gamma_K^{p^n} for n large and form a basis of D_st(V|G_{K_n}) by P7/berger-dcris-dst-dictionary (Berger 2002 Proposition 5.6); crystalline iff N = 0 iff trivial.

*Acceptance.*

- V = Q_p(r) with r <= 0 (Hodge–Tate weight r): f_0 = t^{-r} e_r lies in D^dagger_rig(V) and nabla_V(f_0) = (-r + r) t^{-r} e_r = 0, so nabla_V is trivial and V is crystalline (with n = 0).
- V = Q_p(r): ∇_V = t∂ + r is trivial on D†_rig(V)[1/t] (horizontal vector t^{−r}e_r), matching crystallinity of Q_p(r).
- V = V_p(E_q) (Tate curve): ∇_V is unipotent and not trivial (Berger intro IV.5.4).
- V = Q_p(ψ) with ψ of finite order whose splitting field L is ramified over K and not contained in K_∞ (e.g. a ramified quadratic character with L ∩ K_∞ = K, p odd): V is not semistable over any K_n, so ∇_V is not unipotent on D†_rig(V)[1/t], although it becomes trivial over the finite étale extension B†_rig,L (the quasi-unipotent situation of the monodromy theorem).

*Uses.* `PadicHodgeTheory:P7/berger-dcris-dst-dictionary`, `PadicHodgeTheory:P7/berger-comparison-isomorphisms`, `PadicHodgeTheory:P7/connection-on-robba-realisation`, `PadicHodgeTheory:P7/unipotent-connection-criterion`, `PadicHodgeTheory:P7/unipotent-crystal`, `PadicHodgeTheory:P7/robba-realisation-comparison`.

*Sources.*

- Représentations p-adiques et équations différentielles, Proposition 5.6, p. 49: “Alors il existe n tel que la restriction de V à GKn est semi-stable (respectivement cristalline) à poids négatifs si et seulement si D†rig (V ) est unipotent (respectivement trivial).” The criterion.
- Représentations p-adiques et équations différentielles, Introduction, Théorème 0.4, p. 5: “si et seulement si ∇V est une connexion unipotente” Introduction form of the criterion.
- Représentations p-adiques et équations différentielles, Théorème 0.4, p. 5: “si et seulement si ∇V est une connexion unipotente” Form with t inverted.

#### Lemma. θ∘ι_n identifies B†,r_rig,K/φ^{n−1}(q) with K_n

*Node* `PadicHodgeTheory:P7/theta-iota-surjective-onto-Kn`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. For r > 0 and n ≫ n(r), the injective map θ∘ι_n: B†,r_rig,K/φ^{n−1}(q) → K_n induced by PadicHodgeTheory:P7/theta-iota-kernel (b) is a bijection (a field isomorphism onto K_n).

*Hypotheses.* n must be large enough that [K_n : F_n] = [K_∞ : F_∞] = e_K, where F = K_0 and F_n = F(μ_{p^n}).

*Proof outline.*

1. For K = K_0: B†,r_rig,F/φ^{n−1}(q) = F_n since φ^{n−1}(q) = Φ_{p^n}(1 + π) is the p^n-th cyclotomic polynomial in 1 + π and θ∘ι_n(1 + π) = ε^{(n)}.
2. φ^{n−1}(q)B†,r_rig,K ∩ B†,r_rig,F = φ^{n−1}(q)B†,r_rig,F, so B†,r_rig,K/φ^{n−1}(q) is a field extension of F_n of degree [B†,r_rig,K : B†,r_rig,F] = e_K (PG.0: B†,r_K is free of rank [K_∞ : F_∞] over B†,r_F).
3. The image is contained in K_n (PadicHodgeTheory:P7/extended-localisation-maps), which has degree [K_n : F_n] = e_K over F_n for n ≫ 0; an injective map of F_n-vector spaces of equal finite dimension is bijective.

*Acceptance.*

- For K = K_0 and n = 1: θ∘ι_1 maps B†,r_rig,F/q onto F(ζ_p), with π ↦ ζ_p − 1.

*Uses.* `PadicHodgeTheory:P7/theta-iota-kernel`, `PadicHodgeTheory:P7/extended-localisation-maps`, `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PhiGammaModulesAndIwasawaCohomology:PG.0`.

*Sources.*

- Représentations p-adiques et équations différentielles, Lemme 4.9, p. 42: “est une bijection” θ∘ι_n: B†,r_rig,K/φ^{n−1}(q) → K_n is a bijection for n ≫ n(r).
- Représentations p-adiques et équations différentielles, Proof of Lemme 4.9, p. 42: “La proposition est triviale dans le cas K = F” Reduction to the degree count.

#### Theorem. D_dR from the Robba realisation via iota_n

*Node* `PadicHodgeTheory:P7/ddr-via-robba-realisation`.

Let V be a p-adic representation of G_K. For n large (n >= n(r) with r >= r(V)), the map K_infinity((t)) tensor_{iota_n, B^{dagger,r_n}_{rig,K}} D^{dagger,r_n}_rig(V) -> D_dif(V) induced by iota_n is an isomorphism of K_infinity((t))-modules with connection, where D_dif(V) = K_infinity((t)) tensor D^+_dif(V) is Fontaine's module (D^+_dif(V) the largest finitely generated Gamma_K-stable K_infinity[[t]]-submodule of (B_dR^+ tensor V)^{H_K}), with the connection nabla_V = log(gamma)/log chi(gamma). K_infinity tensor_K D_dR(V) is the kernel of nabla_V on D_dif(V), hence D_dR(V) = (K_infinity((t)) tensor_{iota_n} D^{dagger,r_n}(V))^{Gamma_K}, and V is de Rham iff nabla_V is trivial on D_dif(V). If V is de Rham with Hodge–Tate weights <= 0 and n is large, K_n[[t]] tensor_{iota_n} D^{dagger,r}_rig(V) is dense in Fil^0(K_n((t)) tensor_K D_dR(V)) for the t-adic topology (Berger 2008 Appendix B correction of Berger 2002 Proposition 5.15).

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt. V is a p-adic representation of G_K of dimension d; D_st, D_cris, D_dR are the period functors of PadicHodgeTheory:R06.2/period-functors with Fontaine's normalisations (u = log[p~], N = -d/du, N phi = p phi N); HT(chi) = +1, so 'positive' in Berger's sense means Hodge–Tate weights <= 0. Uses Sen's theory D_Sen(V) (Fontaine–Ouyang Section 3.2) and Fontaine's D^+_dif(V); the latter's source is not available here (gap).

*Proof outline.*

1. K_infinity[[t]] tensor iota_n(D^{dagger,r_n}(V)) is a finitely generated Gamma_K-stable K_infinity[[t]]-submodule of (B_dR^+ tensor V)^{H_K} (P7/localisation-maps-p-adic-field, P7/robba-realisation-comparison), hence contained in D^+_dif(V).
2. theta o iota_n : D^{dagger,r_n}(V) -> D_Sen(V) has kernel phi^{n-1}(q) D^{dagger,r_n}(V) (P7/connection-on-robba-realisation), so its image is a Gamma_K-stable K_n-space of dimension d whose K_infinity-span is D_Sen(V); hence the determinant of the inclusion into D^+_dif(V) is a unit modulo t and Nakayama gives equality (Berger 2002 Proposition 5.7, Corollaire 5.8).
3. Kernel of nabla_V: K_infinity tensor D_dR(V) is killed by nabla_V and t^r K_infinity[[t]] tensor D_dR(V) is in D^+_dif(V) for r large; conversely the kernel is a finite-dimensional Gamma_K-stable K_infinity-space descending to some K_n on which Lie(Gamma_K) acts trivially, so an open subgroup acts trivially and the kernel lies in K_n tensor D_dR(V) (Berger 2002 Proposition 5.9, after Fontaine).
4. Gamma_K-invariants: D_dif(V) is contained in (B_dR tensor V)^{H_K}, so its Gamma_K-invariants lie in D_dR(V), and contain it by the previous step.

*Acceptance.*

- V = Q_p(1): D_dif(V) = K_infinity((t)) e_1 with nabla_V = t d/dt + 1, kernel K_infinity t^{-1} e_1, and D_dR(V) = K t^{-1} e_1 with its filtration jump at -1 (HT(chi) = +1).
- V = Q_p(r): D†,r_n(V) = B†,r_n_K e_r and ι_n(B†,r_n_K)e_r generates K_∞[[t]]e_r = D_dif^+(Q_p(r)).

*Uses.* `PadicHodgeTheory:P7/localisation-maps-p-adic-field`, `PadicHodgeTheory:P7/robba-realisation-comparison`, `PadicHodgeTheory:P7/connection-on-robba-realisation`, `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.1/de-rham-period-ring`, `PadicHodgeTheory:R06.1/fontaine-element-t`, `PadicHodgeTheory:P7/fontaine-dif-module`, `PadicHodgeTheory:P7/sen-module`, `PadicHodgeTheory:P7/extended-localisation-maps`, `PadicHodgeTheory:P7/theta-iota-kernel`, `PadicHodgeTheory:P7/theta-iota-surjective-onto-Kn`, `PhiGammaModulesAndIwasawaCohomology:PG.2`.

*Planet:* D_dR from the Robba realisation.

*Sources.*

- Représentations p-adiques et équations différentielles, Proposition 5.9, p. 51: “Proposition 5.9. Si V est une représentation p-adique de GK , alors K∞ ⊗K DdR (V ) est le noyau de la connexion ∇V opérant sur Ddif (V ).” D_dR from the kernel of nabla_V.
- Représentations p-adiques et équations différentielles, Proposition 5.7, p. 50: “Proposition 5.7. L’application de K∞ ((t))⊗B†,rn D†,rn (V ) dans Ddif (V )” iota_n identifies D_dif(V).
- Équations différentielles p-adiques et (φ,N)-modules filtrés, Appendice B, p. 27: “Démonstration de la proposition 5.15 : il n’est pas vrai que ιn (Ns ) = Kn [[t]] ⊗K DdR (V ).” Erratum: only density for the t-adic topology holds.
- Theory of p-adic Galois representations, Theorem 3.24, p. 49: “Sen’s operator φ is the unique K∞ -linear endomorphism of” Sen's operator on D_Sen, recovered by theta from nabla_V.
- Représentations p-adiques et équations différentielles, Corollaire 5.8, p. 51: “Par extension des scalaires on en déduit que l’application” Extension to D†,r_n_rig(V).

#### Theorem. Wach modules recover the filtered phi-module D_cris(V)

*Node* `PadicHodgeTheory:P7/wach-dcris-comparison`.

Equip N(V) with the filtration Fil^i N(V) = {x in N(V) : phi(x) in q^i N(V)} (for V with weights <= 0; in general N(V) = pi^{-b} N(V(-b)) and the filtration is transported). Then the map lambda : D_cris(V) -> N(V)/pi N(V), obtained from the inclusion D_cris(V) in B^+_{rig,F} tensor_{B^+_F} N(V) (PG.6: D_cris(V) = (B^+_{rig,F} tensor N(V))^{Gamma_F}), is an isomorphism of filtered phi-modules over F, where N(V)/pi N(V) carries the image filtration and D_cris(V) its Hodge filtration (PadicHodgeTheory:R06.2/filtered-phi-n-modules, Fil^i D_cris(V) = Fil^i D_dR(V) cap D_cris(V)).

*Hypotheses.* K = F = W(k)[1/p] is absolutely unramified (Wach modules are only claimed over unramified bases). T is a G_F-stable Z_p-lattice in a crystalline representation V of dimension d, with Hodge–Tate weights in [a, b] for the convention HT(chi) = +1 (Berger writes r_j = -(weights) and calls V positive when all weights are <= 0). N(T) and N(V) = B^+_F tensor N(T) are the Wach modules imported from PhiGammaModulesAndIwasawaCohomology:PG.6 (a Wach module over B^+_F must include the condition that B_F tensor N is an etale (phi, Gamma)-module, Berger errata 2026 for Definition III.4.1); q = phi(pi)/pi. V is a p-adic representation of G_K of dimension d; D_st, D_cris, D_dR are the period functors of PadicHodgeTheory:R06.2/period-functors with Fontaine's normalisations (u = log[p~], N = -d/du, N phi = p phi N); HT(chi) = +1, so 'positive' in Berger's sense means Hodge–Tate weights <= 0.

*Proof outline.*

1. Bijectivity: by dimension it suffices that pi B^+_{rig,F} tensor N(V) meets D_cris(V) in 0. Show by induction on j >= 1 that this intersection lies in pi^j B^+_{rig,F} tensor N(V): for x = pi^j y there, gamma(x) - chi(gamma)^j x lies in pi^{j+1} B^+_{rig,F} tensor N(V) (gamma(pi) = chi(gamma) pi mod pi^2 and Gamma_F acts trivially on N(V)/pi N(V)); if x is Gamma_F-fixed and chi(gamma)^j != 1 this forces x into pi^{j+1}(...) (Berger 2004 Theoreme III.4.4 proof, where the exponent is printed -j; sourceIssues). An element divisible by every power of pi is 0. lambda is phi-equivariant by construction.
2. Filtrations: for V with weights <= 0, D_cris(V) = (B~^+_{rig} tensor V)^{G_F} and Fil^i D_cris(V) = (Fil^i B~^+_{rig} tensor V)^{G_F}; Fil^i B~^+_{rig} = Fil^i B^+_max cap B~^+_{rig} = (pi/pi_1)^i B^+_max cap B~^+_{rig}, and x lies in it iff phi(x) in q^i B~^+_{rig} (q = phi(pi/pi_1)) (R06.1/crystalline-period-ring, P7/extended-robba-ring-with-galois-action).
3. Compare inside B~^+_{rig}[1/pi] tensor V = B~^+_{rig}[1/pi] tensor N(V) (PG.6, Berger 2004 Theoreme III.3.1): q^i(B~^+_{rig} tensor V) cap (B^+_{rig,F} tensor N(V)) = q^i B^+_{rig,F} tensor N(V); this gives lambda(Fil^i D_cris(V)) contained in the image of Fil^i N(V).
4. Reverse inclusion (completing Berger 2004, whose proof omits this step; Berger errata 2026, section 2): if y in D_cris(V) has image in Fil^i N(V)/pi N(V), a priori only y in Fil^i N(V) + pi N(V); for gamma non-torsion and j >= 1, gamma - chi(gamma)^j multiplies y by a nonzero scalar and maps Fil^i N(V) + pi^j N(V) into Fil^i N(V) + pi^{j+1} N(V); applying this for j = 1, ..., i - 1 gives y in Fil^i N(V), hence y in Fil^i D_cris(V) (Corollaire III.4.5 for general V by twisting).

*Acceptance.*

- Supersingular example (Berger introduction V.1.1): N(T) = A^+_F e + A^+_F f with phi(e) = q f, phi(f) = e; Fil^1 N(V) = {a e + b f : phi(b) in q B^+_F} = {b in pi B^+_F}, so Fil^1 (N/pi N) = F e-bar, and phi(e-bar) = p f-bar (q is congruent to p mod pi), phi(f-bar) = e-bar: the filtered phi-module with Fil^0 = D, Fil^1 = F e, Fil^2 = 0; t_N = v_p(det) = v_p(-p) = 1 = t_H (checked with PARI/GP).

*Uses.* `PhiGammaModulesAndIwasawaCohomology:PG.6`, `PadicHodgeTheory:R06.2/filtered-phi-n-modules`, `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:P7/extended-robba-ring-with-galois-action`, `PadicHodgeTheory:P7/berger-dcris-dst-dictionary`, `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-frobenius`.

*Planet:* Wach module and D_cris comparison.

*Sources.*

- Limites de représentations cristallines, Théorème III.4.4, p. 22: “Fili N(V ) = {x ∈ N(V ), ϕ(x) ∈ q i N(V )},” The filtration on the Wach module.
- Limites de représentations cristallines, Théorème III.4.4, p. 22: “alors l’application naturelle λ : Dcris (V ) → N(V )/πN(V ) que l’on déduit de l’inclusion” The comparison map lambda, an isomorphism of filtered phi-modules.
- An introduction to the theory of p-adic representations, V.1.1, p. 33: “One can then show that F ⊗OF N (T )/π ≃ Dcris (V ) as ϕ-modules.” The phi-module statement.
- Limites de représentations cristallines, Introduction, Théorème 3, p. 4: “de la filtration Fili N(V ) = {x ∈ N(V ), ϕ(x) ∈ (ϕ(π)/π)i N(V )}, alors on a un isomor-” Theorem 3 of the introduction.
- Errata for my articles, Section 2, Theorem III.4.4 (errata dated May 5, 2026): “There is an argument missing from the end of the proof.” The missing step, supplied in proof step 4.

#### Comparison. Wach lattices versus Fontaine–Laffaille strongly divisible lattices

*Node* `PadicHodgeTheory:P7/wach-fontaine-laffaille-comparison`.

(a) If the Hodge–Tate weights of V lie in an interval [a - (p-1), a] (filtration length <= p - 1), then M = D_cris(T) is a strongly divisible lattice of D_cris(V): sum_i p^{-i} phi(Fil^i M) = M with Fil^i M = Fil^i D_cris(V) cap M; and Fil^i_T = Fil^i_V on M. (b) Conversely, if M is a strongly divisible lattice of a (weakly admissible) filtered phi-module D with weights in [a - (p-1), a] such that D has no slope -a part or no slope -a + (p-1) part, there are a crystalline V and a lattice T with D_cris(V) = D and D_cris(T) = M; on an interval of length <= p - 2 no slope condition is needed. (c) Hence for weights in an interval of length <= p - 2, T |-> D_cris(T) is an inclusion-preserving bijection between G_F-stable lattices of V and strongly divisible lattices of D_cris(V), and agrees with the Fontaine–Laffaille correspondence of FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3 after translating filtration indices to HT(chi) = +1. For length >= p the statement (a) fails in general.

*Hypotheses.* K = F = W(k)[1/p] is absolutely unramified (Wach modules are only claimed over unramified bases). T is a G_F-stable Z_p-lattice in a crystalline representation V of dimension d, with Hodge–Tate weights in [a, b] for the convention HT(chi) = +1 (Berger writes r_j = -(weights) and calls V positive when all weights are <= 0). N(T) and N(V) = B^+_F tensor N(T) are the Wach modules imported from PhiGammaModulesAndIwasawaCohomology:PG.6 (a Wach module over B^+_F must include the condition that B_F tensor N is an etale (phi, Gamma)-module, Berger errata 2026 for Definition III.4.1); q = phi(pi)/pi. V is a p-adic representation of G_K of dimension d; D_st, D_cris, D_dR are the period functors of PadicHodgeTheory:R06.2/period-functors with Fontaine's normalisations (u = log[p~], N = -d/du, N phi = p phi N); HT(chi) = +1, so 'positive' in Berger's sense means Hodge–Tate weights <= 0. Strongly divisible (Fontaine–Laffaille 1982 Section 7.7): sum p^{-i} phi(Fil^i M) = M; for weakly admissible D it suffices that the sum is contained in M (Fontaine–Laffaille Section 7.8).

*Proof outline.*

1. (a) Twist to a = 0. Since q is congruent to p modulo pi, phi(Fil^i_T M) is in p^i M, so sum p^{-i} phi(Fil^i_T M) is contained in M; it remains to see Fil^i_V M = Fil^i_T M for 1 <= i <= p - 1. For gamma with chi(gamma)^i != 1 mod p (1 <= i <= p-2) let T_i(gamma) = product_{j=1}^{i-1} (1 - chi(gamma)^{-j} gamma); for x = x_0 + pi y_1 lifting an element of Fil^i_V, T_i(gamma) x = T_i(gamma) x_0 + pi^i y_i, so T_i(gamma) x_0 lies in Fil^i N(V) cap N(T) = Fil^i N(T), and T_i(gamma) acts on M by a p-adic unit when i <= p - 1 (Berger 2004 Proposition V.2.1, after Wach 1997 Theorem 3).
2. (b) In a basis adapted to the filtration the matrix of phi on M is A_0 P_0 with P_0 = Diag(p^{r_i}); lift to P = A_0 Diag(q^{r_i} mu^{r_i}) with mu = p/(q - pi^{p-1}) a unit of A^+_F, and solve G_gamma gamma(P) = P phi(G_gamma) with G_gamma = Id + pi^{p-1} H by a contraction argument, which converges when D has no slope -a or no slope -a + (p-1) part; then T = (A_F tensor N)^{phi=1} (PG.1, PG.6; Berger 2004 Proposition V.2.3).
3. (c) Combine (a), (b), injectivity (P7/integral-dcris-lattice) and the Fontaine–Laffaille lattice correspondence (R07.3; Fontaine–Laffaille 1982 Proposition 7.17).

*Acceptance.*

- The supersingular example of P7/wach-dcris-comparison (weights 0 and -1, p >= 3): M = O_F e + O_F f with Fil^1 M = O_F e, phi(e) = p f, phi(f) = e, and p^{-1} phi(Fil^1 M) + phi(Fil^0 M) = O_F f + O_F e = M is strongly divisible.

*Uses.* `PadicHodgeTheory:P7/integral-dcris-lattice`, `PadicHodgeTheory:P7/wach-dcris-comparison`, `PhiGammaModulesAndIwasawaCohomology:PG.6`, `PhiGammaModulesAndIwasawaCohomology:PG.1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`, `PadicHodgeTheory:R06.2/weak-admissibility`, `PadicHodgeTheory:R06.2/filtered-phi-n-modules`.

*Sources.*

- Limites de représentations cristallines, Proposition V.2.1, p. 30: “dont les poids de Hodge-Tate sont dans [a − (p − 1); a] pour un entier a ∈ Z, alors M = Dcris (T ) est un réseau fortement divisible de Dcris (V ).” (a).
- Limites de représentations cristallines, Proposition V.2.3, p. 31: “soit D n’a pas de partie de pente −a, soit D n’a pas de partie de pente −a+(p−1), alors il” (b) with the endpoint slope restriction.
- Limites de représentations cristallines, Proposition V.2.1, proof, p. 30: “Remarquons que ce résultat est faux en général si la longueur de la filtration est ≥ p.” Failure beyond length p - 1.
- Limites de représentations cristallines, Remarque V.2.2, p. 30: “Si la longueur de la filtration est ≥ p, je ne sais pas quels sont” Beyond the range the image is unknown.

#### Lemma. Interpolation of principal parts at the points zeta_{p^m} - 1

*Node* `PadicHodgeTheory:P7/principal-parts-interpolation`.

Let r >= r(K), n >= n(r) and w >= 1. There is t_{n,w} in B^{dagger,r}_{rig,F} (hence in B^{dagger,r}_{rig,K}) with iota_n(t_{n,w}) congruent to 1 modulo t^w F_n[[t]] and iota_m(t_{n,w}) in t^w F_m[[t]] for every m >= n(r) with m != n; one may take t_{n,w} in B^+_{rig,F}.

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt. Berger's radius convention: for r > 0, C[r;1[ = {z : p^{-1/r} <= |z| < 1}; r_n = p^{n-1}(p-1), so that |zeta_{p^n} - 1| = p^{-1/r_n}.

*Proof outline.*

1. On the open unit disc consider the divisor D = sum_{m >= n(r)} w [zeros of phi^{m-1}(q) = Phi_{p^m}(1+pi)], supported on the circles |z| = p^{-1/r_m} (P7:annulus-foundations/cyclotomic-log-element-t).
2. Lazard's interpolation (8.11), a consequence of the Mittag-Leffler theorem (Theoreme 3): given local data g_m on each circle, there is g on the open disc with g - g_m divisible by the local component of D for every m; take g_n = 1 and g_m = 0 for m != n.
3. Divisibility by Phi_{p^m}(1+pi)^w is equivalent to iota_m(g) in t^w F_m[[t]] (P7:annulus-foundations/localisation-at-roots-of-unity, kernel of theta_m, and the Taylor expansion), and g - 1 divisible by Phi_{p^n}(1+pi)^w gives iota_n(g) = 1 mod t^w.
4. For K: B^{dagger,r}_{rig,F} is contained in B^{dagger,r}_{rig,K} compatibly with iota_m (P7/localisation-maps-p-adic-field).

*Acceptance.*

- For w = 1 one can take t_{n,1} = g (t/pi)/(phi^{n-1}(q)/p) with g in F[pi] chosen so that theta_n(t_{n,1}) = 1 (the quotient has a nonzero value at zeta_{p^n} - 1 because t and phi^{n-1}(q) have simple zeros there), and theta_m(t_{n,1}) = 0 for m != n because t vanishes at zeta_{p^m} - 1.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-log-element-t`, `PadicHodgeTheory:P7:annulus-foundations/localisation-at-roots-of-unity`, `PadicHodgeTheory:P7:annulus-foundations/weierstrass-preparation-on-circles`, `PadicHodgeTheory:P7/localisation-maps-p-adic-field`.

*Sources.*

- Équations différentielles p-adiques et (φ,N)-modules filtrés, Lemme I.2.1, p. 6-7: “C’est une conséquence immédiate de la solution du problème des « parties principales » (voir [Laz62, §8]).” t_{n,w} from Lazard's principal parts.
- Les zéros des fonctions analytiques d’une variable sur un corps valué complet, (8.11), p. 71 (numdam OCR): “élément g^ de L^[m]. Alors il existe geA^ tel que g—g^ soit divisible par D^ dans L^[m]” Interpolation along an integral divisor on the disc (OCR layer).

#### Lemma. Principal ideals dividing a power of t

*Node* `PadicHodgeTheory:P7/ideals-dividing-powers-of-t`.

Let r >= r(K) and h >= 0. Every principal ideal of B^{dagger,r}_{rig,K} dividing (t^h) is generated by prod_{n >= n(r)} (phi^{n-1}(q)/p)^{j_n} with integers 0 <= j_n <= h; the ideals (phi^{n-1}(q)) of B^{dagger,r}_{rig,K} (n >= n(r)) are maximal and pairwise coprime.

*Hypotheses.* k is a perfect field of characteristic p, F = W(k)[1/p] and K a finite totally ramified extension of F (for K/Q_p finite, k is the residue field of K and F = K_0). K_n = K(zeta_{p^n}), K_infinity = union of the K_n, H_K = Gal(Kbar/K_infinity), Gamma_K = Gal(K_infinity/K), identified by chi with an open subgroup of Z_p^x. F' is the maximal unramified extension of F contained in K_infinity and e_K the ramification index of K_infinity/F_infinity, so that [K_infinity : F_infinity] = e_K [F' : F]. C is the completion of Kbar and C^flat its tilt. Berger's radius convention: for r > 0, C[r;1[ = {z : p^{-1/r} <= |z| < 1}; r_n = p^{n-1}(p-1), so that |zeta_{p^n} - 1| = p^{-1/r_n}.

*Proof outline.*

1. t = pi prod_{n>=1} phi^{n-1}(q)/p and pi, phi^{n-1}(q) for n < n(r) are units of B^{dagger,r}_{rig,K} (no zeros on the annulus; P7:annulus-foundations/newton-polygon-breaks).
2. B^{dagger,r}_{rig,K}/phi^{n-1}(q) = K_n is a field for n large (P7/localisation-maps-p-adic-field), so the ideals are maximal; distinct ones are coprime.
3. If x divides t^h, then x is a unit times a product of the phi^{n-1}(q)^{j_n} with j_n <= h (divisors of functions on the annulus are determined by their zeros, P7:annulus-foundations/weierstrass-preparation-on-circles; Bezout property RD.0/analytic-ring-bezout for the generator), Berger 2008 Proposition I.2.2.

*Acceptance.*

- The ideal generated by t/pi is the product over all n >= n(r) with exponents 1; the ideal (t^h) itself has j_n = h.

*Uses.* `PadicHodgeTheory:P7/localisation-maps-p-adic-field`, `PadicHodgeTheory:P7:annulus-foundations/cyclotomic-log-element-t`, `PadicHodgeTheory:P7:annulus-foundations/newton-polygon-breaks`, `PadicHodgeTheory:P7:annulus-foundations/weierstrass-preparation-on-circles`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/analytic-ring-bezout`.

*Sources.*

- Équations différentielles p-adiques et (φ,N)-modules filtrés, Proposition I.2.2, p. 7: “Proposition I.2.2. — Si I est un idéal principal de B†,r” Statement.
- Équations différentielles p-adiques et (φ,N)-modules filtrés, Proposition I.2.2, proof, p. 7: “sont premiers (et même maximaux) dans B†,r” The ideals (phi^{n-1}(q)) are maximal.

### What is missing

- Coverage status: `partial`. Planned: Berger's Robba ring of a p-adic field and its identification with R_{F'}(pi_K); the extended ring B~^dagger_rig with Galois action, localisation maps, plus-part splitting, Frobenius regularisation and decompletion; Berger's D_cris/D_st dictionary and comparison isomorphisms; the connection nabla_V, the semistability criterion and D_dR via iota_n; interpolation of principal parts at the zeta_{p^n} - 1 and the ideals dividing powers of t (Berger 2008 Section I.2); the Robba realisation import from PG.1-PG.2; the Wach-module comparison with the D_cris filtration and with Fontaine–Laffaille lattices.
- Import node for Herr cochains and the Iwasawa comparison (PG.3-PG.5) with cup products, duality, twists and residue normalisation matched to ArithmeticGaloisDuality (gap 'Herr complex import').
- Wach versus Breuil–Kisin comparison (R07.4) (gap).
- Transcendence input of Berger 2002 Proposition 2.25 and the H^1(H_K, W(m)) vanishing of Lemme 2.27 (gaps).
- **Gap: Transcendence of log[p~] over iota_n(Frac B~^{dagger,r_n}_{rig}).** Injectivity of iota_n on B~^{dagger,r_n}_{log} (Berger 2002 Proposition 2.25) reduces to Fontaine's result that u = log[p~] is not in Frac S, S the elements of B_dR^+ in F tensor A~^+[[beta]] (Fontaine, 'Le corps des periodes p-adiques', 4.3.2, Asterisque 223), which is not available. NEXT ACTION: check whether Brinon–Conrad's or Fontaine–Ouyang's proof that u is transcendental over Frac(B_cris) adapts to Frac S, or fetch Colmez, 'Espaces vectoriels de dimension finie et representations de de Rham' (Asterisque 319), where the log map on A~^dagger is also constructed (Berger errata, Proposition 2.24). Needed by `PadicHodgeTheory:P7/extended-localisation-maps`, `PadicHodgeTheory:P7/semistable-periods-in-extended-robba-ring`.
- **Gap: Vanishing of H^1(H_K, W(m_{C^flat})).** Berger 2002 Lemme 2.27 quotes Colmez, 'Theorie d'Iwasawa des representations de de Rham d'un corps local' (Ann. of Math. 148 (1998)), IV.2.4, applied to the trivial representation; not available. NEXT ACTION: derive it from almost purity (PerfectoidSpaces:P3/almost-purity-theorem gives H^i(H_K, O_{C^flat}) almost zero) plus a devissage along W_n and a limit argument, or locate a public proof (Brinon–Conrad Section 4 treats H^1(G_K, C) only). Needed by `PadicHodgeTheory:P7/extended-robba-plus-decomposition`.
- **Request to `PhiGammaModulesAndIwasawaCohomology:PG.0`.** For k perfect, F = W(k)[1/p] and K/F finite totally ramified: (i) the field-of-norms rings A_K, B_K = A_K[1/p] inside B = completion of the maximal unramified extension of B_F in W(C^flat)[1/p], with A_K/p = E_K = k_{K_infinity}((pi_K bar)) a separable extension of E_F of degree [K_infinity : F_infinity] and Gal(E^sep/E_K) = H_K; (ii) the Witt-vector realisation of P7:annulus-foundations' cyclotomic rings: pi |-> [epsilon] - 1 embeds A_F = O_{E,F}(pi) in W(C^flat), with phi the Witt Frobenius and G_F acting through gamma_{chi(g)} (Fontaine–Ouyang (4.9)-(4.10)); (iii) the overconvergent subrings B^{dagger,r}_K = B^dagger cap B~^{dagger,r} (H_K-invariants), with phi : B^{dagger,r}_K -> B^{dagger,pr}_K and the Gamma_K-action, an element pi_K in A^{dagger,r(K)}_K lifting a uniformiser of E_K, and the description of B^{dagger,r}_K (r >= r(K)) as the bounded Laurent series f(pi_K) over F' (maximal unramified extension of F in K_infinity) converging on p^{-1/(e_K r)} <= |X| < 1, e_K the ramification index of K_infinity/F_infinity (Berger 2002 Proposition 1.4 as corrected in Berger 2008 Section I.2 and Appendix B); (iv) B^{dagger,r}_K is free over B^{dagger,r}_F of rank [K_infinity : F_infinity] for r large, and B^dagger_K is finite etale over B^dagger_F; (v) for n >= n(r), iota_n = phi^{-n} : B^{dagger,r_n}_K -> K_n[[t]] in B_dR^+ is injective and theta o iota_n(B^{dagger,r}_K) generates K_n over F_n for n large (Cherbonnier–Colmez III.2). Needed by `PadicHodgeTheory:P7/robba-ring-of-p-adic-field`, `PadicHodgeTheory:P7/berger-robba-identification`, `PadicHodgeTheory:P7/robba-ring-tensor-identity`, `PadicHodgeTheory:P7/localisation-maps-p-adic-field`, `PadicHodgeTheory:P7/extended-robba-ring-with-galois-action`, `PadicHodgeTheory:P7/extended-robba-plus-decomposition`, `PadicHodgeTheory:P7/extended-localisation-maps`, `PadicHodgeTheory:P7/decompletion-operators`.
- **Request to `PhiGammaModulesAndIwasawaCohomology:PG.1`.** Fontaine's equivalence for p-adic representations V of G_K: D(V) = (B tensor V)^{H_K} is an etale (phi, Gamma_K)-module over B_K of rank d, with V = (B tensor_{B_K} D(V))^{phi=1}; exact, compatible with tensor products, duals and Tate twists (D(V(n)) = D(V) tensor e_n, phi(e_n) = e_n, gamma(e_n) = chi(gamma)^n e_n); and, for F = K_0 unramified, T = (A_F tensor N)^{phi=1} recovers a lattice from a Wach module (Berger 2004 Proposition III.4.2). Needed by `PadicHodgeTheory:P7/robba-realisation-comparison`, `PadicHodgeTheory:P7/wach-fontaine-laffaille-comparison`.
- **Request to `PhiGammaModulesAndIwasawaCohomology:PG.2`.** The Cherbonnier–Colmez overconvergence theorem: for every p-adic representation V of G_K there is r(V) with D(V) = B_K tensor_{B^{dagger,r}_K} D^{dagger,r}(V), D^{dagger,r}(V) = (B^{dagger,r} tensor V)^{H_K} free of rank d over B^{dagger,r}_K for r >= r(V); B^dagger tensor_{B^dagger_K} D^dagger(V) = B^dagger tensor V; D^dagger(V) is the largest finitely generated B^dagger_K-submodule of D(V) stable under phi and Gamma_K; compatibility with tensor products, duals and twists; and a basis of D^{dagger,r}(V) in which Mat(phi) lies in GL_d(B^{dagger,pr}_K). Needed by `PadicHodgeTheory:P7/robba-realisation-comparison`.
- **Request to `PhiGammaModulesAndIwasawaCohomology:PG.6`.** For F = W(k)[1/p] and V crystalline with Hodge–Tate weights in [a, b] (HT(chi) = +1) and T a G_F-stable lattice: the Wach modules N(T) (free of rank d over A^+_F, Gamma_F-stable with trivial action on N(T)/pi N(T), pi^r D^+(T) contained in N(T) for weights <= 0, phi-stable) and N(V) = B^+_F tensor N(T), N(T) = pi^{-b} N(T(-b)) in general, including the etaleness condition on B_F tensor N (Berger errata 2026 for Definition III.4.1); the inclusion D_cris(V) in B^+_{rig,F} tensor N(V) with D_cris(V) = (B^+_{rig,F} tensor N(V))^{Gamma_F} (Berger 2004 Proposition II.2.1); the elementary divisors of B^+_{rig,F} tensor_F D_cris(V) in B^+_{rig,F} tensor N(V) (Propositions II.3.1, III.2.1) and B^+[1/pi] tensor V = B^+[1/pi] tensor N(V) (Theorem III.3.1); the equivalence V |-> N(V) (Proposition III.4.2). Needed by `PadicHodgeTheory:P7/wach-dcris-comparison`, `PadicHodgeTheory:P7/integral-dcris-lattice`, `PadicHodgeTheory:P7/wach-fontaine-laffaille-comparison`.
- **Request to `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`.** For K = K_0 unramified: strongly divisible lattices M of filtered phi-modules (sum_i p^{-i} phi(Fil^i M) = M, Fontaine–Laffaille 1982 Section 7.7-7.8) and the Fontaine–Laffaille correspondence between G_F-stable lattices of crystalline V with weights in an interval of length <= p - 2 and strongly divisible lattices of D_cris(V) (Fontaine–Laffaille 1982 Proposition 7.17), with its covariance and HT(chi) = +1 translation stated explicitly. Needed by `PadicHodgeTheory:P7/wach-fontaine-laffaille-comparison`.
- **Request to `PhiGammaModulesAndIwasawaCohomology:PG.0`.** For K/Q_p finite: the field of norms E_K of K_∞/K and the cyclotomic rings A_K, B_K, A†,r_K, B†,r_K, B†_K with the element π_K (π_F = π = [ε] − 1 for K = K_0), φ(π) = (1+π)^p − 1, γ(π) = (1+π)^{χ(γ)} − 1 and commuting φ, Γ_K; B†,r_K free of rank [K_∞ : F_∞] over B†,r_F for r ≫ 0 and an identification of B†,r_K with bounded Laurent series in π_K with coefficients in F'_K = K_∞ ∩ K_0^nr; functoriality in finite extensions L/K (B†_L finite étale over B†_K); the embeddings B†,r_K ⊂ (B̃†,r)^{H_K} and (B̃)^{H_K} = B̃_K, (B̃†)^{H_K} = B̃†_K. Needed by `PadicHodgeTheory:P7/extended-robba-ring-with-galois-action`, `PadicHodgeTheory:P7/decompletion-operators`, `PadicHodgeTheory:P7/theta-iota-surjective-onto-Kn`, `PadicHodgeTheory:P7/nabla-operator-on-robba-ring`, `PadicHodgeTheory:P7/antiderivatives-on-log-robba-ring`, `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`.
- **Request to `PhiGammaModulesAndIwasawaCohomology:PG.1`.** Fontaine's equivalence V ↦ D(V) = (B ⊗_{Q_p} V)^{H_K} onto étale (φ,Γ_K)-modules over B_K, with V = (B ⊗_{B_K} D(V))^{φ=1}; compatibility with ⊗, duals and restriction to G_L (D(V|_{G_L}) = B_L ⊗_{B_K} D(V)); for bases, the matrices P of φ and G of γ satisfy φ(G) = γ(P)GP^{−1}. Needed by `PadicHodgeTheory:P7/berger-dcris-dst-dictionary`, `PadicHodgeTheory:P7/connection-on-robba-realisation`.
- **Request to `PhiGammaModulesAndIwasawaCohomology:PG.2`.** Cherbonnier–Colmez overconvergence: D†(V) = (B† ⊗ V)^{H_K} with B_K ⊗ D†(V) = D(V); for r ≥ r(V), D†,r(V) is free over B†,r_K with a basis that is a B_K-basis of D(V), Γ_K acting continuously; D†(V|_{G_L}) = B†_L ⊗ D†(V) for L/K finite; for n ≥ n(K), ι_n = φ^{−n} maps B†,r_n_K into K_n[[t]] ⊂ B_dR^+ (Cherbonnier–Colmez 1999); the decompletion maps R_k on B̃†_F (Cherbonnier–Colmez 1998, III.2); and the Tate–Sen formalism (normalised traces, conditions (TS1)–(TS3), Brinon–Conrad §14) for (C, K_∞) and B_dR^+ used by Sen's theory and D_dif. Needed by `PadicHodgeTheory:P7/extended-robba-ring-with-galois-action`, `PadicHodgeTheory:P7/extended-localisation-maps`, `PadicHodgeTheory:P7/decompletion-operators`, `PadicHodgeTheory:P7/theta-iota-kernel`, `PadicHodgeTheory:P7/berger-dcris-dst-dictionary`, `PadicHodgeTheory:P7/connection-on-robba-realisation`, `PadicHodgeTheory:P7/sen-module`, `PadicHodgeTheory:P7/fontaine-dif-module`, `PadicHodgeTheory:P7/ddr-via-robba-realisation`, `PadicHodgeTheory:P7/berger-comparison-isomorphisms`, `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`.

## R06.3 Monodromy and Weil–Deligne comparison at p

The $p$-adic monodromy theorem: every de Rham representation is potentially semistable. The proof follows Berger 2002.

1. Fontaine's criterion identifies de Rham representations with those whose $D_{\mathrm{dif}}$ connection is trivial.
2. The lattices $N_s$ give Berger's $(\varphi,\nabla)$-module $N_{\mathrm{dR}}(V)$ over the Robba ring, which is a $p$-adic differential equation with Frobenius structure.
3. Crew's conjecture, imported by id from RD.2, makes it unipotent after a finite extension.
4. The P7 criterion then gives potential semistability.

Fontaine's recipe gives the Weil–Deligne representation of a potentially semistable representation. The layer proves that it is independent of the choices, proves descent, and compares Frobenius, monodromy, twist and determinant conventions with R01.2. The normalisation is checked on the Tate curve's filtered $(\varphi,N)$-module.

### Objects

#### Construction. Berger's (φ,∇)-module N_dR(V) of a de Rham representation

*Module* `TauCeti/PadicHodge/Monodromy/DeRhamDiffEq.lean`. *Node* `PadicHodgeTheory:R06.3/de-rham-differential-equation`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. Let V be a de Rham representation of G_K of dimension d with Hodge–Tate weights ≤ 0 (convention HT(χ_p) = +1). There is a unique B†_rig,K-submodule N_dR(V) ⊂ D†_rig(V), free of rank d and stable by ∂_V = t^{−1}∇_V. It is stable by φ and Γ_K, satisfies φ^*N_dR(V) = N_dR(V) (the linearisation of φ is an isomorphism), N_dR(V)[1/t] = D†_rig(V)[1/t], and for s ≫ 0 there is N_s ⊂ D†,s_rig(V) free of rank d, stable by ∂_V and Γ_K, with N_dR(V) = B†_rig,K ⊗ N_s. For general de Rham V, N_dR(V) := t^{−h}N_dR(V(−h)) ⊗ e_h ⊂ D†_rig(V)[1/t] for any h ≥ (largest Hodge–Tate weight), independent of h. Thus (N_dR(V), φ, ∂_V) is a p-adic differential equation with Frobenius structure over B†_rig,K.

*Hypotheses.* Hodge–Tate weights ≤ 0 is needed for N_dR(V) ⊂ D†_rig(V) (otherwise only N_dR(V) ⊂ D†_rig(V)[1/t]). Called N_dR by analogy with Wach modules (Berger's Théorème 5.10).

*API.*

- `deRhamDiffEq` (*constructor*) — N_dR(V) ⊂ D†_rig(V) for de Rham V with weights ≤ 0 (twisted definition in general).
- `deRhamDiffEq_free` (*characterisation*) — N_dR(V) is free of rank d and N_dR(V)[1/t] = D†_rig(V)[1/t].
- `deRhamDiffEq_unique` (*characterisation*) — N_dR(V) is the unique free rank-d ∂_V-stable submodule of D†_rig(V).
- `deRhamDiffEq_frobenius` (*structure*) — φ(N_dR(V)) ⊂ N_dR(V) and φ^*N_dR(V) = N_dR(V).
- `deRhamDiffEq_gamma` (*structure*) — N_dR(V) is Γ_K-stable and ∂_V∘φ = pφ∘∂_V on it.
- `deRhamDiffEq_crystalline` (*compatibility*) — For V crystalline with weights ≤ 0, N_dR(V) = B†_rig,K ⊗_{K_0} D_cris(V).
- `deRhamDiffEq_functor` (*functoriality*) — V ↦ N_dR(V) is an exact faithful ⊗-functor from de Rham representations (with the twisted definition) to p-adic differential equations with Frobenius structure.

*Used by.*

- Berger 2002, Théorème 5.19 — input to André's/Kedlaya's local monodromy theorem
- `PadicDifferentialEquationsAndRigidCohomology:RD.2/berger-form-of-local-monodromy` — M = N_dR(V) is the finitely presented module with connection and Frobenius structure
- Berger 2008, Théorème V.2.3 — D_st,L(V) = Sol_L(N_dR(V)) and N_dR(V) = (B†_rig,L[ℓ_X] ⊗ D_st,L(V))^{H_K, N=0}

*Unit tests.* A wrong definition fails one of these.

- `deRhamDiffEq_twist` (computation) — For V = Q_p(−n), n ≥ 0: N_dR(V) = t^n·D†_rig(V) = B†_rig,K·(t^n e_{−n}), with ∂_V(t^n e_{−n}) = 0.
- `deRhamDiffEq_trivial` (degenerate) — For V = Q_p: N_dR(V) = D†_rig(V) = B†_rig,K with ∂_V = ∂.
- `deRhamDiffEq_crystalline_eq` (compatibility) — For V crystalline with weights ≤ 0: N_dR(V) = B†_rig,K ⊗_{K_0} D_cris(V) (Berger intro IV.4).
- `deRhamDiffEq_not_for_nonDeRham` (non-example) — For a non-split extension V of Q_p(1) by Q_p (Hodge–Tate, not de Rham) no free rank-2 ∂_V-stable submodule of D†_rig(V)[1/t] exists (PadicHodgeTheory:R06.3/robba-lattice-implies-de-rham).

*Construction.*

1. Take N_s from PadicHodgeTheory:R06.3/de-rham-lattice-Ns: free of rank d with ∇_V(N_s) ⊂ tN_s, i.e. ∂_V-stable; Γ_K-stable by construction.
2. For s_1 ≤ s_2, B†,s_2_rig,K ⊗ N_{s_1} ⊂ N_{s_2} is an equality by uniqueness (PadicHodgeTheory:R06.3/determinant-of-stable-submodule); set N_dR(V) = B†_rig,K ⊗ N_s, independent of s.
3. φ(N_s) is free of rank d in D†,ps_rig(V) and ∂_V-stable (∂_V∘φ = pφ∘∂_V, PadicHodgeTheory:P7/connection-on-robba-realisation), so φ(N_s) = N_ps by uniqueness; hence φ(N_dR(V)) ⊂ N_dR(V) and φ^*N_dR(V) is a free rank-d ∂_V-stable submodule, equal to N_dR(V).
4. Uniqueness of N_dR(V) itself: N_dR(V) determines N_s, which is unique (Berger proof of Théorème 5.10).
5. The twisted definition for general V is independent of h by the uniqueness statement applied to V(−h) and V(−h−1) (t·N_dR(V(−h)) ⊗ e_{−1} is ∂-stable of rank d).

*Acceptance.*

- V crystalline with weights ≤ 0: N_dR(V) = B†_rig,K ⊗_{K_0} D_cris(V) (Berger intro IV.4).
- V semistable with weights ≤ 0: N_dR(V) = (B†_log,K ⊗_{K_0} D_st(V))^{N=0} (Berger intro IV.4; Berger 2008 Théorème V.2.3(3)).

*Uses.* `PadicHodgeTheory:R06.3/de-rham-lattice-Ns`, `PadicHodgeTheory:R06.3/determinant-of-stable-submodule`, `PadicHodgeTheory:P7/connection-on-robba-realisation`, `PadicHodgeTheory:R06.3/de-rham-iff-dif-connection-trivial`, `PadicHodgeTheory:P7/robba-realisation-comparison`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`.

*Planet:* Berger's (φ,∇)-module N_dR(V).

*Sources.*

- Représentations p-adiques et équations différentielles, Théorème 5.10, p. 52: “Alors il existe un unique sous B†rig,K -module libre de rang d de D†rig (V ) stable par” Existence and uniqueness of N_dR(V).
- Représentations p-adiques et équations différentielles, Proof of Théorème 5.19, p. 58: “Le seul point à vérifier est que ϕ∗ (NdR (V )) = NdR (V )” Frobenius structure by uniqueness.
- An introduction to the theory of p-adic representations, IV.4, p. 29: “NdR (V ) = B†rig,K ⊗F Dcris (V ) or NdR (V ) = (B†log,K ⊗F Dst (V ))N =0” Crystalline and semistable cases.

#### Construction. Potentially semistable representations and the (φ,N,G_K)-module D_pst(V)

*Module* `TauCeti/PadicHodge/Monodromy/PotentiallySemistable.lean`. *Node* `PadicHodgeTheory:R06.3/potentially-semistable-dieudonne-module`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. Let E/Q_p be finite and V a finite-dimensional E-linear continuous representation of G_K. V is potentially semistable if V|_{G_L} is semistable for some finite L/K. For L/K finite Galois put D_st,L(V) := (B_st ⊗_{Q_p} V)^{G_L}, a finite free L_0 ⊗_{Q_p} E-module (when V|_{G_L} is semistable) with: φ, σ-semilinear, E-linear and bijective; N, L_0 ⊗ E-linear with Nφ = pφN; an L_0-semilinear, E-linear action of Gal(L/K) commuting with φ and N; and a Gal(L/K)-stable filtration on L ⊗_{L_0} D_st,L(V) with (L ⊗_{L_0} D_st,L(V))^{Gal(L/K)} = D_dR(V) as filtered K ⊗ E-modules. Let K_0^nr be the maximal unramified extension of K_0 in K̄ and D_pst(V) := ∪_L (B_st ⊗ V)^{G_L} (L running over finite extensions of K in K̄): a K_0^nr ⊗ E-module with φ, N and a semilinear G_K-action that is discrete (the stabiliser of each vector is open; I_K acts through a finite quotient on a basis). The natural map K_0^nr ⊗_{L_0} D_st,L(V) → D_pst(V) is an isomorphism whenever V|_{G_L} is semistable, and V is potentially semistable iff D_pst(V) has rank d = dim_E V over K_0^nr ⊗ E.

*Hypotheses.* B_st^{G_L} = L_0 (R06.1/period-ring-invariants); the filtered (φ,N)-modules with descent data are those of R06.2/filtered-phi-n-modules (Fontaine–Ouyang Definition 6.61). E is arbitrary finite over Q_p; when E contains the images of all embeddings L_0 → Ē, L_0 ⊗_{Q_p} E = ∏_{τ: L_0 → E} E.

*API.*

- `stL` (*constructor*) — D_st,L(V) = (B_st ⊗ V)^{G_L} with φ, N, Gal(L/K) and the filtration on L ⊗_{L_0} D_st,L(V).
- `pst` (*constructor*) — D_pst(V) = ∪_L D_st,L(V), a K_0^nr ⊗ E-module with φ, N and a discrete semilinear G_K-action.
- `pst_baseChange` (*characterisation*) — K_0^nr ⊗_{L_0} D_st,L(V) ≅ D_pst(V) when V|_{G_L} is semistable.
- `pst_rank_iff` (*characterisation*) — V is potentially semistable iff rank_{K_0^nr ⊗ E} D_pst(V) = dim_E V.
- `stL_deRham` (*compatibility*) — (L ⊗_{L_0} D_st,L(V))^{Gal(L/K)} = D_dR(V) as filtered K ⊗ E-modules.
- `pst_tensor` (*functoriality*) — D_pst is an exact ⊗-functor on potentially semistable representations, compatible with duals, restriction to G_{K'} and extension of E.

*Used by.*

- `PadicHodgeTheory:R06.3/weil-deligne-parameter` — Fontaine's recipe is applied to D_st,L(V) (equivalently D_pst(V))
- `LocalGaloisDeformationRings:R08.3` — Kisin's potentially semistable deformation rings fix the Hodge type and the inertial type read off from D_pst(V)
- Berger 2008, Théorème V.2.1 and V.2.3 — D_st,L(V) = Sol_L(N_dR(V)) and the filtered (φ,N,G_{L/K})-modules

*Unit tests.* A wrong definition fails one of these.

- `pst_crystalline` (degenerate) — For V crystalline, D_pst(V) = K_0^nr ⊗_{K_0} D_cris(V) with I_K acting trivially and N = 0.
- `pst_finite_character` (computation) — For V = E(ψ) with ψ of finite order: D_pst(V) = (K_0^nr ⊗ E)·e with g·(λ ⊗ e) = g(λ)ψ(g) ⊗ e.
- `pst_not_full_rank` (non-example) — For a non-split extension V of Q_p(1) by Q_p (Hodge–Tate, not de Rham), rank D_pst(V) = 1 < 2.
- `stL_eq_fontaine_ouyang` (compatibility) — D_st,L(V) with its Gal(L/K)-action and filtration is the filtered (φ,N,Gal(L/K))-module of Fontaine–Ouyang Definition 6.61 attached to V (R06.2/filtered-phi-n-modules).

*Construction.*

1. D_st,L(V) is a (φ,N)-module over L_0 by R06.2/period-functors applied to V|_{G_L}; the Gal(L/K) = G_K/G_L-action on (B_st ⊗ V)^{G_L} is semilinear for the action on L_0 = B_st^{G_L} and commutes with φ and N (they commute with G_K on B_st, R06.1/semistable-period-ring).
2. Filtration and descent: L ⊗_{L_0} D_st,L(V) = D_dR(V|_{G_L}) = L ⊗_K D_dR(V) (K ⊗_{K_0} B_st ⊂ B_dR is injective and Hilbert 90 for Gal(L/K), Fontaine–Ouyang §6.5.2 comment (1)).
3. Base change: if V|_{G_L} is semistable and L ⊂ L', then V|_{G_{L'}} is semistable and L'_0 ⊗_{L_0} D_st,L(V) = D_st,L'(V) (injectivity of the comparison map and equality of dimensions); pass to the union.
4. Discreteness: each vector of D_pst(V) lies in some D_st,L(V), fixed by G_L.

*Acceptance.*

- V crystalline: D_pst(V) = K_0^nr ⊗_{K_0} D_cris(V) with G_K acting on the first factor only.
- V = E(ψ), ψ of finite order with splitting field L: D_pst(V) = (K_0^nr ⊗ E)·(1 ⊗ e) with g(λ ⊗ e) = g(λ)ψ(g) ⊗ e.

*Uses.* `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.2/filtered-phi-n-modules`, `PadicHodgeTheory:R06.1/semistable-period-ring`, `PadicHodgeTheory:R06.1/period-ring-invariants`, `PadicHodgeTheory:R06.1/de-rham-period-ring`, `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`.

*Sources.*

- Theory of p-adic Galois representations, §6.5.2, Comments about Theorem B (1), p. 143: “J acts on D = Dst,K 0 (V ) semi-linearly with respect to the action of J” The (φ,N,Gal(L/K))-module D_st,L(V).
- Theory of p-adic Galois representations, Definition 6.61, p. 143: “A filtered (ϕ, N, Gal(K 0 /K))-module over K is a finite dimensional K00 -vector space D0 equipped with actions of (ϕ, N, Gal(K 0 /K))” Filtered (φ,N,Gal(L/K))-modules.
- An introduction to the theory of p-adic representations, II.5.2, p. 20: “It is a finite dimensional (ϕ, N )-module with an action of Gal(L/K)” D^L_st(V) for potentially semistable V.

#### Construction. Fontaine's recipe: the Weil–Deligne representation of a (φ,N,Gal(L/K))-module

*Module* `TauCeti/PadicHodge/Monodromy/WeilDeligne.lean`. *Node* `PadicHodgeTheory:R06.3/fontaine-weil-deligne-functor`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. For w in the Weil group W_K let α(w) ∈ Z be defined by: the image of w in Gal(k̄/F_p) is the α(w)-th power of the absolute arithmetic Frobenius x ↦ x^p (so α(W_K) = f_K·Z with q_K = p^{f_K}, and α(Φ) = f_K for an arithmetic Frobenius lift Φ). A Weil–Deligne representation over a field Ω of characteristic 0 is a pair (r, N) with r: W_K → GL(D) of open kernel on I_K and N nilpotent with r(w)Nr(w)^{−1} = p^{α(w)}N, i.e. r(Φ)Nr(Φ)^{−1} = q_K·N for arithmetic Φ (Deligne 8.4.1, ArithmeticGaloisRepresentations:R01.2). Let L/K be finite Galois and E/Q_p finite containing the images of all embeddings L_0 → Ē. For a (φ,N,Gal(L/K))-module D over E (finite free L_0 ⊗_{Q_p} E-module, φ σ-semilinear E-linear bijective, N L_0 ⊗ E-linear with Nφ = pφN, Gal(L/K) acting L_0-semilinearly and E-linearly and commuting with φ, N), extend the Gal(L/K)-action to W_K through W_K → Gal(L/K) and put r_D(w) := w̄ ∘ φ^{−α(w)}. Then r_D(w) is L_0 ⊗ E-linear, so it preserves each factor D_τ of D = ∏_{τ: L_0 → E} D_τ, and WD_τ(D) := (D_τ, r_D|_{D_τ}, N|_{D_τ}) is a Weil–Deligne representation of W_K over E, trivial on I_L, with r_D(w)N r_D(w)^{−1} = p^{α(w)}N. Its isomorphism class WD(D) is independent of τ (PadicHodgeTheory:R06.3/weil-deligne-independence-of-choices), and D ↦ WD(D) is an equivalence from (φ,N,Gal(L/K))-modules over E to Weil–Deligne representations over E trivial on I_L, compatible with ⊗, duals and the twist D(1) (φ_{D(1)} = p^{−1}φ_D) ↦ WD(D) ⊗ ω, where ω(w) = p^{α(w)}.

*Hypotheses.* The exponent is −α(w): with this sign r_D is linear and the arithmetic-Frobenius relation r(Φ)Nr(Φ)^{−1} = q_K N holds, matching R01.2; the opposite exponent gives the geometric normalisation. Fontaine's original source (Astérisque 223, 'Représentations ℓ-adiques potentiellement semi-stables') is not public; the recipe is taken from Breuil–Schneider §4 and Allen §1.1.6, which cite it.

*API.*

- `fontaineWD` (*constructor*) — WD_τ(D) = (D_τ, w ↦ w̄∘φ^{−α(w)}, N) for a (φ,N,Gal(L/K))-module D over E and τ: L_0 → E.
- `fontaineWD_linear` (*characterisation*) — w̄∘φ^{−α(w)} is L_0 ⊗ E-linear.
- `fontaineWD_relation` (*relation*) — r_D(w)N r_D(w)^{−1} = p^{α(w)}N; for arithmetic Frobenius Φ, r_D(Φ)Nr_D(Φ)^{−1} = q_K N.
- `fontaineWD_inertia` (*simp*) — r_D(w) = w̄ on D_τ for w ∈ I_K; r_D is trivial on I_L.
- `fontaineWD_equiv` (*equivalence*) — D ↦ WD(D) is an equivalence onto Weil–Deligne representations over E trivial on I_L (Breuil–Schneider Proposition 4.1).
- `fontaineWD_tensor` (*functoriality*) — WD(D ⊗ D') ≅ WD(D) ⊗ WD(D'), WD(D^*) ≅ WD(D)^*, WD(det D) = det WD(D).
- `fontaineWD_twist` (*relation*) — WD(D(1)) ≅ WD(D) ⊗ ω with ω(w) = p^{α(w)} (unramified, ω(Φ) = q_K).

*Used by.*

- `PadicHodgeTheory:R06.3/weil-deligne-parameter` — WD(V) := WD(D_st,L(V))
- Breuil–Schneider §4 — the pair (WD(D), filtration) parametrises potentially semistable representations for p-adic Langlands
- `ArithmeticGaloisRepresentations:R01.2` — p-adic counterpart of the ℓ-adic Weil–Deligne functor; compared in PadicHodgeTheory:R06.3/convention-comparison-with-r01

*Unit tests.* A wrong definition fails one of these.

- `fontaineWD_unramified_rank_one` (computation) — K = L = Q_p, D = E·e, φ(e) = λe, N = 0: WD(D) is the unramified character with Frob_p ↦ λ^{−1}.
- `fontaineWD_trivial` (degenerate) — D = L_0 ⊗ E with φ = σ ⊗ 1, N = 0, Gal(L/K) acting on L_0: WD(D) is the trivial one-dimensional representation with N = 0.
- `fontaineWD_tate_matrix` (computation) — K = L = Q_p, D = Q_p x ⊕ Q_p y, φ = diag(p^{−1}, 1), N(y) = v x: r(Frob_p) = diag(p, 1) and r N r^{−1} = pN (checked in PARI/GP).
- `fontaineWD_wrong_sign` (non-example) — The recipe r'(w) = w̄∘φ^{+α(w)} is σ^{2α(w)}-semilinear, hence not L_0-linear when L_0 ≠ Q_p, and for L_0 = Q_p it satisfies r'(Φ)Nr'(Φ)^{−1} = q_K^{−1}N for arithmetic Φ: it is not Fontaine's functor (it realises the geometric-Frobenius normalisation).
- `fontaineWD_compat_deligne` (compatibility) — The relation r(w)Nr(w)^{−1} = p^{α(w)}N is Deligne's (8.4.1.1) with v'(w) = α(w)/f_K counting arithmetic Frobenius powers (ArithmeticGaloisRepresentations:R01.2/grothendieck-monodromy-and-the-weil-deligne-functor).

*Construction.*

1. Linearity: for a ∈ L_0, w̄(a·x) = σ^{α(w)}(a)·w̄(x) (w̄ acts on L_0 as its image in Gal(k̄/F_p), the α(w)-th power of σ) and φ^{−α(w)}(a·x) = σ^{−α(w)}(a)φ^{−α(w)}(x); hence r_D(w)(ax) = a·r_D(w)(x).
2. Homomorphism: w̄ commutes with φ, and α is additive, so r_D(ww') = r_D(w)r_D(w'); I_L acts trivially (α = 0 and w̄ = 1), so the kernel is open in I_K.
3. Relation: Nφ = pφN gives φ^{−1}N = pNφ^{−1}, hence φ^{−α}N = p^{α}Nφ^{−α} for α ∈ Z; N commutes with w̄; so r_D(w)N = p^{α(w)}N r_D(w). N is nilpotent (Brinon–Conrad Lemma 8.2.8).
4. Equivalence: Breuil–Schneider Proposition 4.1 builds the quasi-inverse D = ⊕_{n=0}^{f'−1} V_{σ_0∘φ_0^{−n}} with φ shifting the factors and a geometric Frobenius closing the cycle.
5. Twist: r_{D(1)}(w) = w̄(p^{−1}φ)^{−α(w)} = p^{α(w)}r_D(w).

*Acceptance.*

- Rank one, K = L = Q_p, D = E·e with φ(e) = λe: WD(D) is the unramified character with r(Frob_p) = λ^{−1}.
- The Tate-curve module (PadicHodgeTheory:R06.3/tate-curve-weil-deligne-example): r(Frob_p) = diag(p, 1), N = [[0, v],[0, 0]].

*Uses.* `PadicHodgeTheory:R06.2/filtered-phi-n-modules`, `ArithmeticGaloisRepresentations:R01.2`, `ArithmeticGaloisRepresentations:R01.2/grothendieck-monodromy-and-the-weil-deligne-functor`.

*Planet:* Fontaine's Weil–Deligne recipe.

*Sources.*

- First steps towards p-adic Langlands functoriality, §4, p. 14: “r(w) := w ◦ ϕ−α(w) where w is the image of w in Gal(L′ /L) and α(w) ∈ f Z is the” Fontaine's recipe with α(w) the power of the absolute arithmetic Frobenius.
- First steps towards p-adic Langlands functoriality, Proposition 4.1, p. 14: “The functor WD : MODL′ /L → WDL′ /L is an equivalence” Equivalence of categories.
- Deformations of polarized automorphic Galois representations and adjoint Selmer groups, §1.1.6, p. 9: “We then define an L0 ⊗Qp E-linear action, that we denote rD , of WK on” Same recipe, with the twist compatibility WD(D(1)) = WD(D)(1).
- An introduction to the theory of p-adic representations, II.5.2, p. 20: “The action of the Weil-Deligne group on DLst (V ) was defined by Fontaine” Attribution to Fontaine.

#### Construction. The potentially semistable Weil–Deligne parameter WD(V) of a de Rham representation

*Module* `TauCeti/PadicHodge/Monodromy/WeilDeligne.lean`. *Node* `PadicHodgeTheory:R06.3/weil-deligne-parameter`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. For w in the Weil group W_K let α(w) ∈ Z be defined by: the image of w in Gal(k̄/F_p) is the α(w)-th power of the absolute arithmetic Frobenius x ↦ x^p (so α(W_K) = f_K·Z with q_K = p^{f_K}, and α(Φ) = f_K for an arithmetic Frobenius lift Φ). A Weil–Deligne representation over a field Ω of characteristic 0 is a pair (r, N) with r: W_K → GL(D) of open kernel on I_K and N nilpotent with r(w)Nr(w)^{−1} = p^{α(w)}N, i.e. r(Φ)Nr(Φ)^{−1} = q_K·N for arithmetic Φ (Deligne 8.4.1, ArithmeticGaloisRepresentations:R01.2). Let V be a de Rham E-linear representation of G_K (E/Q_p finite). By PadicHodgeTheory:R06.3/p-adic-monodromy-theorem there is a finite Galois L/K with V|_{G_L} semistable; enlarge E so that it contains the images of all embeddings L_0 → Ē. Define WD(V) := WD(D_st,L(V)) (PadicHodgeTheory:R06.3/fontaine-weil-deligne-functor), a Weil–Deligne representation of W_K over E, well defined up to isomorphism independently of L and τ (PadicHodgeTheory:R06.3/weil-deligne-independence-of-choices); for general E it is defined over Ē after extension of scalars. Attached data: the Frobenius-semisimplification WD(V)^{F-ss}; the inertial type τ(V) := isomorphism class of WD(V)|_{I_K} (a representation of I_K with open kernel) together with N; the Hodge type (Hodge–Tate weights with multiplicities, PadicHodgeTheory:R06.2/hodge-tate-weight-convention). Hodge type, inertial type and Frobenius eigenvalues are independent data.

*Hypotheses.* V de Rham; the monodromy theorem makes the parameter defined on all de Rham representations. Iso class only: WD(V) is not functorial in V without fixing L and τ.

*API.*

- `weilDeligneParameter` (*constructor*) — WD(V) := WD(D_st,L(V)) for V de Rham, as an isomorphism class of Weil–Deligne representations over Ē.
- `weilDeligneParameter_restrict` (*functoriality*) — WD(V|_{G_{K'}}) ≅ WD(V)|_{W_{K'}} for K'/K finite.
- `weilDeligneParameter_tensor` (*functoriality*) — WD(V ⊗ V') ≅ WD(V) ⊗ WD(V'), WD(V^*) ≅ WD(V)^*, WD(det V) ≅ det WD(V).
- `weilDeligneParameter_twist` (*relation*) — WD(V(n)) ≅ WD(V) ⊗ ω^n.
- `inertialType` (*other*) — τ(V) := iso class of (WD(V)|_{I_K}, N).
- `weilDeligneParameter_frobeniusSemisimple` (*other*) — WD(V)^{F-ss}, the Frobenius-semisimplification (R01.2).
- `weilDeligneParameter_crystalline_iff` (*characterisation*) — V is crystalline (resp. semistable) iff I_K acts trivially on WD(V) and N = 0 (resp. I_K acts trivially).

*Used by.*

- `LocalGaloisDeformationRings:R08.3` — Kisin's potentially semistable deformation rings with fixed Hodge and inertial type
- `PotentialModularityAndCompatibleSystems:R24.5:operations` — local compatibility at coefficient places of compatible systems (Frobenius-semisimple WD parameters at q | ℓ)
- Khare–Wintenberger, Serre's modularity conjecture (I), §5 — strictly compatible systems require the Weil–Deligne parameter at primes above ℓ; inertial WD parameters (ω^{k−2} ⊕ 1, 0) or (id, N ≠ 0) of weight-2 lifts in Theorem 5.1

*Unit tests.* A wrong definition fails one of these.

- `weilDeligneParameter_cyclotomic` (computation) — WD(Q_p(1)) is the unramified character ω with ω(Φ) = q_K (arithmetic Φ), N = 0.
- `weilDeligneParameter_trivial` (degenerate) — WD(E) is the trivial character with N = 0.
- `weilDeligneParameter_finite_character` (computation) — For ψ: G_K → E^× with finite image on inertia and V = E(ψ): WD(V) = ψ|_{W_K}.
- `weilDeligneParameter_not_hodge_type` (non-example) — V_p(E) for an ordinary and for a supersingular elliptic curve over Q_p have the same Hodge type {0,1}, trivial inertial type and N = 0 but different Frobenius eigenvalues (slopes {0,1} versus {1/2,1/2}; y² = x³ − x at p = 5 and p = 3, checked in PARI/GP).
- `weilDeligneParameter_ladic_compat` (compatibility) — For the Tate curve E_q/Q_p, WD(V_p(E_q)) and the ℓ-adic WD(V_ℓ(E_q)) of ArithmeticGaloisRepresentations:R01.2 are isomorphic after an embedding of coefficients (both: r(Φ) with eigenvalues p on ker N and 1 on the quotient, N ≠ 0).

*Construction.*

1. Choice of L: PadicHodgeTheory:R06.3/p-adic-monodromy-theorem.
2. D_st,L(V) is a (φ,N,Gal(L/K))-module over E (PadicHodgeTheory:R06.3/potentially-semistable-dieudonne-module).
3. Apply Fontaine's functor; independence: PadicHodgeTheory:R06.3/weil-deligne-independence-of-choices.
4. Frobenius-semisimplification and inertial type are the corresponding operations on Weil–Deligne representations (ArithmeticGaloisRepresentations:R01.2).

*Acceptance.*

- WD(Q_p(1)) = ω, the unramified character with ω(Φ) = q_K for arithmetic Φ, N = 0.
- WD(V_p(E)) for E/K with good reduction: unramified, N = 0, char poly of r(Frob_p) = X^2 − a_pX + p when K = Q_p (checked in PARI/GP for 11a1 at p = 3, 5, 7, 13).
- WD(V_p(E_q)) (Tate curve over Q_p): r(Frob_p) = diag(p, 1), N ≠ 0 (PadicHodgeTheory:R06.3/tate-curve-weil-deligne-example).

*Uses.* `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`, `PadicHodgeTheory:R06.3/potentially-semistable-dieudonne-module`, `PadicHodgeTheory:R06.3/fontaine-weil-deligne-functor`, `PadicHodgeTheory:R06.3/weil-deligne-independence-of-choices`, `ArithmeticGaloisRepresentations:R01.2`, `ArithmeticGaloisRepresentations:R01.2/grothendieck-monodromy-and-the-weil-deligne-functor`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`.

*Planet:* Potentially semistable Weil–Deligne parameter.

*Sources.*

- Deformations of polarized automorphic Galois representations and adjoint Selmer groups, §1.1.6, p. 9: “The isomorphism class of WD(Dst,L (ρ)) does not depend on the choice of L” Definition WD(ρ) := WD(D_st,L(ρ)).
- Serre's modularity conjecture (I), §5, p. 7: “Such a representation defines for every prime q of F a representation of the Weil-Deligne group” Use of the parameter at q | ℓ for geometric representations (via Fontaine).
- An introduction to the theory of p-adic representations, II.5.2, p. 20: “One can attach to such an object several interesting invariants” L-factors, ε-factors and the Weil–Deligne representation.

### Lemmas, theorems and comparisons

#### Lemma. Closed full-rank submodules of finite free B†,s_rig,K-modules are free (Forster)

*Node* `PadicHodgeTheory:R06.3/closed-submodules-of-free-robba-modules`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. Let s with n(s) ≥ n(K), M a free B†,s_rig,K-module of finite rank d with its Fréchet topology (independent of the basis by the open mapping theorem) and N ⊂ M a closed submodule. Then N is free of rank e = dim_{Frac(B†,s_rig,K)} (N ⊗ Frac(B†,s_rig,K)); in particular if N ⊗ Frac = M ⊗ Frac then N is free of rank d.

*Hypotheses.* B†,s_rig,K is identified (non-canonically) with the ring of Laurent series over F'_K converging on the half-open annulus α(K,s) ≤ |x| < 1 (P7). The theorem is due to Forster (Berger 2008, Appendix B).

*Proof outline.*

1. Identify B†,s_rig,K with Kedlaya's analytic ring Γ_an,r on a half-open annulus (P7 identification; PadicDifferentialEquationsAndRigidCohomology:RD.0/robba-ring).
2. Apply PadicDifferentialEquationsAndRigidCohomology:RD.0/vector-bundles-on-half-open-intervals-free: every closed submodule of a finite free Γ_an,r-module is free.
3. The rank equals the generic rank e computed over the fraction field.

*Acceptance.*

- N = t·M is closed of full rank and free with basis t·(basis of M).
- The submodules N_s of PadicHodgeTheory:R06.3/de-rham-lattice-Ns are closed because each ι_n is continuous, which is how the lemma applies to them.

*Uses.* `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/vector-bundles-on-half-open-intervals-free`, `PadicDifferentialEquationsAndRigidCohomology:RD.0/robba-ring`.

*Sources.*

- Représentations p-adiques et équations différentielles, Théorème 4.10, p. 43: “Alors N est libre de rang d.” Statement for full rank.
- Équations différentielles p-adiques et (φ,N)-modules filtrés, Appendice B (Erratum à [Ber02]), p. 26: “le théorème 4.10 est en fait dû à Forster” Attribution.

#### Lemma. A Γ-action with vanishing Lie algebra action is trivial on an open subgroup

*Node* `PadicHodgeTheory:R06.3/lie-algebra-trivial-gamma-action`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. Let L/K be finite, E a field finite over Q_p on which Γ_L acts through a finite quotient, and S a finite-dimensional E-vector space with a continuous semilinear action of Γ_L such that, for every x ∈ S, log(γ)(x)/log χ(γ) → 0, i.e. the Lie algebra operator ∇_S = log(γ)/log χ(γ) (defined for γ close to 1) vanishes. Then an open subgroup of Γ_L acts trivially on S.

*Hypotheses.* Continuity for the p-adic topology of S; the statement is used for S = (N_dR(V) ⊗ B†_log,L)^{∂_V=0} with E = F'_L and for kernels of ∇_V on D_dif(V).

*Proof outline.*

1. Pass to the open subgroup Γ' of Γ_L acting trivially on E; its action on S is E-linear and continuous.
2. For γ ∈ Γ' close enough to 1, the series log(γ) = −Σ(1 − γ)^n/n and exp converge in End_E(S) (γ − 1 topologically nilpotent on a finite-dimensional space) and γ = exp(log γ).
3. log(γ) = log χ(γ)·∇_S = 0, hence γ = 1 on S for all γ in a small open subgroup (Berger, proof of Théorème 5.19; Berger 2008 §III.2).

*Acceptance.*

- S = D_Sen(W) with Θ_W = 0 (Sen): Γ acts through a finite quotient on a K_n-form (Sen's theorem, PadicHodgeTheory:P7/sen-module).

*Uses.* `PadicHodgeTheory:P7/sen-module`, `PadicHodgeTheory:R06.2/period-functors`.

*Sources.*

- Équations différentielles p-adiques et (φ,N)-modules filtrés, §III.2, p. 15: “vectoriel qui hérite d’une action résiduelle de ΓK triviale sur un sous-groupe ouvert (puisque” Statement in the application.
- Représentations p-adiques et équations différentielles, Proof of Théorème 5.19, p. 58: “Comme l’algèbre de Lie de ΓL agit trivialement sur celui-ci, il existe un sous groupe ouvert de ΓL” Use in the monodromy proof.

#### Theorem. Fontaine's criterion: K_∞ ⊗_K D_dR(V) = ker(∇_V on D_dif(V)); V is de Rham iff ∇_V is trivial on D_dif(V)

*Node* `PadicHodgeTheory:R06.3/de-rham-iff-dif-connection-trivial`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. For every p-adic representation V of G_K: K_∞ ⊗_K D_dR(V) is the kernel of ∇_V acting on D_dif(V); in particular V is de Rham iff the meromorphic connection on D_dif(V) is trivial (flat), i.e. dim_{K_∞} ker(∇_V) = d. Moreover, if V is de Rham with Hodge–Tate weights ≤ 0 then K_∞[[t]] ⊗_K D_dR(V) ⊂ D_dif^+(V) ⊃ t^w D_dif^+(V) for some w ≥ 0.

*Hypotheses.* D_dR(V) = (B_dR ⊗ V)^{G_K} (R06.2/period-functors); Hodge–Tate weights in the convention of PadicHodgeTheory:R06.2/hodge-tate-weight-convention.

*Proof outline.*

1. ∇_V kills K_∞ ⊗ D_dR(V), and t^r K_∞[[t]] ⊗_K D_dR(V) is a finitely generated Γ_K-stable K_∞[[t]]-submodule of (B_dR^+ ⊗ V)^{H_K} for r ≫ 0, hence lies in D_dif^+(V).
2. The kernel of ∇_V on D_dif(V) is a finite-dimensional K_∞-space (at most dim_{K_∞((t))} D_dif(V)), Γ_K-stable, hence of the form K_∞ ⊗ W_n for a Γ_K-stable K_n-space W_n; the Lie algebra of Γ_K acts trivially on W_n, so an open subgroup Γ_{K_m} acts trivially (PadicHodgeTheory:R06.3/lie-algebra-trivial-gamma-action), and W_n ⊂ D_dR(V|_{G_{K_m}}) = K_m ⊗_K D_dR(V) (Hilbert 90 for K_m/K, R06.2/period-functors).
3. Equivalently (Brinon–Conrad Propositions 15.4.13 and 15.4.15): K_∞ ⊗_K D_dif(V)^{Γ_K} ≅ D_dif(V)^{∇=0} and D_dif(V)^{Γ_K} = D_dR(V).

*Acceptance.*

- V = Q_p(n): ker ∇_V = K_∞·t^{−n}e_n = K_∞ ⊗ D_dR(Q_p(n)).
- A non-split extension of Q_p(1) by Q_p is Hodge–Tate but not de Rham (Brinon–Conrad §6.3): ker ∇_V has K_∞-dimension 1 < 2.

*Uses.* `PadicHodgeTheory:P7/fontaine-dif-module`, `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.3/lie-algebra-trivial-gamma-action`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`.

*Sources.*

- Représentations p-adiques et équations différentielles, Proposition 5.9, p. 51: “En particulier, V est de de Rham si et seulement si ∇V est la connexion triviale” Statement.
- CMI Summer School notes on p-adic Hodge theory, Proposition 15.4.15, p. 285: “V is de Rham if and only if the meromorphic connection on Ddif (V ) is flat” Public proof of the criterion.

#### Lemma. t-adic approximation of D_dif^+(V) by elements of D†,s_rig(V) at every level n ≥ n_0

*Node* `PadicHodgeTheory:R06.3/approximation-in-dif-module`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. Let t_n := p^n t/φ^{n−1}(q) ∈ B†_rig,K. (1) For s, n with n ≥ n(s) ≥ n(K), w ∈ N and f ∈ K_n[[t]] there is μ ∈ B†,s_rig,K with ι_n(μ) − f ∈ t^w K_n[[t]]. (2) θ∘ι_m(t_n) = 0 for m ≠ n and θ∘ι_n(t_n) = ε^{(1)} − 1. (3) For x ∈ D_dif^+(V) and w ∈ N there is n_0 = n_0(x, w) such that for every n ≥ n_0 some x_n ∈ D†,s_rig(V) satisfies ι_n(x_n) − x ∈ t^w D_dif^+(V).

*Hypotheses.* s large enough that a basis {e_i} of D†(V) lies in D†,s(V), the matrix of φ has entries in B†,s_rig,K and ∂(π_K) is a unit of B†,s_rig,K.

*Proof outline.*

1. (1) (Berger Lemma 5.11): ι_n(B†,s_rig,K) is t-adically dense in K_n[[t]] because t ∈ B†,s_rig,K and θ∘ι_n: B†,s_rig,K → K_n is surjective (PadicHodgeTheory:P7/theta-iota-surjective-onto-Kn).
2. (2) (Lemma 5.12): direct computation with θ(π/π_1) = 0 and ι_m(t) = p^{−m}t.
3. (3) (Lemma 5.13): by PadicHodgeTheory:P7/ddr-via-robba-realisation write x = Σ f_i(t) ⊗ ι_n(e_i) with f_i ∈ K_∞[[t]], truncate to K_{n_0}[t] + t^w K_∞[[t]], rewrite via the matrix P_{n_0−n} of φ^{n_0−n} and approximate each coefficient using (1).
4. (3) for all n ≥ n_0 (Proposition 5.14): transport x_{n_0} by φ^{n−n_0} and re-approximate the coefficients with (1).

*Acceptance.*

- For V = Q_p and x = 1 one may take x_n = 1 for every n.

*Uses.* `PadicHodgeTheory:P7/theta-iota-surjective-onto-Kn`, `PadicHodgeTheory:P7/ddr-via-robba-realisation`, `PadicHodgeTheory:P7/extended-localisation-maps`, `PadicHodgeTheory:P7/theta-iota-kernel`, `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`.

*Sources.*

- Représentations p-adiques et équations différentielles, Lemme 5.11, p. 52: “On cherche à montrer que ιn (B†,s rig,K ) est dense dans Kn [[t]]” Statement (1).
- Représentations p-adiques et équations différentielles, Proposition 5.14, p. 54: “alors pour tout n ⩾ n0 , il existe” Statement (3).

#### Lemma. The module N_s: free of rank d with ∇_V(N_s) ⊂ tN_s

*Node* `PadicHodgeTheory:R06.3/de-rham-lattice-Ns`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. Let V be de Rham with Hodge–Tate weights ≤ 0, s as in PadicHodgeTheory:R06.3/approximation-in-dif-module, w with t^w D_dif^+(V) ⊂ K_∞[[t]] ⊗_K D_dR(V) ⊂ D_dif^+(V), n_1 with ι_n(D†,s_rig(V)) ⊂ K_n((t)) ⊗_K D_dR(V) for n ≥ n_1, and n_0 ≥ max(n_0(r_i, w), n_1) for a K-basis r_i of D_dR(V). Let N_s = {x ∈ D†,s_rig(V) : ι_n(x) ∈ K_n[[t]] ⊗_K D_dR(V) for all n ≥ n_0}. Then N_s is a free B†,s_rig,K-module of rank d and ι_n(N_s) is t-adically dense in K_n[[t]] ⊗_K D_dR(V) for n ≥ n_0; after replacing s by s' = r_{n_0} and N_s by N_{s'} := B†,s'_rig,K ⊗ N_s (so that the zeros of t in the annulus are exactly those of the φ^{n−1}(q), n ≥ n_0), ∇_V(N_{s'}) ⊂ tN_{s'}.

*Hypotheses.* Corrected form (Berger 2008, Appendix B): Berger 2002 asserts ι_n(N_s) = K_n[[t]] ⊗ D_dR(V); only t-adic density holds and is what the proof uses. Weights ≤ 0 in the convention HT(χ_p) = +1 (PadicHodgeTheory:R06.2/hodge-tate-weight-convention).

*Proof outline.*

1. N_s ⊃ t^w D†,s_rig(V) (so it has full generic rank) and is closed since each ι_n is continuous; PadicHodgeTheory:R06.3/closed-submodules-of-free-robba-modules gives N_s free of rank d, with a basis f_1,…,f_d.
2. Density: for each r_i and n ≥ n_0 take s_{i,n} with ι_n(s_{i,n}) − r_i ∈ t^w D_dif^+(V) (PadicHodgeTheory:R06.3/approximation-in-dif-module (3)) and t_{i,n} = s_{i,n}(p^n t/φ^{n−1}(q))^w; by Lemma 5.12 t_{i,n} ∈ N_s and ι_n(t_{i,n}) ≡ ((ε^{(1)} − 1)^w + tu_{i,n})r_i mod t^w D_dif^+(V).
3. ∇_V(N_s) ⊂ N_s because ∇_V commutes with ι_n and K_n[[t]] ⊗ D_dR(V) is ∇_V-stable; since ∇_V(K_n[[t]] ⊗ D_dR(V)) ⊂ tK_n[[t]] ⊗ D_dR(V), the matrix D of ∇_V in the basis f_i satisfies ι_n(D) ∈ M_d(tK_n[[t]]) for all n ≥ n_0, so D ∈ M_d(φ^{n−1}(q)B†,s_rig,K) for all n ≥ n_0 (PadicHodgeTheory:P7/theta-iota-kernel) and D ∈ M_d(tB†,s'_rig,K) for s' = r_{n_0} (PadicHodgeTheory:P7/t-divisibility-criterion, whose proof gives the conclusion on the annulus of s' = r_{n_0}); Berger states ∇_V(N_s) ⊂ tN_s without enlarging s (see sourceIssues).

*Acceptance.*

- V = Q_p(−1) (weight −1), s = r_{n_0}: D†,s_rig(V) = B†,s_rig,K e_{−1}, D_dR(V) = K·t e_{−1}, and N_s = t·B†,s_rig,K e_{−1} with ∇_V(te_{−1}) = t e_{−1} − t e_{−1} = 0.

*Uses.* `PadicHodgeTheory:R06.3/approximation-in-dif-module`, `PadicHodgeTheory:R06.3/closed-submodules-of-free-robba-modules`, `PadicHodgeTheory:P7/theta-iota-kernel`, `PadicHodgeTheory:P7/t-divisibility-criterion`, `PadicHodgeTheory:P7/connection-on-robba-realisation`, `PadicHodgeTheory:R06.3/de-rham-iff-dif-connection-trivial`, `PadicHodgeTheory:P7/extended-localisation-maps`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`.

*Sources.*

- Représentations p-adiques et équations différentielles, Proposition 5.15, p. 54: “Alors Ns est un B†,s rig,K -module libre de rang d, et ∇V (Ns ) ⊂ tNs” Statement.
- Équations différentielles p-adiques et (φ,N)-modules filtrés, Appendice B (Erratum à [Ber02]), p. 27: “il n’est pas vrai que ιn (Ns ) = Kn [[t]] ⊗K DdR (V ).” Correction: only density holds.

#### Lemma. Determinant and uniqueness of ∂_V-stable full-rank submodules

*Node* `PadicHodgeTheory:R06.3/determinant-of-stable-submodule`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. Let V be de Rham with Hodge–Tate weights ≤ 0 (so det V = χ^{−r}ω with r ≥ 0 and ω of finite order on I_K), and M_s ⊂ D†,s_rig(V) a free B†,s_rig,K-submodule of rank d with ∂_V(M_s) ⊂ M_s. Then det(M_s) = t^r·det(D†,s_rig(V)). Consequently, if N^1_s, N^2_s ⊂ D†,s_rig(V) are free of rank d and ∂_V-stable, then N^1_s = N^2_s.

*Hypotheses.* r = −(sum of the Hodge–Tate weights of V) ≥ 0. s large enough that ∂(π_K) is a unit of B†,s_rig,K.

*Proof outline.*

1. det V is a de Rham character, hence of the form χ^{−r}ω with ω finite on inertia (Tate–Sen: a Hodge–Tate character of weight 0 has finite inertial image, R06.2/hodge-tate-decomposition-tate); so D†,s_rig(det V) has a basis e with γ(e) = χ(γ)^{−r}e for γ near 1 and ∂_V(e) = −r t^{−1}e.
2. det(M_s) = λB†,s_rig,K e is ∂_V-stable: ∂(λ)e + λ∂_V(e) = αλe forces t | λ when r ≥ 1; by induction λ = t^r μ with ∂(μ) = βμ, β ∈ B†,s_rig,K.
3. If μ(x) = 0 at a point of the annulus then all derivatives vanish there (∂(π_K) invertible), so μ = 0; hence μ has no zeros and is a unit (Lazard; units of the Robba ring on a half-open annulus, P7).
4. Corollary 5.17: N^1_s + N^2_s is again free of rank d (PadicHodgeTheory:R06.3/closed-submodules-of-free-robba-modules) and ∂_V-stable with the same determinant, so N^1_s = N^1_s + N^2_s = N^2_s.

*Acceptance.*

- V = Q_p(−1): r = 1 and the only ∂_V-stable free rank-one submodule of D†,s_rig(V) is t·D†,s_rig(V).

*Uses.* `PadicHodgeTheory:P7/connection-on-robba-realisation`, `PadicHodgeTheory:R06.3/closed-submodules-of-free-robba-modules`, `PadicHodgeTheory:P7/antiderivatives-on-log-robba-ring`, `PadicHodgeTheory:R06.2/hodge-tate-decomposition-tate`, `PadicHodgeTheory:P7:annulus-foundations/overconvergent-cyclotomic-rings`.

*Sources.*

- Représentations p-adiques et équations différentielles, Lemme 5.16, p. 55: “où r ⩾ 0” det(M_s) = t^r det(D†,s_rig(V)).
- Représentations p-adiques et équations différentielles, Corollaire 5.17, p. 55: “Si Ns1 et Ns2 sont deux sous-modules libres de rang” Uniqueness.

#### Lemma. Converse: a free rank-d ∂_V-stable N_s ⊂ D†,s_rig(V) forces V de Rham with weights ≤ 0

*Node* `PadicHodgeTheory:R06.3/robba-lattice-implies-de-rham`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. If some N_s ⊂ D†,s_rig(V), free of rank d = dim V, is stable by ∂_V, then V is de Rham and its Hodge–Tate weights are ≤ 0.

*Hypotheses.* Hodge–Tate weights in the convention HT(χ_p) = +1.

*Proof outline.*

1. For n ≫ 0, M_n = K_n[[t]] ⊗ ι_n(N_s) ⊂ D_dif^+(V) and M = K_∞[[t]] ⊗ M_n is free of rank d (N_s has full generic rank).
2. M is ∂_V-stable; with C the matrix of ∂_V in a basis of M, the formal differential equation (d/dt)A + CA = 0 has a solution A ∈ GL_d(K_∞[[t]]), giving d independent horizontal vectors r_i ∈ M.
3. By PadicHodgeTheory:R06.3/de-rham-iff-dif-connection-trivial, V is de Rham; since D_dR(V) ⊗ K_∞ = ker(∇_V) ⊂ M ⊂ D_dif^+(V), the weights are ≤ 0 (Berger Proposition 5.18).

*Acceptance.*

- V = Q_p(1): D†_rig(V) contains no ∂_V-stable free rank-one submodule (∂_V(fe_1) = (∂f + f/t)e_1), consistent with its weight 1 > 0.

*Uses.* `PadicHodgeTheory:P7/ddr-via-robba-realisation`, `PadicHodgeTheory:R06.3/de-rham-iff-dif-connection-trivial`, `PadicHodgeTheory:P7/connection-on-robba-realisation`.

*Source.* Représentations p-adiques et équations différentielles, Proposition 5.18, p. 56: “Alors V est de de Rham, et ses poids de Hodge-Tate sont négatifs” Statement.

#### Lemma. N_dR(V) is a p-adic differential equation with Frobenius structure in Berger's sense

*Node* `PadicHodgeTheory:R06.3/de-rham-differential-equation-has-frobenius-structure`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. Let V be de Rham with Hodge–Tate weights ≤ 0. Then M = N_dR(V) with ∂_M := ∂_V|_M and φ_M := φ|_M is a finite free R_K = B†_rig,K-module, ∂_M extends ∂ = (1+π)d/dπ (Leibniz rule), φ_M is φ-semilinear with φ^*M = M, and ∂_M∘φ_M = p·φ_M∘∂_M; i.e. (M, φ_M, ∂_M) satisfies the hypotheses of PadicDifferentialEquationsAndRigidCohomology:RD.2/berger-form-of-local-monodromy (a finitely presented module with connection and Frobenius structure over Berger's Robba ring). Moreover Γ_K acts on M with γ∘∂_M = χ(γ)^{−1}·∂_M∘γ, commuting with φ_M.

*Hypotheses.* The compatibility ∂_M∘φ = pφ∘∂_M is the Frobenius compatibility of Kedlaya's (σ,∇)-modules for the Frobenius lift φ(π) = (1+π)^p − 1, since dx = (π∂x/(1+π))dπ/π (Berger p. 57).

*Proof outline.*

1. Freeness and φ^*M = M: PadicHodgeTheory:R06.3/de-rham-differential-equation.
2. Leibniz rule for ∂_V over ∂: from ∇_V(λx) = ∇(λ)x + λ∇_V(x) and ∇ = t∂ (PadicHodgeTheory:P7/connection-on-robba-realisation, PadicHodgeTheory:P7/nabla-operator-on-robba-ring).
3. ∂_V(φx) = t^{−1}∇_V(φx) = t^{−1}φ(∇_V x) = t^{−1}φ(t∂_V x) = t^{−1}·pt·φ(∂_V x) = pφ(∂_V x), using φ(t) = pt.
4. γ∘∇_V = ∇_V∘γ and γ(t) = χ(γ)t give γ∘∂_V = χ(γ)^{−1}∂_V∘γ.

*Acceptance.*

- V = Q_p(−1) with basis e_{−1} of D†(V) (φ(e_{−1}) = e_{−1}, γ(e_{−1}) = χ(γ)^{−1}e_{−1}): M = B†_rig,K·te_{−1}, φ_M(te_{−1}) = p·te_{−1}, ∂_M(te_{−1}) = t^{−1}(∇(t) − t)e_{−1} = 0, so ∂_M∘φ_M = pφ_M∘∂_M holds on the basis.

*Uses.* `PadicHodgeTheory:R06.3/de-rham-differential-equation`, `PadicHodgeTheory:P7/connection-on-robba-realisation`, `PadicHodgeTheory:P7/nabla-operator-on-robba-ring`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/berger-form-of-local-monodromy`.

*Sources.*

- Représentations p-adiques et équations différentielles, §5.5, p. 57: “cela revient à demander que ∂M ◦ ϕ = pϕ ◦ ∂M” Frobenius compatibility in Berger's normalisation.
- Représentations p-adiques et équations différentielles, Proof of Théorème 5.19, p. 58: “On peut alors associer à V le module NdR (V ), qui est une équation différentielle p-adique munie d’une structure de Frobenius” N_dR(V) is the required input.

#### Theorem. The p-adic monodromy theorem: every de Rham representation is potentially semistable

*Node* `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. Let E/Q_p be finite and V a de Rham E-linear representation of G_K (K/Q_p finite). Then V is potentially semistable: there is a finite Galois extension L/K such that V|_{G_L} is semistable, i.e. dim_{L_0} (B_st ⊗_{Q_p} V)^{G_L} = dim_{Q_p} V. Conversely every potentially semistable representation is de Rham. Moreover, for V with Hodge–Tate weights ≤ 0, L can be chosen so that Γ_L acts trivially on Sol_L := (N_dR(V) ⊗_{B†_rig,K} B†_log,L)^{∂_V=0}, and then F'_L = L_0 and Sol_L = D_st(V|_{G_L}) as (φ,N)-modules.

*Hypotheses.* K is a finite extension of Q_p (so the Robba rings involved are those of PadicDifferentialEquationsAndRigidCohomology:RD.2/berger-form-of-local-monodromy, stated there for K/Q_p finite); Berger's reduction to an algebraically closed residue field is not needed. The solution space of the RD.2 export is naturally an F'_L-vector space (F'_L = L_∞ ∩ K_0^nr, the constants of B†_rig,L), not an L ∩ K_0^nr-space; the proof enlarges L so that Γ_L fixes F'_L, after which F'_L = L_0.

*Proof outline.*

1. Reduce to Hodge–Tate weights ≤ 0: V is potentially semistable (resp. de Rham) iff V(−h) is, since t ∈ B_st^{G_L}-eigen: D_st,L(V(−h)) = t^{h}D_st,L(V) ⊗ e_{−h} (R06.1/fontaine-element-t, R06.2/period-functors).
2. Form N_dR(V) (PadicHodgeTheory:R06.3/de-rham-differential-equation); it satisfies the hypotheses of RD.2/berger-form-of-local-monodromy (PadicHodgeTheory:R06.3/de-rham-differential-equation-has-frobenius-structure).
3. PadicDifferentialEquationsAndRigidCohomology:RD.2/berger-form-of-local-monodromy (via RD.2/logarithmic-form-of-local-monodromy): there is a finite L/K such that Sol_L generates N_dR(V) ⊗ B†_log,L and has dimension d over the constants F'_L of B†_log,L (PadicHodgeTheory:P7/antiderivatives-on-log-robba-ring (3)).
4. Sol_L is Γ_L-stable (γ∂_V = χ(γ)^{−1}∂_Vγ) and ∇ = t∂_V vanishes on it; by PadicHodgeTheory:R06.3/lie-algebra-trivial-gamma-action an open subgroup Γ_{L'} (L' = L(ε^{(m)}), m ≫ 0, so L'_∞ = L_∞) acts trivially; then Γ_{L'} fixes F'_{L'} = F'_L (γ(λs) = γ(λ)s for s ∈ Sol_L), so F'_L ⊂ L' ∩ K_0^nr = L'_0.
5. N_dR(V) ⊗ B†_log,L' ⊂ D†_log(V|_{G_{L'}}) (N_dR(V) ⊂ D†_rig(V) and D†(V|_{G_{L'}}) = B†_{L'} ⊗ D†(V), PG.0/PG.2), so Sol_L ⊂ (D†_log(V|_{G_{L'}})[1/t])^{Γ_{L'}} = D_st(V|_{G_{L'}}) (PadicHodgeTheory:P7/berger-dcris-dst-dictionary over L'); dim_{L'_0} Sol_L = d ≥ dim D_st(V|_{G_{L'}}) forces equality: V|_{G_{L'}} is semistable.
6. Converse: if V|_{G_L} is semistable then it is de Rham over L (L ⊗_{L_0} B_st ⊂ B_dR, R06.2/admissible-representations), and a representation that is de Rham over a finite extension is de Rham, by Hilbert 90 for the semilinear Gal(L/K)-action on D_dR(V|_{G_L}) (Fontaine–Ouyang Proposition 6.58).
7. E-coefficients: apply the theorem to the underlying Q_p-representation.

*Acceptance.*

- V = Q_p(n): L = K suffices (crystalline).
- V = E(ψ) with ψ a finite-order character: de Rham (C-admissible) and semistable exactly over L = K̄^{ker ψ}; the minimal L is the splitting field.
- V = V_p(E) for E/K with potentially good reduction: potentially crystalline, with L the field over which E acquires good reduction (application in R06.6).
- A Hodge–Tate, non-de Rham V (non-split extension of Q_p(1) by Q_p, Brinon–Conrad §6.3) is not potentially semistable: the theorem does not extend to Hodge–Tate representations.

*Uses.* `PadicHodgeTheory:R06.3/de-rham-differential-equation`, `PadicHodgeTheory:R06.3/de-rham-differential-equation-has-frobenius-structure`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/berger-form-of-local-monodromy`, `PadicDifferentialEquationsAndRigidCohomology:RD.2/logarithmic-form-of-local-monodromy`, `PadicHodgeTheory:R06.3/lie-algebra-trivial-gamma-action`, `PadicHodgeTheory:P7/antiderivatives-on-log-robba-ring`, `PadicHodgeTheory:P7/berger-dcris-dst-dictionary`, `PadicHodgeTheory:R06.3/de-rham-iff-dif-connection-trivial`, `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.2/admissible-representations`, `PadicHodgeTheory:R06.1/fontaine-element-t`, `PadicHodgeTheory:R06.1/semistable-period-ring`, `PhiGammaModulesAndIwasawaCohomology:PG.0`, `PhiGammaModulesAndIwasawaCohomology:PG.2`.

*Planet:* p-adic monodromy theorem.

*Sources.*

- Représentations p-adiques et équations différentielles, Théorème 5.19, p. 56: “Si V est une représentation p-adique de de Rham, alors V est potentiellement semi-stable” Statement.
- Représentations p-adiques et équations différentielles, Proof of Théorème 5.19, p. 58: “Par le théorème 3.6, VL est semi-stable. Ceci implique que V est potentiellement semi-stable” Final step.
- Theory of p-adic Galois representations, Theorem B and Remark 6.60, p. 142: “Theorem B. Any de Rham representation of GK is potentially semi-stable.” Statement in the textbook; Remark 6.60 records Berger's proof via Crew's conjecture.
- An introduction to the theory of p-adic representations, IV.5.3, p. 31: “By André, Kedlaya, and Mebkhout’s theorem, this differential equation is quasi-unipotent” Proof architecture.

#### Lemma. WD(V) is independent of the embedding τ and of the extension L

*Node* `PadicHodgeTheory:R06.3/weil-deligne-independence-of-choices`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. For w in the Weil group W_K let α(w) ∈ Z be defined by: the image of w in Gal(k̄/F_p) is the α(w)-th power of the absolute arithmetic Frobenius x ↦ x^p (so α(W_K) = f_K·Z with q_K = p^{f_K}, and α(Φ) = f_K for an arithmetic Frobenius lift Φ). A Weil–Deligne representation over a field Ω of characteristic 0 is a pair (r, N) with r: W_K → GL(D) of open kernel on I_K and N nilpotent with r(w)Nr(w)^{−1} = p^{α(w)}N, i.e. r(Φ)Nr(Φ)^{−1} = q_K·N for arithmetic Φ (Deligne 8.4.1, ArithmeticGaloisRepresentations:R01.2). (a) For a (φ,N,Gal(L/K))-module D over E and embeddings τ, τ': L_0 → E, WD_τ(D) ≅ WD_{τ'}(D). (b) If V|_{G_L} is semistable and L ⊂ L' (both finite Galois over K), then WD(D_st,L'(V)) ≅ WD(D_st,L(V)).

*Hypotheses.* Isomorphism classes only; the isomorphism in (a) is not canonical (it involves a power of φ and a rescaling of N).

*Proof outline.*

1. (a): φ maps D_τ E-linearly and bijectively onto D_{τ∘σ^{−1}} (φ is σ-semilinear); it commutes with each r_D(w) (φ commutes with w̄ and with φ^{−α(w)}) and satisfies φ∘N = p^{−1}N∘φ, so φ: (D_τ, r, N) ≅ (D_{τσ^{−1}}, r, p^{−1}N). Every embedding is τ∘σ^{−j}.
2. A Weil–Deligne representation (r, N) is isomorphic to (r, aN) for every a ∈ E^× (Deligne's argument in Lemme 8.4.3, via the generalised eigenspaces of r(Φ): N maps the λ-eigenspace to the q^{−1}λ-eigenspace; requested from ArithmeticGaloisRepresentations:R01.2); hence WD_τ(D) ≅ WD_{τ'}(D).
3. (b): D_st,L'(V) = L'_0 ⊗_{L_0} D_st,L(V) compatibly with φ, N and Gal(L'/K) → Gal(L/K) (PadicHodgeTheory:R06.3/potentially-semistable-dieudonne-module); for τ': L'_0 → E extending τ, the τ'-component of L'_0 ⊗_{L_0} D is D_τ, and r_{D'}(w) restricts to r_D(w) (same α(w)).

*Acceptance.*

- For D = D_cris(V_p(E)) over K = Q_{p^2} (L = K, f = 2), the two components D_τ, D_{τσ^{−1}} carry r(Φ) = φ^{−2}|_{D_τ} with the same characteristic polynomial.

*Uses.* `PadicHodgeTheory:R06.3/fontaine-weil-deligne-functor`, `PadicHodgeTheory:R06.3/potentially-semistable-dieudonne-module`, `ArithmeticGaloisRepresentations:R01.2`, `ArithmeticGaloisRepresentations:R01.2/grothendieck-monodromy-and-the-weil-deligne-functor`.

*Sources.*

- First steps towards p-adic Langlands functoriality, §4, p. 14: “doesn’t depend on the choice of σ0′” Independence of the embedding (up to non-natural isomorphism).
- Deformations of polarized automorphic Galois representations and adjoint Selmer groups, §1.1.6, p. 9: “The isomorphism class of (rτ , Nτ ) is independent of τ” Independence of τ; Allen cites Breuil–Mézard §2.2.1, not read here (proof given above).

#### Theorem. Descent and restriction properties of WD(V): semistable and crystalline criteria, recovery of D_dR

*Node* `PadicHodgeTheory:R06.3/weil-deligne-descent`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. For w in the Weil group W_K let α(w) ∈ Z be defined by: the image of w in Gal(k̄/F_p) is the α(w)-th power of the absolute arithmetic Frobenius x ↦ x^p (so α(W_K) = f_K·Z with q_K = p^{f_K}, and α(Φ) = f_K for an arithmetic Frobenius lift Φ). A Weil–Deligne representation over a field Ω of characteristic 0 is a pair (r, N) with r: W_K → GL(D) of open kernel on I_K and N nilpotent with r(w)Nr(w)^{−1} = p^{α(w)}N, i.e. r(Φ)Nr(Φ)^{−1} = q_K·N for arithmetic Φ (Deligne 8.4.1, ArithmeticGaloisRepresentations:R01.2). Let V be de Rham. (a) For K'/K finite, WD(V|_{G_{K'}}) ≅ WD(V)|_{W_{K'}}. (b) For L/K finite, V|_{G_L} is semistable iff I_L acts trivially on WD(V), and crystalline iff moreover N = 0; in particular V is semistable iff WD(V)|_{I_K} is trivial, and potentially crystalline iff N = 0. (c) N is nilpotent on WD(V), and for an arithmetic Frobenius lift Φ, r(Φ) acts on D_τ as Φ̄∘φ^{−f_K}; in particular, when V is semistable (L = K), the characteristic polynomial of r(Φ) on WD(V) is that of the K_0 ⊗ E-linear map φ^{−f_K} on any factor D_τ of D_st(V). (d) Descent of the filtration: D_dR(V) = (L ⊗_{L_0} D_st,L(V))^{Gal(L/K)} as filtered K ⊗ E-modules, so the filtered (φ,N,Gal(L/K))-module D_st,L(V) determines V (with R06.2/colmez-fontaine-theorem: V ↦ D_st,L(V) is an equivalence from representations semistable over L to admissible filtered (φ,N,Gal(L/K))-modules).

*Hypotheses.* (d) relies on the Colmez–Fontaine theorem of R06.2 for essential surjectivity; full faithfulness holds without it (Fontaine–Ouyang Exercise 6.54).

*Proof outline.*

1. (a): choose L ⊃ K' with V|_{G_L} semistable; D_st,L(V) is the same object, with Gal(L/K') ⊂ Gal(L/K) and the same α(w) for w ∈ W_{K'}.
2. (b) ⇒: I_L acts trivially on D_st,L(V) by definition and α|_{I_L} = 0. ⇐: if I_{L'} acts trivially on WD(V) = WD(D_st,L(V)) with L ⊇ L', then Gal(L/L') acts on D_st,L(V) through its unramified quotient Gal(L_0/L'_0); Hilbert 90 for this semilinear action gives an L'_0-form of full rank, contained in D_st,L'(V) (B_st^{G_{L'}} = L'_0, R06.1/period-ring-invariants), so V|_{G_{L'}} is semistable. Crystalline: D_cris,L'(V) = D_st,L'(V)^{N=0}.
3. (c): Nφ = pφN (Brinon–Conrad Lemma 8.2.8: N nilpotent); r(Φ) = Φ̄φ^{−f} on each D_τ.
4. (d): Fontaine–Ouyang §6.5.2 comment (1) and Proposition 6.62; essential surjectivity from R06.2/colmez-fontaine-theorem.

*Acceptance.*

- V = E(ψ), ψ ramified of finite order: WD(V)|_{I_K} = ψ|_{I_K} is nontrivial, so V is not semistable over K but is over L = K̄^{ker ψ}.
- V = V_p(E_q) (Tate curve): I_K trivial, N ≠ 0: semistable, not potentially crystalline.

*Uses.* `PadicHodgeTheory:R06.3/weil-deligne-parameter`, `PadicHodgeTheory:R06.3/potentially-semistable-dieudonne-module`, `PadicHodgeTheory:R06.3/fontaine-weil-deligne-functor`, `PadicHodgeTheory:R06.1/period-ring-invariants`, `PadicHodgeTheory:R06.2/colmez-fontaine-theorem`, `PadicHodgeTheory:R06.2/admissible-representations`, `PadicHodgeTheory:R06.2/filtered-phi-n-modules`.

*Sources.*

- Theory of p-adic Galois representations, Proposition 6.62, p. 143: “There is an equivalence of categories between de Rham representations of GK and admissible filtered (ϕ, N, GK )-modules over K” Descent and classification.
- Theory of p-adic Galois representations, §6.5.2, Comments about Theorem B (1), p. 143: “and hence DdR (V ) = (K 0 ⊗K00 D0 )J” Recovery of D_dR(V) by Galois descent.

#### Comparison. Comparison of Frobenius, monodromy, twist and determinant conventions with the ℓ-adic Weil–Deligne representations of R01.2

*Node* `PadicHodgeTheory:R06.3/convention-comparison-with-r01`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. For w in the Weil group W_K let α(w) ∈ Z be defined by: the image of w in Gal(k̄/F_p) is the α(w)-th power of the absolute arithmetic Frobenius x ↦ x^p (so α(W_K) = f_K·Z with q_K = p^{f_K}, and α(Φ) = f_K for an arithmetic Frobenius lift Φ). A Weil–Deligne representation over a field Ω of characteristic 0 is a pair (r, N) with r: W_K → GL(D) of open kernel on I_K and N nilpotent with r(w)Nr(w)^{−1} = p^{α(w)}N, i.e. r(Φ)Nr(Φ)^{−1} = q_K·N for arithmetic Φ (Deligne 8.4.1, ArithmeticGaloisRepresentations:R01.2). Let V be a de Rham E-linear representation of G_K and ω: W_K → Q^× the unramified character with ω(Φ) = q_K for arithmetic Φ (ω(w) = p^{α(w)}). (1) Frobenius and monodromy: the relation Nφ = pφN on D_st,L(V) becomes r(Φ)Nr(Φ)^{−1} = q_K·N for arithmetic Φ and r(F)Nr(F)^{−1} = q_K^{−1}·N for geometric F = Φ^{−1}; this is exactly Deligne's relation ρ'(w)Nρ'(w)^{−1} = q^{v'(w)}N with v' counting powers of the arithmetic Frobenius, used by ArithmeticGaloisRepresentations:R01.2 for ℓ ≠ p. (2) Twists: WD(V(n)) ≅ WD(V) ⊗ ω^n, and ω = WD(Q_p(1)) is also the ℓ-adic Weil–Deligne representation of Q_ℓ(1) (ℓ ≠ p). (3) Determinant: det WD(V) ≅ WD(det V); for a de Rham character η = χ^h·η_0 with η_0 of finite order on I_K (h its Hodge–Tate weight), WD(η) = ω^h·η_0|_{W_K} = η|_{W_K}·(ω/χ)^h|_{W_K}; hence det WD(V) = (det V)|_{W_K}·(ω/χ)^{h_1+…+h_d}|_{W_K}, where h_1, …, h_d are the Hodge–Tate weights. For ℓ ≠ p the corresponding correction is trivial because χ_ℓ|_{W_K} = ω. (4) Eigenvalues: if V is crystalline over K, the characteristic polynomial of r(Φ) is that of φ^{−f_K} on D_cris(V) (on any factor D_τ), i.e. its roots are the inverses of the eigenvalues of φ^{f_K}; for K = Q_p and φ with characteristic polynomial X² − (a/p)X + 1/p it is X² − aX + p.

*Hypotheses.* Arithmetic Frobenius normalisation throughout, as prescribed by the R01.2 stage ('With arithmetic Frobenius the relation is r(F)Nr(F)^{−1} = qN'). Hodge–Tate weights with HT(χ_p) = +1 (PadicHodgeTheory:R06.2/hodge-tate-weight-convention).

*Proof outline.*

1. (1): PadicHodgeTheory:R06.3/fontaine-weil-deligne-functor gives r(w)Nr(w)^{−1} = p^{α(w)}N; α(Φ) = f_K; Deligne's convention is recorded in ArithmeticGaloisRepresentations:R01.2/grothendieck-monodromy-and-the-weil-deligne-functor (v'(w) is read as the power of the arithmetic Frobenius φ: x ↦ x^q, and F = φ^{−1} is geometric).
2. (2): D_st,L(V(n)) = D_st,L(V) ⊗ D_cris(Q_p(n)), and φ = p^{−n} on D_cris(Q_p(n)) = K_0·t^{−n}e_n, so r(w) is multiplied by p^{nα(w)} = ω(w)^n (twist compatibility of Fontaine's functor). For ℓ ≠ p, arithmetic Frobenius acts on Q_ℓ(1) by q_K and I_K trivially, so its Weil–Deligne representation is ω.
3. (3): Fontaine's functor commutes with ∧^d (tensor compatibility); a de Rham character is χ^h·η_0 with η_0 finite on inertia (Tate–Sen, R06.2/hodge-tate-decomposition-tate); WD(η_0) = η_0|_{W_K} (period in K̄·K_0^nr, φ acting through the unramified part) and WD(χ^h) = ω^h by (2).
4. (4): PadicHodgeTheory:R06.3/weil-deligne-descent (c) and linear algebra: if φ has characteristic polynomial X² − (a/p)X + 1/p then φ^{−1} has X² − aX + p (eigenvalues inverted).

*Acceptance.*

- For V_p(E), E/Q_p with good reduction, D_cris(V_p(E)) is dual to H¹_cris(E) (Frobenius characteristic polynomial X² − a_pX + p; the comparison is the R06.6 target), so r(Frob_p) has characteristic polynomial X² − a_pX + p, that of the arithmetic Frobenius on V_ℓ(E); PARI/GP for 11a1 at p = 3, 5, 7, 13: charpoly(φ^{−1}) = X² − a_pX + p.
- PARI/GP: WD(Q_p(1))(Φ) = φ^{−f} = p^{f} = q_K for (p, f) = (5,1), (5,2), (3,3).
- Tate curve (PadicHodgeTheory:R06.3/tate-curve-weil-deligne-example): r(Φ)Nr(Φ)^{−1} = pN with the arithmetic Frobenius and = p^{−1}N with the geometric one, matching the ℓ-adic Tate curve.

*Uses.* `PadicHodgeTheory:R06.3/fontaine-weil-deligne-functor`, `PadicHodgeTheory:R06.3/weil-deligne-parameter`, `PadicHodgeTheory:R06.3/weil-deligne-descent`, `ArithmeticGaloisRepresentations:R01.2/grothendieck-monodromy-and-the-weil-deligne-functor`, `ArithmeticGaloisRepresentations:R01.2`, `PadicHodgeTheory:R06.2/hodge-tate-decomposition-tate`, `PadicHodgeTheory:R06.1/fontaine-element-t`.

*Sources.*

- First steps towards p-adic Langlands functoriality, §4, p. 14: “the unique integer such that the image of w in Gal(Fp /Fp ) is the α(w)-th power of the absolute arithmetic Frobenius” Arithmetic normalisation of α.
- Deformations of polarized automorphic Galois representations and adjoint Selmer groups, §1.1.1, p. 8: “such that r(w)N r(w)−1 = |w|N for all w ∈ WK” Relation with |w| = |Art_K^{−1}(w)|, i.e. q_K for arithmetic Frobenius under Allen's normalisation of Art_K.
- CMI Summer School notes on p-adic Hodge theory, §8.2, p. 112: “In other words, Nϕ = qϕN.” ℓ-adic model computation with the geometric Frobenius ϕ = ρ(g̃_π): ϕNϕ^{−1} = q^{−1}N, motivating Nφ = pφN.
- Deformations of polarized automorphic Galois representations and adjoint Selmer groups, §1.1.6, p. 9: “Note that WD(D(1)) = WD(D)(1).” Twist compatibility.

#### Application. Frobenius normalisation check on the Tate curve's filtered (φ,N)-module

*Node* `PadicHodgeTheory:R06.3/tate-curve-weil-deligne-example`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. For w in the Weil group W_K let α(w) ∈ Z be defined by: the image of w in Gal(k̄/F_p) is the α(w)-th power of the absolute arithmetic Frobenius x ↦ x^p (so α(W_K) = f_K·Z with q_K = p^{f_K}, and α(Φ) = f_K for an arithmetic Frobenius lift Φ). A Weil–Deligne representation over a field Ω of characteristic 0 is a pair (r, N) with r: W_K → GL(D) of open kernel on I_K and N nilpotent with r(w)Nr(w)^{−1} = p^{α(w)}N, i.e. r(Φ)Nr(Φ)^{−1} = q_K·N for arithmetic Φ (Deligne 8.4.1, ArithmeticGaloisRepresentations:R01.2). Let K = Q_p, q ∈ pZ_p∖{0} and D_q the filtered (φ,N)-module over Q_p with basis x, y, φ(x) = p^{−1}x, φ(y) = y, N(x) = 0, N(y) = v_p(q)·x (N normalised as −d/dlog[p^♭]), Fil^{−1} = D_q, Fil^0 = Q_p(y + log_p(q)x) (log_p(p) = 0), Fil^1 = 0 — the module attached to the Tate curve E_q in Berger's survey (its identification with D_st(V_p(E_q)) is the R06.6 target). Then D_q is weakly admissible, and WD(D_q) is given in the basis (x, y) by r(Φ) = diag(p, 1) for the arithmetic Frobenius Φ, r trivial on I_{Q_p}, N = (0 v_p(q); 0 0), with r(Φ)Nr(Φ)^{−1} = p·N. This agrees with the ℓ-adic Weil–Deligne representation of V_ℓ(E_q) (ℓ ≠ p): arithmetic Frobenius eigenvalue p on the line Q_ℓ(1) = ker N and 1 on the quotient, N ≠ 0, isomorphic after scaling N. For a non-split multiplicative curve (twist by the unramified quadratic character) r(Φ) = −diag(p, 1).

*Hypotheses.* The Tate curve and the identification D_st(V_p(E_q)) = D_q belong to R06.6; here D_q is taken as given in Berger's survey II.4.3 to test the normalisation of the recipe.

*Proof outline.*

1. Weak admissibility (R06.2/weak-admissibility): t_H(D_q) = −1 (jumps −1 and 0) = v_p(det φ) = t_N(D_q); the only (φ,N)-stable line is Q_p x (N(y) ≠ 0), with t_H(Q_px) = −1 (x ∉ Fil^0) and t_N(Q_px) = −1.
2. Nφ = pφN: N(φ(y)) = N(y) = v x and pφ(N(y)) = pv·p^{−1}x = v x; both sides vanish on x.
3. Fontaine's recipe with K = L = Q_p (α(Φ) = 1): r(Φ) = φ^{−1} = diag(p, 1); r(Φ)Nr(Φ)^{−1}(y) = r(Φ)N(y) = v·p x = p·N(y).
4. ℓ-adic side (ArithmeticGaloisRepresentations:R01.2): V_ℓ(E_q) is a non-split extension 0 → Q_ℓ(1) → V_ℓ(E_q) → Q_ℓ → 0 with inertia acting unipotently through the Kummer class of q; its Weil–Deligne representation has arithmetic Frobenius eigenvalues p (on Q_ℓ(1)) and 1, N ≠ 0 mapping the quotient line to Q_ℓ(1) (Fontaine–Ouyang §1.3.1, proof of Theorem 1.26, and §1.3.2).
5. The two are isomorphic as Weil–Deligne representations since (r, N) ≅ (r, aN) (R01.2 request).

*Acceptance.*

- PARI/GP for 11a1 at p = 11 (split multiplicative, a_11 = 1): v_11(q) = 5 = v_11(Δ); with φ = diag(1/11, 1), N = (0 5; 0 0): Nφ = 11φN, r = φ^{−1}, rNr^{−1} = 11N, charpoly(r) = X² − 12X + 11 = (X − 11)(X − a_11); t_N(D) = t_N(Q_p x) = −1.
- PARI/GP for 15a1 at p = 3 (non-split, a_3 = −1): v_3(q) = 4, φ = −diag(1/3, 1), N = (0 4; 0 0), rNr^{−1} = 3N, charpoly(r) = (X + 3)(X + 1).
- With the geometric Frobenius F = Φ^{−1}: r(F)Nr(F)^{−1} = p^{−1}N (PARI/GP), the relation of Brinon–Conrad §8.2.

*Uses.* `PadicHodgeTheory:R06.3/weil-deligne-parameter`, `PadicHodgeTheory:R06.3/fontaine-weil-deligne-functor`, `PadicHodgeTheory:R06.3/convention-comparison-with-r01`, `PadicHodgeTheory:R06.2/weak-admissibility`, `PadicHodgeTheory:R06.2/filtered-phi-n-modules`, `ArithmeticGaloisRepresentations:R01.2/grothendieck-monodromy-and-the-weil-deligne-functor`, `ArithmeticGaloisRepresentations:R01.2`.

*Sources.*

- An introduction to the theory of p-adic representations, II.4.3, p. 18: “the action of Frobenius on Dst (V ) is therefore given by ϕ(x) = p−1 x and ϕ(y) = y” Frobenius on D_st of the Tate curve.
- An introduction to the theory of p-adic representations, II.4.3, p. 18: “so that u − logp (q (0) ) is divisible by t” Filtration Fil^0 D_dR = Q_p(y + log_p(q)x).
- An introduction to the theory of p-adic representations, II.4.3, p. 18: “As a consequence, one can write u = vp (q)Y +” N(u) = −v_p(q) for N = −d/dY, whence N(y) = v_p(q)x.
- Theory of p-adic Galois representations, §1.3.1, proof of Theorem 1.26, p. 13: “The action of GK on the left Q` (1) of the above exact sequence is trivial, since it comes from the action of unramified extensions.” ℓ-adic Tate curve extension.

#### Lemma. Trivial inertia and zero monodromy do not predetermine the Frobenius eigenvalues

*Node* `PadicHodgeTheory:R06.3/hodge-and-inertial-type-do-not-determine-frobenius`.

Throughout: p is a prime, K a finite extension of Q_p with residue field k, K_0 = W(k)[1/p], K_n = K(μ_{p^n}), K_∞ = ∪K_n, H_K = Gal(K̄/K_∞), Γ_K = G_K/H_K identified with an open subgroup of Z_p^× by χ, F'_K = K_∞ ∩ K_0^nr (the maximal unramified extension of K_0 in K_∞), r_n = p^{n−1}(p−1), n(r) the least n with r ≤ r_n, π = [ε] − 1 ∈ A_inf, q = φ(π)/π, π̄ = ε − 1 ∈ O_{C^♭}, t = log(1+π) = log[ε]. For w in the Weil group W_K let α(w) ∈ Z be defined by: the image of w in Gal(k̄/F_p) is the α(w)-th power of the absolute arithmetic Frobenius x ↦ x^p (so α(W_K) = f_K·Z with q_K = p^{f_K}, and α(Φ) = f_K for an arithmetic Frobenius lift Φ). A Weil–Deligne representation over a field Ω of characteristic 0 is a pair (r, N) with r: W_K → GL(D) of open kernel on I_K and N nilpotent with r(w)Nr(w)^{−1} = p^{α(w)}N, i.e. r(Φ)Nr(Φ)^{−1} = q_K·N for arithmetic Φ (Deligne 8.4.1, ArithmeticGaloisRepresentations:R01.2). (1) For every h ∈ Z and λ ∈ O_E^×, the crystalline character η = χ^h·ψ_λ (ψ_λ unramified, ψ_λ(Φ) = λ) has Hodge type {h}, trivial inertial type, N = 0 and WD(η)(Φ) = λ·q_K^h. (2) For K = Q_p, the characteristic polynomials of r(Frob_p) on WD(V), V running over the two-dimensional crystalline representations with Hodge–Tate weights {0,1} (so trivial inertial type and N = 0), are exactly the monic f = X² + aX + b ∈ Z_p[X] with v_p(b) = 1. In particular Hodge type, inertial type and N do not determine the pair of Frobenius eigenvalues.

*Hypotheses.* (2) uses the contravariant classification of Brinon–Conrad (Theorem 8.3.6, Proposition 8.3.4 for split sums) together with Colmez–Fontaine (R06.2); r(Frob_p) = φ^{−1} on D_cris(V) has the same eigenvalues as φ on D*_cris(V) = D_cris(V)^∨.

*Proof outline.*

1. (1): WD(ψ_λ) = ψ_λ|_{W_K} (PadicHodgeTheory:R06.3/weil-deligne-parameter test) and WD(χ^h) = ω^h (PadicHodgeTheory:R06.3/convention-comparison-with-r01 (2)).
2. (2): Brinon–Conrad Theorem 8.3.6: non-split two-dimensional crystalline V of G_{Q_p} with weights {0, r} correspond to f ∈ Z_p[X] with ord_p f(0) = r, f the characteristic polynomial of φ on D*_cris(V); split ones are ψ ⊕ ψ'(r) with f = (X − λ_1)(X − λ_2), λ_1 ∈ Z_p^×, λ_2 ∈ p^rZ_p^×.
3. D_cris(V) = D*_cris(V)^∨ with φ_{D_cris} = ((φ_{D*})^{−1})^∨, so r(Frob_p) = φ_{D_cris}^{−1} has characteristic polynomial f (PadicHodgeTheory:R06.3/convention-comparison-with-r01 (4)).

*Acceptance.*

- f = X² − a_pX + p for V_p(E), E/Q_p good reduction: ordinary (p ∤ a_p, slopes 0 and 1) and supersingular (a_p = 0 for p ≥ 5, slopes 1/2, 1/2) both occur (PARI/GP: y² = x³ − x at p = 5, 13 ordinary and p = 3, 7 supersingular).

*Uses.* `PadicHodgeTheory:R06.3/weil-deligne-parameter`, `PadicHodgeTheory:R06.3/convention-comparison-with-r01`, `PadicHodgeTheory:R06.2/colmez-fontaine-theorem`, `PadicHodgeTheory:R06.2/weak-admissibility`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Theorem 8.3.6, p. 120: “is naturally parameterized by the set of quadratic polynomials f (X) = X 2 + aX + b ∈ Zp [X] with ordp (b) = r” Parametrisation by the Frobenius characteristic polynomial.
- An introduction to the theory of p-adic representations, II.3.2, p. 14: “If on the other hand, an elliptic curve E has good supersingular reduction, then the operator ϕ : Dcris (V ) → Dcris (V ) is irreducible” Same Hodge polygon, different Newton polygons.

### What is missing

- Coverage status: `partial`. Berger 2002's proof of the p-adic monodromy theorem is decomposed step by step (§§1.2, 2, 3.1–3.2, 4.1–4.2, 5.1–5.5), with Crew's conjecture imported by id from RD.2 and the (φ,Γ)/overconvergence inputs requested from PG.0–PG.2; Fontaine's Weil–Deligne recipe, its independence, descent and the convention comparison with R01.2 are nodes, with the Tate-curve normalisation check. The Robba-ring steps of that proof (the extended rings and the maps iota_n, Frobenius regularisation, decompletion, the D_cris/D_st dictionary, the connection nabla_V and the unipotence criterion, Sen and D_dif modules) are planned once, in P7, and cited here; this needs the stage link P7 -> R06.3.
- PG.0–PG.2 requests (field of norms, Cherbonnier–Colmez overconvergence, ι_n(B†,r_n_K) ⊂ K_n[[t]], R_k on B̃†_F, Tate–Sen formalism) have no packet yet; the chains stop at those stages.
- R01.2 request (Weil–Deligne representation category and the rescaling lemma (r,N) ≅ (r,aN)) has no packet yet.
- Berger 2002 §2.5 (Lemme 2.27–Proposition 2.30: H_K-invariants of B̃†_rig) read at statement level only; (B̃†_rig)^{H_K} = B̃†_rig,K is taken with the PG.0 request.
- Colmez's alternative proof of the monodromy theorem (Fontaine–Ouyang §7.3 sketch; Colmez 2003) is not decomposed.
- Gaps listed under 'Independence of the embedding …' and 'RD.2 export …'.
- **Gap: Independence of the embedding and of L in Fontaine's recipe: Breuil–Mézard §2.2.1 not read.** Breuil–Schneider and Allen cite Breuil–Mézard (Duke 2002) Lemma 2.2.1.2 and §2.2.1, and Breuil–Schneider leave 'the final details' of Proposition 4.1 to the reader; Fontaine's Astérisque 223 paper is not public. The packet gives complete proofs (φ: D_τ ≅ D_{τσ^{−1}} with N ↦ p^{−1}N, plus (r,N) ≅ (r,aN)), resting on the R01.2 request for the rescaling lemma. NEXT ACTION: none for the statements; compare with Breuil–Mézard when a copy is available. Needed by `PadicHodgeTheory:R06.3/weil-deligne-independence-of-choices`, `PadicHodgeTheory:R06.3/fontaine-weil-deligne-functor`.
- **Gap: RD.2 export states the solution-space dimension over L ∩ F^nr instead of the constant field F'_L.** PadicDifferentialEquationsAndRigidCohomology:RD.2/berger-form-of-local-monodromy (K/Q_p finite) says (M ⊗ B†_log,L)^{∂=0} has dimension rank M over L ∩ F^nr; the constants of B†_log,L are F'_L = L_∞ ∩ K_0^nr, which can be larger (K = Q_3(√−6): K(ζ_3) ∋ √2, checked in PARI/GP). Berger's p. 58 statement assumes k algebraically closed, where both agree. The monodromy node reads the export as 'dimension rank M over F'_L' and enlarges L so that F'_L = L_0. NEXT ACTION: the lead reconciles the wording with the RD packet (statement change: 'over F'_L = L_∞ ∩ F^nr'). Needed by `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`.
- **Request to `PhiGammaModulesAndIwasawaCohomology:PG.0`.** For K/Q_p finite: the field of norms E_K of K_∞/K and the cyclotomic rings A_K, B_K, A†,r_K, B†,r_K, B†_K with the element π_K (π_F = π = [ε] − 1 for K = K_0), φ(π) = (1+π)^p − 1, γ(π) = (1+π)^{χ(γ)} − 1 and commuting φ, Γ_K; B†,r_K free of rank [K_∞ : F_∞] over B†,r_F for r ≫ 0 and an identification of B†,r_K with bounded Laurent series in π_K with coefficients in F'_K = K_∞ ∩ K_0^nr; functoriality in finite extensions L/K (B†_L finite étale over B†_K); the embeddings B†,r_K ⊂ (B̃†,r)^{H_K} and (B̃)^{H_K} = B̃_K, (B̃†)^{H_K} = B̃†_K. Needed by `PadicHodgeTheory:P7/extended-robba-ring-with-galois-action`, `PadicHodgeTheory:P7/decompletion-operators`, `PadicHodgeTheory:P7/theta-iota-surjective-onto-Kn`, `PadicHodgeTheory:P7/nabla-operator-on-robba-ring`, `PadicHodgeTheory:P7/antiderivatives-on-log-robba-ring`, `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`.
- **Request to `PhiGammaModulesAndIwasawaCohomology:PG.2`.** Cherbonnier–Colmez overconvergence: D†(V) = (B† ⊗ V)^{H_K} with B_K ⊗ D†(V) = D(V); for r ≥ r(V), D†,r(V) is free over B†,r_K with a basis that is a B_K-basis of D(V), Γ_K acting continuously; D†(V|_{G_L}) = B†_L ⊗ D†(V) for L/K finite; for n ≥ n(K), ι_n = φ^{−n} maps B†,r_n_K into K_n[[t]] ⊂ B_dR^+ (Cherbonnier–Colmez 1999); the decompletion maps R_k on B̃†_F (Cherbonnier–Colmez 1998, III.2); and the Tate–Sen formalism (normalised traces, conditions (TS1)–(TS3), Brinon–Conrad §14) for (C, K_∞) and B_dR^+ used by Sen's theory and D_dif. Needed by `PadicHodgeTheory:P7/extended-robba-ring-with-galois-action`, `PadicHodgeTheory:P7/extended-localisation-maps`, `PadicHodgeTheory:P7/decompletion-operators`, `PadicHodgeTheory:P7/theta-iota-kernel`, `PadicHodgeTheory:P7/berger-dcris-dst-dictionary`, `PadicHodgeTheory:P7/connection-on-robba-realisation`, `PadicHodgeTheory:P7/sen-module`, `PadicHodgeTheory:P7/fontaine-dif-module`, `PadicHodgeTheory:P7/ddr-via-robba-realisation`, `PadicHodgeTheory:P7/berger-comparison-isomorphisms`, `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`.
- **Request to `ArithmeticGaloisRepresentations:R01.2`.** Weil–Deligne representations (r, N) of W_K over a field Ω of characteristic 0 in the arithmetic normalisation r(w)Nr(w)^{−1} = q^{v'(w)}N (Deligne 8.4.1), with morphisms, ⊗, duals, determinant, the twist by the unramified character ω (ω(arithmetic Frobenius) = q), Frobenius-semisimplification and restriction to I_K (inertial type); the lemma (r, N) ≅ (r, aN) for a ∈ Ω^× (Deligne, proof of Lemme 8.4.3); and the ℓ-adic Weil–Deligne representations of Q_ℓ(1) and of V_ℓ(E_q) for a Tate curve (ArithmeticGaloisRepresentations:R01.2/grothendieck-monodromy-and-the-weil-deligne-functor, whose acceptance asks for this Tate-curve check). Needed by `PadicHodgeTheory:R06.3/fontaine-weil-deligne-functor`, `PadicHodgeTheory:R06.3/weil-deligne-parameter`, `PadicHodgeTheory:R06.3/weil-deligne-independence-of-choices`, `PadicHodgeTheory:R06.3/convention-comparison-with-r01`, `PadicHodgeTheory:R06.3/tate-curve-weil-deligne-example`.

## R06.4 Integral and small-weight interface

The rational consequences of Fontaine–Laffaille at $e = 1$:

- Theorem 8.4 (i) and (ii), and full faithfulness on $[0, p-2]$, with the §0.9/§6 endpoint restrictions kept as hypotheses, and an endpoint non-example;
- the sign dictionary between Fontaine–Laffaille's contravariant conventions and $\mathrm{HT}(\chi_p) = +1$;
- ordinary representations, "ordinary ⇒ semistable" and the two-dimensional ordinarity criteria;
- the $p = 2$ and weight $p$, $p+1$ branches, stated, with their integral inputs requested from R07.4.

The definition of Hodge–Tate weights itself is in R06.2.

### Objects

#### Definition. Ordinary p-adic representations (Perrin-Riou)

*Module* `TauCeti/PadicHodge/SmallWeight/Ordinary.lean`. *Node* `PadicHodgeTheory:R06.4/ordinary-representation`.

Let K/Q_p be finite and E/Q_p finite. An E-linear representation V of G_K is ordinary if it has a decreasing, exhaustive, separated filtration (Fil^iV)_{i∈Z} by G_K-stable E-subspaces such that the inertia group I_K acts on gr^iV = Fil^iV/Fil^{i+1}V through χ^i (i.e. gr^iV(−i) is unramified). The filtration is part of the data required to exist; its jumps are the Hodge–Tate weights of V (PadicHodgeTheory:R06.4/ordinary-implies-semistable), with sub-objects of higher weight: Fil^iV is the part of weight ≥ i.

*Hypotheses.* Convention HT(χ_p) = +1: gr^i carries Hodge–Tate weight i, and higher weights sit lower in the flag (sub-objects). Berger 2002 §6 (after Perrin-Riou [37, 1.1]) states the definition for an arbitrary perfect residue field; here K/Q_p is finite.

*API.*

- `IsOrdinary` (*constructor*) — ∃ decreasing exhaustive separated G_K-stable filtration with I_K acting on gr^i through χ^i.
- `IsOrdinary.subquotient` (*functoriality*) — Subrepresentations and quotients of ordinary representations are ordinary (induced filtrations).
- `IsOrdinary.dual` (*functoriality*) — V ordinary ⇒ V^* ordinary with Fil^i(V^*) = (Fil^{1−i}V)^⊥.
- `IsOrdinary.tensor` (*functoriality*) — V, W ordinary ⇒ V ⊗ W ordinary with Fil^n = Σ_{i+j=n} Fil^iV ⊗ Fil^jW.
- `IsOrdinary.hodgeTateWeights` (*characterisation*) — HT(V) = {i with multiplicity dim gr^iV} (via PadicHodgeTheory:R06.4/ordinary-implies-semistable).

*Used by.*

- Berger 2002, Corollaire 6.3 — ordinary representations are semistable
- `LocalGaloisDeformationRings:L7` — ordinary deformation functors with a full invariant flag
- Khare–Wintenberger (I), Theorem 5.1(2) — weight-2 lifts with inertial WD parameter (id, N ≠ 0) at k(ρ̄) = p + 1 are ordinary (PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion)

*Unit tests.* A wrong definition fails one of these.

- `isOrdinary_tate_twist` (computation) — Q_p(n) is ordinary with the one-step filtration at n.
- `isOrdinary_unramified` (degenerate) — Every unramified representation is ordinary with Fil^0 = V, Fil^1 = 0.
- `not_isOrdinary_supersingular` (non-example) — V_p(E) for E/Q_p with good supersingular reduction is not ordinary: it is irreducible with weights {0,1} (Brinon–Conrad Theorem 8.3.6, no unit Frobenius root).
- `not_isOrdinary_wrong_order` (non-example) — A non-split extension 0 → Q_p → V → Q_p(1) → 0 (Hodge–Tate, not de Rham) is not ordinary: the weight-0 line is the sub-object.
- `isOrdinary_cyclotomicCharacter` (compatibility) — The character given by Mathlib's cyclotomicCharacter is ordinary with gr^1 = V (I_K acts by χ).

*Construction.*

1. Definition; the unramified characters are those trivial on I_K (Mathlib ValuationSubring.inertiaSubgroup gives the inertia subgroup of a decomposition group).
2. Stability: subquotients by G_K-stable subspaces inherit ordinary filtrations (induced filtrations); duals are ordinary with Fil^i(V^*) = (Fil^{1−i}V)^⊥ and weights negated; tensor products are ordinary with the tensor filtration.

*Acceptance.*

- Q_p(n) is ordinary with Fil^nQ_p(n) = Q_p(n), Fil^{n+1} = 0.
- V_p(E) for E/Q_p with good ordinary or multiplicative reduction is ordinary: Fil^1 = the Q_p(1)-part up to an unramified twist, gr^0 unramified.

*Uses.* `mathlib:cyclotomicCharacter`, `mathlib:ValuationSubring.inertiaSubgroup`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`.

*Planet:* Ordinary representations.

*Sources.*

- Représentations p-adiques et équations différentielles, Proof of Corollaire 6.3, p. 63: “telle que le groupe d’inertie IK agit sur Fili V / Fili+1 V par χi” Definition used by Berger (after Perrin-Riou).
- CMI Summer School notes on p-adic Hodge theory, Theorem 8.3.6, p. 121: “is an extension of the unramified character ψµ associated to µ by the r-fold Tate twist χr ψµ′” Ordinary two-dimensional crystalline representations.

### Lemmas, theorems and comparisons

#### Theorem. Fontaine–Laffaille's rational functor is the dual of V_cris on weakly admissible modules with jumps in [0, p−1]

*Node* `PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison`.

Let K = K_0 = W(k)[1/p] be absolutely unramified (e = 1), σ its Frobenius. A filtered φ-module D over K is weakly admissible in the sense of R06.2/weak-admissibility; its jumps are the i with gr^i D ≠ 0. For Fontaine–Laffaille (FL) objects we use the notation of FL 1982: MF_tor^{f,p} (finite-length W(k)-modules M with M^0 = M, M^p = 0 and φ^i: M^i → M), strongly divisible lattices (FL 7.7), the ring Ŝ and Ŝ_K = K ⊗ Ŝ, and the contravariant functors U_S(M) = Hom_{MF}(M, Ŝ) (lattices), U_S(M) = Ext^1(M, S) (torsion) and U_{S_K}(Δ) = Hom_{MF_K}(Δ, Ŝ_K) (rational), all supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3. Let MF^{wa,[0,p−1]}_K be the category of weakly admissible filtered φ-modules D over K with Fil^0 D = D and Fil^p D = 0. For D in it there is a natural G_K-equivariant isomorphism U_{S_K}(D) = Hom_{φ,Fil}(D, Ŝ_K) ≅ Hom_{φ,Fil}(D, B_cris) = V_cris(D)^* (FL: U_{S_K} ≅ V_B^* on MF^{f,p}_K). In particular D is admissible, D ≅ D*_cris(U_{S_K}(D)); U_{S_K} is exact and fully faithful on MF^{wa,[0,p−1]}_K, with quasi-inverse on its essential image U ↦ Hom_{Q_p[G_K]}(U, Ŝ_K) = D*_cris(U), and U_{S_K}(D) is crystalline with Hodge–Tate weights the jumps of D (in [0, p−1]).

*Hypotheses.* FL's 'B-admissible' refers to the Barsotti–Tate ring B of Fontaine (Annals 1982, [F2]); FL call B-admissible representations 'cristallines'. The identification with B_cris-admissibility (R06.2) and FL's use of [F2] §4 (Ŝ_K ≅ B_a^+) are recorded as a gap; the proof steps below give a replacement argument through A_cris. K = K_0 (e = 1); p arbitrary (no p ≠ 2 hypothesis in FL 8.4).

*Proof outline.*

1. FL (proof of 8.4): Ŝ_K is identified, as a filtered Galois ring, with B_a^+ of [F2] §4 (a = {x ∈ R : v_R(x) ≥ p}); Hom_{MF_K}(D, B_a^+) ⊂ Hom_{MF_K}(D, B) = V_B(D) and (V^* ⊗ B_a^+)^G ⊂ D_B(V^*).
2. Replacement via A_cris (R06.1/crystalline-period-ring; R07.3 for Ŝ): Ŝ is the p-adic completion of W(R)[ξ^p/p] ⊂ A_cris (ξ^p/p = (p−1)!·γ_p(ξ)), with Fil^iŜ_K = Ŝ_K ∩ Fil^iB_dR (to be checked against FL §2, R07.3); φ(B_max^+) ⊂ Ŝ[1/p] because φ(ξ)/p ≡ ξ^p/p mod W(R).
3. Since D = φ(D) and Fil^0 D = D, any φ-compatible f: D → B_cris with f(D) ⊂ Fil^0 B_cris lands in B'_cris = {x : φ^n(x) ∈ Fil^0 ∀ n} and hence in φ(B'_cris) ⊂ B_cris^+ ⊂ B_max^+, so f(D) = φ(f(φ^{−1}D)) ⊂ φ(B_max^+) ⊂ Ŝ_K: Hom_{φ,Fil}(D, Ŝ_K) = Hom_{φ,Fil}(D, B_cris) = V_cris(D)^* (Berger survey II.3.4 for B'_cris).
4. Dimension: dim_{Q_p} U_{S_K}(D) = dim_K D (FL Proposition 7.17(i), via a strongly divisible lattice, FL Proposition 7.8; R07.3) and the evaluation map D → Hom(U_{S_K}(D), Ŝ_K) is injective (FL 7.17(ii)); hence dim D*_cris(U_{S_K}(D)) ≥ dim D, U_{S_K}(D) is crystalline and D ≅ D*_cris(U_{S_K}(D)) (R06.2/admissible-representations).
5. Full faithfulness and the quasi-inverse: FL Remarques 7.18(a) and 8.5; exactness from exactness of V_cris on admissible modules (R06.2).

*Acceptance.*

- D = K·e, φ(e) = p^n e, jump at n (0 ≤ n ≤ p − 1): U_{S_K}(D) = Q_p(n).
- D with jumps {0, p−1} (modular weight p) is covered; D with jumps {0, p} (modular weight p + 1) is not (Fil^p D ≠ 0).

*Uses.* `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`, `PadicHodgeTheory:R06.1/crystalline-period-ring`, `PadicHodgeTheory:R06.1/de-rham-period-ring`, `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.2/admissible-representations`, `PadicHodgeTheory:R06.2/weak-admissibility`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`.

*Sources.*

- Construction de représentations p-adiques, 8.4 Théorème (ii) and its proof, pp. 595–596 (checked on the page images): “On voit que la K-algèbre Ŝ_K s'identifie, en tant qu'« anneau galoisien filtré » à l'anneau noté B⁺_a dans [F 2], § 4.” FL's proof via [F2] (not read).
- Construction de représentations p-adiques, 7.18 Remarques (a), p. 594 (checked on the page image): “On verra au paragraphe 8 (remarques 8.5 et 8.13 a) que U_S_K est pleinement fidèle” Full faithfulness of the rational functor.
- An introduction to the theory of p-adic representations, II.3.4, p. 15: “then ϕ(B′cris ) ⊂ B+” φ(B'_cris) ⊂ B_cris^+, used in the replacement argument.

#### Lemma. Sign and covariance dictionary between Fontaine–Laffaille filtration indices and Hodge–Tate weights

*Node* `PadicHodgeTheory:R06.4/fontaine-laffaille-sign-dictionary`.

Let K = K_0 = W(k)[1/p] be absolutely unramified (e = 1), σ its Frobenius. A filtered φ-module D over K is weakly admissible in the sense of R06.2/weak-admissibility; its jumps are the i with gr^i D ≠ 0. For Fontaine–Laffaille (FL) objects we use the notation of FL 1982: MF_tor^{f,p} (finite-length W(k)-modules M with M^0 = M, M^p = 0 and φ^i: M^i → M), strongly divisible lattices (FL 7.7), the ring Ŝ and Ŝ_K = K ⊗ Ŝ, and the contravariant functors U_S(M) = Hom_{MF}(M, Ŝ) (lattices), U_S(M) = Ext^1(M, S) (torsion) and U_{S_K}(Δ) = Hom_{MF_K}(Δ, Ŝ_K) (rational), all supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3. Let D be a weakly admissible filtered φ-module over K with jumps in [a, b], and V := V_cris(D) the crystalline representation with D_cris(V) = D (covariant; R06.2). Then: (1) HT(V) = {−i : gr^iD ≠ 0} ⊂ [−b, −a]; (2) FL's contravariant U_{S_K}(D) ≅ V^* has HT(U_{S_K}(D)) = {i : gr^iD ≠ 0} ⊂ [a, b], with multiplicities dim gr^i D; (3) for a strongly divisible lattice M with jumps in [0, p−2], the contravariant lattice U_S(M) has HT weights in [0, p−2] (FL index i ↔ weight +i), and the covariant lattice U_S(M)^∨ = Hom_{Z_p}(U_S(M), Z_p) ⊂ V_cris(M[1/p]) has HT weights in [−(p−2), 0] (index i ↔ weight −i); (4) common Tate shift: if V has HT weights in [c, c + p − 2], then V(−c) has HT weights in [0, p − 2] and its contravariant module D*_cris(V(−c)) = D_cris(V(−c))^∨ has FL indices in [0, p − 2]; so every statement for the interval [0, p − 2] applies to [c, c + p − 2] after the twist T ↦ T(−c), which lowers every FL index of the contravariant module by c; (5) on rank one: U_S(M(1; n)) ≅ F_p(ω^n) (ω the mod p cyclotomic character) for 0 ≤ n ≤ p − 1, consistent with (2): Hodge–Tate weight n ↔ ω^n.

*Hypotheses.* FL work with contravariant functors throughout (U_S, U_{S_K}, V_B^*); this node fixes the translation used by every R06.4 statement.

*Proof outline.*

1. (1): D_dR(V) = D_K (K = K_0) with its filtration, and HT weights are the negatives of the jumps (PadicHodgeTheory:R06.2/hodge-tate-weight-convention).
2. (2): U_{S_K}(D) ≅ V_B(D)^* = V^* (PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison) and HT(V^*) = −HT(V).
3. (3): U_S(M)[1/p] = U_{S_K}(M[1/p]) (FL 7.14–7.17, R07.3) and (2); duals negate weights.
4. (4): D_cris(V(−c)) = D_cris(V) ⊗ D_cris(Q_p(−c)) and D_cris(Q_p(−c)) has its jump at c, so the jumps of D_cris move from [−c−p+2, −c] to [−(p−2), 0]; dualising gives FL indices in [0, p−2].
5. (5): FL Théorème 5.3(iii) with h = 1 (R07.3): G acts on U_S(M(1; i_0)) by χ_1^{i_0}, χ_1 = ω for E = Q_p.

*Acceptance.*

- D = D_cris(Q_p(−n)) = K e, φ(e) = p^n e, jump at n: V_cris(D) = Q_p(−n) (weight −n) and U_{S_K}(D) = Q_p(n) (weight +n).
- PARI/GP: for p = 3, 5, 7, 11 the characters ω^n, 0 ≤ n ≤ p − 2, are pairwise distinct and ω^{p−1} = ω^0.

*Uses.* `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`, `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.2/colmez-fontaine-theorem`, `PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison`.

*Sources.*

- Construction de représentations p-adiques, 8.4 Théorème (ii), p. 595 (checked on the page image): “Soit V*_B : MF_K,B → Rep^f(G) le foncteur contravariant qui à D associe le dual de V_B(D). Le foncteur U_S_K et la restriction de V*_B à MF^f,p_K sont naturellement équivalents.” U_{S_K} is the dual of the covariant V_B = V_cris.
- Construction de représentations p-adiques, 0.8 Théorème (iii), p. 551 (checked on the page image): “on a gu = χ_h(g)^{i_0+qi_1+...+q^{h−1}i_{h−1}}.u” Inertia on U_S(M(h; i)): index i ↦ character χ_h^{i}.
- CMI Summer School notes on p-adic Hodge theory, §8.3, p. 119: “has nonzero gr precisely for i = r (rather than i = −r)” Contravariant D* sends Q_p(r) to jump r.

#### Theorem. Fontaine–Laffaille: weakly admissible filtered φ-modules of filtration length < p over K_0 are admissible

*Node* `PadicHodgeTheory:R06.4/small-weight-admissibility`.

Let K = K_0 = W(k)[1/p] be absolutely unramified (e = 1), σ its Frobenius. A filtered φ-module D over K is weakly admissible in the sense of R06.2/weak-admissibility; its jumps are the i with gr^i D ≠ 0. For Fontaine–Laffaille (FL) objects we use the notation of FL 1982: MF_tor^{f,p} (finite-length W(k)-modules M with M^0 = M, M^p = 0 and φ^i: M^i → M), strongly divisible lattices (FL 7.7), the ring Ŝ and Ŝ_K = K ⊗ Ŝ, and the contravariant functors U_S(M) = Hom_{MF}(M, Ŝ) (lattices), U_S(M) = Ext^1(M, S) (torsion) and U_{S_K}(Δ) = Hom_{MF_K}(Δ, Ŝ_K) (rational), all supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3. If D is a weakly admissible filtered φ-module over K = K_0 and there is j ∈ Z with Fil^j D = D and Fil^{j+p} D = 0 (filtration length < p), then D is admissible: D ≅ D_cris(V) for the crystalline representation V = V_cris(D), whose Hodge–Tate weights lie in [−j−p+1, −j] (convention HT(χ_p) = +1). In particular every crystalline representation of G_{K_0} whose Hodge–Tate weights lie in an interval of length ≤ p − 1 corresponds to such D, and conversely.

*Hypotheses.* e = 1 (K = K_0); no restriction on p. This is a special case of the Colmez–Fontaine theorem (R06.2/colmez-fontaine-theorem) but FL's proof is independent of it and predates it.

*Proof outline.*

1. Twist: choose a rank-one weakly admissible D_2 with its jump at j (e.g. D_cris(Q_p(−j))) and write D = D_1 ⊗ D_2 with D_1 weakly admissible, Fil^0 D_1 = D_1, Fil^p D_1 = 0 (FL proof of 8.4; weak admissibility is stable under ⊗ with rank one objects, R06.2/weak-admissibility).
2. D_1 is admissible by PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison (U_{S_K}(D_1) crystalline of dimension dim D_1 with D*_cris = D_1).
3. Rank-one weakly admissible objects are admissible (Fontaine [F1] 4.4.1 via FL; R06.2), and admissible objects are stable under ⊗ (R06.2/admissible-representations), so D = D_1 ⊗ D_2 is admissible.
4. Weights: PadicHodgeTheory:R06.4/fontaine-laffaille-sign-dictionary (1).

*Acceptance.*

- D_cris(Q_p(n)) for every n (length 0).
- D = D_cris(V_p(E)) for E/Q_p with good reduction: jumps {−1, 0}, length 1 < p for every p.
- Modular weight p: jumps {0, p − 1} (length p − 1 < p) — covered; modular weight p + 1: jumps {0, p} — not covered (needs R06.2/colmez-fontaine-theorem or Breuil–Kisin, PadicHodgeTheory:R06.4/weight-p-plus-one-branch).

*Uses.* `PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison`, `PadicHodgeTheory:R06.4/fontaine-laffaille-sign-dictionary`, `PadicHodgeTheory:R06.2/weak-admissibility`, `PadicHodgeTheory:R06.2/admissible-representations`, `PadicHodgeTheory:R06.2/colmez-fontaine-theorem`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`.

*Planet:* Fontaine–Laffaille admissibility theorem.

*Sources.*

- Construction de représentations p-adiques, 0.1 Théorème, p. 548 (checked on the page image): “Supposons e=1 (i.e. K=K₀). Si D est un module de Dieudonné filtré faiblement admissible, dont la longueur de la filtration est <p” Statement.
- Construction de représentations p-adiques, 8.4 Théorème (i), p. 595 (checked on the page image): “Si D est un objet de MF^f_K tel qu'il existe un entier j vérifiant D^j = D et D^{j+p} = 0, alors D est B-admissible.” Precise form.

#### Lemma. Non-example at the endpoint p−1: collision of M(1; 0) and M(1; p−1)

*Node* `PadicHodgeTheory:R06.4/fontaine-laffaille-endpoint-non-example`.

Let K = K_0 = W(k)[1/p] be absolutely unramified (e = 1), σ its Frobenius. A filtered φ-module D over K is weakly admissible in the sense of R06.2/weak-admissibility; its jumps are the i with gr^i D ≠ 0. For Fontaine–Laffaille (FL) objects we use the notation of FL 1982: MF_tor^{f,p} (finite-length W(k)-modules M with M^0 = M, M^p = 0 and φ^i: M^i → M), strongly divisible lattices (FL 7.7), the ring Ŝ and Ŝ_K = K ⊗ Ŝ, and the contravariant functors U_S(M) = Hom_{MF}(M, Ŝ) (lattices), U_S(M) = Ext^1(M, S) (torsion) and U_{S_K}(Δ) = Hom_{MF_K}(Δ, Ŝ_K) (rational), all supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3. For every prime p, let M(1; 0) and M(1; p−1) be the simple objects of MF_tor^{f,p} of rank one over k with jump 0, resp. p − 1 (FL §0.7). Then U_S(M(1; 0)) ≅ U_S(M(1; p−1)) ≅ F_p with trivial G_K-action, but Hom_{MF}(M(1; 0), M(1; p−1)) = 0 = Hom_{MF}(M(1; p−1), M(1; 0)); so U_S is not full on MF_tor^{f,p}. Rationally/integrally: Z_p (weight 0) and Z_p(p−1) (weight p−1) are lattices in the non-isomorphic crystalline characters Q_p and Q_p(p−1) with isomorphic reductions F_p = F_p(ω^{p−1}). At weight p (jumps {0, p}), Fontaine–Laffaille theory does not apply at all (Fil^p ≠ 0) and the Breuil–Kisin branch is needed (PadicHodgeTheory:R06.4/weight-p-plus-one-branch).

*Hypotheses.* This is the only failure (FL §0.9: 'Mais c'est le seul ennui'); it is why the unrestricted torsion interval is [0, p−2].

*Proof outline.*

1. U_S on rank-one simple objects: FL Théorème 5.3(iii) with h = 1 gives the character ω^{i_0}; ω^{p−1} = 1 (PARI/GP; Mathlib ZMod.units_pow_card_sub_one_eq_one).
2. No map M(1; 0) → M(1; p−1): on M(1; p−1) (killed by p) φ^0 = p^{p−1}φ^{p−1} = 0, while φ^0 is bijective on M(1; 0); compatibility f∘φ^0 = φ^0∘f forces f = 0.
3. No map M(1; p−1) → M(1; 0): f must map Fil^{p−1}M(1; p−1) = M(1; p−1) into Fil^{p−1}M(1; 0) = 0.
4. Hence U_S is not full; FL §0.9 identifies exactly this collision.

*Acceptance.*

- PARI/GP: ω^{p−1}(γ) = ω^0(γ) = 1 for p = 3, 5, 7, 11 while ω^0, …, ω^{p−2} are distinct.
- Hom_{G}(Z_p, Z_p(p−1)) = 0 but Hom_G(F_p, F_p(ω^{p−1})) = F_p.

*Uses.* `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`, `PadicHodgeTheory:R06.4/fontaine-laffaille-sign-dictionary`, `mathlib:ZMod.units_pow_card_sub_one_eq_one`.

*Source.* Construction de représentations p-adiques, 0.9, p. 551 (checked on the page image): “Il n'est pas vrai que le foncteur U_S : MF^{f,q}_tor → Rep^f_O(G) est pleinement fidèle : on a U_S(M(1; 0)) ≃ U_S(M(1; q−1)) ≃ F_q, avec action triviale de G” The collision.

#### Theorem. Rational and lattice consequences of Fontaine–Laffaille theory at e = 1 on the shifted interval [0, p−2]

*Node* `PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences`.

Let K = K_0 = W(k)[1/p] be absolutely unramified (e = 1), σ its Frobenius. A filtered φ-module D over K is weakly admissible in the sense of R06.2/weak-admissibility; its jumps are the i with gr^i D ≠ 0. For Fontaine–Laffaille (FL) objects we use the notation of FL 1982: MF_tor^{f,p} (finite-length W(k)-modules M with M^0 = M, M^p = 0 and φ^i: M^i → M), strongly divisible lattices (FL 7.7), the ring Ŝ and Ŝ_K = K ⊗ Ŝ, and the contravariant functors U_S(M) = Hom_{MF}(M, Ŝ) (lattices), U_S(M) = Ext^1(M, S) (torsion) and U_{S_K}(Δ) = Hom_{MF_K}(Δ, Ŝ_K) (rational), all supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3. Let MF^{sd,[0,p−2]} be the category of strongly divisible lattices M (FL 7.7) with Fil^0 M = M and Fil^{p−1} M = 0, and T(M) := U_S(M) (contravariant). Then: (a) T(M) is a G_K-stable Z_p-lattice in the crystalline representation U_{S_K}(M[1/p]) = V_cris(M[1/p])^*, whose Hodge–Tate weights are the jumps of M (in [0, p−2]); (b) T is exact, faithful, rank-preserving and fully faithful: Hom_{Z_p[G_K]}(T(M), T(M')) = Hom(M', M); (c) for every n ≥ 1, T(M)/p^n ≅ U_S(M/p^nM) with M/p^nM ∈ MF_tor^{f,p} having jumps in [0, p−2], and U_S is fully faithful on such torsion objects; in particular Hom_{G_K}(T(M)/p^n, T(M')/p^n) = Hom_{MF}(M'/p^n, M/p^n); (d) the same statements hold on any common shifted interval [c, c + p − 2] after the Tate twist of PadicHodgeTheory:R06.4/fontaine-laffaille-sign-dictionary (4); (e) on the wider interval [0, p − 1] (Fil^p M = 0), (a) holds and T is exact, faithful and rank-preserving, but (b)–(c) hold only for M whose reduction M/pM has no nonzero quotient N with N^{p−1} = N (resp. no nonzero subobject N with N^1 = 0) — the restrictions of FL §0.9/§6 — and fail in general (PadicHodgeTheory:R06.4/fontaine-laffaille-endpoint-non-example); (f) rationally, U_{S_K} is fully faithful on all of [0, p − 1] with no restriction. For p = 2 the interval [0, p − 2] is {0}: only unramified representations are covered by (b)–(c).

*Hypotheses.* K = K_0; the integral classification (strongly divisible lattices, MF_tor^{f,p}, U_S, FL Theorems 3.3, 6.1 and Propositions 7.8, 7.15, 7.17) is imported from FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3. Essential surjectivity onto all G_K-stable lattices of crystalline representations with weights in [0, p−2] is not asserted here (FL do not state it; FL Remarque 6.13(a) notes the essential image is hard to characterise); it is requested from R07.3/R07.4.

*Proof outline.*

1. (a): FL Proposition 7.15(i) (rank preservation) and 7.14 (U_S(M) = lim U_S(M/p^n), a lattice), with U_S(M)[1/p] = U_{S_K}(M[1/p]) (FL 7.16–7.17) identified with V_cris^* by PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison; weights by PadicHodgeTheory:R06.4/fontaine-laffaille-sign-dictionary.
2. (b): Fil^{p−1}M = 0 forces M/pM ∈ MF_tor^{f,p'} (a quotient N with N^{p−1} = N is a quotient of the zero module Fil^{p−1}, hence 0), so FL Proposition 7.15(ii) gives full faithfulness (R07.3).
3. (c): FL Théorème 3.3 (exactness, faithfulness, length) and Théorème 6.1(ii) on MF_tor^{f,p'} (R07.3), with U_S(M/p^nM) = Hom_{MF}(M, S_n) = T(M)/p^n (FL 7.14).
4. (d): twist; (e): FL §0.9, Théorème 6.1 and Proposition 7.15(ii); (f): FL Remarques 7.18(a), 8.5.

*Acceptance.*

- Q_p(n), 0 ≤ n ≤ p − 2: M = Z_p·e with Fil^n M = M, Fil^{n+1}M = 0, φ_n(e) = e; T(M) = Z_p(n) and T(M)/p = F_p(ω^n); the characters ω^0, …, ω^{p−2} are pairwise distinct, so no two such objects collide (PARI/GP for p = 3, 5, 7, 11).
- Tate module of an elliptic curve with good reduction over Q_p (p ≥ 3): Hodge–Tate weights {0, 1} ⊂ [0, p − 2], T_p(E) = U_S(M) for the strongly divisible lattice of the Dieudonné module of E[p^∞] (FL §9, R07.3); Hom_{G}(T_p(E)/p, T_p(E')/p) is computed by filtered Dieudonné modules.
- Non-example at weight p − 1: PadicHodgeTheory:R06.4/fontaine-laffaille-endpoint-non-example (Z_p and Z_p(p−1) have isomorphic reductions while the FL modules M(1;0), M(1;p−1) have no nonzero maps).

*Uses.* `PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison`, `PadicHodgeTheory:R06.4/fontaine-laffaille-sign-dictionary`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`, `PadicHodgeTheory:R06.4/fontaine-laffaille-endpoint-non-example`.

*Planet:* Fontaine–Laffaille rational consequences.

*Sources.*

- Construction de représentations p-adiques, 7.15 Proposition, pp. 593–594 (checked on the page images): “Le foncteur U_Ŝ est exact (en un sens évident) et fidèle et, pour tout objet M de MF^{fd,q}_{K/O}, rg_O U_Ŝ(M) = rg_A M.” Lattice functor: exact, faithful, rank-preserving.
- Construction de représentations p-adiques, 7.15 Proposition (ii), p. 594 (checked on the page image): “La restriction de U_Ŝ à la sous-catégorie pleine de MF^{fd,q}_{K/O} formée des M tels que M₁ = Coker π_M est un objet de MF^{f,q'}_tor (resp. de MF^{f,q''}_tor) est pleinement fidèle.” Full faithfulness on the restricted subcategories.
- Construction de représentations p-adiques, 0.10, p. 552 (checked on the page image): “« presque pleinement fidèle »” Only almost fully faithful on the full range.

#### Theorem. Extensions of semistable representations that are de Rham are semistable; ordinary representations are semistable

*Node* `PadicHodgeTheory:R06.4/ordinary-implies-semistable`.

Let K/Q_p be finite. (a) If E is a de Rham representation of G_K which is an extension of W by V with V, W semistable, then E is semistable. (b) If V is de Rham with all Hodge–Tate weights ≥ 1 (HT(χ_p) = +1), then every extension of Q_p by V is de Rham: H^1(K, V) = H^1_g(K, V). (c) Every ordinary representation of G_K is semistable (in particular de Rham), and its Hodge–Tate weights are the jumps of its ordinary filtration.

*Hypotheses.* Uses the p-adic monodromy theorem (R06.3); for finite residue field (c) was known (Perrin-Riou) by Galois-cohomological dimension counts, which Berger's argument avoids. Weights ≥ 1 in (b) is the convention HT(χ_p) = +1 (Berger's 'poids ⩾ 1'), e.g. V = Q_p(1).

*Proof outline.*

1. (a) Lemma 6.4: E is de Rham, hence potentially semistable (PadicHodgeTheory:R06.3/p-adic-monodromy-theorem); for L/K with E|_{G_L} semistable, 0 → D_st,L(V) → D_st,L(E) → D_st,L(W) → 0 is exact (R06.2), and taking Gal(L/K)-invariants, H^1(Gal(L/K), D_st,L(V)) = 0 (a Q_p-vector space, |Gal(L/K)| invertible) gives dim D_st(E) = dim V + dim W.
2. (b) Lemma 6.5: weights ≥ 1 give H^1(K, B_dR^+ ⊗ V) = 0 (Hodge–Tate decomposition of V ⊗ C(i), Tate's H^1(K, C(j)) = 0 for j ≠ 0 (R06.2/hodge-tate-decomposition-tate), and 0 → t^{i+1}B_dR^+ → t^iB_dR^+ → C(i) → 0); so 1 ∈ (B_dR^+)^{G_K} lifts to (B_dR^+ ⊗ E)^{G_K} outside (B_dR^+ ⊗ V)^{G_K}, and dim D_dR(E) = dim V + 1.
3. (c) Corollary 6.3: induction on the length of the ordinary filtration: E = V extension of gr^{i_min} (lowest weight, unramified twist of χ^{i_min}) by Fil^{i_min+1}V (weights > i_min); twisting by the inverse of the character on gr^{i_min} reduces to an extension of Q_p by a de Rham representation of weights ≥ 1, de Rham by (b); then (a) and induction give semistability.
4. Weights: gr^iV is χ^i times unramified, of Hodge–Tate weight i (PadicHodgeTheory:R06.2/hodge-tate-weight-convention).

*Acceptance.*

- V_p(E_q) (Tate curve): ordinary, semistable, not crystalline.
- Kummer extensions 0 → Q_p(1) → V → Q_p → 0 (Berger survey II.4.4): all semistable, crystalline iff the Kummer class lies in Q_p ⊗ Ô_K^×.

*Uses.* `PadicHodgeTheory:R06.4/ordinary-representation`, `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`, `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.2/admissible-representations`, `PadicHodgeTheory:R06.2/hodge-tate-decomposition-tate`, `PadicHodgeTheory:R06.1/de-rham-period-ring`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`, `PadicHodgeTheory:R06.1/tate-sen-theorem`.

*Planet:* Ordinary representations are semistable.

*Sources.*

- Représentations p-adiques et équations différentielles, Théorème 6.2, p. 62: “Si E est une représentation de de Rham, qui est une extension de W par V , où V et W sont semi-stables, alors E est semi-stable.” Statement (a).
- Représentations p-adiques et équations différentielles, Corollaire 6.3, p. 62: “Toute représentation ordinaire de GK est semi-stable.” Statement (c).
- Représentations p-adiques et équations différentielles, Lemme 6.5, p. 63: “Si V est une représentation de de Rham dont les poids de Hodge-Tate sont tous ⩾ 1, alors H 1 (K, V ) = Hg1 (K, V ).” Statement (b).

#### Theorem. Ordinarity criteria for two-dimensional crystalline and semistable representations of G_{Q_p}

*Node* `PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion`.

Let K = Q_p and V a two-dimensional p-adic representation of G_{Q_p} with Hodge–Tate weights {0, r}, r ≥ 1 (HT(χ_p) = +1). (a) If V is crystalline and not a direct sum of two characters, let f(X) = X² + aX + b ∈ Z_p[X] (v_p(b) = r) be the characteristic polynomial of r(Frob_p) on WD(V), equivalently of φ on D*_cris(V). Then V is reducible — equivalently ordinary, V ≅ (ψ'χ^r *; 0 ψ) with ψ, ψ' unramified — iff f has a root μ ∈ Z_p^×; then ψ(Frob_p) = μ and ψ'(Frob_p) = b/(p^rμ). If f has no unit root (e.g. f irreducible, or a double root), V is irreducible. (b) If V is semistable and not crystalline then r = 2m + 1 is odd, and V is reducible iff m = 0, i.e. r = 1; in that case V is ordinary, a non-split extension of an unramified character ψ by ψχ, with trivial inertial type and N ≠ 0 on WD(V). (c) In particular a two-dimensional semistable non-crystalline representation with Hodge–Tate weights {0, 1} (modular weight 2 with inertial Weil–Deligne parameter (id, N ≠ 0)) is ordinary.

*Hypotheses.* K = Q_p (φ is linear, eigenvalues are roots of a characteristic polynomial); the E-linear version follows by the same semilinear algebra over E (Brinon–Conrad's proof is written for Q_p coefficients). No non-split crystalline extension of ψ'χ^r by ψ exists for r ≥ 1: the weight can only drop up a Jordan–Hölder filtration (Brinon–Conrad after Theorem 8.3.6).

*Proof outline.*

1. By Colmez–Fontaine (R06.2/colmez-fontaine-theorem), V corresponds to a weakly admissible filtered (φ,N)-module over Q_p with jumps {0, r} (contravariant D*).
2. (a): Brinon–Conrad Theorem 8.3.6: the only non-trivial weakly admissible subobject is the φ-eigenline for a unit eigenvalue, when it exists; r(Frob_p) on WD(V) has the same characteristic polynomial as φ on D*_cris(V) (PadicHodgeTheory:R06.3/convention-comparison-with-r01 (4)).
3. (b): Brinon–Conrad Proposition 8.3.8: N ≠ 0 forces eigenvalues λ, pλ; ker N is the φ-stable line of the smaller slope m, and weak admissibility t_H(ker N) = 0 ≤ t_N = m, with equality exactly when m = 0.
4. Ordinarity: in the reducible cases the sub-object has weight r and the quotient weight 0, which is Berger's ordinary filtration (PadicHodgeTheory:R06.4/ordinary-representation).

*Acceptance.*

- V_p(E) for E/Q_p with good reduction: f = X² − a_pX + p; ordinary iff p ∤ a_p (PARI/GP: y² = x³ − x, p = 5, 13 ordinary; p = 3, 7 supersingular).
- V_p(E_q) (Tate curve, r = 1, m = 0): reducible, ordinary, N ≠ 0.
- Weight p + 1 (r = p): V ordinary iff f has a unit root; this is the ordinary branch of PadicHodgeTheory:R06.4/weight-p-plus-one-branch.

*Uses.* `PadicHodgeTheory:R06.2/colmez-fontaine-theorem`, `PadicHodgeTheory:R06.2/weak-admissibility`, `PadicHodgeTheory:R06.4/ordinary-representation`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`, `PadicHodgeTheory:R06.3/convention-comparison-with-r01`, `PadicHodgeTheory:R06.3/weil-deligne-parameter`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Theorem 8.3.6, p. 121: “tation Vcris (D) is reducible if and only if f has a unit root µ ∈ Z×” Crystalline criterion (a).
- CMI Summer School notes on p-adic Hodge theory, Proposition 8.3.8, p. 123: “The non-crystalline semistable 2-dimensional representations V of GQp with smallest Hodge-Tate weight equal to 0 are parameterized as follows” Semistable criterion (b).
- Serre's modularity conjecture (I), Theorem 5.1(2), p. 9: “it is of the form (id, N ) with N a non-zero nilpotent matrix” The weight-2 semistable lifts used at k(ρ̄) = p + 1.

#### Theorem. Crystalline criterion in weight 2 for every p (including p = 2): Hodge–Tate weights {0,1} ⇔ p-divisible group

*Node* `PadicHodgeTheory:R06.4/barsotti-tate-crystalline-criterion`.

Let K/Q_p be finite (any ramification) and p any prime, including p = 2. (a) A p-adic representation V of G_K is crystalline with Hodge–Tate weights in {0, 1} (HT(χ_p) = +1) iff V ≅ V_p(G) = Q_p ⊗ T_p(G) for a p-divisible group G over O_K. (b) V is potentially Barsotti–Tate (V|_{G_L} ≅ V_p(G) for some finite L/K and G over O_L) iff V is de Rham with Hodge–Tate weights in {0, 1} and N = 0 on WD(V) (potentially crystalline). (c) For e = 1 and p ≥ 3, (a) and its lattice version are also given by Fontaine–Laffaille ([0, 1] ⊂ [0, p − 2]); for p = 2, or for e > 1, the Fontaine–Laffaille range does not reach weight 1 and (a) rests on the Breuil–Kisin classification (Breuil and Kisin for p > 2; Kisin for connected groups and Kim, Lau, Liu for all groups at p = 2).

*Hypotheses.* The integral classification (G ↦ T_p(G) is an equivalence onto G_K-stable lattices in crystalline representations with weights in {0,1}) is FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4's; this node states the rational criterion in the HT(χ_p) = +1 convention and its potentially crystalline form. Weights {0,1} in our convention: V_p(G) has det with weight dim G.

*Proof outline.*

1. (a) ⇐: V_p(G) is crystalline with weights in {0,1} (Fontaine; imported with the R07.4 request). ⇒: R07.4 (Breuil–Kisin: Kisin modules of height ≤ 1, including p = 2).
2. (b): by PadicHodgeTheory:R06.3/weil-deligne-descent (b), N = 0 iff V|_{G_L} is crystalline for some L; apply (a) over L; conversely V_p(G) over L is crystalline over L, so V is de Rham with N = 0.
3. (c): PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences with [0,1] ⊂ [0, p−2] for p ≥ 3 and FL §9 (finite flat groups ↔ MF_tor^{f,2}, R07.3); at p = 2, [0, p−2] = {0}.

*Acceptance.*

- V_p(E) for E/K with good reduction: crystalline with weights {0, 1}, G = E[p^∞].
- Q_p(1) = V_p(μ_{p^∞}); Q_p = V_p(Q_p/Z_p).
- V_p(E_q) (Tate curve): weights {0,1} but N ≠ 0, so not potentially Barsotti–Tate.

*Uses.* `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`, `PadicHodgeTheory:R06.3/weil-deligne-descent`, `PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`.

*Sources.*

- Serre's modularity conjecture (I), §9, Remark, p. 18: “Breuil (in case p 6= 2) and Kisin have proved that, if K is a finite extension of Qp , a crystalline representation of GK with Hodge-Tate weights 0 and 1 arises from a p-divisible group” Statement (a) as used in Khare–Wintenberger (the '6=' is the text layer's rendering of ≠).
- CMI Summer School notes on p-adic Hodge theory, Part III, introduction, p. 155: “The aim of Part III is to explain the more recent theory of integral p-adic Hodge theory, largely due to Breuil and Kisin, that has no ramification or weight restrictions.” Breuil–Kisin branch beyond Fontaine–Laffaille.

#### Theorem. The endpoint branch: Hodge–Tate weights in [0, p−1] (modular weight p)

*Node* `PadicHodgeTheory:R06.4/weight-p-endpoint-branch`.

Let K = K_0 = W(k)[1/p] be absolutely unramified (e = 1), σ its Frobenius. A filtered φ-module D over K is weakly admissible in the sense of R06.2/weak-admissibility; its jumps are the i with gr^i D ≠ 0. For Fontaine–Laffaille (FL) objects we use the notation of FL 1982: MF_tor^{f,p} (finite-length W(k)-modules M with M^0 = M, M^p = 0 and φ^i: M^i → M), strongly divisible lattices (FL 7.7), the ring Ŝ and Ŝ_K = K ⊗ Ŝ, and the contravariant functors U_S(M) = Hom_{MF}(M, Ŝ) (lattices), U_S(M) = Ext^1(M, S) (torsion) and U_{S_K}(Δ) = Hom_{MF_K}(Δ, Ŝ_K) (rational), all supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3. Let p ≥ 3 and V a crystalline representation of G_K (K = K_0) with Hodge–Tate weights in [0, p − 1] (e.g. modular weight k = p: weights {0, p − 1}). (a) Rationally V is covered by Fontaine–Laffaille: V = U_{S_K}(D) = V_cris(D)^* for D = D*_cris(V) with jumps in [0, p−1] (PadicHodgeTheory:R06.4/small-weight-admissibility, PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison), and U_{S_K} is fully faithful there. (b) On strongly divisible lattices with jumps in [0, p − 1], U_S is exact, faithful and rank-preserving, and fully faithful exactly on those M with M/pM in MF_tor^{f,p'} (no nonzero quotient N = N^{p−1}) or in MF_tor^{f,p''} (no nonzero subobject N with N^1 = 0); unrestricted full faithfulness fails (PadicHodgeTheory:R06.4/fontaine-laffaille-endpoint-non-example). (c) The integral statements needed beyond (b) — lattices whose reduction has both a trivial-weight and a weight-(p−1) constituent, and the reductions used in Khare–Wintenberger I Theorem 4.1 at k = p — are supplied by the Breuil–Kisin classification of FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4, not by Fontaine–Laffaille.

*Hypotheses.* p ≥ 3 (for p = 2, p − 1 = 1 and the weight-2 case is PadicHodgeTheory:R06.4/barsotti-tate-crystalline-criterion). The §0.9/§6 restrictions are imposed as hypotheses, never replaced by a change of notation.

*Proof outline.*

1. (a): nodes cited in the statement; the interval [0, p−1] has length p − 1 < p.
2. (b): FL Proposition 7.15 (R07.3) and the endpoint non-example.
3. (c): request to R07.4; the ordinary sub-case is decided by PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion.

*Acceptance.*

- Two-dimensional V with weights {0, p−1} over Q_p: V = V_cris(D)^* for D with jumps {0, p−1}, and V is ordinary iff the Frobenius polynomial has a unit root.
- Z_p and Z_p(p−1) have isomorphic reductions, so an extension of Z_p(p−1)/p by F_p may have several non-isomorphic FL models — the restricted categories exclude this.

*Uses.* `PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences`, `PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison`, `PadicHodgeTheory:R06.4/small-weight-admissibility`, `PadicHodgeTheory:R06.4/fontaine-laffaille-endpoint-non-example`, `PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

*Sources.*

- Construction de représentations p-adiques, 0.9 (i)–(ii), pp. 551–552 (checked on the page images): “MF^{f,q'}_tor la sous-catégorie pleine de MF^{f,q}_tor formée des M qui n'ont pas de quotient non trivial N tel que N^{q−1} = N” The restricted subcategory for the endpoint.
- Serre's modularity conjecture (I), §4, p. 7: “We also treat some new cases for k = p, k = p + 1 (see also [30]).” Endpoint weights in the modularity lifting theorem.

#### Theorem. The branch beyond Fontaine–Laffaille: Hodge–Tate weights {0, p} (modular weight p + 1)

*Node* `PadicHodgeTheory:R06.4/weight-p-plus-one-branch`.

Let p ≥ 3, K = Q_p and V a two-dimensional crystalline representation of G_{Q_p} with Hodge–Tate weights {0, p} (modular weight k = p + 1), E-coefficients. (a) Such V exist for every monic f ∈ Z_p[X] with v_p(f(0)) = p (f the characteristic polynomial of r(Frob_p) on WD(V)), and are admissible by Colmez–Fontaine (R06.2); Fontaine–Laffaille's Theorem 8.4 does not apply (filtration length p). (b) V is ordinary iff f has a unit root (PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion); in the ordinary case its lattices and reductions are extensions of unramified characters by unramified twists of χ^p. (c) In the non-ordinary case no Fontaine–Laffaille module describes the lattices; the integral theory (Kisin modules / Breuil modules) and the resulting reductions are supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4, and the endpoint calculations of Khare–Wintenberger I Theorem 4.1 are made in LocalGaloisDeformationRings:R08.5 using this interface. (d) At k(ρ̄) = p + 1 Khare–Wintenberger instead use a weight-2 lift which is semistable non-crystalline with inertial parameter (id, N ≠ 0); such lifts are ordinary by (c) of PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion.

*Hypotheses.* p ≥ 3; for p = 2 the corresponding statements are those of PadicHodgeTheory:R06.4/barsotti-tate-crystalline-criterion (k(ρ̄) = 2, 4 with weight-2 lifts).

*Proof outline.*

1. (a): Brinon–Conrad Theorem 8.3.6 with r = p and Proposition 8.3.4 for split sums; admissibility from R06.2/colmez-fontaine-theorem.
2. (b): PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion.
3. (c): request to R07.4 (integral theory beyond FL); (d): KW I Theorem 5.1(2) and PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion (c).

*Acceptance.*

- Non-example for Fontaine–Laffaille: D with jumps {0, p} has Fil^p D ≠ 0, so it is not an object of MF^{f,p}_K and U_{S_K} is not defined on it.
- Ordinary example: ψ'χ^p ⊕ ψ and its non-split crystalline extensions (unique up to isomorphism for given ψ, ψ', Brinon–Conrad after Theorem 8.3.6).

*Uses.* `PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion`, `PadicHodgeTheory:R06.2/colmez-fontaine-theorem`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`, `PadicHodgeTheory:R06.4/fontaine-laffaille-endpoint-non-example`.

*Sources.*

- Serre's modularity conjecture (I), Theorem 4.1 (2), p. 7: “is either (i) crystalline of weight k at p with 2 ≤ k ≤ p + 1, or (ii) potentially semistable at p of weight 2” Weights up to p + 1 in KW.
- CMI Summer School notes on p-adic Hodge theory, Theorem 8.3.6, p. 120: “The set of isomorphism classes of 2-dimensional crystalline representations V of GQp that have distinct Hodge-Tate weights {0, r} with r > 0” Existence for r = p.

### What is missing

- Coverage status: `partial`. The rational consequences of Fontaine–Laffaille (Theorem 8.4 (i), (ii) and the lattice statements on [0, p−2]), the HT(χ_p) = +1 dictionary, the §0.9/§6 endpoint restrictions and non-example, the p = 2 and weight p / p+1 branches (stated, with their integral inputs requested from R07.4) and the ordinary and crystalline criteria are nodes. The definition of Hodge-Tate weights with the convention HT(chi_p) = +1 is planned in R06.2 (R06.2/hodge-tate-weight-convention), where the period functors are; R06.4 keeps the sign dictionary for Fontaine-Laffaille and the other sources.
- R07.3 and R07.4 requests (integral Fontaine–Laffaille and Breuil–Kisin theory) have no packet yet.
- Gap: FL's proof of Theorem 8.4 via Fontaine's [F2] (Annals 1982) — replacement argument needs the check of FL's filtration on Ŝ against A_cris.
- Gap: essential image of the FL lattice functor.
- Reductions ρ̄ at modular weights p and p+1 (Khare–Wintenberger I Theorem 4.1) are LocalGaloisDeformationRings:R08.5 targets consuming this interface; not planned here.
- **Gap: Fontaine–Laffaille Theorem 8.4 rests on Fontaine's Barsotti–Tate ring [F2] (Annals 1982), not read.** FL prove 8.4 by identifying Ŝ_K with B_a^+ of [F2] §4 and using Hom_{MF}(D, B_a^+) ⊂ V_B(D) and (V* ⊗ B_a^+)^G ⊂ D_B(V*); 'B-admissible' is admissibility for [F2]'s ring. The packet replaces this by an argument through A_cris (Ŝ ⊂ A_cris, φ(B_max^+) ⊂ Ŝ[1/p], φ(B'_cris) ⊂ B_cris^+), which needs Fil^iŜ_K = Ŝ_K ∩ Fil^iB_dR for FL's filtration on Ŝ. NEXT ACTION: read FL §2.6–2.7 (definition of the filtration on S) against R06.1's A_cris filtration, or read [F2] §4 from a library copy; small-weight-admissibility itself also follows from R06.2/colmez-fontaine-theorem, so only the comparison U_{S_K} ≅ V_cris^* depends on this check. Needed by `PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison`, `PadicHodgeTheory:R06.4/small-weight-admissibility`.
- **Gap: Essential image of the Fontaine–Laffaille lattice functor.** FL do not prove that every G_K-stable lattice in a crystalline representation with Hodge–Tate weights in [0, p−2] is U_S of a strongly divisible lattice (FL Remarque 6.13(a) says the essential image is hard to characterise). Brinon–Conrad Theorem 12.4.8 states a version for weights {0,…,p−1} but its proof is marked incomplete in the notes. The packet does not assert it. NEXT ACTION: requested from R07.3/R07.4 with exact hypotheses. Needed by `PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences`, `PadicHodgeTheory:R06.4/weight-p-endpoint-branch`.
- **Request to `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`.** Fontaine–Laffaille integral theory at e = 1 (Fontaine–Laffaille 1982): the categories MF, MF_tor^{f,p} (abelian, artinian) and strongly divisible lattices MF^{fd,p} (FL 7.7, 7.12); the ring S, its completion Ŝ with filtration and divided Frobenii (FL §2) and the inclusion Ŝ ⊂ A_cris with Fil^iŜ_K = Ŝ_K ∩ Fil^iB_dR; the functors U_S (torsion: Ext^1(M, S); lattices: Hom(M, Ŝ)) and U_{S_K}; Théorème 3.3 (exact, faithful, length-preserving on MF_tor^{f,p}); the simple objects M(h; i) and Théorème 5.3 (tame inertia χ_h^{i_0 + p i_1 + …}); Théorème 6.1 (MF_tor^{f,p'} and MF_tor^{f,p''} stable under extensions and subquotients, U_S fully faithful on each) and the lemma that objects with M^{p−1} = 0 lie in MF_tor^{f,p'}; Propositions 7.8 (strongly divisible lattices exist iff weakly admissible), 7.14, 7.15 and 7.17; §9 (finite flat groups over W(k), p odd or unipotent, ↔ MF_tor^{f,2}, J(Ā) = U_S). If provable there: essential surjectivity of U_S onto all G_K-stable lattices of crystalline representations with Hodge–Tate weights in [0, p−2]. Needed by `PadicHodgeTheory:R06.4/fontaine-laffaille-sign-dictionary`, `PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison`, `PadicHodgeTheory:R06.4/small-weight-admissibility`, `PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences`, `PadicHodgeTheory:R06.4/fontaine-laffaille-endpoint-non-example`, `PadicHodgeTheory:R06.4/barsotti-tate-crystalline-criterion`, `PadicHodgeTheory:R06.4/weight-p-endpoint-branch`.
- **Request to `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.** Breuil–Kisin classification: (a) for every p including p = 2 and every finite K/Q_p, G ↦ T_p(G) is an equivalence from p-divisible groups over O_K to G_K-stable Z_p-lattices in crystalline representations with Hodge–Tate weights in {0, 1} (Breuil, Kisin; Kisin for connected groups and Kim, Lau, Liu for all groups at p = 2), with V_p(G) crystalline; (b) the integral theory beyond Fontaine–Laffaille needed for crystalline representations of G_{Q_p} with Hodge–Tate weights {0, p−1} (lattices with both weight-0 and weight-(p−1) constituents mod p) and {0, p} (modular weights p and p + 1): Kisin modules of the relevant height with the full faithfulness of restriction to G_{K_∞}, and the reductions used in Khare–Wintenberger I, Theorem 4.1 — each with its exact hypotheses on p, e and the weights. Needed by `PadicHodgeTheory:R06.4/barsotti-tate-crystalline-criterion`, `PadicHodgeTheory:R06.4/weight-p-endpoint-branch`, `PadicHodgeTheory:R06.4/weight-p-plus-one-branch`.

## Source issues

Each entry gives the printed text, the correction and the reason; the packet records the versions compared and the searches for earlier reports.

- **`PadicHodgeTheory/E1`** (error; Représentations p-adiques et équations différentielles, Section 2, p. 13 (and Proposition 1.4, p. 12; Proposition 2.31, p. 27), arXiv v3). Printed: “Les rappels du chapitre précédent montrent que l’application f 7→ f (πK ) de BF dans B†K est un isomorphisme.” Correction: The coefficients lie in F' = K_0', the maximal unramified extension of F contained in K_infinity, which can be larger than F. Reason: For p odd, y in Z_p^x a non-square mod p and K = Q_p(sqrt(y p*)), K is totally ramified over F = Q_p but K(zeta_p) contains sqrt(y), so ker(partial) on B^dagger_{rig,K} contains Q_p(sqrt y) (P7/robba-ring-of-p-adic-field, test robbaK.test_coefficients_Fprime). Affects: a stated result.
- **`PadicHodgeTheory/E2`** (error; Représentations p-adiques et équations différentielles, Introduction 0.3, p. 4-5, and Proposition 2.31, p. 27: alpha(K, r) = p^{-1/(e_K r)} with e_K = [K_infinity : F_infinity]). Printed: “(où e_K = [K∞ : F∞] et r_n = (p − 1)p^{n−1}) (rendered page 4-5; the text layer splits the superscripts)” Correction: In the radius alpha(K, r) = p^{-1/(e_K r)} of Propositions 1.4 and 2.31, e_K must be the ramification index of K_infinity/F_infinity (so [K_infinity : F_infinity] = e_K [F' : F]), as in Berger 2008 Section I.2; the two agree exactly when F' = F. Reason: pi is pi_K^{e} times a unit with e the ramification index of E_K/E_F, so the annulus p^{-1/r} <= |pi| < 1 corresponds to p^{-1/(e r)} <= |pi_K| < 1; with e replaced by e f (f = [F' : F] > 1) Proposition 2.31 would identify B^{dagger,r}_{rig,K} with functions on a strictly thinner annulus, which is false for fixed r (the union over r is unaffected). Affects: a stated result.
- **`PadicHodgeTheory/E3`** (error; Représentations p-adiques et équations différentielles, Section 2.4, p. 25 (and Section 1.2, p. 11): monodromy operator on B~^dagger_log). Printed: “c’est-à-dire que N = −d/d log(π).” Correction: To recover Fontaine's (phi, N)-module D_st (N = -d/du, u = log[p~]) one must take N(log(pi)) = -p/(p-1). Reason: v_E(epsilon - 1) = p/(p-1) = (p/(p-1)) v_E(p~), so log[epsilon - 1] = (p/(p-1)) log[p~] + (element of B~^+_rig) and Fontaine's N takes the value -p/(p-1) on it (P7/extended-localisation-maps, log_eq). Affects: a stated result.
- **`PadicHodgeTheory/E4`** (gap; Représentations p-adiques et équations différentielles, Proposition 2.24, p. 24). Printed: “Il existe une et une seule application log : Ã+ → B̃†rig[X] telle que log([x]) = log[x], log(p) = 0 et log(xy) = log(x) + log(y). (rendered page 24)” Correction: log is not defined at 0, and it is later used on A~^dagger (e.g. log(pi_K)); the extension to A~^dagger is needed (done by Colmez, Espaces vectoriels de dimension finie et représentations de de Rham). Reason: log(pi_K) appears in B^dagger_{log,K} = B^dagger_{rig,K}[log pi_K] (Proposition 4.4) while pi_K is not in A~^+. Affects: the proof.
- **`PadicHodgeTheory/E5`** (error; Représentations p-adiques et équations différentielles, Propositions 2.11 and 2.12, p. 17-19). Printed: “Proposition 2.11. L’application x 7→ ι0 (x) est un morphisme in-” Correction: The statements on A~_I hold only if [p~]/p - 1 (resp. [p~^{p^n}]/p - 1) belongs to A~_I; otherwise replace A~_I by B~_I. Reason: The kernel description uses the element [p~]/p - 1, which need not be integral on A~_I. Affects: a stated result.
- **`PadicHodgeTheory/E6`** (misprint; Représentations p-adiques et équations différentielles, Corollaire 2.20, p. 23). Printed: “Corollaire 2.20 (Principe du maximum).” Correction: The condition on r should be r <= s, t, i.e. [s; t] contained in [r; +infinity[. Reason: As printed ('I = [s; t] containing r') the interval need not lie in the domain of convergence. Affects: nothing.
- **`PadicHodgeTheory/E7`** (error; Représentations p-adiques et équations différentielles, Proof of Proposition 5.15, p. 54). Printed: “en effet, il suffit de vérifier que ιn (Ns ) = Kn [[t]] ⊗K DdR (V ), c’est” Correction: Only density of the image of iota_n for the t-adic topology holds, which is what the rest of the proof uses. Reason: As recorded by the author. Affects: the proof.
- **`PadicHodgeTheory/E8`** (misprint; Limites de représentations cristallines, Proof of Théorème III.4.4, p. 22 (author PDF)). Printed: “alors γ(x) − χ^{−j}(γ)x ∈ π^{j+1} B+rig,F ⊗B+F N(V) (rendered page 22; the pdftotext layer drops the superscripts)” Correction: gamma(x) - chi(gamma)^j x lies in pi^{j+1} B^+_{rig,F} tensor N(V). Reason: For x = pi^j y, gamma(pi) = chi(gamma) pi mod pi^2 and gamma acts trivially on N(V)/pi N(V), so gamma(x) = chi(gamma)^j x mod pi^{j+1}; this is also the exponent used in the proof of Proposition II.1.1 ('γ(π^s) − π^s = (χ(γ)^s − 1)π^s + ···') and in the author's 2026 errata for this theorem ('γ − χ(γ)^j'). The argument works with either sign. Affects: nothing.
- **`PadicHodgeTheory/E9`** (gap; Limites de représentations cristallines, Proof of Théorème III.4.4, last two lines, p. 22). Printed: “alors ϕ(y) ∈ q^i(B̃+rig ⊗Qp V) et donc y ∈ Fil^i Dcris(V). (rendered page 22)” Correction: One only has y in Fil^i N(V) + pi N(V) a priori; applying gamma - chi(gamma)^j for j = 1, ..., i-1 (gamma non-torsion) shows y in Fil^i N(V). Reason: The step identifying the preimage filtration is not justified as printed. Affects: the proof.
- **`PadicHodgeTheory/E10`** (gap; Limites de représentations cristallines, Définition III.4.1, p. 21). Printed: “alors un module de Wach à poids dans [a; b] est un” Correction: Over B^+_F (where p is a unit) one must add that B_F tensor_{B^+_F} N is an etale (phi, Gamma)-module over B_F. Reason: Without it the definition does not force N to come from a representation. Affects: a stated result.
- **`PadicHodgeTheory/E11`** (gap; Équations différentielles p-adiques et (φ,N)-modules filtrés, Théorème I.3.3 (2), p. 8). Printed: “(2) le B†,pr” Correction: Require that B^{dagger,pr}_{rig,K} tensor D_r is the B^{dagger,pr}_{rig,K}-module generated by phi(D_r), which gives Mat(phi) in GL_d(B^{dagger,pr}_{rig,K}) as used later. Reason: The weaker condition as printed does not give the invertibility used in the proof. Affects: the proof.
- **`PadicHodgeTheory/E12`** (error; p-adic Hodge theory for rigid-analytic varieties, Section 8, Proposition 8.5, p. 49 (author's version of 3 Nov 2012; the same text in arXiv:1205.3463v2)). Printed: “0 → B+dR,X ⊗_{f*proét B+dR,Y} f*proét OB+dR,Y → OB+dR,X → OB+dR,X ⊗OX Ω1X/Y → … is exact (an uncompleted tensor product in the first term)” Correction: The first term must be the completed tensor product B+dR,X ⊗̂_{f^{-1}B+dR,Y} f^{-1}OB+dR,Y (completion for the filtration; over the toric covers it is B+dR,X[[X_1, …, X_m]] in the base coordinates). With it the sequence is exact and strict exact. Reason: Take X = T² → Y = T¹. Over X̃_K, OB+dR,X = B+dR,X[[X_1, X_2]] and ∇_{X/Y} = ∂/∂X_2 ⊗ dT_2, whose kernel is B+dR,X[[X_1]]. The section Σ_k [T_2♭]^k X_1^k lies in this kernel, but every element of the image of the uncompleted tensor product has X_1-coefficients in a finitely generated f^{-1}B+dR,Y-submodule, while the θ-images T_2^k of the coefficients [T_2♭]^k are linearly independent over the functions pulled back from Y; so exactness fails at OB+dR,X. Affects: the proof.
- **`PadicHodgeTheory/E13`** (misprint; p-adic Hodge theory for rigid-analytic varieties, Section 7, proof of Theorem 7.6 (i), p. 43 (author's version; the same text in arXiv:1205.3463v2)). Printed: “Similarly, lemma 6.19 shows that” Correction: Similarly, Corollary 6.19 shows that Reason: There is no Lemma 6.19; the cited fact ν_*OB_dR = O_{X_ét} is Corollary 6.19. Affects: nothing.
- **`PadicHodgeTheory/E14`** (misprint; p-adic Hodge theory for rigid-analytic varieties, Section 6, Theorem 6.5, statement, p. 36 (author's version; the same text in arXiv:1205.3463v2)). Printed: “Assume that U → Xproét is affinoid perfectoid, with Û = Spa(R, R+).” Correction: Assume that U ∈ Xproét is affinoid perfectoid, with Û = Spa(R, R+). Reason: U is an object of the site, as in Lemma 4.10 ('Assume that U ∈ Xproét is affinoid perfectoid'); an arrow into a site is meaningless here. Affects: nothing.
- **`PadicHodgeTheory/E15`** (misprint; Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.2, proof of Lemma 2.18, p. 18 (arXiv:1510.05543v2)). Printed: “H^i(V, Fil^r Acris{⟨u_1, …, u_d⟩}/p^n) ≃ ⊕ H^i(V, Fil^{r−i_1−…−i_d} Acris/p^r)” Correction: … ≃ ⊕ H^i(V, Fil^{r−i_1−…−i_d} Acris/p^n) Reason: The reduction is modulo p^n throughout the proof; r is the filtration index. Affects: nothing.
- **`PadicHodgeTheory/E16`** (misprint; Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.2, proof of Corollary 2.17, p. 16 (arXiv:1510.05543v2)). Printed: “Fil^i OAcris|X̃ is the p-adic completion of Σ_{i_1, …, i_d ≥ 0} Fil^{i−(i_0+…+i_d)} Acris|X̃ u_1^{[i_1]} ⋯ u_d^{[i_d]}” Correction: Fil^{i−(i_1+…+i_d)} (there is no index i_0) Reason: The sum runs over i_1, …, i_d, and Definition 2.12 has Fil^{r−(i_1+…+i_d)}. Affects: nothing.
- **`PadicHodgeTheory/E17`** (gap; Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 2.4, proof of Proposition 2.23 (1), p. 22 (arXiv:1510.05543v2)). Printed: “To finish the proof of (1), we only need to show the morphism B+cris → B+dR constructed above is injective. This can be done in the same way as [Bri, Proposition 6.2.1], and we omit the detail here.” Correction: An argument for the injectivity of A_cris(R, R^+) → B_dR^+(R, R^+) for perfectoid (R, R^+) over the completion of k̄ is needed (see the gap entry of this packet). Reason: The injectivity is used for Corollaries 2.24-2.26 (no t-torsion, B_cris ⊂ B_dR, w_*OB_cris = O[1/p]); the cited proof is in Brinon's memoir for his rings, not for the pro-étale sheaf. Affects: the proof.
- **`PadicHodgeTheory/E18`** (misprint; Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case, Section 1, p. 3, and Section 3.2, p. 30 (arXiv:1510.05543v2)). Printed: “It follows from the Poincaré lemma (Proposition 2.17) … analogous assertion for OBcris (Proposition 2.17).” Correction: Corollary 2.17 Reason: The crystalline Poincaré lemma is numbered Corollary 2.17 on p. 16 and is cited as Corollary 2.17 on p. 36. Affects: nothing.
- **`PadicHodgeTheory/E19`** (gap; p-adic Hodge theory for rigid-analytic varieties, Section 6, proof of Corollary 6.19, p. 41 (author's version)). Printed: “Proof. The first part is clear.” Correction: ν_*OB_dR = O_{X_ét} needs an argument: the filtration of OB_dR is not complete, so one works with the complete filtrations of t^{-j}OB_dR^+ and the invariants of the degree-bounded polynomial pieces (node pushforward-of-structural-de-rham-sheaf). Reason: OB_dR is the union of the ker θ-complete t^{-j}OB_dR^+ but is not complete for Fil^•, so vanishing of ν_* on the graded pieces gr^i OB_dR (i ≠ 0) does not directly give ν_*Fil¹OB_dR = 0. Affects: the proof.
- **`PadicHodgeTheory/E20`** (misprint; CMI Summer School notes on p-adic Hodge theory, Example 8.1.3 (Katz), p. 104). Printed: “This matrix has characteristic polynomial X^2 − 4p, so its roots are ±2√p.” Correction: The characteristic polynomial of [[p − 1, (p + 1)i], [(p + 1)i, −(p − 1)]] (i^2 = −1) is X^2 + 4p, with roots ±2i√p = ±2√(−p). Reason: Trace 0 and determinant −(p − 1)^2 − (p + 1)^2i^2 = 4p; PARI charpoly for p = 3 gives x^2 + 12. The roots still have p-adic valuation 1/2, so the point of the example (eigenvalue valuations are not basis-invariant; slopes are 0 and 1) is unaffected. Affects: nothing.
- **`PadicHodgeTheory/E21`** (gap; CMI Summer School notes on p-adic Hodge theory, Lemma 8.1.8 and its footnote 1, p. 106). Printed: “Proof. By the definition of being isoclinic, we can assume k is algebraically closed and we need to exhibit a decomposition of ∆α1 ⊗ ∆α2 into a direct sum of copies of ∆α1 +α2 . [footnote: need to insert proof!]” Correction: Supply a proof: over k̄, Δ_{s/r} ⊗ Δ_{s'/r'} has φ^{rr'} acting on the eigenvectors v ⊗ v' with φ^r v = p^s v, φ^{r'} v' = p^{s'} v' by p^{sr' + s'r}, which spans; so it is isoclinic of slope s/r + s'/r'. Reason: The printed proof stops after the reduction, with the authors' footnote. The packet does not use the lemma: t_N(D ⊗ D') is computed with determinants (Fontaine–Ouyang Proposition 6.42). Affects: the proof.
- **`PadicHodgeTheory/E22`** (gap; CMI Summer School notes on p-adic Hodge theory, Theorem 9.1.8, p. 133). Printed: “Proof. Unfortunately, the proof was omitted from [21]. We do not know of a published reference. A proof will be included in the final version of these notes.” Correction: Injectivity of φ on A_cris is not needed for D_cris(V) and D_st(V) to be isocrystals: for admissible V the bijectivity of φ on D follows from the rank-one case of regularity (a period b of det V is a unit, so φ(b) ≠ 0) and B-C Exercise 7.4.10. Reason: B-C use Theorem 9.1.8 to make φ on D_cris(V) injective (§8 introduction); the packet replaces this use (R06.2/dcris-dst-filtered-phi-n-modules). Affects: the proof.
- **`PadicHodgeTheory/E23`** (gap; CMI Summer School notes on p-adic Hodge theory, §9.1, after display (9.1.2), p. 129; and Fontaine–Ouyang §6.1.1, Exercise 6.3, p. 114). Printed: “Rather more effort (which we omit) is required to prove that j is actually injective.” Correction: A proof of injectivity of A_cris → B_dR^+ is needed; everything identifying A_cris, B_cris with subrings of B_dR^+, B_dR depends on it. Reason: Neither source proves it: B-C omit it, and F-O leave A^0_cris → A_cris injective as an exercise and then write 'by continuity A_cris ⊂ B_dR^+'. Recorded as the packet gap 'Injectivity of A_cris → B_dR^+'. Affects: the proof.
- **`PadicHodgeTheory/E24`** (misprint; CMI Summer School notes on p-adic Hodge theory, Example 6.3.6, pp. 78–79). Printed: “such that V′ and V′′ are de Rham (hence Hodge–Tate) and the Hodge–Tate weights of V′ are all strictly larger than those of V′′ , the representation V is de Rham.” Correction: In B-C's own convention (§2.3: C_K(q) has Hodge–Tate weight −q, equal to the degrees of D_HT and the jumps of D_dR) the hypothesis must read: the Hodge–Tate weights of V′ are all strictly smaller than those of V′′. The printed inequality is correct in the opposite (contravariant, HT(χ) = +1) convention, which is the one the example and proof use. Reason: The example given is V′′ = Q_p, V′ = Q_p(r), r > 0, whose B-C weights are 0 and −r; and the proof arranges 'weights of V′ ≥ 1, those of V′′ ≤ 0' with D_dR(V′′) = (B_dR^+ ⊗ V′′)^{G_K} and C ⊗ V′ ≅ ⊕C(m_i), m_i ≥ 1, which requires the jumps of D_dR(V′′) ≥ 0 and B-C weights of V′ ≤ −1. Read literally in B-C's convention the statement would make every extension 0 → Q_p → V → Q_p(1) → 0 de Rham, contradicting B-C Example 6.3.5; the intended meaning is clear from the example and the proof (B-C mention the alternative contravariant convention at the end of §6.3's weight discussion). Affects: nothing.
- **`PadicHodgeTheory/E25`** (misprint; CMI Summer School notes on p-adic Hodge theory, Proof of Theorem 14.3.4, pp. 253–254 (with footnote 8)). Printed: “Moving on to degree 1, we first handle the case η = 1, and then we shall deduce the general case. That is, we first prove H1 (GK , CK ) = 0.” Correction: 'we first prove that H^1(G_K, C_K) is 1-dimensional over K' — which is what the following argument shows (H^1(G_K, C_K) ≅ Hom_cont(Z_p, K)). Reason: The statement being proved (Theorem 2.2.7) says H^1_cont(G_K, C_K) is 1-dimensional, and the paragraph concludes exactly that. The same proof carries the authors' footnote 'need to finish writing the argument' at the H^0 step, which is nevertheless complete as printed. Affects: nothing.
- **`PadicHodgeTheory/E26`** (gap; CMI Summer School notes on p-adic Hodge theory, Proposition 9.3.9 (Colmez–Fontaine), footnote 2, p. 151). Printed: “Should include proof of converse: if V st (D) is finite-dimensional then it is semistable using [14, Prop. 4.5], and if also δ(D) is surjective then D is weakly admissible (using proof of [14, Prop. 5.7]).” Correction: The converse is not proved in the notes (it needs Colmez–Fontaine's paper, not available). Reason: The packet uses only the proved direction (R06.2/colmez-fontaine-bigness-criterion) and records the converse as not planned. Affects: nothing.
- **`PadicHodgeTheory/E27`** (gap; CMI Summer School notes on p-adic Hodge theory, Theorem 9.1.5 and its proof, p. 131). Printed: “Unfortuntately, the proof of injectivity in [21, §4.1.2–4.1.3] is incomplete when e(K) > 1 since the generator ξpe of ker θ does not generate the kernel of the associated OK -algebra map” Correction: A complete proof of injectivity of K ⊗_{K_0} B_cris → B_dR is needed; the packet derives it from Colmez 2002 Proposition 8.14 (K ⊗_{K_0} B_max^+ ↪ B_dR^+) and B_cris^+ ⊆ B_max^+. Reason: B-C say the repair consists of 'delicate direct calculations ... too tedious to be included here'. Affects: the proof.
- **`PadicHodgeTheory/E28`** (gap; Theory of p-adic Galois representations, Proof of Theorem 6.14(2), p. 121). Printed: “Note that Frac(K ⊗K0 Bcris ) is a finite extension over Ccris , thus log[$] is transcendental over Frac(K ⊗K0 Bcris ).” Correction: The argument presupposes that K ⊗_{K_0} B_cris → B_dR is injective (so that Frac(K ⊗ B_cris) is a field inside B_dR); this must be proved first (Colmez 2002, Proposition 8.14 route). Reason: Without injectivity, K ⊗_{K_0} B_cris need not be a domain and 'Frac' is undefined; the same injectivity is the statement whose earlier proof Brinon–Conrad call incomplete (E27). Theorem 6.14(1) and Proposition 6.28 inherit the dependence. Affects: the proof.
- **`PadicHodgeTheory/E29`** (gap; Theory of p-adic Galois representations, Proof of Lemma 6.12, p. 120). Printed: “Since S is separated by the p-adic topology, it suffices to show that if r ∈ N and α ∈ S − pS, then pr αu ∉ S.” Correction: p-adic separatedness of S = W(R)[[ξ/p]] ⊆ B_dR^+ needs a proof; it follows from Colmez's expansion θ_β (Colmez 2002 §8.4), which identifies S with O_C[[X]]. Reason: The claim is asserted without proof; Brinon–Conrad (proof sketch of Theorem 9.2.10) single it out as the delicate point. Affects: the proof.
- **`PadicHodgeTheory/E30`** (error; Theory of p-adic Galois representations, Exercise 5.18(3), p. 93). Printed: “For K ⊂ C an algebraic closure of K inside C, there exists a unique continuous homomorphism s : K → BdR+ commuting with the action of GK such that θ(s(a)) = a, for all a ∈ K.” Correction: There is a unique G_K-equivariant homomorphism s: K̄ → B_dR^+ with θ∘s = id (Hensel lifting); its restriction to each finite extension of K is continuous, but s is not continuous on K̄ for the valuation topology. Reason: If s were continuous, it would extend (B_dR^+ is complete for its natural topology) to a continuous G_K-equivariant ring section C → B_dR^+, which Exercise 5.18(2) itself says does not exist; Brinon–Conrad Remark 4.4.11 states the non-continuity. Affects: nothing.
- **`PadicHodgeTheory/E31`** (misprint; Theory of p-adic Galois representations, Corollary 6.46, p. 137). Printed: “then tN (∆) = tN (∆0 ) + tN (∆00 ).” Correction: t_H(Δ) = t_H(Δ′) + t_H(Δ′′) for a short exact sequence of filtered K-vector spaces. Reason: The corollary is about filtered vector spaces and follows Proposition 6.45 on t_H; t_N is not defined for filtered vector spaces. Affects: nothing.
- **`PadicHodgeTheory/E32`** (gap; Équations différentielles p-adiques et (φ,N)-modules filtrés, Remarque V.2.2, p. 22, with Proposition IV.2.2 (p. 18) and Corollaire III.2.5 (p. 17)). Printed: “La démonstration ci-dessus utilise la construction D 7→ M(D) mais pas la caractérisation de l'image essentielle de ce foncteur, ce qui fait que notre démonstration n'utilise pas le théorème de monodromie p-adique” Correction: As written, the proof of Théorème V.2.1 does use the essential image: it invokes Proposition IV.2.2, whose proof uses Corollaire III.2.5, which is proved from Théorème III.2.4 (equivalence onto modules with locally trivial connection), whose essential-surjectivity part (Théorème III.2.3) uses Théorème III.2.1, the p-adic monodromy theorem of André–Kedlaya–Mebkhout. For sub-objects of M(D) the needed solutions can probably be obtained from those of M(D) directly, but the text does not do this. Reason: Follow the chain of references in the proofs of IV.2.2 → III.2.5 → III.2.4 → III.2.3 → III.2.1. Affects: the proof.
- **`PadicHodgeTheory/E33`** (gap; CMI Summer School notes on p-adic Hodge theory, Theorem 9.1.10, p. 134). Printed: “Proof. This is difficult; see [21, 5.3.7].” Correction: A proof of (Fil^0 B_cris)^{φ=1} = Q_p is needed; Fontaine–Ouyang Theorems 6.25–6.26 give one (via Propositions 6.18–6.24), which the packet uses. Reason: The only reference given is Fontaine's Astérisque 223 paper (not available). Affects: the proof.
- **`PadicHodgeTheory/E34`** (gap; Theory of p-adic Galois representations, Proposition 5.31(3) and its proof, p. 100). Printed: “(3) is not so easy!” Correction: A proof that a non-split extension 0 → Q_p → V → Q_p(1) → 0 is not de Rham; Brinon–Conrad Example 6.3.5 derive it from de Rham ⇒ potentially semistable plus an Ext computation in weakly admissible modules. Reason: No proof is given; the packet places this example as an acceptance item of R06.3, after the p-adic monodromy theorem. Affects: nothing.
- **`PadicHodgeTheory/E35`** (misprint; Représentations p-adiques et équations différentielles, Exemple 2.8 (1), p. 17 (arXiv v3)). Printed: “Ã_[0;r_0] = A+_max” Correction: Ã_[0;r_0] = A_max. Reason: Ã+{[p̃]/p} is the p-adic completion defining A_max. Affects: nothing.
- **`PadicHodgeTheory/E36`** (gap; Représentations p-adiques et équations différentielles, Proposition 5.15, p. 54, with Lemme 4.6, p. 41 (arXiv v3)). Printed: “Alors Ns est un B†,s rig,K -module libre de rang d, et ∇V (Ns ) ⊂ tNs” Correction: ∇_V(N_s) ⊂ tN_s holds after replacing s by s' = r_{n_0} (and N_s by B†,s'_rig,K ⊗ N_s); for the original s it can fail when n_0 > n(s). Reason: Lemma 4.6 concludes x ∈ tB†_rig,K on the annulus of r_{n_0}, not of s. For V = Q_p(−1) and n_0 > n(s), N_s = (t/h)B†,s_rig,K·e_{−1} with h = Π_{n(s)≤n<n_0}φ^{n−1}(q)/p, and ∇_V((t/h)e_{−1}) = −(t²∂h/h²)e_{−1} ∉ tN_s since ∂h/h has poles at the zeros of h. Theorem 5.10 is unaffected because N_dR(V) is formed over B†_rig,K. Affects: nothing.
- **`PadicHodgeTheory/E37`** (misprint; Theory of p-adic Galois representations, §1.3.3, p. 16 (book draft read)). Printed: “let τk ∈ Gk denote the geometric Frobenius … E(−1) is a one-dimensional E-vector space on which WK acts, such that IK acts trivially and the action of τk is multiplication by q−1” Correction: On E(−1) the geometric Frobenius acts by q (equivalently the arithmetic Frobenius by q^{−1}); with that twist the condition 'N: D → D(−1) is W_K-equivariant' gives ρ(τ_k)Nρ(τ_k)^{−1} = q^{−1}N, Deligne's relation. Reason: As printed, N∘ρ(τ_k) = q^{−1}ρ(τ_k)∘N, i.e. ρ(τ_k)Nρ(τ_k)^{−1} = qN for the geometric Frobenius, contradicting Deligne 8.4.1 and FO's own §1.3.2, where Q_ℓ(−1) = Hom(Q_ℓ(1), Q_ℓ) carries the geometric Frobenius as q; the functor V ↦ (D_ℓ(V), N) would not land in Rep_E(WD_K) as printed. Affects: a stated result.
- **`PadicHodgeTheory/E38`** (gap; CMI Summer School notes on p-adic Hodge theory, Theorem 12.4.8 and Theorem 12.4.12, pp. 194–195 (version of 24 June 2009)). Printed: “Theorem 12.4.8. There are exact quasi-inverse anti-equivalences between the category of strongly divisible lattices L with Filp L = 0 and the category of Zp [GK ]-lattices Λ in crystalline GK -representations with Hodge-Tate weights in the set {0, . . . , p − 1}.” Correction: The proof is incomplete in the notes (author footnotes 'need to say more', 'should sketch proof or give reference'); Theorem 12.4.12 is stated only for one-step filtrations. Neither is used as a prerequisite here. Reason: The notes' own footnotes 3–7 mark the missing steps. Affects: the proof.
- **`PadicHodgeTheory/E39`** (misprint; An introduction to the theory of p-adic representations, III.1.1, p. 21 (arXiv v1)). Printed: “AK = {Σ ak πK^k, ak ∈ OF , a−k → 0}, so that AK /p = kK ((πK ))” Correction: a_k ∈ O_{F'_K} with F'_K = K_∞ ∩ F^nr; with a_k ∈ O_F the reduction would be k((π_K)), not k_K((π_K)). Reason: Same phenomenon as PadicHodgeTheory/E1 (the residue field of E_K is that of K_∞). Affects: nothing.

## Restructuring proposals

1. **Cyclotomic coefficient rings: analytic carriers in P7:annulus-foundations, Witt realisation and field of norms in PG.0** (ownership, rescope; PadicHodgeTheory, PhiGammaModulesAndIwasawaCohomology). Both P7:annulus-foundations ('Frobenius and cyclotomic Gamma action') and PG.0 ('Over Q_p compute phi(pi) = (1+pi)^p - 1 and gamma(pi) = (1+pi)^chi(gamma) - 1') claim the cyclotomic rings and their phi, Gamma. PG.0 consumes P7:annulus-foundations. *Proposal:* P7:annulus-foundations owns the rings of Laurent series in the variable pi over an unramified F (A^+_F, A_F, B_F, A^dagger_F, B^dagger_F, B^{dagger,r}_{rig,F}, B^+_{rig,F}, B^dagger_{log,F}) with phi, gamma_a (a in Z_p^x), t, partial, nabla and iota_n as analytic statements (nodes P7:annulus-foundations/overconvergent-cyclotomic-rings ... /cyclotomic-log-robba-ring). PG.0 keeps the Witt-vector realisation pi = [epsilon] - 1 in W(C^flat) (identifying the abstract phi, gamma_a with the Witt Frobenius and the Galois action), the field-of-norms rings A_K, B_K and their overconvergent variants for ramified K, and imports the analytic statements.
2. **Berger's B^dagger_{rig,K} = R_{F'}(pi_K) is planned in P7, not P7:annulus-foundations** (ownership, rescope; PadicHodgeTheory, PadicDifferentialEquationsAndRigidCohomology). PadicDifferentialEquationsAndRigidCohomology asked P7:annulus-foundations for Berger's identification B^dagger_{rig,K} = R_{F'}(pi_K) (Berger 2002 Proposition 2.31). It needs the field of norms (PG.0), and PG.0 consumes P7:annulus-foundations, so placing it there would create the cycle P7:annulus-foundations -> PG.0 -> P7:annulus-foundations. *Proposal:* The identification is PadicHodgeTheory:P7/berger-robba-identification (with P7/robba-ring-of-p-adic-field for the ring, phi, Gamma_K, partial and B^dagger_{log,K}). RD.2/berger-form-of-local-monodromy should list these two P7 node ids as prerequisites (edge P7 -> RD.2, acyclic: the P7 nodes depend on RD.0 only). RD.0/derivation-on-robba-ring and RD.0/bounded-robba-ring (c) can cite P7:annulus-foundations/annulus-derivation and /bounded-robba-ring for the basic coefficientwise statements they restate.
3. **Divide P7 into the Robba dictionary and the Wach comparison** (sub-layers, split; PadicHodgeTheory). P7 as a stage requires PG.6 (and through PG.5 SelmerIwasawaCohomology L3), but its Robba-ring nodes, consumed by R06.3 and RD.2, need only PG.0-PG.2, R06.1 and R06.2. *Proposal:* Sub-layer P7:berger-robba ('Berger's Robba ring and the p-adic Hodge dictionary'): nodes robba-ring-of-p-adic-field, extended-robba-ring-with-galois-action, berger-robba-identification, robba-ring-tensor-identity, nabla-operator-on-robba-ring, localisation-maps-p-adic-field, t-divisibility-criterion, extended-robba-plus-decomposition, extended-localisation-maps, frobenius-regularisation, semistable-periods-in-extended-robba-ring, decompletion-operators, robba-realisation-comparison, berger-dcris-dst-dictionary, berger-comparison-isomorphisms, connection-on-robba-realisation, unipotent-connection-criterion, semistability-criterion-unipotent-connection, ddr-via-robba-realisation, principal-parts-interpolation, ideals-dividing-powers-of-t; requires P7:annulus-foundations, PG.0-PG.2, R06.1, R06.2, RD.0; consumed by R06.3 and RD.2. Sub-layer P7:wach-comparison: wach-dcris-comparison, integral-dcris-lattice, wach-fontaine-laffaille-comparison; requires PG.6 and R07.3.
4. **AI.3's integral pro-étale package must cover all locally noetherian adic spaces** (ownership, rescope; AInfCohomology, PadicHodgeTheory). P8:local-rational's stage text imports 'the integral A_inf sheaf from AInfCohomology AI.3', and AI.3's text claims 'the completed integral structure sheaf, its tilt and the Witt A_inf,X sheaf', but only 'on the analytic generic fiber X of a smooth p-adic formal scheme'. P8 and P8:local-rational apply these sheaves to arbitrary smooth rigid spaces over k (Scholze's Theorems 8.4 and 8.8 need no formal model), and the stage edge AI.3 → P8:local-rational forbids AI.3 from importing them back. The reviewed decomposition had planned the integral statements (Definition 4.1/Lemma 4.2, Definition 4.3-Proposition 4.8, Lemma 4.10) inside P8:local-rational and flagged them as 'candidates for relocation'. *Proposal:* Rescope AI.3's first paragraph to: 'For every locally noetherian adic space X over Spa(Q_p, Z_p), construct O_X^+, Ô_X^+, Ô^+_{X♭}, A_inf,X = W(Ô^+_{X♭}) and θ on X_proét with the corrected covers; construct the affinoid perfectoid basis (Scholze Definition 4.3 - Proposition 4.8) and prove Scholze Lemmas 3.18, 4.10, 5.5, 5.10 and Theorem 6.5 for A_inf'. The rest of AI.3 (AΩ on smooth formal schemes) is unchanged. P8:local-rational keeps the decomposition ids proetale-structure-sheaves-and-valuations, affinoid-perfectoid-objects-and-etale-pullbacks and completed-structure-sheaf-on-affinoid-perfectoids with the rational statements (Ô_X, valuations, rational étale pullbacks, rational acyclicity).
5. **Owner of Scholze's primitive comparison theorem (Sch13 §5)** (ownership, rescope; CohomologyComparisons, PadicHodgeTheory). Sch13 Theorem 5.1 and Corollary 5.11 are the inputs of Theorems 8.4 (i) and 8.8 (i) (P8) and, through BMS1, of the μ-inverted étale comparison (AI.4) and of CP.2-CP.3. No stage names them; the CohomologyComparisons packet records the same absence ('decide whether CP.3 absorbs [58, §8] … or a separate upstream owner is created'). *Proposal:* Assign Sch13 §5 (Theorem 5.1 with Lemmas 2.12, 4.12, 5.3-5.8, Corollary 5.11) to a new early CohomologyComparisons sub-stage 'CP.3:primitive' requiring AInfCohomology AI.3, AdicEtaleGeometry A1-A2 and ClassicalAdicEtaleCohomology H0-H3, with consumers CP.3, AI.4 and PadicHodgeTheory P8; Sch13 Lemma 5.2 (toric charts) stays in P8:local-rational, which already plans it. If a new sub-stage is not wanted, CP.3 absorbs §5 and P8 keeps its request to CP.3.
6. **Crystalline comparison with coefficients and in families (Tan–Tong §§3-6)** (ownership, rescope; CohomologyComparisons, PadicHodgeTheory). P8:local-rational plans the crystalline period sheaves of Tan–Tong §2 because its stage text asks for 'crystalline/semistable period sheaves'. Their main consumers are Tan–Tong's crystalline lisse sheaves (§3), crystalline primitive comparison (Theorem 4.3) and the crystalline comparison with coefficients, absolute and relative (Theorems 4.5, 5.5), which no stage text names; P8's text names only CP.3-CP.4. *Proposal:* CohomologyComparisons CP.2 ('Rational crystalline comparison and descent') gains a paragraph: 'with coefficients and in families: crystalline lisse Ẑ_p-sheaves associated with filtered convergent F-isocrystals and the comparison H^i(X_k̄, L) ⊗ B_cris ≅ H^i_cris(X_0/O_k, E) ⊗ B_cris, absolute and relative (Tan–Tong Theorems 4.5, 5.5)', importing the crystalline period sheaves from PadicHodgeTheory P8:local-rational; P8 does not plan them.
7. **Logarithmic structural semistable period sheaves** (ownership, rescope; PadicHodgeTheory, CohomologyComparisons, HodgeTateAndCanonicalSubgroups). P8:local-rational's text asks for 'semistable period sheaves'. For smooth formal models this packet plans OB_st = OB_cris[u]; for semistable formal models a logarithmic structural sheaf on a log (pro-Kummer-étale) site is needed, which requires the log sites of HodgeTateAndCanonicalSubgroups T6:log-sites or CohomologyComparisons CP.4's log setting, both downstream or parallel. *Proposal:* Narrow P8:local-rational's semistable target to 'the semistable period sheaves B_st = B_cris[u] and OB_st = OB_cris[u] on the pro-étale site of smooth formal schemes'; the logarithmic structural semistable sheaf of a semistable formal model belongs to CohomologyComparisons CP.4 (vertical log structure), alongside HodgeTateAndCanonicalSubgroups T6:comparison's horizontal log period sheaves.
8. **Atlas sub-layers of P8:local-rational** (sub-layers, split; PadicHodgeTheory). P8:local-rational now has about forty declaration nodes in two strands with separate sources and consumers: the de Rham strand (Scholze §§4-6: Ô_X, B_dR^+, B_dR, OB_dR^+, OB_dR, Poincaré lemmas, cohomology of gr OB_dR; consumers CP.3, T6:comparison, P8) and the crystalline/semistable strand (Tan–Tong §2 and the B_st sheaves; consumers CP.2-CP.4 with coefficients, R06.5). *Proposal:* Show two sub-layers: 'P8:local-rational — de Rham period sheaves and Poincaré lemma' (nodes toric-charts-for-smooth-spaces through higher-direct-images-of-twisted-completed-structure-sheaf, including relative-poincare-lemma) and 'P8:local-rational — crystalline and semistable period sheaves' (nodes crystalline-period-sheaves through structural-semistable-period-sheaves); the stage id and all dependencies are unchanged.
9. **Prove the Colmez–Fontaine theorem in R06.3 (or a sub-stage after P7), keeping its statement in R06.2** (proof-placement, rescope; PadicHodgeTheory). R06.2's stage text asks for 'weak admissibility versus admissibility'. Admissible ⇒ weakly admissible and the reduction of the converse to the bigness of V_st(D) are proved in R06.2. The converse (Colmez–Fontaine) is proved publicly by Berger 2008 (Théorème V.2.1) and needs: the (φ, Γ)-module M(D) over B†_rig,K (P7:annulus-foundations), Kedlaya's slope filtration (PadicDifferentialEquationsAndRigidCohomology:RD.1/harder-narasimhan-filtration-exists and RD.1/frobenius-slopes), Berger's Corollaire III.2.5 which uses Théorème III.2.4 and hence the local monodromy theorem for differential equations (RD.2), the étale (φ, Γ)-module equivalence with overconvergence (PhiGammaModulesAndIwasawaCohomology PG.1–PG.2) and Berger 2002 Théorème 3.6 (D_st through the Robba ring). Since the stage graph has R06.2 → P7 and R06.2 → R06.3, these inputs are unavailable in R06.2. Note: contrary to the job text, Berger 2008 does not use R06.3's de Rham ⇒ potentially semistable theorem; its Remarque V.2.2 says so, although its Proposition IV.2.2 does route through the Crew/André–Kedlaya–Mebkhout monodromy theorem for differential equations (source issue PadicHodgeTheory/E32). *Proposal:* Keep PadicHodgeTheory:R06.2/colmez-fontaine-theorem as the definition of the propositions ColmezFontaine(K) and ColmezFontainePst(K) with their equivalent forms (proved in R06.2). Add to R06.3 (part D) the proof nodes: R06.3/berger-filtered-module-to-phi-gamma-module (Berger 2008 §II: lattices M_n(D) = Fil^0(K_n((t)) ⊗ D_K) glued into M(D) over B†_rig,K; Théorème II.2.6, exact ⊗-functor, rank = dim D), R06.3/berger-connection-locally-trivial (Proposition III.1.5), R06.3/berger-essential-image (Théorème III.2.3–III.2.4, uses RD.2's monodromy theorem), R06.3/berger-subobjects (Corollaire III.2.5), R06.3/berger-slope-of-determinant (Théorème IV.2.1: slope of det M(D) = t_N(D) − t_H(D)), R06.3/berger-admissible-iff-etale (Proposition IV.2.2, uses RD.1's slope filtration), and R06.3/colmez-fontaine-proof (Théorème V.2.1: M(D) étale ⇒ D = D_{st,L}(V) via PG.2 and Berger 2002 Théorème 3.6), proving R06.2's propositions. Consumers that need weakly admissible ⇒ admissible (LocalGaloisDeformationRings L7 and R08.3, PotentialModularityAndCompatibleSystems R24.5) already depend on R06.3. Alternative route to record in part D: Colmez 2002 §11.6 via Banach–Colmez spaces (VectorBundlesAndIsocrystals VB3).
10. **Redirect CohomologyComparisons' request to R06.2 for Kisin's functor and Scholze's de Rham comparison** (request-redirect, rescope; CohomologyComparisons, FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicHodgeTheory). CohomologyComparisons' packet requests from PadicHodgeTheory:R06.2 'Kisin's functor and the Breuil–Kisin module theory ... together with Scholze's de Rham comparison' (for CP.5/dvr-lattice-recovery-via-breuil-kisin). Breuil–Kisin modules and Kisin's functor are owned by FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4, and Scholze's de Rham comparison by PadicHodgeTheory P8/R06.5 (part B and part 2 of this roadmap). R06.2 supplies only the period-functor inputs used there: D_dR(V) with its filtration, D_cris, crystallinity by dimension count and B_cris^{G_K} = W(k)[1/p]. *Proposal:* CohomologyComparisons cites FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4 for Kisin's functor and BK(T) ⊗_S A_inf ≅ BKF(T), PadicHodgeTheory:R06.5 (or P8/proper-smooth-de-rham-comparison-application) for Scholze's de Rham comparison, and PadicHodgeTheory:R06.2/period-functors, R06.2/admissible-representations and R06.1/period-ring-invariants for the period-functor facts.
11. **R06.1 owns Ax–Sen–Tate, Tate's normalised traces and the Tate–Sen theorem; R06.2 owns Tate's C(ψ) theorems** (ownership, rescope; PadicHodgeTheory, PhiGammaModulesAndIwasawaCohomology, HodgeTateAndCanonicalSubgroups, FaltingsFinitenessAndIsogenyTheorems). No atlas stage owns the Ax–Sen lemma, C^H = L̂, Tate's normalised traces on Z_p-extensions or the Tate–Sen theorem (C(η)^{G_K}, H^1(G_K, C(η))), which B_dR^{G_K} = K and all regularity statements need. PhiGammaModulesAndIwasawaCohomology's Tate–Sen formalism (Brinon–Conrad §14) and FaltingsFinitenessAndIsogenyTheorems R28.2 use them; HodgeTateAndCanonicalSubgroups:T0 owns Tate's Hodge–Tate decomposition of p-divisible groups, which is different from the C(ψ) statements here. *Proposal:* Record R06.1/ax-sen-tate-invariants, R06.1/tate-trace-almost-surjective, R06.1/tate-sen-axioms-cyclotomic, R06.1/tate-sen-vanishing-on-hk and R06.1/tate-sen-theorem as the single owner; PG.0/PG.1 import them; FaltingsFinitenessAndIsogenyTheorems R28.2 cites R06.2/hodge-tate-decomposition-tate for C(ψ) ≅ C ⇔ ψ(I) finite and the finite-image triviality, and HodgeTateAndCanonicalSubgroups:T0 for V_ℓ(Γ) ⊗ C ≅ C^{h−d} ⊕ C(1)^d.
12. **Atlas sub-layers for R06.1** (sub-layer, split; PadicHodgeTheory). R06.1 has 44 nodes in two coherent blocks. *Proposal:* PadicHodgeTheory:R06.1:de-rham ('C_p, Tate–Sen and B_dR'): cp-integers-p-adically-complete, galois-action-on-cp, semilinear-galois-descent, ax-sen-lemma, ax-sen-tate-invariants, tate-trace-almost-surjective, tate-sen-axioms-cyclotomic, tate-sen-vanishing-on-hk, tate-sen-theorem, tilt-of-cp-and-special-elements, explicit-generator-of-ker-theta, bdr-plus-of-perfectoid-affinoid-algebras, de-rham-period-ring, bdr-plus-complete-dvr, bdr-natural-topology, algebraic-closure-in-bdr-plus, fontaine-element-t, bdr-filtration-and-graded, hodge-tate-period-ring, de-rham-invariants. PadicHodgeTheory:R06.1:crystalline-semistable ('B_cris, B_st and the fundamental exact sequence'): the remaining R06.1 nodes. The de Rham sub-layer is what P8:local-rational needs; the second is what CP.0–CP.2 and R06.2's D_cris/D_st need.
13. **Fontaine–Laffaille Theorem 8.4 belongs to R06.4, the integral theory to R07.3** (ownership, rescope; PadicHodgeTheory, FiniteFlatGroupsAndIntegralPadicHodgeTheory). R06.4's stage text names 'rational admissibility at filtration length < p' as its content, while R07.3's asks only to 'distinguish' it from the torsion theory; the unreviewed EXT-07 draft nevertheless plans Theorem 8.4(i) and 8.4(ii) as R07.3 nodes. Since the stage edge runs R07.3 → R06.4, R07.3 cannot import R06.4. *Proposal:* R06.4 owns Theorem 8.4 (i) (PadicHodgeTheory:R06.4/small-weight-admissibility), 8.4 (ii) (…/fontaine-laffaille-crystalline-comparison) and the lattice consequences (…/fontaine-laffaille-rational-consequences). R07.3 owns MF_tor, U_S, U_{S_K} as functors to Galois representations, strongly divisible lattices and FL Propositions 7.8, 7.15, 7.17, Theorems 3.3, 5.3, 6.1 and §9, stated without the identification U_{S_K} = V_cris^*. The R07.3 blueprint should drop its drafted Theorem 8.4 nodes.
14. **Sen theory and Fontaine's D_dif have no owner in the atlas** (ownership, rescope; PadicHodgeTheory). No atlas stage names D_Sen, Sen's operator or D_dif, but Berger's route to the p-adic monodromy theorem (Propositions 5.7, 5.9) and P7/ddr-via-robba-realisation need them. They are planned here as PadicHodgeTheory:P7/sen-module and P7/fontaine-dif-module, from Brinon-Conrad Chapter 15; they need only R06.1, R06.2 (Tate's theorems) and PhiGamma PG.2. *Proposal:* Record P7 as the single owner of Sen's module, Sen's operator and D_dif, and name them in the P7 stage text; R06.3 and other consumers import them by id.
15. **Berger's extended rings B̃†_rig, ι_n and R_k: R06.3 versus P7:annulus-foundations and RD.0** (ownership, rescope; PadicHodgeTheory, PadicDifferentialEquationsAndRigidCohomology). Berger's extended rings B~^dagger_rig and B~^dagger_log, the localisation maps iota_n, the decompletion operators R_k, Frobenius regularisation and Berger's D_cris/D_st dictionary are used by the p-adic monodromy theorem (R06.3), by the Robba dictionary of P7 and by the rigid-cohomology export (RD.2/berger-form-of-local-monodromy). They are planned once, in P7, and R06.3 cites them. *Proposal:* Add the stage link PadicHodgeTheory:P7 -> PadicHodgeTheory:R06.3 (no cycle: P7 needs only P7:annulus-foundations, R06.1, R06.2, PG.0-PG.3, PG.6 and RD.0). RD.0 keeps the general extended Robba ring over an arbitrary residue field; P7's rings are its cyclotomic instance.
16. **Weil–Deligne representations: R01.2 owns the category, R06.3 the p-adic recipe** (boundary, rescope; PadicHodgeTheory, ArithmeticGaloisRepresentations). AUDIT-37 lists R01.2 as owner of Weil–Deligne representations and the ℓ-adic functor. R06.3 plans only Fontaine's functor on (φ,N,Gal(L/K))-modules, the parameter WD(V) and the comparison of conventions. *Proposal:* No change of stages; R06.3 imports the Weil–Deligne category and the rescaling lemma from R01.2 by request.

## Numerical checks

All checks use PARI/GP; the packet's acceptance lines record each value.

- **P7:annulus-foundations:**
  - for $p = 3$ the coefficient of $\pi^{3^k}$ in $t = \log(1+\pi)$ has valuation $-k$, so
    $t \notin \mathcal R^{\mathrm{bd}}$;
  - the terms of $\sum p^n\pi^{-p^n}$ grow at every radius below 1;
  - the norm identity for φ, the product formula for $t$, the Newton slopes $1/r_n$ of
    $\Phi_{p^n}(1+x)$ and the $\gamma_a$ formulas;
  - $t_N = t_H$ in the supersingular Wach example.
- **P8:**
  - the kernel and cokernel of $\gamma - 1$;
  - $v_p((1+p)^i - 1)$;
  - $N\varphi = p\varphi N$ on $B[u]$;
  - $\theta(\varphi(\xi)) \neq 0$;
  - the unboundedness of $v_p(n!) - n$;
  - exactness of the polynomial de Rham complex, and the Hodge numbers of curves.
- **R06.1–R06.2:**
  - for $y^2 = x^3 - x$: $a_3 = 0$ (supersingular) and $a_5 = -2$ (ordinary), with $T^2 - a_pT + p$;
  - the matrix of Brinon–Conrad's Example 8.1.3 has characteristic polynomial $X^2 + 4p$, not the
    printed $X^2 - 4p$ (trace 0, determinant $4p$);
  - $t_N = t_H = -n$ for $\mathbb Q_p(n)$;
  - a non-Hodge–Tate character, and an unramified character;
  - Berger's filtered module IV.2.8(2) is not weakly admissible;
  - a rank-2 module that is weakly admissible with its $N$ but not with $N = 0$.
- **R06.3–R06.4:**
  - the Tate curve for 11a1 at $p = 11$ (split): $v(q) = 5$, $N\varphi = 11\varphi N$,
    $r(\mathrm{Frob}) = \varphi^{-1}$ with $rNr^{-1} = 11N$, and characteristic polynomial
    $(x - 11)(x - a_{11})$, matching the $\ell$-adic side;
  - 15a1 at $p = 3$ (non-split): $(x+3)(x+1)$;
  - good reduction gives $X^2 - a_pX + p$;
  - the characters $\omega^n$ are distinct for $0 \le n \le p-2$;
  - $\mathbb Q_3(\sqrt{-6})$ shows that the coefficient field $K_\infty \cap \mathbb Q_3^{nr}$ can be larger than
    $\mathbb Q_3$.

## Sources

- `berger-intro`: L. Berger, *An introduction to the theory of p-adic representations*, arXiv:math/0210184v1 (12 Oct 2002). https://arxiv.org/abs/math/0210184v1. Read: I.2; II.1-II.3; III.1-III.3; IV.1-IV.5; V.1; VI.1-VI.2; §II.2–II.3 (pp. 11–14): Ẽ^+, θ, B_dR, B_cris^+ and the Hodge–Tate weight convention; II.3.1–II.3.5; II.4.1–II.4.4 (Tate's elliptic curve); II.5.1–II.5.2 (Weil–Deligne representations); III.1.1; III.3; IV.1–IV.5.4; V.1 (opening).
- `berger-2002`: L. Berger, *Représentations p-adiques et équations différentielles*, arXiv:math/0102179v3 (5 Oct 2001); Invent. Math. 148 (2002) 219-284. https://arxiv.org/abs/math/0102179v3. Read: Introduction 0.1-0.5; 1.1-1.3; 2 (introduction), 2.1 (statements), 2.2 (Propositions 2.11-2.13, 2.17), 2.3-2.6; 3.1-3.4; 4.1-4.2; 5.1-5.3 and the statement of Theoreme 5.10; §0.1–0.5 (Théorèmes 0.1–0.8); §1.1–1.3; §2 introduction; 2.1 (Lemmes 2.1, 2.7, 2.9, Exemple 2.8); 2.2 (Propositions 2.11–2.13, Remarque 2.14, Lemme 2.15); 2.3 (Définition 2.16, Proposition 2.17, Lemme 2.18, Proposition 2.19); 2.4 (Propositions 2.23–2.25, Remarque 2.26); 2.6 (Propositions 2.31–2.32, Lemmes 2.33–2.34, Définition 2.35); §3.1–3.2 (Lemme 3.1 to Proposition 3.9); §4.1 (Lemme 4.1 to Lemme 4.9); §4.2 statements (Théorème 4.10, Corollaire 4.11, Proposition 4.12); §5.1–5.5 in full (Lemme 5.1 to Théorème 5.20); §6 introduction and §6.1 (Théorème 6.2, Corollaire 6.3, Lemmes 6.4–6.5); Not read in detail: §2.5 proofs (Lemme 2.27–Proposition 2.30), §3.3–3.4, §4.2 proofs, §5.6, §6.2.
- `berger-2008`: L. Berger, *Équations différentielles p-adiques et (φ,N)-modules filtrés*, arXiv:math/0406601v1 (29 Jun 2004); Astérisque 319 (2008). https://arxiv.org/abs/math/0406601v1. Read: Introduction; I.1-I.3; V.2-V.3 (partial); Appendice B (erratum to Berger 2002); Introduction (pp. 1–4); §I.1 (pp. 4–5); §II.2 (pp. 11–13); §III (pp. 13–17); §IV (pp. 17–20); §V.1–V.2 (pp. 20–23); Introduction (Théorèmes A–D); I.1–I.2 (opening); III.2 (Théorèmes III.2.1, III.2.3, III.2.4, Corollaire III.2.5); V.1–V.2 (Théorème V.2.1, Remarque V.2.2, Théorème V.2.3); Appendice B (Erratum à [Ber02]).
- `kedlaya-liu`: K. Kedlaya and R. Liu, *Relative p-adic Hodge theory: Foundations*, arXiv:1301.0792v5; Astérisque 371 (2015). https://arxiv.org/abs/1301.0792v5. Read: Definitions 2.1.9-2.1.10, 2.2.1, 2.2.15; 4.1 (Hypothesis 4.1.1-Remark 4.1.12); Definition 4.3.1, Example 4.3.2.
- `fontaine-ouyang`: J.-M. Fontaine and Y. Ouyang, *Theory of p-adic Galois representations*, book draft (Université Paris-Saclay page). https://www.imo.universite-paris-saclay.fr/~jean-marc.fontaine/prepub/theory_padic.pdf. Read: 3.2 (statements of Theorems 3.19, 3.24); 4.3.2; 4.4.2 (Lemma 4.26-Corollary 4.29); §2.1 (pp. 19–25); §3.1–3.2 and §3.5 (pp. 39–49, 62–65); §5.1–5.2 (pp. 87–101); Chapter 6 in full (pp. 113–144); §7.1–7.2 (pp. 145–160); Appendix A.4 Propositions A.88–A.97 and A.5 Theorem A.108 (pp. 202–209); §1.3.1–1.3.3 (ℓ-adic representations of local fields, Weil–Deligne representations); §6.1.3 (Proposition 6.11, Lemma 6.12, Theorems 6.13–6.14); §6.5.1–6.5.2 (Theorem A, Theorem B, Proposition 6.58, Definitions 6.59, 6.61, Proposition 6.62); §7.3 (sketch of Theorems A and B; Colmez's route, not decomposed).
- `brinon-conrad`: O. Brinon and B. Conrad, *CMI Summer School notes on p-adic Hodge theory*, 2009 preliminary version. https://math.stanford.edu/~conrad/papers/notes.pdf. Read: 10.3 (the Robba ring paragraph); Theorem 2.2.7 (p. 15); Section 9.2: Definition 9.2.3 and following paragraphs, Theorem 9.2.10 (pp. 135-143); Section 14.1: axioms (TS1)-(TS3), Propositions 14.1.6-14.1.7, Lemma 14.1.9 with proof (pp. 239-243); Theorem 14.3.4 with proof (pp. 253-254); §§2.1–2.4 (pp. 10–24); §4.1–4.5 including Exercise 4.5.3 (pp. 45–66); §5 (pp. 66–72); §6 (pp. 73–83); §7.3 (pp. 95–99) and Exercise 7.4.10; §8 (pp. 101–121 read; §8.3 Theorem 8.3.6 statement); §9 (pp. 128–154); §13.1 statements (pp. 198–205), §14.1 Propositions 14.1.6–14.1.7, §14.3 Propositions 14.3.2–14.3.3 and Theorem 14.3.4 with proof (pp. 237–255); Lemma 3.2.6 statement (p. 36); §2.4 (Hodge–Tate weights); §6.3 (filtration on D_dR, non-de Rham extension); §8.2 (ℓ-adic motivation, Definition 8.2.5, Lemma 8.2.8); §8.3 (Theorem 8.3.6, Propositions 8.3.4, 8.3.5, 8.3.8); Part III introduction; §12.4 (Definitions 12.4.7, 12.4.9, Theorems 12.4.8, 12.4.12); §15.1–15.4 (Sen theory, D_dif, Proposition 15.4.15).
- `kedlaya-overview`: K. S. Kedlaya, *Local monodromy of p-adic differential equations: an overview*, arXiv:math/0501361v2 (23 May 2005); Int. J. Number Theory 1 (2005) 109-154. https://arxiv.org/abs/math/0501361v2. Read: 3.1; 3.2 (Definition 3.2.1, Lemma 3.2.2, Proposition 3.2.3); 3.5 (Definition 3.5.1-Remark 3.5.7); 4.1 (Definition 4.1.1-Remark 4.1.9).
- `lazard-1962`: M. Lazard, *Les zéros des fonctions analytiques d’une variable sur un corps valué complet*, Publ. Math. IHÉS 14 (1962) 47-75 (numdam scan; OCR text layer used for excerpts). http://www.numdam.org/item/PMIHES_1962__14__47_0/. Read: Introduction; 1 (1.1-1.11); 2 (Proposition 1, 2.5-2.7, statements of Lemmes 1-2); 3 (Propositions 2, 3, 4, 4 bis).
- `berger-2004`: L. Berger, *Limites de représentations cristallines*, Compos. Math. 140 (2004) 1473-1498; author PDF. https://perso.ens-lyon.fr/laurent.berger/articles/article06.pdf. Read: Introduction; II.1-II.3; III.2 (statements); III.4; V.1-V.2.
- `berger-errata`: L. Berger, *Errata for my articles*, author PDF dated May 5, 2026. https://perso.ens-lyon.fr/laurent.berger/articles/errata.pdf. Read: 1 (Représentations p-adiques et équations différentielles); 2 (Limites de représentations cristallines); 4 (Équations différentielles p-adiques et (φ,N)-modules filtrés).
- `sch13-padic-hodge`: Peter Scholze, *p-adic Hodge theory for rigid-analytic varieties*, Author's version dated 3 November 2012 (published in Forum of Mathematics, Pi 1 (2013), e1); printed page numbers of that copy. https://people.mpim-bonn.mpg.de/scholze/pAdicHodgeTheory.pdf. Read: Introduction, Theorems 1.5-1.6 and Corollary 1.8 (pp. 3-4); Section 3: Definitions 3.3, 3.9, Propositions 3.5, 3.7, 3.12, 3.13, 3.15, Lemmas 3.6, 3.10, 3.16, 3.18, Corollary 3.17, with proofs (pp. 13-21), for the requests to AdicEtaleGeometry A1 and AInfCohomology AI.3; Section 4: Definition 4.1 - Lemma 4.12 with proofs (pp. 21-28); Section 5: Theorem 5.1 statement, Lemmas 5.2-5.6 and 5.8, Definition 5.9, Lemma 5.10, proof of Theorem 5.1, Corollary 5.11 (pp. 28-34); Section 6: Definition 6.1 - Remark 6.20 with all proofs (pp. 35-41); Section 7: Definition 7.1 - Lemma 7.13 with all proofs (pp. 41-47); Section 8: Definition 8.1 - Remark 8.9 with all proofs (pp. 48-53); page 49 also rendered as an image to check the tensor product in Proposition 8.5; Section 9: statements of Theorems 9.1, 9.3, 9.4 and Proposition 9.2 with proof (pp. 53-54); reference list; Section 6, Lemma 6.3 and Corollary 6.4 (pp. 35–36), as recorded in the integrated decomposition; used only for R06.1/bdr-plus-of-perfectoid-affinoid-algebras.
- `sch16-erratum`: Peter Scholze, *Erratum to p-adic Hodge theory for rigid-analytic varieties*, Author's erratum (published in Forum of Mathematics, Pi 4 (2016), e6). https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf. Read: Items (1)-(3) in full and the reference list (pp. 1-3).
- `scholze-arxiv`: Peter Scholze, *p-adic Hodge theory for rigid-analytic varieties (arXiv version)*, arXiv:1205.3463v2. https://arxiv.org/abs/1205.3463v2. Read: Theorem 6.5 statement, proof of Theorem 7.6 (i) and Proposition 8.5, compared with the author's version for the recorded source issues.
- `tan-tong`: Fucheng Tan and Jilong Tong, *Crystalline comparison isomorphisms in p-adic Hodge theory: the absolutely unramified case*, arXiv:1510.05543v2 (8 June 2019); published in Algebra & Number Theory 13 (2019), no. 7, 1509-1581 (published version not read); printed page numbers of the arXiv copy. https://arxiv.org/abs/1510.05543v2. Read: Notation and Section 1 (Theorems 1.1-1.3), pp. 1-4; Section 2 in full: Definitions 2.1, 2.4, 2.9, 2.12, Proposition 2.2 - Corollary 2.26 with proofs, pp. 4-22; Section 5: Proposition 5.1 statement, p. 43.
- `colmez-2002`: Pierre Colmez, *Espaces de Banach de dimension finie*, Author's PDF (J. Inst. Math. Jussieu 1 (2002), 331–439); page numbers of the author's file. https://webusers.imj-prg.fr/~pierre.colmez/jussieucorps.pdf. Read: §8.3–8.6 (pp. 58–64): A_inf,K, B_dR^+ and the expansion θ_v, A_max and B_max^+, Proposition 8.14, Corollaire 8.15, Proposition 8.17; §9.1 Proposition 9.2 and §9.7 Proposition 9.25 statement (pp. 64–74); table of contents (§11.6 'Faiblement admissible implique admissible').
- `fontaine-laffaille`: Jean-Marc Fontaine and Guy Laffaille, *Construction de représentations p-adiques*, Ann. Sci. École Norm. Sup. (4) 15 (1982), no. 4, 547–608 (numdam scan; OCR checked against page images for every excerpt). http://www.numdam.org/item?id=ASENS_1982_4_15_4_547_0. Read: Introduction 0.1–0.12; §3.2–3.3 (statements); §6.1 and 6.13 (Remarques); §7.1–7.18; §8.1–8.5, 8.12–8.13; §9.7–9.12 (statements).
- `breuil-schneider-2007`: Christophe Breuil and Peter Schneider, *First steps towards p-adic Langlands functoriality*, arXiv:math/0603499v1 (21 Mar 2006); published in J. Reine Angew. Math. 610 (2007). https://arxiv.org/abs/math/0603499v1. Read: §4, pp. 14–15 (the categories WD_{L'/L} and MOD_{L'/L}, Fontaine's functor WD, Proposition 4.1).
- `allen-2016`: Patrick B. Allen, *Deformations of polarized automorphic Galois representations and adjoint Selmer groups*, arXiv:1411.7661v2 (14 Jan 2016); published in Duke Math. J. 165 (2016). https://arxiv.org/abs/1411.7661v2. Read: §1.1 (1.1.1–1.1.7: Weil–Deligne representations, ℓ ≠ p and ℓ = p constructions).
- `kw-serre-modularity-I`: Chandrashekhar Khare and Jean-Pierre Wintenberger, *Serre's modularity conjecture (I)*, author's copy from the first author's web page (the published version is Invent. Math. 178 (2009)). https://www.math.ucla.edu/~shekhar/papers/results.pdf. Read: §4 (definition of weight k, Theorem 4.1); §5 (compatible systems, Weil–Deligne parameters, Theorem 5.1); §9 (Hypothesis (H) and the Remark on Breuil and Kisin).
