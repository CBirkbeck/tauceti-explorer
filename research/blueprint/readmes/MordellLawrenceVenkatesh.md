# The Mordell conjecture after Lawrence and Venkatesh

## Purpose

This roadmap proves **Faltings's theorem**: for a number field $K$ and a smooth projective geometrically connected curve $Y$ over $K$ of genus $g\ge2$, the set $Y(K)$ is finite. The proof is the one of Brian Lawrence and Akshay Venkatesh, *Diophantine problems and $p$-adic period mappings*, Invent. Math. 221 (2020), 893–999 (arXiv:1807.02721v3), §§2–8. It does not use heights, the Tate conjecture or the Shafarevich conjecture. The same method first proves the **S-unit theorem**, which is a milestone of its own.

The idea: an abelian-by-finite family $X\to Y'\to Y$ (the Kodaira–Parshin family) attaches to every rational point $y$ a finite set of global Galois representations of bounded dimension, restricted ramification and weight one. Faltings's finiteness lemma leaves finitely many of them up to isomorphism, once the failure of semisimplicity is controlled by purity. On a $p$-adic residue disk these representations are read off, through the crystalline comparison theorem, from a $p$-adic period map; the period map is given by the same power series as the complex period map, so the big monodromy of the family makes it Zariski dense. The Frobenius centralizer is small because the Aff$(q)$-covering makes the relevant residue fields large, and so only finitely many points of each residue disk survive.

## How this document is organized

There is one section per layer. Each section lists the objects of the layer (definitions and constructions, with the module, the namespace, the construction and the declarations of their API), then the theorems (with the suggested declaration name, the statement with all hypotheses, the proof outline and the results it uses), then the dependencies of the layer on earlier layers and on other roadmaps, with the exact statement requested from each. Every object and theorem has tests. Library paths are relative to `TauCeti/NumberTheory/LawrenceVenkatesh`, and theorem declarations are named in the namespace given, in snake case after the milestone. The blueprint packet `research/blueprint/packets/MordellLawrenceVenkatesh.json` contains the same material with source locators and excerpts.

## Scope and boundaries

In scope: the paper's §2 (linear algebra, Faltings's finiteness lemma, friendly places and the purity
lemmas 2.8–2.10, the group $\mathrm{Aff}(q)$, symplectic Goursat and transvection lemmas), §3 in the
generality of polarized abelian schemes over a finite étale cover of the base (Gauss–Manin transport on
residue disks, complex and $p$-adic period maps, Lemmas 3.1–3.3, Proposition 3.4), §4 (the S-unit
equation), §§5–6 (abelian-by-finite families, $\mathrm{size}_v$, Proposition 5.3 and Lemmas 6.1–6.4),
§7 (the Hurwitz construction and the Kodaira–Parshin family), §8 (mapping class groups, $\mathrm{Aff}(q)$-covers
and the monodromy theorem 8.1) and Theorem 5.4. The surface topology that §8 and the monodromy of the Legendre
family in §4 rest on (mapping class groups, Dehn twists, the Birman exact sequence, families of branched covers)
is carried by layer LV.5, because no atlas roadmap owns it; the restructure proposal of the blueprint packet
assigns it to a new roadmap.

Not in scope: LV §§9–12 (hypersurfaces, the Bakker–Tsimerman theorem, reductive-group combinatorics, point
counting), and Lemmas 2.2, 2.4–2.6, which only those sections use. The general machinery the proof consumes
(period rings and period functors, crystalline cohomology, the crystalline comparison theorem, abelian schemes
and their degree-one realizations, étale fundamental groups, class field theory, Chebotarev, algebraic groups,
singular homology, covering spaces) is owned by the roadmaps named in each layer.

Boundaries with neighbouring roadmaps:

- `PadicHodgeTheory`, `CohomologyComparisons` and `CrystallineCohomology` own period rings, $D_{\mathrm{cris}}$, the crystalline comparison theorem and the Berthelot–Ogus comparison; LV.4 only applies them to abelian schemes with good reduction.
- `AbelianSchemesAndArithmeticModuli` owns abelian schemes, polarizations, degree-one de Rham realizations and complex uniformization; LV.2 and LV.8 consume them for polarized abelian schemes over curves.
- `InverseGaloisAndArithmeticFundamentalGroups` owns étale fundamental groups, Riemann existence and branched covers; LV.8 builds only the Hurwitz space of $G$-covers branched at one moving point.
- `ReductiveGroups` owns algebraic groups, Zariski closures and the structure of $\mathrm{Sp}$; LV.0 proves only the generation and Goursat lemmas the argument uses.
- `FaltingsFinitenessAndIsogenyTheorems` and `HeightsRationalPointsAndObstructions` prove Faltings's theorem by heights; this roadmap does not use that route, and takes from it only the Hermite–Minkowski node of R28.1.
- `DiophantineApproximationAndTranscendence` DT.2 proves the S-unit theorem by the Subspace theorem; LV.6 is an independent proof.
- Surface topology (LV.5) has no owner in the atlas; the packet's restructure proposal moves it to a new roadmap.

## Conventions

- $K \subset \bar{\mathbb Q}$ is a number field; $G_K = \mathrm{Gal}(\bar{\mathbb Q}/K)$. For a finite place
  $\wp$ of $K$, $q_\wp$ is the size of its residue field and $\mathrm{Frob}_\wp$ is the **arithmetic**
  Frobenius (Mathlib `IsArithFrobAt`); $\mathrm{Frob}_\wp^{\mathrm{geom}} = \mathrm{Frob}_\wp^{-1}$.
- A continuous representation $\rho : G_K \to \mathrm{GL}(V)$ on a finite-dimensional $\mathbb Q_p$-vector
  space is **pure of weight $w$ outside a finite set $T$** if for every finite place $\wp \notin T$ it is
  unramified at $\wp$ and every root of the characteristic polynomial of $\rho(\mathrm{Frob}_\wp^{\mathrm{geom}})$
  is an algebraic number all of whose complex absolute values equal $q_\wp^{w/2}$; it has **integral
  Frobenius polynomials outside $T$** if these characteristic polynomials lie in $\mathbb Z[X]$. With this
  normalization $H^w_{\mathrm{et}}(X_{\bar K},\mathbb Q_p)$ of a smooth projective variety with good reduction
  outside $T$ is pure of weight $w$ and $\mathbb Q_p(1)$ has weight $-2$. LV state their Lemma 2.3 with
  "unramified outside $S$" while applying it to representations ramified above $p$; here $T$ always contains
  the places above $p$.
- Local class field theory: $\mathrm{Art}_{K_v}$ sends uniformizers to arithmetic Frobenius and satisfies
  $\chi_{\mathrm{cyc}}(\mathrm{Art}_{K_v}(u)) = N_{K_v/\mathbb Q_p}(u)^{-1}$ for $u \in \mathcal O_{K_v}^\times$
  (Tau Ceti `ClassFieldTheory`, Layer 7).
- $p$-adic Hodge theory is covariant: $D_{\mathrm{cris}}(V) = (V \otimes_{\mathbb Q_p} B_{\mathrm{cris}})^{G_{K_v}}$,
  $D_{\mathrm{dR}}(V) = (V \otimes B_{\mathrm{dR}})^{G_{K_v}}$. Filtrations are recorded by their **jumps**:
  $D_{\mathrm{dR}}(\mathbb Q_p(n))$ has its jump in degree $-n$ (Brinon–Conrad, Example 6.3.1), so a jump $j$
  is the Hodge–Tate weight $-j$ in the `PadicHodgeTheory` convention $\mathrm{HT}(\chi_p)=+1$. For an abelian
  variety with good reduction, $D_{\mathrm{cris}}(H^1_{\mathrm{et}})$ is $H^1_{\mathrm{dR}}$ with its Hodge
  filtration, jumps $0$ and $1$.
- The **weight of a filtration** $F^\bullet$ on a nonzero finite-dimensional vector space $V$ with $F^0V=V$ is
  $\mathrm{weight}_F(V) = \sum_{j} j \dim \mathrm{gr}^j V / \dim V$ (LV (2.2)), i.e. $t_H(V)/\dim V$ in
  Brinon–Conrad's notation.
- For $K_v/\mathbb Q_p$ unramified of degree $f_v$, $\sigma$ is the arithmetic Frobenius of $K_v$; a
  crystalline Frobenius $\varphi$ is $\sigma$-semilinear and $\varphi^{f_v}$ is $K_v$-linear.
- A **curve** over a scheme $S$ is a smooth proper morphism of relative dimension one with geometrically
  connected fibres. Grassmannians parametrize **subspaces**. $\mathrm{LGr}(V,\omega)$ is the variety of
  Lagrangian subspaces of a $2d$-dimensional symplectic space; it has dimension $d(d+1)/2$.
- Symplectic transvections are $T_v^r(x) = x + r\langle v,x\rangle v$ (LV (2.4)); for a Dehn twist,
  Farb–Margalit's $\Psi(T_b)([a]) = [a] + \hat\imath(a,b)[b]$ fixes $\langle v, x\rangle = \hat\imath(x, v)$.
- $\mathrm{Aff}(q) = \{x \mapsto ax+b\} \subset \mathrm{Sym}(\mathbb F_q)$ for a prime $q \ge 3$;
  $H_q = \mathbb F_q^\times$ is the stabilizer of $0$.
- $\mathrm{size}_v(E)$ is the proportion of elements of a finite $G_K$-set $E$ unramified at $v$ that lie in
  $\mathrm{Frob}_v$-orbits of size $< 8$ (LV Definition 5.2).

## Sources

Lawrence–Venkatesh (arXiv:1807.02721v3) is the primary source; Brinon–Conrad's CMI notes for $p$-adic Hodge
theory; Farb–Margalit, *A primer on mapping class groups* (v5.0) for §8; Milne, *Complex Multiplication*, for
CM fields and infinity types; Faltings (1983) and Deligne (Sém. Bourbaki 616) for the finiteness lemma;
Berthelot–Ogus for crystalline cohomology; SGA 1 for fundamental groups and Riemann existence; K. Conrad,
*Strassmann's theorem and an application*, for zeros of $p$-adic power series.

- Brian Lawrence; Akshay Venkatesh, *Diophantine problems and p-adic period mappings*, arXiv:1807.02721v3 (25 October 2019), 76 pp.; published Invent. Math. 221 (2020), 893–999, doi:10.1007/s00222-020-00966-7. Locators are to the arXiv v3 pagination. (https://arxiv.org/pdf/1807.02721v3). Read: §1 Introduction (pp. 1–8); §2 Notation and preparatory results (pp. 8–15); §3 Fibers with good reduction in a family (pp. 15–20); §4 The S-unit equation (pp. 20–24); §5 Outline of the argument for Mordell's conjecture (pp. 25–28); §6 Rational points on the base of an abelian-by-finite family (pp. 28–34); §7 The Kodaira–Parshin family (pp. 34–39); §8 The monodromy of Kodaira–Parshin families (pp. 39–51); §9 (pp. 51–55), read to confirm that the Mordell argument does not use it; References (pp. 74–76).
- Olivier Brinon; Brian Conrad, *CMI summer school notes on p-adic Hodge theory (preliminary version)*, Preliminary version (2009), 290 pp. (https://math.stanford.edu/~conrad/papers/notes.pdf). Read: §2.2 Theorem 2.2.7 (Tate–Sen), p. 15; §6.3 Example 6.3.1, Propositions 6.3.2–6.3.3, pp. 76–77; §8.1 Definition 8.1.1, Proposition 8.1.2, pp. 102–103; §8.2 Definition 8.2.1, p. 110; §9.1 Propositions 9.1.9 and 9.1.11, pp. 134–135; §9.3 Theorem 9.3.4, p. 147.
- Benson Farb; Dan Margalit, *A primer on mapping class groups*, Version 5.0 (the authors' freely distributed version, 509 pp.; published by Princeton University Press, 2012). Page numbers are the printed ones. (https://pagine.dm.unipi.it/~a019210/Farb%20Magalit_Primer%20on%20Teichmuller%20theory.pdf). Read: §1.1 Theorem 1.1 (classification of surfaces) and the conventions following it (pp. 18–19); §1.3 The change of coordinates principle (pp. 38–43); §3.1.1 Dehn twists and their action on curves, Facts 3.6–3.9 (pp. 64–75); §3.6.2 Proposition 3.19 (pp. 89–90); §4.2 Theorem 4.6, Fact 4.7 and the proof (pp. 101–105); §6.2 Proposition 6.2 (p. 173); §6.3 Proposition 6.3, Theorem 6.4 (pp. 176–177).
- J. S. Milne, *Complex Multiplication*, Course notes (version posted at jmilne.org, accessed 2026-09-16) (https://www.jmilne.org/math/CourseNotes/CM.pdf). Read: Chapter I, CM-algebras: Proposition 1.4, Corollary 1.5, Remarks 1.6–1.7 (pp. 10–11); Chapter I, Infinity types: Proposition 4.9 and its proof (pp. 37–38).
- A. Grothendieck; M. Raynaud, *Revêtements étales et groupe fondamental (SGA 1)*, Updated edition, arXiv:math/0206203 (Documents Mathématiques 3, SMF 2003) (https://arxiv.org/pdf/math/0206203). Read: Exposé XII §5, Théorème 5.1 (Riemann existence), pp. 251–252; Exposé XIII §4, Proposition 4.3 and Exemples 4.4, pp. 307–309.
- Pierre Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, Séminaire Bourbaki, exposé 616 (1983/84), Astérisque 121–122 (1985) (http://www.numdam.org/item/SB_1983-1984__26__25_0.pdf). Read: §3, Théorème 3.1 and its proof (pp. 17–18 of the numdam file).
- Gerd Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, Invent. Math. 73 (1983), 349–366 (https://math.uchicago.edu/~drinfeld/Deligne%27s_conjecture_Manin_conf/Faltings_argument/Faltings.pdf). Read: §3 Lemma 4 (p. 357); §5 Satz 5 and its proof (pp. 362–363).
- Keith Conrad, *Strassmann's theorem and an application*, Expository note (version posted on the author's web page, accessed 2026-09-16) (https://kconrad.math.uconn.edu/blurbs/gradnumthy/strassmannapplication.pdf). Read: §2 Theorem 2.1 and Corollary 2.2 (p. 2); §4 Theorem 4.1 (Strassmann) and its proof (pp. 4–5).
- Pierre Berthelot; Arthur Ogus, *Notes on Crystalline Cohomology*, Princeton University Press / University of Tokyo Press, 1978 (https://math.bu.edu/people/yangzhe/BO_Crystalline.pdf). Read: §7, Corollaries 7.3–7.4 and Corollary 7.9 (pp. 7.4–7.16).

## Corrections and additions to the source

The layers follow the paper closely. The following points differ from its text; each is stated where it is used.

- LV Lemma 2.3 is stated with a set $S$ of places not above $p$ but applied to $p$-adic cohomology; the ramification set $T$ must contain the places above $p$ (LV.1, `faltings-finiteness`).
- LV Lemma 2.8 holds for the restriction to units of the local character, not on uniformizers ($\eta=\chi_{\mathrm{cyc}}^{-1}$ is a counterexample there); the packet states and proves it on units, which is all Lemmas 2.9–2.10 use (LV.1).
- LV Lemma 3.2 uses one radius for the $v$-adic and complex disks; the proof works for independent radii, which is what the period maps provide (LV.3).
- LV Lemma 6.3 must exclude $W=0$ and $W=V$, as the Sublemma does; LV Lemmas 6.3 and 6.4 need only $r\ge5$ (LV.7).
- LV Proposition 5.3 relies on the set-up of LV §3.1: the residue characteristic of $v$ is odd and no place of $S$ lies above it; the packet states these hypotheses (LV.7), and LV.11 chooses $v$ accordingly.
- In the proof of LV Lemma 6.1 the fixed base pair must range over all pairs of local degree at least $8$ (LV.7, `generic-simplicity-family`).
- In LV Lemma 7.4 only the middle exactness of the sequence of geometric étale fundamental groups is needed; injectivity on the left, attributed to the vanishing of $\pi_2$ of the fibre, rests on $\pi_2$ of the base $Y$ (LV.5, LV.8).
- LV Lemmas 8.2 and 8.3 require the curve to be nonseparating (LV.9); LV Lemma 8.9 concerns $\mathrm{MCG}(Y\smallsetminus\{y\})_{Z_i}$ (LV.10).
- LV Lemma 8.6 is proved in LV.10 (`push-monodromy-noncentral`); the curve of LV Lemma 8.8, drawn in LV Figure 4 for exponent $2$, is constructed for every exponent (LV.10); the curves $\beta_1\beta_2^j$ of LV Lemma 8.11 are realized as Dehn twists (LV.9).
- In the proof of Theorem 5.4 the count of small Frobenius orbits uses $\ker(T^i-1)$ for $1\le i\le7$; for $i=8$ the unit condition can fail (LV.11).
- The monodromy of the Legendre family, used in LV Lemma 4.3, is derived from point pushing (LV.6), and the nonconstancy of the period map in LV Lemma 4.4 from full monodromy.

## Layers

| Layer | Title | Objects | Theorems |
| --- | --- | --- | --- |
| LV.0 | Semilinear centralizers, the affine group Aff(q) and symplectic monodromy lemmas | 3 | 15 |
| LV.1 | Galois representations: Faltings's finiteness lemma, friendly places and purity of Hodge weights | 3 | 14 |
| LV.2 | Abelian-by-finite families, good models and Gauss–Manin transport on residue disks | 7 | 4 |
| LV.3 | Lagrangian period varieties and the complex and p-adic period maps | 5 | 10 |
| LV.4 | Crystalline comparison on residue disks and the finiteness criterion | 0 | 5 |
| LV.5 | Surfaces, mapping class groups and families of branched covers | 4 | 10 |
| LV.6 | The S-unit theorem | 1 | 9 |
| LV.7 | Rational points on the base of an abelian-by-finite family | 1 | 7 |
| LV.8 | Hurwitz spaces of singly ramified covers and the Kodaira–Parshin family | 4 | 7 |
| LV.9 | Aff(q)-covers of surfaces: primitive homology, lifted monodromy and normal form | 4 | 5 |
| LV.10 | The monodromy theorem for Kodaira–Parshin families | 0 | 8 |
| LV.11 | Faltings's theorem after Lawrence and Venkatesh | 0 | 6 |

Order of work: LV.0, LV.1, LV.2 and LV.5 have no dependencies inside the roadmap; LV.3 needs LV.0 and LV.2; LV.4 needs LV.0–LV.3; LV.6 needs LV.0–LV.5; LV.7 needs LV.0–LV.4; LV.8 needs LV.0, LV.2 and LV.5; LV.9 needs LV.0 and LV.5; LV.10 needs LV.0, LV.3, LV.5, LV.8 and LV.9; LV.11 needs LV.0–LV.2, LV.7, LV.8 and LV.10.

## Layer LV.0: Semilinear centralizers, the affine group Aff(q) and symplectic monodromy lemmas

This layer collects the linear algebra and finite group theory that the argument uses in several places: the dimension of the centralizer of a semilinear automorphism (the source of the whole method's Frobenius bound), the affine group $\mathrm{Aff}(q)$ and the counting behind the size bound, and the generation and Goursat lemmas that turn Dehn twists into Zariski-dense monodromy. Everything is stated over general fields where the proof allows it; the symplectic lemmas are over fields of characteristic zero.

### LV.0.A Objects

#### The centralizer of a semilinear automorphism

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/LinearAlgebra/SemilinearCentralizer`, namespace `TauCeti.LawrenceVenkatesh`.

Let σ be a field automorphism of E and φ : V → V a σ-semilinear bijection of a finite-dimensional E-vector space (φ(ev) = σ(e)φ(v)). The centralizer Z(φ) := {f ∈ End_E(V) : f ∘ φ = φ ∘ f}. It is a subalgebra of End_E(V) over the fixed field F = E^σ (not an E-subspace in general), and its unit group Z(φ)^× = Z(φ) ∩ GL_E(V) is the group of E-linear automorphisms commuting with φ.

**Construction.**

- Define Z(φ) as the kernel of the F-linear map End_E(V) → End(V), f ↦ fφ − φf; check that fφ − φf is additive and that for c ∈ F, (cf)φ = c(fφ) since σ(c) = c.
- Closure under composition and identity is immediate, so Z(φ) is an F-subalgebra.

**Declarations and API.**

- `semilinearCentralizer` (constructor): Z(φ) as an F-subalgebra of End_E(V), F = fixedField σ.
- `mem_semilinearCentralizer` (characterisation): f ∈ Z(φ) ↔ f ∘ φ = φ ∘ f.
- `semilinearCentralizer_le_pow` (relation): Z(φ) ⊆ Z(φ^n) for every n ≥ 1 (φ^n is σ^n-semilinear).
- `units_semilinearCentralizer` (characterisation): Z(φ)^× = {g ∈ GL_E(V) : gφ = φg}; it acts on subspaces of V and on filtrations preserving the φ-stable structure.
- `semilinearCentralizer_linear` (compatibility): When σ = id, Z(φ) is the usual centralizer of the linear map φ (Mathlib Subalgebra.centralizer).
- `semilinearCentralizer_conj` (functoriality): For an E-linear iso u : V ≅ W, u Z(φ) u⁻¹ = Z(uφu⁻¹).
- `semilinearCentralizer_scalar` (example): If φ = σ ⊗ 1 on E ⊗_F V₀ then Z(φ) = End_F(V₀) ⊗ 1.

**Uses.** `mathlib:LinearMap.transvection`.

**Tests.**

- Z(id_V) = End_E(V) when σ = id.
- For E = ℚ_{p²}, φ = σ ⊕ σ on E², Z(φ) = M_2(ℚ_p).

#### The affine group Aff(q) of a prime field

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/GroupTheory/AffineGroup`, namespace `TauCeti.LawrenceVenkatesh.AffineGroup`.

For a prime q ≥ 3, Aff(q) is the subgroup of Sym(𝔽_q) consisting of the permutations x ↦ ax + b with a ∈ 𝔽_q^×, b ∈ 𝔽_q. It is isomorphic to the semidirect product 𝔽_q^+ ⋊ 𝔽_q^×; λ : Aff(q) → 𝔽_q^×, (x ↦ ax+b) ↦ a, is a surjective homomorphism with kernel the translations 𝔽_q^+; H_q = 𝔽_q^× (the maps x ↦ ax) is the stabilizer of 0.

**Construction.**

- Define Aff(q) as the image of the injective homomorphism 𝔽_q^+ ⋊ 𝔽_q^× → Sym(𝔽_q), (b, a) ↦ (x ↦ ax + b).
- λ is the projection to 𝔽_q^×; its kernel is the image of 𝔽_q^+.
- The stabilizer of 0 consists of the maps with b = 0.

**Declarations and API.**

- `affineGroup` (constructor): Aff(q) as a subgroup of Equiv.Perm (ZMod q).
- `affineGroup.mk` (constructor): For a ∈ (ZMod q)ˣ and b ∈ ZMod q, the element x ↦ ax + b; mk a b = mk a' b' ↔ a = a' ∧ b = b'.
- `affineGroup.mulEquivSemidirect` (equivalence): Aff(q) ≃* Multiplicative (ZMod q) ⋊ (ZMod q)ˣ with the scaling action.
- `affineGroup.linearPart` (data): The surjective homomorphism λ : Aff(q) →* (ZMod q)ˣ, λ(mk a b) = a.
- `affineGroup.ker_linearPart` (characterisation): ker λ = the translations {mk 1 b}, a normal subgroup isomorphic to ZMod q.
- `affineGroup.mk_mul_mk` (simp): mk a b * mk a' b' = mk (a a') (a b' + b); (mk a b)⁻¹ = mk a⁻¹ (−a⁻¹ b).
- `affineGroup.card` (other): |Aff(q)| = q(q − 1).
- `affineGroup.stabilizer_zero` (characterisation): The stabilizer of 0 is H_q = {mk a 0} ≃* (ZMod q)ˣ; its index is q and Aff(q) acts on 𝔽_q ≅ Aff(q)/H_q.
- `affineGroup.commutator_eq` (relation): [mk a b, mk a' b'] = mk 1 (b(1 − a') − b'(1 − a)); the commutator subgroup is the translation subgroup.
- `affineGroup.isPretransitive` (instance): Aff(q) acts sharply 2-transitively on 𝔽_q.
- `affineGroup.example_three` (example): Aff(3) = Equiv.Perm (ZMod 3).

**Uses.** `mathlib:ZMod.card_units_eq_totient`.

**Tests.**

- Aff(3) ≅ S_3 = Sym(𝔽_3).
- |Aff(5)| = 20 and Aff(5) is the Frobenius group F₂₀.

#### Symplectic transvections

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/LinearAlgebra/SymplecticTransvection`, namespace `TauCeti.LawrenceVenkatesh`.

Let (V, ω) be a finite-dimensional symplectic space over a field k of characteristic zero (ω nondegenerate alternating, written ⟨·,·⟩). For v ∈ V and r ∈ k, T_v^r : V → V is x ↦ x + r⟨v, x⟩v, and T_v := T_v^1. It is the Mathlib transvection with linear form r⟨v, ·⟩ and vector v (the form vanishes on v).

**Construction.**

- Define T_v^r := LinearMap.transvection (r·⟨v, ·⟩) v; since ⟨v, v⟩ = 0 it is invertible with inverse T_v^{−r}.
- Check ⟨T_v^r x, T_v^r y⟩ = ⟨x, y⟩ using bilinearity and ⟨v, v⟩ = 0.

**Declarations and API.**

- `symplecticTransvection` (constructor): T_v^r ∈ Sp(V, ω) (as an element of TauCeti.BilinForm.isometryGroup ω).
- `symplecticTransvection_apply` (simp): T_v^r x = x + r⟨v, x⟩ v.
- `symplecticTransvection_add` (relation): T_v^r T_v^s = T_v^{r+s}; T_v^0 = 1; (T_v^r)⁻¹ = T_v^{−r}.
- `symplecticTransvection_smul` (relation): T_{cv}^r = T_v^{c² r}.
- `conj_symplecticTransvection` (functoriality): g T_v^r g⁻¹ = T_{gv}^r for g ∈ Sp(V, ω).
- `isUnipotent_symplecticTransvection` (other): T_v^r is unipotent: (T_v^r − 1)² = 0.
- `fixedPoints_symplecticTransvection` (characterisation): For v ≠ 0 and r ≠ 0 the fixed space of T_v^r is v^⊥, of codimension 1, and the image of T_v^r − 1 is k·v.
- `eq_symplecticTransvection_of_codim_one` (characterisation): A unipotent element of Sp(V, ω) whose fixed space has codimension 1 equals T_v^r for some v ≠ 0, r ≠ 0.
- `symplecticTransvection_eq_transvection` (compatibility): T_v^r = LinearMap.transvection (r • ω v) v.
- `symplecticTransvection_sl2` (example): On (k², det) the transvections T_e^r, T_f^r are the elementary matrices of SL(2, k).

**Uses.** `mathlib:LinearMap.transvection`; `tauceti:TauCeti.BilinForm.isometryGroup`.

**Tests.**

- In the basis (e, f) of k² with ⟨e, f⟩ = 1, T_e^r = [[1, r], [0, 1]] and T_f^r = [[1, 0], [−r, 1]].
- T_0^r = id.

### LV.0.B Theorems

#### Splitting of a finite separable extension after base change to a splitting field

*Lemma* `TauCeti.LawrenceVenkatesh.galois_tensor_splitting` — module `TauCeti/NumberTheory/LawrenceVenkatesh/LinearAlgebra/GaloisSplitting`.

Let E/F be a finite separable field extension and Ω a field containing F over which the minimal polynomial of a primitive element of E splits (for instance an algebraically closed field containing F). Let Σ = Hom_F(E, Ω). The Ω-algebra map E ⊗_F Ω → Ω^Σ, e ⊗ x ↦ (τ(e)x)_{τ∈Σ}, is an isomorphism. Consequently every E ⊗_F Ω-module M decomposes as M = ⊕_{τ∈Σ} M^τ, where M^τ = {m : (e ⊗ 1)m = (1 ⊗ τ(e))m for all e ∈ E}, and the projections are given by the primitive idempotents.

**Proof.**

- Choose a primitive element α with E = F(α) (primitive element theorem) and let f be its minimal polynomial, which is separable.
- E ⊗_F Ω ≅ Ω[X]/(f); since f splits over Ω into the distinct linear factors X − τ(α), τ ∈ Σ, the ideals (X − τ(α)) are pairwise coprime and the Chinese remainder theorem gives Ω[X]/(f) ≅ ∏_τ Ω[X]/(X − τ(α)) ≅ Ω^Σ.
- Trace the composite on e ⊗ x to identify it with e ⊗ x ↦ (τ(e)x)_τ.
- The primitive idempotents of Ω^Σ act on any module and cut out the eigen-decomposition M = ⊕ M^τ.

**Uses.** `mathlib:Field.exists_primitive_element`; `mathlib:Ideal.quotientInfRingEquivPiQuotient`.

**Tests.**

- For E = ℚ(i), F = ℚ, Ω = ℂ: ℚ(i) ⊗ ℂ ≅ ℂ × ℂ via i ↦ (i, −i).
- The decomposition is functorial in M and compatible with tensor products.

#### Dimension of the centralizer of a semilinear automorphism (LV Lemma 2.1)

*Theorem* `TauCeti.LawrenceVenkatesh.semilinear_centralizer_finrank` — module `TauCeti/NumberTheory/LawrenceVenkatesh/LinearAlgebra/SemilinearCentralizer`.

Let σ be an automorphism of the field E of finite order e with fixed field F, V an E-vector space of dimension d and φ a σ-semilinear bijection of V. Then dim_F Z(φ) = dim_E Z(φ^e), where φ^e is E-linear; in particular dim_F Z(φ) ≤ d².

**Proof.**

- By Artin's theorem E/F is Galois with group ⟨σ⟩ of order e.
- Let F̄ be an algebraic closure of F and Σ = Hom_F(E, F̄); by the splitting lemma V̄ = V ⊗_F F̄ = ⊕_{τ∈Σ} V̄^τ.
- φ̄ = φ ⊗ 1 is F̄-linear and maps V̄^τ onto V̄^{τσ^{-1}}; the orbits of σ on Σ form one cycle τ₀, τ₀σ^{-1}, …, τ₀σ^{-(e−1)}.
- Z(φ) ⊗_F F̄ is the centralizer of φ̄ inside End_{E⊗F̄}(V̄) (kernels commute with the flat base change F → F̄); an element (f_τ) of it is determined by f_{τ₀}, which commutes with φ̄^e|V̄^{τ₀}, and every such f_{τ₀} extends uniquely by f_{τ₀σ^{-i}} = φ̄^i f_{τ₀} φ̄^{-i}. Hence Z(φ) ⊗ F̄ ≅ centralizer of φ̄^e on V̄^{τ₀}.
- (V̄^{τ₀}, φ̄^e) is the base change of (V, φ^e) along τ₀ : E → F̄, so its centralizer has F̄-dimension dim_E Z(φ^e).
- Compare dimensions using invariance of dimension under base change; the bound follows from Z(φ^e) ⊆ End_E(V).

**Uses.** Splitting of a finite separable extension after base change to a splitting field (`LV.0/galois-tensor-splitting`); The centralizer of a semilinear automorphism (`LV.0/semilinear-centralizer`); `mathlib:IsGalois.of_fixed_field`; `mathlib:FixedPoints.finrank_eq_card`; `mathlib:Module.finrank_baseChange`.

**Tests.**

- E = ℚ_{p²}, F = ℚ_p, φ = σ ⊕ σ on E²: both sides equal 4.
- If φ^e is a scalar then dim_F Z(φ) = d².
- If φ^e has distinct eigenvalues in E then dim_F Z(φ) ≤ d.

#### Frobenius centralizers over unramified extensions of a p-adic field

*Lemma* `TauCeti.LawrenceVenkatesh.semilinear_centralizer_unramified` — module `TauCeti/NumberTheory/LawrenceVenkatesh/LinearAlgebra/SemilinearCentralizer`.

Let K_v/ℚ_p be finite unramified of degree f_v, L/K_v finite unramified of degree r, and σ_L the arithmetic Frobenius of L over ℚ_p. Let V be an L-vector space of dimension n and φ a σ_L-semilinear bijection. Then Z(φ) ⊆ Z(φ^{f_v}); the latter is a K_v-subalgebra of End_L(V) with dim_{K_v} Z(φ^{f_v}) = dim_L Z(φ^{f_v r}) ≤ n²; its unit group is the group of K_v-points of the K_v-group scheme of units of this K_v-algebra, a smooth connected affine group of dimension dim_{K_v} Z(φ^{f_v}).

**Proof.**

- σ_L^{f_v} generates Gal(L/K_v), which is cyclic of order r with fixed field K_v (unramified extensions of local fields are Galois with Frobenius generator).
- φ^{f_v} is σ_L^{f_v}-semilinear; apply the dimension formula for semilinear centralizers with e = r.
- Z(φ) ⊆ Z(φ^{f_v}) is the power relation of the centralizer API.
- The unit group of a finite-dimensional K_v-algebra A is represented by the open subscheme of the affine space of A where the norm is invertible; it is smooth and connected of dimension dim A.

**Uses.** Dimension of the centralizer of a semilinear automorphism (LV Lemma 2.1) (`LV.0/semilinear-centralizer-finrank`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius — LocalFieldsRamification Layer 2 (unramified extensions and Frobenius).

**Tests.**

- K_v = ℚ_p, L = ℚ_{p^r}, V = L with φ = σ_L: Z(φ) = ℚ_p and Z(φ^{1}) = ℚ_p has dimension 1 = dim_L Z(φ^r).
- The bound dim ≤ 4d² for n = 2d used in LV Lemma 6.2.

#### Cycle types of elements of Aff(q)

*Lemma* `TauCeti.LawrenceVenkatesh.affine_group_cycle_type` — module `TauCeti/NumberTheory/LawrenceVenkatesh/GroupTheory/AffineGroup`.

Let q ≥ 3 be prime and g = (x ↦ ax + b) ∈ Aff(q). If a ≠ 1, then g has exactly one fixed point and all its other cycles have length ord(a), the order of a in 𝔽_q^×. If a = 1 and b ≠ 0, g is a q-cycle. If g = 1 all cycles are fixed points. In particular the cycle type of g in Sym(𝔽_q) determines whether λ(g) = 1, and when λ(g) ≠ 1 it determines ord(λ(g)).

**Proof.**

- If a ≠ 1, conjugating by the translation moving the unique fixed point b/(1 − a) to 0 turns g into x ↦ ax, whose nonzero orbits are cosets of ⟨a⟩ in 𝔽_q^×.
- If a = 1, b ≠ 0, the orbit of any x is x + 𝔽_q b = 𝔽_q since q is prime.

**Uses.** The affine group Aff(q) of a prime field (`LV.0/affine-group`).

**Tests.**

- In Aff(5), x ↦ 2x + 1 has cycle type (1, 4); x ↦ 4x has cycle type (1, 2, 2); x ↦ x + 1 is a 5-cycle.

#### Aff(q) is centre-free, has trivial centralizer and is self-normalizing in Sym(𝔽_q)

*Lemma* `TauCeti.LawrenceVenkatesh.affine_group_centralizer` — module `TauCeti/NumberTheory/LawrenceVenkatesh/GroupTheory/AffineGroup`.

For a prime q ≥ 3: (a) the centralizer of Aff(q) in Sym(𝔽_q) is trivial; in particular Aff(q) has trivial centre; (b) the normalizer of Aff(q) in Sym(𝔽_q) is Aff(q). Consequently, for a group Γ, two surjections Γ → Aff(q) are conjugate under Sym(𝔽_q) (as transitive actions on 𝔽_q with image Aff(q)) if and only if they are conjugate under Aff(q), and a surjection Γ → Aff(q) has trivial stabilizer under conjugation by Aff(q).

**Proof.**

- (a) A permutation c commuting with all translations satisfies c(x + 1) = c(x) + 1, so c is a translation x ↦ x + t; commuting with x ↦ ax (a ≠ 1) forces at = t, so t = 0.
- (b) If s ∈ Sym(𝔽_q) normalizes Aff(q), it normalizes the unique Sylow q-subgroup 𝔽_q^+ (normal, of index q − 1 prime to q); after composing with a translation s fixes 0 and normalizes ⟨x ↦ x+1⟩, so s(x + 1) = s(x) + c for some c ≠ 0, whence s(x) = cx ∈ Aff(q).
- The consequences follow: a Sym-conjugacy between two surjections is given by an element normalizing Aff(q); the stabilizer of a surjection φ under conjugation is the centralizer of φ(Γ) = Aff(q), which is trivial.

**Uses.** The affine group Aff(q) of a prime field (`LV.0/affine-group`).

**Tests.**

- Aff(3) = S_3 is self-normalizing and centre-free.
- The translation subgroup of Aff(q) has nontrivial centralizer (itself), so surjectivity is needed.

#### The commutator-product map on Aff(q)^{2s} (LV Lemma 2.11)

*Theorem* `TauCeti.LawrenceVenkatesh.commutator_product_map` — module `TauCeti/NumberTheory/LawrenceVenkatesh/GroupTheory/AffineGroup`.

Let q ≥ 3 be prime, s ≥ 1 and f : Aff(q)^{2s} → 𝔽_q^+, f(g₁, g₁', …, g_s, g_s') = [g₁, g₁'] ⋯ [g_s, g_s'] (with [x, y] = xyx⁻¹y⁻¹). Let Λ : Aff(q)^{2s} → (𝔽_q^×)^{2s} apply λ componentwise. Then: (a) if f(g) ≠ 0, then g generates Aff(q) if and only if the entries of Λ(g) generate 𝔽_q^×, and in that case g generates Aff(q); (b) the image of {g : f(g) ≠ 0, g generates Aff(q)} under Λ is exactly the set of 2s-tuples whose entries generate 𝔽_q^×; (c) every fibre of this restricted map over a point of its image has exactly q^{2s−1}(q − 1) elements.

**Proof.**

- Write g_i = mk(y_i, b_i), g_i' = mk(y_i', b_i'); by the commutator formula f(g) = Σ_i (b_i(1 − y_i') − b_i'(1 − y_i)), an affine-linear function of b = (b_i, b_i') ∈ 𝔽_q^{2s} for fixed y.
- If the y's generate 𝔽_q^× then some y_i or y_i' differs from 1 (q ≥ 3), so f is a nonconstant affine-linear function on the fibre 𝔽_q^{2s}; exactly q^{2s} − q^{2s−1} points have f ≠ 0.
- If f(g) ≠ 0, the subgroup ⟨g⟩ contains a nonzero translation, hence all of 𝔽_q^+ (prime order), and ⟨g⟩ = Aff(q) iff its image λ(⟨g⟩) = ⟨y⟩ is 𝔽_q^×.
- Conversely a generating tuple has generating image under the surjection λ. Combine.

**Uses.** The affine group Aff(q) of a prime field (`LV.0/affine-group`).

**Tests.**

- q = 3, s = 1: the image consists of the 3 pairs in {±1}² generating {±1}, each fibre has 3·2 = 6 elements, giving the 18 generating pairs of S_3 (all with nonzero commutator).
- q = 3, s = 2: 15 · 54 = 810 tuples, giving 135 conjugacy classes.

#### Counting generating tuples of ℤ/N

*Lemma* `TauCeti.LawrenceVenkatesh.generating_tuples_card` — module `TauCeti/NumberTheory/LawrenceVenkatesh/GroupTheory/GeneratingTuples`.

For integers N ≥ 1 and k ≥ 2, the number of k-tuples (y₁, …, y_k) ∈ (ℤ/N)^k whose entries generate ℤ/N as a group is J_k(N) = N^k ∏_{ℓ | N prime} (1 − ℓ^{−k}), and J_k(N) ≥ N^k/2.

**Proof.**

- A tuple generates ℤ/N iff for every prime ℓ | N not all entries lie in ℓℤ/N (the maximal subgroups of ℤ/N are the ℓℤ/N).
- By the Chinese remainder theorem the count is multiplicative in N; for N = ℓ^a the non-generating tuples are those in (ℓℤ/ℓ^a)^k, of which there are ℓ^{(a−1)k}, giving ℓ^{ak}(1 − ℓ^{−k}).
- ∏_ℓ (1 − ℓ^{−k}) ≥ ∏_ℓ (1 − ℓ^{−2}) ≥ 1 − Σ_ℓ ℓ^{−2}.
- Σ_{ℓ prime} ℓ^{−2} ≤ 1/4 + Σ_{j≥1} (2j+1)^{−2} < 1/4 + Σ_{j≥1} 1/(4j(j+1)) = 1/2, since (2j+1)² > 4j(j+1).

**Uses.** `mathlib:Ideal.quotientInfRingEquivPiQuotient`; `mathlib:ZMod.card_units_eq_totient`.

**Tests.**

- N = 6, k = 2: J₂(6) = 36 · (3/4) · (8/9) = 24 ≥ 18.
- N prime: J_k(N) = N^k − 1.

#### Isotropic subgroups for a perfect pairing on a finite abelian group

*Lemma* `TauCeti.LawrenceVenkatesh.isotropic_subgroup_card` — module `TauCeti/NumberTheory/LawrenceVenkatesh/GroupTheory/IsotropicBound`.

Let A be a finite abelian group and ⟨·,·⟩ : A × A → ℚ/ℤ a biadditive pairing that is perfect in the sense that a ↦ ⟨·, a⟩ is a bijection from A to its character module Hom(A, ℚ/ℤ). If B ≤ A satisfies ⟨B, B⟩ = 0 then |B|² ≤ |A|. No symmetry of the pairing is assumed. (A pairing with values in ℤ/N ⊂ ℚ/ℤ, or in a cyclic group μ_N^∨ ≅ ℤ/N after a choice of generator, is a special case.)

**Proof.**

- B^⊥ := {a : ⟨b, a⟩ = 0 for all b ∈ B} contains B by isotropy.
- The composite A → Hom(A, ℚ/ℤ) → Hom(B, ℚ/ℤ) is surjective: the first map is bijective and restriction of ℚ/ℤ-valued characters along the injection B ↪ A is surjective.
- Its kernel is B^⊥, so |B^⊥| = |A| / |Hom(B, ℚ/ℤ)|; and |Hom(B, ℚ/ℤ)| = |B| because ℚ/ℤ-valued characters of the finite group B are the same as ℂ-valued ones (t ↦ exp(2πit) identifies ℚ/ℤ with the roots of unity in ℂ^×) and there are |B| of those.
- Hence |B| ≤ |B^⊥| = |A|/|B|.

**Uses.** `mathlib:CharacterModule`; `mathlib:CharacterModule.dual_surjective_of_injective`; `mathlib:AddChar.card_eq`.

**Tests.**

- A = (ℤ/N)² with the determinant pairing: a cyclic subgroup of order N is isotropic and |B|² = |A|.
- The symmetric case agrees with Tau Ceti's IsNondegenerate.card_orthogonalQuotient_mul_card_sq.

#### Minimal subrepresentations of a representation with an invariant form up to similitude

*Lemma* `TauCeti.LawrenceVenkatesh.minimal_subrepresentation_half` — module `TauCeti/NumberTheory/LawrenceVenkatesh/RepresentationTheory/MinimalSubrepresentation`.

Let G be a group, k a field, V a finite-dimensional k-linear representation of G and B a nondegenerate bilinear form on V that is symmetric or alternating, with B(gx, gy) = χ(g)B(x, y) for a character χ : G → k^×. If V is not irreducible and W ⊆ V is a nonzero subrepresentation of minimal dimension, then dim W ≤ dim V / 2.

**Proof.**

- W^⊥ is a subrepresentation because G preserves B up to scalars, and so is W ∩ W^⊥.
- By minimality W ∩ W^⊥ is 0 or W.
- If W ⊆ W^⊥ then dim W ≤ dim V − dim W.
- If W ∩ W^⊥ = 0 then W^⊥ is a nonzero subrepresentation of dimension dim V − dim W (V ≠ W since V is reducible), so by minimality dim W ≤ dim W^⊥ = dim V − dim W.

**Uses.** `mathlib:LinearMap.BilinForm.finrank_orthogonal`.

**Tests.**

- V = V₁ ⊕ V₂ orthogonal with dim V₁ = 1, dim V₂ = 3: the minimal W has dim 1 ≤ 2.
- The Tate module of an abelian variety with the Weil pairing (χ the cyclotomic character).

#### The Zariski closure of the powers of a transvection

*Lemma* `TauCeti.LawrenceVenkatesh.zariski_closure_transvection_powers` — module `TauCeti/NumberTheory/LawrenceVenkatesh/LinearAlgebra/SymplecticTransvection`.

Let (V, ω) be symplectic over a field k of characteristic zero and v ∈ V nonzero. The Zariski closure in Sp(V) of the cyclic group {T_v^n : n ∈ ℤ} is the one-parameter unipotent subgroup U_v = {T_v^r : r ∈ k}, the image of the closed immersion 𝔾_a → Sp(V), r ↦ T_v^r. More generally the Zariski closure of {T_v^{nr₀} : n ∈ ℤ} is U_v for every r₀ ≠ 0.

**Proof.**

- r ↦ T_v^r is a homomorphism 𝔾_a → Sp(V) and a closed immersion (its coordinate functions include r·(a linear form) with nonzero coefficient).
- The image of ℤ r₀ is an infinite subset of 𝔾_a(k) = k because char k = 0; an infinite subset of the affine line is Zariski dense.
- The Zariski closure of the image equals the image of the closure under a closed immersion.

**Uses.** Symplectic transvections (`LV.0/symplectic-transvection`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components).

**Tests.**

- V = k², v = e: the closure of {[[1, n], [0, 1]]} is the upper unipotent subgroup.
- In characteristic p the closure of ℤ is finite; the hypothesis char k = 0 is needed.

#### Two transvections with nonzero pairing (LV Lemma 2.13)

*Lemma* `TauCeti.LawrenceVenkatesh.transvection_pair_closure` — module `TauCeti/NumberTheory/LawrenceVenkatesh/LinearAlgebra/SymplecticTransvection`.

Let (V, ω) be symplectic over a field k of characteristic zero and v₁, v₂ ∈ V linearly independent with ⟨v₁, v₂⟩ ≠ 0. The Zariski closure of the subgroup generated by T_{v₁} and T_{v₂} contains T_v^r for every v ∈ span(v₁, v₂) and every r ∈ k; in fact it contains the subgroup Sp(P) × 1 of Sp(V) for P = span(v₁, v₂), acting trivially on P^⊥.

**Proof.**

- P = span(v₁, v₂) is a nondegenerate plane, V = P ⊕ P^⊥, and T_{v₁}, T_{v₂} act trivially on P^⊥.
- The closure contains U_{v₁} and U_{v₂} (Zariski closure of transvection powers).
- In the basis (v₁, v₂/⟨v₁,v₂⟩) of P, U_{v₁} and U_{v₂} are the upper and lower elementary unipotent subgroups of SL(P) = Sp(P); every element of SL(2, k) is a product of elementary transvections, so the closure contains SL(P) × 1.
- For v ∈ P, T_v^r restricted to P lies in Sp(P) and is the identity on P^⊥.

**Uses.** The Zariski closure of the powers of a transvection (`LV.0/zariski-closure-transvection-powers`); `mathlib:Matrix.SL2.transvection_induction`; `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components).

**Tests.**

- V = k², v₁ = e, v₂ = f: the closure of ⟨[[1,1],[0,1]], [[1,0],[−1,1]]⟩ (a finite-index subgroup of SL₂(ℤ)) is SL₂.
- If ⟨v₁, v₂⟩ = 0 the two transvections commute and the closure is two-dimensional unipotent.

#### Transvections along a connected intersection graph (LV Lemma 2.14)

*Lemma* `TauCeti.LawrenceVenkatesh.transvection_graph_closure` — module `TauCeti/NumberTheory/LawrenceVenkatesh/LinearAlgebra/SymplecticTransvection`.

Let (V, ω) be symplectic over a field k of characteristic zero and S ⊆ V a finite set of vectors. Form the graph on S with an edge between v, v' when ⟨v, v'⟩ ≠ 0. If this graph is connected then the Zariski closure of the subgroup generated by {T_v : v ∈ S} contains T_w for every w in the span of S. If moreover S spans V, the closure is Sp(V).

**Proof.**

- Induct on |S|: remove a vertex v whose deletion leaves S₀ connected (a leaf of a spanning tree); by induction the closure G contains T_w for all w ∈ W = span(S₀).
- For w ∈ W with ⟨w, v⟩ ≠ 0, the transvection-pair lemma applied to T_w, T_v (both in G) gives T_x ∈ G for x = w + v, and T_{cx} for all c.
- The set {w ∈ W : ⟨w, v⟩ ≠ 0} is a nonempty Zariski-open subset of W (nonempty since v has a neighbour in S₀), so {T_{w+v}} is dense in {T_{w+v} : w ∈ W} and the closedness of G gives all T_x for x ∈ W + kv.
- If S spans V, the transvections generate Sp(V) as an abstract group, so the closure is Sp(V).

**Uses.** Two transvections with nonzero pairing (LV Lemma 2.13) (`LV.0/transvection-pair-closure`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** The last sentence (generation of Sp(V) by transvections when S spans) is the form used in LV Lemma 8.9; generation of Sp(V) by symplectic transvections is requested from ReductiveGroups Layer 7 together with the other structure of Sp. Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components).

**Tests.**

- A symplectic basis e₁, f₁, e₂, f₂ is not connected; adding e₁ + e₂ connects it.
- For S a chain of vanishing cycles the closure is Sp(span S).

#### Goursat's lemma for simple Lie algebras (Ribet)

*Lemma* `TauCeti.LawrenceVenkatesh.lie_algebra_goursat` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Algebra/Lie/Goursat`.

Let 𝔤₁, …, 𝔤_N be simple Lie algebras over a field k and 𝔥 ⊆ 𝔤₁ × ⋯ × 𝔤_N a Lie subalgebra whose projection to 𝔤_i × 𝔤_j is surjective for every pair i < j (and to each 𝔤_i when N = 1). Then 𝔥 = 𝔤₁ × ⋯ × 𝔤_N.

**Proof.**

- Induct on N; the case N = 1 is the hypothesis. Assume 𝔥 surjects onto 𝔤₁ × ⋯ × 𝔤_{N−1} by induction (the pairwise hypothesis passes to sub-products).
- The kernel 𝔫 of the projection 𝔥 → 𝔤₁ × ⋯ × 𝔤_{N−1} is an ideal of 𝔥 contained in 𝔤_N; its image is an ideal of 𝔤_N because 𝔥 → 𝔤_N is surjective. If 𝔫 = 𝔤_N we are done.
- Otherwise 𝔫 = 0 by simplicity and 𝔥 is the graph of a surjective Lie homomorphism θ : 𝔤₁ × ⋯ × 𝔤_{N−1} → 𝔤_N; its kernel is an ideal, hence a product of all but one factor 𝔤_i (the ideals of a product of simple algebras are sub-products), so θ factors through a single 𝔤_i and the projection of 𝔥 to 𝔤_i × 𝔤_N is a graph, contradicting surjectivity.

**Uses.** `mathlib:LieAlgebra.IsSimple`.

**Tests.**

- 𝔤 × 𝔤 with the diagonal: not surjective onto the pair, and indeed a proper subalgebra.
- N = 3 with 𝔥 = {(x, y, x)}: fails the hypothesis for the pair (1, 3).

#### A closed subgroup of Sp(V) × Sp(V) with surjective projections and an unbalanced unipotent pair

*Lemma* `TauCeti.LawrenceVenkatesh.symplectic_pair_lemma` — module `TauCeti/NumberTheory/LawrenceVenkatesh/LinearAlgebra/SymplecticGoursat`.

Let k be an algebraically closed field of characteristic zero, (V, ω) symplectic of dimension ≥ 2 and G ⊆ Sp(V) × Sp(V) a Zariski-closed subgroup whose projections π₁, π₂ to both factors are surjective. If some g ∈ G has π₁(g), π₂(g) unipotent with fixed spaces of different dimensions, then Lie(G) = 𝔰𝔭(V) × 𝔰𝔭(V) and G = Sp(V) × Sp(V).

**Proof.**

- Lie(G) ⊆ 𝔰𝔭(V) × 𝔰𝔭(V) projects onto both factors (surjective homomorphisms of smooth groups in characteristic zero are surjective on Lie algebras).
- By Goursat for the simple Lie algebra 𝔰𝔭(V), either Lie(G) is the whole product (then G° = Sp(V)² since Sp(V) is connected, so G = Sp(V)²), or Lie(G) is the graph of an automorphism θ of 𝔰𝔭(V).
- In the second case θ = Ad(h) for some h ∈ Sp(V)(k) (automorphisms of 𝔰𝔭(V) over an algebraically closed field are inner), and G° is the graph {(x, hxh^{-1})} (connected subgroups are determined by their Lie algebras in characteristic zero).
- Every (a, b) ∈ G normalizes G°, so a⁻¹h⁻¹bh centralizes Sp(V) and b = ±hah⁻¹ (centre {±1}).
- Apply this to g: π₂(g) = ±hπ₁(g)h⁻¹; a unipotent element is not the negative of a unipotent element in characteristic zero, so π₂(g) = hπ₁(g)h⁻¹ has a fixed space of the same dimension — a contradiction.

**Uses.** Goursat's lemma for simple Lie algebras (Ribet) (`LV.0/lie-algebra-goursat`); `tauceti:TauCeti.Symplectic.geometricallyConnectedCommHopfAlgProperty_coordinateHopfAlgebra`; `tauceti:LinearMap.GeneralLinearGroup.IsUnipotent`; `mathlib:LieAlgebra.Symplectic.sp`; `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation — ReductiveGroups Layer 2 (Lie algebras of algebraic groups); tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components); tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups — ReductiveGroups Layer 6 (reductive and semisimple groups, centres); tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory — ReductiveGroups Layer 7 (structure theory).

**Tests.**

- The diagonal subgroup satisfies the projection hypothesis but has no unbalanced pair.
- For V = k² with g = (u, 1), u a nontrivial transvection, the lemma gives SL₂ × SL₂.

#### Zariski-closed subgroups of Sp(V)^N (LV Lemma 2.12)

*Theorem* `TauCeti.LawrenceVenkatesh.symplectic_goursat` — module `TauCeti/NumberTheory/LawrenceVenkatesh/LinearAlgebra/SymplecticGoursat`.

Let k be a field of characteristic zero, (V, ω) a symplectic space of dimension ≥ 2 and G ⊆ Sp(V)^N a Zariski-closed subgroup such that (i) each projection π_i : G → Sp(V) is surjective and (ii) for all i ≠ j there is g ∈ G with π_i(g), π_j(g) unipotent with fixed spaces of different dimensions. Then G = Sp(V)^N.

**Proof.**

- Base change to an algebraic closure k̄: the hypotheses persist (surjectivity and closedness are geometric; the elements g are k-points) and G = Sp(V)^N can be checked over k̄.
- For each pair i < j apply the pair lemma to the image of G in Sp(V) × Sp(V) (closed, as the image of a homomorphism of algebraic groups): Lie of that image is 𝔰𝔭(V)².
- Hence Lie(G) ⊆ 𝔰𝔭(V)^N surjects onto every pair of factors; by the Lie-algebra Goursat lemma Lie(G) = 𝔰𝔭(V)^N.
- G° is a connected closed subgroup of the connected group Sp(V)^N with the same Lie algebra, hence G° = Sp(V)^N and G = Sp(V)^N.

**Uses.** A closed subgroup of Sp(V) × Sp(V) with surjective projections and an unbalanced unipotent pair (`LV.0/symplectic-pair-lemma`); Goursat's lemma for simple Lie algebras (Ribet) (`LV.0/lie-algebra-goursat`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation — ReductiveGroups Layer 2 (Lie algebras of algebraic groups); tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components).

**Tests.**

- N = 1: the statement reduces to hypothesis (i).
- The variant in LV Lemma 4.3: SL₂ = Sp₂, and an element (1, …, u, …, 1) with u a nontrivial unipotent gives the unbalanced pairs.

### LV.0.C Dependencies

Within this roadmap: none.

Other roadmaps:

- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius` (Layer 2: unramified extensions and Frobenius). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: A finite unramified extension L/K of p-adic fields is cyclic Galois of degree f(L/K), generated by the arithmetic Frobenius, and the arithmetic Frobenius of L over ℚ_p restricts on L to a generator whose f(K/ℚ_p)-th power generates Gal(L/K).
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components` (Layer 3: subgroups, quotients, components). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For an affine algebraic group G over a field k and an abstract subgroup Γ ⊆ G(k): the Zariski closure of Γ, the smallest closed subgroup scheme whose k-points contain Γ (reduced, with Γ Zariski dense in it); its formation commutes with field extension; a finite-index subgroup of Γ has closure with the same identity component; the closure of the image of Γ under a homomorphism of algebraic groups is the image of the closure; subgroups normalizing Γ normalize its closure; in characteristic zero an infinite subgroup of 𝔾_a(k) is Zariski dense; images of homomorphisms of algebraic groups are closed.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation` (Layer 2: Lie algebra and the adjoint representation). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: In characteristic zero: the Lie algebra of a closed subgroup of GL(V) as a Lie subalgebra of gl(V); a connected closed subgroup is determined by its Lie algebra (H ⊆ G connected with Lie H = Lie G implies H = G); a surjective homomorphism of smooth algebraic groups is surjective on Lie algebras; Lie of a product is the product of the Lie algebras.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups` (Layer 6: reductive and semisimple groups). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For a symplectic space (V, ω) of dimension ≥ 2 over an algebraically closed field of characteristic zero: Sp(V) is connected, its centre is {±1}, and every closed normal subgroup of Sp(V) is either Sp(V) or contained in {±1}.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory` (Layer 7: structure theory). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For (V, ω) as above: the Lie algebra sp(V) is simple, every Lie algebra automorphism of sp(V) is Ad(h) for some h ∈ Sp(V)(k), and Sp(V)(k) is generated by the symplectic transvections x ↦ x + r⟨v, x⟩v.

## Layer LV.1: Galois representations: Faltings's finiteness lemma, friendly places and purity of Hodge weights

This layer contains the global Galois-theoretic inputs. Faltings's finiteness lemma is stated with a ramification set that contains the places above $p$ (the source states it with a set $S$ avoiding $p$ but applies it to $p$-adic cohomology, which is ramified at $p$). Lemma 2.8 is proved on units, where it is true; on uniformizers it fails. The friendly places are defined through the largest CM-or-totally-real subfield.

### LV.1.A Objects

#### The largest CM-or-totally-real subfield of a number field

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/NumberTheory/CMFields`, namespace `TauCeti.LawrenceVenkatesh`.

Let K ⊆ ℚ̄ be a number field, H ⊆ Gal(ℚ̄/ℚ) the closed subgroup topologically generated by {c₁c₂ : c₁, c₂ ∈ C} and H⁺ the closed subgroup generated by C. Put E_K := K ∩ ℚ̄^H and E_K⁺ := K ∩ ℚ̄^{H⁺}. Then E_K⁺ is the maximal totally real subfield of K, E_K is the largest subfield of K that is totally real or CM, [E_K : E_K⁺] ≤ 2, and E_K is CM if and only if K has a CM subfield (in which case E_K is the maximal CM subfield of LV Definition 2.7 and E_K⁺ its maximal totally real subfield).

**Construction.**

- A subfield F ⊆ K is fixed by H iff it is totally real or CM (criterion lemma), so E_K is the largest such subfield; similarly F is fixed by H⁺ iff it is totally real.
- H has index at most 2 in H⁺ (every c ∈ C lies in cH for a fixed c), so [E_K : E_K⁺] ≤ 2.
- If K contains a CM field F then F ⊆ E_K is not totally real, so E_K ≠ E_K⁺ and E_K is CM; conversely E_K CM gives a CM subfield.

**Declarations and API.**

- `largestCMSubfield` (constructor): E_K as an IntermediateField ℚ K.
- `largestTotallyRealSubfield` (constructor): E_K⁺, equal to Mathlib's maximalRealSubfield K.
- `largestTotallyRealSubfield_eq_maximalRealSubfield` (compatibility): E_K⁺ = NumberField.maximalRealSubfield K as subfields of K.
- `le_largestCMSubfield_iff` (characterisation): A subfield F ≤ K satisfies F ≤ E_K iff F is totally real or CM.
- `isCMField_largestCMSubfield_iff` (characterisation): IsCMField E_K ↔ K has a CM subfield ↔ E_K ≠ E_K⁺.
- `finrank_largestCMSubfield_div` (other): [E_K : E_K⁺] ∈ {1, 2}.
- `largestCMSubfield_map` (functoriality): For a field isomorphism σ : K ≃ K', σ(E_K) = E_{K'}.
- `embeddings_eq_on_largestCMSubfield_iff` (characterisation): Two embeddings τ, τ' : K → ℚ̄ agree on E_K iff τ' = hτ for some h in the closure H.
- `largestCMSubfield_cyclotomic` (example): E_{ℚ(ζ_n)} = ℚ(ζ_n) for n ≥ 3; E_{ℚ(2^{1/3})} = ℚ.

**Uses.** CM or totally real fields via complex conjugations (`LV.1/cm-or-totally-real-criterion`); `mathlib:InfiniteGalois.fixedField_fixingSubgroup`; `mathlib:InfiniteGalois.fixingSubgroup_fixedField`; `mathlib:NumberField.maximalRealSubfield`.

**Tests.**

- K = ℚ(ζ_n), n ≥ 3: E_K = K.
- K = ℚ(2^{1/3}): E_K = E_K⁺ = ℚ.
- K = ℚ(i, 2^{1/4}): E_K = ℚ(i).

#### Friendly places (LV Definition 2.7)

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/NumberTheory/FriendlyPlace`, namespace `TauCeti.LawrenceVenkatesh`.

Let K be a number field and v a finite place of K. If K has a CM subfield, v is friendly when it is unramified over ℚ and lies above a place of E_K⁺ that is inert in the CM field E_K. If K has no CM subfield, v is friendly when it is unramified over ℚ.

**Construction.**

- Define IsFriendly v by cases on whether E_K is CM, using the largest CM subfield and the decomposition behaviour of the place of E_K⁺ below v.
- Record the group-theoretic reformulation: for an embedding ι_p : ℚ̄ → ℚ̄_p inducing v on K and its decomposition group D ⊆ Gal(ℚ̄/ℚ), v is friendly iff v is unramified over ℚ and, when E_K is CM, some δ ∈ D satisfies δ ∘ τ = τ ∘ s_{E_K} on E_K for the embedding τ = inclusion.

**Declarations and API.**

- `IsFriendly` (constructor): The predicate on HeightOneSpectrum (𝓞 K).
- `IsFriendly.isUnramified` (projection): A friendly place is unramified over ℚ.
- `isFriendly_iff_of_not_hasCMSubfield` (characterisation): If K has no CM subfield, IsFriendly v ↔ v is unramified over ℚ.
- `isFriendly_iff_exists_decomposition` (characterisation): IsFriendly v ↔ v unramified over ℚ ∧ (E_K CM → ∃ δ in the decomposition group at v with δ acting on E_K as its complex conjugation).
- `isFriendly_of_frobenius` (other): If Frob_℘ ∈ Gal(K'/ℚ) (K' Galois over ℚ containing K) restricts to the nontrivial automorphism of E_K over E_K⁺, then the place of K below ℘ is friendly when unramified over ℚ (used with Chebotarev in LV.11).
- `isFriendly_map` (functoriality): Friendliness is preserved by isomorphisms of number fields.
- `isFriendly_rat` (example): Over ℚ every prime is friendly; over ℚ(i) exactly the primes above p ≡ 3 mod 4.

**Uses.** The largest CM-or-totally-real subfield of a number field (`LV.1/largest-cm-subfield`); `mathlib:IsArithFrobAt`.

**Tests.**

- K = ℚ: every prime is friendly.
- K = ℚ(i): v is friendly iff it lies above p ≡ 3 mod 4.
- K = ℚ(2^{1/3}): every place unramified over ℚ is friendly.

#### The weight of a filtration (LV (2.2))

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/PadicHodge/FiltrationWeight`, namespace `TauCeti.LawrenceVenkatesh`.

For a nonzero finite-dimensional vector space D over a field with a finite exhaustive separated decreasing filtration, weight_F(D) := t_H(D)/dim D ∈ ℚ, where t_H(D) = Σ_j j·dim gr^j D is the Hodge number of the filtered space. When F⁰D = D and the jumps are ≥ 0 this is LV's Σ_{j≥0} j dim gr^j(D)/dim D.

**Construction.**

- Define weight_F as the rational number t_H(D)/dim D using the Hodge number of the filtered vector space (PadicHodgeTheory R06.2, Brinon–Conrad Definition 8.1.1).

**Declarations and API.**

- `filtrationWeight` (constructor): weight_F(D) = t_H(D)/dim D for a nonzero filtered vector space.
- `filtrationWeight_eq` (characterisation): weight_F(D) · dim D = Σ_j j dim gr^j D.
- `filtrationWeight_det` (relation): t_H(det D) = t_H(D), so the jump of det D is dim D · weight_F(D).
- `filtrationWeight_directSum` (relation): weight_F(D ⊕ D') = (dim D weight_F(D) + dim D' weight_F(D'))/(dim D + dim D').
- `filtrationWeight_restrictScalars` (compatibility): For F'/F finite and D an F'-filtered space viewed over F, t_H over F is [F':F] times t_H over F', so the weight is unchanged.
- `filtrationWeight_sub_quotient` (relation): t_H is additive on strict short exact sequences.
- `filtrationWeight_twist` (relation): Shifting the filtration by n adds n to the weight.
- `filtrationWeight_example` (example): A two-step filtration with dim F¹ = a on a space of dimension n has weight a/n.

**Uses.** `PadicHodgeTheory:R06.2` (Period functors and admissibility).

**Tests.**

- H¹_dR of an abelian variety of dimension g with the Hodge filtration: weight 1/2.
- D_dR(ℚ_p(−1)): weight 1.

### LV.1.B Theorems

#### Semisimple representations in characteristic zero are determined by their traces

*Theorem* `TauCeti.LawrenceVenkatesh.trace_determines_semisimple` — module `TauCeti/NumberTheory/LawrenceVenkatesh/RepresentationTheory/TraceDetermines`.

Let G be a group, k a field of characteristic zero and V, W finite-dimensional semisimple k-linear representations of G with tr(g | V) = tr(g | W) for every g ∈ G. Then V ≅ W as representations.

**Proof.**

- Let A be the image of k[G] in End_k(V) × End_k(W); it is a finite-dimensional k-algebra and V ⊕ W is a faithful semisimple A-module, so A is a semisimple algebra (its Jacobson radical annihilates every semisimple module).
- The linear forms t_V, t_W : A → k, a ↦ tr(a | V), tr(a | W), agree on the image of G, which spans A; hence t_V = t_W.
- By Wedderburn–Artin A = ∏_i A_i with A_i simple; let e_i be the corresponding central idempotents and S_i the simple module of A_i. Then t_V(e_i) = m_i(V) · dim_k S_i where m_i(V) is the multiplicity of S_i in V.
- Since char k = 0, m_i(V) = m_i(W) for all i; therefore dim_k Hom_A(S_i, V) = dim_k Hom_A(S_i, W) for every simple left ideal, and the multiplicity criterion gives V ≅ W as A-modules, hence as representations.

**Uses.** `tauceti:TauCeti.nonempty_linearEquiv_of_finrank_linearMap_eq`; `mathlib:IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing`.

**Notes.** Wedderburn–Artin in algebra form is Mathlib IsSemisimpleRing.exists_algEquiv_pi_matrix_divisionRing; the multiplicity criterion is the cited Tau Ceti theorem.

**Tests.**

- For a finite group this recovers Representation.nonempty_equiv_of_character_eq.
- The hypothesis char k = 0 is needed: over 𝔽_p, V and V ⊕ V^{⊕ p} have the same traces.

#### Finiteness of integer Weil polynomials of fixed degree and weight

*Lemma* `TauCeti.LawrenceVenkatesh.weil_polynomials_finite` — module `TauCeti/NumberTheory/LawrenceVenkatesh/NumberTheory/WeilPolynomial`.

For a real number q > 1 and integers d ≥ 0 and w, the set of monic P ∈ ℤ[X] of degree d all of whose complex roots have absolute value q^{w/2} is finite.

**Proof.**

- By the coefficient bound for monic split polynomials over ℂ with roots of norm ≤ B = q^{w/2}, the i-th coefficient has absolute value at most B^{d−i}·C(d, i).
- The coefficients are integers bounded independently of P, so there are finitely many possibilities.

**Uses.** `mathlib:Polynomial.coeff_le_of_roots_le`.

**Tests.**

- q = p, d = 2, w = 1: the Weil polynomials X² − aX + p with |a| ≤ 2√p.
- d = 0: only P = 1.

#### A finite set of Frobenius traces determines a representation (Faltings–Deligne)

*Theorem* `TauCeti.LawrenceVenkatesh.frobenius_test_set` — module `TauCeti/NumberTheory/LawrenceVenkatesh/NumberTheory/FaltingsFiniteness`.

Let K be a number field, T a finite set of finite places of K, p a prime and d ≥ 1. There is a finite set T' of finite places of K, disjoint from T, with the following property: if ρ₁, ρ₂ : G_K → GL_d(ℚ_p) are continuous representations unramified outside T such that tr ρ₁(Frob_v) = tr ρ₂(Frob_v) for all v ∈ T', then tr ρ₁ = tr ρ₂ on G_K; if moreover ρ₁ and ρ₂ are semisimple, then ρ₁ ≅ ρ₂.

**Proof.**

- Let K'' be the compositum of all finite Galois extensions of K of degree at most p^{2d²} unramified outside T; it is a finite Galois extension of K by Hermite–Minkowski.
- By Chebotarev choose a finite set T' of finite places of K, disjoint from T and unramified in K'', whose Frobenius classes cover Gal(K''/K).
- Given ρ₁, ρ₂, choose G_K-stable ℤ_p-lattices (compactness) and let M ⊆ M_d(ℤ_p) × M_d(ℤ_p) be the ℤ_p-span of the image of G_K under ρ₁ × ρ₂; M is a ℤ_p-subalgebra, free of rank ≤ 2d², spanned by the image of G_K.
- The image of G_K in (M/pM)^× has fewer than p^{2d²} elements and is cut out by a Galois extension of K unramified outside T, hence of K''; so every element of this image is the image of a conjugate of some Frob_v, v ∈ T'.
- The linear form δ = tr ∘ pr₁ − tr ∘ pr₂ on M vanishes on all conjugates of ρ(Frob_v), v ∈ T' (traces are conjugation invariant); these elements span M/pM, so by Nakayama they span M over ℤ_p, and δ = 0 on M ⊇ ρ(G_K).
- If ρ₁, ρ₂ are semisimple, equality of traces gives ρ₁ ≅ ρ₂ (trace criterion over ℚ_p).

**Uses.** Semisimple representations in characteristic zero are determined by their traces (`LV.1/trace-determines-semisimple`); `FaltingsFinitenessAndIsogenyTheorems:R28.1/hermite-minkowski-finiteness-of-extensions-unramified-outside-S` (Hermite–Minkowski, FaltingsFinitenessAndIsogenyTheorems packet); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `ArithmeticGaloisRepresentations:R01.1` (Continuous representations and integral models); `mathlib:IsArithFrobAt`; `tauceti:NumberField.artinSymbol`; `mathlib:Submodule.le_of_le_smul_of_le_jacobson_bot`.

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev — Chebotarev Layer 10 (Dirichlet-density Chebotarev, infinitude of every Frobenius class).

**Tests.**

- K = ℚ, T = {p}, d = 1: T' reduces to a set of primes whose classes generate the relevant ray class group.
- Two non-isomorphic non-semisimple representations with the same semisimplification show the semisimplicity hypothesis is needed for the last clause.

#### Faltings's finiteness lemma (LV Lemma 2.3)

*Theorem* `TauCeti.LawrenceVenkatesh.finite_isoClasses_semisimple_pure` — module `TauCeti/NumberTheory/LawrenceVenkatesh/NumberTheory/FaltingsFiniteness`.

Let K be a number field, T a finite set of finite places of K, p a prime and w, d ≥ 0 integers. Up to isomorphism there are only finitely many semisimple continuous representations ρ : G_K → GL_d(ℚ_p) that are unramified outside T, pure of weight w outside T and have integral Frobenius polynomials outside T. (LV state the lemma with 'unramified outside S' for a set S not containing the places above p, while applying it to p-adic cohomology; the correct and intended hypothesis allows T to contain the places above p.)

**Proof.**

- Let T' be a Frobenius test set for (K, T, p, d).
- For v ∈ T' the characteristic polynomial of ρ(Frob_v^geom) is one of the finitely many integer Weil polynomials of degree d and weight w for q = q_v; it determines the characteristic polynomial, hence the trace, of ρ(Frob_v) = ρ(Frob_v^geom)^{-1}.
- So the tuple (tr ρ(Frob_v))_{v∈T'} takes finitely many values, and representations with the same tuple are isomorphic by the test-set theorem.

**Uses.** A finite set of Frobenius traces determines a representation (Faltings–Deligne) (`LV.1/frobenius-test-set`); Finiteness of integer Weil polynomials of fixed degree and weight (`LV.1/weil-polynomials-finite`); `WeightsInEtaleCohomology:R34.1` (Frobenius, algebraicity and weights); `DeligneWeightsAndPurity:DWP.0` (Eigenvalue weights and functorial linear algebra).

**Tests.**

- d = 1, w = 0, T = ∅ over ℚ: only the trivial character (finite order characters unramified everywhere).
- Without integrality the lemma fails: twists by characters with algebraic non-integral Frobenius values of the right absolute value.

#### CM or totally real fields via complex conjugations

*Lemma* `TauCeti.LawrenceVenkatesh.cm_or_totally_real_criterion` — module `TauCeti/NumberTheory/LawrenceVenkatesh/NumberTheory/CMFields`.

Fix an algebraic closure ℚ̄ and let C ⊆ Gal(ℚ̄/ℚ) be the set of complex conjugations (the automorphisms ι⁻¹ ∘ conj ∘ ι for embeddings ι : ℚ̄ → ℂ). A number field F ⊆ ℚ̄ is totally real or CM if and only if c₁c₂ fixes F pointwise for all c₁, c₂ ∈ C. In that case there is an automorphism s_F of F with s_F² = 1 and c ∘ τ = τ ∘ s_F for every c ∈ C and every embedding τ : F → ℚ̄; s_F = 1 iff F is totally real, and s_F is the complex conjugation of F when F is CM.

**Proof.**

- If F is CM, every complex embedding φ satisfies φ ∘ complexConj = conj ∘ φ; translating through ι gives c ∘ τ = τ ∘ s_F for all c ∈ C and τ, hence c₁c₂τ = τ. If F is totally real, every c ∈ C fixes every τ(F).
- Conversely the hypothesis is conjugation invariant, so c₁c₂ ∘ τ = τ for every τ, i.e. c ∘ τ is independent of c ∈ C.
- Taking τ the inclusion and c' = gcg⁻¹ with g ∈ Gal(ℚ̄/F) shows c(F) is fixed by Gal(ℚ̄/F), so c(F) = F and s_F := c|_F is an automorphism with c ∘ τ = τ ∘ s_F for all τ.
- If s_F = 1 all embeddings are real; otherwise F^{s_F} is totally real, [F : F^{s_F}] = 2 and no embedding of F is real, so F is CM (Milne, Proposition 1.4 (b) ⇒ (a)).

**Uses.** `mathlib:NumberField.IsCMField`; `mathlib:NumberField.IsCMField.complexEmbedding_complexConj`; `mathlib:NumberField.maximalRealSubfield`.

**Tests.**

- ℚ(i) is CM with s = conjugation; ℚ(√2) is totally real; ℚ(2^{1/3}) is neither, and indeed two complex conjugations act differently on its conjugate fields.

#### Functions on embeddings with constant conjugate sum factor through the largest CM subfield (Artin–Weil)

*Lemma* `TauCeti.LawrenceVenkatesh.infinity_type_factorization` — module `TauCeti/NumberTheory/LawrenceVenkatesh/NumberTheory/CMFields`.

Let K ⊆ ℚ̄ be a number field, w ∈ ℤ and m : Hom(K, ℚ̄) → ℤ with m(c ∘ τ) + m(τ) = w for all τ and all complex conjugations c ∈ C. Then m(τ) depends only on τ|_{E_K}. If K has no CM subfield then m(τ) = w/2 for all τ; in particular w is even.

**Proof.**

- For c₁, c₂ ∈ C, m(c₁c₂τ) = w − m(c₂τ) = m(τ); so m is invariant under the subgroup generated by the c₁c₂, and, being locally constant for the (continuous) action on the finite set Hom(K, ℚ̄), under its closure H.
- By the infinite Galois correspondence, two embeddings that agree on E_K = K ∩ ℚ̄^H differ by an element of H; hence m factors through restriction to E_K.
- If K has no CM subfield then E_K is totally real, so c ∘ τ and τ agree on E_K; hence m(cτ) = m(τ) and 2m(τ) = w.

**Uses.** The largest CM-or-totally-real subfield of a number field (`LV.1/largest-cm-subfield`); `mathlib:InfiniteGalois.fixedField_fixingSubgroup`.

**Tests.**

- K = ℚ(i), m(id) = 1, m(conj) = 0, w = 1: the infinity type of the CM elliptic curve with multiplication by ℤ[i].
- K = ℚ: m ≡ w/2.

#### At a friendly place a place-constant function with the conjugation relation takes the value w/2

*Lemma* `TauCeti.LawrenceVenkatesh.friendly_exponent_half` — module `TauCeti/NumberTheory/LawrenceVenkatesh/NumberTheory/FriendlyPlace`.

Let K ⊆ ℚ̄ be a number field, p a prime, ι_p : ℚ̄ → ℚ̄_p an embedding, and for each τ ∈ Hom(K, ℚ̄) let v(τ) be the place of K above p induced by ι_p ∘ τ. Let m : Hom(K, ℚ̄) → ℤ satisfy m(c∘τ) + m(τ) = w for all c ∈ C and τ, and assume m(τ) depends only on v(τ). Then for every friendly place v above p, m(τ) = w/2 whenever v(τ) = v.

**Proof.**

- If K has no CM subfield, the factorization lemma gives m ≡ w/2.
- Otherwise fix τ₀ with v(τ₀) = v. Friendliness gives δ in the decomposition group of ι_p with δ ∘ τ₀ = τ₀ ∘ s_{E_K} on E_K; then v(δ ∘ τ₀) = v.
- For any c ∈ C, c ∘ τ₀ = τ₀ ∘ s_{E_K} on E_K (criterion lemma), so δ ∘ τ₀ and c ∘ τ₀ agree on E_K and m(δτ₀) = m(cτ₀) by the factorization lemma.
- Place-constancy gives m(δτ₀) = m(τ₀); hence m(τ₀) = m(cτ₀) = w − m(τ₀).

**Uses.** Functions on embeddings with constant conjugate sum factor through the largest CM subfield (Artin–Weil) (`LV.1/infinity-type-factorization`); Friendly places (LV Definition 2.7) (`LV.1/friendly-place`); CM or totally real fields via complex conjugations (`LV.1/cm-or-totally-real-criterion`).

**Tests.**

- K = ℚ(i), p ≡ 3 mod 4: the unique place above p is friendly and the conclusion is m ≡ w/2 on both embeddings.
- K = ℚ(i), p ≡ 1 mod 4: the two places above p may carry exponents (1, 0) — the CM elliptic curve — so friendliness is necessary.

#### De Rham ℚ_p-valued characters are locally algebraic

*Lemma* `TauCeti.LawrenceVenkatesh.de_rham_character_locally_algebraic` — module `TauCeti/NumberTheory/LawrenceVenkatesh/NumberTheory/PureCharacters`.

Let F/ℚ_p be a finite extension and ψ : G_F → ℚ_p^× a continuous character that is de Rham, and let k ∈ ℤ be the unique filtration jump of the one-dimensional F-space D_dR(ψ). Then ψ·χ_cyc^{k} has finite image on the inertia group I_F; equivalently, ψ ∘ Art_F agrees with u ↦ N_{F/ℚ_p}(u)^{k} on an open subgroup of 𝒪_F^×. (With the conventions of this roadmap, D_dR(ℚ_p(n)) has its jump at −n and χ_cyc(Art_F(u)) = N_{F/ℚ_p}(u)^{-1}.)

**Proof.**

- η := ψ·χ_cyc^{k} is de Rham and D_dR(η) = D_dR(ψ) ⊗ D_dR(ℚ_p(k)) has its jump at k − k = 0 (tensor compatibility of D_dR and the computation of D_dR(ℚ_p(n))).
- A de Rham representation is Hodge–Tate with gr D_dR = D_HT, so (ℂ_F(η))^{G_F} ≠ 0.
- η(G_F) ⊆ ℚ_p^× is a commutative p-adic Lie group of dimension ≤ 1; by the Tate–Sen theorem (ℂ_F(η))^{G_F} = 0 unless η(I_F) is finite. Hence η(I_F) is finite.
- By local class field theory Art_F(𝒪_F^×) is the image of inertia in G_F^{ab} and χ_cyc ∘ Art_F = N_{F/ℚ_p}^{-1} on units, so ψ ∘ Art_F(u) = N(u)^{k}·η(Art_F(u)); the finite-order character η ∘ Art_F is trivial on an open subgroup.

**Uses.** `PadicHodgeTheory:R06.2` (Period functors and admissibility); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `mathlib:cyclotomicCharacter`.

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors — ClassFieldTheory Layer 7 (absolute local Artin map and its cyclotomic normalization).

**Tests.**

- ψ = χ_cyc^{-1} = ℚ_p(−1): k = 1 and ψ ∘ Art_F = N on units.
- An unramified character: k = 0.
- With coefficients in a larger field the exponent may vary with the embedding; the ℚ_p-rationality forces the single exponent k.

#### Global purity forces the conjugation relation on Hodge–Tate exponents

*Lemma* `TauCeti.LawrenceVenkatesh.pure_character_conjugation_relation` — module `TauCeti/NumberTheory/LawrenceVenkatesh/NumberTheory/PureCharacters`.

Let K be a number field, p a prime, ι_p : ℚ̄ → ℚ̄_p an embedding, and η : G_K → ℚ_p^× a continuous character that is unramified outside a finite set T of finite places containing those above p, pure of weight w outside T, and de Rham at every place v' | p with filtration jump k_{v'}. For τ ∈ Hom(K, ℚ̄) put m(τ) := k_{v(τ)}. Then m(c ∘ τ) + m(τ) = w for every complex conjugation c ∈ C and every τ.

**Proof.**

- By class field theory η ∘ Art_K is a continuous character of the idele class group, trivial on principal ideles, whose component at ℘ ∉ T is unramified with η(Art_℘(ϖ_℘)) = η(Frob_℘).
- By local algebraicity there is an open subgroup U ⊆ ∏_{v'|p} 𝒪_{v'}^× on which the p-component equals x ↦ ∏_{v'|p} N_{K_{v'}/ℚ_p}(x_{v'})^{k_{v'}} = ∏_τ ι_p(τ(x))^{m(τ)} for x ∈ K.
- Let Λ ⊆ K^× be the finite-index subgroup of totally positive α with α ∈ U and α a unit in the kernel of η_℘ at every ℘ ∈ T above no p. Reciprocity gives ∏_τ τ(α)^{m(τ)} = ∏_{℘∉T} η(Frob_℘)^{−v_℘(α)} for α ∈ Λ, an algebraic number.
- Purity (|ι(η(Frob_℘))| = q_℘^{−w/2}) gives |ι_∞(∏_τ τ(α)^{m(τ)})| = |N_{K/ℚ}(α)|^{w/2} for every embedding ι_∞ : ℚ̄ → ℂ, i.e. Σ_τ (m(τ) − w/2) log|ι_∞τ(α)| = 0.
- Grouping τ by the archimedean place of ι_∞ ∘ τ gives Σ_u a_u log|α|_u = 0 for all α ∈ Λ, with a_u the sum of m(τ) − w/2 over the embeddings inducing u. The vectors (log|α|_u)_u, α ∈ Λ, span ℝ^{places}: Λ contains a finite-index subgroup of the units, whose log vectors span the trace-zero hyperplane by Dirichlet's unit theorem, and an integer n > 1 whose log vector is not in that hyperplane. So every a_u = 0.
- For a complex place u the two embeddings are τ and c_ι ∘ τ with c_ι = ι_∞⁻¹ ∘ conj ∘ ι_∞, giving m(τ) + m(c_ι τ) = w; every c ∈ C is of the form c_ι. For a real place c_ι ∘ τ = τ and a_u = 0 reads 2m(τ) = w.

**Uses.** De Rham ℚ_p-valued characters are locally algebraic (`LV.1/de-rham-character-locally-algebraic`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `WeightsInEtaleCohomology:R34.1` (Frobenius, algebraicity and weights); `mathlib:NumberField.Units.dirichletUnitTheorem.unitLattice_span_eq_top`; `mathlib:NumberField.Units.logEmbedding`; `mathlib:Set.unit`.

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity — ClassFieldTheory Layer 11 (global Artin reciprocity and local–global compatibility); tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors — ClassFieldTheory Layer 7 (absolute local Artin map and its cyclotomic normalization).

**Tests.**

- η = χ_cyc^{−1} over any K: m ≡ 1 and w = 2.
- K = ℚ(i), p ≡ 1 mod 4 split as v₁v₂: the two ℚ_p-valued characters cut out by the ℤ[i]-action on H¹ of y² = x³ − x have exponents (1, 0) and (0, 1) at (v₁, v₂); the relation m(τ) + m(cτ) = 1 holds, and the value w/2 is not attained at the non-friendly places.

#### Pure characters at friendly places (LV Lemma 2.8, stated on units)

*Theorem* `TauCeti.LawrenceVenkatesh.pure_character_friendly` — module `TauCeti/NumberTheory/LawrenceVenkatesh/NumberTheory/PureCharacters`.

Let v be a friendly place of the number field K above p and η : G_K → ℚ_p^× a continuous character, unramified outside a finite set, pure of weight w outside that set, and de Rham at every place above p. Then w is even, the filtration jump of D_dR(η|_{G_{K_v}}) is w/2, and η ∘ Art_{K_v} agrees with N_{K_v/ℚ_p}^{w/2} on an open subgroup of 𝒪_{K_v}^×. (LV state η²|_{K_v^×} = χ·Norm^w on all of K_v^×; on a uniformizer this fails already for η = χ_cyc^{−1} over ℚ, and only the restriction to units, which is what LV use, is asserted here.)

**Proof.**

- Enlarge the ramification set to contain the places above p; the conjugation relation holds for m(τ) = k_{v(τ)}.
- m is place-constant by construction, so the friendly-exponent lemma gives k_v = w/2; since k_v ∈ ℤ, w is even.
- Local algebraicity at v gives the statement on units.

**Uses.** Global purity forces the conjugation relation on Hodge–Tate exponents (`LV.1/pure-character-conjugation-relation`); At a friendly place a place-constant function with the conjugation relation takes the value w/2 (`LV.1/friendly-exponent-half`); De Rham ℚ_p-valued characters are locally algebraic (`LV.1/de-rham-character-locally-algebraic`).

**Tests.**

- K = ℚ: η = χ_cyc^{−w/2}·(finite order on inertia).
- For η = χ_cyc^{−1} over ℚ: η∘Art(p) = 1 while p² ≠ 1, so the identity cannot hold on uniformizers.

#### Hodge weight of a pure representation at a friendly place (LV Lemma 2.9)

*Theorem* `TauCeti.LawrenceVenkatesh.hodge_weight_pure_representation` — module `TauCeti/NumberTheory/LawrenceVenkatesh/PadicHodge/FiltrationWeight`.

Let K be a number field, v a friendly place above p, and V a continuous representation of G_K on a nonzero finite-dimensional ℚ_p-vector space that is unramified outside a finite set, pure of weight w outside it, and de Rham (for instance crystalline) at every place above p. Then the weight of the Hodge filtration on D_dR(V|_{G_{K_v}}) equals w/2.

**Proof.**

- det V is a continuous character, pure of weight w·dim V (the product of the Frobenius eigenvalues) and de Rham above p.
- D_dR(det V) = det D_dR(V) as filtered spaces, so its jump is t_H(D_dR(V)).
- The friendly-place theorem for det V gives t_H(D_dR(V|_{K_v})) = w·dim V/2.

**Uses.** Pure characters at friendly places (LV Lemma 2.8, stated on units) (`LV.1/pure-character-friendly`); The weight of a filtration (LV (2.2)) (`LV.1/filtration-weight`); `PadicHodgeTheory:R06.2` (Period functors and admissibility); `WeightsInEtaleCohomology:R34.1` (Frobenius, algebraicity and weights).

**Tests.**

- V = H¹_et(A_{K̄}, ℚ_p) for an abelian variety with good reduction above p: weight 1/2, matching dim F¹ = g.

#### D_dR of an induced representation at a place

*Lemma* `TauCeti.LawrenceVenkatesh.de_rham_of_induced` — module `TauCeti/NumberTheory/LawrenceVenkatesh/PadicHodge/FiltrationWeight`.

Let L/K be a finite extension of number fields, v a place of K above p, and ρ a continuous representation of G_L on a finite-dimensional ℚ_p-space that is de Rham at every place u of L above v. Then Ind_{G_L}^{G_K} ρ restricted to G_{K_v} is de Rham and D_dR,K_v(Ind ρ|_{G_{K_v}}) ≅ ⊕_{u|v} D_dR,L_u(ρ|_{G_{L_u}}) as filtered K_v-vector spaces (each summand viewed over K_v by restriction of scalars).

**Proof.**

- The double cosets G_{K_v}\G_K/G_L correspond to the places u | v, and Mackey's formula gives Res_{G_{K_v}} Ind_{G_L}^{G_K} ρ ≅ ⊕_{u|v} Ind_{G_{L_u}}^{G_{K_v}} Res_{G_{L_u}} ρ (the decomposition is algebraic and compatible with the topologies since all indices are finite).
- For a finite extension F'/F of p-adic fields, D_dR,F(Ind_{G_{F'}}^{G_F} W) = (Ind W ⊗ B_dR)^{G_F} = (W ⊗ B_dR)^{G_{F'}} = D_dR,F'(W), compatibly with filtrations (Shapiro for invariants, PadicHodgeTheory R06.2).

**Uses.** `PadicHodgeTheory:R06.2` (Period functors and admissibility); `ArithmeticGaloisRepresentations:R01.1` (Continuous representations and integral models); `tauceti:Rep.mackeyDecomposition`.

**Tests.**

- L = K: the formula is trivial.
- ρ trivial and L/K unramified of degree r at v inert: D_dR(Ind 1) = L_u with the trivial filtration, of K_v-dimension r.

#### Hodge weights summed over places above a friendly place (LV Lemma 2.10)

*Theorem* `TauCeti.LawrenceVenkatesh.hodge_weight_sum_over_places` — module `TauCeti/NumberTheory/LawrenceVenkatesh/PadicHodge/FiltrationWeight`.

Let L/K be a finite extension of number fields, v a friendly place of K above p, and ρ : G_L → GL_n(ℚ_p) continuous, finitely ramified, pure of weight w outside a finite set and de Rham at every place of L above p. Let a_u(ρ) be the weight of the Hodge filtration of D_dR(ρ|_{G_{L_u}}). Then Σ_{u|v} [L_u : K_v]·a_u(ρ) = [L : K]·w/2.

**Proof.**

- V = Ind_{G_L}^{G_K} ρ is continuous, finitely ramified, de Rham above p and pure of weight w outside a finite set (the Frobenius eigenvalues of an induced representation at an unramified place are roots of those of ρ at the places above it, with the same normalized absolute values).
- The Hodge-weight theorem for V at v gives weight w/2 for D_dR(V|_{K_v}).
- By the induction lemma, D_dR(V|_{K_v}) = ⊕_{u|v} D_dR,L_u(ρ) with K_v-dimensions [L_u:K_v]·n and t_H = [L_u:K_v]·n·a_u(ρ); compare with dim V = [L:K]·n.

**Uses.** Hodge weight of a pure representation at a friendly place (LV Lemma 2.9) (`LV.1/hodge-weight-pure-representation`); D_dR of an induced representation at a place (`LV.1/de-rham-of-induced`); `WeightsInEtaleCohomology:R34.1` (Frobenius, algebraicity and weights); `ArithmeticGaloisRepresentations:R01.1` (Continuous representations and integral models).

**Tests.**

- L = K: Lemma 2.9.
- K = ℚ, p unramified in L: Σ_{u|p} f_u a_u = [L:ℚ] w/2, the form used in LV Lemma 4.4.

#### The Galois representation on H¹ of an abelian variety

*Theorem* `TauCeti.LawrenceVenkatesh.abelian_variety_cohomology_properties` — module `TauCeti/NumberTheory/LawrenceVenkatesh/NumberTheory/AbelianVarietyGalois`.

Let A be an abelian variety over a number field L with good reduction outside a finite set S_A of finite places, p a prime and ρ_A = H¹_et(A_{L̄}, ℚ_p) (the ℚ_p-dual of V_p(A)), of dimension 2 dim A. Then: (a) ρ_A is unramified outside S_A ∪ {u | p}; (b) for u ∉ S_A ∪ {u | p} the characteristic polynomial of ρ_A(Frob_u^geom) is the characteristic polynomial of the q_u-Frobenius endomorphism of the reduction A_u, which lies in ℤ[X] and has all complex roots of absolute value q_u^{1/2}; so ρ_A is pure of weight 1 with integral Frobenius polynomials outside S_A ∪ {u | p}; (c) ρ_A is crystalline at every u | p with u ∉ S_A; (d) a polarization of A induces a perfect alternating G_L-equivariant pairing ρ_A × ρ_A → ℚ_p(−1).

**Proof.**

- (a) Néron–Ogg–Shafarevich for u ∤ p; (b) the good-reduction Frobenius polynomial of the Tate module and the Weil bound for abelian varieties over finite fields, dualized; (c) good reduction implies crystalline Tate modules; (d) the Weil pairing of the polarization on Tate modules, dualized.

**Uses.** `NeronModelsAndSemistableAbelianVarieties:R11.5` (Tate modules, conductors and local factors); `ArithmeticGaloisRepresentations:R01.6` (Tate modules of elliptic curves and abelian varieties); `DeligneWeightsAndPurity:DWP.1` (Curves and abelian varieties: the initial Weil estimate); `PadicHodgeTheory:R06.6` (Arithmetic consequences); `AbelianSchemesAndArithmeticModuli:A3` (Finite flat quotients, torsion, and pairings); `SchemeAndStackFoundations:SF.3` (Curves, divisors and Picard objects).

**Tests.**

- An elliptic curve with good reduction at u: X² − a_u X + q_u with |a_u| ≤ 2√q_u.
- The pairing in (d) for the Legendre curve is the cup product on H¹.

### LV.1.C Dependencies

Within this roadmap: none.

Other roadmaps:

- `FaltingsFinitenessAndIsogenyTheorems:R28.1` (Height finiteness on arithmetic moduli). Used through the node cited in the list of uses.
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev` (Layer 10: Dirichlet-density Chebotarev). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For a finite Galois extension L/K of number fields, a conjugacy class C of Gal(L/K) and a finite set T of places of K, there is a finite place v ∉ T unramified in L whose Artin symbol is C (infinitude of frobeniusPrimeSet K L C).
- `ArithmeticGaloisRepresentations:R01.1` (Continuous representations and integral models). Needed: For a profinite group G and a continuous representation ρ : G → GL(V) on a finite-dimensional ℚ_p-vector space: existence of a G-stable ℤ_p-lattice; restriction to and induction from open subgroups (with continuity), Mackey's decomposition of Res_{D} Ind_{H} for closed D and open H, and the notion of semisimplicity with its stability under restriction to open normal subgroups.
- `WeightsInEtaleCohomology:R34.1` (Frobenius, algebraicity and weights). Needed: For a number field K, a finite set T of finite places and a continuous representation ρ of G_K on a finite-dimensional ℚ_p-space: the predicates 'pure of weight w outside T' (unramified at v ∉ T and every root of the characteristic polynomial of ρ(Frob_v^geom) is an algebraic number with all complex absolute values q_v^{w/2}) and 'integral Frobenius polynomials outside T', with stability under subrepresentations, quotients, direct sums, duals (w ↦ −w), tensor products (weights add), determinants (weight w·dim), Tate twists (ℚ_p(n) has weight −2n), restriction to G_L (T replaced by the places above T) and induction from G_L for L/K finite (same weight, T enlarged by the places ramified in L).
- `DeligneWeightsAndPurity:DWP.0` (Eigenvalue weights and functorial linear algebra). Needed: Weil q-numbers of weight w: algebraic numbers all of whose complex absolute values are q^{w/2}, with stability under products, inverses and conjugation.
- `PadicHodgeTheory:R06.2` (Period functors and admissibility). Needed: (i) D_dR on de Rham representations of G_F (F/ℚ_p finite) is exact with strict filtrations and compatible with tensor products, duals and determinants as a functor to filtered F-vector spaces (Brinon–Conrad Proposition 6.3.3); (ii) D_dR(ℚ_p(n)) has its unique jump in degree −n (Example 6.3.1) and a de Rham representation is Hodge–Tate with gr D_dR = D_HT (Proposition 6.3.2); (iii) the Tate–Sen theorem: for a continuous character η with η(G_F) a commutative p-adic Lie group of dimension ≤ 1, (ℂ_F(η))^{G_F} = 0 unless η(I_F) is finite (Theorem 2.2.7); (iv) for F'/F finite, D_dR,F(Ind_{G_{F'}}^{G_F} W) ≅ D_dR,F'(W) as filtered F-spaces, and de Rham/crystalline representations are stable under subquotients and under induction from unramified extensions; (v) the Hodge number t_H of filtered vector spaces with additivity on strict exact sequences and t_H(det D) = t_H(D), t_H(D ⊗ D') = dim D t_H(D') + dim D' t_H(D) (Proposition 8.1.2).
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors` (Layer 7: the absolute local Artin map, its normalizations, and conductors). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For a finite extension F/ℚ_p: Art_F(𝒪_F^×) is the image of the inertia group in G_F^ab, and χ_cyc(Art_F(u)) = N_{F/ℚ_p}(u)^{−1} for u ∈ 𝒪_F^× (cyclotomicCharacter_artinMap).
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity` (Layer 11: the global class formation and global Artin reciprocity). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For a number field K and a continuous character η : G_K → ℚ_p^× unramified outside a finite set T: η ∘ Art_K is a continuous character of the idele class group, trivial on principal ideles, whose component at a finite place ℘ ∉ T is unramified with value η(Frob_℘) (arithmetic Frobenius) on a uniformizer, whose component at a place above p is η|_{G_{K_℘}} ∘ Art_{K_℘}, and whose archimedean component is trivial on the identity component.
- `NeronModelsAndSemistableAbelianVarieties:R11.5` (Tate modules, conductors and local factors). Needed: Néron–Ogg–Shafarevich: an abelian variety over a number field with good reduction at u has V_p unramified at u for every p different from the residue characteristic of u.
- `ArithmeticGaloisRepresentations:R01.6` (Tate modules of elliptic curves and abelian varieties). Needed: For an abelian variety A over a number field L with good reduction at a finite place u ∤ p: V_p(A) is unramified at u and the characteristic polynomial of Frob_u on V_p(A) equals the characteristic polynomial of the q_u-Frobenius endomorphism of the reduction, a monic polynomial in ℤ[X] of degree 2 dim A independent of p (good-reduction Frobenius polynomial).
- `DeligneWeightsAndPurity:DWP.1` (Curves and abelian varieties: the initial Weil estimate). Needed: Weil's theorem: every complex root of the characteristic polynomial of the Frobenius endomorphism of an abelian variety over 𝔽_q has absolute value q^{1/2}.
- `PadicHodgeTheory:R06.6` (Arithmetic consequences). Needed: For an abelian variety A over a finite extension F/ℚ_p with good reduction, V_p(A) and H¹_et(A_{F̄}, ℚ_p) are crystalline G_F-representations.
- `AbelianSchemesAndArithmeticModuli:A3` (Finite flat quotients, torsion, and pairings). Needed: A polarization λ of an abelian variety A over a field of characteristic ≠ p induces a perfect alternating Galois-equivariant pairing V_p(A) × V_p(A) → ℚ_p(1) (the λ-Weil pairing), hence a perfect alternating pairing on H¹_et(A, ℚ_p) with values in ℚ_p(−1).
- `SchemeAndStackFoundations:SF.3` (Curves, divisors and Picard objects). Needed: For an abelian variety A over a field F of characteristic ≠ p, a Galois-equivariant isomorphism H¹_et(A_{F̄}, ℚ_p) ≅ Hom(V_p(A), ℚ_p), compatible with pullback along homomorphisms and with the cup product/Weil pairing.

## Layer LV.2: Abelian-by-finite families, good models and Gauss–Manin transport on residue disks

This layer sets up the families: abelian-by-finite families with good models, the de Rham bundle with its Hodge sub-bundle, polarization and Gauss–Manin connection, residue disks, the formal horizontal frame with its integrality, its $p$-adic and complex convergence, the two transports and the crystalline Frobenius on fibres. All statements are for degree-one cohomology of polarized abelian schemes, which is all the argument needs.

### LV.2.A Objects

#### Abelian-by-finite families (LV Definition 5.1)

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/Family/AbelianByFinite`, namespace `TauCeti.LawrenceVenkatesh.AbelianByFiniteFamily`.

Let B be a scheme and Y a B-scheme. An abelian-by-finite family over Y is a pair of morphisms X →f Y' →π Y together with a polarization λ of f, where π is finite étale and (f : X → Y', zero section, λ) is a polarized abelian scheme of constant relative dimension d. The composite π ∘ f is smooth and proper of relative dimension d. For a point y of Y, E_y := Γ(π^{-1}(y), 𝒪) is a finite étale κ(y)-algebra and the fibre X_y = (π∘f)^{-1}(y) is naturally an E_y-scheme. A polarized abelian scheme over Y is the case π = id.

**Construction.**

- Bundle the data (Y', π, X, f, zero section, λ) with the finite-étale and abelian-scheme predicates.
- The composite is smooth and proper as a composite of smooth proper morphisms.

**Declarations and API.**

- `AbelianByFiniteFamily` (constructor): The structure (Y', π, X, f, e, λ) over a B-scheme Y.
- `AbelianByFiniteFamily.relDim` (data): The relative dimension d of f.
- `AbelianByFiniteFamily.total` (projection): The composite π ∘ f : X → Y, smooth and proper of relative dimension d.
- `AbelianByFiniteFamily.baseChange` (functoriality): Pullback along Y₁ → Y and along B₁ → B, with base change of π, f and λ; compatible with composition and identity.
- `AbelianByFiniteFamily.fibreAlgebra` (data): E_y = Γ(π^{-1}(y), 𝒪), a finite étale κ(y)-algebra whose factors are the residue fields of the points of Y' over y.
- `AbelianByFiniteFamily.fibre` (projection): The fibre X_y as an E_y-scheme; over each point y' of π^{-1}(y) it is the polarized abelian variety X_{y'} over κ(y').
- `AbelianByFiniteFamily.ofAbelianScheme` (coercion): A polarized abelian scheme over Y is an abelian-by-finite family with π = id.
- `AbelianByFiniteFamily.restrictScalars` (other): The total space as a smooth proper Y-scheme, forgetting the factorization.

**Uses.** `AbelianSchemesAndArithmeticModuli:A1` (Abelian schemes and rigidity); `AbelianSchemesAndArithmeticModuli:A2` (Duals, Picard functors, and polarizations); `mathlib:AlgebraicGeometry.IsFinite`; `mathlib:AlgebraicGeometry.Etale`; `mathlib:AlgebraicGeometry.IsProper`; `mathlib:AlgebraicGeometry.Smooth`.

**Tests.**

- The polarized abelian scheme X → Y with π = id.
- The Legendre variant X → ℙ¹∖{0, μ_m, ∞} → ℙ¹∖{0,1,∞} of LV §4.2 (LV.6).
- The Kodaira–Parshin family X_q → Y'_q → Y (LV.8).

#### Good models over rings of S-integers

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/Family/GoodModel`, namespace `TauCeti.LawrenceVenkatesh.AbelianByFiniteFamily`.

Let K be a number field, S a finite set of places containing the archimedean ones and 𝒪 = 𝒪_S. A good model over 𝒪 of an abelian-by-finite family X → Y' → Y over a smooth K-variety Y is an abelian-by-finite family 𝒳 → 𝒴' → 𝒴 over 𝒪 whose base change to K is the given one, with 𝒴 smooth over 𝒪 (and proper over 𝒪 when Y is proper over K), and such that the relative de Rham cohomology H¹_dR(𝒳/𝒴') and its Hodge filtration F¹ are locally free with locally free quotient and commute with base change, and the Gauss–Manin connection of X/Y extends to 𝒳/𝒴 over 𝒪 (LV §3.1).

**Construction.**

- Define the predicate on a model; for abelian schemes the local freeness and base change of H¹_dR and F¹ and the integral Gauss–Manin connection are properties of the relative de Rham realization over any smooth 𝒪-base (AbelianSchemesAndArithmeticModuli A4), so the defining conditions reduce to: 𝒳 → 𝒴' → 𝒴 is an abelian-by-finite family over 𝒪 with 𝒴/𝒪 smooth (proper when Y is) recovering the given family over K.

**Declarations and API.**

- `IsGoodModel` (constructor): The predicate that an abelian-by-finite family over 𝒪_S is a good model of a family over K.
- `IsGoodModel.baseChange` (functoriality): A good model over 𝒪_S gives a good model over 𝒪_{S'} for S ⊆ S'.
- `IsGoodModel.integralPoints` (characterisation): If Y is proper, every K-point of Y extends uniquely to an 𝒪-point of 𝒴.
- `IsGoodModel.fibre_goodReduction` (other): For y ∈ 𝒴(𝒪) and y' over y, X_{y'} has good reduction at every place of K(y') not above S, and K(y')/K is unramified outside S.
- `IsGoodModel.deRham_locallyFree` (projection): H¹_dR(𝒳/𝒴') and F¹ are locally free with locally free quotient.
- `IsGoodModel.of_polarizedAbelianScheme` (example): The case π = id.

**Uses.** Abelian-by-finite families (LV Definition 5.1) (`LV.2/abelian-by-finite-family`); `AbelianSchemesAndArithmeticModuli:A4` (Degree-one realizations and deformation theory); `mathlib:Set.integer`; `mathlib:AlgebraicGeometry.IsProper.eq_valuativeCriterion`.

**Tests.**

- The Legendre family over ℤ[1/2][t, 1/(t(1−t))] is a good model of its generic fibre with S = {2, ∞}.
- If Y is proper, Y(K) = 𝒴(𝒪) by the valuative criterion, so every rational point is integral.

#### The de Rham bundle of an abelian-by-finite family

*Construction* — module `TauCeti/NumberTheory/LawrenceVenkatesh/Family/DeRhamBundle`, namespace `TauCeti.LawrenceVenkatesh.AbelianByFiniteFamily`.

For a good model 𝒳 →f 𝒴' →π 𝒴 over 𝒪 = 𝒪_S, put ℰ := π_*𝒪_{𝒴'} (a finite étale 𝒪_𝒴-algebra) and ℋ := π_* H¹_dR(𝒳/𝒴'). Then ℋ is a locally free ℰ-module of rank 2d, with: (a) the Hodge sub-bundle F¹ℋ = π_*F¹, locally free of ℰ-rank d with locally free quotient; (b) the polarization pairing ⟨·,·⟩ : ℋ × ℋ → ℰ, ℰ-bilinear, alternating and perfect, for which F¹ℋ is Lagrangian; (c) the Gauss–Manin connection ∇ : ℋ → ℋ ⊗ Ω¹_{𝒴/𝒪}, integrable, satisfying ∇(e·x) = d_ℰ(e)·x + e·∇x for the canonical integrable connection d_ℰ on the étale algebra ℰ, and horizontal pairing d_ℰ⟨x, x'⟩ = ⟨∇x, x'⟩ + ⟨x, ∇x'⟩. For y ∈ 𝒴(R) with R an 𝒪-algebra, y^*ℋ = H¹_dR(X_y/R) as a module over E_y = y^*ℰ, compatibly with (a)–(c) and with the de Rham cohomology of the total space X → Y.

**Construction.**

- Apply the degree-one de Rham realization of the polarized abelian scheme 𝒳/𝒴' (relative H¹_dR, Hodge exact sequence, Gauss–Manin connection relative to 𝒪, cup-product pairing induced by λ, base change).
- Push forward along the finite étale π: π_* of a locally free module is locally free; ℰ acts through π_*𝒪_{𝒴'}; since π is étale, Ω¹_{𝒴'/𝒪} = π^*Ω¹_{𝒴/𝒪}, so the Gauss–Manin connection of 𝒳/𝒴' pushes forward to a connection on ℋ with the stated Leibniz rule; it coincides with the Gauss–Manin connection of the composite 𝒳 → 𝒴.
- The pairing pushes forward to an ℰ-valued pairing; perfectness and the Lagrangian property of F¹ are fibrewise statements for abelian varieties.
- Base change of π_* along y is exact because π is finite flat.

**Declarations and API.**

- `deRhamBundle` (constructor): ℋ as a locally free ℰ-module of rank 2d on 𝒴.
- `deRhamBundle.hodge` (data): The Hodge sub-bundle F¹ℋ of ℰ-rank d.
- `deRhamBundle.pairing` (data): The ℰ-bilinear perfect alternating pairing with F¹ℋ Lagrangian.
- `deRhamBundle.gaussManin` (data): The integrable connection ∇ with the ℰ-Leibniz rule and horizontal pairing.
- `deRhamBundle.fibreEquiv` (equivalence): y^*ℋ ≃ H¹_dR(X_y/R) as E_y-modules with filtration and pairing.
- `deRhamBundle.fibreDecomp` (characterisation): Over a field L ⊇ K, H¹_dR(X_y/L) = ∏ over the factors of E_y ⊗ L of the de Rham cohomology of the corresponding abelian varieties (LV (6.2)).
- `deRhamBundle.baseChange` (functoriality): Compatibility with base change of the family and with restriction to open subschemes of 𝒴.
- `deRhamBundle.eq_gaussManin_total` (compatibility): ∇ is the Gauss–Manin connection of the smooth proper morphism 𝒳 → 𝒴 on H¹_dR(𝒳/𝒴) = ℋ.
- `deRhamBundle.legendre` (example): For the Legendre family, the basis dx/y, x dx/y and its connection matrix.

**Uses.** Good models over rings of S-integers (`LV.2/good-model`); `AbelianSchemesAndArithmeticModuli:A4` (Degree-one realizations and deformation theory); `AbelianSchemesAndArithmeticModuli:A2` (Duals, Picard functors, and polarizations); `mathlib:AlgebraicGeometry.Etale`; `mathlib:AlgebraicGeometry.IsFinite`.

**Tests.**

- For the Legendre family, ℰ = 𝒪 and ℋ has basis dx/y, x dx/y with the Picard–Fuchs connection.
- For π = id, ℋ = H¹_dR(𝒳/𝒴) with its usual structures.

#### Residue disks and their coordinates

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/Family/ResidueDisk`, namespace `TauCeti.LawrenceVenkatesh`.

Let 𝒴 be smooth of relative dimension m over 𝒪 = 𝒪_S, v a finite place of K not in S with K_v/ℚ_p unramified, and y₀ ∈ 𝒴(𝒪_v) with reduction ȳ₀ ∈ 𝒴(k_v). The residue disk is Ω_v(y₀) := {y ∈ 𝒴(𝒪_v) : y ≡ y₀ mod v}. A system of parameters at y₀ is (z₁, …, z_m) ⊆ 𝒪_{𝒴⊗𝒪_(v), ȳ₀} generating the kernel of the map to 𝒪_(v) given by y₀, so that (p, z₁, …, z_m) is a regular system of parameters. Then the completed local ring is 𝒪_v[[z₁, …, z_m]] and y ↦ (z₁(y), …, z_m(y)) is a bijection Ω_v(y₀) → (p𝒪_v)^m.

**Construction.**

- Parameters exist because 𝒴 is smooth over 𝒪 at ȳ₀ and y₀ is a section through ȳ₀.
- Since K_v is unramified, 𝒪_v = W(k_v) and the completed local ring of the smooth 𝒪_v-scheme at the k_v-point ȳ₀ is 𝒪_v[[z]].
- 𝒪_v-points reducing to ȳ₀ are continuous 𝒪_v-algebra maps 𝒪_v[[z]] → 𝒪_v, i.e. values z ∈ (p𝒪_v)^m (formal smoothness and completeness).

**Declarations and API.**

- `residueDisk` (constructor): Ω_v(y₀) as a subset of 𝒴(𝒪_v).
- `residueDisk.coords` (data): The bijection z : Ω_v(y₀) ≃ (p𝒪_v)^m attached to a system of parameters.
- `residueDisk.coords_germ` (characterisation): For f ∈ 𝒪_{𝒴,ȳ₀}, f(y) is the value at z(y) of the Taylor expansion of f, a power series with coefficients in 𝒪_(v).
- `residueDisk.mem_iff` (characterisation): y ∈ Ω_v(y₀) ↔ y and y₀ have the same reduction.
- `residueDisk.coords_change` (other): Two systems of parameters differ by an 𝒪_v-analytic isomorphism given by power series in 𝒪_v[[z]].
- `residueDisk.finiteEtale` (functoriality): For a finite étale π : 𝒴' → 𝒴, π^{-1}(Ω_v(y₀)) is the disjoint union of the residue disks of the points of 𝒴'(𝒪_{v'}) over y₀, compatibly with coordinates.
- `residueDisk.cover` (other): 𝒴(𝒪_v) is the finite disjoint union of the residue disks of its points; if 𝒴 is proper, Y(K_v) = 𝒴(𝒪_v).
- `residueDisk.affineLine` (example): The residue disks of 𝔸¹(ℤ_p) are the cosets of pℤ_p.

**Uses.** `SchemeAndStackFoundations:SF.0` (Schemes and morphisms); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `mathlib:AlgebraicGeometry.Smooth`; `mathlib:MvPowerSeries`.

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius — LocalFieldsRamification Layer 2 (unramified extensions and Frobenius).

**Tests.**

- 𝒴 = 𝔸¹: Ω_v(y₀) = y₀ + p𝒪_v with z = t − t₀.
- Changing parameters changes the bijection by an 𝒪_v-analytic automorphism of (p𝒪_v)^m.

#### p-adic Gauss–Manin transport on a residue disk (LV (3.7))

*Construction* — module `TauCeti/NumberTheory/LawrenceVenkatesh/Family/GaussManinTransport`, namespace `TauCeti.LawrenceVenkatesh.AbelianByFiniteFamily`.

Let 𝒳 → 𝒴' → 𝒴 be a good model, v ∉ S with K_v/ℚ_p unramified and p > 2, y₀ ∈ 𝒴(𝒪_v), and choose parameters z at y₀ and a basis v_1, …, v_r of ℋ on a neighbourhood of ȳ₀ (compatible with the Hodge filtration at y₀). For y ∈ Ω_v(y₀) the matrix Φ(z(y)) of horizontal sections defines an 𝒪_v-linear isomorphism T_v(y) : ℋ_{y₀} ⊗ 𝒪_v → ℋ_y ⊗ 𝒪_v, the Gauss–Manin transport. It is independent of the choices of basis and parameters, satisfies T_v(y₀) = id, is compatible with the ℰ-structure along the transport ℰ_{y₀} ⊗ 𝒪_v ≅ ℰ_y ⊗ 𝒪_v (LV (6.3)), preserves the polarization pairing, and satisfies T_v(y'') = T_{v}(y', y'') ∘ T_v(y') for the transport based at y' ∈ Ω_v(y₀).

**Construction.**

- The connection matrix of ∇ in the basis (v_i) has coefficients in 𝒪_(v)[[z]] (the Taylor expansions of sections of Ω¹ over a neighbourhood of ȳ₀).
- The formal solution Φ converges on (p𝒪_v)^m with values in GL_r(𝒪_v); define T_v(y) as the map sending the fibre at y₀ of a horizontal formal section to its value at y.
- Independence of choices: two formal horizontal frames differ by a constant matrix, and a change of parameters is an analytic substitution.
- ℰ is itself a module with integrable connection d_ℰ; its transport is a ring isomorphism, and the Leibniz rule makes T_v(y) semilinear over it; horizontality of the pairing makes T_v(y) preserve it.
- The cocycle identity follows from uniqueness of horizontal sections.

**Declarations and API.**

- `gaussManinTransport` (constructor): T_v(y) : ℋ_{y₀} ⊗ 𝒪_v ≃ ℋ_y ⊗ 𝒪_v for y ∈ Ω_v(y₀).
- `gaussManinTransport_self` (simp): T_v(y₀) = id.
- `gaussManinTransport_trans` (relation): Transitivity T_v(y'') = T_{y'}(y'') ∘ T_v(y') for y', y'' in one disk.
- `gaussManinTransport_algebra` (other): The transport of ℰ is a ring isomorphism E_{y₀} ⊗ 𝒪_v ≃ E_y ⊗ 𝒪_v and T_v(y) is semilinear over it.
- `gaussManinTransport_pairing` (relation): ⟨T_v(y)x, T_v(y)x'⟩ = T_ℰ(⟨x, x'⟩).
- `gaussManinTransport_matrix` (characterisation): In a basis near ȳ₀, the matrix of T_v(y) is Φ(z(y)), with entries restricted power series in z/p.
- `gaussManinTransport_indep` (extensionality): T_v(y) does not depend on the basis or on the parameters.
- `gaussManinTransport_pairs` (equivalence): The induced bijection between the points (y', w) over (y, v) and (y₀', w₀) over (y₀, v), with K(y')_w ≅ K(y₀')_{w₀} (LV (6.4), (6.6)).
- `gaussManinTransport_constant` (example): For a constant family T_v(y) = id.

**Uses.** The de Rham bundle of an abelian-by-finite family (`LV.2/de-rham-bundle`); Residue disks and their coordinates (`LV.2/residue-disk`); p-adic convergence of formal horizontal sections on the residue disk (`LV.2/horizontal-sections-padic-convergence`).

**Tests.**

- For the constant family the transport is the identity.
- For ℰ: the transport identifies E_{y₀} ⊗ K_v = ∏ K(y₀')_w with E_y ⊗ K_v factor by factor, giving the bijection (6.4) of pairs (y', w) over (y, v) and (y₀', w₀) over (y₀, v).

#### Complex Gauss–Manin transport and Betti parallel transport (LV (3.8))

*Construction* — module `TauCeti/NumberTheory/LawrenceVenkatesh/Family/GaussManinTransport`, namespace `TauCeti.LawrenceVenkatesh.AbelianByFiniteFamily`.

Let ι : K → ℂ, y₀ ∈ Y(ℂ) and Ω_ℂ ⊆ Y(ℂ) a contractible open neighbourhood of y₀. For y ∈ Ω_ℂ the holomorphic horizontal sections of (ℋ^an, ∇^an) define T_ℂ(y) : ℋ_{y₀} ⊗_ι ℂ ≅ ℋ_y ⊗_ι ℂ; near y₀ its matrix is ι(Φ)(z(y)) for the same formal series Φ as in the p-adic case. Under the de Rham–Betti comparison ℋ_y ⊗ ℂ = H¹_B(X_y(ℂ), ℂ) = ⊕_{y' ↦ y} H¹_B(X_{y'}(ℂ), ℂ), T_ℂ(y) is parallel transport in the local system R¹(π∘f)_*ℂ along any path in Ω_ℂ; it is compatible with the ℰ-structure and the polarization.

**Construction.**

- Near y₀ the complex convergence lemma gives the holomorphic fundamental matrix ι(Φ); on the contractible Ω_ℂ horizontal sections extend uniquely (analytic continuation along paths, identity theorem).
- Horizontal sections of the analytic Gauss–Manin connection are the locally constant sections of the Betti local system (de Rham–Betti comparison for proper smooth families with Gauss–Manin compatibility, in degree one for abelian schemes).
- ℰ ⊗ ℂ corresponds to the locally constant functions on the covering Y'(ℂ) → Y(ℂ), giving the decomposition over the points above y.

**Declarations and API.**

- `gaussManinTransportComplex` (constructor): T_ℂ(y) for y in a contractible neighbourhood of y₀.
- `gaussManinTransportComplex_eq_parallel` (compatibility): T_ℂ(y) is Betti parallel transport under the de Rham–Betti comparison.
- `gaussManinTransportComplex_series` (characterisation): Near y₀, the matrix of T_ℂ(y) is ι(Φ)(z(y)) with Φ the formal solution of LV (3.6).
- `gaussManinTransportComplex_trans` (relation): Transitivity along paths in Ω_ℂ.
- `gaussManinTransportComplex_pairing` (relation): Compatibility with the polarization and the ℰ-structure.
- `gaussManinTransportComplex_monodromy` (other): Analytic continuation along a loop γ at y₀ gives the monodromy μ(γ).
- `gaussManinTransportComplex_legendre` (example): The Legendre family's period matrix.

**Uses.** The de Rham bundle of an abelian-by-finite family (`LV.2/de-rham-bundle`); Complex convergence of formal horizontal sections (majorants) (`LV.2/horizontal-sections-complex-convergence`); `ComplexComparisonPartII:C5` (Algebraic de Rham–Betti comparison); `AbelianSchemesAndArithmeticModuli:A5` (Complex uniformization with polarization and level); `mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`; `tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation`.

**Tests.**

- For the Legendre family, T_ℂ(y) is given by the periods of dx/y and x dx/y along a transported basis of H₁.
- Monodromy: for a loop γ at y₀ the analytic continuation of T_ℂ is the monodromy of the local system.

#### Crystalline Frobenius on the de Rham cohomology of the fibres and its compatibility with Gauss–Manin transport (LV (3.9))

*Construction* — module `TauCeti/NumberTheory/LawrenceVenkatesh/Family/CrystallineFrobenius`, namespace `TauCeti.LawrenceVenkatesh.AbelianByFiniteFamily`.

In the p-adic setting (v ∉ S, K_v/ℚ_p unramified, p > 2), for y ∈ 𝒴(𝒪_v) let φ_y be the bijective endomorphism of ℋ_y ⊗ K_v = H¹_dR(X_y/K_v) transported from the crystalline Frobenius of H¹_cris(X_ȳ/W(k_v))[1/p] through the Berthelot–Ogus isomorphism for the lift X_y of the special fibre X_ȳ. Then: (a) φ_y is σ-semilinear for the Frobenius σ of K_v, and semilinear over the Frobenius of E_y ⊗ K_v = ∏_{(y',w)} K(y')_w, which is the product of the arithmetic Frobenii of the unramified extensions K(y')_w/ℚ_p; on the factor H¹_dR(X_{y',w}/K(y')_w) it is the crystalline Frobenius of that abelian variety; (b) for y ∈ Ω_v(y₀), T_v(y) ∘ φ_{y₀} = φ_y ∘ T_v(y).

**Construction.**

- The Berthelot–Ogus comparison identifies crystalline cohomology of the special fibre with the de Rham cohomology of any smooth proper lift; the crystalline Frobenius is σ-semilinear and bijective after inverting p.
- The relative crystalline cohomology of 𝒳_{k_v}/𝒴_{k_v} is a crystal whose value on the formal completion of 𝒴 along ȳ₀ is ℋ with ∇, and whose transition isomorphisms between the two sections y, y₀ (same reduction) are given by the Taylor series of ∇; for p > 2 and v unramified this series converges on the PD-thickening defined by p and equals T_v(y).
- Crystalline Frobenius is functorial for the transition isomorphisms of the crystal, hence commutes with T_v(y).
- The finite étale 𝒴' contributes H⁰, on which crystalline Frobenius is the Frobenius of the étale algebra; the E-semilinearity follows from compatibility of Frobenius with cup product.

**Declarations and API.**

- `crystallineFrobenius` (constructor): φ_y on ℋ_y ⊗ K_v for y ∈ 𝒴(𝒪_v).
- `crystallineFrobenius_semilinear` (other): φ_y(a·x) = σ(a)·φ_y(x) for a ∈ K_v, and φ_y(e·x) = Frob(e)·φ_y(x) for e ∈ E_y ⊗ K_v.
- `crystallineFrobenius_bijective` (other): φ_y is bijective.
- `crystallineFrobenius_transport` (relation): T_v(y) ∘ φ_{y₀} = φ_y ∘ T_v(y) for y in the disk of y₀.
- `crystallineFrobenius_factor` (compatibility): On the factor indexed by (y', w), φ_y is the crystalline Frobenius of X_{y'} ⊗ K(y')_w, semilinear for the arithmetic Frobenius of K(y')_w over ℚ_p.
- `crystallineFrobenius_pairing` (relation): ⟨φx, φx'⟩ = p·Frob⟨x, x'⟩ for the polarization pairing.
- `crystallineFrobenius_example` (example): Ordinary and supersingular elliptic curves.

**Uses.** p-adic Gauss–Manin transport on a residue disk (LV (3.7)) (`LV.2/gauss-manin-transport-padic`); The de Rham bundle of an abelian-by-finite family (`LV.2/de-rham-bundle`); `CrystallineCohomology:CR.1` (Crystalline sites, structure sheaves and crystals); `CrystallineCohomology:CR.2` (The PD Poincare lemma and de Rham computations); `CrystallineCohomology:CR.3` (Descent, finiteness, base change and Frobenius); `CrystallineCohomology:CR.7` (Coefficient and arithmetic interfaces); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius — LocalFieldsRamification Layer 2 (unramified extensions and Frobenius).

**Tests.**

- For an elliptic curve with ordinary reduction, φ has slopes 0 and 1 on the two-dimensional H¹_dR; for supersingular reduction both slopes are 1/2.
- For the constant family X = A × 𝒴, φ_y = φ_{y₀} under the identity transport.

### LV.2.B Theorems

#### Existence of good models after enlarging S

*Lemma* `TauCeti.LawrenceVenkatesh.good_model_exists` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Family/GoodModel`.

Let X → Y' → Y be an abelian-by-finite family over a smooth (respectively smooth proper) K-variety Y. There is a finite set S of places of K such that the family has a good model over 𝒪_S with 𝒴 smooth (respectively smooth and proper) over 𝒪_S. Any two good models become isomorphic over 𝒪_{S'} for some finite S' ⊇ S.

**Proof.**

- K = colim 𝒪_S over finite S; the finitely presented schemes Y, Y', X, the morphisms π, f, the zero section and the polarization descend to some 𝒪_S (limit arguments), and so do the properties smooth, proper, finite étale, and 'abelian scheme' (smooth proper group scheme with geometrically connected fibres) after enlarging S.
- The degree-one de Rham realization of an abelian scheme over a smooth 𝒪_S-base has the required local freeness, base change and integral Gauss–Manin connection.
- Uniqueness: an isomorphism over K of finitely presented objects descends to some 𝒪_{S'}.

**Uses.** Good models over rings of S-integers (`LV.2/good-model`); `SchemeAndStackFoundations:SF.0` (Schemes and morphisms); `AbelianSchemesAndArithmeticModuli:A4` (Degree-one realizations and deformation theory); `mathlib:AlgebraicGeometry.spread_out_of_isGermInjective`.

**Tests.**

- X = E × Y for a fixed elliptic curve E over K: S = the bad places of E and of Y.

#### Formal horizontal sections of an integrable connection with integral coefficients

*Lemma* `TauCeti.LawrenceVenkatesh.formal_horizontal_sections` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Family/FormalSolutions`.

Let R be a subring of a field K of characteristic zero, r ≥ 1, and A_1, …, A_m ∈ M_r(R[[z_1, …, z_m]]) satisfying the integrability condition ∂_k A_l − ∂_l A_k + [A_k, A_l] = 0. There is a unique Φ ∈ GL_r(K[[z]]) with Φ(0) = 1 and ∂_k Φ = −A_k Φ for all k. Writing Φ = Σ_α Φ_α z^α, one has α!·Φ_α ∈ M_r(R) for every multi-index α, where α! = ∏ α_i!; the same holds for Φ^{-1}, which solves ∂_k Ψ = Ψ A_k.

**Proof.**

- The equations give the recursion (α_k + 1)Φ_{α+e_k} = −Σ_{β ≤ α} A_{k,α−β} Φ_β; integrability makes the values obtained through different k agree, so a unique formal solution exists (induction on |α|).
- Multiplying by α!: (α + e_k)! Φ_{α+e_k} = −Σ_{β≤α} (α!/β!) A_{k,α−β} (β! Φ_β), and α!/β! is an integer for β ≤ α; induction gives integrality of α!Φ_α.
- Φ^{-1} satisfies the transposed system with the same shape of recursion.

**Uses.** `mathlib:MvPowerSeries`.

**Tests.**

- m = 1, r = 1, A = −1: Φ = exp(z) with α!Φ_α = 1.
- A = 0: Φ = 1.

#### p-adic convergence of formal horizontal sections on the residue disk

*Lemma* `TauCeti.LawrenceVenkatesh.horizontal_sections_padic_convergence` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Family/FormalSolutions`.

In the setting of the formal-solution lemma, let R = 𝒪_(v) ⊆ K for a finite place v with K_v/ℚ_p unramified and p > 2. Then Φ and Φ^{-1} converge absolutely for z ∈ K_v^m with |z_i|_v < |p|_v^{1/(p−1)}. More precisely the series x ↦ Φ(p x) has coefficients p^{|α|}Φ_α ∈ M_r(𝒪_v) tending to zero, so it is a restricted power series over 𝒪_v in x ∈ 𝒪_v^m; in particular Φ(z) ∈ GL_r(𝒪_v) and Φ(z) ≡ 1 mod p for z ∈ (p𝒪_v)^m.

**Proof.**

- By the formal-solution lemma |Φ_α|_v ≤ |α!|_v^{-1}, and Legendre's bound v_p(n!) ≤ n/(p−1) gives |α!|_v^{-1} ≤ p^{|α|/(p−1)} (v unramified, so |p|_v = p^{-1}).
- Hence |p^{|α|}Φ_α|_v ≤ p^{−|α|(p−2)/(p−1)} → 0 for p ≥ 3, and Φ(z) converges for |z_i| < p^{−1/(p−1)}.
- The constant term is 1 and all other terms of Φ(px) are divisible by p (as |α|(p−2)/(p−1) > 0 and the valuation is an integer ≥ 1 once positive), so Φ(z) ≡ 1 mod p and is invertible; the same for Φ^{-1}.

**Uses.** Formal horizontal sections of an integrable connection with integral coefficients (`LV.2/formal-horizontal-sections`); `mathlib:Nat.factorization_factorial_le_div_pred`; `mathlib:MvPowerSeries.IsRestricted`.

**Tests.**

- p = 3: Φ = exp(z) converges on |z| < 3^{-1/2}, which contains 3ℤ_3.
- p = 2 fails: exp(z) does not converge on 2ℤ_2, which is why LV assume p > 2.

#### Complex convergence of formal horizontal sections (majorants)

*Lemma* `TauCeti.LawrenceVenkatesh.horizontal_sections_complex_convergence` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Family/FormalSolutions`.

In the setting of the formal-solution lemma, let ι : K → ℂ be an embedding and suppose that the entries of the ι-images of all A_k converge on a polydisk around 0. Then ι(Φ) converges on a polydisk around 0 and is the holomorphic fundamental solution there: ∂_k ι(Φ) = −ι(A_k) ι(Φ), ι(Φ)(0) = 1.

**Proof.**

- Cauchy's estimates give M, ρ > 0 with ‖ι(A_{k,α})‖ ≤ M ρ^{−|α|} for all k and α; the series Â(z) = M/(1 − (z_1+⋯+z_m)/ρ) has coefficients M·(|α|!/α!)·ρ^{−|α|} ≥ M ρ^{−|α|}, so it majorizes every ι(A_k).
- The scalar system ∂_k Φ̂ = Â Φ̂ (k = 1…m) is integrable and has the solution Φ̂ = (1 − (z_1+⋯+z_m)/ρ)^{−Mρ}, which converges for Σ|z_i| < ρ.
- By induction on |α| using the recursion, ‖ι(Φ_α)‖ ≤ Φ̂_α; so ι(Φ) converges where Φ̂ does, and termwise differentiation gives the differential equation.

**Uses.** Formal horizontal sections of an integrable connection with integral coefficients (`LV.2/formal-horizontal-sections`); `mathlib:HasFPowerSeriesOnBall`; `mathlib:FormalMultilinearSeries.radius`.

**Tests.**

- m = 1, A = −a/(1 − z) with a ∈ ℚ: ∂Φ = aΦ/(1 − z) and Φ = (1 − z)^{−a}, converging for |z| < 1.

### LV.2.C Dependencies

Within this roadmap: none.

Other roadmaps:

- `AbelianSchemesAndArithmeticModuli:A1` (Abelian schemes and rigidity). Needed: Abelian schemes over an arbitrary base (smooth proper group schemes with geometrically connected fibres), their relative dimension, base change and homomorphisms.
- `AbelianSchemesAndArithmeticModuli:A2` (Duals, Picard functors, and polarizations). Needed: Polarizations of abelian schemes (λ : A → A^∨ with the positivity condition), stable under base change; the polarization of a relative Jacobian.
- `AbelianSchemesAndArithmeticModuli:A4` (Degree-one realizations and deformation theory). Needed: For an abelian scheme f : A → T of relative dimension d over a smooth 𝒪_S-scheme T: relative H¹_dR(A/T) locally free of rank 2d with Hodge exact sequence 0 → f_*Ω¹ → H¹_dR → R¹f_*𝒪 → 0 (locally free terms), compatible with arbitrary base change; the Gauss–Manin connection relative to 𝒪_S, integrable; the cup-product pairing induced by a polarization, perfect and alternating, with F¹ Lagrangian and horizontal for ∇; all compatible with base change and with the analytic comparison over ℂ.
- `SchemeAndStackFoundations:SF.0` (Schemes and morphisms). Needed: (i) Spreading out: for a number field K = colim 𝒪_S, finitely presented schemes, morphisms and group-scheme structures over K descend to some 𝒪_S, uniquely up to enlarging S, and the properties finite étale, smooth, proper, abelian scheme descend after enlarging S (EGA IV §8, 17.7.8). (ii) For a smooth 𝒪_S-scheme of relative dimension m, a place v ∉ S with 𝒪_v unramified and an 𝒪_v-point y₀, the completed local ring at the reduction is 𝒪_v[[z₁,…,z_m]] for a system of parameters vanishing at y₀, and 𝒪_v-points with the same reduction correspond to (p𝒪_v)^m.
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius` (Layer 2: unramified extensions and Frobenius). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For K_v/ℚ_p unramified, 𝒪_v = W(k_v), |p|_v = p^{-1}, and every finite unramified extension of K_v is cyclic with the arithmetic Frobenius as generator.
- `ComplexComparisonPartII:C5` (Algebraic de Rham–Betti comparison). Needed: For a smooth proper morphism of complex algebraic varieties, the analytic Gauss–Manin connection on the relative algebraic de Rham cohomology has the Betti local system R^q f_*ℂ as sheaf of horizontal sections (relative Gauss–Manin compatibility of the algebraic de Rham–Betti comparison).
- `AbelianSchemesAndArithmeticModuli:A5` (Complex uniformization with polarization and level). Needed: For an abelian scheme over a smooth complex variety T, the degree-one de Rham–Betti comparison H¹_dR(A/T)^an ≅ R¹f_*ℂ ⊗ 𝒪^an identifies ∇ with the connection whose horizontal sections are R¹f_*ℂ, and R¹f_*ℤ is a local system (Ehresmann).
- `CrystallineCohomology:CR.1` (Crystalline sites, structure sheaves and crystals). Needed: Crystals on the crystalline site of a smooth k-scheme and their description, on a p-adic formal lift, as modules with integrable quasi-nilpotent connection whose transition isomorphisms between two sections with the same reduction are given by the Taylor series of the connection (convergent on the PD-thickening; for p > 2 and an unramified base the ideal (p) has topologically nilpotent divided powers).
- `CrystallineCohomology:CR.2` (The PD Poincare lemma and de Rham computations). Needed: For a smooth proper lift 𝔛 over W(k) of a smooth proper k-scheme X₀: the natural isomorphism H^q_cris(X₀/W(k)) ≅ H^q_dR(𝔛/W(k)) (Berthelot–Ogus Corollary 7.4) and its naturality in the lift.
- `CrystallineCohomology:CR.3` (Descent, finiteness, base change and Frobenius). Needed: The Frobenius endomorphism of H^q_cris(X₀/W(k)) of a smooth proper k-scheme, semilinear for the Witt vector Frobenius and bijective after inverting p, functorial in X₀ and compatible with cup products.
- `CrystallineCohomology:CR.7` (Coefficient and arithmetic interfaces). Needed: Relative Gauss–Manin interface: for a smooth proper morphism g : 𝒳 → 𝒴 of smooth formal schemes over W(k) with locally free H^q_dR commuting with base change, the higher direct image R^q g_cris* 𝒪 is a crystal on 𝒴_k whose associated module with connection is (H^q_dR(𝒳/𝒴), ∇_GM), and whose value at a W(k')-point y is H^q_cris(𝒳_{ȳ}/W(k')), compatibly with Frobenius.

## Layer LV.3: Lagrangian period varieties and the complex and p-adic period maps

This layer defines the period varieties and period maps and proves the transfer of Zariski density from $\mathbb C$ to $K_v$ (LV Lemmas 3.1–3.3). The period variety of an abelian-by-finite family is defined directly as a closed subscheme of a Grassmannian of $K$-subspaces (the $E$-stable Lagrangians for the trace form), which is LV's Weil restriction without Weil-restriction machinery. Finiteness on a curve is made explicit through Strassmann's theorem.

### LV.3.A Objects

#### The Lagrangian Grassmannian

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/PeriodVariety/LagrangianGrassmannian`, namespace `TauCeti.LawrenceVenkatesh.Lagrangian`.

Let k be a field and (V, ω) a symplectic k-vector space of dimension 2d, as in the lemma on Lagrangian subspaces. LGr(V, ω) is the functor on commutative k-algebras A ↦ {W ∈ G(d, A ⊗ V; A) : ω_A(W, W) = 0}, where G(d, A ⊗ V; A) is Mathlib's Grassmannian of submodules with locally free quotient of rank d (for W isotropic of corank d this is the same as W being a rank-d direct summand); it is represented by a closed subscheme of the Grassmannian scheme Gr(V, d). Its k'-points for a field k' ⊇ k are the Lagrangian subspaces of V ⊗ k'. It carries the action of Sp(V, ω), the open charts U_{L'} (Lagrangians transverse to a fixed Lagrangian L'), each isomorphic to the affine space of symmetric maps L → L' ≅ L^*, and the Plücker embedding into ℙ(∧^d V) restricted from Gr(V, d).

**Construction.**

- Define the subfunctor of Mathlib's Grassmannian functor by the isotropy condition; it is compatible with base change because ω_A is.
- Representability: on the Grassmannian scheme the isotropy condition is the vanishing of the section of (∧²𝒲)^∨ induced by ω on the tautological subbundle 𝒲, a closed condition (R09.1).
- Charts: U_{L'} is the intersection with the open Schubert chart of subspaces transverse to L'; by (d) of the linear-algebra node, over every A its points are the graphs of symmetric A-linear maps, so U_{L'} ≅ 𝔸^{d(d+1)/2}.

**Declarations and API.**

- `LagrangianGrassmannian` (constructor): LGr(V, ω) as a closed subscheme of Gr(V, d) representing the isotropic-submodule subfunctor.
- `LagrangianGrassmannian.functor` (data): The subfunctor A ↦ {W ∈ G(d, A ⊗ V; A) : ω_A(W, W) = 0} of Module.Grassmannian.functor.
- `LagrangianGrassmannian.mem_points_iff` (characterisation): For a field k' ⊇ k, the k'-points are the Lagrangian subspaces of V ⊗ k'.
- `LagrangianGrassmannian.chart` (data): For a Lagrangian L' with complement L, the open subscheme U_{L'} ≅ 𝔸(Sym(L → L')) of Lagrangians transverse to L'.
- `LagrangianGrassmannian.chart_cover` (other): For a symplectic basis, the 2^d charts U_{Λ_I} cover LGr(V, ω).
- `LagrangianGrassmannian.plucker` (data): The closed immersion LGr(V, ω) → ℙ(∧^d V) restricted from the Plücker embedding.
- `LagrangianGrassmannian.action` (data): The action of Sp(V, ω) on LGr(V, ω) induced by g ↦ (W ↦ gW).
- `LagrangianGrassmannian.baseChange` (functoriality): LGr(V, ω) ⊗ k' = LGr(V ⊗ k', ω ⊗ k') for a field extension k'/k.
- `LagrangianGrassmannian.dimOne` (example): For d = 1, LGr(V, ω) = ℙ(V).

**Uses.** Lagrangian subspaces, adapted symplectic bases and transversal charts (`LV.3/lagrangian-symplectic-basis`); `mathlib:Module.Grassmannian`; `mathlib:Module.Grassmannian.functor`; `AlgebraicModuliForArithmeticGeometry:R09.1` (Projective parameter spaces).

**Tests.**

- d = 1: LGr(V) = ℙ(V) = ℙ¹.
- d = 2: LGr(V) is the hyperplane section of the Plücker quadric Gr(2, 4) ⊆ ℙ⁵ given by the class of ω, a smooth quadric threefold.

#### The Lagrangian period variety of a symplectic module over a finite étale algebra

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/PeriodVariety/Basic`, namespace `TauCeti.LawrenceVenkatesh.PeriodVariety`.

Let k be a field, E a finite étale k-algebra, V a free E-module of rank 2d and ω : V × V → E an E-bilinear, alternating, perfect pairing. Put ω_tr := tr_{E/k} ∘ ω, a nondegenerate alternating k-bilinear form on the k-space V of dimension 2d[E:k]. The period variety LGr_E(V, ω) is the closed subscheme of LGr(V, ω_tr) whose A-points are the Lagrangian W ⊆ A ⊗_k V that are E ⊗_k A-submodules. Equivalently, its A-points are the E ⊗ A-submodules W with (A ⊗ V)/W locally free of rank d[E:k] over A and ω_A(W, W) = 0. Its points over a field k' ⊇ k are the free (E ⊗ k')-submodules of rank d of V ⊗ k' that are isotropic for ω; it is LV's Res^E_k LGr(V, ω).

**Construction.**

- ω_tr is nondegenerate because the trace form of an étale algebra is nondegenerate and ω is perfect.
- For an E-stable W, ω(W, W) = 0 if and only if tr(e·ω(x, y)) = ω_tr(ex, y) = 0 for all e, x, y, i.e. if and only if ω_tr(W, W) = 0.
- E-stability is a closed condition on the Grassmannian (stability of the tautological subbundle under the finitely many endomorphisms given by a k-basis of E; R09.1), so LGr_E(V, ω) is a closed subscheme of LGr(V, ω_tr).
- Over a field, an E-stable isotropic W splits along the idempotents of E ⊗ k' into ω-isotropic pieces of rank ≤ d; the total dimension d[E:k] forces rank exactly d in each factor, giving the description of the points.

**Declarations and API.**

- `periodVariety` (constructor): LGr_E(V, ω) as a closed subscheme of LGr(V, tr ∘ ω).
- `periodVariety.mem_iff` (characterisation): W ∈ LGr_E(V, ω)(A) ↔ W is an E ⊗ A-submodule, (A ⊗ V)/W locally free of rank d[E:k], and ω_A(W, W) = 0.
- `periodVariety.mem_points_iff_free` (characterisation): Over a field k' ⊇ k the points are the free rank-d (E ⊗ k')-submodules isotropic for ω.
- `periodVariety.traceForm` (data): ω_tr = tr_{E/k} ∘ ω, nondegenerate and alternating.
- `periodVariety.baseChange` (functoriality): LGr_E(V, ω) ⊗ k' = LGr_{E⊗k'}(V ⊗ k', ω ⊗ k').
- `periodVariety.prodEquiv` (equivalence): For E = E₁ × E₂ (so V = V₁ × V₂), LGr_E(V, ω) ≅ LGr_{E₁}(V₁, ω₁) × LGr_{E₂}(V₂, ω₂), the projections sending W to e_i W.
- `periodVariety.semilinearAction` (data): The group of k-linear automorphisms g of V for which some s ∈ Aut_k(E) satisfies g(ex) = s(e)g(x) and ω(gx, gy) = s(ω(x, y)) acts on LGr_E(V, ω); it contains the E-linear symplectic group Sp_E(V, ω).
- `periodVariety.plucker` (data): The Plücker embedding LGr_E(V, ω) → ℙ(∧^{d[E:k]} V) restricted from LGr(V, ω_tr).
- `periodVariety.stableGrassmannian` (data): The closed subscheme Gr_E(V, d) ⊆ Gr(V, d[E:k]) of E-stable subspaces (LV's Res^E_k Gr), containing LGr_E(V, ω) as a closed subscheme; the group of E-linear automorphisms of V acts on it.
- `periodVariety.dimOne` (example): For d = 1 every E-line is isotropic and LGr_E(V, ω) is the variety of free rank-one E-submodules (LV §4.3).

**Uses.** The Lagrangian Grassmannian (`LV.3/lagrangian-grassmannian`); Splitting of a finite separable extension after base change to a splitting field (`LV.0/galois-tensor-splitting`); `mathlib:AlgebraicGeometry.Etale`; `AlgebraicModuliForArithmeticGeometry:R09.1` (Projective parameter spaces).

**Tests.**

- E = k: LGr_E(V, ω) = LGr(V, ω).
- E = k × k, d = 1: ℙ¹ × ℙ¹.
- E = ℚ(√2), k = ℚ, d = 1: the points over ℚ are the lines of ℚ(√2)², i.e. ℙ¹(ℚ(√2)), and the variety becomes ℙ¹ × ℙ¹ over ℚ(√2).

#### The algebraic monodromy group of an abelian-by-finite family and full monodromy (LV (3.5), (5.1))

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/PeriodMap/Monodromy`, namespace `TauCeti.LawrenceVenkatesh.AbelianByFiniteFamily`.

Let X →f Y' →π Y be an abelian-by-finite family of relative dimension d over a smooth connected complex variety Y, and y₀ ∈ Y(ℂ). The Betti local system 𝕍 := R¹(π∘f)_*ℚ on Y(ℂ) has fibre V_B = H¹_B(X_{y₀}(ℂ), ℚ) = ⊕_{y' ∈ π^{-1}(y₀)} H¹_B(X_{y'}(ℂ), ℚ), and parallel transport defines μ : π₁(Y(ℂ), y₀) → GL(V_B), normalized so that μ(δ) is transport backwards along the loop δ. The algebraic monodromy group Γ ⊆ GL(V_B ⊗ ℂ) is the Zariski closure of μ(π₁(Y(ℂ), y₀)). Each μ(δ) permutes the summands H¹_B(X_{y'}) according to the monodromy of the covering π and preserves the total polarization form Σ_{y'} ω_{y'}. The family has full monodromy if Γ ⊇ ∏_{y' ∈ π^{-1}(y₀)} Sp(H¹_B(X_{y'}(ℂ), ℂ), ω_{y'}). For a family over a K-variety and ι : K → ℂ, these notions refer to the base change along ι, and the de Rham–Betti comparison identifies V_B ⊗ ℂ with V_ℂ = ℋ_{y₀} ⊗_ι ℂ, the summands with the factors of E₀ ⊗_ι ℂ = ℂ^{π^{-1}(y₀)}, and ω_{y'} with the components of ω₀.

**Construction.**

- The local system and its monodromy come from the proper smooth morphism π∘f (Ehresmann) and the covering π.
- Zariski closure of the abstract subgroup μ(π₁) in the algebraic group GL(V_B ⊗ ℂ) (ReductiveGroups Layer 3); it is contained in the closed subgroup of elements normalizing the subalgebra ℂ^{π^{-1}(y₀)} of End(V_B ⊗ ℂ) and preserving Σω_{y'}, because μ(π₁) is.
- Full monodromy is a property of the pair (Γ, decomposition); it does not depend on y₀, since transport along a path conjugates the data.

**Declarations and API.**

- `monodromyRep` (constructor): μ : π₁(Y(ℂ), y₀) →* GL(V_B), transport backwards along loops.
- `algebraicMonodromyGroup` (constructor): Γ, the Zariski closure of the image of μ in GL(V_B ⊗ ℂ).
- `HasFullMonodromy` (constructor): The predicate Γ ⊇ ∏_{y'} Sp(H¹_B(X_{y'}), ω_{y'}).
- `algebraicMonodromyGroup_le_normalizer` (relation): Γ normalizes ℂ^{π^{-1}(y₀)} ⊆ End(V_B ⊗ ℂ) and preserves Σ_{y'} ω_{y'}; hence Γ acts on H_ℂ = LGr_{E₀⊗ℂ}(V_ℂ).
- `hasFullMonodromy_iff_basepoint` (characterisation): Full monodromy does not depend on y₀ ∈ Y(ℂ).
- `algebraicMonodromyGroup_deRham` (compatibility): Under the de Rham–Betti comparison V_B ⊗ ℂ ≅ V_ℂ the summands correspond to the factors of E₀ ⊗_ι ℂ and ω_{y'} to the components of ω₀.
- `HasFullMonodromy.orbit_eq` (other): If the family has full monodromy then Γ·h = H_ℂ(ℂ) for every h ∈ H_ℂ(ℂ) (transitivity on the period variety).
- `hasFullMonodromy_legendre` (example): The Legendre family has full monodromy; a constant family does not.

**Uses.** Abelian-by-finite families (LV Definition 5.1) (`LV.2/abelian-by-finite-family`); Complex Gauss–Manin transport and Betti parallel transport (LV (3.8)) (`LV.2/gauss-manin-transport-complex`); `AbelianSchemesAndArithmeticModuli:A5` (Complex uniformization with polarization and level); `ComplexComparisonPartII:C5` (Algebraic de Rham–Betti comparison); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation`; `mathlib:IsCoveringMap.monodromyPerm`.

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components); tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence — UniversalCovers Stage 2 (lifting criterion and Galois correspondence of covers).

**Tests.**

- The Legendre family over ℙ¹ ∖ {0, 1, ∞}: μ(π₁) is the principal congruence subgroup Γ(2) ⊆ SL₂(ℤ) up to the chosen basis, which is Zariski dense in SL₂ = Sp₂, so the family has full monodromy.
- A constant family A × Y has Γ = 1 and does not have full monodromy (for d ≥ 1).

#### The p-adic period map on a residue disk

*Construction* — module `TauCeti/NumberTheory/LawrenceVenkatesh/PeriodMap/Padic`, namespace `TauCeti.LawrenceVenkatesh.AbelianByFiniteFamily`.

Setting P: K is a number field with an embedding ι : K → ℂ; 𝒳 → 𝒴' → 𝒴 is a good model over 𝒪 = 𝒪_S of an abelian-by-finite family X → Y' → Y of relative dimension d, with π : Y' → Y finite étale of degree n and Y smooth and geometrically connected of dimension m over K; v ∉ S is a finite place with K_v/ℚ_p unramified and p > 2; y₀ ∈ 𝒴(𝒪); E₀ := E_{y₀}; V := ℋ_{y₀} = H¹_dR(X_{y₀}/K), a free E₀-module of rank 2d with the polarization pairing ω₀; H := LGr_{E₀}(V, ω₀); h₀ := F¹V ∈ H(K); V_v, H_v and V_ℂ, H_ℂ are the base changes along K → K_v and ι; Ω_v := Ω_v(y₀) with coordinates z : Ω_v ≅ (p𝒪_v)^m. The p-adic period map is Φ_v : Ω_v → H(K_v), Φ_v(y) := T_v(y)^{-1}(F¹ℋ_y ⊗ K_v), where T_v(y) is the Gauss–Manin transport of LV.2. It satisfies Φ_v(y₀) = h₀ and, for every y ∈ Ω_v, T_v(y) is an isomorphism of E-semilinear filtered φ-modules (ℋ_{y₀} ⊗ K_v, φ_{y₀}, Φ_v(y)) ≅ (ℋ_y ⊗ K_v, φ_y, F¹ℋ_y ⊗ K_v), semilinear over the transport isomorphism E₀ ⊗ K_v ≅ E_y ⊗ K_v.

**Construction.**

- T_v(y) is semilinear over the ring isomorphism E₀ ⊗ K_v ≅ E_y ⊗ K_v and carries ω₀ to ω_y up to that isomorphism, so the preimage of the E_y-stable Lagrangian F¹ℋ_y ⊗ K_v is an (E₀ ⊗ K_v)-stable Lagrangian of the right rank, i.e. a K_v-point of H.
- T_v(y₀) = id gives Φ_v(y₀) = h₀.
- The compatibility with Frobenius is part (b) of the crystalline Frobenius node of LV.2; the filtration statement is the definition of Φ_v.

**Declarations and API.**

- `padicPeriodMap` (constructor): Φ_v : Ω_v → H(K_v), y ↦ T_v(y)⁻¹(F¹ℋ_y ⊗ K_v).
- `padicPeriodMap_base` (simp): Φ_v(y₀) = h₀.
- `padicPeriodMap_mem` (other): Φ_v(y) is an (E₀ ⊗ K_v)-stable Lagrangian subspace of V_v.
- `padicPeriodMap_transport` (compatibility): T_v(y) : (V_v, φ_{y₀}, Φ_v(y)) ≅ (ℋ_y ⊗ K_v, φ_y, F¹) as filtered φ-modules, semilinear over E₀ ⊗ K_v ≅ E_y ⊗ K_v.
- `padicPeriodMap_rebase` (relation): For y₁ ∈ Ω_v, the period map based at y₁ is T_v(y₁)⁻¹ ∘ Φ_v, i.e. Φ_v^{y₁} = T_v(y₁) · Φ_v under the identification of the disks.
- `padicPeriodMap_constant` (example): A constant family has constant period map.

**Uses.** p-adic Gauss–Manin transport on a residue disk (LV (3.7)) (`LV.2/gauss-manin-transport-padic`); Crystalline Frobenius on the de Rham cohomology of the fibres and its compatibility with Gauss–Manin transport (LV (3.9)) (`LV.2/crystalline-frobenius-on-fibres`); The de Rham bundle of an abelian-by-finite family (`LV.2/de-rham-bundle`); Residue disks and their coordinates (`LV.2/residue-disk`); The Lagrangian period variety of a symplectic module over a finite étale algebra (`LV.3/lagrangian-period-variety`).

**Tests.**

- For a constant family A × 𝒴, Φ_v is constant with value h₀.
- For the Legendre family, Φ_v(λ) is the line of V_v transported back from F¹ = ⟨dx/y⟩ at λ, and Φ_v is not constant on any residue disk.

#### The complex period map and its equivariant continuation to the universal cover

*Construction* — module `TauCeti/NumberTheory/LawrenceVenkatesh/PeriodMap/Complex`, namespace `TauCeti.LawrenceVenkatesh.AbelianByFiniteFamily`.

Setting P: K is a number field with an embedding ι : K → ℂ; 𝒳 → 𝒴' → 𝒴 is a good model over 𝒪 = 𝒪_S of an abelian-by-finite family X → Y' → Y of relative dimension d, with π : Y' → Y finite étale of degree n and Y smooth and geometrically connected of dimension m over K; v ∉ S is a finite place with K_v/ℚ_p unramified and p > 2; y₀ ∈ 𝒴(𝒪); E₀ := E_{y₀}; V := ℋ_{y₀} = H¹_dR(X_{y₀}/K), a free E₀-module of rank 2d with the polarization pairing ω₀; H := LGr_{E₀}(V, ω₀); h₀ := F¹V ∈ H(K); V_v, H_v and V_ℂ, H_ℂ are the base changes along K → K_v and ι; Ω_v := Ω_v(y₀) with coordinates z : Ω_v ≅ (p𝒪_v)^m. Let Ω_ℂ ⊆ Y(ℂ) be a connected, simply connected open neighbourhood of y₀ (for Y = Y_ι^an). The complex period map is Φ_ℂ : Ω_ℂ → H_ℂ(ℂ), Φ_ℂ(y) := T_ℂ(y)^{-1}(F¹ℋ_y ⊗ ℂ). Let q : Ỹ → Y(ℂ) be the universal cover with base point ỹ₀ over y₀. The map Φ̃ : Ỹ → H_ℂ(ℂ), [γ] ↦ T_γ^{-1}(F¹ℋ_{γ(1)} ⊗ ℂ) (T_γ the parallel transport along the path γ from y₀), is holomorphic, satisfies Φ̃(ỹ₀) = h₀, agrees with Φ_ℂ ∘ q on the sheet over Ω_ℂ through ỹ₀, and is equivariant: Φ̃(δ·x) = μ(δ)·Φ̃(x) for δ ∈ π₁(Y(ℂ), y₀) acting by deck transformations.

**Construction.**

- On Ω_ℂ the transport T_ℂ(y) is defined (LV.2) and is semilinear over E₀ ⊗ ℂ ≅ E_y ⊗ ℂ and symplectic, so Φ_ℂ lands in H_ℂ, as in the p-adic case.
- Parallel transport in the local system R¹(π∘f)_*ℂ depends only on the homotopy class of γ, which defines Φ̃ on the universal cover (Tau Ceti's universal cover as homotopy classes of paths from the base point).
- Holomorphy: locally Φ̃ is Φ_ℂ based at another point composed with a constant transport; Φ_ℂ is given near y₀ by convergent power series (common-series lemma) and the Hodge bundle is a holomorphic subbundle.
- Equivariance: T_{δ·γ} = T_γ ∘ T_δ for the concatenation δ·γ (first δ, then γ), so Φ̃(δ·x) = T_δ^{-1}(Φ̃(x)) = μ(δ)·Φ̃(x).

**Declarations and API.**

- `complexPeriodMap` (constructor): Φ_ℂ : Ω_ℂ → H_ℂ(ℂ).
- `complexPeriodMap.lift` (constructor): Φ̃ : Ỹ → H_ℂ(ℂ) on the universal cover.
- `complexPeriodMap.lift_base` (simp): Φ̃(ỹ₀) = h₀.
- `complexPeriodMap.lift_equivariant` (relation): Φ̃(δ·x) = μ(δ)·Φ̃(x).
- `complexPeriodMap.lift_holomorphic` (other): Φ̃ is holomorphic in Plücker charts.
- `complexPeriodMap.lift_eq` (compatibility): Φ̃ = Φ_ℂ ∘ q on the sheet over Ω_ℂ containing ỹ₀.
- `complexPeriodMap.mem` (other): Φ̃ takes values in H_ℂ(ℂ), the (E₀ ⊗ ℂ)-stable Lagrangians.
- `complexPeriodMap.legendre` (example): The Legendre period map on the upper half-plane.

**Uses.** Complex Gauss–Manin transport and Betti parallel transport (LV (3.8)) (`LV.2/gauss-manin-transport-complex`); The algebraic monodromy group of an abelian-by-finite family and full monodromy (LV (3.5), (5.1)) (`LV.3/algebraic-monodromy-group`); The Lagrangian period variety of a symplectic module over a finite étale algebra (`LV.3/lagrangian-period-variety`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `ComplexComparisonPartII:C0` (Coherent analytic modules on algebraic analytifications); `tauceti:TauCeti.UniversalCover`; `mathlib:IsCoveringMap.existsUnique_continuousMap_lifts`.

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence — UniversalCovers Stage 2 (lifting criterion and Galois correspondence of covers).

**Tests.**

- For a constant family Φ̃ is constant.
- For the Legendre family and d = 1, Φ̃ is the map from the upper half-plane cover of ℙ¹ ∖ {0, 1, ∞} to ℙ¹ given by the ratio of the periods of dx/y, equivariant for Γ(2).

### LV.3.B Theorems

#### Lagrangian subspaces, adapted symplectic bases and transversal charts

*Lemma* `TauCeti.LawrenceVenkatesh.Lagrangian.lagrangian_symplectic_basis` — module `TauCeti/NumberTheory/LawrenceVenkatesh/PeriodVariety/LagrangianLinearAlgebra`.

Let k be a field and (V, ω) a 2d-dimensional k-vector space with a nondegenerate alternating bilinear form. (a) Every isotropic subspace has dimension ≤ d, and an isotropic subspace L is Lagrangian (L = L^⊥) if and only if dim L = d. (b) Every Lagrangian L has a Lagrangian complement L', and every basis e_1, …, e_d of L extends to a symplectic basis (e_i, f_i) (ω(e_i, f_j) = δ_ij, ω(e_i, e_j) = ω(f_i, f_j) = 0) with f_i ∈ L'. (c) Sp(V, ω)(k) acts transitively on the set of Lagrangian subspaces of V. (d) For Lagrangians L, L' with V = L ⊕ L', the Lagrangians transverse to L' are exactly the graphs {x + Sx : x ∈ L} of the linear maps S : L → L' with ω(x, Sy) = ω(y, Sx) for all x, y ∈ L; in a symplectic basis adapted to (L, L') these are the symmetric d × d matrices. (e) (Arnold) For a symplectic basis (e_i, f_i) and I ⊆ {1, …, d}, put Λ_I = span(e_i : i ∈ I; f_j : j ∉ I); every Lagrangian L is transverse to Λ_I for some I.

**Proof.**

- (a) dim L + dim L^⊥ = 2d for nondegenerate ω, and L ⊆ L^⊥ for isotropic L.
- (b) The map V → L^*, u ↦ ω(u, ·)|_L, is surjective with kernel L^⊥ = L; for any complement W of L it restricts to an isomorphism W ≅ L^*. Let g_i ∈ W be dual to e_i, i.e. ω(g_i, e_j) = −δ_ij. Put f_i = g_i + Σ_{j<i} a_ij e_j with a_ij = −ω(g_i, g_j); for j < i one computes ω(f_i, f_j) = ω(g_i, g_j) + a_ij = 0 (a triangular correction that needs no division by 2), and ω(e_i, f_j) = δ_ij, so (e_i, f_i) is a symplectic basis and L' = span(f_i) is a Lagrangian complement of L.
- (c) Given Lagrangians L_1, L_2, choose symplectic bases adapted to each by (b); the linear map sending one basis to the other is symplectic and maps L_1 to L_2.
- (d) A complement of L' is the graph of a unique linear S : L → L'. Since ω vanishes on L × L and on L' × L', ω(x + Sx, y + Sy) = ω(x, Sy) + ω(Sx, y), which vanishes for all x, y exactly when ω(x, Sy) = ω(y, Sx); a d-dimensional isotropic graph is Lagrangian by (a).
- (e) Let K = L ∩ span(e_1, …, e_d). Choose I such that (e_i)_{i∈I} is a basis of a complement of K in span(e) (exchange lemma). If u = Σ_{i∈I} a_i e_i + Σ_{j∉I} b_j f_j lies in L, pairing with κ ∈ K ⊆ L gives Σ_{j∉I} b_j κ_j = 0, where κ_j is the e_j-coordinate of κ; the projection of K onto span(e_j : j ∉ I) is bijective, so b = 0; then u ∈ K ∩ span(e_I) = 0.

**Uses.** `mathlib:LinearMap.BilinForm.IsAlt`; `mathlib:LinearMap.BilinForm.Nondegenerate`; `mathlib:LinearMap.BilinForm.orthogonal`; `mathlib:LinearMap.BilinForm.finrank_orthogonal`; `tauceti:TauCeti.BilinForm.isometryGroup`.

**Tests.**

- d = 1: every line of (k², det) is Lagrangian and SL₂(k) = Sp₂(k) acts transitively on ℙ¹(k).
- In k⁴ with basis (e₁, e₂, f₁, f₂): span(e₁, f₂) is Lagrangian, span(e₁, f₁) is not; the graph of the symmetric matrix [[1, 2], [2, 3]] over span(e) is Lagrangian and the graph of [[0, 1], [0, 0]] is not.
- (e) for L = span(f₁, e₂) and the basis above: L is transverse to Λ_{{1}} = span(e₁, f₂).

#### The Lagrangian Grassmannian is smooth, projective and geometrically irreducible of dimension d(d+1)/2

*Lemma* `TauCeti.LawrenceVenkatesh.lagrangian_grassmannian_geometry` — module `TauCeti/NumberTheory/LawrenceVenkatesh/PeriodVariety/LagrangianGrassmannian`.

For (V, ω) as in the Lagrangian Grassmannian node, LGr(V, ω) is smooth and projective over k, geometrically irreducible, of dimension d(d+1)/2, and Sp(V, ω)(k̄) acts transitively on LGr(V, ω)(k̄). Consequently every Zariski-closed subset of LGr(V, ω)_{k'} (k' ⊇ k a field) other than the whole space has dimension < d(d+1)/2, and a set of k'-points is Zariski dense if and only if no nonzero homogeneous polynomial in the Plücker coordinates that is nonzero on LGr vanishes on it.

**Proof.**

- Projective: closed in the projective Grassmannian.
- Smooth of dimension d(d+1)/2: by (e) of the linear-algebra node the charts U_{Λ_I} cover, and each is an affine space of that dimension.
- Geometrically irreducible: over k̄, any two charts U_{Λ_I}, U_{Λ_J} meet, since the Lagrangians transverse to Λ_J form a nonempty open subset of the irreducible U_{Λ_I} ≅ 𝔸^{d(d+1)/2} (nonempty by (b)); a scheme covered by irreducible open subsets that pairwise meet is irreducible.
- Transitivity is (c) of the linear-algebra node over k̄.
- The dimension statements are dimension theory for integral varieties (a proper closed subset of an integral variety has smaller dimension).

**Uses.** The Lagrangian Grassmannian (`LV.3/lagrangian-grassmannian`); Lagrangian subspaces, adapted symplectic bases and transversal charts (`LV.3/lagrangian-symplectic-basis`); `SchemeAndStackFoundations:SF.0` (Schemes and morphisms); `mathlib:AlgebraicGeometry.IsIntegral`; `mathlib:IrreducibleSpace`.

**Tests.**

- d = 1: ℙ¹, dimension 1.
- d = 2: dimension 3.
- d = 3: dimension 6, while Gr(3, 6) has dimension 9.

#### Geometry of the period variety

*Lemma* `TauCeti.LawrenceVenkatesh.lagrangian_period_variety_splitting` — module `TauCeti/NumberTheory/LawrenceVenkatesh/PeriodVariety/Basic`.

Let k, E, V, ω be as in the period-variety node and let k' ⊇ k be a field over which E splits, Σ = Hom_k(E, k'). Then E ⊗ k' = k'^Σ, V ⊗ k' = ⊕_{τ∈Σ} V_τ with each (V_τ, ω_τ) a 2d-dimensional symplectic k'-space, and LGr_E(V, ω) ⊗ k' ≅ ∏_{τ∈Σ} LGr(V_τ, ω_τ). Consequently LGr_E(V, ω) is smooth, projective and geometrically irreducible of dimension [E:k]·d(d+1)/2; Sp_E(V, ω)(k̄) = ∏_τ Sp(V_τ, ω_τ)(k̄) acts transitively on its k̄-points; and for a decomposition E = E₁ × E₂ the projection LGr_E(V, ω) → LGr_{E₁}(V₁, ω₁) is surjective (with a section through any point) and maps Zariski-dense sets of points to Zariski-dense sets. For d = 1, LGr_E(V, ω) ⊗ k' ≅ ∏_τ ℙ(V_τ) ≅ (ℙ¹)^Σ.

**Proof.**

- The splitting of E ⊗ k' and of V ⊗ k' by idempotents is the Galois splitting lemma of LV.0; ω ⊗ k' is diagonal because it is E-bilinear.
- An E ⊗ k'-stable isotropic W of the right rank is ⊕_τ W_τ with W_τ Lagrangian in V_τ, which gives the product decomposition functorially in k'-algebras.
- Smoothness, projectivity, dimension and geometric irreducibility follow from the corresponding statements for each factor (products of smooth projective geometrically irreducible varieties) and descend along k'/k.
- Transitivity is factorwise transitivity.
- Surjectivity of the projection and density: the projection is a product projection over k'; for a continuous surjection the image of a dense set is dense.

**Uses.** The Lagrangian period variety of a symplectic module over a finite étale algebra (`LV.3/lagrangian-period-variety`); The Lagrangian Grassmannian is smooth, projective and geometrically irreducible of dimension d(d+1)/2 (`LV.3/lagrangian-grassmannian-geometry`); Splitting of a finite separable extension after base change to a splitting field (`LV.0/galois-tensor-splitting`); `SchemeAndStackFoundations:SF.0` (Schemes and morphisms).

**Tests.**

- E = ℚ(ζ₈), k = ℚ, d = 1: dimension 4 = [E:ℚ].
- The S-unit case of LV §4.3: E = K_v(t₀^{1/m}) of degree m ≥ 8 over K_v, d = 1, so dim H_v = m ≥ 8.
- The case of LV Lemma 6.2: E₁ = K(y')_w of degree ≥ 8 over K_v gives a factor of dimension ≥ 4d(d+1).

#### The complex and p-adic period maps are given by one tuple of power series over K

*Lemma* `TauCeti.LawrenceVenkatesh.AbelianByFiniteFamily.period_maps_common_series` — module `TauCeti/NumberTheory/LawrenceVenkatesh/PeriodMap/CommonSeries`.

Setting P: K is a number field with an embedding ι : K → ℂ; 𝒳 → 𝒴' → 𝒴 is a good model over 𝒪 = 𝒪_S of an abelian-by-finite family X → Y' → Y of relative dimension d, with π : Y' → Y finite étale of degree n and Y smooth and geometrically connected of dimension m over K; v ∉ S is a finite place with K_v/ℚ_p unramified and p > 2; y₀ ∈ 𝒴(𝒪); E₀ := E_{y₀}; V := ℋ_{y₀} = H¹_dR(X_{y₀}/K), a free E₀-module of rank 2d with the polarization pairing ω₀; H := LGr_{E₀}(V, ω₀); h₀ := F¹V ∈ H(K); V_v, H_v and V_ℂ, H_ℂ are the base changes along K → K_v and ι; Ω_v := Ω_v(y₀) with coordinates z : Ω_v ≅ (p𝒪_v)^m. Let r = 2dn and choose parameters z = (z_1, …, z_m) at the reduction of y₀ as in LV.2 and a frame v_1, …, v_r of ℋ near it with v_1, …, v_{dn} a frame of F¹ℋ. Index Plücker coordinates of Gr(V, dn) by the dn-element subsets I of {1, …, r}, and let B_I ∈ K[[z]] be the I-th maximal minor of the r × dn matrix formed by the first dn columns of Φ^{-1}, where Φ ∈ GL_r(K[[z]]) is the formal horizontal frame of LV.2. Then: (a) α!·B_{I,α} ∈ 𝒪_(v) for every multi-index α; (b) x ↦ B_I(px) is a restricted power series over 𝒪_v and B_{I₀}(px) ≡ 1 mod p for I₀ = {1, …, dn}; (c) for y ∈ Ω_v, Φ_v(y) has Plücker coordinates (B_I(z(y)))_I; (d) there is ρ > 0 such that the series ι(B_I) converge on U_ℂ = {|z_i| < ρ}, z is a biholomorphism from a neighbourhood of y₀ in Y(ℂ) onto a domain containing U_ℂ, and Φ_ℂ(y) has Plücker coordinates (ι(B_I)(z(y)))_I for z(y) ∈ U_ℂ; (e) B_I(0) = δ_{I,I₀}, the Plücker coordinates of h₀.

**Proof.**

- In the frame (v_i), T_v(y) has matrix Φ(z(y)) (LV.2), and F¹ℋ_y is spanned by v_1(y), …, v_{dn}(y); hence T_v(y)^{-1}(F¹ℋ_y) is the column span of the first dn columns of Φ(z(y))^{-1}, whose Plücker coordinates are the maximal minors.
- Φ^{-1} satisfies ∂_k Ψ = Ψ A_k and has α!-integral coefficients (LV.2); series with α!-integral coefficients form a ring, because (fg)_γ γ! = Σ_{α ≤ γ} binom(γ, α)(f_α α!)(g_{γ−α}(γ−α)!), so the minors B_I are α!-integral.
- Restrictedness and the congruence follow as in LV.2 from Legendre's bound v_p(α!) ≤ |α|/(p−1) with p > 2; the congruence Φ^{-1}(px) ≡ 1 mod p gives B_{I₀}(px) ≡ 1, so the coordinates have no common zero on the disk.
- Complex side: the complex transport has matrix ι(Φ)(z(y)) near y₀ (LV.2), and algebraic parameters at y₀ are holomorphic coordinates whose Taylor expansions are the images of the algebraic ones (ComplexComparisonPartII C0), so the same minors give Φ_ℂ.

**Uses.** The p-adic period map on a residue disk (`LV.3/padic-period-map`); The complex period map and its equivariant continuation to the universal cover (`LV.3/complex-period-map`); Formal horizontal sections of an integrable connection with integral coefficients (`LV.2/formal-horizontal-sections`); p-adic convergence of formal horizontal sections on the residue disk (`LV.2/horizontal-sections-padic-convergence`); Complex convergence of formal horizontal sections (majorants) (`LV.2/horizontal-sections-complex-convergence`); p-adic Gauss–Manin transport on a residue disk (LV (3.7)) (`LV.2/gauss-manin-transport-padic`); Complex Gauss–Manin transport and Betti parallel transport (LV (3.8)) (`LV.2/gauss-manin-transport-complex`); `ComplexComparisonPartII:C0` (Coherent analytic modules on algebraic analytifications); `mathlib:Nat.factorization_factorial_le_div_pred`; `mathlib:MvPowerSeries.IsRestricted`; `mathlib:MvPowerSeries`.

**Tests.**

- Constant family: B_I = δ_{I,I₀} identically.
- Legendre family near λ₀ (n = d = 1, r = 2): (B_{{1}}, B_{{2}}) is the first column of Φ^{-1}, whose entries satisfy the Picard–Fuchs system of the frame (dx/y, x dx/y).

#### The Zariski closure of the complex period image contains the monodromy orbit (LV Lemma 3.1)

*Lemma* `TauCeti.LawrenceVenkatesh.complex_period_closure_contains_orbit` — module `TauCeti/NumberTheory/LawrenceVenkatesh/PeriodMap/Complex`.

Setting P: K is a number field with an embedding ι : K → ℂ; 𝒳 → 𝒴' → 𝒴 is a good model over 𝒪 = 𝒪_S of an abelian-by-finite family X → Y' → Y of relative dimension d, with π : Y' → Y finite étale of degree n and Y smooth and geometrically connected of dimension m over K; v ∉ S is a finite place with K_v/ℚ_p unramified and p > 2; y₀ ∈ 𝒴(𝒪); E₀ := E_{y₀}; V := ℋ_{y₀} = H¹_dR(X_{y₀}/K), a free E₀-module of rank 2d with the polarization pairing ω₀; H := LGr_{E₀}(V, ω₀); h₀ := F¹V ∈ H(K); V_v, H_v and V_ℂ, H_ℂ are the base changes along K → K_v and ι; Ω_v := Ω_v(y₀) with coordinates z : Ω_v ≅ (p𝒪_v)^m. Assume Y(ℂ) is connected, and let U ⊆ Ω_ℂ be a nonempty open subset. Then Γ·h₀ ⊆ Z for every Zariski-closed subset Z ⊆ H_ℂ containing Φ_ℂ(U); that is, Γ·h₀ is contained in the Zariski closure of Φ_ℂ(U). If the family has full monodromy, Φ_ℂ(U) is Zariski dense in H_ℂ.

**Proof.**

- Let Z be defined by homogeneous Plücker polynomials Q_1, …, Q_s. In a local holomorphic frame of the pulled-back Hodge bundle, Q_i ∘ Φ̃ is a holomorphic function up to a nowhere vanishing factor; it vanishes on the nonempty open set q^{-1}(U) ∩ (sheet), hence on the connected manifold Ỹ by the identity theorem. So Φ̃(Ỹ) ⊆ Z.
- By equivariance, μ(δ)·h₀ = Φ̃(δ·ỹ₀) ∈ Z for all δ ∈ π₁.
- The transporter {g ∈ GL(V_ℂ) : g·h₀ ∈ Z} is Zariski closed and contains μ(π₁), hence contains Γ.
- Under full monodromy Γ·h₀ = H_ℂ(ℂ) (transitivity on the period variety), so every closed Z ⊇ Φ_ℂ(U) is all of H_ℂ.

**Uses.** The complex period map and its equivariant continuation to the universal cover (`LV.3/complex-period-map`); The algebraic monodromy group of an abelian-by-finite family and full monodromy (LV (3.5), (5.1)) (`LV.3/algebraic-monodromy-group`); Geometry of the period variety (`LV.3/lagrangian-period-variety-splitting`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `ComplexComparisonPartII:C4` (Chow algebraization and morphism comparison); `mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`.

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components).

**Tests.**

- Constant family: Γ·h₀ = {h₀} = Φ_ℂ(U).
- Legendre family: the closure of Φ_ℂ(U) is ℙ¹.

#### A power series vanishing on an open polydisk is zero

*Lemma* `TauCeti.LawrenceVenkatesh.convergent_series_vanishing` — module `TauCeti/NumberTheory/LawrenceVenkatesh/PeriodMap/Zariski`.

Let F be ℂ or a complete nonarchimedean valued field of characteristic zero, and let f ∈ F[[z_1, …, z_m]] converge absolutely on U = {z ∈ F^m : |z_i| < ε} for some ε > 0. If f(z) = 0 for all z ∈ U, then f = 0.

**Proof.**

- The series defines an analytic function on U whose formal multilinear series at 0 has homogeneous terms f_n (the degree-n parts of f).
- Since the function vanishes near 0, every homogeneous term vanishes at every point: f_n(y) = 0 for all y ∈ F^m (HasFPowerSeriesAt.apply_eq_zero, valid over any nontrivially normed field).
- F is infinite, so a polynomial vanishing on F^m is zero (MvPolynomial.funext); hence f_n = 0 for all n.

**Uses.** `mathlib:HasFPowerSeriesAt.apply_eq_zero`; `mathlib:MvPolynomial.funext`; `mathlib:HasFPowerSeriesOnBall`; `mathlib:MvPowerSeries`.

**Tests.**

- Σ z^k/k! over ℚ_p converges on |z| < p^{−1/(p−1)} and is nonzero there.
- z₁z₂ vanishes on the coordinate axes, which contain no open polydisk.

#### Complex and v-adic Zariski closures of a power-series map descend to one K-subscheme (LV Lemma 3.2)

*Lemma* `TauCeti.LawrenceVenkatesh.power_series_zariski_closure` — module `TauCeti/NumberTheory/LawrenceVenkatesh/PeriodMap/Zariski`.

Let K be a number field with an embedding ι : K → ℂ and a finite place v, and let B_0, …, B_N ∈ K[[z_1, …, z_m]] be such that the series B_i converge absolutely without common zero on U_v = {|z_i|_v < ε_v} ⊆ K_v^m, and the series ι(B_i) converge absolutely without common zero on U_ℂ = {|z_i| < ε_ℂ} ⊆ ℂ^m (ε_v, ε_ℂ > 0). Let I ⊆ K[x_0, …, x_N] be the ideal generated by the homogeneous Q with Q(B_0, …, B_N) = 0 in K[[z]], and Z ⊆ ℙ^N_K the closed subscheme it defines. Then I is a homogeneous prime ideal, Z is integral, and Z ⊗ K_v (respectively Z ⊗_ι ℂ) is the Zariski closure of B^v(U_v) ⊆ ℙ^N(K_v) (respectively of B^ℂ(U_ℂ) ⊆ ℙ^N(ℂ)); in particular these closures are integral and have the same dimension.

**Proof.**

- A homogeneous Q_v ∈ K_v[x] of degree e vanishes on B^v(U_v) if and only if Q_v(B) vanishes on U_v, if and only if Q_v(B) = 0 in K_v[[z]] (vanishing lemma for convergent series).
- The coefficients of Q_v(B) are K-linear forms in the coefficients of Q_v; the solutions of this system in the finite-dimensional space of degree-e forms are cut out by finitely many of the equations, and the solution space of a finite K-linear system commutes with the flat base change K → K_v. So the vanishing ideal of B^v(U_v) is I ⊗ K_v; likewise over ℂ.
- Primality: K[[z]] and K_v[[z]] are domains, so if a product of homogeneous forms kills B one factor does; the same argument shows I ⊗ K_v and I ⊗_ι ℂ are prime.
- Dimensions of a closed subscheme and of its base change agree.

**Uses.** A power series vanishing on an open polydisk is zero (`LV.3/convergent-series-vanishing`); `mathlib:Module.Flat.ker_lTensor_eq`; `mathlib:MvPolynomial.vanishingIdeal`; `mathlib:MvPolynomial.zeroLocus`; `AlgebraicModuliForArithmeticGeometry:R09.1` (Projective parameter spaces).

**Tests.**

- B = (1, z, z²): Z is the conic x₀x₂ = x₁².
- B = (1, Σ z^k/k!) with ε_v = |p|^{1/(p−1)}: Z = ℙ¹, since the image is infinite.

#### Zariski closure of the p-adic period image (LV Lemma 3.3) and density under full monodromy

*Theorem* `TauCeti.LawrenceVenkatesh.AbelianByFiniteFamily.padic_period_image_dense` — module `TauCeti/NumberTheory/LawrenceVenkatesh/PeriodMap/Zariski`.

Setting P: K is a number field with an embedding ι : K → ℂ; 𝒳 → 𝒴' → 𝒴 is a good model over 𝒪 = 𝒪_S of an abelian-by-finite family X → Y' → Y of relative dimension d, with π : Y' → Y finite étale of degree n and Y smooth and geometrically connected of dimension m over K; v ∉ S is a finite place with K_v/ℚ_p unramified and p > 2; y₀ ∈ 𝒴(𝒪); E₀ := E_{y₀}; V := ℋ_{y₀} = H¹_dR(X_{y₀}/K), a free E₀-module of rank 2d with the polarization pairing ω₀; H := LGr_{E₀}(V, ω₀); h₀ := F¹V ∈ H(K); V_v, H_v and V_ℂ, H_ℂ are the base changes along K → K_v and ι; Ω_v := Ω_v(y₀) with coordinates z : Ω_v ≅ (p𝒪_v)^m. Assume Y(ℂ) is connected. There is an integral closed K-subscheme Z ⊆ H such that Z ⊗ K_v is the Zariski closure of Φ_v(Ω_v) in H_v and Z ⊗_ι ℂ is the Zariski closure of Φ_ℂ(U_ℂ) for a polydisk U_ℂ around y₀ as in the common-series node; Z ⊗_ι ℂ ⊇ Γ·h₀. In particular dim_{K_v} of the closure of Φ_v(Ω_v) is at least the dimension of the Zariski closure of Γ·h₀. If the family has full monodromy then Z = H: Φ_v(Ω_v) is Zariski dense in H_v, and its image under every factor projection of H_v (along a decomposition of E₀ ⊗ K_v into a product of K_v-algebras) is Zariski dense in that factor.

**Proof.**

- Apply LV Lemma 3.2 to the Plücker series B_I of the common-series node with U_v = {|z_i|_v < 1} = (p𝒪_v)^m (v unramified) and U_ℂ; Z is the resulting integral K-subscheme of the Plücker space.
- Z ⊆ H: the ideal of H is contained in I ⊗ K_v ∩ K[x] = I, because Φ_v takes values in H.
- LV Lemma 3.1 with U = z^{-1}(U_ℂ) gives Γ·h₀ ⊆ Z ⊗ ℂ; dimensions agree after base change.
- Full monodromy: Γ·h₀ = H_ℂ(ℂ), so Z ⊗ ℂ = H ⊗ ℂ, hence Z = H (a closed subscheme is determined by its base change along a field extension); the factor statement follows from the splitting lemma.

**Uses.** Complex and v-adic Zariski closures of a power-series map descend to one K-subscheme (LV Lemma 3.2) (`LV.3/power-series-zariski-closure`); The complex and p-adic period maps are given by one tuple of power series over K (`LV.3/period-maps-common-series`); The Zariski closure of the complex period image contains the monodromy orbit (LV Lemma 3.1) (`LV.3/complex-period-closure-contains-orbit`); Geometry of the period variety (`LV.3/lagrangian-period-variety-splitting`); The algebraic monodromy group of an abelian-by-finite family and full monodromy (LV (3.5), (5.1)) (`LV.3/algebraic-monodromy-group`).

**Tests.**

- Legendre family: Z = H = ℙ¹ and Φ_v is nonconstant on every residue disk.
- Constant family: Z = {h₀}.

#### Strassmann's theorem

*Theorem* `TauCeti.PowerSeries.card_zeros_le_strassmannBound` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Analysis/Strassmann`.

Let F be a complete nonarchimedean valued field with valuation ring 𝒪_F, and f = Σ_{n≥0} a_n x^n ∈ F[[x]] with a_n → 0 and not all a_n zero. Let N(f) be the largest n with |a_n| = max_k |a_k|. Then f has at most N(f) zeros in 𝒪_F. In particular a nonzero restricted power series over 𝒪_F has finitely many zeros in 𝒪_F.

**Proof.**

- Induction on N = N(f). If N = 0 then |a_0| > |a_n| for n ≥ 1, so |f(x)| = |a_0| ≠ 0 for |x| ≤ 1.
- If f(α) = 0 with α ∈ 𝒪_F, then f(x) = f(x) − f(α) = (x − α)g(x) with g = Σ_j b_j x^j, b_j = Σ_{n>j} a_n α^{n−1−j}. Then b_j → 0, |b_j| ≤ |a_N| for all j, |b_{N−1}| = |a_N| and |b_j| < |a_N| for j ≥ N; so N(g) = N − 1.
- Every zero of f in 𝒪_F other than α is a zero of g, so f has at most 1 + (N − 1) zeros.

**Uses.** `mathlib:PowerSeries.IsRestricted`.

**Tests.**

- Over ℚ_p, f = 1 + pX + X² + pX⁵ has N(f) = 2; it has no zeros in ℤ₂ or ℤ₃ and two zeros in ℤ₅ (Conrad, Example 4.2).
- X^n − p has N = n and no zeros in ℤ_p for n ≥ 2.

#### On a curve, the p-adic period map meets a closed subset not containing its image in finitely many points

*Theorem* `TauCeti.LawrenceVenkatesh.AbelianByFiniteFamily.padic_period_preimage_finite` — module `TauCeti/NumberTheory/LawrenceVenkatesh/PeriodMap/Finiteness`.

Setting P: K is a number field with an embedding ι : K → ℂ; 𝒳 → 𝒴' → 𝒴 is a good model over 𝒪 = 𝒪_S of an abelian-by-finite family X → Y' → Y of relative dimension d, with π : Y' → Y finite étale of degree n and Y smooth and geometrically connected of dimension m over K; v ∉ S is a finite place with K_v/ℚ_p unramified and p > 2; y₀ ∈ 𝒴(𝒪); E₀ := E_{y₀}; V := ℋ_{y₀} = H¹_dR(X_{y₀}/K), a free E₀-module of rank 2d with the polarization pairing ω₀; H := LGr_{E₀}(V, ω₀); h₀ := F¹V ∈ H(K); V_v, H_v and V_ℂ, H_ℂ are the base changes along K → K_v and ι; Ω_v := Ω_v(y₀) with coordinates z : Ω_v ≅ (p𝒪_v)^m. Assume m = 1 (Y is a curve). (a) For every Zariski-closed subset Z' ⊆ H_v with Φ_v(Ω_v) ⊄ Z'(K_v), the set {y ∈ Ω_v : Φ_v(y) ∈ Z'(K_v)} is finite. (b) Assume moreover that Y(ℂ) is connected, and let Z_v be the Zariski closure of Φ_v(Ω_v). If Z' ⊆ H_v is closed with dim Z' < dim Z_v, then Φ_v(Ω_v) ⊄ Z', so (a) applies; under full monodromy Z_v = H_v. (c) For a decomposition E₀ ⊗ K_v = E₁ × E' with factor projection pr₁ : H_v → H₁ = LGr_{E₁}(V₁, ω₁), let Z₁ be the Zariski closure of pr₁Φ_v(Ω_v); if B₁ ⊆ H₁ is closed with dim B₁ < dim Z₁, then {y ∈ Ω_v : pr₁Φ_v(y) ∈ B₁(K_v)} is finite; under full monodromy Z₁ = H₁.

**Proof.**

- (a) Choose y₁ with Φ_v(y₁) ∉ Z'. Closed subsets of projective space are cut out by homogeneous forms, so some homogeneous Q with coefficients in 𝒪_v vanishes on Z' and not at Φ_v(y₁).
- g(x) := Q(B(px)) is a restricted power series over 𝒪_v in one variable (restricted series form a subring), and g(x₁) ≠ 0 for x₁ = z(y₁)/p, so g ≠ 0.
- y ↦ z(y)/p is a bijection Ω_v ≅ 𝒪_v and Φ_v(y) ∈ Z' forces g(z(y)/p) = 0; Strassmann's theorem bounds the number of zeros.
- (b) If Φ_v(Ω_v) ⊆ Z' then Z_v ⊆ Z' and dim Z_v ≤ dim Z'. The full-monodromy statement is LV Lemma 3.3 with density.
- (c) Apply (a) to Z' = pr₁^{-1}(B₁): if Φ_v(Ω_v) ⊆ pr₁^{-1}(B₁), then pr₁Φ_v(Ω_v) ⊆ B₁ and Z₁ ⊆ B₁, contradicting dim B₁ < dim Z₁. Under full monodromy the projection of a dense set is dense (splitting lemma).

**Uses.** Zariski closure of the p-adic period image (LV Lemma 3.3) and density under full monodromy (`LV.3/padic-period-image-dense`); Strassmann's theorem (`LV.3/strassmann`); The complex and p-adic period maps are given by one tuple of power series over K (`LV.3/period-maps-common-series`); Geometry of the period variety (`LV.3/lagrangian-period-variety-splitting`); `mathlib:MvPowerSeries.IsRestricted.subring`; `mathlib:MvPowerSeries.IsRestricted`.

**Tests.**

- Legendre family, Z' = {a point}: only finitely many λ in a residue disk have Φ_v(λ) equal to a given line.
- The hypothesis m = 1 is needed: for m ≥ 2 the preimage of a proper closed subset is in general an analytic subset of positive dimension.

### LV.3.C Dependencies

Within this roadmap: `MordellLawrenceVenkatesh:LV.0`, `MordellLawrenceVenkatesh:LV.2`.

Other roadmaps:

- `AlgebraicModuliForArithmeticGeometry:R09.1` (Projective parameter spaces). Needed: For a finite-dimensional vector space V over a field F: a smooth projective F-scheme representing Mathlib's Module.Grassmannian.functor, with its Plücker closed immersion, standard affine charts and base change along field extensions; closed subschemes of Grassmannians cut out by (i) stability of the tautological subbundle under finitely many given endomorphisms of V and (ii) vanishing of a given bilinear form on the tautological subbundle; closed subschemes of ℙ^N_F defined by homogeneous ideals, the Zariski closure of a set of points, and compatibility of both with base change along field extensions.
- `SchemeAndStackFoundations:SF.0` (Schemes and morphisms). Needed: Dimension theory of schemes of finite type over a field: dimension of an integral scheme equals the transcendence degree of its function field; a scheme with a dense open subscheme isomorphic to 𝔸^n has dimension n; a proper closed subset of an irreducible scheme has smaller dimension; the Zariski closure of the image of a morphism X → Y has dimension ≤ dim X; dimension and (geometric) irreducibility of products and of base changes along field extensions; a scheme covered by irreducible open subschemes that pairwise meet is irreducible.
- `AbelianSchemesAndArithmeticModuli:A5` (Complex uniformization with polarization and level). Needed: For an abelian scheme over a smooth complex variety T, the degree-one de Rham–Betti comparison H¹_dR(A/T)^an ≅ R¹f_*ℂ ⊗ 𝒪^an identifies ∇ with the connection whose horizontal sections are R¹f_*ℂ, and R¹f_*ℤ is a local system (Ehresmann).
- `ComplexComparisonPartII:C5` (Algebraic de Rham–Betti comparison). Needed: For a smooth proper morphism of complex algebraic varieties, the analytic Gauss–Manin connection on the relative algebraic de Rham cohomology has the Betti local system R^q f_*ℂ as sheaf of horizontal sections (relative Gauss–Manin compatibility of the algebraic de Rham–Betti comparison).
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components` (Layer 3: subgroups, quotients, components). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For an affine algebraic group G over a field k and an abstract subgroup Γ ⊆ G(k): the Zariski closure of Γ, the smallest closed subgroup scheme whose k-points contain Γ (reduced, with Γ Zariski dense in it); its formation commutes with field extension; a finite-index subgroup of Γ has closure with the same identity component; the closure of the image of Γ under a homomorphism of algebraic groups is the image of the closure; subgroups normalizing Γ normalize its closure; in characteristic zero an infinite subgroup of 𝔾_a(k) is Zariski dense; images of homomorphisms of algebraic groups are closed. For an affine algebraic group G over a field acting on a scheme P of finite type and a point h ∈ P(k): the orbit morphism G → P, g ↦ g·h; for a closed subscheme Z ⊆ P the transporter {g ∈ G : g·h ∈ Z} is a closed subscheme of G; the Zariski closure of the orbit G(k)·h has dimension ≤ dim G.
- `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence` (Stage 2: lifting criterion and Galois correspondence). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For a connected complex manifold (more generally a connected, locally path-connected, semilocally simply connected space) X with base point x₀: the universal cover as homotopy classes of paths from x₀ with the deck action of π₁(X, x₀) by precomposition; the pullback of a local system to the universal cover is constant, and parallel transport along homotopic paths agrees, so that transport defines the monodromy representation compatibly with deck transformations.
- `ComplexComparisonPartII:C0` (Coherent analytic modules on algebraic analytifications). Needed: For a smooth complex variety Y and y ∈ Y(ℂ): the completion of the algebraic local ring 𝒪_{Y,y} is identified with the completion of the analytic local ring 𝒪^an_{Y,y}; algebraic local parameters at y are holomorphic coordinates near y, and the image in ℂ[[z]] of a regular function is the Taylor series of the corresponding holomorphic function, which converges near y.
- `ComplexComparisonPartII:C4` (Chow algebraization and morphism comparison). Needed: For a smooth geometrically connected curve Y over a subfield of ℂ, projective or the complement of finitely many points in a projective one, Y(ℂ) with the analytic topology is connected.

## Layer LV.4: Crystalline comparison on residue disks and the finiteness criterion

This layer is the bridge between Galois representations and period maps: the crystalline comparison for the fibres, the transport of the resulting filtered $\varphi$-modules to the base fibre, the orbit description of isomorphic filtrations, and a finiteness criterion that contains both LV Proposition 3.4 and the finiteness step of LV Lemma 6.2.

### LV.4.B Theorems

#### The fibre representations are crystalline with the de Rham cohomology of the fibre as filtered φ-module

*Comparison* `TauCeti.LawrenceVenkatesh.AbelianByFiniteFamily.fibre_representation_crystalline` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Crystalline/FibreComparison`.

Setting P: K is a number field with an embedding ι : K → ℂ; 𝒳 → 𝒴' → 𝒴 is a good model over 𝒪 = 𝒪_S of an abelian-by-finite family X → Y' → Y of relative dimension d, with π : Y' → Y finite étale of degree n and Y smooth and geometrically connected of dimension m over K; v ∉ S is a finite place with K_v/ℚ_p unramified and p > 2; y₀ ∈ 𝒴(𝒪); E₀ := E_{y₀}; V := ℋ_{y₀} = H¹_dR(X_{y₀}/K), a free E₀-module of rank 2d with the polarization pairing ω₀; H := LGr_{E₀}(V, ω₀); h₀ := F¹V ∈ H(K); V_v, H_v and V_ℂ, H_ℂ are the base changes along K → K_v and ι; Ω_v := Ω_v(y₀) with coordinates z : Ω_v ≅ (p𝒪_v)^m. For y ∈ Y(K) ∩ Ω_v (such a point extends to an 𝒪_{S_y}-point of 𝒴 for a finite set S_y ⊇ S of places not containing v; S_y = S when y ∈ 𝒴(𝒪)) and a closed point y' of π^{-1}(y) with residue field K(y'), X_{y'} is an abelian variety over K(y') with good reduction at the places not above S_y, in particular at the places above v, and ρ_{y'} := H¹_et(X_{y'} ×_{K(y')} K̄, ℚ_p) is a representation of G_{K(y')}; for a place w of K(y') above v, K(y')_w is unramified over K_v, and ρ_{y',w} is the restriction of ρ_{y'} to G_{K(y')_w}. Then ρ_{y',w} is crystalline, and there is an isomorphism of filtered φ-modules over L := K(y')_w, D_cris(ρ_{y',w}) ≅ (H¹_dR(X_{y'} ⊗ L / L), φ_{y',w}, F¹), where D_cris(V) = (V ⊗_{ℚ_p} B_cris)^{G_L} is the covariant functor, φ_{y',w} is the crystalline Frobenius of the good-reduction model 𝒳_{y'} ⊗ 𝒪_L transported through the Berthelot–Ogus isomorphism (the (y', w)-factor of φ_y from LV.2), and F¹ is the Hodge filtration (jumps 0 and 1). The isomorphism is functorial in the abelian scheme and compatible with the polarization pairings.

**Proof.**

- Since y lies in the residue disk it is a point of 𝒴(𝒪_v) ∩ Y(K) = 𝒴(𝒪_(v)) (𝒴 separated), so it spreads out to 𝒴(𝒪_{S_y}); the fibre of the good model over the 𝒪_L-point induced by y' is an abelian scheme 𝒳_{y'} ⊗ 𝒪_L over 𝒪_L = W(k_w) with generic fibre X_{y'} ⊗ L (LV.2).
- The crystalline comparison for its p-adic completion (CohomologyComparisons CP.2, node crystalline-comparison-over-discretely-valued-base) gives a G_L-equivariant B_cris-linear isomorphism H¹_et ⊗ B_cris ≅ H¹_cris(𝒳_{k_w}/W(k_w)) ⊗ B_cris compatible with Frobenius and filtrations; the étale cohomology of the rigid generic fibre is that of the algebraic variety X_{y'} ⊗ L, and restricting ρ_{y'} to G_L computes H¹_et((X_{y'} ⊗ L)_{L̄}, ℚ_p).
- Taking G_L-invariants with B_cris^{G_L} = W(k_w)[1/p] = L gives D_cris(ρ_{y',w}) ≅ H¹_cris(𝒳_{k_w}/W(k_w))[1/p] with its Frobenius, and dim_L D_cris = 2d, so ρ_{y',w} is crystalline.
- Because L is unramified, D_cris(ρ)_L = D_dR(ρ) as filtered spaces (Brinon–Conrad Proposition 9.1.9), and the comparison identifies D_dR(ρ_{y',w}) with H¹_dR(X_{y'} ⊗ L/L) and its Hodge filtration; under this identification the crystalline Frobenius is the Berthelot–Ogus transport of LV.2 (requested compatibility, PadicHodgeTheory R06.5).

**Uses.** `CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base` (the crystalline comparison node of the CohomologyComparisons packet); `PadicHodgeTheory:R06.2` (Period functors and admissibility); `PadicHodgeTheory:R06.5` (Geometric comparison theorems); `PadicHodgeTheory:R06.6` (Arithmetic consequences); `CrystallineCohomology:CR.2` (The PD Poincare lemma and de Rham computations); `SchemeAndStackFoundations:SF.2` (Sites and scheme cohomology); Good models over rings of S-integers (`LV.2/good-model`); Crystalline Frobenius on the de Rham cohomology of the fibres and its compatibility with Gauss–Manin transport (LV (3.9)) (`LV.2/crystalline-frobenius-on-fibres`); The Galois representation on H¹ of an abelian variety (`LV.1/abelian-variety-cohomology-properties`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius — LocalFieldsRamification Layer 2 (unramified extensions and Frobenius).

**Tests.**

- A good-reduction elliptic curve E over ℚ_p: D_cris(H¹_et(E_{ℚ̄_p}, ℚ_p)) = H¹_dR(E/ℚ_p) with φ of characteristic polynomial X² − a_pX + p and F¹ = H⁰(E, Ω¹), a line.
- For the Tate twist ℚ_p(−1) = H²_et(ℙ¹): D_cris is one-dimensional with φ = p and the filtration jump in degree 1.

#### The filtered φ-module of a fibre read off from the period map (LV (6.6)–(6.7))

*Lemma* `TauCeti.LawrenceVenkatesh.AbelianByFiniteFamily.fibre_filtered_phi_transport` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Crystalline/FibreComparison`.

Setting P: K is a number field with an embedding ι : K → ℂ; 𝒳 → 𝒴' → 𝒴 is a good model over 𝒪 = 𝒪_S of an abelian-by-finite family X → Y' → Y of relative dimension d, with π : Y' → Y finite étale of degree n and Y smooth and geometrically connected of dimension m over K; v ∉ S is a finite place with K_v/ℚ_p unramified and p > 2; y₀ ∈ 𝒴(𝒪); E₀ := E_{y₀}; V := ℋ_{y₀} = H¹_dR(X_{y₀}/K), a free E₀-module of rank 2d with the polarization pairing ω₀; H := LGr_{E₀}(V, ω₀); h₀ := F¹V ∈ H(K); V_v, H_v and V_ℂ, H_ℂ are the base changes along K → K_v and ι; Ω_v := Ω_v(y₀) with coordinates z : Ω_v ≅ (p𝒪_v)^m. For y ∈ Y(K) ∩ Ω_v (such a point extends to an 𝒪_{S_y}-point of 𝒴 for a finite set S_y ⊇ S of places not containing v; S_y = S when y ∈ 𝒴(𝒪)) and a closed point y' of π^{-1}(y) with residue field K(y'), X_{y'} is an abelian variety over K(y') with good reduction at the places not above S_y, in particular at the places above v, and ρ_{y'} := H¹_et(X_{y'} ×_{K(y')} K̄, ℚ_p) is a representation of G_{K(y')}; for a place w of K(y') above v, K(y')_w is unramified over K_v, and ρ_{y',w} is the restriction of ρ_{y'} to G_{K(y')_w}. Let (y₀', w₀) be the pair over (y₀, v) corresponding to (y', w) under the transport bijection of LV.2, τ : K(y')_w ≅ K(y₀')_{w₀} =: L₀ the transported field isomorphism, V₀ the (y₀', w₀)-factor of V_v = ℋ_{y₀} ⊗ K_v with the restriction φ₀ of φ_{y₀} (σ_{L₀}-semilinear), and pr₀ : H_v → H₀ := LGr_{L₀}(V₀, ω₀) the factor projection. Then pr₀Φ_v(y) = T_v(y)^{-1}(F¹H¹_dR(X_{y'} ⊗ K(y')_w)) (LV (6.7)), and D_cris(ρ_{y',w}) transported along τ is isomorphic in MF^φ_{L₀} to (V₀, φ₀, pr₀Φ_v(y)).

**Proof.**

- The transport T_v(y) is semilinear over the ring isomorphism E₀ ⊗ K_v ≅ E_y ⊗ K_v, which is the product of the field isomorphisms of the corresponding factors; hence it maps the factor V₀ τ^{-1}-semilinearly onto the factor H¹_dR(X_{y'} ⊗ K(y')_w) of ℋ_y ⊗ K_v and commutes with the factor projections of the period varieties.
- Φ_v(y) = T_v(y)^{-1}(F¹ℋ_y ⊗ K_v) and F¹ is the product of the factorwise Hodge filtrations, which gives (6.7).
- T_v(y) commutes with Frobenius (LV.2), and τ commutes with the absolute Frobenii because both fields are unramified over ℚ_p; so T_v(y) restricted to V₀ is an isomorphism of filtered φ-modules from (V₀, φ₀, pr₀Φ_v(y)) to the τ-transport of (H¹_dR(X_{y'} ⊗ K(y')_w), φ_{y',w}, F¹).
- Compose with the fibre comparison (fibre-representation-crystalline).

**Uses.** The fibre representations are crystalline with the de Rham cohomology of the fibre as filtered φ-module (`LV.4/fibre-representation-crystalline`); The p-adic period map on a residue disk (`LV.3/padic-period-map`); The Lagrangian period variety of a symplectic module over a finite étale algebra (`LV.3/lagrangian-period-variety`); p-adic Gauss–Manin transport on a residue disk (LV (3.7)) (`LV.2/gauss-manin-transport-padic`); Crystalline Frobenius on the de Rham cohomology of the fibres and its compatibility with Gauss–Manin transport (LV (3.9)) (`LV.2/crystalline-frobenius-on-fibres`); `PadicHodgeTheory:R06.2` (Period functors and admissibility).

**Tests.**

- π = id: y' = y, E₀ = K, and the lemma says that T_v(y) is an isomorphism (V_v, φ_{y₀}, Φ_v(y)) ≅ D_cris(ρ_y|G_{K_v}) (LV §3.5).
- The Legendre variant family of LV §4.2 with v inert in K(t₀^{1/m}): one factor, L₀ = K_v(t₀^{1/m}) of degree m over K_v.

#### Filtrations with isomorphic filtered φ-modules form a Frobenius-centralizer orbit of bounded dimension

*Lemma* `TauCeti.LawrenceVenkatesh.filtered_phi_orbit` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Crystalline/FrobeniusOrbit`.

Let K_v/ℚ_p be finite unramified of degree f_v, L ⊇ K_v finite unramified, W a finite-dimensional L-vector space with a σ_L-semilinear bijection φ, and F, F' L-subspaces of W of the same dimension k, viewed as two-step filtrations W ⊇ F ⊇ 0. (a) (W, φ, F) ≅ (W, φ, F') in MF^φ_L if and only if F' = gF for some g ∈ Z(φ)^×. (b) Let A = Z(φ^{f_v}), a K_v-subalgebra of End_L(W) with dim_{K_v} A ≤ (dim_L W)², and G its K_v-group of units, which acts on the K_v-variety Gr_L(W, k) of L-stable subspaces. Then Z(φ)^× ⊆ G(K_v), so every F' as in (a) lies in G(K_v)·F, and the Zariski closure of G(K_v)·F in Gr_L(W, k) has dimension ≤ dim_{K_v} A. (c) Consequently, for filtrations F_1, …, F_s, the set of F' with (W, φ, F') isomorphic to one of the (W, φ, F_i) is contained in a closed subset of Gr_L(W, k) of dimension ≤ dim_{K_v} A.

**Proof.**

- (a) An isomorphism (W, φ, F) → (W, φ, F') is an L-linear bijection g commuting with φ and carrying F onto F'.
- (b) Z(φ) ⊆ Z(φ^{f_v}) and the dimension bound are LV Lemma 2.1 in the form of the LV.0 node for unramified extensions; elements of A are L-linear, so G acts on the L-stable Grassmannian; the Zariski closure of an orbit of a K_v-group has dimension at most the dimension of the group (orbit morphism, ReductiveGroups Layer 3).
- (c) A finite union of closed sets of dimension ≤ dim A.

**Uses.** The centralizer of a semilinear automorphism (`LV.0/semilinear-centralizer`); Frobenius centralizers over unramified extensions of a p-adic field (`LV.0/semilinear-centralizer-unramified`); The Lagrangian period variety of a symplectic module over a finite étale algebra (`LV.3/lagrangian-period-variety`); `PadicHodgeTheory:R06.2` (Period functors and admissibility); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `SchemeAndStackFoundations:SF.0` (Schemes and morphisms).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components).

**Tests.**

- K_v = ℚ_p, E/ℚ_p a good-reduction elliptic curve: φ is ℚ_p-linear with characteristic polynomial X² − a_pX + p, which has distinct roots, so dim Z(φ) = 2 while dim Gr(W, 1) = 1; the orbit of F¹ is open in ℙ¹ (LV §1.3: the Legendre family has locally constant local Galois representations).
- K_v = ℚ_{p²} and E/ℚ_p supersingular with a_p = 0: φ² = −p is scalar and dim_{K_v} Z(φ²) = 4; if E is ordinary, φ² has distinct eigenvalues and dim_{K_v} Z(φ²) = 2.

#### Finiteness criterion on a residue disk of a curve

*Theorem* `TauCeti.LawrenceVenkatesh.AbelianByFiniteFamily.finiteness_criterion` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Crystalline/Finiteness`.

Setting P: K is a number field with an embedding ι : K → ℂ; 𝒳 → 𝒴' → 𝒴 is a good model over 𝒪 = 𝒪_S of an abelian-by-finite family X → Y' → Y of relative dimension d, with π : Y' → Y finite étale of degree n and Y smooth and geometrically connected of dimension m over K; v ∉ S is a finite place with K_v/ℚ_p unramified and p > 2; y₀ ∈ 𝒴(𝒪); E₀ := E_{y₀}; V := ℋ_{y₀} = H¹_dR(X_{y₀}/K), a free E₀-module of rank 2d with the polarization pairing ω₀; H := LGr_{E₀}(V, ω₀); h₀ := F¹V ∈ H(K); V_v, H_v and V_ℂ, H_ℂ are the base changes along K → K_v and ι; Ω_v := Ω_v(y₀) with coordinates z : Ω_v ≅ (p𝒪_v)^m. For y ∈ Y(K) ∩ Ω_v (such a point extends to an 𝒪_{S_y}-point of 𝒴 for a finite set S_y ⊇ S of places not containing v; S_y = S when y ∈ 𝒴(𝒪)) and a closed point y' of π^{-1}(y) with residue field K(y'), X_{y'} is an abelian variety over K(y') with good reduction at the places not above S_y, in particular at the places above v, and ρ_{y'} := H¹_et(X_{y'} ×_{K(y')} K̄, ℚ_p) is a representation of G_{K(y')}; for a place w of K(y') above v, K(y')_w is unramified over K_v, and ρ_{y',w} is the restriction of ρ_{y'} to G_{K(y')_w}. Assume m = 1. Fix (y₀', w₀) over (y₀, v), put L₀ := K(y₀')_{w₀}, let V₀, φ₀, H₀ and pr₀ be as in the transport lemma, Z₀ the Zariski closure of pr₀Φ_v(Ω_v) in H₀, and c := dim_{K_v} Z(φ₀^{f_v}) (so c ≤ 4d²). Let 𝒮 ⊆ Y(K) ∩ Ω_v be a set such that, for y ∈ 𝒮 and (y', w) the pair corresponding to (y₀', w₀), the pairs (K(y')_w, ρ_{y',w}) lie in finitely many isomorphism classes (an isomorphism of pairs is a field isomorphism with a compatible isomorphism of representations). If c < dim Z₀, then 𝒮 is finite. If Y(ℂ) is connected and the family has full monodromy, then dim Z₀ = [L₀ : K_v]·d(d+1)/2, so the hypothesis c < dim Z₀ holds whenever [L₀ : K_v] ≥ 8.

**Proof.**

- Transport of structure: an isomorphism of pairs (α, ρ₁ ≅ ρ₂) induces D_cris(ρ₂) ≅ α_*D_cris(ρ₁). After transport to L₀ by the field isomorphisms τ of the transport lemma, two points of 𝒮 in the same class of pairs give filtered φ-modules over L₀ that differ by transport along an element of Aut(L₀/ℚ_p), a group of order [L₀ : ℚ_p]. So the modules (V₀, φ₀, pr₀Φ_v(y)), y ∈ 𝒮, lie in finitely many isomorphism classes of MF^φ_{L₀}.
- By the orbit lemma there are F_1, …, F_s with pr₀Φ_v(y) ∈ ⋃ G(K_v)·F_i for all y ∈ 𝒮, and B₀ := H₀ ∩ ⋃ closure(G(K_v)·F_i) is closed of dimension ≤ c < dim Z₀.
- By the finite-preimage theorem of LV.3 (part (c)), {y ∈ Ω_v : pr₀Φ_v(y) ∈ B₀} is finite, and it contains 𝒮.
- Under full monodromy Z₀ = H₀, which has dimension [L₀ : K_v]·d(d+1)/2 by the splitting lemma; for [L₀ : K_v] ≥ 8 this is ≥ 4d(d+1) > 4d² ≥ c.

**Uses.** The filtered φ-module of a fibre read off from the period map (LV (6.6)–(6.7)) (`LV.4/fibre-filtered-phi-transport`); Filtrations with isomorphic filtered φ-modules form a Frobenius-centralizer orbit of bounded dimension (`LV.4/filtered-phi-orbit`); On a curve, the p-adic period map meets a closed subset not containing its image in finitely many points (`LV.3/padic-period-preimage-finite`); Zariski closure of the p-adic period image (LV Lemma 3.3) and density under full monodromy (`LV.3/padic-period-image-dense`); Geometry of the period variety (`LV.3/lagrangian-period-variety-splitting`); Frobenius centralizers over unramified extensions of a p-adic field (`LV.0/semilinear-centralizer-unramified`); p-adic Gauss–Manin transport on a residue disk (LV (3.7)) (`LV.2/gauss-manin-transport-padic`).

**Tests.**

- The variant Legendre family of LV §4 (d = 1, L₀ of degree m ≥ 8): c ≤ 4 < m = dim Z₀.
- d = 1 and L₀ = K_v (the Legendre family itself): c = 2 > 1 = dim Z₀, and the criterion does not apply (LV §1.3).

#### Fibres with good reduction and semisimple Galois representation (LV Proposition 3.4, for curves)

*Theorem* `TauCeti.LawrenceVenkatesh.AbelianByFiniteFamily.finite_semisimple_fibres_in_residueDisk` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Crystalline/Finiteness`.

Setting P: K is a number field with an embedding ι : K → ℂ; 𝒳 → 𝒴' → 𝒴 is a good model over 𝒪 = 𝒪_S of an abelian-by-finite family X → Y' → Y of relative dimension d, with π : Y' → Y finite étale of degree n and Y smooth and geometrically connected of dimension m over K; v ∉ S is a finite place with K_v/ℚ_p unramified and p > 2; y₀ ∈ 𝒴(𝒪); E₀ := E_{y₀}; V := ℋ_{y₀} = H¹_dR(X_{y₀}/K), a free E₀-module of rank 2d with the polarization pairing ω₀; H := LGr_{E₀}(V, ω₀); h₀ := F¹V ∈ H(K); V_v, H_v and V_ℂ, H_ℂ are the base changes along K → K_v and ι; Ω_v := Ω_v(y₀) with coordinates z : Ω_v ≅ (p𝒪_v)^m. Assume n = 1 (π = id, so X → Y is a polarized abelian scheme, E₀ = K and H = LGr(V, ω₀)), m = 1 and Y(ℂ) connected, and write ρ_y = H¹_et(X_y ×_K K̄, ℚ_p). If dim_{K_v} Z(φ_{y₀}^{f_v}) < dim_ℂ(Γ·h₀) (LV (3.13)), then the set {y ∈ 𝒴(𝒪) : y ≡ y₀ mod v, ρ_y semisimple} is finite.

**Proof.**

- For y ∈ 𝒴(𝒪), X_y has good reduction outside S, so ρ_y has dimension 2d, is unramified outside T := S ∪ {places above p} and pure of weight 1 with integral Frobenius polynomials outside T (LV.1).
- Faltings's finiteness lemma (LV.1) leaves finitely many isomorphism classes of semisimple ρ_y, hence finitely many classes of pairs (K_v, ρ_y|G_{K_v}).
- With (y₀', w₀) = (y₀, v), Z₀ is the closure Z_v of Φ_v(Ω_v), and dim Z_v ≥ dim(Γ·h₀) by LV Lemma 3.3; so c < dim Z₀ and the finiteness criterion applies.

**Uses.** Finiteness criterion on a residue disk of a curve (`LV.4/finiteness-criterion`); Faltings's finiteness lemma (LV Lemma 2.3) (`LV.1/faltings-finiteness`); The Galois representation on H¹ of an abelian variety (`LV.1/abelian-variety-cohomology-properties`); Zariski closure of the p-adic period image (LV Lemma 3.3) and density under full monodromy (`LV.3/padic-period-image-dense`); `NeronModelsAndSemistableAbelianVarieties:R11.5` (Tate modules, conductors and local factors).

**Tests.**

- The Legendre family over K with K_v = ℚ_p: dim Z(φ) = 2 > 1 = dim(Γ·h₀) = dim ℙ¹, so (3.13) fails; this is why LV pass to abelian-by-finite families.
- π = id, K_v = ℚ_p and φ_{y₀} with 2d distinct eigenvalues: c = 2d, so under full monodromy (3.13) holds exactly when d(d+1)/2 > 2d, i.e. d ≥ 4.

### LV.4.C Dependencies

Within this roadmap: `MordellLawrenceVenkatesh:LV.0`, `MordellLawrenceVenkatesh:LV.1`, `MordellLawrenceVenkatesh:LV.2`, `MordellLawrenceVenkatesh:LV.3`.

Other roadmaps:

- `CohomologyComparisons:CP.2` (Rational crystalline comparison and descent). Used through the node cited in the list of uses.
- `PadicHodgeTheory:R06.2` (Period functors and admissibility). Needed: For an unramified p-adic field K: the category MF^φ_K of filtered φ-modules (σ-semilinear bijective φ, exhaustive separated decreasing filtration; morphisms K-linear, φ-equivariant and filtration-preserving; isomorphisms carry filtrations onto filtrations); the covariant functor D_cris = (− ⊗ B_cris)^{G_K} from crystalline representations to MF^φ_K; its compatibility with transport of structure along a field isomorphism K ≅ K' (pairs (K, V) and (K', V')).
- `PadicHodgeTheory:R06.5` (Geometric comparison theorems). Needed: For a proper smooth scheme 𝔛 over W(k) (k perfect) with generic fibre X over K = W(k)[1/p]: H^i_et(X_K̄, ℚ_p) is crystalline and D_cris(H^i_et(X_K̄, ℚ_p)) ≅ (H^i_dR(X/K), φ, Hodge filtration) in MF^φ_K, where φ is the crystalline Frobenius of 𝔛_k transported by the Berthelot–Ogus isomorphism H^i_cris(𝔛_k/W(k))[1/p] ≅ H^i_dR(X/K); the isomorphism is functorial in 𝔛, compatible with cup products, and uses the identification of the étale cohomology of the rigid generic fibre of the completion with that of X (the case i = 1 for abelian schemes suffices).
- `PadicHodgeTheory:R06.6` (Arithmetic consequences). Needed: For an abelian variety A over a finite extension F/ℚ_p with good reduction, V_p(A) and H¹_et(A_{F̄}, ℚ_p) are crystalline G_F-representations.
- `CrystallineCohomology:CR.2` (The PD Poincare lemma and de Rham computations). Needed: For a smooth proper lift 𝔛 over W(k) of a smooth proper k-scheme X₀: the natural isomorphism H^q_cris(X₀/W(k)) ≅ H^q_dR(𝔛/W(k)) (Berthelot–Ogus Corollary 7.4) and its naturality in the lift.
- `SchemeAndStackFoundations:SF.2` (Sites and scheme cohomology). Needed: For a proper variety X over a field K, a field extension L/K and compatible separable closures K̄ ⊆ L̄: the base-change map H^i_et(X_K̄, ℚ_p) → H^i_et(X_L̄, ℚ_p) is a G_L-equivariant isomorphism (G_L acting on the source through G_L → G_K).
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius` (Layer 2: unramified extensions and Frobenius). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For K_v/ℚ_p unramified, 𝒪_v = W(k_v), |p|_v = p^{-1}, and every finite unramified extension of K_v is cyclic with the arithmetic Frobenius as generator.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components` (Layer 3: subgroups, quotients, components). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For an affine algebraic group G over a field acting on a scheme P of finite type and a point h ∈ P(k): the orbit morphism G → P, g ↦ g·h; for a closed subscheme Z ⊆ P the transporter {g ∈ G : g·h ∈ Z} is a closed subscheme of G; the Zariski closure of the orbit G(k)·h has dimension ≤ dim G.
- `SchemeAndStackFoundations:SF.0` (Schemes and morphisms). Needed: Dimension theory of schemes of finite type over a field: dimension of an integral scheme equals the transcendence degree of its function field; a scheme with a dense open subscheme isomorphic to 𝔸^n has dimension n; a proper closed subset of an irreducible scheme has smaller dimension; the Zariski closure of the image of a morphism X → Y has dimension ≤ dim X; dimension and (geometric) irreducibility of products and of base changes along field extensions; a scheme covered by irreducible open subschemes that pairwise meet is irreducible.
- `NeronModelsAndSemistableAbelianVarieties:R11.5` (Tate modules, conductors and local factors). Needed: Néron–Ogg–Shafarevich: an abelian variety over a number field with good reduction at u has V_p unramified at u for every p different from the residue characteristic of u.

## Layer LV.5: Surfaces, mapping class groups and families of branched covers

The monodromy computations of the paper are topological, and no roadmap of the atlas owns the topology of surfaces. This layer therefore carries the material of Farb–Margalit's primer that the argument uses, stated for surfaces with boundary and punctures, together with two statements that connect it to families: the configuration fibration of a surface and the monodromy of families of branched covers over it. The restructure proposal in the packet moves this layer to a separate roadmap. The proof of the classification of compact surfaces is the one recorded gap of the packet.

### LV.5.A Objects

#### Surfaces with boundary and punctures

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/Topology/Surface`, namespace `TauCeti.LawrenceVenkatesh.Surface`.

A surface is the complement S = Σ ∖ P of a finite set P of interior points in a compact connected oriented topological 2-manifold Σ with (possibly empty) boundary. Its type (g, b, n) consists of the genus g of the closed surface obtained by capping the boundary circles of Σ with disks, the number b of boundary circles and the number n = #P of punctures, and χ(S) = 2 − 2g − b − n. A simple closed curve is the image of a topological embedding S¹ → S ∖ ∂S, oriented by the orientation of S¹; it is separating if its complement is disconnected. H₁(S; ℤ) carries the algebraic intersection form î (the intersection pairing of Poincaré–Lefschetz duality restricted to absolute classes), which is alternating and, when b + n ≤ 1, perfect.

**Construction.**

- Define the type from the classification of compact surfaces (surface-classification) applied to Σ with its boundary circles capped.
- Define î through Poincaré–Lefschetz duality H₁(Σ) × H₁(Σ, ∂Σ) → ℤ composed with H₁(Σ) → H₁(Σ, ∂Σ); removing punctures does not change H₁ of the compact model up to the classes of the small loops around them, which lie in the radical.
- Perfectness for b + n ≤ 1: then H₁(S) ≅ H₁(Σ̂) for the closed surface Σ̂, where Poincaré duality is perfect.

**Declarations and API.**

- `Surface` (constructor): A surface as a punctured compact connected oriented 2-manifold with boundary.
- `Surface.genus` (data): The genus g.
- `Surface.numBoundary` (data): The number b of boundary circles.
- `Surface.numPunctures` (data): The number n of punctures.
- `Surface.eulerChar_eq` (characterisation): χ(S) = 2 − 2g − b − n, computed from singular homology.
- `Surface.intersectionForm` (data): The algebraic intersection form î on H₁(S; ℤ), alternating.
- `Surface.intersectionForm_perfect` (other): î is perfect when b + n ≤ 1.
- `SimpleClosedCurve` (constructor): Oriented simple closed curves in the interior, up to isotopy; the predicate IsSeparating.
- `Surface.cut` (other): The surface S_α obtained by cutting along a simple closed curve or proper arc, with its gluing map (GeometricTopology Layer 1).
- `Surface.examples` (example): Closed surfaces, the thrice- and four-times-punctured spheres, the torus with one boundary circle.

**Uses.** `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `mathlib:AlgebraicTopology.singularHomologyFunctor`.

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology — AlgebraicTopology Stage 2 (singular homology, local coefficient systems); tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality — AlgebraicTopology Stage 6 (cohomology, products, Poincaré duality, intersection pairing); tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group — GeometricTopology Layer 1 (cutting and gluing manifolds along submanifolds).

**Tests.**

- S_{g} (closed genus g): χ = 2 − 2g and î is the standard symplectic form on ℤ^{2g}.
- The thrice-punctured sphere ℙ¹(ℂ) ∖ {0, 1, ∞}: type (0, 0, 3), χ = −1, H₁ ≅ ℤ² with î = 0.

#### The mapping class group

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/Topology/MappingClassGroup`, namespace `TauCeti.LawrenceVenkatesh.Surface`.

For a surface S, Mod(S) is the group of isotopy classes of orientation-preserving homeomorphisms of S that restrict to the identity on ∂S, isotopies being required to fix ∂S pointwise; homeomorphisms may permute the punctures. For x in the interior, S* denotes S with the marked point x (equivalently S ∖ {x} with the new puncture fixed), and Mod(S*) the corresponding group of classes fixing x. Mod(S) acts on H₁(S; ℤ) preserving î (the symplectic representation Ψ), on the set of isotopy classes of simple closed curves, and, through Out(π₁(S)), on the set of isomorphism classes of finite coverings of S.

**Construction.**

- Homeomorphisms isotopic relative to ∂S induce the same map on H₁, on isotopy classes of curves and on conjugacy classes of homomorphisms π₁(S) → G, so the actions factor through Mod(S).
- The action on coverings: f sends the class of a covering p : Z → S to the class of f ∘ p : Z → S; in terms of monodromy this is precomposition with the outer automorphism (f⁻¹)_* of π₁(S).

**Declarations and API.**

- `MappingClassGroup` (constructor): Mod(S) = Homeo⁺(S, ∂S)/isotopy rel ∂S.
- `MappingClassGroup.marked` (constructor): Mod(S*) for a marked interior point x.
- `MappingClassGroup.homologyRep` (data): Ψ : Mod(S) → Aut(H₁(S; ℤ), î).
- `MappingClassGroup.actCurves` (data): The action on isotopy classes of simple closed curves.
- `MappingClassGroup.actCovers` (data): The action on isomorphism classes of finite coverings of S via Out(π₁ S).
- `MappingClassGroup.forget` (data): Forget : Mod(S*) → Mod(S), filling in the marked point; surjective.
- `MappingClassGroup.examples` (example): Mod(D²) = 1 (Alexander lemma) and Mod(annulus) = ℤ.

**Uses.** Surfaces with boundary and punctures (`LV.5/surface`); Classification of compact surfaces (`LV.5/surface-classification`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `tauceti:TauCeti.CoveringSpace.monodromyEquivalence`.

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence — UniversalCovers Stage 2 (lifting criterion and Galois correspondence of covers).

**Tests.**

- The pure mapping class group of the thrice-punctured sphere is trivial (Farb–Margalit §3.6).
- Mod of an annulus is ℤ, generated by the twist map.

#### Dehn twists

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/Topology/DehnTwist`, namespace `TauCeti.LawrenceVenkatesh.Surface`.

For a simple closed curve α in a surface S, a regular neighbourhood N ≅ S¹ × [0, 1] (orientation-preserving) and the twist map T(θ, t) = (θ + 2πt, t) of the annulus, the Dehn twist T_α is φ ∘ T ∘ φ⁻¹ on N and the identity outside N. Its class T_a ∈ Mod(S) depends only on the isotopy class a of α; T_{f(a)} = f T_a f⁻¹ for f ∈ Mod(S); twists about disjoint curves commute; T_a = 1 when a bounds a disk or a once-punctured disk.

**Construction.**

- Well-definedness from the uniqueness of regular neighbourhoods up to isotopy.
- Conjugation formula: f T_α f⁻¹ is the twist in the neighbourhood f(N) of f(α).
- Disjoint curves have disjoint neighbourhoods, so the twists commute; a twist in the neighbourhood of a curve bounding a (once-punctured) disk is isotopic to the identity by the Alexander lemma.

**Declarations and API.**

- `dehnTwist` (constructor): T_a ∈ Mod(S) for an isotopy class a of simple closed curves.
- `dehnTwist_conj` (relation): f T_a f⁻¹ = T_{f(a)}.
- `dehnTwist_commute` (relation): T_a T_b = T_b T_a when a and b are disjoint.
- `dehnTwist_eq_one` (simp): T_a = 1 if a bounds a disk or a once-punctured disk.
- `dehnTwist_support` (other): T_α is supported in any prescribed regular neighbourhood of α.
- `multitwist` (data): ∏ T_{e_i}^{m_i} for pairwise disjoint curves e_i.
- `dehnTwist_torus` (example): The twists about the two standard curves of the torus.

**Uses.** The mapping class group (`LV.5/mapping-class-group`); Surfaces with boundary and punctures (`LV.5/surface`).

**Tests.**

- On the torus with the standard basis, T_b acts on H₁ by the matrix [[1, 0], [±1, 1]].
- The boundary twist of a once-punctured disk is trivial in Mod.

#### The point-pushing homomorphism

*Construction* — module `TauCeti/NumberTheory/LawrenceVenkatesh/Topology/Birman`, namespace `TauCeti.LawrenceVenkatesh.Surface`.

Let S be a surface and x an interior point. For a loop α in S based at x, extend the motion of x along α to an isotopy φ_t of S fixed near ∂S (isotopy extension for points) and let Push(α) ∈ Mod(S*) be the class of φ_1, regarded as a homeomorphism of S fixing x. Push(α) depends only on the homotopy class of α, and Push : π₁(S, x) → Mod(S*) is a homomorphism (with the composition convention fixed by the path-concatenation convention of Mathlib's fundamental group). Its image lies in the kernel of Forget : Mod(S*) → Mod(S), and Push(α) acts on π₁(S, x) by conjugation by α.

**Construction.**

- Isotopy extension for a point in the interior of a surface gives φ_t.
- Independence of the choices: the evaluation map Homeo(S, ∂S) → S ∖ ∂S, f ↦ f(x), is a locally trivial fibre bundle with fibre Homeo(S*, ∂S); the connecting map of its homotopy sequence is Push, which is therefore well defined on π₁(S, x) and a homomorphism (Farb–Margalit §4.2).
- φ_1 is isotopic to the identity in S by construction, so Forget(Push(α)) = 1; tracking the base point along the isotopy shows that φ_1 acts on π₁(S, x) by conjugation by α.

**Declarations and API.**

- `pointPush` (constructor): Push : π₁(S, x) →* Mod(S*).
- `pointPush_apply` (characterisation): Push(α) is the class of the end map of any isotopy extending the motion of x along α.
- `forget_pointPush` (simp): Forget (Push α) = 1.
- `pointPush_action` (relation): Push(α) acts on π₁(S, x) as conjugation by α.
- `pointPush_homology` (other): Push(α) acts trivially on H₁(S) and on H₁(S ∖ {x}) when S is closed.
- `pointPush_torus` (example): On the torus Push is trivial.

**Uses.** The mapping class group (`LV.5/mapping-class-group`); Dehn twists (`LV.5/dehn-twist`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead — AlgebraicTopology Stage 8 (relative homotopy, long exact sequences); tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group — GeometricTopology Layer 1 (cutting and gluing manifolds along submanifolds).

**Tests.**

- S = S_{0,3} and α a loop around one puncture: Push(α) is a single Dehn twist about the curve enclosing that puncture and x.
- S a torus: Push is trivial (π₁ is abelian and the fibration has a section), so the injectivity statement of the Birman sequence needs χ(S) < 0.

### LV.5.B Theorems

#### Classification of compact surfaces

*Theorem* `TauCeti.LawrenceVenkatesh.surface_classification` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Topology/Surface`.

Every closed connected orientable surface is homeomorphic to the connected sum of a sphere with g ≥ 0 tori, for a unique g; every compact connected orientable surface is obtained from a closed one by removing b ≥ 0 open disks with disjoint closures, and the pair (g, b) determines it up to homeomorphism. Consequently two surfaces (in the sense of the surface node) are homeomorphic by an orientation-preserving homeomorphism if and only if they have the same type (g, b, n); for a closed surface of genus g, H₁(S_g; ℤ) ≅ ℤ^{2g}.

**Proof.**

- Triangulate the surface (Radó's theorem; for smooth surfaces, smooth triangulation).
- Reduce a triangulated closed surface to a polygon with identified edges and bring the edge word to the normal form ∏ a_i b_i a_i⁻¹ b_i⁻¹ by cut-and-paste moves.
- Distinguish normal forms by H₁ (rank 2g) and the number of boundary components; orientation-preserving homeomorphisms between surfaces of the same type exist because every surface admits orientation-reversing homeomorphisms.

**Uses.** `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); Surfaces with boundary and punctures (`LV.5/surface`).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations — AlgebraicTopology Stage 4 (CW pairs and cellular homology); tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead — AlgebraicTopology Stage 8 (relative homotopy, long exact sequences); tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group — GeometricTopology Layer 1 (cutting and gluing manifolds along submanifolds).

**Tests.**

- The torus has genus 1 and H₁ ≅ ℤ².
- A compact Riemann surface is a closed orientable surface, and its genus is half the rank of H₁.

#### Change of coordinates for simple closed curves

*Lemma* `TauCeti.LawrenceVenkatesh.change_of_coordinates` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Topology/ChangeOfCoordinates`.

Let S be a surface. (a) Two nonseparating simple closed curves in S are related by an orientation-preserving homeomorphism of S fixing ∂S and the punctures. (b) Two ordered pairs (a, b), (a', b') of simple closed curves meeting transversally in exactly one point are related by such a homeomorphism. (c) If S is closed of genus g, there is a geometric symplectic basis: simple closed curves a_1, b_1, …, a_g, b_g with a_i ∩ b_i one transverse point and all other pairs disjoint, whose classes form a symplectic basis of H₁(S; ℤ); any two such systems are related by a homeomorphism. (d) Every nonseparating simple closed curve a admits a simple closed curve b meeting it transversally once.

**Proof.**

- Cut S along the given curves; the cut surfaces have the same type (Euler characteristic, number of boundary components, punctures and connectivity are determined by the combinatorial data), so by the classification theorem they are homeomorphic by a homeomorphism respecting the boundary circles coming from the curves.
- Glue back: choose the homeomorphism compatibly with the gluing maps on the boundary circles (a homeomorphism of a circle is isotopic to a rotation or a reflection, and orientations are prescribed).
- (c) and (d) follow from (a), (b) and the standard picture on the connected sum of tori.

**Uses.** Classification of compact surfaces (`LV.5/surface-classification`); The mapping class group (`LV.5/mapping-class-group`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group — GeometricTopology Layer 1 (cutting and gluing manifolds along submanifolds).

**Tests.**

- On the torus, the curves (1, 0) and (1, k) are related by T^k in the other coordinate.
- A separating and a nonseparating curve are not related.

#### Action of Dehn twists and multitwists on homology

*Lemma* `TauCeti.LawrenceVenkatesh.dehn_twist_homology` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Topology/DehnTwist`.

Let S be a surface and b an oriented simple closed curve. For every x ∈ H₁(S; ℤ) and k ∈ ℤ, Ψ(T_b^k)(x) = x + k·î(x, b)·[b]. Consequently, for pairwise disjoint oriented simple closed curves e_1, …, e_r and integers m_i, the multitwist ∏ T_{e_i}^{m_i} acts by x ↦ x + Σ_i m_i î(x, e_i)[e_i]; in particular it is unipotent, and it is the identity on the î-orthogonal of span{[e_i]}.

**Proof.**

- The twist is supported in an annulus N around b. Represent x by a cycle transverse to b; each transverse crossing of b is replaced by an arc that runs once around N, which changes the cycle by ±[b] with the sign of the crossing.
- Summing over crossings gives x + î(x, b)[b] for k = 1; iterate, using î(b, b) = 0.
- For disjoint curves the twists commute and î(e_i, e_j) = 0, so the formulas compose additively.

**Uses.** Dehn twists (`LV.5/dehn-twist`); Surfaces with boundary and punctures (`LV.5/surface`); Change of coordinates for simple closed curves (`LV.5/change-of-coordinates`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology — AlgebraicTopology Stage 2 (singular homology, local coefficient systems); tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality — AlgebraicTopology Stage 6 (cohomology, products, Poincaré duality, intersection pairing).

**Tests.**

- On S_g with a geometric symplectic basis, T_{b_1} sends a_1 to a_1 ± b_1 and fixes the other basis vectors (Farb–Margalit Proposition 6.3).
- A separating curve has [b] = 0, so its twist acts trivially on H₁.

#### Primitive homology classes are represented by simple closed curves

*Lemma* `TauCeti.LawrenceVenkatesh.primitive_classes_simple` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Topology/SimpleClosedCurve`.

Let g ≥ 1. A nonzero class of H₁(S_g; ℤ) is represented by an oriented simple closed curve if and only if it is primitive; a simple closed curve is nonseparating if and only if its class is nonzero, and then its class is primitive. The same holds on a closed surface with one puncture or with one boundary circle (where H₁ is identified with that of the closed surface), and every class of H₁ is a sum of classes of simple closed curves.

**Proof.**

- Farb–Margalit's topological Euclidean algorithm: write the class in a geometric symplectic basis and reduce the coordinates by twists, which preserve simplicity.
- A nonseparating curve has a dual curve meeting it once (change of coordinates), so its class pairs to 1 with an integral class and is primitive; a separating curve bounds a subsurface and is null-homologous.
- One puncture or one boundary circle: the inclusion into the capped surface induces an isomorphism on H₁ and simple closed curves can be isotoped off the cap.

**Uses.** Change of coordinates for simple closed curves (`LV.5/change-of-coordinates`); Action of Dehn twists and multitwists on homology (`LV.5/dehn-twist-homology`); Surfaces with boundary and punctures (`LV.5/surface`).

**Tests.**

- (2, 0) ∈ H₁(T²) is not represented by a simple closed curve; (2, 3) is.
- On S_2 the class a_1 + a_2 is represented by a simple closed curve.

#### The Birman exact sequence and pushes of simple loops

*Theorem* `TauCeti.LawrenceVenkatesh.birman_exact_sequence` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Topology/Birman`.

Let S be a surface with χ(S) < 0 and x an interior point. Then 1 → π₁(S, x) → Mod(S*) → Mod(S) → 1 (Push, then Forget) is exact. For a simple loop α at x, Push([α]) = T_a T_b⁻¹, where a and b are the simple closed curves in S ∖ {x} obtained by pushing α off itself to the left and to the right; a and b are nonseparating in S ∖ {x} if and only if α is nonseparating in S.

**Proof.**

- Exactness at Mod(S*): a class in the kernel of Forget is isotopic to the identity in S, and the track of x is a loop α whose push is that class (up to inversion); Forget is surjective because a homeomorphism can be isotoped to fix x.
- Injectivity: Push(α) acts on π₁(S, x) by conjugation by α, and π₁(S) has trivial centre when χ(S) < 0.
- The formula for simple loops: the isotopy pushing x once around α is supported in the annulus between a and b, where it equals T_a T_b⁻¹; nonseparation is read off from the complement of the annulus.

**Uses.** The point-pushing homomorphism (`LV.5/point-push`); The mapping class group (`LV.5/mapping-class-group`); Dehn twists (`LV.5/dehn-twist`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead — AlgebraicTopology Stage 8 (relative homotopy, long exact sequences); tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence — UniversalCovers Stage 2 (lifting criterion and Galois correspondence of covers).

**Tests.**

- S = S_{0,3} and α a loop around one puncture: a bounds a once-punctured disk, so Push(α) = T_b⁻¹ with b enclosing that puncture and x.
- For S closed of genus ≥ 2 and α nonseparating, Push(α) is a nontrivial element acting trivially on H₁(S).

#### Capping boundary circles and forgetting points are surjective on mapping class groups

*Lemma* `TauCeti.LawrenceVenkatesh.capping_surjective` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Topology/Birman`.

Let S be a surface and S' the surface obtained by capping a boundary circle β with a once-marked disk. Then 1 → ⟨T_β⟩ → Mod(S) → Mod(S', p) → 1 is exact (Mod(S', p) fixing the marked point p). Consequently, capping all boundary circles with disks induces a surjection Mod(S) → Mod(Ŝ) onto the mapping class group of the capped surface, compatible with the maps on H₁.

**Proof.**

- The capping sequence is Farb–Margalit Proposition 3.19.
- Forgetting the marked points is surjective (Birman exact sequence, right-hand map), and a composite of surjections is surjective.
- The inclusion S ⊆ Ŝ is equivariant, which gives the compatibility on H₁.

**Uses.** The mapping class group (`LV.5/mapping-class-group`); The Birman exact sequence and pushes of simple loops (`LV.5/birman-exact-sequence`).

**Tests.**

- Capping the torus with one boundary circle gives Mod(T°) → Mod(T²) = SL₂(ℤ), surjective.

#### Surjectivity of the symplectic representation

*Theorem* `TauCeti.LawrenceVenkatesh.symplectic_representation_surjective` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Topology/SymplecticRepresentation`.

For g ≥ 1 the symplectic representation Ψ : Mod(S_g) → Sp(2g, ℤ) is surjective.

**Proof.**

- By Proposition 6.3 the twists about curves in a geometric symplectic basis and about the curves a_i + a_{i+1} map to symplectic transvections.
- These transvections generate Sp(2g, ℤ) (Farb–Margalit's first proof, via a generating set of Sp(2g, ℤ); the second proof uses transitivity on primitive vectors, Proposition 6.2).

**Uses.** Action of Dehn twists and multitwists on homology (`LV.5/dehn-twist-homology`); Primitive homology classes are represented by simple closed curves (`LV.5/primitive-classes-simple`); Change of coordinates for simple closed curves (`LV.5/change-of-coordinates`); `mathlib:Matrix.SL2.transvection_induction`.

**Tests.**

- g = 1: Mod(T²) ≅ SL₂(ℤ), generated by the images of the two standard twists.

#### The configuration fibration of a surface and its fundamental groups

*Lemma* `TauCeti.LawrenceVenkatesh.Surface.fadell_neuwirth_sequence` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Topology/Configuration`.

Let S be a connected surface without boundary and F(S) := {(x, y) ∈ S × S : x ≠ y} with p(x, y) = y. Then p is a locally trivial fibre bundle with fibre S ∖ {y}, and for y₀ ≠ x₀ the sequence π₁(S ∖ {y₀}, x₀) → π₁(F(S), (x₀, y₀)) → π₁(S, y₀) → 1 (the first map x ↦ (x, y₀)) is exact; its image Γ̄ is normal, and conjugation by π₁(F(S)) preserves the conjugacy class c of a small loop around y₀ in S ∖ {y₀}. For S = Y closed of genus g ≥ 1 the first map is injective. For S of genus g ≥ 1 closed, π₁(S ∖ {y₀}, x₀) is free on classes x_1, x_1', …, x_g, x_g' such that a small loop around y₀ is conjugate to [x_1, x_1'] ⋯ [x_g, x_g'], and H₁(S ∖ {y₀}) → H₁(S) is an isomorphism.

**Proof.**

- Local triviality: for y in a disk D around y₀ choose homeomorphisms h_y of S supported in a slightly larger disk, continuous in y, with h_y(y₀) = y; then (x, y) ↦ (h_y⁻¹ x, y) trivializes p over D.
- A locally trivial bundle over a paracompact base has the homotopy lifting property, which gives exactness of the long exact sequence in low degrees: surjectivity on π₁ because the fibre is path connected, exactness in the middle by lifting null-homotopies.
- The monodromy of the bundle along a loop is a homeomorphism of the fibre that is the identity near the end at y₀ up to isotopy, so it preserves the peripheral class c.
- Injectivity for closed S of genus ≥ 1: π₂(S) = 0, since the universal cover of S is a plane (or by the free-group structure of π₁ of the punctured surface).
- Presentation: by the classification, S is a 4g-gon with edge word ∏ [a_i, b_i]; removing an interior point of the 2-cell, the punctured surface deformation retracts onto the wedge of 2g circles, whose fundamental group is free (van Kampen), and the boundary of the 2-cell reads ∏[x_i, x_i'].

**Uses.** Classification of compact surfaces (`LV.5/surface-classification`); Surfaces with boundary and punctures (`LV.5/surface`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-1-van-kampen-through-the-fundamental-groupoid — AlgebraicTopology Stage 1 (van Kampen theorem and group presentations); tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead — AlgebraicTopology Stage 8 (relative homotopy, long exact sequences); tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group — GeometricTopology Layer 1 (cutting and gluing manifolds along submanifolds); tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence — UniversalCovers Stage 2 (lifting criterion and Galois correspondence of covers).

**Tests.**

- S = ℂ ∖ {0}: F(S) → S has fibre ℂ ∖ {0, y}, with π₁ free of rank 2.
- g = 1: π₁(T² ∖ {pt}) is free on two generators x, x' and the puncture loop is [x, x'].

#### Lifting powers of Dehn twists to finite coverings

*Lemma* `TauCeti.LawrenceVenkatesh.covering_dehn_twist_lift` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Topology/CoveringTwist`.

Let S be a surface, Z° → S a connected finite covering of degree n with monodromy Cov : π₁(S, s₀) → Sym(F) (F the fibre), and e a simple closed curve in S. Let n_e be the order of Cov(e) and (d_1, …, d_k) its cycle type. Then the preimage of e is a disjoint union of simple closed curves e_1, …, e_k, with e_i of degree d_i over e; T_e^{n_e} fixes the isomorphism class of the covering, and the homeomorphism ∏_i T_{e_i}^{n_e/d_i} (twists supported in the preimages of a regular neighbourhood of e) lifts T_e^{n_e}. If the centralizer of the image of Cov in Sym(F) is trivial, this is the only lift. The same holds for the compactified (branched) coverings when S is a punctured closed surface and the twists are supported away from the punctures.

**Proof.**

- The preimage of an annulus N around e is a disjoint union of annuli N_i, with N_i → N the connected d_i-fold covering of annuli, whose core curve e_i maps with degree d_i.
- On N_i, the twist T^{n_e/d_i} of the core covers T^{n_e} on N: in the coordinates (θ, t) ↦ (d_i θ, t), the map (θ, t) ↦ (θ + 2π(n_e/d_i)t, t) covers (θ, t) ↦ (θ + 2πn_e t, t), and both are the identity near the boundary circles, so the lift extends by the identity.
- Lifts of a homeomorphism differ by deck transformations, i.e. by elements of the centralizer of the monodromy image, which is trivial by assumption.
- Branched case: the twists are supported away from the branch points, so the lift extends over the filled-in points.

**Uses.** Dehn twists (`LV.5/dehn-twist`); The mapping class group (`LV.5/mapping-class-group`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `mathlib:IsCoveringMap.monodromyPerm`; `mathlib:IsCoveringMap.existsUnique_continuousMap_lifts`.

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence — UniversalCovers Stage 2 (lifting criterion and Galois correspondence of covers).

**Tests.**

- The double cover of the four-times-punctured sphere by a four-times-punctured torus, with e enclosing two punctures: Cov(e) = 1, k = 2, and T_e lifts to T_{e_1}T_{e_2}.
- An Aff(q)-cover and a curve with Cov(e) a q-cycle: k = 1, and T_e^q lifts to T_{e_1}.

#### Monodromy of families of branched covers over configuration spaces

*Lemma* `TauCeti.LawrenceVenkatesh.Surface.configuration_family_monodromy` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Topology/ConfigurationFamily`.

Let Σ be a closed oriented surface, B ⊂ Σ finite, S = Σ ∖ B with χ(S) ≤ −1 (so χ(S ∖ {y}) < 0), and F(S) → S the configuration fibration. Let 𝒵° → F(S) be a finite covering and, for y ∈ S, let Z_y be the compact surface obtained by filling in the punctures of the covering Z°_y → Σ ∖ (B ∪ {y}) (the branched covering of Σ). Then: (a) ⋃_y Z_y is a locally trivial fibre bundle 𝒵̄ → S with fibre Z_{y₀}; (b) for a loop γ at y₀, the monodromy of 𝒵̄ along γ is represented by a homeomorphism h_γ of Z_{y₀} that lifts a homeomorphism φ_γ of Σ fixing B ∪ {y₀} whose class in Mod(Σ ∖ (B ∪ {y₀})) is Push(γ) (for S* = S with marked point y₀); (c) consequently the monodromy action of π₁(S, y₀) on H₁(Z_{y₀}; ℤ) is given by lifts of point-pushing maps; if the lift of Push(γ) is unique (trivial centralizer of the monodromy of Z°_{y₀}), the action is the lifted action, and in general it differs from a chosen lift by a deck transformation.

**Proof.**

- Isotopy extension: the loop γ extends to an isotopy φ_t of Σ fixing B with φ_t(y₀) = γ(t), which trivializes F(S) over γ by (x, t) ↦ (φ_t(x), γ(t)).
- Lift the trivialization to 𝒵° by the homotopy lifting property of coverings, starting from the identity at t = 0; the end map h_γ° is a homeomorphism of Z°_{y₀} lifting φ_1.
- A homeomorphism of punctured-disk coverings that lifts a homeomorphism of the base extending over the puncture extends over the filled-in points; this gives h_γ on Z_{y₀} and the local triviality (a).
- φ_1 represents Push(γ) by definition of the push map; the monodromy of the homology local system of 𝒵̄ is induced by h_γ.
- Two lifts of φ_1 differ by a deck transformation of Z°_{y₀}.

**Uses.** The configuration fibration of a surface and its fundamental groups (`LV.5/fadell-neuwirth-sequence`); The Birman exact sequence and pushes of simple loops (`LV.5/birman-exact-sequence`); Lifting powers of Dehn twists to finite coverings (`LV.5/covering-dehn-twist-lift`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `mathlib:IsCoveringMap.existsUnique_continuousMap_lifts`; `tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation`.

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology — AlgebraicTopology Stage 2 (singular homology, local coefficient systems); tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence — UniversalCovers Stage 2 (lifting criterion and Galois correspondence of covers).

**Tests.**

- The Legendre family: Σ = ℙ¹(ℂ), B = {0, 1, ∞}, Z_λ the double cover branched at {0, 1, λ, ∞}.
- The Kodaira–Parshin family: B = ∅, Σ = Y(ℂ) of genus ≥ 2, Z_y the Aff(q)-covers branched at y.

### LV.5.C Dependencies

Within this roadmap: none.

Other roadmaps:

- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology` (Stage 2: relative singular chains and homology). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: Singular homology of surfaces with ℤ coefficients, local coefficient systems on a path-connected space and their monodromy representation, with the basepoint-change formula.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality` (Stage 6: cohomology, products, and manifold duality). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: Poincaré–Lefschetz duality for compact oriented surfaces with boundary, the resulting intersection pairing on H₁ (perfect for closed surfaces), and its compatibility with orientation-preserving homeomorphisms.
- `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group` (Layer 1: manifold-library buildout (general dimension, general structure group)). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: Cutting a topological surface along a finite family of disjoint simple closed curves or proper arcs and regluing, with the cut surface compact and the gluing homeomorphism recorded; regular (collar) neighbourhoods of simple closed curves in surfaces and their uniqueness up to isotopy; isotopy extension for points and for embedded circles in surfaces; triangulability of compact surfaces (Radó).
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations` (Stage 4: CW pairs, cellular homology, and cofibrations). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: Cellular homology of finite CW complexes, used for the 4g-gon model of a closed orientable surface (H₁ ≅ ℤ^{2g}, H₂ ≅ ℤ) and for graphs.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead` (Stage 8: relative homotopy, Hurewicz, and Whitehead). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For a locally trivial fibre bundle E → B with path-connected fibre F over a paracompact base: the homotopy lifting property and the exact sequence π₂(B) → π₁(F) → π₁(E) → π₁(B) → 1; π₂ of a closed orientable surface of positive genus vanishes.
- `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence` (Stage 2: lifting criterion and Galois correspondence). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: Classification of (possibly disconnected) covering spaces of a connected, locally path-connected, semilocally simply connected space by π₁-sets, with the fibre monodromy and path/homotopy lifting; lifts of homeomorphisms of the base to a connected covering exist when the induced outer automorphism preserves the conjugacy class of the monodromy, and two lifts differ by a deck transformation.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-1-van-kampen-through-the-fundamental-groupoid` (Stage 1: van Kampen through the fundamental groupoid). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: The based van Kampen theorem for two open sets with path-connected intersection and the free-group presentation of the fundamental group of a finite wedge of circles.

## Layer LV.6: The S-unit theorem

The S-unit theorem is the paper's first application and a template for the Mordell argument. The Legendre monodromy, which the paper takes as classical, is derived here from point pushing and the lifting of Dehn twists, and LV Lemma 4.3 follows from a factorwise-unipotent criterion rather than from the full symplectic Goursat lemma. In LV Lemma 4.4 the nonconstancy of the period map comes from full monodromy instead of the Torelli theorem.

### LV.6.A Objects

#### The Legendre family and its cyclic variant (LV §4.2)

*Construction* — module `TauCeti/NumberTheory/LawrenceVenkatesh/SUnit/Legendre`, namespace `TauCeti.LawrenceVenkatesh.SUnit`.

Let 𝒪 be a ring with 2 ∈ 𝒪^× and 𝒴 := Spec 𝒪[t, 1/(t(1 − t))] = ℙ¹_𝒪 ∖ {0, 1, ∞}. The Weierstrass curve E : y² = x(x − 1)(x − t) over 𝒴 has discriminant 16t²(t − 1)², a unit, so it is an elliptic curve over 𝒴 (an abelian scheme of relative dimension 1 with its principal polarization), with j = 2⁸(t² − t + 1)³/(t²(t − 1)²). For m a power of 2, put 𝒴' := Spec 𝒪[u, 1/(u(1 − u^m))] and π : 𝒴' → 𝒴, t ↦ u^m; π is finite étale of degree m, since 𝒪[t, 1/(t(1−t))][u]/(u^m − t) ≅ 𝒪[u, 1/(u(1 − u^m))] is standard étale. Let X → 𝒴' be the Legendre curve with parameter u, y² = x(x − 1)(x − u) (the pullback of E along the open immersion 𝒴' ⊆ 𝒴, u ↦ t, which is defined since u − 1 divides u^m − 1). Then X → 𝒴' → 𝒴 is an abelian-by-finite family of relative dimension 1; for 𝒪 = 𝒪_S with S ⊇ places above 2 it is a good model of its generic fibre, and for t₀ ∈ 𝒴(K) the fibre algebra is E_{t₀} = K[u]/(u^m − t₀), with X_{t₀} geometrically the disjoint union of the curves E_u, u^m = t₀.

**Construction.**

- Compute the discriminant of the Weierstrass equation; a Weierstrass curve with unit discriminant over a ring is elliptic (Mathlib) and is an abelian scheme with its canonical principal polarization.
- π is standard étale: u^m − t is monic in u with derivative mu^{m−1}, a unit because m and u = t/u^{m−1} are.
- The good-model conditions of LV.2 hold for abelian schemes over the smooth 𝒪_S-scheme 𝒴 (AbelianSchemesAndArithmeticModuli A4).
- The fibre of π over t₀ is Spec K[u]/(u^m − t₀), and the fibre of X over it is the Legendre curve with parameter u.

**Declarations and API.**

- `legendreCurve` (constructor): The Weierstrass curve y² = x(x − 1)(x − t) over 𝒪[t, 1/(t(1−t))].
- `legendreCurve.isElliptic` (instance): Its discriminant 16t²(t − 1)² is a unit when 2 is.
- `legendreCurve.j_eq` (simp): j = 2⁸(t² − t + 1)³/(t²(t − 1)²).
- `legendreVariant` (constructor): The abelian-by-finite family X → 𝒴' → 𝒴 with π(u) = u^m.
- `legendreVariant.isGoodModel` (other): It is a good model over 𝒪_S when S contains the places above 2.
- `legendreVariant.fibreAlgebra` (characterisation): E_{t₀} = K[u]/(u^m − t₀).
- `legendreVariant.analytic` (compatibility): Over ℂ, the total space of X over 𝒴'(ℂ) = ℂ ∖ ({0} ∪ μ_m) is the restriction of the Legendre family over ℂ ∖ {0, 1}.
- `legendreCurve.j_one_seven_two_eight` (example): j(−1) = j(2) = j(1/2) = 1728.

**Uses.** Abelian-by-finite families (LV Definition 5.1) (`LV.2/abelian-by-finite-family`); Good models over rings of S-integers (`LV.2/good-model`); `AbelianSchemesAndArithmeticModuli:A1` (Abelian schemes and rigidity); `AbelianSchemesAndArithmeticModuli:A2` (Duals, Picard functors, and polarizations); `AbelianSchemesAndArithmeticModuli:A4` (Degree-one realizations and deformation theory); `mathlib:WeierstrassCurve`; `mathlib:WeierstrassCurve.IsElliptic`; `mathlib:WeierstrassCurve.j`; `mathlib:StandardEtalePair`.

**Tests.**

- t = −1, 2, 1/2 (the S-units of ℚ with S = {2, ∞}) all give j = 1728, the curve y² = x³ − x up to twist.
- m = 2, t₀ = 4: E_{t₀} = K[u]/(u² − 4) ≅ K × K and X_{t₀} = E_2 ⊔ E_{−2}.

### LV.6.B Theorems

#### Reductions for the S-unit equation

*Lemma* `TauCeti.LawrenceVenkatesh.SUnit.s_unit_reductions` — module `TauCeti/NumberTheory/LawrenceVenkatesh/SUnit/Reductions`.

Let K be a number field, S a finite set of places containing the archimedean ones and U(K, S) := {t ∈ 𝒪_S^× : 1 − t ∈ 𝒪_S^×}. (a) If K'/K is finite and S' ⊇ the places of K' above S, then U(K, S) ⊆ U(K', S'); so finiteness of U(K', S') implies finiteness of U(K, S). In particular one may assume μ_8 ⊆ K and that S contains the places above 2. (b) Assume μ_8 ⊆ K, let m be the largest power of 2 dividing #μ(K) (so m ≥ 8), and U₁ := {t ∈ U(K, S) : t ∉ K^{×2}}. Then U(K, S) ⊆ ⋃_{0 ≤ j ≤ log₂ m} {s^{2^j} : s ∈ U₁}; hence U(K, S) is finite if U₁ is.

**Proof.**

- (a) 𝒪_{K,S} ⊆ 𝒪_{K',S'} and units stay units.
- (b) If s ∈ K^× and s^k ∈ U(K, S) for some k ≥ 1, then s ∈ U(K, S): s is integral over 𝒪_S and a unit, and 1 − s^k = ∏_{η ∈ μ_k(K̄)} (1 − ηs) is a product of S-integers of K(μ_k) that is a unit, so 1 − s is an S-unit (its inverse is integral over 𝒪_S and lies in K).
- Let t ∈ U. If t is not an m-th power, choose j < log₂ m maximal with t = s^{2^j} for some s ∈ K; then s is not a square, so s ∈ U₁ by the previous step.
- If t = s^m, then among s and ζs (ζ a primitive m-th root of unity) one is not a square: otherwise ζ would be a square, i.e. K would contain a primitive 2m-th root of unity, contradicting the maximality of m. Both are m-th roots of t, so the non-square one lies in U₁.

**Uses.** `mathlib:Set.integer`; `mathlib:Set.unit`.

**Tests.**

- K = ℚ, S = {2, ∞}: U = {−1, 2, 1/2}.
- K = ℚ(ζ₈): μ(K) = μ₈, so m = 8.

#### The Kummer fields of non-square S-unit solutions

*Lemma* `TauCeti.LawrenceVenkatesh.kummer_cyclic_field` — module `TauCeti/NumberTheory/LawrenceVenkatesh/SUnit/Reductions`.

In the setting of (b) of the reductions, assume moreover that S contains the places above 2. For t ∈ U₁: (a) the class of t in K^×/K^{×m} has order exactly m; (b) X^m − t is irreducible over K and L_t := K[X]/(X^m − t) is a cyclic extension of K of degree m, unramified at every finite place outside S; (c) the fields L_t (t ∈ U₁) fall into finitely many isomorphism classes, so U₁ = U_{1,L_1} ∪ ⋯ ∪ U_{1,L_r} with U_{1,L} := {t ∈ U₁ : L_t ≅ L}.

**Proof.**

- (a) If t^k = a^m with k a proper divisor of m, then t ∈ a^{m/k}μ_k ⊆ K^{×2}·μ_k; μ_k consists of squares since k | m/2 and μ_m ⊆ K, contradicting t ∉ K^{×2}.
- (b) Kummer theory with μ_m ⊆ K: for a root α of X^m − t, σ ↦ σ(α)/α embeds Gal(K(α)/K) into μ_m with image μ_d, d = [K(α) : K]; then α^d ∈ K, so t^d ∈ K^{×m}, and conversely t^k ∈ K^{×m} forces α^k ∈ K and d | k. So d equals the order of t, which is m by (a); X^m − t is irreducible, K(α) is its splitting field and Gal(K(α)/K) ≅ μ_m is cyclic.
- Unramified outside S: at a finite place w ∉ S, t and m are w-units, so 𝒪_w[X]/(X^m − t) is standard étale (the derivative mX^{m−1} is a unit modulo X^m − t) and K_w[X]/(X^m − t) is a product of unramified extensions of K_w.
- (c) Hermite–Minkowski: there are finitely many extensions of K of degree m unramified outside S (FaltingsFinitenessAndIsogenyTheorems R28.1).

**Uses.** Reductions for the S-unit equation (`LV.6/s-unit-reductions`); `FaltingsFinitenessAndIsogenyTheorems:R28.1/hermite-minkowski-finiteness-of-extensions-unramified-outside-S` (Hermite–Minkowski, FaltingsFinitenessAndIsogenyTheorems packet); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `mathlib:isCyclic_of_isSplittingField_X_pow_sub_C`; `mathlib:autEquivZmod`; `mathlib:autEquivRootsOfUnity`; `mathlib:StandardEtalePair`; `mathlib:Polynomial.separable_X_pow_sub_C_unit`.

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius — LocalFieldsRamification Layer 2 (unramified extensions and Frobenius).

**Tests.**

- K = ℚ(ζ₈), S = {places above 2, ∞}: every L_t is a cyclic octic extension of ℚ(ζ₈) unramified outside 2.
- t = ζ₈ lies in U₁ for K = ℚ(ζ₈) (1 − ζ₈ generates the prime above 2, and ζ₈ is not a square in K), and L_t = ℚ(ζ₆₄), cyclic of degree 8 over K.

#### An auxiliary place inert in a cyclic extension

*Lemma* `TauCeti.LawrenceVenkatesh.inert_auxiliary_place` — module `TauCeti/NumberTheory/LawrenceVenkatesh/SUnit/Reductions`.

Let L/K be a cyclic extension of number fields, S a finite set of places of K and T a finite set of places. There is a finite place v ∉ S ∪ T, unramified in L, whose Frobenius generates Gal(L/K), whose residue characteristic p is odd, unramified in K and not below any place of S. For such v, L ⊗_K K_v is a field, unramified of degree [L : K] over K_v, and K_v/ℚ_p is unramified.

**Proof.**

- Apply Chebotarev (Tau Ceti Chebotarev Layer 10) to the conjugacy class of a generator σ, excluding the finitely many places in S ∪ T, above 2, above primes ramified in K and above primes lying below S.
- The decomposition group of a place above v is generated by Frob_v = σ, hence is all of Gal(L/K); so there is one place above v, with residue degree [L : K] and ramification index 1, and L ⊗_K K_v is that completion.

**Uses.** `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `tauceti:NumberField.artinSymbol`; `tauceti:NumberField.exists_isArithFrobAt`; `tauceti:NumberField.Chebotarev.frobeniusPrimeSet`.

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev — Chebotarev Layer 10 (Dirichlet-density Chebotarev, infinitude of every Frobenius class); tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius — LocalFieldsRamification Layer 2 (unramified extensions and Frobenius).

**Tests.**

- K = ℚ(i) and L = ℚ(ζ₈), a quadratic extension of K: every prime p ≡ 5 mod 8 splits in K, and the places of K above it are inert in L because 2 is not a square modulo p.
- For m = 8 and K = ℚ(ζ₈), v has residue degree 8 in L_t.

#### Monodromy of the Legendre family

*Theorem* `TauCeti.LawrenceVenkatesh.SUnit.legendre_monodromy` — module `TauCeti/NumberTheory/LawrenceVenkatesh/SUnit/LegendreMonodromy`.

Let B = ℂ ∖ {0, 1}, λ₀ ∈ (0, 1), and let γ₀ (resp. γ₁) be a simple loop at λ₀ encircling 0 (resp. 1) once and no other point of {0, 1}. There are classes a, b ∈ H₁(E_{λ₀}(ℂ); ℤ) with î(a, b) = ±1 such that the monodromy of the Legendre family along γ₀ (resp. γ₁) acts on H₁(E_{λ₀}(ℂ); ℤ) as ε₀T_a² (resp. ε₁T_b²) with ε_i ∈ {±1}, where T_c(x) = x + î(x, c)c. Consequently: (a) the monodromy of γ₀² (resp. γ₁²) is the nontrivial unipotent T_a⁴ (resp. T_b⁴); (b) the algebraic monodromy group of the Legendre family is SL(H¹_B(E_{λ₀}, ℂ)) = Sp, i.e. the family has full monodromy; (c) the Zariski closure of the monodromy of any subgroup of π₁(B, λ₀) containing powers γ₀^k and γ₁^k (k ≥ 1) is also SL₂.

**Proof.**

- Topological model: E_λ(ℂ) is the double cover of ℙ¹(ℂ) branched at {0, 1, λ, ∞}, and the family is the configuration family of LV.5 with Σ = ℙ¹(ℂ), B = {0, 1, ∞}, S = ℂ ∖ {0, 1} (χ = −1) and 𝒵° = {y² = x(x − 1)(x − λ), y ≠ 0}; the analytic local system R¹f_*ℤ is its homology local system (Ehresmann; AbelianSchemesAndArithmeticModuli A5).
- By LV.5, the monodromy along γ is ± the action of the lift of Push(γ), the sign coming from the deck involution, which acts on H₁ of the elliptic curve by −1.
- Push(γ₀) = T_{c₀}^{±1} in Mod(ℂ ∖ {0, 1, λ₀}), where c₀ bounds a disk D₀ containing exactly 0 and λ₀ (Birman: the other push-off bounds a once-punctured disk).
- The monodromy of the double cover around c₀ is trivial (two branch points), so c₀ lifts to two curves c', c'' and T_{c₀} lifts to T_{c'}T_{c''}. The preimage of D₀ is an annulus with boundary c' ⊔ c'' (Euler characteristic 2·1 − 2 = 0), exchanged by the deck involution, so [c''] = −[c'] =: −a and T_{c'}T_{c''} acts by x ↦ x + 2î(x, a)a (LV.5, Dehn twists on homology). The complement of the annulus is also an annulus, so c' is nonseparating and a is primitive.
- Likewise γ₁ gives T_b² with b from a disk D₁ containing exactly λ₀ and 1. Taking D₀, D₁ to be thin neighbourhoods of the segments [0, λ₀] and [λ₀, 1], the core circles of the two annuli are the preimages of the segments, which meet in exactly one point, transversally (in the local coordinate w² = x − λ₀ the segments lift to the two axes); so î(a, b) = ±1.
- (b), (c): the Zariski closure contains the closures of {T_a^{4kn}} and {T_b^{4kn}}, i.e. the root groups U_a, U_b (LV.0), which generate Sp(H₁ ⊗ ℂ) = SL₂ because î(a, b) ≠ 0 (LV Lemma 2.13 in LV.0).

**Uses.** The Legendre family and its cyclic variant (LV §4.2) (`LV.6/legendre-family`); Monodromy of families of branched covers over configuration spaces (`LV.5/configuration-family-monodromy`); The Birman exact sequence and pushes of simple loops (`LV.5/birman-exact-sequence`); Lifting powers of Dehn twists to finite coverings (`LV.5/covering-dehn-twist-lift`); Action of Dehn twists and multitwists on homology (`LV.5/dehn-twist-homology`); Primitive homology classes are represented by simple closed curves (`LV.5/primitive-classes-simple`); The Zariski closure of the powers of a transvection (`LV.0/zariski-closure-transvection-powers`); Two transvections with nonzero pairing (LV Lemma 2.13) (`LV.0/transvection-pair-closure`); The algebraic monodromy group of an abelian-by-finite family and full monodromy (LV (3.5), (5.1)) (`LV.3/algebraic-monodromy-group`); `AbelianSchemesAndArithmeticModuli:A5` (Complex uniformization with polarization and level); `ComplexComparisonPartII:C5` (Algebraic de Rham–Betti comparison).

**Tests.**

- In a basis (a, b) with î(a, b) = 1, T_a² = [[1, −2], [0, 1]] and T_b² = [[1, 0], [2, 1]] (columns are images); these generate Sanov's free subgroup of index 2 in Γ(2), which is Zariski dense in SL₂.
- T_a²T_b² = [[−3, −2], [2, 1]] has trace −2: up to sign, the monodromy around ∞ is −1 times a nontrivial unipotent (the Legendre curve has potentially multiplicative, non-semistable reduction at ∞).

#### A closed subgroup of a product of SL₂'s with surjective projections and factorwise unipotents is everything

*Lemma* `TauCeti.LawrenceVenkatesh.closed_subgroup_with_factor_unipotents` — module `TauCeti/NumberTheory/LawrenceVenkatesh/SUnit/LegendreMonodromy`.

Let k be an algebraically closed field of characteristic zero, V_1, …, V_r two-dimensional k-vector spaces and H ⊆ ∏_j SL(V_j) a Zariski-closed subgroup such that (i) each projection pr_j(H) is SL(V_j), and (ii) for each j, H contains an element whose j-th component is a nontrivial unipotent and whose other components are 1. Then H = ∏_j SL(V_j).

**Proof.**

- N_j := H ∩ (1 × ⋯ × SL(V_j) × ⋯ × 1) is a closed subgroup of SL(V_j) normalized by pr_j(H) = SL(V_j), hence a closed normal subgroup of SL(V_j).
- By (ii) it contains a nontrivial unipotent, which is not ±1; closed normal subgroups of SL₂ are SL₂ or contained in {±1} (ReductiveGroups Layer 6), so N_j = SL(V_j).
- Hence H ⊇ ∏_j N_j = ∏_j SL(V_j).

**Uses.** `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `tauceti:LinearMap.GeneralLinearGroup.IsUnipotent`.

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components); tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups — ReductiveGroups Layer 6 (reductive and semisimple groups, centres).

**Tests.**

- The diagonal SL₂ ⊆ SL₂ × SL₂ satisfies (i) but not (ii).
- r = 1: (i) alone already gives H = SL₂.

#### Big monodromy for the cyclic variant of the Legendre family (LV Lemma 4.3)

*Theorem* `TauCeti.LawrenceVenkatesh.SUnit.variant_family_full_monodromy` — module `TauCeti/NumberTheory/LawrenceVenkatesh/SUnit/LegendreMonodromy`.

For every m ≥ 1, the family over ℂ ∖ {0, 1} whose fibre over t is ⊔_{z^m = t} E_z (the analytification of X → Y' → Y of the Legendre-variant node) has full monodromy: for t₀ ∈ ℂ ∖ {0, 1}, the Zariski closure of the monodromy on ⊕_{z^m = t₀} H¹_B(E_z, ℚ) contains ∏_z SL(H¹_B(E_z, ℂ)).

**Proof.**

- Full monodromy does not depend on the base point, so take t₀ ∈ (0, 1) and u₀ = t₀^{1/m} ∈ (0, 1), with roots u_j = ζ^j u₀.
- Y' → Y (u ↦ u^m) is a connected cyclic covering, so π₁(Y', u₀) is a normal subgroup of π₁(Y, t₀) of index m whose elements lift to closed loops at every u_j and act factorwise, by Legendre monodromy along the lifts (Y' ⊆ ℂ ∖ {0, 1}).
- Let H be the Zariski closure of the image of π₁(Y', u₀). The loop δ₀ running m times around the circle |t| = t₀ lifts at u₀ to the circle |u| = u₀, a simple loop around 0 avoiding 1; a small loop δ₁ around t = 1 (joined to t₀ along the real segment) lifts at u₀ to a simple loop around 1, and at u_j (j ≠ 0) to a loop around ζ^j joined along the ray arg u = 2πj/m, which is null-homotopic in ℂ ∖ {0, 1}. Both δ₀ and δ₁ lie in π₁(Y', u₀).
- By the Legendre monodromy theorem (c), pr_{u₀}(H) = SL₂; and μ(δ₁²) is the nontrivial unipotent T_b⁴ in the u₀-factor and 1 elsewhere.
- The loop once around t = 0 permutes the roots cyclically and normalizes H (π₁(Y') is normal); conjugating by its powers transports both properties to every factor.
- The factorwise-unipotent criterion gives H = ∏ SL(H¹_B(E_{u_j}, ℂ)) ⊆ Γ.

**Uses.** Monodromy of the Legendre family (`LV.6/legendre-monodromy`); A closed subgroup of a product of SL₂'s with surjective projections and factorwise unipotents is everything (`LV.6/closed-subgroup-with-factor-unipotents`); The Legendre family and its cyclic variant (LV §4.2) (`LV.6/legendre-family`); The algebraic monodromy group of an abelian-by-finite family and full monodromy (LV (3.5), (5.1)) (`LV.3/algebraic-monodromy-group`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components); tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence — UniversalCovers Stage 2 (lifting criterion and Galois correspondence of covers).

**Tests.**

- m = 2, t₀ = 1/4: two factors u = ±1/2, and the loop around t = 1 acts as (±T_b², 1).
- m = 1 is the Legendre monodromy theorem.

#### Generic simplicity of the Legendre curves (LV Lemma 4.4)

*Theorem* `TauCeti.LawrenceVenkatesh.SUnit.legendre_generic_simplicity` — module `TauCeti/NumberTheory/LawrenceVenkatesh/SUnit/GenericSimplicity`.

Let L be a number field and p > 2 a prime unramified in L. There are only finitely many z ∈ L such that z and 1 − z are units at every place of L above p and H¹_et(E_{z, L̄}, ℚ_p) (equivalently V_p(E_z)) is reducible as a G_L-representation.

**Proof.**

- The admissible z fall into finitely many classes modulo the places above p (their residues avoid 0 and 1); fix a class with representative z₀ ∈ L. For z in the class, E_z has good reduction at every w | p (16z²(z − 1)² is a w-unit and p > 2).
- Suppose W ⊂ H¹(E_z) is a G_L-stable line. W is pure of weight 1, finitely ramified and crystalline at the places above p. Lemma 2.10 (LV.1) with K = ℚ and v = p (friendly, as ℚ has no CM subfield and p is unramified) gives Σ_{w|p} [L_w : ℚ_p]·a_w(W) = [L : ℚ]/2 with a_w(W) ∈ {0, 1}; since Σ_{w|p} [L_w : ℚ_p] = [L : ℚ], some w has a_w(W) = 1.
- At that w, with D_z := D_cris(H¹(E_z)|G_{L_w}) = (H¹_dR(E_z/L_w), φ_z, F¹) (LV.4), the line W^dR := D_cris(W) satisfies W^dR ⊆ F¹ (the filtration is induced), so W^dR = F¹D_z.
- Weak admissibility of D_cris gives t_N = t_H for W^dR (= 1) and for D_z (= 1). So φ_z has slope 1 on W^dR and slope 0 on D_z/W^dR, the L_w-linear φ_z^{[L_w:ℚ_p]} has eigenvalues of different valuations, and W^dR is the unique φ_z-stable line of slope 1, ℓ(D_z).
- The Gauss–Manin transport T_w(z) : (D_{z₀}, φ_{z₀}) ≅ (D_z, φ_z) (LV.2) carries ℓ(D_{z₀}) to ℓ(D_z) when either exists; hence the period map satisfies Φ_w(z) = T_w(z)^{-1}(F¹D_z) = ℓ₀ := ℓ(D_{z₀}), a fixed point of ℙ(D_{z₀}) (if ℓ(D_{z₀}) does not exist, no z in the class is reducible at w).
- The Legendre family over L has full monodromy (Legendre monodromy theorem) and ℂ ∖ {0, 1} is connected, so by LV.3 the set {z ∈ Ω_w(z₀) : Φ_w(z) = ℓ₀} is finite (a point has dimension 0 < 1). Take the union over the finitely many w | p and classes.

**Uses.** The Legendre family and its cyclic variant (LV §4.2) (`LV.6/legendre-family`); Monodromy of the Legendre family (`LV.6/legendre-monodromy`); Hodge weights summed over places above a friendly place (LV Lemma 2.10) (`LV.1/hodge-weight-sum-over-places`); Friendly places (LV Definition 2.7) (`LV.1/friendly-place`); The Galois representation on H¹ of an abelian variety (`LV.1/abelian-variety-cohomology-properties`); The fibre representations are crystalline with the de Rham cohomology of the fibre as filtered φ-module (`LV.4/fibre-representation-crystalline`); The p-adic period map on a residue disk (`LV.3/padic-period-map`); On a curve, the p-adic period map meets a closed subset not containing its image in finitely many points (`LV.3/padic-period-preimage-finite`); p-adic Gauss–Manin transport on a residue disk (LV (3.7)) (`LV.2/gauss-manin-transport-padic`); `PadicHodgeTheory:R06.2` (Period functors and admissibility); `WeightsInEtaleCohomology:R34.1` (Frobenius, algebraicity and weights); `ComplexComparisonPartII:C4` (Chow algebraization and morphism comparison).

**Tests.**

- L = ℚ, p = 3 and z ≡ 2 mod 3: E_z reduces to y² = x³ − x over 𝔽₃, which is supersingular (a₃ = 0); both slopes are 1/2, so no z in this class has reducible V₃(E_z).
- LV remark that much stronger results are known (Serre's open image theorem); the point is the purity-plus-period-map mechanism reused in LV.7.

#### Finiteness in a residue disk (LV Lemma 4.2)

*Theorem* `TauCeti.LawrenceVenkatesh.SUnit.s_unit_residue_disk_finite` — module `TauCeti/NumberTheory/LawrenceVenkatesh/SUnit/Finiteness`.

Assume μ_8 ⊆ K and that S contains the places above 2; let m be the 2-part of #μ(K), L a cyclic extension of K of degree m, v a finite place as in the auxiliary-place lemma (v ∉ S, Frob_v generates Gal(L/K), p = char k_v odd and unramified in K, no place of S above p), and t₀ ∈ 𝒪_S. Then {t ∈ U_{1,L} : t ≡ t₀ mod v} is finite.

**Proof.**

- We may assume t₀ ∈ U_{1,L}. Use the Legendre-variant family over 𝒪_S with y₀ = t₀ ∈ 𝒴(𝒪_S): E₀ = K[u]/(u^m − t₀) ≅ L, and since v is inert in L, E₀ ⊗ K_v = L₀ is a field of degree m over K_v; there is a single pair (y₀', w₀) over (t₀, v) and, for t in the disk, a single pair (t', w) over (t, v), with K(t') ≅ L.
- The fibre over t' is the Legendre curve E_z over K(t'), z a root of u^m = t. For an isomorphism α : K(t') ≅ L, α(z) and 1 − α(z) are units above p (t is an S-unit and 1 − z divides 1 − t), and p is unramified in L (L/K is unramified outside S). By Lemma 4.4, outside a finite set of t (those with α(z) in the finite exceptional set, for one of the m choices of α), ρ_{t'} is simple.
- Faltings's finiteness lemma over L (dimension 2, weight 1, unramified outside the places above S and p, integral Frobenius polynomials) leaves finitely many isomorphism classes for the semisimple ρ_{t'}; hence the pairs (K(t'), ρ_{t'}), and the local pairs (K(t')_w, ρ_{t',w}), lie in finitely many classes.
- Apply the LV.4 finiteness criterion: the family has full monodromy (Lemma 4.3), ℂ ∖ {0, 1} is connected, [L₀ : K_v] = m ≥ 8 and c ≤ (dim_{L₀} H¹_dR)² = 4 < m = dim Z₀.

**Uses.** Generic simplicity of the Legendre curves (LV Lemma 4.4) (`LV.6/legendre-generic-simplicity`); Big monodromy for the cyclic variant of the Legendre family (LV Lemma 4.3) (`LV.6/variant-family-full-monodromy`); The Legendre family and its cyclic variant (LV §4.2) (`LV.6/legendre-family`); The Kummer fields of non-square S-unit solutions (`LV.6/kummer-cyclic-field`); An auxiliary place inert in a cyclic extension (`LV.6/inert-auxiliary-place`); Finiteness criterion on a residue disk of a curve (`LV.4/finiteness-criterion`); Faltings's finiteness lemma (LV Lemma 2.3) (`LV.1/faltings-finiteness`); The Galois representation on H¹ of an abelian variety (`LV.1/abelian-variety-cohomology-properties`); Frobenius centralizers over unramified extensions of a p-adic field (`LV.0/semilinear-centralizer-unramified`); `ComplexComparisonPartII:C4` (Chow algebraization and morphism comparison).

**Tests.**

- K = ℚ(ζ₈), m = 8: c ≤ 4 < 8 = dim H_v.
- Without the variant (m = 1) the criterion fails, as for the Legendre family over ℚ_p (LV §1.3).

#### The S-unit theorem (LV Theorem 4.1)

*Theorem* `TauCeti.LawrenceVenkatesh.SUnit.finite_sUnitEquation_solutions` — module `TauCeti/NumberTheory/LawrenceVenkatesh/SUnit/Theorem`.

For a number field K and a finite set S of places containing the archimedean ones, U(K, S) := {t ∈ 𝒪_S^× : 1 − t ∈ 𝒪_S^×} is finite.

**Proof.**

- By the reductions, assume μ_8 ⊆ K and that S contains the places above 2; it suffices to show that U₁ is finite.
- U₁ is the finite union of the U_{1,L} over the Kummer fields L (Hermite–Minkowski).
- For each L choose v by the auxiliary-place lemma. 𝒴(𝒪_S) meets finitely many residue classes modulo v (k_v is finite); in each class that meets U_{1,L} choose t₀ in it and apply Lemma 4.2.

**Uses.** Reductions for the S-unit equation (`LV.6/s-unit-reductions`); The Kummer fields of non-square S-unit solutions (`LV.6/kummer-cyclic-field`); An auxiliary place inert in a cyclic extension (`LV.6/inert-auxiliary-place`); Finiteness in a residue disk (LV Lemma 4.2) (`LV.6/s-unit-residue-disk-finite`).

**Tests.**

- K = ℚ, S = {2, ∞}: U = {−1, 2, 1/2}.
- K = ℚ, S = {2, 3, ∞}: U contains −1, 2, 1/2, 3, −2, 4, −3, 9, −8, and their images under t ↦ 1 − t and t ↦ 1/t.

### LV.6.C Dependencies

Within this roadmap: `MordellLawrenceVenkatesh:LV.0`, `MordellLawrenceVenkatesh:LV.1`, `MordellLawrenceVenkatesh:LV.2`, `MordellLawrenceVenkatesh:LV.3`, `MordellLawrenceVenkatesh:LV.4`, `MordellLawrenceVenkatesh:LV.5`.

Other roadmaps:

- `FaltingsFinitenessAndIsogenyTheorems:R28.1` (Height finiteness on arithmetic moduli). Used through the node cited in the list of uses.
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius` (Layer 2: unramified extensions and Frobenius). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For a finite place w of a number field K and a monic f ∈ 𝒪_w[X] with separable reduction, K_w[X]/(f) is a finite product of unramified extensions of K_w (so an extension generated by a root of f is unramified at w); for a finite extension L/K and a place v unramified in L whose decomposition group is generated by Frob_v, there are [L : K]/ord(Frob_v) places above v, each of residue degree ord(Frob_v).
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev` (Layer 10: Dirichlet-density Chebotarev). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For a finite Galois extension L/K of number fields, a conjugacy class C of Gal(L/K) and a finite set T of places of K, there is a finite place v ∉ T unramified in L whose Artin symbol is C (infinitude of frobeniusPrimeSet K L C).
- `AbelianSchemesAndArithmeticModuli:A1` (Abelian schemes and rigidity). Needed: An elliptic curve over an affine scheme T = Spec R, given by a Weierstrass equation with unit discriminant (Mathlib WeierstrassCurve.IsElliptic over R), is an abelian scheme of relative dimension 1 over T, with its canonical principal polarization, compatibly with base change.
- `AbelianSchemesAndArithmeticModuli:A2` (Duals, Picard functors, and polarizations). Needed: Polarizations of abelian schemes (λ : A → A^∨ with the positivity condition), stable under base change; the polarization of a relative Jacobian.
- `AbelianSchemesAndArithmeticModuli:A4` (Degree-one realizations and deformation theory). Needed: For an abelian scheme f : A → T of relative dimension d over a smooth 𝒪_S-scheme T: relative H¹_dR(A/T) locally free of rank 2d with Hodge exact sequence 0 → f_*Ω¹ → H¹_dR → R¹f_*𝒪 → 0 (locally free terms), compatible with arbitrary base change; the Gauss–Manin connection relative to 𝒪_S, integrable; the cup-product pairing induced by a polarization, perfect and alternating, with F¹ Lagrangian and horizontal for ∇; all compatible with base change and with the analytic comparison over ℂ.
- `AbelianSchemesAndArithmeticModuli:A5` (Complex uniformization with polarization and level). Needed: For an abelian scheme over a smooth complex variety T, the degree-one de Rham–Betti comparison H¹_dR(A/T)^an ≅ R¹f_*ℂ ⊗ 𝒪^an identifies ∇ with the connection whose horizontal sections are R¹f_*ℂ, and R¹f_*ℤ is a local system (Ehresmann).
- `ComplexComparisonPartII:C5` (Algebraic de Rham–Betti comparison). Needed: For a smooth proper morphism of complex algebraic varieties, the analytic Gauss–Manin connection on the relative algebraic de Rham cohomology has the Betti local system R^q f_*ℂ as sheaf of horizontal sections (relative Gauss–Manin compatibility of the algebraic de Rham–Betti comparison).
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups` (Layer 6: reductive and semisimple groups). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For a symplectic space (V, ω) of dimension ≥ 2 over an algebraically closed field of characteristic zero: Sp(V) is connected, its centre is {±1}, and every closed normal subgroup of Sp(V) is either Sp(V) or contained in {±1}.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components` (Layer 3: subgroups, quotients, components). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For an affine algebraic group G over a field k and an abstract subgroup Γ ⊆ G(k): the Zariski closure of Γ, the smallest closed subgroup scheme whose k-points contain Γ (reduced, with Γ Zariski dense in it); its formation commutes with field extension; a finite-index subgroup of Γ has closure with the same identity component; the closure of the image of Γ under a homomorphism of algebraic groups is the image of the closure; subgroups normalizing Γ normalize its closure; in characteristic zero an infinite subgroup of 𝔾_a(k) is Zariski dense; images of homomorphisms of algebraic groups are closed.
- `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence` (Stage 2: lifting criterion and Galois correspondence). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: Classification of (possibly disconnected) covering spaces of a connected, locally path-connected, semilocally simply connected space by π₁-sets, with the fibre monodromy and path/homotopy lifting; lifts of homeomorphisms of the base to a connected covering exist when the induced outer automorphism preserves the conjugacy class of the monodromy, and two lifts differ by a deck transformation.
- `PadicHodgeTheory:R06.2` (Period functors and admissibility). Needed: For a crystalline representation V of G_F (F/ℚ_p finite unramified): D_cris(V) is weakly admissible, i.e. t_N(D) = t_H(D) and t_N(D') ≥ t_H(D') for φ-stable subobjects D' with the induced filtration (Brinon–Conrad Theorem 9.3.4 with N = 0); subrepresentations of crystalline representations are crystalline and D_cris carries them to φ-stable subspaces with the induced filtration; t_N(D) is the p-adic valuation of the determinant of φ in any F-basis.
- `WeightsInEtaleCohomology:R34.1` (Frobenius, algebraicity and weights). Needed: For a number field K, a finite set T of finite places and a continuous representation ρ of G_K on a finite-dimensional ℚ_p-space: the predicates 'pure of weight w outside T' (unramified at v ∉ T and every root of the characteristic polynomial of ρ(Frob_v^geom) is an algebraic number with all complex absolute values q_v^{w/2}) and 'integral Frobenius polynomials outside T', with stability under subrepresentations, quotients, direct sums, duals (w ↦ −w), tensor products (weights add), determinants (weight w·dim), Tate twists (ℚ_p(n) has weight −2n), restriction to G_L (T replaced by the places above T) and induction from G_L for L/K finite (same weight, T enlarged by the places ramified in L).
- `ComplexComparisonPartII:C4` (Chow algebraization and morphism comparison). Needed: For a smooth geometrically connected curve Y over a subfield of ℂ, projective or the complement of finitely many points in a projective one, Y(ℂ) with the analytic topology is connected.

## Layer LV.7: Rational points on the base of an abelian-by-finite family

This layer proves the refined criterion for curves, LV Proposition 5.3. The hypotheses on the auxiliary place are stated completely: besides being friendly and outside $S$, its residue characteristic is odd and lies below no place of $S$, as the set-up of LV §3 requires. The proof of Lemma 6.1 takes the union over all base pairs of local degree at least $8$, which is what the Sublemma provides.

### LV.7.A Objects

#### The proportion of small Frobenius orbits (LV Definition 5.2)

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/Base/SizeV`, namespace `TauCeti.LawrenceVenkatesh.SizeV`.

Let K be a number field, v a finite place and E a nonempty finite set with a continuous action of G_K that is unramified at v (the inertia groups at the places of K̄ above v act trivially). For an arithmetic Frobenius Frob_v at a place of K̄ above v, size_v(E) := #{e ∈ E : the ⟨Frob_v⟩-orbit of e has fewer than 8 elements} / #E. It does not depend on the choice of place above v or of Frobenius. For a finite étale K-scheme Z, size_v(Z) := size_v(Z(K̄)). If f : E → E' is a G_K-equivariant map all of whose fibres have the same cardinality, then size_v(E) ≤ size_v(E') (LV (5.3)).

**Construction.**

- Two choices of Frobenius are conjugate by some g ∈ G_K modulo inertia; g maps the small-orbit elements for one choice bijectively onto those for the other.
- (5.3): all fibres having the same cardinality c > 0, f is surjective and #E = c·#E'. The orbit of e maps onto the orbit of f(e), so small-orbit elements of E lie over small-orbit elements of E', and #small(E) ≤ c·#small(E').

**Declarations and API.**

- `sizeV` (constructor): size_v(E) ∈ ℚ for a nonempty finite G_K-set unramified at v.
- `sizeV_indep` (extensionality): Independence of the place above v and of the Frobenius.
- `sizeV_le_of_fibres` (relation): size_v(E) ≤ size_v(E') for an equivariant map with fibres of constant cardinality.
- `sizeV_mem_Icc` (other): 0 ≤ size_v(E) ≤ 1.
- `sizeV_scheme` (coercion): size_v of a finite étale K-scheme through its K̄-points.
- `sizeV_eq_places` (characterisation): For Z = Spec E with E finite étale and unramified at v: size_v(Z) = Σ_{[E_w : K_v] < 8} [E_w : K_v] / [E : K], the sum over the factors E_w of E ⊗_K K_v.
- `sizeV_cycle` (example): A single k-cycle: size 1 if k < 8, else 0.

**Uses.** `mathlib:IsArithFrobAt`; `tauceti:NumberField.exists_isArithFrobAt`; `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius — LocalFieldsRamification Layer 2 (unramified extensions and Frobenius).

**Tests.**

- E = 𝔽_{q^k}-points of a set permuted by Frobenius as a single k-cycle: size_v(E) = 1 if k < 8 and 0 otherwise.
- For E = Υ ⊆ (ℤ/N)^{2g} and E → Υ with fibres of constant size (LV.11), size_v(E) ≤ size_v(Υ).

### LV.7.B Theorems

#### Frobenius orbits on geometric points are the places above v

*Lemma* `TauCeti.LawrenceVenkatesh.frobenius_orbits_places` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Base/SizeV`.

Let E be a finite étale K-algebra unramified at the finite place v, and fix a place v̄ of K̄ above v. The ⟨Frob_v⟩-orbits on Hom_K(E, K̄) are in bijection with the factors E_w of E ⊗_K K_v (the pairs (i, w) with E = ∏ E_i and w a place of E_i above v), the orbit of (i, w) having [E_w : K_v] elements; in particular Σ_w [E_w : K_v] = [E : K].

**Proof.**

- Completion at v̄ identifies the decomposition group D_{v̄} with G_{K_v} and Hom_K(E_i, K̄) with Hom_{K_v}(E_i ⊗ K_v, K̄_v) = ⊔_{w|v} Hom_{K_v}(E_{i,w}, K̄_v) as D_{v̄}-sets.
- G_{K_v} acts transitively on Hom_{K_v}(E_{i,w}, K̄_v), a set with [E_{i,w} : K_v] elements; since E_{i,w}/K_v is unramified, the action factors through the unramified quotient, topologically generated by Frob_v, so the ⟨Frob_v⟩-orbits are the G_{K_v}-orbits.

**Uses.** Splitting of a finite separable extension after base change to a splitting field (`LV.0/galois-tensor-splitting`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `mathlib:IsArithFrobAt`.

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius — LocalFieldsRamification Layer 2 (unramified extensions and Frobenius).

**Tests.**

- E = K(√a) with v inert: one orbit of size 2.
- E = K × K: two fixed points.

#### General position for tuples of Lagrangians (LV Lemma 6.4)

*Lemma* `TauCeti.LawrenceVenkatesh.lagrangian_general_position` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Base/GeneralPosition`.

Let (V, ω) be a symplectic space of dimension 2d ≥ 2 over a field k of characteristic zero and r ≥ 5. Let E_r ⊆ LGr(V, ω)^r be the set of tuples (F_1, …, F_r) of Lagrangians (over k̄) for which some subspace 0 ≠ W ≠ V satisfies dim(F_j ∩ W) ≥ dim(W)/2 for all j. Then E_r is Zariski closed and E_r ≠ LGr(V, ω)^r; in particular dim E_r < r·d(d+1)/2.

**Proof.**

- Closedness: in Gr(V) × LGr(V, ω)^r (Gr(V) the disjoint union of the Grassmannians Gr(V, w), 0 < w < 2d) the conditions dim(F_j ∩ W) ≥ ⌈w/2⌉ are rank conditions on the tautological bundles, hence closed; E_r is the image of this closed set under the projection, which is proper because Gr(V) is projective.
- In a symplectic basis (e_i, e_i') with ⟨e_i, e_i'⟩ = 1 take F_1 = span(e_i), F_2 = span(e_i'), F_3 = span(e_i + e_i'), F_4 = span(e_i + 2i·e_i'); these are Lagrangian and pairwise transverse (2i ≠ 1 in characteristic zero).
- If W works for F_1, …, F_4, then W = (W ∩ F_1) ⊕ (W ∩ F_2) with both summands of dimension dim W/2, and likewise for F_3, F_4; the projections along F_1 ⊕ F_2 give isomorphisms W ∩ F_3 ≅ W ∩ F_1 and W ∩ F_3 ≅ W ∩ F_2, so Φ_{12;3} : F_1 → F_2 (e_i ↦ e_i') maps W ∩ F_1 onto W ∩ F_2, and similarly Φ_{12;4} (e_i ↦ 2i·e_i').
- Hence W ∩ F_1 is stable under Φ_{12;4}⁻¹Φ_{12;3}, which is diagonal with the distinct eigenvalues (2i)⁻¹; so W ∩ F_1 is spanned by a subset of the e_i, W ∩ F_2 = Φ_{12;3}(W ∩ F_1), and there are finitely many candidates W_1, …, W_M.
- For each proper nonzero W_s the set of Lagrangians F with dim(F ∩ W_s) ≥ dim(W_s)/2 is a proper closed subset of LGr(V, ω): otherwise every pair of transverse Lagrangians L, L' would split W_s as (W_s ∩ L) ⊕ (W_s ∩ L') with equal dimensions, and letting L' run over the graphs of symmetric maps into L (which can send a given nonzero vector anywhere in L) forces L ⊆ W_s and symmetrically L' ⊆ W_s, so W_s = V.
- LGr(V, ω)(k) is Zariski dense (it contains an affine space), so some F_5 ∈ LGr(V, ω)(k) avoids these finitely many proper closed subsets; (F_1, …, F_5, F_6, …, F_r) ∉ E_r for any F_6, …, F_r.

**Uses.** The Lagrangian Grassmannian (`LV.3/lagrangian-grassmannian`); The Lagrangian Grassmannian is smooth, projective and geometrically irreducible of dimension d(d+1)/2 (`LV.3/lagrangian-grassmannian-geometry`); Lagrangian subspaces, adapted symplectic bases and transversal charts (`LV.3/lagrangian-symplectic-basis`); `AlgebraicModuliForArithmeticGeometry:R09.1` (Projective parameter spaces); `SchemeAndStackFoundations:SF.0` (Schemes and morphisms).

**Tests.**

- d = 1 (lines in a plane): W is a line and the condition says W = F_j for all j, so E_r is the small diagonal, of dimension 1 < r.
- The explicit F_1, …, F_4 of LV for d = 2: span(e₁, e₂), span(e₁', e₂'), span(e₁ + e₁', e₂ + e₂'), span(e₁ + 2e₁', e₂ + 4e₂').

#### Lagrangians meeting a Frobenius-stable subspace in half its dimension (LV Lemma 6.3)

*Lemma* `TauCeti.LawrenceVenkatesh.frobenius_stable_lagrangian_avoidance` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Base/GeneralPosition`.

Let K_v be a field of characteristic zero, L_w/K_v a cyclic extension of degree r ≥ 5 with generator σ_w, (V, ω) a symplectic L_w-space of dimension 2d, and φ : V → V a bijective σ_w-semilinear map that is a similitude: ω(φx, φy) = c·σ_w(ω(x, y)) for some c ∈ K_v^×. Let H_w := LGr_{L_w}(V, ω), a K_v-variety of dimension r·d(d+1)/2. There is a Zariski-closed B_w ⊂ H_w with dim B_w < dim H_w such that every Lagrangian L_w-subspace F ∈ H_w(K_v) for which some φ-stable L_w-subspace 0 ≠ W ≠ V satisfies dim_{L_w}(F ∩ W) ≥ dim_{L_w}(W)/2 lies in B_w(K_v).

**Proof.**

- Over K̄_v, V ⊗_{K_v} K̄_v = ⊕_{i=1}^r V_i along the embeddings τ_i = τ_1 ∘ σ_w^{−(i−1)} of L_w; the K̄_v-linear map φ ⊗ 1 maps V_i onto V_{i+1}, so ψ_i := (φ ⊗ 1)^{i−1} : V_1 ≅ V_i are similitudes.
- By the splitting lemma (LV.3), F ↦ (ψ_i⁻¹(F_i))_i identifies H_w ⊗ K̄_v with LGr(V_1, ω_1)^r.
- A φ-stable W gives W ⊗ K̄_v = ⊕ W_i with ψ_i⁻¹(W_i) = W_1 for all i (the cyclic identification V_r → V_1 is not used), and dim(F_i ∩ W_i) = dim_{L_w}(F ∩ W); so the image of F lies in E_r of LV Lemma 6.4.
- Let B_w be the image of E_r under the integral surjection H_w ⊗ K̄_v → H_w; it is closed of dimension dim E_r < r·d(d+1)/2.

**Uses.** General position for tuples of Lagrangians (LV Lemma 6.4) (`LV.7/lagrangian-general-position`); Geometry of the period variety (`LV.3/lagrangian-period-variety-splitting`); Splitting of a finite separable extension after base change to a splitting field (`LV.0/galois-tensor-splitting`); Crystalline Frobenius on the de Rham cohomology of the fibres and its compatibility with Gauss–Manin transport (LV (3.9)) (`LV.2/crystalline-frobenius-on-fibres`); `SchemeAndStackFoundations:SF.0` (Schemes and morphisms).

**Tests.**

- d = 1: W is a φ-stable line and F = W; if φ^r has distinct eigenvalues on the L_w-plane, there are at most two such lines and B_w is finite.
- The hypothesis applies to φ₀^{f_v} for the crystalline Frobenius φ₀ on a factor V₀ of LV.4, with c = p^{f_v}.

#### Bad points produce a Frobenius-stable subspace with large Hodge filtration (Sublemma in LV §6)

*Lemma* `TauCeti.LawrenceVenkatesh.AbelianByFiniteFamily.generic_simplicity_sublemma` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Base/GenericSimplicity`.

Setting of Proposition 5.3: K is a number field with an embedding ι : K → ℂ; Y is a smooth projective geometrically connected curve over K; X → Y' →π Y is an abelian-by-finite family of relative dimension d with full monodromy (relative to ι) admitting a good model 𝒳 → 𝒴' → 𝒴 over 𝒪 = 𝒪_S with 𝒴 proper, so that Y(K) = 𝒴(𝒪); v ∉ S is a friendly place of K whose residue characteristic p is odd and lies below no place of S (so K_v/ℚ_p is unramified and Setting P of LV.3 applies at every y₀ ∈ Y(K)). Let y ∈ Y(K) with size_v(π^{-1}(y)) < 1/(d + 1) be bad: for every (y', w) over (y, v) with [K(y')_w : K_v] ≥ 8, ρ_{y'} is not simple. Then some (y', w) over (y, v) with [K(y')_w : K_v] ≥ 8 has a φ-stable K(y')_w-subspace 0 ≠ W^dR ≠ H¹_dR(X_{y'}/K(y')_w) with dim F¹W^dR ≥ dim(W^dR)/2, where F¹W^dR = W^dR ∩ F¹.

**Proof.**

- For each closed point y' over y choose a nonzero subrepresentation W_{y'} ⊆ ρ_{y'} of minimal dimension, and for w | v let W^dR_{y',w} := D_cris(W_{y'}|G_{K(y')_w}) ⊆ H¹_dR(X_{y'}/K(y')_w) (LV.4), φ-stable with the induced filtration; its K(y')_w-dimension is dim W_{y'}.
- (6.8): if [K(y')_w : K_v] ≥ 8 then ρ_{y'} is not simple; it carries a nondegenerate alternating pairing preserved up to the cyclotomic character, so dim W_{y'} ≤ d (LV.0).
- All places of K(y') above p are good (no place of S lies above p), so W_{y'} is crystalline there, pure of weight 1 and finitely ramified; Lemma 2.10 (LV.1) at the friendly place v gives (6.9): Σ_{w|v} [K(y')_w : K_v]·a_{y',w} = [K(y') : K]/2 with a_{y',w} = dim F¹W^dR_{y',w}/dim W^dR_{y',w}.
- Suppose a_{y',w} < 1/2, hence a_{y',w} ≤ 1/2 − 1/(2d), for all pairs of local degree ≥ 8. Summing (6.9) over y' and using a ≤ 1 for the other pairs gives (1/2)·Σ_{deg<8} deg ≥ (1/(2d))·Σ_{deg≥8} deg (LV (6.11)).
- By the orbit–place dictionary the local degrees are the Frobenius orbit sizes on π^{-1}(y)(K̄), so d·#small ≥ #large, i.e. size_v(π^{-1}(y)) ≥ 1/(d + 1), a contradiction.

**Uses.** The proportion of small Frobenius orbits (LV Definition 5.2) (`LV.7/size-v`); Frobenius orbits on geometric points are the places above v (`LV.7/frobenius-orbits-places`); Hodge weights summed over places above a friendly place (LV Lemma 2.10) (`LV.1/hodge-weight-sum-over-places`); Friendly places (LV Definition 2.7) (`LV.1/friendly-place`); The Galois representation on H¹ of an abelian variety (`LV.1/abelian-variety-cohomology-properties`); Minimal subrepresentations of a representation with an invariant form up to similitude (`LV.0/minimal-subrepresentation-half`); The fibre representations are crystalline with the de Rham cohomology of the fibre as filtered φ-module (`LV.4/fibre-representation-crystalline`); `PadicHodgeTheory:R06.2` (Period functors and admissibility); `WeightsInEtaleCohomology:R34.1` (Frobenius, algebraicity and weights).

**Tests.**

- d = 1 and π = id: the sublemma says a reducible fibre representation has a φ-stable line equal to F¹ at v (as in LV Lemma 4.4).
- If all orbits have size ≥ 8 (size_v = 0), the counting forces a_{y',w} ≥ 1/2 for some pair outright.

#### Generic simplicity along the family (LV Lemma 6.1)

*Lemma* `TauCeti.LawrenceVenkatesh.AbelianByFiniteFamily.generic_simplicity_family` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Base/GenericSimplicity`.

Setting of Proposition 5.3: K is a number field with an embedding ι : K → ℂ; Y is a smooth projective geometrically connected curve over K; X → Y' →π Y is an abelian-by-finite family of relative dimension d with full monodromy (relative to ι) admitting a good model 𝒳 → 𝒴' → 𝒴 over 𝒪 = 𝒪_S with 𝒴 proper, so that Y(K) = 𝒴(𝒪); v ∉ S is a friendly place of K whose residue characteristic p is odd and lies below no place of S (so K_v/ℚ_p is unramified and Setting P of LV.3 applies at every y₀ ∈ Y(K)). Let y₀ ∈ Y(K) with size_v(π^{-1}(y₀)) < 1/(d + 1) and Ω_v = Ω_v(y₀). There is a finite set F of points y ∈ Ω_v ∩ Y(K) with size_v(π^{-1}(y)) < 1/(d + 1) such that every other such y has a pair (y', w) over (y, v) with [K(y')_w : K_v] ≥ 8 and ρ_{y'} simple.

**Proof.**

- Let y be bad. The sublemma gives (y', w) of local degree ≥ 8 and W^dR; let (y₀', w₀) be the corresponding pair over (y₀, v), which has the same local degree (the transport identifies K(y')_w with L₀ = K(y₀')_{w₀}).
- Transport W^dR by T_v(y)⁻¹ to a φ₀-stable subspace W₀ of the factor V₀ (LV.4 transport lemma); then dim(pr₀Φ_v(y) ∩ W₀) = dim F¹W^dR ≥ dim(W₀)/2. As φ₀ is σ_{L₀}-semilinear and a similitude, φ₀^{f_v} satisfies the hypotheses of Lemma 6.3 over K_v, and W₀ is φ₀^{f_v}-stable; so pr₀Φ_v(y) ∈ B_{(y₀',w₀)}.
- Under full monodromy the closure of pr₀Φ_v(Ω_v) is H₀, of dimension > dim B_{(y₀',w₀)}; by LV.3 (finite preimages, part (c)) only finitely many y ∈ Ω_v have pr₀Φ_v(y) ∈ B_{(y₀',w₀)}.
- Take F to be the union over the finitely many pairs (y₀', w₀) of local degree ≥ 8 (LV fix one pair; the union is what the sublemma requires).

**Uses.** Bad points produce a Frobenius-stable subspace with large Hodge filtration (Sublemma in LV §6) (`LV.7/generic-simplicity-sublemma`); Lagrangians meeting a Frobenius-stable subspace in half its dimension (LV Lemma 6.3) (`LV.7/frobenius-stable-lagrangian-avoidance`); The filtered φ-module of a fibre read off from the period map (LV (6.6)–(6.7)) (`LV.4/fibre-filtered-phi-transport`); On a curve, the p-adic period map meets a closed subset not containing its image in finitely many points (`LV.3/padic-period-preimage-finite`); Zariski closure of the p-adic period image (LV Lemma 3.3) and density under full monodromy (`LV.3/padic-period-image-dense`); Crystalline Frobenius on the de Rham cohomology of the fibres and its compatibility with Gauss–Manin transport (LV (3.9)) (`LV.2/crystalline-frobenius-on-fibres`); `ComplexComparisonPartII:C4` (Chow algebraization and morphism comparison).

**Tests.**

- d = 1, π = id: this recovers the argument of LV Lemma 4.4 with the degree condition replaced by the size condition.
- If no pair over (y₀, v) has local degree ≥ 8 then size_v(π^{-1}(y₀)) = 1, so y₀ is excluded by hypothesis.

#### Galois representations really vary in the family (LV Lemma 6.2)

*Lemma* `TauCeti.LawrenceVenkatesh.AbelianByFiniteFamily.representations_vary` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Base/Finiteness`.

Setting of Proposition 5.3: K is a number field with an embedding ι : K → ℂ; Y is a smooth projective geometrically connected curve over K; X → Y' →π Y is an abelian-by-finite family of relative dimension d with full monodromy (relative to ι) admitting a good model 𝒳 → 𝒴' → 𝒴 over 𝒪 = 𝒪_S with 𝒴 proper, so that Y(K) = 𝒴(𝒪); v ∉ S is a friendly place of K whose residue characteristic p is odd and lies below no place of S (so K_v/ℚ_p is unramified and Setting P of LV.3 applies at every y₀ ∈ Y(K)). Let y₀ ∈ Y(K) and Ω_v = Ω_v(y₀). Fix a finite extension K'_v/K_v with [K'_v : K_v] ≥ 8 and a representation ρ₀ of G_{K'_v}. Only finitely many y ∈ Ω_v ∩ Y(K) admit a pair (y', w) over (y, v) with (K(y')_w, ρ_{y',w}) ≅ (K'_v, ρ₀).

**Proof.**

- For each of the finitely many pairs (y₀', w₀) over (y₀, v) with local degree [K'_v : K_v], apply the LV.4 finiteness criterion to the set of y whose corresponding pair realizes the class (K'_v, ρ₀) (a single class of pairs).
- Its hypothesis holds: under full monodromy dim Z₀ = [K'_v : K_v]·d(d+1)/2 ≥ 4d(d+1) > 4d² ≥ c.

**Uses.** Finiteness criterion on a residue disk of a curve (`LV.4/finiteness-criterion`); Zariski closure of the p-adic period image (LV Lemma 3.3) and density under full monodromy (`LV.3/padic-period-image-dense`); Frobenius centralizers over unramified extensions of a p-adic field (`LV.0/semilinear-centralizer-unramified`); `ComplexComparisonPartII:C4` (Chow algebraization and morphism comparison).

**Tests.**

- d = 1 and [K'_v : K_v] = 8: c ≤ 4 < 8 = dim H₀.
- The conditions (i), (ii) of Lemma 6.1 are not needed for this finiteness.

#### Rational points on the base of an abelian-by-finite family (LV Proposition 5.3)

*Theorem* `TauCeti.LawrenceVenkatesh.AbelianByFiniteFamily.finite_points_sizeV_lt` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Base/Proposition53`.

Setting of Proposition 5.3: K is a number field with an embedding ι : K → ℂ; Y is a smooth projective geometrically connected curve over K; X → Y' →π Y is an abelian-by-finite family of relative dimension d with full monodromy (relative to ι) admitting a good model 𝒳 → 𝒴' → 𝒴 over 𝒪 = 𝒪_S with 𝒴 proper, so that Y(K) = 𝒴(𝒪); v ∉ S is a friendly place of K whose residue characteristic p is odd and lies below no place of S (so K_v/ℚ_p is unramified and Setting P of LV.3 applies at every y₀ ∈ Y(K)). Then Y(K)* := {y ∈ Y(K) : size_v(π^{-1}(y)) < 1/(d + 1)} is finite.

**Proof.**

- Y(K) = 𝒴(𝒪) meets finitely many residue disks at v; for each disk meeting Y(K)* choose y₀ ∈ Y(K)* in it. It suffices to show Ω_v(y₀) ∩ Y(K)* is finite.
- By Lemma 6.1, outside a finite set every y ∈ Ω_v ∩ Y(K)* has a pair (y', w) with [K(y')_w : K_v] ≥ 8 and ρ_{y'} simple.
- K(y') has degree ≤ deg π over K and is unramified outside S (𝒴' → 𝒴 is finite étale over 𝒪_S), so it lies in finitely many isomorphism classes (Hermite–Minkowski). For each such field, the simple representations ρ_{y'} (dimension 2d, unramified outside the places above S and p, pure of weight 1 with integral Frobenius polynomials) lie in finitely many classes (Faltings's lemma, LV.1). So the pairs (K(y'), ρ_{y'}), and the local pairs (K(y')_w, ρ_{y',w}) with w | v, lie in finitely many classes.
- Lemma 6.2 applied to each of these local classes of degree ≥ 8 leaves finitely many y.

**Uses.** Generic simplicity along the family (LV Lemma 6.1) (`LV.7/generic-simplicity-family`); Galois representations really vary in the family (LV Lemma 6.2) (`LV.7/representations-vary`); The proportion of small Frobenius orbits (LV Definition 5.2) (`LV.7/size-v`); Faltings's finiteness lemma (LV Lemma 2.3) (`LV.1/faltings-finiteness`); The Galois representation on H¹ of an abelian variety (`LV.1/abelian-variety-cohomology-properties`); Good models over rings of S-integers (`LV.2/good-model`); Residue disks and their coordinates (`LV.2/residue-disk`); `FaltingsFinitenessAndIsogenyTheorems:R28.1/hermite-minkowski-finiteness-of-extensions-unramified-outside-S` (Hermite–Minkowski, FaltingsFinitenessAndIsogenyTheorems packet); `NeronModelsAndSemistableAbelianVarieties:R11.5` (Tate modules, conductors and local factors).

**Tests.**

- LV.11 applies the proposition to the Kodaira–Parshin family, for which size_v(π^{-1}(y)) < 1/(d_q + 1) for all y ∈ Y(K), so Y(K)* = Y(K).
- For π = id, size_v(π^{-1}(y)) = 1 for all y and the proposition is empty, which is why LV pass to abelian-by-finite families.

### LV.7.C Dependencies

Within this roadmap: `MordellLawrenceVenkatesh:LV.0`, `MordellLawrenceVenkatesh:LV.1`, `MordellLawrenceVenkatesh:LV.2`, `MordellLawrenceVenkatesh:LV.3`, `MordellLawrenceVenkatesh:LV.4`.

Other roadmaps:

- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius` (Layer 2: unramified extensions and Frobenius). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For a finite place w of a number field K and a monic f ∈ 𝒪_w[X] with separable reduction, K_w[X]/(f) is a finite product of unramified extensions of K_w (so an extension generated by a root of f is unramified at w); for a finite extension L/K and a place v unramified in L whose decomposition group is generated by Frob_v, there are [L : K]/ord(Frob_v) places above v, each of residue degree ord(Frob_v). For a finite étale K-algebra E unramified at v and a place v̄ of K̄ above v, Hom_K(E, K̄) ≅ ⊔_w Hom_{K_v}(E_w, K̄_{v̄}) as sets with an action of the decomposition group D_{v̄} ≅ G_{K_v}.
- `AlgebraicModuliForArithmeticGeometry:R09.1` (Projective parameter spaces). Needed: For a finite-dimensional vector space V over a field: the scheme Gr(V) = ⊔_w Gr(V, w) is projective, so projections Gr(V) × Z → Z are closed; for subbundles 𝒲, ℱ of the trivial bundle the loci {dim(ℱ ∩ 𝒲) ≥ k} are closed (rank conditions).
- `SchemeAndStackFoundations:SF.0` (Schemes and morphisms). Needed: Dimension theory of schemes of finite type over a field: dimension of an integral scheme equals the transcendence degree of its function field; a scheme with a dense open subscheme isomorphic to 𝔸^n has dimension n; a proper closed subset of an irreducible scheme has smaller dimension; the Zariski closure of the image of a morphism X → Y has dimension ≤ dim X; dimension and (geometric) irreducibility of products and of base changes along field extensions; a scheme covered by irreducible open subschemes that pairwise meet is irreducible. The image of a closed subset under a finite (integral) surjective morphism is closed of the same dimension.
- `PadicHodgeTheory:R06.2` (Period functors and admissibility). Needed: For a crystalline representation V of G_F (F/ℚ_p finite unramified): D_cris(V) is weakly admissible, i.e. t_N(D) = t_H(D) and t_N(D') ≥ t_H(D') for φ-stable subobjects D' with the induced filtration (Brinon–Conrad Theorem 9.3.4 with N = 0); subrepresentations of crystalline representations are crystalline and D_cris carries them to φ-stable subspaces with the induced filtration; t_N(D) is the p-adic valuation of the determinant of φ in any F-basis.
- `WeightsInEtaleCohomology:R34.1` (Frobenius, algebraicity and weights). Needed: For a number field K, a finite set T of finite places and a continuous representation ρ of G_K on a finite-dimensional ℚ_p-space: the predicates 'pure of weight w outside T' (unramified at v ∉ T and every root of the characteristic polynomial of ρ(Frob_v^geom) is an algebraic number with all complex absolute values q_v^{w/2}) and 'integral Frobenius polynomials outside T', with stability under subrepresentations, quotients, direct sums, duals (w ↦ −w), tensor products (weights add), determinants (weight w·dim), Tate twists (ℚ_p(n) has weight −2n), restriction to G_L (T replaced by the places above T) and induction from G_L for L/K finite (same weight, T enlarged by the places ramified in L).
- `ComplexComparisonPartII:C4` (Chow algebraization and morphism comparison). Needed: For a smooth geometrically connected curve Y over a subfield of ℂ, projective or the complement of finitely many points in a projective one, Y(ℂ) with the analytic topology is connected.
- `FaltingsFinitenessAndIsogenyTheorems:R28.1` (Height finiteness on arithmetic moduli). Used through the node cited in the list of uses.
- `NeronModelsAndSemistableAbelianVarieties:R11.5` (Tate modules, conductors and local factors). Needed: Néron–Ogg–Shafarevich: an abelian variety over a number field with good reduction at u has V_p unramified at u for every p different from the residue characteristic of u.

## Layer LV.8: Hurwitz spaces of singly ramified covers and the Kodaira–Parshin family

This layer constructs the auxiliary family. The complex Hurwitz space is built as a covering of the configuration space and algebraized by Riemann existence and normalization; descent to $K$ uses only the middle exactness of the fundamental-group sequence, and the Galois equivariance of fibres is defined through the outer action, so no auxiliary rational point is needed. The reduced Prym is the identity component of the kernel of $e''$, and its rational homology is identified with the primitive homology of the degree-$q$ cover.

### LV.8.A Objects

#### Surjections nontrivial on a peripheral class and their symmetries (LV Lemma 7.4, group part)

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/Hurwitz/Surjections`, namespace `TauCeti.LawrenceVenkatesh.Hurwitz`.

Let Γ be a group (or a profinite group, with continuous homomorphisms), G a finite group with trivial centre and c a set of elements of Γ closed under conjugation. S(Γ, c, G) is the set of surjective homomorphisms φ : Γ → G with φ(γ) ≠ 1 for γ ∈ c. It carries commuting actions of Γ, γ·φ := φ ∘ Ad(γ)⁻¹, and of G, φ·h := Ad(h⁻¹) ∘ φ; G acts freely, and S(Γ, c, G)/G is the set of G-conjugacy classes of such surjections, on which Γ acts trivially. The stabilizer of φ in Γ × G^op is {(γ, h) : h⁻¹ = φ(γ)}, and φ is determined by its stabilizer.

**Construction.**

- γ·φ = Ad(φ(γ))⁻¹ ∘ φ, so the Γ-action preserves G-orbits and commutes with the G-action.
- φ·h = φ means Ad(h⁻¹) is trivial on the image G, so h is central, hence h = 1.
- (γ, h) fixes φ iff Ad(φ(γ)h)⁻¹ ∘ φ = φ, iff φ(γ)h is central (φ is surjective), i.e. h = φ(γ)⁻¹; so φ is recovered from its stabilizer as the map sending γ to the inverse of its partner h.

**Declarations and API.**

- `singlyRamifiedSurjections` (constructor): S(Γ, c, G) as a set of (continuous) surjective homomorphisms nontrivial on c.
- `singlyRamifiedSurjections.actLeft` (data): The Γ-action γ·φ = φ ∘ Ad(γ)⁻¹.
- `singlyRamifiedSurjections.actRight` (data): The G-action φ·h = Ad(h⁻¹) ∘ φ, free when Z(G) = 1.
- `singlyRamifiedSurjections.quotient` (data): S(Γ, c, G)/G, the conjugacy classes, with trivial Γ-action.
- `singlyRamifiedSurjections.stabilizer_eq` (characterisation): Stab_{Γ × G^op}(φ) = {(γ, φ(γ)⁻¹)}.
- `singlyRamifiedSurjections.comap` (functoriality): For a surjection Γ → Γ̄ through which the Γ-action factors, S(Γ̄, c̄, G) = S(Γ, c, G).
- `singlyRamifiedSurjections.aff3` (example): The Aff(3) count 810/135.

**Uses.** Aff(q) is centre-free, has trivial centralizer and is self-normalizing in Sym(𝔽_q) (`LV.0/affine-group-centralizer`); The commutator-product map on Aff(q)^{2s} (LV Lemma 2.11) (`LV.0/commutator-product-map`).

**Tests.**

- G = S₃ = Aff(3), Γ free on x₁, x₁', x₂, x₂' and c the conjugacy class of [x₁, x₁'][x₂, x₂']: #S(Γ, c, G) = 810 and #S/G = 135 (LV Lemma 2.11 in LV.0).
- If G had a nontrivial centre Z, the G-action would not be free (Z acts trivially).

#### The complex Hurwitz space of G-covers branched at one point (LV §7.3)

*Construction* — module `TauCeti/NumberTheory/LawrenceVenkatesh/Hurwitz/Complex`, namespace `TauCeti.LawrenceVenkatesh.Hurwitz`.

Y is a smooth projective geometrically connected curve of genus g ≥ 2 over a number field K ⊂ ℂ, and G is a finite group with trivial centre. Fix y₀ ≠ y₁ in Y(ℂ), Γ := π₁(Y(ℂ) ∖ {y₀}, y₁), c the conjugacy class of a small loop around y₀, and Γ̃ := π₁(F(Y(ℂ)), (y₁, y₀)) for the configuration space F(Y(ℂ)) = Y(ℂ)² ∖ Δ. The Γ̃ × G-set S(Γ, c, G) (extension lemma, with Γ ⊴ Γ̃ by LV.5) defines a covering Z° → F(Y(ℂ)) with free G-action, whose quotient Z°/G is the pullback along (y, y') ↦ y' of a finite covering e : Y' → Y(ℂ) with fibres S(y) := S(π₁(Y(ℂ) ∖ {y}), c_y, G)/G. So Z° → Y' × Y(ℂ) ∖ Γ_e (Γ_e the graph of e) is a G-torsor. By Riemann existence Y' is a smooth projective curve and Z° is algebraic; Z := the normalization of Y' × Y in Z° is a smooth projective surface with a G-action and a finite morphism f : Z → Y' × Y, and the composite Z → Y' is a smooth proper relative curve whose fibre Z_{y'} → Y over y' is the connected G-covering classified by y' ∈ S(e(y')), branched exactly at e(y'); near f⁻¹(Γ_e), f is (z, w) ↦ (z, wⁿ) in suitable local coordinates.

**Construction.**

- The Γ̃-action on S(Γ, c, G) exists by the extension lemma (Γ̄ = Γ is normal in Γ̃ and Γ̃ preserves c, LV.5); covering-space theory gives Z° with fibre S at (y₁, y₀) and G acting freely.
- Γ acts trivially on S/G, so the Γ̃-action on S/G factors through π₁(Y(ℂ), y₀) (LV.5 exact sequence), and Z°/G is the pullback of the covering e with fibre S/G.
- Riemann existence (SGA 1 XII 5.1): finite étale coverings of the analytifications of Y and of Y' × Y ∖ Γ_e are algebraic; Y' is proper because it is finite over Y.
- Local structure: in coordinates (z, u) on Y' × Y near Γ_e with Γ_e = {u = ẽ(z)} (e is étale), put w := u − ẽ(z); over the punctured polydisk the G-torsor is a disjoint union of copies of (z, w') ↦ (z, w'ⁿ), where n is the order of φ(c), and its normalization over the polydisk is the same map on the full polydisk, smooth over z.
- The normalization of Y' × Y in Z° analytifies to the normalization of the analytic space (ComplexComparisonPartII C0/C4), which is the space just described; so Z → Y' is smooth and proper with the stated fibres.

**Declarations and API.**

- `hurwitzComplex` (constructor): The complex curve Y' with e : Y' → Y and the G-covering Z → Y' × Y.
- `hurwitzComplex.fibre` (equivalence): e⁻¹(y) ≃ S(y) naturally in y.
- `hurwitzComplex.torsor` (other): Z → Y' × Y is a G-torsor off the graph Γ_e.
- `hurwitzComplex.localForm` (characterisation): Near Γ_e, Z → Y' × Y is (z, w) ↦ (z, wⁿ).
- `hurwitzComplex.relativeCurve` (other): Z → Y' is smooth and proper, with fibre Z_{y'} the G-cover branched at e(y').
- `hurwitzComplex.configuration` (compatibility): Z° is the covering of the configuration space attached to S(Γ, c, G); its monodromy is described by LV.5.
- `hurwitzComplex.aff3` (example): Degree 135 for Aff(3) and g = 2.

**Uses.** Unique extension of the action to an overgroup (`LV.8/surjection-action-extension`); The complex points of a curve form a closed surface of the same genus (`LV.8/curve-topological-genus`); The configuration fibration of a surface and its fundamental groups (`LV.5/fadell-neuwirth-sequence`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `ComplexComparisonPartII:C0` (Coherent analytic modules on algebraic analytifications); `ComplexComparisonPartII:C2` (Projective coherent GAGA); `ComplexComparisonPartII:C4` (Chow algebraization and morphism comparison); `InverseGaloisAndArithmeticFundamentalGroups:IG.3` (Branch cycles, rigidity and descent); `tauceti:TauCeti.CoveringSpace.monodromyEquivalence`; `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`; `mathlib:CommAlgCat.FiniteEtale`.

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence — UniversalCovers Stage 2 (lifting criterion and Galois correspondence of covers).

**Tests.**

- G = Aff(3) = S₃, g = 2: e : Y' → Y has degree 135.
- For G abelian the construction does not apply (nontrivial centre), and indeed abelian covers cannot be branched at a single point (the peripheral class is a product of commutators).

#### The reduced relative Prym of a family of Aff(q)-covers

*Construction* — module `TauCeti/NumberTheory/LawrenceVenkatesh/KodairaParshin/Prym`, namespace `TauCeti.LawrenceVenkatesh.KodairaParshin`.

Let q ≥ 3 be prime, B a reduced scheme of finite type over a field of characteristic zero and Z → B a smooth proper relative curve with geometrically connected fibres and an action of G = Aff(q) over B. Let P := Pic⁰_{Z/B}, an abelian scheme with its canonical principal polarization, on which G acts (by pushforward; the idempotents are invariant under g ↦ g⁻¹, so the choice does not matter), and e'' ∈ End(P). If the dimension of ker(e''_b) is constant in b ∈ B, the reduced Prym is X := (ker e'')°, the relative identity component, an abelian subscheme of P with the restricted polarization; its fibre at b is (ker e''_b)°.

**Construction.**

- Relative Picard scheme of a smooth proper curve with geometrically connected fibres: Pic⁰_{Z/B} is an abelian scheme with principal polarization (JacobianChallenge Layer D, AlgebraicModuli A0-extension, AbelianSchemes A2).
- Functoriality gives the G-action and e'' ∈ ℤ[G] → End(P).
- In characteristic zero with constant fibre dimension, the relative identity component of the proper group scheme ker e'' is an abelian subscheme (EGA IV 15.6.4; AbelianSchemes A1), compatible with base change; the polarization restricts.

**Declarations and API.**

- `reducedPrym` (constructor): X := (ker e'')° ⊆ Pic⁰_{Z/B} for a relative curve with Aff(q)-action and constant kernel dimension.
- `reducedPrym.isAbelianScheme` (instance): X is an abelian scheme over B.
- `reducedPrym.polarization` (data): The restriction of the principal polarization of Pic⁰.
- `reducedPrym.fibre` (compatibility): X_b = (ker e''_b)° for every point b.
- `reducedPrym.baseChange` (functoriality): Formation of X commutes with base change on B.
- `reducedPrym.dim` (other): The relative dimension of X over a base whose complex fibres are singly ramified Aff(q)-covers of a genus-g curve is (2g − 1)(q − 1)/2.
- `reducedPrym.example` (example): q = 3, g = 2: relative dimension 3.

**Uses.** The idempotents e, e′ and e″ of ℚ[Aff(q)] (`LV.8/affine-group-idempotents`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `AlgebraicModuliForArithmeticGeometry:A0-extension` (higher-dimensional moduli prerequisites); `AbelianSchemesAndArithmeticModuli:A1` (Abelian schemes and rigidity); `AbelianSchemesAndArithmeticModuli:A2` (Duals, Picard functors, and polarizations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme — JacobianChallenge Layer D (relative Picard functor and Jacobian scheme).

**Tests.**

- If Z_b → Z_b/G has genus-0 quotient the Prym has dimension given by Riemann–Hurwitz for Z_b/H.
- For the Kodaira–Parshin family the fibre dimension is constant, equal to (2g − 1)(q − 1)/2 (reduced-Prym homology lemma).

#### The Kodaira–Parshin family (LV Definitions 7.2–7.3)

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/KodairaParshin/Family`, namespace `TauCeti.LawrenceVenkatesh.KodairaParshin`.

Let Y be a smooth projective geometrically connected curve of genus g ≥ 2 over a number field K and q ≥ 3 a prime. The Kodaira–Parshin curve family Z_q → Y'_q → Y is the Hurwitz space of LV Proposition 7.1 for G = Aff(q), and the Kodaira–Parshin family is X_q → Y'_q → Y with X_q the reduced Prym of Z_q → Y'_q. It is an abelian-by-finite family of relative dimension d_q = (g − 1/2)(q − 1), it admits a good model over 𝒪_S for some finite S (with 𝒴 proper), and for y ∈ Y(K) the fibre π⁻¹(y) is G_K-equivariantly the set of Aff(q)-conjugacy classes of surjections π₁^geom(Y_{K̄} ∖ {y}) → Aff(q) nontrivial on a loop around y (LV property (iii)).

**Construction.**

- Aff(q) has trivial centre (LV.0), so the Hurwitz space exists.
- The fibre dimension of ker e'' is constant by the homology lemma (computed at complex points, which lie over every point of Y'_q), so the reduced Prym is an abelian scheme of relative dimension d_q with polarization.
- Good model: LV.2 (existence after enlarging S), with 𝒴 proper because Y is.
- Property (iii) is Proposition 7.1 (i); Aff(q)-conjugacy and Sym(𝔽_q)-conjugacy classes agree (LV.0).

**Declarations and API.**

- `kodairaParshinCurves` (constructor): Z_q → Y'_q → Y.
- `kodairaParshin` (constructor): X_q → Y'_q → Y as an abelian-by-finite family.
- `kodairaParshin.relDim` (simp): d_q = (g − 1/2)(q − 1), i.e. 2d_q = (2g − 1)(q − 1).
- `kodairaParshin.exists_goodModel` (other): A good model over some 𝒪_S with 𝒴 proper.
- `kodairaParshin.fibreEquiv` (equivalence): π⁻¹(y)(K̄) ≃ conjugacy classes of surjections π₁^geom(Y ∖ y) → Aff(q) nontrivial at y, G_K-equivariantly for y ∈ Y(K).
- `kodairaParshin.fibreHomology` (compatibility): H₁(X_{q,y'}(ℂ), ℚ) ≅ H₁^Pr(Z_{q,y'} ×^{Aff(q)} 𝔽_q, Y(ℂ); ℚ).
- `kodairaParshin.example` (example): q = 3, g = 2: d = 3, fibre of size 135.

**Uses.** Hurwitz spaces of G-covers branched at one point (LV Proposition 7.1) (`LV.8/hurwitz-space`); The reduced relative Prym of a family of Aff(q)-covers (`LV.8/reduced-prym`); Homology of the reduced Prym is the primitive homology of the degree-q cover (`LV.8/reduced-prym-homology`); Aff(q) is centre-free, has trivial centralizer and is self-normalizing in Sym(𝔽_q) (`LV.0/affine-group-centralizer`); Abelian-by-finite families (LV Definition 5.1) (`LV.2/abelian-by-finite-family`); Existence of good models after enlarging S (`LV.2/good-model-exists`).

**Tests.**

- q = 3, g = 2: d_3 = 3 and #π⁻¹(y) = 135.
- q = 107, g = 2: d_q = 159.

### LV.8.B Theorems

#### The complex points of a curve form a closed surface of the same genus

*Lemma* `TauCeti.LawrenceVenkatesh.curve_topological_genus` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Hurwitz/CurveTopology`.

Let Y be a smooth projective geometrically connected curve of genus g over a subfield K ⊆ ℂ. Then Y(ℂ) is a connected closed orientable surface of genus g; for y ∈ Y(ℂ), π₁(Y(ℂ) ∖ {y}) is free of rank 2g with the peripheral class as in LV.5, and H₁(Y(ℂ); ℤ) ≅ ℤ^{2g}.

**Proof.**

- Y(ℂ) is a compact Riemann surface, hence a closed orientable surface, and it is connected (ComplexComparisonPartII C4).
- By the algebraic de Rham–Betti comparison, dim_ℂ H¹(Y(ℂ), ℂ) = dim H¹_dR(Y/K) = dim H⁰(Y, Ω¹) + dim H¹(Y, 𝒪) = 2g (Hodge exact sequence, Serre duality and the definition of the genus).
- The classification of surfaces gives the topological type; the statements on π₁ are those of the configuration-fibration node of LV.5.

**Uses.** Classification of compact surfaces (`LV.5/surface-classification`); The configuration fibration of a surface and its fundamental groups (`LV.5/fadell-neuwirth-sequence`); `ComplexComparisonPartII:C4` (Chow algebraization and morphism comparison); `ComplexComparisonPartII:C5` (Algebraic de Rham–Betti comparison); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `SchemeAndStackFoundations:SF.3` (Curves, divisors and Picard objects).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/AlgebraicCurves#layer-3-divisors-ld-riemanns-theorem-and-the-genus — AlgebraicCurves Layer 3 (divisors and the genus).

**Tests.**

- An elliptic curve: Y(ℂ) is a torus.
- A smooth plane quartic: a closed surface of genus 3.

#### Unique extension of the action to an overgroup

*Lemma* `TauCeti.LawrenceVenkatesh.surjection_action_extension` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Hurwitz/Surjections`.

In the setting of the node on singly ramified surjections, let Γ̃ ⊇ Γ̄ be a group containing a normal subgroup Γ̄ through which the Γ-action on S = S(Γ, c, G) factors (via a surjection Γ → Γ̄ with image c̄ of c), and suppose conjugation by Γ̃ preserves c̄. Then every φ ∈ S factors through Γ̄, and γ̃·φ := φ ∘ Ad(γ̃)⁻¹|_{Γ̄} defines an action of Γ̃ on S commuting with G and extending the Γ̄-action. It is the only such action: any action of Γ̃ on S commuting with G and extending the Γ̄-action is given by this formula.

**Proof.**

- If n ∈ ker(Γ → Γ̄), then n acts trivially: Ad(φ(n))⁻¹ ∘ φ = φ, so φ(n) is central, hence trivial; so φ factors through Γ̄.
- The formula is an action commuting with G, and it preserves surjectivity and nontriviality on c̄ because Ad(γ̃) preserves Γ̄ and c̄.
- Uniqueness: for an action ⋆ commuting with G and extending the Γ̄-action, the stabilizer of γ̃ ⋆ φ in Γ̄ × G^op is the conjugate by γ̃ of the stabilizer of φ (since Γ̄ is normal and the actions commute); a surjection is determined by its stabilizer, and φ ∘ Ad(γ̃)⁻¹ has that stabilizer.

**Uses.** Surjections nontrivial on a peripheral class and their symmetries (LV Lemma 7.4, group part) (`LV.8/singly-ramified-surjections`).

**Tests.**

- Γ̃ = Γ̄ ⋊ ℤ with ℤ acting by an automorphism preserving c̄: the extended action is precomposition with the inverse automorphism.
- Profinite version: for Γ̄ the geometric and Γ̃ the arithmetic étale fundamental group of a punctured curve over K, with c̄ the inertia generators at the puncture (a set stable under the cyclotomic twist σ(ι) = ι^{χ(σ)}).

#### Descent of the Hurwitz covering to K (LV Lemma 7.4)

*Lemma* `TauCeti.LawrenceVenkatesh.hurwitz_descent` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Hurwitz/Descent`.

Y is a smooth projective geometrically connected curve of genus g ≥ 2 over a number field K ⊂ ℂ, and G is a finite group with trivial centre. Let Z° → (Y² ∖ Δ)_ℂ be the G-covering of the complex Hurwitz-space node. (1) It extends uniquely, with its G-action, to a finite étale G-covering Z°_K → (Y² ∖ Δ)_K. (2) For y₀ ∈ Y(K), the set S(y₀), defined with the geometric étale fundamental group of Y_{K̄} ∖ {y₀} and its G_K-action through the outer action, is G_K-equivariantly identified with the fibre over y₀ of the covering Y'_K of (3). (3) Z°_K/G extends uniquely to a finite étale covering of Y_K × Y_K of the form Y'_K × Y_K → Y_K × Y_K, for a finite étale covering Y'_K → Y_K with (Y'_K)_ℂ = Y'.

**Proof.**

- Étale fundamental groups: Γ̄ := image of π₁^et(Y_{K̄} ∖ {y₀}, y₁) in Γ̃^geom := π₁^et((Y² ∖ Δ)_{K̄}, (y₁, y₀)), which is the kernel of Γ̃^geom → π₁^et(Y_{K̄}, y₀): the étale sequence is the profinite completion of the topological one (Riemann existence and invariance of π₁ under K̄ ⊆ ℂ) and profinite completion is right exact. Only this middle exactness is used; injectivity on the left is not needed.
- The Γ̃^geom-action on the fibre S of Z° (a finite continuous set) restricts on Γ̄ to the conjugation action, so by the extension lemma every φ factors through Γ̄ and the Γ̃^geom-action is given by the conjugation formula.
- Γ̄ is normal in the arithmetic group Γ̃ := π₁^et((Y² ∖ Δ)_K, (y₁, y₀)) (it is the intersection of Γ̃^geom with the kernel to π₁^et(Y_K)), and conjugation by Γ̃ preserves the set of inertia generators at y₀ up to the cyclotomic character, hence preserves 'nontrivial on c'. The conjugation formula extends the action to Γ̃ × G, uniquely; by the Galois-category description of finite étale coverings (InverseGalois IG.0/IG.1) this is (1).
- (3): Γ acts trivially on S/G, so the Γ̃-action on S/G factors through π₁^et(Y_K, y₀), which gives Y'_K; uniqueness holds because finite étale coverings are determined by their Γ̃-sets.
- (2): restrict Z°_K/G to the K-subvariety (Y ∖ {y₀}) × {y₀}; it is the constant covering with fibre Y'_{K,y₀}, on which π₁^et((Y ∖ {y₀})_K) acts through G_K. The same restriction of Z°_K has fibre S with the conjugation action (extension lemma), whose quotient by G is S(y₀) with the outer G_K-action. No K-rational point y₁ is needed.

**Uses.** Unique extension of the action to an overgroup (`LV.8/surjection-action-extension`); The complex Hurwitz space of G-covers branched at one point (LV §7.3) (`LV.8/hurwitz-cover-complex`); The configuration fibration of a surface and its fundamental groups (`LV.5/fadell-neuwirth-sequence`); `InverseGaloisAndArithmeticFundamentalGroups:IG.0` (Galois categories and fibre functors); `InverseGaloisAndArithmeticFundamentalGroups:IG.1` (Arithmetic exact sequences and specialization); `InverseGaloisAndArithmeticFundamentalGroups:IG.3` (Branch cycles, rigidity and descent); `mathlib:CategoryTheory.PreGaloisCategory.IsFundamentalGroup`; `tauceti:TauCeti.FiniteCoveringSpace.instProfiniteCompletionIsFundamentalGroup`.

**Tests.**

- If Y(K) = {y₀}, (2) still holds: the G_K-action on S(y₀) is defined through the outer action.
- For G = Aff(q) and y₀ ∈ Y(K), the fibre map (5.5) of this layer is a G_K-equivariant map from S(y₀) to H¹(Y_{K̄}, ℤ/(q − 1)).

#### Hurwitz spaces of G-covers branched at one point (LV Proposition 7.1)

*Theorem* `TauCeti.LawrenceVenkatesh.Hurwitz.hurwitz_space` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Hurwitz/Space`.

Y is a smooth projective geometrically connected curve of genus g ≥ 2 over a number field K ⊂ ℂ, and G is a finite group with trivial centre. There are a finite étale morphism π : Y' → Y of K-curves and a smooth proper relative curve Z → Y' with a morphism Z → Y' × Y of relative curves over Y' and a G-action on Z over Y' × Y such that: (i) for y ∈ Y(K̄) there is a bijection between π⁻¹(y) and the set of G-conjugacy classes of surjections π₁^geom(Y ∖ {y}) → G nontrivial on a loop around y, G_K-equivariant when y ∈ Y(K); (ii) Z → Y' × Y is a G-torsor away from the graph of π, and for y' ∈ Y'(K̄) the fibre Z_{y'} → Y is the connected G-covering classified by y', ramified exactly at π(y').

**Proof.**

- Take Y' := Y'_K from the descent lemma and Z := the normalization of Y' × Y in Z°_K.
- Normalization commutes with the base change K → ℂ in characteristic zero (normality is preserved by separable field extensions), so Z_ℂ is the complex Z of the analytic construction; smoothness and properness of Z → Y' and the fibre description descend from ℂ.
- (i) is the descent lemma (2) together with the analytic identification of fibres; (ii) holds over ℂ and hence over K.

**Uses.** Descent of the Hurwitz covering to K (LV Lemma 7.4) (`LV.8/hurwitz-descent`); The complex Hurwitz space of G-covers branched at one point (LV §7.3) (`LV.8/hurwitz-cover-complex`); `SchemeAndStackFoundations:SF.0` (Schemes and morphisms); `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`.

**Tests.**

- G = Aff(3), g = 2: π has degree 135.
- The fibres of Z → Y' have genus 1 + |G|(g − 1) + (|G| − |G|/n)/2 by Riemann–Hurwitz, n the order of the monodromy at the branch point.

#### The idempotents e, e′ and e″ of ℚ[Aff(q)]

*Lemma* `TauCeti.LawrenceVenkatesh.KodairaParshin.affine_group_idempotents` — module `TauCeti/NumberTheory/LawrenceVenkatesh/KodairaParshin/Idempotents`.

For a prime q ≥ 3, G = Aff(q) and H = H_q the stabilizer of 0, let e_H := (1/#H) Σ_{h∈H} h and e_G := (1/#G) Σ_{g∈G} g in ℚ[G], e := e_H − e_G, e' := 1 − e and e'' := #G·e' ∈ ℤ[G]. Then e_H, e_G, e, e' are idempotents, e_G e_H = e_H e_G = e_G, and all four are fixed by the anti-involution g ↦ g⁻¹. For every ℚ[G]-module M: e·M = M^H ∩ ker(e_G), which is a complement of M^G in M^H, and ker(e'' : M → M) = e·M.

**Proof.**

- e_H and e_G are the averaging idempotents of the subgroups H and G, and e_G e_H = e_H e_G = e_G because G ⊇ H.
- (e_H − e_G)² = e_H − 2e_G + e_G = e_H − e_G; e' is the complementary idempotent.
- e'' = #G − (#G/#H)Σ_{h∈H} h + Σ_{g∈G} g has integer coefficients.
- e·M ⊆ M^H ∩ ker e_G, and conversely x in the intersection satisfies e·x = x; ker e'' = ker e' = e·M.

**Uses.** The affine group Aff(q) of a prime field (`LV.0/affine-group`).

**Tests.**

- q = 3: G = S₃, H = ⟨(1 2)⟩; on the permutation module ℚ³, e projects onto the 1-dimensional complement of the constants in (ℚ³)^H.
- On the regular representation, dim e·ℚ[G] = #(G/H) − 1 = q − 1.

#### Homology of the reduced Prym is the primitive homology of the degree-q cover

*Lemma* `TauCeti.LawrenceVenkatesh.reduced_prym_homology` — module `TauCeti/NumberTheory/LawrenceVenkatesh/KodairaParshin/Prym`.

Let Z → Y be a connected Aff(q)-Galois covering of compact Riemann surfaces branched over exactly one point y with inertia generated by a q-cycle (a nontrivial translation), g(Y) = g, C' := Z/H_q and π' : C' → Y the associated degree-q covering. Then H₁((ker e'')°(ℂ), ℚ) = e·H₁(Z, ℚ) inside H₁(Pic⁰(Z)(ℂ), ℚ) = H₁(Z, ℚ), and the pushforward along p : Z → C' restricts to an isomorphism e·H₁(Z, ℚ) ≅ H₁^Pr(C', Y; ℚ) := ker(π'_* : H₁(C', ℚ) → H₁(Y, ℚ)) that multiplies intersection forms by q − 1; the Riemann form of the restricted polarization is the restriction of the intersection form up to sign. In particular dim_ℚ H₁^Pr(C', Y) = (2g − 1)(q − 1) and dim (ker e'')° = (g − 1/2)(q − 1). These identifications are natural for homeomorphisms of Z commuting with G and covering a homeomorphism of Y.

**Proof.**

- Complex uniformization: H₁(Pic⁰(Z)(ℂ), ℤ) = H₁(Z, ℤ) with the intersection form as Riemann form (AbelianSchemes A5, JacobianChallenge), and for an endomorphism ε of a complex abelian variety, H₁((ker ε)°, ℚ) = ker(ε on H₁(·, ℚ)); ker e'' = e·H₁ by the idempotent lemma.
- p : Z → C' is an unramified H_q-Galois covering: the ramification index q of Z → Y at points over y equals that of C' → Y, whose unique point over y has index q. Transfer (AlgebraicTopology Stage 5) gives p_* : H₁(Z, ℚ)^{H} ≅ H₁(C', ℚ) with p^*p_* = Σ_{h∈H} h, and ⟨p_*x, p_*x'⟩ = (q − 1)⟨x, x'⟩ for H-invariant x, x'.
- For the G-covering Z → Y (unramified off y, and H₁(Y ∖ {y}) = H₁(Y)), Σ_{g∈G} g = π^*π_* on H₁(Z, ℚ), so ker e_G = ker π_*; under p_* this becomes ker π'_*, since π_* = π'_* p_*.
- Riemann–Hurwitz: 2g(C') − 2 = q(2g − 2) + (q − 1), so 2g(C') − 2g = (2g − 1)(q − 1).
- Naturality: all maps are induced by the coverings and commute with lifted homeomorphisms.

**Uses.** The reduced relative Prym of a family of Aff(q)-covers (`LV.8/reduced-prym`); The idempotents e, e′ and e″ of ℚ[Aff(q)] (`LV.8/affine-group-idempotents`); The complex points of a curve form a closed surface of the same genus (`LV.8/curve-topological-genus`); `AbelianSchemesAndArithmeticModuli:A5` (Complex uniformization with polarization and level); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent — AlgebraicTopology Stage 5 (covers, transfer, fibrations); tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality — AlgebraicTopology Stage 6 (cohomology, products, Poincaré duality, intersection pairing); tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme — JacobianChallenge Layer D (relative Picard functor and Jacobian scheme).

**Tests.**

- q = 3, g = 2: C' has genus 5 and dim H₁^Pr(C', Y) = 6 = 2·3.
- H₁^Pr is the orthogonal complement of π'^*H₁(Y) in H₁(C') (LV.9).

#### The map from Kodaira–Parshin fibres to H¹(Y, ℤ/(q − 1)) (LV (5.5))

*Lemma* `TauCeti.LawrenceVenkatesh.KodairaParshin.kodaira_parshin_fibre_map` — module `TauCeti/NumberTheory/LawrenceVenkatesh/KodairaParshin/FibreMap`.

Let y ∈ Y(K), N = q − 1, and fix a generator of 𝔽_q^× to identify λ : Aff(q) → 𝔽_q^× with a surjection onto ℤ/N. Composition with λ defines a G_K-equivariant map ψ : π⁻¹(y)(K̄) → M := H¹_et(Y_{K̄}, ℤ/N) = Hom(π₁^geom(Y_{K̄}), ℤ/N). In coordinates given by a standard generating system of the free group π₁(Y(ℂ) ∖ {y}) (M ≅ (ℤ/N)^{2g}), the image Υ of ψ is the set of 2g-tuples whose entries generate ℤ/N, and every fibre of ψ over Υ has q^{2g−2} elements. In particular #π⁻¹(y) = q^{2g−2}·J_{2g}(N).

**Proof.**

- For a surjection φ nontrivial at y, φ(c) lies in [Aff(q), Aff(q)] = 𝔽_q^+ because the peripheral class is a product of commutators; so λ ∘ φ kills the peripheral class and factors through π₁^geom(Y_{K̄}) (the kernel of π₁(Y ∖ y) → π₁(Y) is normally generated by c, also after profinite completion). λ ∘ φ depends only on the conjugacy class of φ since ℤ/N is abelian.
- Equivariance: G_K acts on both sides through its outer action on the geometric fundamental groups, and trivially on ℤ/N.
- Homomorphisms to finite groups from the profinite completion of a free group are homomorphisms from the free group; in the standard generators, surjections nontrivial at y are the generating tuples g ∈ Aff(q)^{2g} with ∏[g_i, g_i'] ≠ 0, and LV Lemma 2.11 (LV.0) shows that the image of Λ is the set of generating tuples of 𝔽_q^× and each fibre has q^{2g−1}(q − 1) tuples.
- Aff(q) acts freely by conjugation (trivial centre) and preserves the fibres of Λ, so each fibre of ψ has q^{2g−1}(q − 1)/(q(q − 1)) = q^{2g−2} elements.

**Uses.** The Kodaira–Parshin family (LV Definitions 7.2–7.3) (`LV.8/kodaira-parshin-family`); The complex points of a curve form a closed surface of the same genus (`LV.8/curve-topological-genus`); The commutator-product map on Aff(q)^{2s} (LV Lemma 2.11) (`LV.0/commutator-product-map`); Counting generating tuples of ℤ/N (`LV.0/generating-tuples-card`); Aff(q) is centre-free, has trivial centralizer and is self-normalizing in Sym(𝔽_q) (`LV.0/affine-group-centralizer`); `InverseGaloisAndArithmeticFundamentalGroups:IG.1` (Arithmetic exact sequences and specialization); `InverseGaloisAndArithmeticFundamentalGroups:IG.3` (Branch cycles, rigidity and descent); `EtaleDualityAndPerverseSheaves:EDC.2` (Smooth trace, relative purity and Poincaré duality).

**Tests.**

- q = 3, g = 2: M = (ℤ/2)⁴, Υ has 15 elements, the fibres have 9, and #π⁻¹(y) = 135.
- The count J_{2g}(N) ≥ N^{2g}/2 is LV.0's generating-tuple count.

### LV.8.C Dependencies

Within this roadmap: `MordellLawrenceVenkatesh:LV.0`, `MordellLawrenceVenkatesh:LV.2`, `MordellLawrenceVenkatesh:LV.5`.

Other roadmaps:

- `ComplexComparisonPartII:C4` (Chow algebraization and morphism comparison). Needed: For a smooth geometrically connected curve Y over a subfield of ℂ, projective or the complement of finitely many points in a projective one, Y(ℂ) with the analytic topology is connected.
- `ComplexComparisonPartII:C5` (Algebraic de Rham–Betti comparison). Needed: For a smooth proper morphism of complex algebraic varieties, the analytic Gauss–Manin connection on the relative algebraic de Rham cohomology has the Betti local system R^q f_*ℂ as sheaf of horizontal sections (relative Gauss–Manin compatibility of the algebraic de Rham–Betti comparison). For a smooth projective curve over ℂ, H¹(Y(ℂ), ℂ) ≅ H¹_dR(Y/ℂ) has dimension 2g.
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-3-divisors-ld-riemanns-theorem-and-the-genus` (Layer 3: divisors, L(D), Riemann's theorem, and the genus). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For a smooth projective geometrically connected curve Y of genus g over a field: dim H⁰(Y, Ω¹) = dim H¹(Y, 𝒪_Y) = g (Serre duality and Riemann–Roch).
- `SchemeAndStackFoundations:SF.3` (Curves, divisors and Picard objects). Needed: The algebraic de Rham cohomology of a smooth projective curve and its Hodge exact sequence 0 → H⁰(Ω¹) → H¹_dR → H¹(𝒪) → 0; the relative version for smooth proper curves over a base, with base change.
- `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence` (Stage 2: lifting criterion and Galois correspondence). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: Classification of (possibly disconnected) covering spaces of a connected, locally path-connected, semilocally simply connected space by π₁-sets, with the fibre monodromy and path/homotopy lifting; lifts of homeomorphisms of the base to a connected covering exist when the induced outer automorphism preserves the conjugacy class of the monodromy, and two lifts differ by a deck transformation.
- `ComplexComparisonPartII:C0` (Coherent analytic modules on algebraic analytifications). Needed: Analytification of the normalization of a variety in a finite étale covering of a dense open subset is the normalization of the analytification in the analytic covering, and it is smooth where the analytic space is a manifold.
- `ComplexComparisonPartII:C2` (Projective coherent GAGA). Needed: Projective GAGA for coherent sheaves and morphisms on smooth projective complex varieties (used to compare algebraic and analytic finite morphisms and their normalizations).
- `InverseGaloisAndArithmeticFundamentalGroups:IG.3` (Branch cycles, rigidity and descent). Needed: Riemann existence for finite étale coverings of complex varieties of finite type (SGA 1 XII 5.1), and invariance of the étale fundamental group of a variety over an algebraically closed field of characteristic zero under extension to a larger algebraically closed field, so that π₁^et(X_{K̄}) is the profinite completion of π₁(X(ℂ)) for K̄ ⊆ ℂ, compatibly with finite étale coverings and base points.
- `InverseGaloisAndArithmeticFundamentalGroups:IG.0` (Galois categories and fibre functors). Needed: Galois categories: finite étale coverings of a connected scheme are equivalent to finite continuous π₁^et-sets, functorially in pointed schemes; for Spec K this is the Galois correspondence.
- `InverseGaloisAndArithmeticFundamentalGroups:IG.1` (Arithmetic exact sequences and specialization). Needed: For a geometrically connected variety X over K: the exact sequence 1 → π₁^et(X_{K̄}) → π₁^et(X) → G_K → 1, the resulting outer action of G_K on π₁^et(X_{K̄}), inertia subgroups at the punctures of a punctured curve and the cyclotomic twist σ(ι) = ι^{χ(σ)} of inertia generators; H¹_et(X_{K̄}, A) = Hom(π₁^et(X_{K̄}), A) for a finite abelian group A, G_K-equivariantly.
- `SchemeAndStackFoundations:SF.0` (Schemes and morphisms). Needed: Normalization of an integral scheme of finite type over a field in a finite separable extension of its function field is finite, and its formation commutes with base change along separable field extensions (Stacks 037Z / EGA IV 6.14.2).
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme` (Layer D, the relative Picard functor and the Jacobian scheme). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For a smooth proper curve Z → B with geometrically connected fibres (B reduced of finite type over a field of characteristic zero): Pic⁰_{Z/B} is an abelian scheme with its canonical principal polarization, functorial for automorphisms of Z over B, compatible with base change; over ℂ, H₁(Pic⁰(Z_b)(ℂ), ℤ) = H₁(Z_b(ℂ), ℤ) with the intersection form as Riemann form.
- `AlgebraicModuliForArithmeticGeometry:A0-extension` (higher-dimensional moduli prerequisites). Needed: Representability of the relative degree-zero Picard functor of a smooth proper curve with geometrically connected fibres by a smooth proper group scheme (the input identified with the dual abelian scheme in A2).
- `AbelianSchemesAndArithmeticModuli:A1` (Abelian schemes and rigidity). Needed: For an abelian scheme P over a reduced base of finite type over a field of characteristic zero and an endomorphism ε with fibre dimension of ker ε constant, the relative identity component (ker ε)° (EGA IV 15.6.4) is an abelian subscheme compatible with base change, with fibres (ker ε_b)°.
- `AbelianSchemesAndArithmeticModuli:A2` (Duals, Picard functors, and polarizations). Needed: Polarizations of abelian schemes (λ : A → A^∨ with the positivity condition), stable under base change; the polarization of a relative Jacobian.
- `AbelianSchemesAndArithmeticModuli:A5` (Complex uniformization with polarization and level). Needed: For a complex abelian variety A = V/Λ and an endomorphism ε: H₁((ker ε)°, ℚ) = ker(ε on Λ ⊗ ℚ); polarizations correspond to Riemann forms on H₁, and restriction of a polarization to an abelian subvariety corresponds to restriction of the Riemann form.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent` (Stage 5: bundles, covers, products, and finite-cover descent). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For a finite regular covering p : Z → C with deck group H: transfer p^* with p_*p^* = #H and p^*p_* = Σ_{h∈H} h_* on rational homology, so p_* : H₁(Z, ℚ)^H ≅ H₁(C, ℚ); compatibility with maps of coverings.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality` (Stage 6: cohomology, products, and manifold duality). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: Poincaré–Lefschetz duality for compact oriented surfaces with boundary, the resulting intersection pairing on H₁ (perfect for closed surfaces), and its compatibility with orientation-preserving homeomorphisms.
- `EtaleDualityAndPerverseSheaves:EDC.2` (Smooth trace, relative purity and Poincaré duality). Needed: For a smooth projective geometrically connected curve Y over K and N invertible on K: H¹_et(Y_{K̄}, ℤ/N) is free of rank 2g over ℤ/N, and cup product with the trace H²_et(Y_{K̄}, μ_N) ≅ ℤ/N gives a perfect alternating G_K-equivariant pairing H¹(ℤ/N) × H¹(ℤ/N) → μ_N^∨ := Hom(μ_N, ℤ/N); if Y has good reduction at a place v ∤ N, H¹_et(Y_{K̄}, ℤ/N) is unramified at v.

## Layer LV.9: Aff(q)-covers of surfaces: primitive homology, lifted monodromy and normal form

This layer contains the topology of $\mathrm{Aff}(q)$-covers: primitive homology, the lifted monodromy maps, the behaviour of Dehn twists on covers, the surjectivity lemma for surfaces with two boundary circles and the normal form. LV Lemmas 8.2 and 8.3 are stated for nonseparating curves, which is what their proof uses and what their applications need. The curves $\gamma_j$ of LV Lemma 8.11 are constructed as Dehn twists of one curve.

### LV.9.A Objects

#### Aff(q)-covers and singly ramified Aff(q)-covers (LV §8.2)

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/AffineCovers/Basic`, namespace `TauCeti.LawrenceVenkatesh.AffineCover`.

For a surface Y (with boundary or punctures allowed), an Aff(q)-cover is a connected surface Z with a degree-q covering map π : Z → Y whose monodromy on a fibre, for some labelling of the fibre by 𝔽_q, has image Aff(q). After a choice of base point it determines a homomorphism Cov : π₁(Y, y₀) → Aff(q), well defined up to Aff(q)-conjugation (the normalizer of Aff(q) in Sym(𝔽_q) is Aff(q)); two Aff(q)-covers are isomorphic (homeomorphic over Y) if and only if their classes Cov agree. The cycle type of Cov(η) is well defined for η ∈ π₁(Y, y₀) and for free loops. For a closed Y of genus g and y ∈ Y, a singly ramified Aff(q)-cover is an Aff(q)-cover of Y ∖ {y} with nontrivial monodromy around y (a q-cycle); its compactification Z has genus gq − (q − 1)/2 and a single point over y. Up to isomorphism there are finitely many, Z_1, …, Z_N, and Mod(Y ∖ {y}) acts on this finite set.

**Construction.**

- Covering-space classification (LV.5): isomorphism classes of connected degree-q coverings correspond to conjugacy classes of transitive actions π₁ → Sym(𝔽_q); if the image is Aff(q), conjugacy under Sym(𝔽_q) is conjugacy under the normalizer Aff(q) (LV.0).
- The monodromy around y lies in [Aff(q), Aff(q)] = 𝔽_q^+ (the peripheral class is a product of commutators), so if nontrivial it is a q-cycle; the compactification has one point over y with ramification index q, and Riemann–Hurwitz gives 2g(Z) − 2 = q(2g − 2) + (q − 1).
- π₁(Y ∖ {y}) is finitely generated, so there are finitely many homomorphisms to Aff(q); mapping classes act through Out(π₁(Y ∖ {y})).

**Declarations and API.**

- `AffineCover` (constructor): An Aff(q)-cover of a surface with its monodromy class Cov.
- `AffineCover.cov` (data): Cov : π₁(Y, y₀) → Aff(q) up to conjugacy.
- `AffineCover.iso_iff` (characterisation): Z₁ ≅ Z₂ over Y ↔ Cov₁ and Cov₂ are Aff(q)-conjugate.
- `AffineCover.cycleType` (data): The cycle type of Cov(η), a partition of q, for loops η.
- `SinglyRamified` (constructor): Singly ramified Aff(q)-covers of (Y, y) and their compactifications.
- `SinglyRamified.genus` (simp): g(Z) = gq − (q − 1)/2.
- `SinglyRamified.finite` (instance): Finitely many isomorphism classes Z_1, …, Z_N.
- `SinglyRamified.modAction` (data): The action of Mod(Y ∖ {y}) on {Z_1, …, Z_N}.
- `SinglyRamified.example` (example): q = 3, g = 2: N = 135, genus 5.

**Uses.** The mapping class group (`LV.5/mapping-class-group`); The configuration fibration of a surface and its fundamental groups (`LV.5/fadell-neuwirth-sequence`); Aff(q) is centre-free, has trivial centralizer and is self-normalizing in Sym(𝔽_q) (`LV.0/affine-group-centralizer`); Cycle types of elements of Aff(q) (`LV.0/affine-group-cycle-type`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence — UniversalCovers Stage 2 (lifting criterion and Galois correspondence of covers).

**Tests.**

- q = 3, g = 2: N = 135 and each Z_i has genus 5.
- The trivial cover (q disjoint copies) is not an Aff(q)-cover.

#### Primitive homology of a covering

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/AffineCovers/PrimitiveHomology`, namespace `TauCeti.LawrenceVenkatesh.AffineCover`.

Let π : Z → Y be a finite covering of degree q between closed oriented surfaces, possibly branched over finitely many points. With rational coefficients, π_* : H₁(Z) → H₁(Y) and the transfer π^* : H₁(Y) → H₁(Z) satisfy π_*π^* = q, ⟨π^*a, π^*b⟩ = q⟨a, b⟩ and ⟨π^*a, x⟩ = ⟨a, π_*x⟩ for the intersection forms. Hence H₁(Z) = π^*H₁(Y) ⊕ H₁^Pr(Z, Y) with H₁^Pr(Z, Y) := ker π_* = (π^*H₁(Y))^⊥, the projection onto H₁^Pr is x ↦ x − q⁻¹π^*π_*x, and the intersection form restricts to a symplectic form on H₁^Pr(Z, Y). Homeomorphisms of Z covering homeomorphisms of Y preserve the decomposition.

**Construction.**

- Define π^* on the unbranched part (AlgebraicTopology Stage 5 transfer) and use that removing finitely many points from a closed surface, or their preimages, does not change H₁ modulo the classes of small loops, which are zero in the closed surface.
- π_*π^* = q is the degree; the projection formula ⟨π^*a, x⟩ = ⟨a, π_*x⟩ holds for transverse cycles by counting preimages of intersection points; ⟨π^*a, π^*b⟩ = q⟨a, b⟩ follows.
- Hence π^* is injective, π^*H₁(Y) ∩ ker π_* = 0, and the decomposition and orthogonality follow by dimension count; nondegeneracy on ker π_* follows from nondegeneracy on H₁(Z) and on π^*H₁(Y).

**Declarations and API.**

- `primitiveHomology` (constructor): H₁^Pr(Z, Y) = ker(π_* : H₁(Z; ℚ) → H₁(Y; ℚ)).
- `transfer` (data): π^* : H₁(Y; ℚ) → H₁(Z; ℚ) with π_*π^* = q.
- `isCompl_primitiveHomology` (other): H₁(Z) = π^*H₁(Y) ⊕ H₁^Pr(Z, Y), with projection x ↦ x − q⁻¹π^*π_*x.
- `primitiveHomology_eq_orthogonal` (characterisation): H₁^Pr(Z, Y) = (π^*H₁(Y))^⊥.
- `primitiveHomology.symplectic` (data): The restricted intersection form is nondegenerate and alternating.
- `primitiveHomology.equivariant` (functoriality): A lift of a homeomorphism of Y preserves π^*H₁(Y) and H₁^Pr.
- `primitiveHomology.finrank` (simp): dim H₁^Pr = 2g(Z) − 2g(Y).
- `primitiveHomology.trivialCover` (example): The sum-zero subspace for a trivial cover.

**Uses.** Aff(q)-covers and singly ramified Aff(q)-covers (LV §8.2) (`LV.9/affine-cover`); Surfaces with boundary and punctures (`LV.5/surface`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent — AlgebraicTopology Stage 5 (covers, transfer, fibrations); tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality — AlgebraicTopology Stage 6 (cohomology, products, Poincaré duality, intersection pairing).

**Tests.**

- A trivial (disconnected) cover of degree q: H₁^Pr = {(x_i) : Σ x_i = 0}.
- For a singly ramified Aff(q)-cover of a genus-g surface, dim H₁^Pr = 2g(Z) − 2g = (2g − 1)(q − 1).

#### Lifted mapping classes and the monodromy maps Mon (LV (8.2)–(8.5))

*Construction* — module `TauCeti/NumberTheory/LawrenceVenkatesh/AffineCovers/Monodromy`, namespace `TauCeti.LawrenceVenkatesh.AffineCover`.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, and a singly ramified Aff(q)-cover of (Y, y) is a connected degree-q covering Z° → Y ∖ {y} with monodromy group Aff(q) acting on the fibre as on 𝔽_q and nontrivial monodromy around y, together with its compactification π : Z → Y. For a singly ramified Aff(q)-cover Z, let Mod(Y ∖ {y})_Z be the stabilizer of its isomorphism class. Each f ∈ Mod(Y ∖ {y})_Z has a unique lift f̃ ∈ Mod(Z) (the centralizer of Aff(q) in Sym(𝔽_q) is trivial), giving a homomorphism Mod(Y ∖ {y})_Z → Mod(Z) and Mon_Z : Mod(Y ∖ {y})_Z → Sp(H₁^Pr(Z, Y)). Let Mod(Y ∖ {y})' := ⋂_i Mod(Y ∖ {y})_{Z_i}, a normal subgroup of finite index (the kernel of the action on {Z_1, …, Z_N}); Mon := (Mon_{Z_i})_i : Mod(Y ∖ {y})' → ∏_i Sp(H₁^Pr(Z_i, Y)) (LV (8.3)); π₁(Y, y)' := Push⁻¹(Mod(Y ∖ {y})'), a normal subgroup of finite index in π₁(Y, y), and Mon ∘ Push on it (LV (8.5)). For f ∈ Push(π₁(Y, y)) ∩ Mod(Y ∖ {y})_Z, the lift acts trivially on π^*H₁(Y).

**Construction.**

- Existence of a lift: f preserves the class of Cov, so the pullback covering is isomorphic to Z; composing gives a homeomorphism of Z° covering f, which extends over the point above y (LV.5).
- Uniqueness: two lifts differ by a deck transformation, i.e. by an element of the centralizer of the monodromy group Aff(q) in Sym(𝔽_q), which is trivial (LV.0); the same argument applies to isotopies, so lifting is well defined on mapping classes and multiplicative.
- Mon_Z preserves the intersection form and the decomposition of the primitive-homology node, so it lands in Sp(H₁^Pr).
- The action of Mod(Y ∖ {y}) on the finite set {Z_i} has a normal kernel of finite index; its preimage under the homomorphism Push is normal of finite index.
- A point-push is isotopic to the identity on Y, so it acts trivially on H₁(Y ∖ {y}) = H₁(Y); by equivariance of the transfer its lift acts trivially on π^*H₁(Y).

**Declarations and API.**

- `liftMappingClass` (constructor): Mod(Y ∖ {y})_Z →* Mod(Z), f ↦ f̃.
- `liftMappingClass_unique` (extensionality): f̃ is the only mapping class of Z covering f.
- `monodromyMap` (constructor): Mon_Z : Mod(Y ∖ {y})_Z →* Sp(H₁^Pr(Z, Y)).
- `stabilizerAll` (data): Mod(Y ∖ {y})' = ⋂ Mod(Y ∖ {y})_{Z_i}, normal of finite index.
- `pushSubgroup` (data): π₁(Y, y)' = Push⁻¹(Mod(Y ∖ {y})'), normal of finite index.
- `monodromyMap.prod` (data): Mon : Mod(Y ∖ {y})' → ∏_i Sp(H₁^Pr(Z_i, Y)).
- `monodromyMap_push_transfer` (other): Lifts of point-pushes act trivially on π^*H₁(Y).
- `monodromyMap_twist` (compatibility): Mon_Z(T_e^{n_e}) is the multitwist ∏ T_{e_i}^{n_e/d_i} on homology.
- `monodromyMap.example` (example): q = 3, g = 2: 135 factors.

**Uses.** Aff(q)-covers and singly ramified Aff(q)-covers (LV §8.2) (`LV.9/affine-cover`); Primitive homology of a covering (`LV.9/primitive-homology`); The Birman exact sequence and pushes of simple loops (`LV.5/birman-exact-sequence`); Lifting powers of Dehn twists to finite coverings (`LV.5/covering-dehn-twist-lift`); Monodromy of families of branched covers over configuration spaces (`LV.5/configuration-family-monodromy`); Aff(q) is centre-free, has trivial centralizer and is self-normalizing in Sym(𝔽_q) (`LV.0/affine-group-centralizer`); `tauceti:TauCeti.BilinForm.isometryGroup`.

**Tests.**

- q = 3, g = 2: Mon has 135 factors, each Sp of a 6-dimensional space.
- For f = T_e^M with M a multiple of n_e (LV.5 lifting), Mon_Z(f) is the multitwist action on H₁^Pr.

#### Liftable curves and their transvections

*Definition* — module `TauCeti/NumberTheory/LawrenceVenkatesh/AffineCovers/Liftable`, namespace `TauCeti.LawrenceVenkatesh.AffineCover`.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, and a singly ramified Aff(q)-cover of (Y, y) is a connected degree-q covering Z° → Y ∖ {y} with monodromy group Aff(q) acting on the fibre as on 𝔽_q and nontrivial monodromy around y, together with its compactification π : Z → Y. A simple closed curve e ⊂ Y ∖ {y} is liftable for Z if λ(Cov(e)) generates 𝔽_q^×. Then e is nonseparating, Cov(e) has cycle type (1, q − 1), the preimage of e is e⁺ ⊔ e⁻ with e⁺ of degree 1 and e⁻ of degree q − 1, and ẽ := the projection of [e⁺] to H₁^Pr(Z, Y) is nonzero. Mon_Z(T_e^{q−1}) is the symplectic transvection x ↦ x + q⟨x, ẽ⟩ẽ of H₁^Pr(Z, Y), and for liftable curves A, B one has Ã·B̃ = A⁺·B⁺ − q⁻¹ A·B (LV (8.6)).

**Construction.**

- λ ∘ Cov factors through H₁(Y), so a separating curve has trivial λ-part; hence liftable curves are nonseparating.
- A generator a of 𝔽_q^× has order q − 1, so Cov(e) has cycle type (1, q − 1) and n_e = q − 1; the lift of T_e^{q−1} is T_{e⁺}^{q−1}T_{e⁻}.
- For x ∈ H₁^Pr, ⟨x, π^*[e]⟩ = ⟨π_*x, e⟩ = 0 and π^*[e] = [e⁺] + [e⁻], so the multitwist sends x to x + ⟨x, e⁺⟩((q − 1)e⁺ − e⁻) = x + ⟨x, e⁺⟩(q e⁺ − π^*[e]); since ẽ = e⁺ − q⁻¹π^*[e] and ⟨x, ẽ⟩ = ⟨x, e⁺⟩, this is x + q⟨x, ẽ⟩ẽ. ẽ ≠ 0 by LV Lemma 8.2 (k − 1 = 1).
- (8.6): qÃ = qA⁺ − π^*A, so q²(Ã·B̃) = q²(A⁺·B⁺) − 2q(A·B) + q(A·B) by the transfer identities.

**Declarations and API.**

- `IsLiftable` (constructor): λ(Cov(e)) generates 𝔽_q^×.
- `IsLiftable.nonseparating` (other): Liftable curves are nonseparating.
- `IsLiftable.liftPlus` (data): The degree-one lift e⁺.
- `IsLiftable.primitiveClass` (data): ẽ ∈ H₁^Pr(Z, Y), nonzero.
- `IsLiftable.mon_twist` (simp): Mon_Z(T_e^{q−1}) = T_{ẽ}^q.
- `IsLiftable.inner_eq` (relation): Ã·B̃ = A⁺·B⁺ − q⁻¹ A·B.
- `IsLiftable.example` (example): Aff(3) and a reflection monodromy.

**Uses.** Classes of the preimage circles (LV Lemma 8.2) (`LV.9/preimage-classes-independent`); Primitive homology of a covering (`LV.9/primitive-homology`); Lifted mapping classes and the monodromy maps Mon (LV (8.2)–(8.5)) (`LV.9/lifted-monodromy`); Symplectic transvections (`LV.0/symplectic-transvection`); Cycle types of elements of Aff(q) (`LV.0/affine-group-cycle-type`).

**Tests.**

- q = 3: a curve with Cov(e) = (x ↦ −x + b) is liftable, with e⁺ over the fixed point.
- A curve with Cov(e) a translation is not liftable.

### LV.9.B Theorems

#### Classes of the preimage circles (LV Lemma 8.2)

*Lemma* `TauCeti.LawrenceVenkatesh.preimage_classes_independent` — module `TauCeti/NumberTheory/LawrenceVenkatesh/AffineCovers/Twists`.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, and a singly ramified Aff(q)-cover of (Y, y) is a connected degree-q covering Z° → Y ∖ {y} with monodromy group Aff(q) acting on the fibre as on 𝔽_q and nontrivial monodromy around y, together with its compactification π : Z → Y. Let Z be a singly ramified Aff(q)-cover and e ⊂ Y ∖ {y} a nonseparating simple closed curve whose preimage consists of the circles e_1, …, e_k (of degrees d_i). Then [e_1], …, [e_k] are linearly independent in H₁(Z; ℚ); their span meets π^*H₁(Y) in ℚ·π^*[e] = ℚ·Σ_i[e_i], and its projection to H₁^Pr(Z, Y) has dimension k − 1. Consequently Mon_Z(T_e^{n_e}) − 1 has rank exactly k − 1 on H₁^Pr(Z, Y), and so does Mon_Z(T_e^{M}) − 1 for every positive multiple M of n_e.

**Proof.**

- By change of coordinates, Y has a CW structure with one 2-cell containing y in its interior and with e in the 1-skeleton; Y ∖ {y} deformation retracts onto the 1-skeleton (a wedge of 2g circles), and Z ∖ π⁻¹(y) onto its preimage graph. Since π⁻¹(y) is one point, H₁(Z ∖ π⁻¹(y)) = H₁(Z), so H₁(Z) is the cycle space of the preimage graph.
- The e_i are cycles with pairwise disjoint edge supports in that graph, so they are linearly independent.
- If Σ c_i[e_i] = π^*z then applying π_* gives q z = (Σ c_i d_i)[e], so the intersection with π^*H₁(Y) is ℚ·π^*[e], where π^*[e] = Σ_i[e_i] ≠ 0; the projection therefore has dimension k − 1.
- The lift of T_e^{n_e} is the multitwist ∏ T_{e_i}^{n_e/d_i}; by LV.5 it acts by x ↦ x + Σ (n_e/d_i)⟨x, e_i⟩e_i, whose image is the span of the [e_i] (the functionals ⟨·, e_i⟩ are independent). It acts on π^*H₁(Y) as T_e^{n_e}, with image ℚ·π^*[e]; so on H₁^Pr the image has dimension k − 1.
- N := Mon_Z(T_e^{n_e}) − 1 satisfies N² = 0 (the e_i are pairwise disjoint), so Mon_Z(T_e^{m n_e}) − 1 = mN has the same rank.

**Uses.** Lifted mapping classes and the monodromy maps Mon (LV (8.2)–(8.5)) (`LV.9/lifted-monodromy`); Primitive homology of a covering (`LV.9/primitive-homology`); Lifting powers of Dehn twists to finite coverings (`LV.5/covering-dehn-twist-lift`); Action of Dehn twists and multitwists on homology (`LV.5/dehn-twist-homology`); Change of coordinates for simple closed curves (`LV.5/change-of-coordinates`); The configuration fibration of a surface and its fundamental groups (`LV.5/fadell-neuwirth-sequence`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations — AlgebraicTopology Stage 4 (CW pairs and cellular homology).

**Tests.**

- Trivial monodromy along e: k = q and the rank is q − 1.
- Monodromy a q-cycle: k = 1 and T_e^q acts trivially on H₁^Pr.

#### The rank of a lifted twist detects the cycle type (LV Lemma 8.3)

*Lemma* `TauCeti.LawrenceVenkatesh.twist_rank_detects_cycle_type` — module `TauCeti/NumberTheory/LawrenceVenkatesh/AffineCovers/Twists`.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, and a singly ramified Aff(q)-cover of (Y, y) is a connected degree-q covering Z° → Y ∖ {y} with monodromy group Aff(q) acting on the fibre as on 𝔽_q and nontrivial monodromy around y, together with its compactification π : Z → Y. Let e ⊂ Y ∖ {y} be a nonseparating simple closed curve and M a positive multiple of n_e. Then the rank of Mon_Z(T_e^M) − 1 on H₁^Pr(Z, Y) equals k − 1, where k is the number of cycles of Cov(e), and k determines the cycle type of Cov(e): k = q for the identity, k = 1 for a q-cycle, and k = 1 + (q − 1)/r for an element with nontrivial linear part of order r.

**Proof.**

- The rank statement is LV Lemma 8.2 (preimage-classes-independent).
- The possible cycle types in Aff(q) are (1^q), (q) and (1, r, …, r) with r | q − 1, r > 1 (LV.0); the number of cycles k distinguishes them.

**Uses.** Classes of the preimage circles (LV Lemma 8.2) (`LV.9/preimage-classes-independent`); Cycle types of elements of Aff(q) (`LV.0/affine-group-cycle-type`).

**Tests.**

- q = 5: the identity, a 5-cycle, and elements with linear part of order 2 or 4 give k = 5, 1, 3, 2.
- Two covers with different cycle types along e give Mon(T_e^M) with fixed spaces of different codimensions.

#### Mapping classes of a surface with two boundary circles realize Sp(V, b) (LV Lemma 8.4)

*Lemma* `TauCeti.LawrenceVenkatesh.boundary_fixing_symplectic_surjective` — module `TauCeti/NumberTheory/LawrenceVenkatesh/AffineCovers/NormalForm`.

Let W be a compact surface of genus h ≥ 1 with two boundary circles, V := H₁(W; ℤ) (free of rank 2h + 1) with the degenerate alternating form induced by V → H₁(W, ∂W; ℤ) and Poincaré–Lefschetz duality; its radical V⁰ is spanned by the class b of a boundary circle. Let Sp(V, b) be the group of automorphisms of V preserving the form and fixing b. Then Mod(W) → Sp(V, b) is surjective. Consequently Mod(W) acts transitively on the set of classes ℓ ∈ H₁(W, ∂W; ℤ) ≅ Hom(V, ℤ) with ℓ(b) = 1, and every such class is represented by a simple proper arc from one boundary circle to the other; and for classes v, u ∈ V with ⟨v, u⟩ = 1 represented by simple closed curves and k ∈ ℤ, the class v + k b is represented by a simple closed curve.

**Proof.**

- 1 → Hom(V/V⁰, V⁰) → Sp(V, b) → Sp(V/V⁰) → 1 is exact, the kernel acting by f ↦ 1 + f.
- Capping both boundary circles surjects Mod(W) onto the mapping class group of the closed genus-h surface (LV.5), which surjects onto Sp(V/V⁰) (Farb–Margalit Theorem 6.4).
- For v ∉ V⁰ represented by a simple closed curve, v + b is also represented by one (band the curve with a boundary circle, replacing b by −b if necessary); T_{v+b}T_v⁻¹ acts by x ↦ x + ⟨x, v⟩b, and these elements generate Hom(V/V⁰, V⁰) because simple closed curves span V/V⁰ and the form on V/V⁰ is unimodular.
- Transitivity: the kernel acts on {ℓ : ℓ(b) = 1} by ℓ ↦ ℓ − μ for μ ∈ Hom(V/V⁰, ℤ), transitively; any simple proper arc joining the two boundary circles has a class with ℓ(b) = ±1, and mapping classes carry it to every class in the orbit.
- Applying (T_{u+b}T_u⁻¹)^k to a simple closed curve representing v gives a simple closed curve representing v + k⟨v, u⟩b = v + kb.

**Uses.** Capping boundary circles and forgetting points are surjective on mapping class groups (`LV.5/capping-surjective`); Surjectivity of the symplectic representation (`LV.5/symplectic-representation-surjective`); Action of Dehn twists and multitwists on homology (`LV.5/dehn-twist-homology`); Primitive homology classes are represented by simple closed curves (`LV.5/primitive-classes-simple`); Change of coordinates for simple closed curves (`LV.5/change-of-coordinates`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality — AlgebraicTopology Stage 6 (cohomology, products, Poincaré duality, intersection pairing).

**Tests.**

- h = 1 (a torus with two holes): V ≅ ℤ³ with radical ℤb, and Sp(V, b) ≅ SL₂(ℤ) ⋉ ℤ².
- The boundary twist T_b acts trivially on V, consistent with b spanning the radical.

#### Normal form of a singly ramified Aff(q)-cover (LV Proposition 8.5)

*Theorem* `TauCeti.LawrenceVenkatesh.AffineCover.affine_cover_normal_form` — module `TauCeti/NumberTheory/LawrenceVenkatesh/AffineCovers/NormalForm`.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, and a singly ramified Aff(q)-cover of (Y, y) is a connected degree-q covering Z° → Y ∖ {y} with monodromy group Aff(q) acting on the fibre as on 𝔽_q and nontrivial monodromy around y, together with its compactification π : Z → Y. Let Z be a singly ramified Aff(q)-cover. Then Y is the union of S°_{g−1} (genus g − 1, one boundary circle) and T° (genus 1, one boundary circle) glued along their boundary circles, such that: y lies in the interior of T°; the cover is trivial over S°_{g−1}; its restriction to T° has trivial monodromy around ∂T°; and for a standard free basis β₁, β₂ of π₁(T ∖ {y}) (T the capped torus, β_i crossing the cutting curve α_i once and not the other), Cov(β₁) projects to a generator of 𝔽_q^× and Cov(β₂) is a nonzero translation. Consequently, after conjugation, Cov(β₁) = (x ↦ cx) with c a generator and Cov(β₂) = (x ↦ x + 1), and Cov factors through the map π₁(Y ∖ {y}) → π₁(T ∖ {y}) collapsing S°_{g−1}.

**Proof.**

- λ ∘ Cov : H₁(Y; ℤ) → 𝔽_q^× ≅ ℤ/(q − 1) is surjective; it lifts to a surjection H₁(Y; ℤ) → ℤ (a surjection ℤ^{2g} → ℤ/N lifts to a primitive linear form, by adjusting one coordinate by multiples of N), which by Poincaré duality is ⟨·, α₁⟩ for a primitive class α₁, represented by a simple closed curve avoiding y.
- Take parallel copies α₁^± on either side of y; they cobound an annulus containing y, so Cov(α₁^+)Cov(α₁^−)⁻¹ is conjugate to the monodromy around y, and both lie in 𝔽_q^+ (their λ-part is ⟨α₁, α₁⟩ = 0); so they are not both trivial.
- Cutting along α₁^± and discarding the annulus gives Y¹ of genus g − 1 with boundary circles b₊, b₋; Cov restricted to π₁(Y¹) has image in 𝔽_q^+ and factors through H₁(Y¹; ℤ), with Cov(b₊) = −Cov(b₋) ≠ 0; conjugating by a scaling, Cov(b₊) = 1.
- The induced map H₁(Y¹; ℤ) → 𝔽_q^+ lifts to ℓ : H₁(Y¹; ℤ) → ℤ with ℓ(b₊) = 1 (b₊ is primitive); by Poincaré–Lefschetz duality ℓ = ⟨·, α₂⟩ with α₂ ∈ H₁(Y¹, ∂Y¹; ℤ), which by LV Lemma 8.4 is represented by a simple proper arc joining b₊ to b₋.
- Cutting Y¹ along α₂ gives Y² of genus g − 1 with one boundary circle, over which the cover is trivial (Cov is ℓ mod q, which vanishes on curves disjoint from α₂); the complement of Y² in Y is a regular neighbourhood of α₁^± ∪ α₂ together with the annulus, a torus T° with one boundary circle containing y (Euler characteristics: (3 − 2g) + (−1) = 2 − 2g).
- The monodromy around ∂T° = ∂Y² is trivial; β₁ crosses α₁ once, so λ(Cov(β₁)) = ±λ(generator); β₂ crosses α₂ once and not α₁, so Cov(β₂) = ±1 ∈ 𝔽_q^+. Conjugating fixes the fixed point of Cov(β₁) at 0 and Cov(β₂) = +1 (replace β₂ by its inverse if necessary).
- π₁(Y ∖ {y}) is the amalgam of π₁(S°_{g−1}) and π₁(T° ∖ {y}) over ∂ (van Kampen); Cov kills π₁(S°_{g−1}) and ∂, so it factors through π₁(T° ∖ {y})/⟨⟨∂⟩⟩ = π₁(T ∖ {y}), free on β₁, β₂.

**Uses.** Aff(q)-covers and singly ramified Aff(q)-covers (LV §8.2) (`LV.9/affine-cover`); Mapping classes of a surface with two boundary circles realize Sp(V, b) (LV Lemma 8.4) (`LV.9/boundary-fixing-symplectic-surjective`); Primitive homology classes are represented by simple closed curves (`LV.5/primitive-classes-simple`); Surfaces with boundary and punctures (`LV.5/surface`); Change of coordinates for simple closed curves (`LV.5/change-of-coordinates`); The configuration fibration of a surface and its fundamental groups (`LV.5/fadell-neuwirth-sequence`); The affine group Aff(q) of a prime field (`LV.0/affine-group`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-1-van-kampen-through-the-fundamental-groupoid — AlgebraicTopology Stage 1 (van Kampen theorem and group presentations); tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality — AlgebraicTopology Stage 6 (cohomology, products, Poincaré duality, intersection pairing); tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group — GeometricTopology Layer 1 (cutting and gluing manifolds along submanifolds).

**Tests.**

- g = 2, q = 3: T° carries an S₃-cover of the once-punctured torus with Cov(β₁) = (x ↦ −x), Cov(β₂) = (x ↦ x + 1).
- Two normal forms with c₁ = c₂ give isomorphic covers.

#### Curves on the torus part of the normal form (LV Lemma 8.11)

*Lemma* `TauCeti.LawrenceVenkatesh.normal_form_curves` — module `TauCeti/NumberTheory/LawrenceVenkatesh/AffineCovers/NormalForm`.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, and a singly ramified Aff(q)-cover of (Y, y) is a connected degree-q covering Z° → Y ∖ {y} with monodromy group Aff(q) acting on the fibre as on 𝔽_q and nontrivial monodromy around y, together with its compactification π : Z → Y. In the normal form, fix p ∈ ∂T°, a labelling of the fibre over p by 𝔽_q with Cov(β₁) = (x ↦ cx), Cov(β₂) = (x ↦ x + 1). There are simple closed curves γ_j (0 ≤ j ≤ q) on T° ∖ {y}, based at p and meeting ∂T° only at p, such that: (i) λ(Cov(γ_j)) = c for all j; (ii) Cov(γ_j) fixes exactly j modulo q (for j = q: fixes 0); (iii) the classes of the degree-one lifts γ_j⁺ span H₁ of the restricted cover T̃° modulo the homology of its boundary; (iv) all γ_j have the same germs at p.

**Proof.**

- Let d be a push-off of β₂ into the interior of T° ∖ {y}, on the side away from y, crossing β₁ once near the end of β₁. Then T_d^k(β₁) is a simple loop at p representing β₁β₂^k (with the twist direction chosen accordingly), for every k ≥ 0, and it has the germs of β₁ at p because T_d is supported away from p.
- Cov(β₁β₂^k) = (x ↦ c(x + k)) fixes ck/(1 − c). The map k ↦ k* := [ck/(1 − c)] (k < q), q* := q, is a bijection of [0, q]; put γ_{k*} := T_d^k(β₁). This gives (i), (ii), (iv).
- (iii): the covering of T° extends over the torus T with a single point over y, so it suffices that the lifts span H₁ of the covering T̃ of T ∖ {y} (compare H₁(T̃°)/H₁(∂T̃°) with H₁(T̃)). The group π₁(T̃ ∖ {pt}, p̃) is the stabilizer H of 0 in the free group ⟨β₁, β₂⟩, and the lift of γ_j corresponds to β₂^{−j*}β₁β₂^{j+j*} ∈ H.
- By Schreier's lemma with coset representatives 1, β₂, …, β₂^{q−1}, H is generated by β₂^q and β₂^{−[cj]}β₁β₂^j (0 ≤ j ≤ q − 1); modulo q these pairs coincide with those in the previous step, so the lifts generate H, hence its abelianization.

**Uses.** Normal form of a singly ramified Aff(q)-cover (LV Proposition 8.5) (`LV.9/affine-cover-normal-form`); Dehn twists (`LV.5/dehn-twist`); Lifting powers of Dehn twists to finite coverings (`LV.5/covering-dehn-twist-lift`); `mathlib:Subgroup.closure_mul_image_eq`.

**Tests.**

- q = 3, c = −1: Cov(β₁β₂^k) = (x ↦ −x − k) fixes −k/2.
- The γ_j have classes (1, k) in H₁(T), and their lifts span a lattice of rank 2 + (q − 1) in H₁(T̃).

### LV.9.C Dependencies

Within this roadmap: `MordellLawrenceVenkatesh:LV.0`, `MordellLawrenceVenkatesh:LV.5`.

Other roadmaps:

- `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence` (Stage 2: lifting criterion and Galois correspondence). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: Classification of (possibly disconnected) covering spaces of a connected, locally path-connected, semilocally simply connected space by π₁-sets, with the fibre monodromy and path/homotopy lifting; lifts of homeomorphisms of the base to a connected covering exist when the induced outer automorphism preserves the conjugacy class of the monodromy, and two lifts differ by a deck transformation.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent` (Stage 5: bundles, covers, products, and finite-cover descent). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: Transfer for finite coverings of surfaces, including coverings branched over finitely many points (via the unbranched part), with p_* p^* = deg and the projection formula for intersection numbers of transverse cycles.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality` (Stage 6: cohomology, products, and manifold duality). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: Poincaré–Lefschetz duality for compact oriented surfaces with boundary, the resulting intersection pairing on H₁ (perfect for closed surfaces), and its compatibility with orientation-preserving homeomorphisms. Poincaré–Lefschetz duality H₁(W; ℤ) ≅ Hom(H₁(W, ∂W; ℤ), ℤ) for compact oriented surfaces with boundary.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations` (Stage 4: CW pairs, cellular homology, and cofibrations). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: Cellular homology of finite CW complexes, used for the 4g-gon model of a closed orientable surface (H₁ ≅ ℤ^{2g}, H₂ ≅ ℤ) and for graphs. The cycle space of a finite graph is its first homology, and cycles with disjoint edge supports are linearly independent.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-1-van-kampen-through-the-fundamental-groupoid` (Stage 1: van Kampen through the fundamental groupoid). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: The based van Kampen theorem for two open sets with path-connected intersection and the free-group presentation of the fundamental group of a finite wedge of circles. Van Kampen for a surface cut along a separating circle.
- `tauceti:TauCetiRoadmap/GeometricTopology#layer-1-manifold-library-buildout-general-dimension-general-structure-group` (Layer 1: manifold-library buildout (general dimension, general structure group)). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: Cutting a topological surface along a finite family of disjoint simple closed curves or proper arcs and regluing, with the cut surface compact and the gluing homeomorphism recorded; regular (collar) neighbourhoods of simple closed curves in surfaces and their uniqueness up to isotopy; isotopy extension for points and for embedded circles in surfaces; triangulability of compact surfaces (Radó).

## Layer LV.10: The monodromy theorem for Kodaira–Parshin families

This layer proves big monodromy. LV Lemma 8.6 is left to the reader in the paper; the node proves it with a finger-moved nonseparating curve in the split part of the normal form. The curve used in the last case of LV Lemma 8.8 is constructed for every exponent as a Dehn twist. The comparison with the algebraic Kodaira–Parshin family uses the configuration-family statement of LV.5 and the homology of reduced Pryms from LV.8.

### LV.10.B Theorems

#### Point-pushing acts non-centrally on each factor (LV Lemma 8.6)

*Lemma* `TauCeti.LawrenceVenkatesh.push_monodromy_noncentral` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Monodromy/PointPush`.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, Z_1, …, Z_N represent the isomorphism classes of singly ramified Aff(q)-covers of (Y, y), and Mon, Mod(Y ∖ {y})', π₁(Y, y)' are as in LV.9. For every i, the image of π₁(Y, y)' under Mon_{Z_i} ∘ Push is not contained in the centre {±1} of Sp(H₁^Pr(Z_i, Y)); more precisely it contains a nontrivial unipotent element.

**Proof.**

- Put Z = Z_i in normal form (LV.9) and choose a nonseparating simple closed curve w in S°_{g−1} (g − 1 ≥ 1) and a curve w' in S°_{g−1} meeting w once. Finger-move w along an arc to y to get a simple loop γ at y, isotopic to w in Y, whose left push-off a is isotopic to w in Y ∖ {y} and whose right push-off b bounds, together with a, an annulus containing y (Farb–Margalit Fact 4.7). Then Push(γ) = T_a T_b⁻¹.
- Cov(a) = Cov(w) = 1 and Cov(b) is conjugate to Cov(a) times the monodromy around y, a q-cycle. So a lifts to the q copies w_1, …, w_q of w in the copies of S°_{g−1}, b lifts to one circle b̃ of degree q, and T_a^q T_b^{−q} lifts to ∏_j T_{w_j}^q · T_{b̃}⁻¹ (LV.5). The preimage of the annulus is a sphere with q + 1 holes (Riemann–Hurwitz), so Σ_j [w_j] = [b̃] in H₁(Z).
- Hence u := Mon_Z(Push(γ)^q) acts on H₁(Z) by x ↦ x + q Σ_j ⟨x, w_j⟩w_j − ⟨x, b̃⟩b̃ = x + Σ_{j,l} (qδ_{jl} − 1)⟨x, w_j⟩w_l. For x = [w'_1] (the copy of w' in the first sheet), ⟨x, w_j⟩ = ±δ_{1j}, and (u − 1)x = ±((q − 1)w_1 − Σ_{l≠1} w_l) ≠ 0 because the w_l are linearly independent (LV Lemma 8.2). So u is a nontrivial unipotent on H₁(Z).
- u is the identity on π^*H₁(Y) (lifts of point-pushes) and preserves the decomposition, so u is a nontrivial unipotent on H₁^Pr(Z, Y).
- π₁(Y, y)' has finite index k in π₁(Y, y) and is normal, so γ^{qk!} ∈ π₁(Y, y)' and Mon_Z(Push(γ^{qk!})) = u^{k!}, a nontrivial unipotent (characteristic zero), which is not ±1.

**Uses.** Normal form of a singly ramified Aff(q)-cover (LV Proposition 8.5) (`LV.9/affine-cover-normal-form`); Lifted mapping classes and the monodromy maps Mon (LV (8.2)–(8.5)) (`LV.9/lifted-monodromy`); Classes of the preimage circles (LV Lemma 8.2) (`LV.9/preimage-classes-independent`); Primitive homology of a covering (`LV.9/primitive-homology`); The Birman exact sequence and pushes of simple loops (`LV.5/birman-exact-sequence`); Lifting powers of Dehn twists to finite coverings (`LV.5/covering-dehn-twist-lift`); Action of Dehn twists and multitwists on homology (`LV.5/dehn-twist-homology`); Change of coordinates for simple closed curves (`LV.5/change-of-coordinates`); `tauceti:LinearMap.GeneralLinearGroup.IsUnipotent`.

**Tests.**

- q = 3, g = 2: u − 1 has rank 2 on the 6-dimensional primitive homology (the matrix qI − J on the three copies has rank q − 1 = 2).
- LV leave this lemma to the reader and sketch an argument via the theorem of the fixed part, Torelli and de Franchis; the node gives a topological proof.

#### Distinct covers are distinguished by the cycle type along a simple closed curve (LV Lemma 8.8)

*Lemma* `TauCeti.LawrenceVenkatesh.covers_distinguished_by_curve` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Monodromy/Distinguish`.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, Z_1, …, Z_N represent the isomorphism classes of singly ramified Aff(q)-covers of (Y, y), and Mon, Mod(Y ∖ {y})', π₁(Y, y)' are as in LV.9. For non-isomorphic Z₁, Z₂ among the Z_i there is a nonseparating simple closed curve η ⊂ Y ∖ {y} such that Cov₁(η) and Cov₂(η) have different cycle types.

**Proof.**

- Case 1: λ₁ := λ ∘ Cov₁ and λ₂ := λ ∘ Cov₂, as maps H₁(Y; ℤ) → 𝔽_q^×, have different kernels. Choose a basis e_1, …, e_{2g} of H₁(Y; ℤ) with ker λ₁ = ⟨(q − 1)e_1, e_2, …⟩; some e_j (j ≥ 2) is not in ker λ₂. A simple closed curve η representing e_j (primitive) has Cov₁(η) ∈ 𝔽_q^+ (cycle type (1^q) or (q)) and λ₂(Cov₂(η)) ≠ 1 (cycle type (1, r, …, r), r > 1).
- Case 2: equal kernels. Cut Y along the same α₁ for both covers (LV.9 normal form), normalize Cov_i(b₊) = 1, and let g_i : H₁(Y¹; ℤ) → 𝔽_q^+ be the induced maps. If g₁ ≠ g₂, pick a class v_s of a geometric symplectic basis of the capped part with g₁(v_s) ≠ g₂(v_s), and k ≡ −g₁(v_s) mod q; by LV Lemma 8.4 the class v_s + k b₊ is represented by a simple closed curve η ⊂ Y¹, nonseparating in Y, with Cov₁(η) = 1 and Cov₂(η) a q-cycle.
- Case 3: g₁ = g₂. Cut along the same α₂, so both covers are in normal form on the same decomposition Y = S°_{g−1} ∪ T°, with Cov_i(β₁) = (x ↦ c_i x), Cov_i(β₂) = (x ↦ x + 1) and c₁ ≠ c₂ (otherwise Cov₁ = Cov₂, since both factor through the free group ⟨β₁, β₂⟩).
- In T° ∖ {y} choose disjoint simple arcs ℓ₁, ℓ₂ from ∂T° to ∂T°, parallel copies of β₂ separated by y, whose closures in T ∖ {y} represent β₂ and β₁β₂β₁⁻¹; in S°_{g−1} choose simple arcs w, w' joining their endpoints on ∂, disjoint from each other except for one transverse crossing (possible since g − 1 ≥ 1). The closed curves d := ℓ₁ ∪ w and x := ℓ₂ ∪ w' are simple, nonseparating, and cross exactly once.
- For m ≥ 1, η := T_d^m(x) is simple; as a free loop it is x·d^{±m}, and its image under the collapse π₁(Y ∖ {y}) → π₁(T ∖ {y}) is conjugate to β₁β₂β₁⁻¹β₂^{±m}. Hence Cov_i(η) is conjugate to translation by c_i^{±1} ± m (the exponent of c_i fixed by the composition convention). Choose m ∈ [1, q − 1] with c₁^{±1} ± m ≡ 0: Cov₁(η) = 1 while Cov₂(η) is translation by c₂^{±1} − c₁^{±1} ≠ 0, a q-cycle. The class of η is [x] ± m[d], whose S_{g−1}-component [w'] ± m[w] is primitive, so η is nonseparating.

**Uses.** Normal form of a singly ramified Aff(q)-cover (LV Proposition 8.5) (`LV.9/affine-cover-normal-form`); Mapping classes of a surface with two boundary circles realize Sp(V, b) (LV Lemma 8.4) (`LV.9/boundary-fixing-symplectic-surjective`); Aff(q)-covers and singly ramified Aff(q)-covers (LV §8.2) (`LV.9/affine-cover`); Primitive homology classes are represented by simple closed curves (`LV.5/primitive-classes-simple`); Dehn twists (`LV.5/dehn-twist`); Change of coordinates for simple closed curves (`LV.5/change-of-coordinates`); Cycle types of elements of Aff(q) (`LV.0/affine-group-cycle-type`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-1-van-kampen-through-the-fundamental-groupoid — AlgebraicTopology Stage 1 (van Kampen theorem and group presentations).

**Tests.**

- q = 3: Aff(3) = S₃ and cycle types (1³), (3), (1, 2) are all realized.
- LV draw the curve of case 3 for exponent 2 (their Figure 4); the node constructs it for every exponent as a twist of x about d.

#### A connected spanning system of liftable curves (LV Lemma 8.10)

*Lemma* `TauCeti.LawrenceVenkatesh.liftable_curve_system` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Monodromy/LiftableSystem`.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, Z_1, …, Z_N represent the isomorphism classes of singly ramified Aff(q)-covers of (Y, y), and Mon, Mod(Y ∖ {y})', π₁(Y, y)' are as in LV.9. For a singly ramified Aff(q)-cover Z there are liftable curves A_1, …, A_M on Y ∖ {y} such that (a) the classes Ã_s span H₁^Pr(Z, Y), and (b) the graph with an edge between A_s and A_t whenever Ã_s·Ã_t ≠ 0 is connected.

**Proof.**

- Put Z in normal form with base point p ∈ ∂D ≅ ∂D' and take the curves γ_j of LV Lemma 8.11; label the sheets of the trivial cover over S°_{g−1} by 𝔽_q using the labelling at p.
- Let W be a set of simple loops at p in S°_{g−1}, one for each primitive class. For w ∈ W, one of γ_j·w^{±1} is represented by a simple closed curve A(w, j) (smooth the concatenation at p; the branches of γ_j and w lie on opposite sides of ∂, and by (iv) the admissible sign depends only on w). Its monodromy has linear part c, so A(w, j) is liftable, with [A(w, j)⁺] = [γ_j⁺] ± [w_j] (w_j the lift of w to the j-th sheet).
- Differences [A(w, j)⁺] − [A(w', j)⁺] = ±[w_j] ± [w'_j] span the homology of the j-th sheet; with (iii) of LV Lemma 8.11 and the Mayer–Vietoris sequence for Z = (q sheets of S°_{g−1}) ∪ T̃°, the [A(w, j)⁺] span H₁(Z), and their projections span H₁^Pr(Z, Y).
- Intersections: [γ_j⁺]·[w_k] = 0, so by (8.6) Ã(w₁, j)·Ã(w₂, k) = ±(δ_{jk} − q⁻¹)[w₁]·[w₂] + ([γ_j⁺]·[γ_k⁺] − q⁻¹[γ_j]·[γ_k]). Since δ_{jk} − q⁻¹ ≠ 0 and the intersection form on H₁(S°_{g−1}) is perfect, for any (w₁, j), (w₂, l) there is w₃ with [w₁]·[w₃] and [w₂]·[w₃] large enough that both Ã(w₃, k)·Ã(w₁, j) and Ã(w₃, k)·Ã(w₂, l) are nonzero; so the graph is connected.

**Uses.** Curves on the torus part of the normal form (LV Lemma 8.11) (`LV.9/normal-form-curves`); Normal form of a singly ramified Aff(q)-cover (LV Proposition 8.5) (`LV.9/affine-cover-normal-form`); Liftable curves and their transvections (`LV.9/liftable-curve`); Primitive homology of a covering (`LV.9/primitive-homology`); Primitive homology classes are represented by simple closed curves (`LV.5/primitive-classes-simple`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/AlgebraicTopology#stage-3-subdivision-excision-and-mayer--vietoris — AlgebraicTopology Stage 3 (excision and Mayer–Vietoris).

**Tests.**

- g = 2, q = 3: W can be taken to be the primitive classes of the genus-1 part, and finitely many A(w, j) already span the 6-dimensional primitive homology.
- The constant term [γ_j⁺]·[γ_k⁺] − q⁻¹[γ_j]·[γ_k] is bounded independently of w₃, which is what makes 'large enough' possible.

#### Zariski density on one factor (LV Lemma 8.9)

*Lemma* `TauCeti.LawrenceVenkatesh.lifted_monodromy_dense_factor` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Monodromy/Density`.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, Z_1, …, Z_N represent the isomorphism classes of singly ramified Aff(q)-covers of (Y, y), and Mon, Mod(Y ∖ {y})', π₁(Y, y)' are as in LV.9. For each i, the image of Mon_{Z_i} : Mod(Y ∖ {y})_{Z_i} → Sp(H₁^Pr(Z_i, Y)) is Zariski dense, and so is the image of every finite-index subgroup, in particular of Mod(Y ∖ {y})'.

**Proof.**

- For the liftable curves A_s of LV Lemma 8.10 (liftable-curve-system), Mon(T_{A_s}^{q−1}) = T_{Ã_s}^q (LV.9), so the Zariski closure contains the root groups {T_{Ã_s}^r} (LV.0).
- The Ã_s span and have connected intersection graph, so by LV Lemma 2.14 (LV.0) the closure is Sp(H₁^Pr(Z_i, Y)).
- The closure of the image of a finite-index subgroup has the same identity component (ReductiveGroups Layer 3), and Sp is connected.

**Uses.** A connected spanning system of liftable curves (LV Lemma 8.10) (`LV.10/liftable-curve-system`); Liftable curves and their transvections (`LV.9/liftable-curve`); Lifted mapping classes and the monodromy maps Mon (LV (8.2)–(8.5)) (`LV.9/lifted-monodromy`); The Zariski closure of the powers of a transvection (`LV.0/zariski-closure-transvection-powers`); Transvections along a connected intersection graph (LV Lemma 2.14) (`LV.0/transvection-graph-closure`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `tauceti:TauCeti.Symplectic.geometricallyConnectedCommHopfAlgProperty_coordinateHopfAlgebra`.

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components).

**Tests.**

- q = 3, g = 2: the closure is Sp₆ for each of the 135 covers.
- The q-th powers of the transvections T_{Ã_s} already have Zariski closure containing the full root groups.

#### Zariski density on the product (LV Lemma 8.7)

*Lemma* `TauCeti.LawrenceVenkatesh.lifted_monodromy_dense_product` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Monodromy/Density`.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, Z_1, …, Z_N represent the isomorphism classes of singly ramified Aff(q)-covers of (Y, y), and Mon, Mod(Y ∖ {y})', π₁(Y, y)' are as in LV.9. The image of Mon : Mod(Y ∖ {y})' → ∏_i Sp(H₁^Pr(Z_i, Y)) is Zariski dense.

**Proof.**

- Identify the factors (all of dimension (2g − 1)(q − 1)) with one symplectic space by symplectic isomorphisms; let G be the Zariski closure.
- Each projection of G is Sp (one-factor density lemma; the projection of the closure is the closure of the projection).
- For i ≠ j, the curve η of LV Lemma 8.8 gives different cycle types of Cov_i(η), Cov_j(η); for M a common multiple of the orders n_η for all Z_k, T_η^M ∈ Mod(Y ∖ {y})', and Mon_i(T_η^M), Mon_j(T_η^M) are unipotent with fixed spaces of different codimensions (LV Lemma 8.3).
- LV Lemma 2.12 (LV.0, symplectic Goursat) gives G = ∏_i Sp.

**Uses.** Zariski density on one factor (LV Lemma 8.9) (`LV.10/lifted-monodromy-dense-factor`); Distinct covers are distinguished by the cycle type along a simple closed curve (LV Lemma 8.8) (`LV.10/covers-distinguished-by-curve`); The rank of a lifted twist detects the cycle type (LV Lemma 8.3) (`LV.9/twist-rank-detects-cycle-type`); Lifted mapping classes and the monodromy maps Mon (LV (8.2)–(8.5)) (`LV.9/lifted-monodromy`); Zariski-closed subgroups of Sp(V)^N (LV Lemma 2.12) (`LV.0/symplectic-goursat`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components).

**Tests.**

- N = 1 is the one-factor density lemma.
- Without Lemma 8.8, the closure could be the graph of a conjugation between two factors.

#### Closed normal subgroups of products of symplectic groups

*Lemma* `TauCeti.LawrenceVenkatesh.normal_subgroups_of_symplectic_products` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Monodromy/Density`.

Let k be an algebraically closed field of characteristic zero, (V_i, ω_i) (1 ≤ i ≤ N) symplectic spaces of dimension ≥ 2 and H ⊆ ∏_i Sp(V_i) a Zariski-closed normal subgroup whose projection to each factor is not contained in the centre {±1}. Then H = ∏_i Sp(V_i).

**Proof.**

- For h ∈ H with h_i ∉ {±1} and s in the i-th factor subgroup, the commutator [h, s] = (1, …, [h_i, s], …, 1) lies in H.
- The closed subgroup of Sp(V_i) generated by the [h_i, s] is normal and not central: otherwise h_i s h_i⁻¹ s⁻¹ ∈ {±1} for all s, and by connectedness of Sp(V_i) the sign is constant, equal to +1, so h_i would be central.
- Closed normal subgroups of Sp(V_i) are Sp(V_i) or central (ReductiveGroups Layer 6), so H contains the i-th factor subgroup for every i.

**Uses.** `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `tauceti:TauCeti.Symplectic.geometricallyConnectedCommHopfAlgProperty_coordinateHopfAlgebra`.

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components); tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups — ReductiveGroups Layer 6 (reductive and semisimple groups, centres).

**Tests.**

- N = 1: a closed normal subgroup of Sp(V) containing a non-central element is Sp(V).
- The subgroup {±1}^N is normal and central in each factor, so the hypothesis is needed.

#### Zariski density of the point-pushing monodromy (LV Theorem 8.1)

*Theorem* `TauCeti.LawrenceVenkatesh.AffineCover.zariskiDense_pushMonodromy` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Monodromy/Theorem81`.

Throughout, Y is a closed oriented surface of genus g ≥ 2, y ∈ Y, q ≥ 3 is a prime, Z_1, …, Z_N represent the isomorphism classes of singly ramified Aff(q)-covers of (Y, y), and Mon, Mod(Y ∖ {y})', π₁(Y, y)' are as in LV.9. The map Mon ∘ Push : π₁(Y, y)' → ∏_{i=1}^N Sp(H₁^Pr(Z_i, Y)) has Zariski-dense image.

**Proof.**

- Push(π₁(Y, y)) = ker(Forget) is normal in Mod(Y ∖ {y}), so Push(π₁(Y, y)') = Push(π₁(Y, y)) ∩ Mod(Y ∖ {y})' is normal in Mod(Y ∖ {y})'.
- The Zariski closure H of its image is therefore normal in the closure of Mon(Mod(Y ∖ {y})'), which is ∏_i Sp by LV Lemma 8.7 (subgroups normalizing a group normalize its closure).
- By LV Lemma 8.6 each projection of H is non-central; the lemma on closed normal subgroups of symplectic products gives H = ∏_i Sp.

**Uses.** Point-pushing acts non-centrally on each factor (LV Lemma 8.6) (`LV.10/push-monodromy-noncentral`); Zariski density on the product (LV Lemma 8.7) (`LV.10/lifted-monodromy-dense-product`); Closed normal subgroups of products of symplectic groups (`LV.10/normal-subgroups-of-symplectic-products`); Lifted mapping classes and the monodromy maps Mon (LV (8.2)–(8.5)) (`LV.9/lifted-monodromy`); The Birman exact sequence and pushes of simple loops (`LV.5/birman-exact-sequence`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components — ReductiveGroups Layer 3 (closed subgroups, identity components).

**Tests.**

- q = 3, g = 2: the closure is a product of 135 copies of Sp₆.
- The theorem is the topological form of full monodromy for the Kodaira–Parshin family.

#### The Kodaira–Parshin family has full monodromy (LV §8.2.3)

*Theorem* `TauCeti.LawrenceVenkatesh.KodairaParshin.kodaira_parshin_full_monodromy` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Monodromy/KodairaParshin`.

Let Y be a smooth projective geometrically connected curve of genus g ≥ 2 over a number field K ⊂ ℂ and q ≥ 3 a prime. The Kodaira–Parshin family X_q → Y'_q → Y has full monodromy: for y ∈ Y(ℂ), the Zariski closure of the monodromy of π₁(Y(ℂ), y) on H¹_B(X_{q,y}(ℂ), ℚ) = ⊕_{y' ↦ y} H¹_B(X_{q,y'}(ℂ), ℚ) contains ∏_{y'} Sp(H¹_B(X_{q,y'}(ℂ)), ω_{y'}).

**Proof.**

- Y(ℂ) is a closed surface of genus g (LV.8). The fibre π⁻¹(y) is the set of Aff(q)-conjugacy classes of surjections π₁(Y(ℂ) ∖ {y}) → Aff(q) nontrivial at y, which is in bijection with the singly ramified Aff(q)-covers Z_1, …, Z_N via y' ↦ Z_{q,y'} ×^{Aff(q)} 𝔽_q (LV.9).
- The analytic Kodaira–Parshin curve family restricted to Y(ℂ) is the configuration family of LV.5 attached to the Hurwitz covering (LV.8); so the monodromy of γ ∈ π₁(Y(ℂ), y) permutes the y' as Push(γ) permutes the Z_i, and for γ ∈ π₁(Y, y)' it acts on the y'-summand of H₁ by the lift of Push(γ), which is unique on the degree-q quotient (trivial centralizer) and commutes with the Aff(q)-action on Z_{q,y'}.
- The identification H₁(X_{q,y'}(ℂ), ℚ) ≅ H₁^Pr(Z_i, Y; ℚ) (LV.8) is natural for such lifts and matches the polarization with the intersection form up to a nonzero factor; so on π₁(Y, y)' the monodromy on ⊕_{y'} H₁(X_{q,y'}) is Mon ∘ Push, and the monodromy on H¹_B is its contragredient.
- By LV Theorem 8.1 the Zariski closure of the image of π₁(Y, y)' is ∏ Sp; dualizing preserves this, and the image of π₁(Y(ℂ), y) contains that of π₁(Y, y)'. This is LV (5.1), and full monodromy does not depend on y or ι.

**Uses.** Zariski density of the point-pushing monodromy (LV Theorem 8.1) (`LV.10/push-monodromy-dense`); The Kodaira–Parshin family (LV Definitions 7.2–7.3) (`LV.8/kodaira-parshin-family`); Hurwitz spaces of G-covers branched at one point (LV Proposition 7.1) (`LV.8/hurwitz-space`); The complex Hurwitz space of G-covers branched at one point (LV §7.3) (`LV.8/hurwitz-cover-complex`); Homology of the reduced Prym is the primitive homology of the degree-q cover (`LV.8/reduced-prym-homology`); The complex points of a curve form a closed surface of the same genus (`LV.8/curve-topological-genus`); Aff(q)-covers and singly ramified Aff(q)-covers (LV §8.2) (`LV.9/affine-cover`); Lifted mapping classes and the monodromy maps Mon (LV (8.2)–(8.5)) (`LV.9/lifted-monodromy`); Monodromy of families of branched covers over configuration spaces (`LV.5/configuration-family-monodromy`); The algebraic monodromy group of an abelian-by-finite family and full monodromy (LV (3.5), (5.1)) (`LV.3/algebraic-monodromy-group`); `AbelianSchemesAndArithmeticModuli:A5` (Complex uniformization with polarization and level); `ComplexComparisonPartII:C5` (Algebraic de Rham–Betti comparison).

**Tests.**

- q = 3, g = 2: the closure contains a product of 135 copies of Sp₆.
- Property (i) before LV Theorem 5.4.

### LV.10.C Dependencies

Within this roadmap: `MordellLawrenceVenkatesh:LV.0`, `MordellLawrenceVenkatesh:LV.3`, `MordellLawrenceVenkatesh:LV.5`, `MordellLawrenceVenkatesh:LV.8`, `MordellLawrenceVenkatesh:LV.9`.

Other roadmaps:

- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-1-van-kampen-through-the-fundamental-groupoid` (Stage 1: van Kampen through the fundamental groupoid). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: The based van Kampen theorem for two open sets with path-connected intersection and the free-group presentation of the fundamental group of a finite wedge of circles. Van Kampen for a surface cut along a separating circle.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-3-subdivision-excision-and-mayer--vietoris` (Stage 3: subdivision, excision, and Mayer--Vietoris). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: The Mayer–Vietoris sequence for a surface decomposed along finitely many disjoint circles, with the pinned sign convention.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components` (Layer 3: subgroups, quotients, components). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For an affine algebraic group G over a field k and an abstract subgroup Γ ⊆ G(k): the Zariski closure of Γ, the smallest closed subgroup scheme whose k-points contain Γ (reduced, with Γ Zariski dense in it); its formation commutes with field extension; a finite-index subgroup of Γ has closure with the same identity component; the closure of the image of Γ under a homomorphism of algebraic groups is the image of the closure; subgroups normalizing Γ normalize its closure; in characteristic zero an infinite subgroup of 𝔾_a(k) is Zariski dense; images of homomorphisms of algebraic groups are closed.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups` (Layer 6: reductive and semisimple groups). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For a symplectic space (V, ω) of dimension ≥ 2 over an algebraically closed field of characteristic zero: Sp(V) is connected, its centre is {±1}, and every closed normal subgroup of Sp(V) is either Sp(V) or contained in {±1}.
- `AbelianSchemesAndArithmeticModuli:A5` (Complex uniformization with polarization and level). Needed: For an abelian scheme over a smooth complex variety T, the degree-one de Rham–Betti comparison H¹_dR(A/T)^an ≅ R¹f_*ℂ ⊗ 𝒪^an identifies ∇ with the connection whose horizontal sections are R¹f_*ℂ, and R¹f_*ℤ is a local system (Ehresmann).
- `ComplexComparisonPartII:C5` (Algebraic de Rham–Betti comparison). Needed: For a smooth proper morphism of complex algebraic varieties, the analytic Gauss–Manin connection on the relative algebraic de Rham cohomology has the Betti local system R^q f_*ℂ as sheaf of horizontal sections (relative Gauss–Manin compatibility of the algebraic de Rham–Betti comparison).

## Layer LV.11: Faltings's theorem after Lawrence and Venkatesh

This layer assembles Faltings's theorem. The prime $q$ is chosen by Dirichlet's theorem in a residue class that forces the needed linear disjointness (the role of the prime $2$ is made explicit), the friendly place $v$ by Chebotarev in a cyclotomic compositum, and the size bound comes from the Weil pairing on $H^1_{\mathrm{et}}(Y_{\bar K},\mathbb Z/(q-1))$. Orbits of size smaller than $8$ only require the exponents $1\le i\le7$.

### LV.11.B Theorems

#### Choice of the prime q (LV §5, conditions (i)–(iii))

*Lemma* `TauCeti.LawrenceVenkatesh.Assembly.admissible_prime` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Assembly/ChoiceOfQ`.

Let K be a number field with Galois closure K' over ℚ, g ≥ 2 and B > 0. There is a prime q > B such that: (i) 4 ∤ q − 1, and no odd prime ℓ < 8[K : ℚ] divides q − 1; (ii) no odd prime dividing q − 1 divides disc(K); consequently, writing q − 1 = 2m' (m' odd), ℚ(ζ_{q−1}) = ℚ(ζ_{m'}), K' ∩ ℚ(ζ_{q−1}) = ℚ and Gal(K'(ζ_{m'})/ℚ) ≅ Gal(K'/ℚ) × (ℤ/m')^× ≅ Gal(K'/ℚ) × (ℤ/(q − 1))^×; (iii) 8·2^{g+1}/(q − 1)^g < 1/((g − 1/2)(q − 1) + 1).

**Proof.**

- Let L be the set of odd primes ℓ with ℓ < 8[K : ℚ] or ℓ | disc(K), and N := 4∏_{ℓ∈L} ℓ. By Dirichlet's theorem there are primes q > B with q ≡ −1 mod N; then q − 1 ≡ 2 mod 4 and q − 1 ≡ −2 ≢ 0 mod ℓ for ℓ ∈ L, which gives (i) and (ii).
- (ii): the primes ramified in K' are those ramified in K, i.e. those dividing disc(K) (Mathlib). The odd primes dividing q − 1 are unramified in K', so |disc K'| is coprime to m', and the Tau Ceti compositum isomorphism gives Gal(K'(ζ_{m'})/ℚ) ≅ Gal(K'/ℚ) × (ℤ/m')^×; also (ℤ/2m')^× = (ℤ/m')^× and ℚ(ζ_{2m'}) = ℚ(ζ_{m'}) since m' is odd.
- (iii): the left side is O(q^{−g}) and the right side is of order q^{−1}; since g ≥ 2 the inequality holds for all large q.

**Uses.** `mathlib:Nat.forall_exists_prime_gt_and_eq_mod`; `mathlib:NumberField.not_dvd_discr_iff_isUnramifiedIn`; `mathlib:NumberField.exists_not_isUnramifiedIn`; `mathlib:IsCyclotomicExtension.Rat.ramificationIdx_eq_of_not_dvd`; `tauceti:IsCyclotomicExtension.Rat.prime_dvd_of_dvd_natAbs_discr`; `tauceti:IsCyclotomicExtension.galEquivProd`; `mathlib:ZMod.card_units_eq_totient`; `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations).

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius — LocalFieldsRamification Layer 2 (unramified extensions and Frobenius).

**Tests.**

- K = ℚ, g = 2: q = 107 is admissible: 106 = 2·53, none of 3, 5, 7 divides 106, and 64/106² ≈ 0.00570 < 1/160 = 0.00625.
- K = ℚ, g = 2: the least q ≡ −1 mod 420 is 419 (418 = 2·11·19), also admissible.

#### Choice of the friendly place v (LV §5)

*Lemma* `TauCeti.LawrenceVenkatesh.Assembly.friendly_auxiliary_place` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Assembly/ChoiceOfV`.

Let K and q be as in the lemma on the choice of q (admissible-prime) and T a finite set of places of K. There is a finite place v ∉ T of K such that: (a) v is friendly; (b) its residue characteristic p is odd, unramified in K and lies below no place of T; (c) (q_v, q − 1) = 1; (d) for every odd prime r | q − 1, the class of q_v in (ℤ/r)^× has order at least 8.

**Proof.**

- Choose σ ∈ Gal(K'/ℚ): if K has a CM subfield, let E be its largest CM subfield and E⁺ the maximal totally real subfield of E, and take σ ∈ Gal(K'/E⁺) acting nontrivially on E; otherwise take any σ.
- By the Chinese remainder theorem choose a ∈ (ℤ/m')^× reducing to a primitive root modulo every prime r | m'.
- By Chebotarev applied to K'(ζ_{m'})/ℚ and the class of (σ, a) (Tau Ceti Chebotarev Layer 10 with the compositum Frobenius lemma), there are infinitely many primes p, unramified in K'(ζ_{m'}), with a prime ℘ above p whose Frobenius restricts to σ on K' and with p ≡ a mod m'; exclude p = 2, the primes ramified in K and those below T.
- Let v be the place of K below ℘ and f its residue degree, so q_v = p^f with f ≤ [K : ℚ]. (c): p is odd and prime to m'. (d): p has order r − 1 modulo r, so q_v has order (r − 1)/gcd(r − 1, f) ≥ (r − 1)/[K : ℚ] ≥ 8, since r ≥ 8[K : ℚ] + 1 by (i) of the choice-of-q lemma.
- (a): if E exists, the decomposition group of ℘ in Gal(K'/ℚ) is generated by σ ∈ Gal(K'/E⁺), so the place of E⁺ below ℘ has residue degree 1 over p and its Frobenius in Gal(E/E⁺) is σ|_E ≠ 1; it is therefore inert in E, and v lies above it. In all cases v is unramified over ℚ.

**Uses.** Choice of the prime q (LV §5, conditions (i)–(iii)) (`LV.11/admissible-prime`); Friendly places (LV Definition 2.7) (`LV.1/friendly-place`); The largest CM-or-totally-real subfield of a number field (`LV.1/largest-cm-subfield`); `FoundationsAndLibraryIntegration:LI.4` (Imported arithmetic foundations); `tauceti:NumberField.Chebotarev.mem_frobeniusPrimeSet_galEquivProd_symm_iff`; `tauceti:AlgHom.IsArithFrobAt.autToPow_eq_absNorm`; `tauceti:IsCyclotomicExtension.galEquivProd`; `mathlib:Ideal.quotientInfRingEquivPiQuotient`; `mathlib:IsArithFrobAt`; `tauceti:NumberField.exists_isArithFrobAt`.

**Notes.** Upstream Tau Ceti inputs, consumed through FoundationsAndLibraryIntegration LI.4: tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev — Chebotarev Layer 10 (Dirichlet-density Chebotarev, infinitude of every Frobenius class).

**Tests.**

- K = ℚ (no CM subfield): every odd prime p that is a primitive root modulo each prime factor of (q − 1)/2 works; for q = 107, 2 is a primitive root modulo 53, so any odd prime p ≡ 2 mod 53 works, for example p = 373 = 7·53 + 2.
- K imaginary quadratic (a CM field): v must lie above a prime inert in K.

#### The Weil pairing on H¹(Y, ℤ/(q − 1)) and the Frobenius at v

*Lemma* `TauCeti.LawrenceVenkatesh.Assembly.weil_pairing_frobenius` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Assembly/WeilPairing`.

Let Y be a smooth projective geometrically connected curve of genus g over K with good reduction outside a finite set S of places, N ≥ 2, and v ∉ S a finite place with (q_v, N) = 1. Then M := H¹_et(Y_{K̄}, ℤ/N) is free of rank 2g over ℤ/N and unramified at v, it carries a perfect alternating G_K-equivariant pairing ⟨·,·⟩ : M × M → μ_N^∨ := Hom(μ_N, ℤ/N), and the Frobenius T := Frob_v satisfies ⟨Tm₁, Tm₂⟩ = q_v⁻¹⟨m₁, m₂⟩.

**Proof.**

- Poincaré duality for curves with ℤ/N coefficients (cup product and the trace H²(Y_{K̄}, μ_N) ≅ ℤ/N) gives the perfect alternating equivariant pairing into Hom(μ_N, ℤ/N); freeness of rank 2g follows from H¹ = Hom(π₁^geom, ℤ/N) and the comparison with the topological fundamental group (LV.8).
- Unramifiedness: smooth proper base change for the good model at v, N being invertible there.
- The arithmetic Frobenius acts on μ_N by ζ ↦ ζ^{q_v}, hence on μ_N^∨ by multiplication by q_v⁻¹; equivariance of the pairing gives the relation.

**Uses.** The complex points of a curve form a closed surface of the same genus (`LV.8/curve-topological-genus`); `EtaleDualityAndPerverseSheaves:EDC.2` (Smooth trace, relative purity and Poincaré duality); `InverseGaloisAndArithmeticFundamentalGroups:IG.1` (Arithmetic exact sequences and specialization); `mathlib:cyclotomicCharacter`.

**Tests.**

- N = 2: M ≅ Jac(Y)[2] (as μ₂ = ℤ/2) with the Weil pairing, and T preserves the pairing since q_v is odd.
- For an elliptic curve and N = q − 1, the relation is det T = q_v⁻¹ on H¹.

#### Few elements lie in small Frobenius orbits

*Lemma* `TauCeti.LawrenceVenkatesh.Assembly.small_orbit_count` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Assembly/OrbitCount`.

Let N = 2m' with m' odd, M a free ℤ/N-module of rank 2g with a perfect alternating pairing into a cyclic group C ≅ ℤ/N, and T an automorphism of M with ⟨Tm₁, Tm₂⟩ = u⟨m₁, m₂⟩ for a unit u ∈ (ℤ/N)^× such that u^i ≢ 1 mod r for every prime r | m' and 1 ≤ i ≤ 7. Then |ker(T^i − 1)| ≤ 2^g N^g for 1 ≤ i ≤ 7, and at most 7·2^g N^g ≤ 8·2^g N^g elements of M lie in T-orbits with fewer than 8 elements.

**Proof.**

- For m₁, m₂ ∈ ker(T^i − 1): (u^i − 1)⟨m₁, m₂⟩ = 0, and u^i − 1 is a unit modulo m', so the ℤ/m'-component of ⟨m₁, m₂⟩ vanishes and ⟨2m₁, 2m₂⟩ = 4⟨m₁, m₂⟩ = 0.
- 2M ≅ (ℤ/m')^{2g} with the pairing (2a, 2b) ↦ 4⟨a, b⟩ ∈ 2C ≅ ℤ/m' is perfect (2 is invertible modulo m'); by LV.0 (isotropic subgroups) |2·ker(T^i − 1)|² ≤ |2M| = m'^{2g}.
- The kernel of x ↦ 2x on ker(T^i − 1) lies in M[2] ≅ (ℤ/2)^{2g}, so |ker(T^i − 1)| ≤ 2^{2g}·m'^g = 2^g N^g.
- An element in an orbit of size s < 8 lies in ker(T^s − 1) with 1 ≤ s ≤ 7.

**Uses.** Isotropic subgroups for a perfect pairing on a finite abelian group (`LV.0/isotropic-subgroup-card`); `mathlib:CharacterModule`.

**Tests.**

- N = 106 = 2·53, g = 2: |ker(T^i − 1)| ≤ 4·106² = 44944, while |M| = 106⁴ ≈ 1.26·10⁸.
- LV state the union over 1 ≤ i ≤ 8; for i = 8 the unit condition may fail when q_v has order exactly 8 modulo r, but orbits of size < 8 only need i ≤ 7.

#### The size bound (LV (5.4))

*Lemma* `TauCeti.LawrenceVenkatesh.Assembly.size_bound` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Assembly/SizeBound`.

Let Y be a smooth projective geometrically connected curve of genus g ≥ 2 over K, q an admissible prime, X_q → Y'_q → Y the Kodaira–Parshin family with a good model over 𝒪_S (𝒴 proper), and v ∉ S a place satisfying (b)–(d) of the friendly-place lemma for T ⊇ S. Then size_v(π⁻¹(y)) < 1/(d_q + 1) for every y ∈ Y(K).

**Proof.**

- π⁻¹(y) is finite étale over 𝒪_S, hence unramified at v. The fibre map ψ : π⁻¹(y)(K̄) → M = H¹(Y_{K̄}, ℤ/(q − 1)) is G_K-equivariant with image Υ (the generating 2g-tuples) and fibres of constant size (LV.8), so size_v(π⁻¹(y)) ≤ size_v(Υ) (LV (5.3)).
- The Frobenius T at v preserves Υ and satisfies ⟨Tm₁, Tm₂⟩ = q_v⁻¹⟨m₁, m₂⟩; by (c), (d), u = q_v⁻¹ satisfies the unit condition of the orbit count, and q − 1 = 2m' with m' odd by admissibility. So at most 8·2^g(q − 1)^g elements of Υ lie in small orbits.
- |Υ| = J_{2g}(q − 1) ≥ (q − 1)^{2g}/2 (LV.0), so size_v(Υ) ≤ 8·2^{g+1}/(q − 1)^g < 1/((g − 1/2)(q − 1) + 1) = 1/(d_q + 1) by (iii).

**Uses.** Few elements lie in small Frobenius orbits (`LV.11/small-orbit-count`); The Weil pairing on H¹(Y, ℤ/(q − 1)) and the Frobenius at v (`LV.11/weil-pairing-frobenius`); Choice of the prime q (LV §5, conditions (i)–(iii)) (`LV.11/admissible-prime`); Choice of the friendly place v (LV §5) (`LV.11/friendly-auxiliary-place`); The map from Kodaira–Parshin fibres to H¹(Y, ℤ/(q − 1)) (LV (5.5)) (`LV.8/kodaira-parshin-fibre-map`); The Kodaira–Parshin family (LV Definitions 7.2–7.3) (`LV.8/kodaira-parshin-family`); The proportion of small Frobenius orbits (LV Definition 5.2) (`LV.7/size-v`); Counting generating tuples of ℤ/N (`LV.0/generating-tuples-card`).

**Tests.**

- K = ℚ, g = 2, q = 107: size_v ≤ 64/106² ≈ 0.0057 < 1/160.
- The bound does not depend on y.

#### Faltings's theorem (LV Theorem 5.4)

*Theorem* `TauCeti.LawrenceVenkatesh.finite_rationalPoints_of_two_le_genus` — module `TauCeti/NumberTheory/LawrenceVenkatesh/Assembly/Faltings`.

Let K be a number field and Y a smooth projective geometrically connected curve over K of genus g ≥ 2. Then Y(K) is finite.

**Proof.**

- Fix an embedding K ⊂ ℂ. Choose an admissible prime q and form the Kodaira–Parshin family X_q → Y'_q → Y (LV.8); choose S such that it has a good model over 𝒪_S with 𝒴 proper.
- The family has full monodromy (LV.10), and Y(ℂ) is connected.
- Choose v by the friendly-place lemma with T the set of places in S, above 2, and above the primes lying below S; then v is friendly, v ∉ S, its residue characteristic is odd and lies below no place of S, and (c), (d) hold.
- By the size bound, Y(K)* = Y(K) for d = d_q; Proposition 5.3 (LV.7) shows that Y(K)* is finite.

**Uses.** The size bound (LV (5.4)) (`LV.11/size-bound`); Choice of the prime q (LV §5, conditions (i)–(iii)) (`LV.11/admissible-prime`); Choice of the friendly place v (LV §5) (`LV.11/friendly-auxiliary-place`); Rational points on the base of an abelian-by-finite family (LV Proposition 5.3) (`LV.7/proposition-5-3`); The Kodaira–Parshin family has full monodromy (LV §8.2.3) (`LV.10/kodaira-parshin-full-monodromy`); The Kodaira–Parshin family (LV Definitions 7.2–7.3) (`LV.8/kodaira-parshin-family`); Existence of good models after enlarging S (`LV.2/good-model-exists`); `ComplexComparisonPartII:C4` (Chow algebraization and morphism comparison).

**Tests.**

- The statement coincides with that of HeightsRationalPointsAndObstructions RP.4 (see the restructure proposal).
- For K = ℚ and g = 2 the proof runs with q = 107 (d_q = 159) and a prime p ≡ 2 mod 53.

### LV.11.C Dependencies

Within this roadmap: `MordellLawrenceVenkatesh:LV.0`, `MordellLawrenceVenkatesh:LV.1`, `MordellLawrenceVenkatesh:LV.2`, `MordellLawrenceVenkatesh:LV.7`, `MordellLawrenceVenkatesh:LV.8`, `MordellLawrenceVenkatesh:LV.10`.

Other roadmaps:

- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius` (Layer 2: unramified extensions and Frobenius). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: A prime is unramified in the Galois closure of a number field K if and only if it is unramified in K (a compositum of extensions unramified at p is unramified at p).
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev` (Layer 10: Dirichlet-density Chebotarev). Consumed through `FoundationsAndLibraryIntegration:LI.4` (integration of the pinned Tau Ceti snapshot). Needed: For a finite Galois extension M/ℚ (here M = K'(ζ_{m'})), an element ρ ∈ Gal(M/ℚ) and a finite set of primes, there are infinitely many primes p outside the set, unramified in M, with a prime of M above p whose arithmetic Frobenius is ρ (infinitude of frobeniusPrimeSet for the conjugacy class of ρ).
- `EtaleDualityAndPerverseSheaves:EDC.2` (Smooth trace, relative purity and Poincaré duality). Needed: For a smooth projective geometrically connected curve Y over K and N invertible on K: H¹_et(Y_{K̄}, ℤ/N) is free of rank 2g over ℤ/N, and cup product with the trace H²_et(Y_{K̄}, μ_N) ≅ ℤ/N gives a perfect alternating G_K-equivariant pairing H¹(ℤ/N) × H¹(ℤ/N) → μ_N^∨ := Hom(μ_N, ℤ/N); if Y has good reduction at a place v ∤ N, H¹_et(Y_{K̄}, ℤ/N) is unramified at v.
- `InverseGaloisAndArithmeticFundamentalGroups:IG.1` (Arithmetic exact sequences and specialization). Needed: For a geometrically connected variety X over K: the exact sequence 1 → π₁^et(X_{K̄}) → π₁^et(X) → G_K → 1, the resulting outer action of G_K on π₁^et(X_{K̄}), inertia subgroups at the punctures of a punctured curve and the cyclotomic twist σ(ι) = ι^{χ(σ)} of inertia generators; H¹_et(X_{K̄}, A) = Hom(π₁^et(X_{K̄}), A) for a finite abelian group A, G_K-equivariantly.
- `ComplexComparisonPartII:C4` (Chow algebraization and morphism comparison). Needed: For a smooth geometrically connected curve Y over a subfield of ℂ, projective or the complement of finitely many points in a projective one, Y(ℂ) with the analytic topology is connected.

## Non-goals

LV §§9–12 (hypersurfaces, the Bakker–Tsimerman theorem, the combinatorics of reductive groups and point counting) and LV Lemmas 2.2 and 2.4–2.6, which only those sections use, are not part of this roadmap. The height-theoretic proof of Faltings's theorem is not used.
