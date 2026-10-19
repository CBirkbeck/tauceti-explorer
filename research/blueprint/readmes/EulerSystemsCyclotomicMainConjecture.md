# Euler systems and the unconditional cyclotomic main conjecture

The goal is an arithmetic proof of the cyclotomic main conjecture for every
prime. Cyclotomic numbers give norm-compatible cohomology classes; their
Kolyvagin derivatives bound class groups. At the Iwasawa level this gives one
divisibility of characteristic ideals. Finite-level circular-unit indices and
control of norm descent supply equality, and the Coleman comparison identifies
the analytic ideal. Greither’s argument treats abelian coefficient fields and
the prime 2, including the integral character quotients and trivial-zero terms
that cannot be discarded there.

This roadmap owns the cyclotomic arithmetic application. Generic Euler-system
carriers, derivative descent and bounds belong to
**EulerSystemsAndKolyvaginSystems**. Global circular units and the arithmetic
Iwasawa modules belong to **IntegralIwasawaTheory**. Local interpolation belongs
to **ColemanPowerSeries**; analytic gamma and exceptional derivative formulas
belong to **DirichletPadicLFunctions**. The class-group/Tate-twist Selmer dictionary
belongs to **SelmerIwasawaCohomology**. Every use below cites its owner directly.

The proof targets are unconditional mathematical statements. Three precise
source/control obligations are listed at the end; the target-level catalogue
keeps them visible and does not claim their proofs are closed.

## Conventions and imported infrastructure

Fix compatible primitive roots ζ_m for positive m, with ζ_mn^n=ζ_m, in the
cyclotomic tower supplied by IntegralIwasawaTheory L0. All Frobenius elements
are arithmetic: Fr_q(ζ_m)=ζ_m^q when q∤m. Relative norms are field norms, with
real norm degree 2 for m>2 and degree 1 for m=1,2. A root of unity of order m
is never introduced by an arbitrary element satisfying only ζ^m=1.

Unless a target says otherwise, the odd-prime character setting means p>2,
χ even and nontrivial of finite order prime to p, O=ℤ_p[χ], L the field cut out
by χ, and f its primitive conductor. Write χ(q)=0 when q|f. The cyclotomic
ℤ_p-extension has layers ℚ_n, L_n=Lℚ_n, Γ=Gal(ℚ∞/ℚ), and Λχ=O[[Γ]]. In a
chosen coordinate γ, T=γ−1 and J=(T). The Tate dual of a lattice T₀ is
T₀*=Hom_O(T₀,O)(1); its Euler polynomial, rather than that of T₀ itself,
is used in Rubin’s norm relation. Multiplicative groups are written additively
after p-adic completion and tensoring. In particular a Kummer class of 1 is 0.

For the same p, two different character constructions occur. Rubin’s M^χ is
the eigensubmodule, equivalently the invariants of the χ⁻¹ twist. Greither’s
M_χ=M⊗_(ℤ_p[Δ])ℤ_p(χ) is the character quotient. They agree under the
prime-to-p semisimple hypotheses; the latter is only right exact in general.
The finite sum Σδ χ(δ)⁻¹δ is unnormalised and is not an idempotent projection.

The source letters for Iwasawa modules are incompatible. The following table
fixes the dictionary used in the targets.

| Arithmetic object | Rubin III | RJW §13 | Greither §§3–4 |
|---|---|---|---|
| Norm limit of p-class groups; unramified extension group | A∞ | Y∞ | X |
| Maximal abelian p-ramified pro-p extension group | Z∞ in III.2.10 | X∞ | Y |
| Norm limit of completed semilocal multiplicative groups | Y∞ | use its full arithmetic name | use its full arithmetic name |

A plus superscript refers to the real field or the plus quotient specified in
the target. At p=2 it never licenses division by 2. In the finite-index formulas
of L4, the notation copied as mathematical notation from Greither is
|a|_p=p^{v_p(a)}, the reciprocal of the usual p-adic absolute value. Thus
Nχ(a)=p^{[ℚ_p(χ):ℚ_p]v_p(a)}=|a|_p^{d(χ)}. This convention is used only for
those index formulas; analytic supplier statements retain their own explicit
normalised absolute values.

The checked library baseline is Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The packet records 29 source-read
baseline declarations: field norms, cyclotomic fields and roots, representation
invariants, Dirichlet’s additive unit rank, power series, and the finite Kummer
map with its kernel. The finite Kummer map is not itself a definition of
integral continuous cohomology or its norm square.

The current Tau Ceti library already contains completed group algebras and
their module, power-series, product and dyadic coordinate interfaces in
`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/`. They are used
as existing infrastructure. The current LocalGaloisGroups and ProfiniteArithmetic
roadmaps add no global cyclotomic Euler-system theorem to duplicate. Local
Kummer comparison and global reciprocity remain inputs from the existing
ProfiniteCohomology and ClassFieldTheory roadmaps.

## Sources

Locations below are printed page numbers, with PDF numbers added where useful.
Statements, corrections and proofs are specified in this roadmap’s own words.

- **RUBIN-ES** — Karl Rubin, *Euler systems*. Author draft of Annals of Mathematics Studies 147 (Princeton, 2000), distributed with the 1999 Arizona Winter School notes; chapter and section numbering agree with the monograph. Printed page = PDF page − 10. [Source](https://swc-math.github.io/notes/files/99RubinES.pdf).
- **RJW-PADIC-L** — Joaquín Rodrigues Jacinto; Chris Williams, *An introduction to p-adic L-functions*. arXiv:2309.15692v2 (19 December 2024); for §13.5 also the version of record, Essential Number Theory 4 (2025) 101–216 (msp.org PDF), whose text there is unchanged [Source](https://arxiv.org/abs/2309.15692v2).
- **GREITHER-1992** — Cornelius Greither, *Class groups of abelian fields, and the main conjecture*. Ann. Inst. Fourier (Grenoble) 42 (1992), no. 3, 449–499; Numdam scan with OCR text layer (52 pages; journal page = PDF page + 447). Formulas were checked on the page images where the OCR is unreliable. [Source](http://www.numdam.org/item/AIF_1992__42_3_449_0.pdf).
- **GROSS-1981** — Benedict H. Gross, *p-adic L-series at s = 0*. J. Fac. Sci. Univ. Tokyo Sect. IA Math. 28(3) (1981), 979–994; repository scan, checked on page images [Source](https://repository.dl.itc.u-tokyo.ac.jp/record/39628/file_preview/jfs280340.pdf).

The Rubin source is the freely readable author draft, not an assertion that
the published monograph was inspected. RJW §13.5 was also compared with the
version of record by the preceding source pass. Source hashes, dates and the
scope of each source reading are recorded in the packet.

## L0 — Euler systems and their normalisation

Build the p-extended family c̃_m=N_(mp/m)(1−ζ_mp) and its real norms from actual
cyclotomic numbers. These are p-units in the relevant sense, not integral units
at every conductor: c̃_1=p. The character sum produces the unit ξ_(n,χ) and its
span C_(n,χ); the initial class of the p-extended Euler system is
(1−χ⁻¹(p))ξ_(L,χ). This makes the χ(p)=1 boundary essential.

There are two further source-routed constructions. Rubin IX.1.1 gives a
χ-twisted unsmoothed real-unit family over conductors prime to p, using the
rigidity alternative. IX.6.2 instead modifies the Stickelberger family in
H¹(F,ℤ_p), preserving its trivial coefficients. It is not a second Kummer
construction in H¹(F,ℤ_p(1)). RJW Definition 10.16 and Appendix B.3 are
comparison sources for the imported generic Euler-system carrier.

<a id="minpoly-step-of-dvd"></a>
### Minimal polynomial of a cyclotomic step when ℓ divides m

**Target `EulerSystemsCyclotomicMainConjecture:L0/minpoly-step-of-dvd`**.

Let ℓ be prime with ℓ ∣ m, K = ℚ(μ_m) ⊆ L = ℚ(μ_{mℓ}), ζ ∈ L a primitive mℓ-th root of unity and η = ζ^ℓ ∈ K. Then the minimal polynomial of ζ over K is X^ℓ − η.

**Hypotheses and conventions.**

- ℓ is prime and m ≥ 1; K and L are cyclotomic over ℚ of conductors m and mℓ (Mathlib's IsCyclotomicExtension {m} ℚ K and {mℓ} ℚ L), with L a K-algebra.
- ζ ∈ L is a primitive mℓ-th root of unity and η ∈ K satisfies η = ζ^ℓ in L, so η is a primitive m-th root; this is the compatibility ζ_{mℓ}^ℓ = ζ_m that Rubin fixes before (2).
- ℓ ∣ m.

**Construction or proof.**

1. [L : ℚ] = φ(mℓ) = ℓ·φ(m) because ℓ ∣ m (Nat.totient_mul_of_prime_of_dvd), and [K : ℚ] = φ(m); both from IsCyclotomicExtension.finrank with the irreducibility of the rational cyclotomic polynomials.
2. By the tower law (Module.finrank_mul_finrank), [L : K] = ℓ. L is generated over ℚ, hence over K, by ζ, so deg minpoly_K(ζ) = ℓ (IntermediateField.adjoin.finrank).
3. ζ is a root of the monic degree-ℓ polynomial X^ℓ − η ∈ K[X], so minpoly_K(ζ) divides it (minpoly.dvd); both are monic of degree ℓ, so they are equal.

**Checks.**

- m = 2, ℓ = 2: the minimal polynomial of i over ℚ is X² + 1 = X² − ζ₂.
- m = p^{n−1}, ℓ = p: this is RJW's X^p − ξ_{p^{n−1}} in the proof of Lemma 10.3.

**Sources.** **RJW-PADIC-L**, §10.2, proof of Lemma 10.3, printed p. 48 (arXiv v2). The local version of the step m = p^{n−1}, ℓ = p. **RUBIN-ES**, Chapter III, §2.1, display (2), printed p. 34 (PDF p. 44). The first case of (2) rests on this minimal polynomial.

**Direct dependencies.** `mathlib:IsCyclotomicExtension.finrank`; `mathlib:Polynomial.cyclotomic.irreducible_rat`; `mathlib:Nat.totient_mul_of_prime_of_dvd`; `mathlib:Module.finrank_mul_finrank`; `mathlib:IntermediateField.adjoin.finrank`; `mathlib:minpoly.dvd`.

<a id="minpoly-step-of-not-dvd"></a>
### Minimal polynomial of a cyclotomic step when ℓ does not divide m

**Target `EulerSystemsCyclotomicMainConjecture:L0/minpoly-step-of-not-dvd`**.

Let ℓ be prime with ℓ ∤ m, and let ℓ' satisfy ℓℓ' ≡ 1 (mod m). With K, L, ζ, η as before, η^{ℓ'} ∈ K is a root of X^ℓ − η, and minpoly_K(ζ)·(X − η^{ℓ'}) = X^ℓ − η. So the conjugates of ζ over K are the ℓ-th roots of η other than η^{ℓ'}, the unique one of order dividing m.

**Hypotheses and conventions.**

- ℓ is prime and m ≥ 1; K and L are cyclotomic over ℚ of conductors m and mℓ (Mathlib's IsCyclotomicExtension {m} ℚ K and {mℓ} ℚ L), with L a K-algebra.
- ζ ∈ L is a primitive mℓ-th root of unity and η ∈ K satisfies η = ζ^ℓ in L, so η is a primitive m-th root; this is the compatibility ζ_{mℓ}^ℓ = ζ_m that Rubin fixes before (2).
- ℓ ∤ m and ℓℓ' ≡ 1 (mod m); for m = 1 every ℓ' works and η = 1.

**Construction or proof.**

1. [L : ℚ] = φ(m)(ℓ − 1) (Nat.totient_mul for coprime m, ℓ, and φ(ℓ) = ℓ − 1), so [L : K] = ℓ − 1 by the tower law.
2. (η^{ℓ'})^ℓ = η^{ℓℓ'} = η because η^m = 1, so X − η^{ℓ'} divides X^ℓ − η in K[X]; the quotient g is monic of degree ℓ − 1.
3. ζ ≠ η^{ℓ'} since ζ has order mℓ and η^{ℓ'} has order dividing m, so g(ζ) = 0; hence minpoly_K(ζ) divides g, and equality follows from the degrees.

**Checks.**

- m = 3, ℓ = 2: L = ℚ(μ_6) = K, and minpoly is X − ζ_6 with ζ_6 = −ζ_3² (the other root of X² − ζ_3 is ζ_3², the one of order 3).

**Sources.** **RUBIN-ES**, Chapter III, §2.1, display (2), printed p. 34 (PDF p. 44). The second case of (2) rests on this minimal polynomial.

**Direct dependencies.** `mathlib:IsCyclotomicExtension.finrank`; `mathlib:Polynomial.cyclotomic.irreducible_rat`; `mathlib:Nat.totient_mul`; `mathlib:Module.finrank_mul_finrank`; `mathlib:IntermediateField.adjoin.finrank`; `mathlib:minpoly.dvd`.

<a id="distribution-relation-of-dvd"></a>
### Distribution relation, ℓ dividing m

**Target `EulerSystemsCyclotomicMainConjecture:L0/distribution-relation-of-dvd`**.

With K = ℚ(μ_m) ⊆ L = ℚ(μ_{mℓ}), ζ = ζ_{mℓ}, η = ζ^ℓ = ζ_m and ℓ ∣ m: N_{L/K}(1 − ζ) = 1 − η.

**Hypotheses and conventions.**

- ℓ is prime and m ≥ 1; K and L are cyclotomic over ℚ of conductors m and mℓ (Mathlib's IsCyclotomicExtension {m} ℚ K and {mℓ} ℚ L), with L a K-algebra.
- ζ ∈ L is a primitive mℓ-th root of unity and η ∈ K satisfies η = ζ^ℓ in L, so η is a primitive m-th root; this is the compatibility ζ_{mℓ}^ℓ = ζ_m that Rubin fixes before (2).
- ℓ ∣ m.
- The 1 − ζ convention; Rubin's ζ − 1 form differs by (−1)^ℓ (distribution-relation-rubin-convention).

**Construction or proof.**

1. L/K is Galois (cyclotomic), so N_{L/K}(1 − ζ) = ∏_{σ ∈ Gal(L/K)} (1 − σζ) (Algebra.norm_eq_prod_automorphisms).
2. The σζ are the roots of minpoly_K(ζ) = X^ℓ − η, each once, so the product is the value of X^ℓ − η at X = 1, namely 1 − η.

**Checks.**

- m = 2, ℓ = 2: N_{ℚ(i)/ℚ}(1 − i) = (1 − i)(1 + i) = 2 = 1 − ζ_2.

**Sources.** **RUBIN-ES**, Chapter III, §2.1, display (2), printed p. 34 (PDF p. 44). First case of (2), in the 1 − ζ convention. **RJW-PADIC-L**, §10.2, proof of Lemma 10.3, printed p. 48 (arXiv v2). The same computation for ℓ = p, m = p^{n−1}.

**Direct dependencies.** [L0/minpoly-step-of-dvd](#minpoly-step-of-dvd); `mathlib:Algebra.norm_eq_prod_automorphisms`.

<a id="distribution-relation-of-not-dvd"></a>
### Distribution relation, ℓ not dividing m

**Target `EulerSystemsCyclotomicMainConjecture:L0/distribution-relation-of-not-dvd`** · atlas planet: Distribution relation.

With K = ℚ(μ_m) ⊆ L = ℚ(μ_{mℓ}), ζ = ζ_{mℓ}, η = ζ_m, ℓ ∤ m and ℓℓ' ≡ 1 (mod m): N_{L/K}(1 − ζ)·(1 − η^{ℓ'}) = 1 − η. For m > 1 both factors are nonzero, so N_{L/K}(1 − ζ_{mℓ}) = (1 − ζ_m)^{1 − Fr_ℓ^{−1}}, Fr_ℓ^{−1} acting by ζ_m ↦ ζ_m^{ℓ'}.

**Hypotheses and conventions.**

- ℓ is prime and m ≥ 1; K and L are cyclotomic over ℚ of conductors m and mℓ (Mathlib's IsCyclotomicExtension {m} ℚ K and {mℓ} ℚ L), with L a K-algebra.
- ζ ∈ L is a primitive mℓ-th root of unity and η ∈ K satisfies η = ζ^ℓ in L, so η is a primitive m-th root; this is the compatibility ζ_{mℓ}^ℓ = ζ_m that Rubin fixes before (2).
- ℓ ∤ m and ℓℓ' ≡ 1 (mod m).
- For m = 1 the identity reads 0 = 0; the conductor-one value is distribution-relation-conductor-one.

**Construction or proof.**

1. N_{L/K}(1 − ζ) = ∏_σ (1 − σζ) (Algebra.norm_eq_prod_automorphisms), and the σζ are the roots of minpoly_K(ζ).
2. Evaluate minpoly_K(ζ)·(X − η^{ℓ'}) = X^ℓ − η (minpoly-step-of-not-dvd) at X = 1.

**Checks.**

- m = 3, ℓ = 2: N(1 − ζ_6) = 1 − ζ_6 = −ζ_3 = (1 − ζ_3)/(1 − ζ_3²).
- The relation holds for every prime ℓ, including ℓ = 2, with no sign; the ζ − 1 form of Rubin's (2) fails at ℓ = 2 (sourceIssues E1).

**Sources.** **RUBIN-ES**, Chapter III, §2.1, display (2), printed p. 34 (PDF p. 44). Second case of (2), in the 1 − ζ convention.

**Direct dependencies.** [L0/minpoly-step-of-not-dvd](#minpoly-step-of-not-dvd); `mathlib:Algebra.norm_eq_prod_automorphisms`.

<a id="distribution-relation-frobenius"></a>
### Distribution relation with the arithmetic Frobenius

**Target `EulerSystemsCyclotomicMainConjecture:L0/distribution-relation-frobenius`**.

Let σ ∈ Gal(ℚ(μ_m)/ℚ) be the inverse of the arithmetic Frobenius Fr_ℓ (ζ_m ↦ ζ_m^ℓ), that is the image of ℓ^{−1} ∈ (ℤ/m)^× under Mathlib's autEquivPow. For ℓ ∤ m, N_{ℚ(μ_{mℓ})/ℚ(μ_m)}(1 − ζ_{mℓ})·σ(1 − ζ_m) = 1 − ζ_m.

**Hypotheses and conventions.**

- ℓ is prime and m ≥ 1; K and L are cyclotomic over ℚ of conductors m and mℓ (Mathlib's IsCyclotomicExtension {m} ℚ K and {mℓ} ℚ L), with L a K-algebra.
- ζ ∈ L is a primitive mℓ-th root of unity and η ∈ K satisfies η = ζ^ℓ in L, so η is a primitive m-th root; this is the compatibility ζ_{mℓ}^ℓ = ζ_m that Rubin fixes before (2).
- ℓ is coprime to m.

**Construction or proof.**

1. σ(ζ_m) = ζ_m^{ℓ'} for any ℓ' ≡ ℓ^{−1} (mod m), by the defining property of autEquivPow.
2. Substitute into distribution-relation-of-not-dvd.

**Checks.**

- Fr_ℓ is the arithmetic Frobenius, as in Rubin and in RJW Definition 10.16 (σ_ℓ the image of Frob_ℓ); the Euler factor involves Fr_ℓ^{−1}.

**Sources.** **RUBIN-ES**, Chapter III, §2.1, display (2), printed p. 34 (PDF p. 44). The exponent 1 − Fr_ℓ^{−1} of (2).

**Direct dependencies.** [L0/distribution-relation-of-not-dvd](#distribution-relation-of-not-dvd); `mathlib:IsCyclotomicExtension.autEquivPow`; `mathlib:ZMod.unitOfCoprime`.

<a id="distribution-relation-rubin-convention"></a>
### The ζ − 1 convention and its sign

**Target `EulerSystemsCyclotomicMainConjecture:L0/distribution-relation-rubin-convention`**.

For any finite field extension L/K and ζ ∈ L, N_{L/K}(ζ − 1) = (−1)^{[L:K]} N_{L/K}(1 − ζ). Hence, for the cyclotomic step, N(ζ_{mℓ} − 1) = (−1)^{ℓ+1}(ζ_m − 1) if ℓ ∣ m and N(ζ_{mℓ} − 1) = (−1)^{ℓ−1}(ζ_m − 1)^{1 − Fr_ℓ^{−1}} if ℓ ∤ m, m > 1. For odd ℓ these are Rubin's formulas (2); for ℓ = 2 his first two cases need the sign −1.

**Hypotheses and conventions.**

- [L : K] = ℓ when ℓ ∣ m and ℓ − 1 when ℓ ∤ m (the two minimal-polynomial nodes).

**Construction or proof.**

1. N is multiplicative and N_{L/K}(−1) = (−1)^{[L:K]} (the norm of an element of K is its [L:K]-th power, Algebra.norm_algebraMap).
2. Combine with distribution-relation-of-dvd and distribution-relation-of-not-dvd.

**Checks.**

- Counterexample to the printed (2) at ℓ = 2: N_{ℚ(i)/ℚ}(i − 1) = 2 while ζ_2 − 1 = −2.
- Second counterexample: ℓ = 2, m = 3 gives ζ_6 − 1 = ζ_3 while (ζ_3 − 1)^{1 − Fr_2^{−1}} = −ζ_3.

**Sources.** **RUBIN-ES**, Chapter III, §2.1, display (2), printed p. 34 (PDF p. 44). The printed formula, corrected at ℓ = 2 (sourceIssues E1).

**Direct dependencies.** `mathlib:Algebra.norm_algebraMap`; [L0/distribution-relation-of-dvd](#distribution-relation-of-dvd); [L0/distribution-relation-of-not-dvd](#distribution-relation-of-not-dvd).

<a id="distribution-relation-conductor-one"></a>
### Distribution relation at conductor one

**Target `EulerSystemsCyclotomicMainConjecture:L0/distribution-relation-conductor-one`**.

For every prime ℓ and primitive ℓ-th root ζ_ℓ, N_{ℚ(μ_ℓ)/ℚ}(1 − ζ_ℓ) = ℓ; equivalently N(ζ_ℓ − 1) = (−1)^{ℓ−1}ℓ, Rubin's third case.

**Hypotheses and conventions.**

- ℓ prime, including ℓ = 2 where ℚ(μ_2) = ℚ and ζ_2 = −1.

**Construction or proof.**

1. For ℓ odd, N(ζ − 1) = Φ_ℓ(1) = ℓ (IsPrimitiveRoot.sub_one_norm_eq_eval_cyclotomic with 2 < ℓ, and Polynomial.eval_one_cyclotomic_prime), and N(1 − ζ) = (−1)^{ℓ−1}N(ζ − 1) = ℓ (distribution-relation-rubin-convention).
2. For ℓ = 2, 1 − ζ_2 = 2 ∈ ℚ.

**Checks.**

- ℓ = 3: (1 − ζ_3)(1 − ζ_3²) = 3.
- ℓ = 2: the value is 2, and N(ζ_2 − 1) = −2 = (−1)^{1}·2.

**Sources.** **RUBIN-ES**, Chapter III, §2.1, display (2), printed p. 34 (PDF p. 44). Third case of (2).

**Direct dependencies.** `mathlib:IsPrimitiveRoot.sub_one_norm_eq_eval_cyclotomic`; `mathlib:Polynomial.eval_one_cyclotomic_prime`; [L0/distribution-relation-rubin-convention](#distribution-relation-rubin-convention).

<a id="p-extended-cyclotomic-number"></a>
### The p-extended cyclotomic numbers c̃_m

**Target `EulerSystemsCyclotomicMainConjecture:L0/p-extended-cyclotomic-number`** · atlas planet: Cyclotomic p-units.

Fix a prime p and the compatible roots ζ_m with the tower ℚ(μ_m) (IntegralIwasawaTheory:L0/compatible-cyclotomic-tower). For m ≥ 1 put c̃_m = N_{ℚ(μ_{mp})/ℚ(μ_m)}(1 − ζ_{mp}) ∈ ℚ(μ_m)^×. This is Rubin's c̃_{m∞} in the 1 − ζ convention: Rubin's element N(ζ_{mp} − 1) equals (−1)^{[ℚ(μ_{mp}):ℚ(μ_m)]}c̃_m.

**Hypotheses and conventions.**

- p prime; m ≥ 1. No coprimality between m and p is assumed.
- The extra norm from level mp is what makes the family norm-compatible in the p-direction (Rubin, Remark 2.1); it loses information when p ∤ m.

**Construction or proof.**

1. Definition as a relative norm.
2. API: c̃_m = 1 − ζ_m if p ∣ m (distribution-relation-of-dvd with ℓ = p); c̃_1 = p (distribution-relation-conductor-one); c̃_m ≠ 0 (1 − ζ_{mp} ≠ 0 as mp > 1); the Rubin sign (distribution-relation-rubin-convention).

**API.**

- `TauCeti.CyclotomicEulerSystem.pCycNumber_of_dvd` (simp): If p ∣ m then c̃_m = 1 − ζ_m.
- `TauCeti.CyclotomicEulerSystem.pCycNumber_one` (simp): c̃_1 = p.
- `TauCeti.CyclotomicEulerSystem.pCycNumber_ne_zero` (other): c̃_m ≠ 0 for m ≥ 1.
- `TauCeti.CyclotomicEulerSystem.relNorm_zeta_sub_one_eq` (compatibility): Rubin's c̃_{m∞} = N(ζ_{mp} − 1) equals (−1)^{[ℚ(μ_{mp}):ℚ(μ_m)]}c̃_m; for p odd the sign is a p-adic unit of order 2 and is invisible in H¹(ℚ(μ_m), ℤ_p(1)).

**Uses.** Rubin, Chapter III §2.1: the Euler system for ℤ_p(1) is {c̃_{m∞}, c̃_m} via the Kummer map. Rubin, Chapter III (4) and (6): c̃_f and its norm give the twisted class c_ℚ. EulerSystemsAndKolyvaginSystems:ES.2: acceptance: genuine cyclotomic units, not the torsion expression −ζ^{−1}. EulerSystemsCyclotomicMainConjecture:L1: the class c_ℚ fed to Rubin's Theorem II.2.2.

**Unit tests.**

- `pCycNumber_three_one` (value): For p = 3, c̃_1 = 3.
- `pCycNumber_five_three` (value): For p = 5, c̃_3 = −ζ_3: an individual c̃_m can be a root of unity.
- `pCycNumber_five_five` (value): For p = 5, c̃_5 = 1 − ζ_5.
- `rjw_ratio_torsion` (non-example): (ζ^{−1} − 1)/(ζ − 1) = −ζ^{−1} for every root of unity ζ ≠ 1: RJW's c_m is torsion.

**Checks.**

- The family is not torsion (p-extended-nontorsion), unlike RJW's (ξ^{−1} − 1)/(ξ − 1) = −ξ^{−1}.
- Individual c̃_m can be torsion: for p = 5, c̃_3 = −ζ_3.

**Sources.** **RUBIN-ES**, Chapter III, §2.1, printed p. 34 (PDF p. 44). The definition of c̃_{m∞} and c̃_m. **RUBIN-ES**, Chapter III, Remark 2.1, printed p. 34 (PDF p. 44). The value for p ∣ m and the reason for the extra norm.

**Direct dependencies.** `IntegralIwasawaTheory:L0/compatible-cyclotomic-tower`; `IntegralIwasawaTheory:L0/tower-galois-compatibility`; [L0/distribution-relation-of-dvd](#distribution-relation-of-dvd); [L0/distribution-relation-conductor-one](#distribution-relation-conductor-one); [L0/distribution-relation-rubin-convention](#distribution-relation-rubin-convention).

<a id="p-extended-tower-relation"></a>
### Tower relation for c̃

**Target `EulerSystemsCyclotomicMainConjecture:L0/p-extended-tower-relation`**.

For every m ≥ 1, N_{ℚ(μ_{mp})/ℚ(μ_m)}(c̃_{mp}) = c̃_m.

**Hypotheses and conventions.**

- m ≥ 1, p prime.

**Construction or proof.**

1. c̃_{mp} = 1 − ζ_{mp} since p ∣ mp (pCycNumber_of_dvd, from distribution-relation-of-dvd).
2. The left side is then N(1 − ζ_{mp}) = c̃_m by definition.

**Checks.**

- This is the Euler-system relation at ℓ = p, where no Euler factor enters (N is divisible by p).

**Sources.** **RUBIN-ES**, Chapter III, Remark 2.1, printed p. 34 (PDF p. 44). The statement.

**Direct dependencies.** [L0/p-extended-cyclotomic-number](#p-extended-cyclotomic-number); [L0/distribution-relation-of-dvd](#distribution-relation-of-dvd).

<a id="p-extended-auxiliary-relation"></a>
### Auxiliary-prime relation for c̃

**Target `EulerSystemsCyclotomicMainConjecture:L0/p-extended-auxiliary-relation`**.

For a prime ℓ ≠ p and m ≥ 1: N_{ℚ(μ_{mℓ})/ℚ(μ_m)}(c̃_{mℓ}) = c̃_m^{1 − Fr_ℓ^{−1}} if ℓ ∤ m, and = c̃_m if ℓ ∣ m. Here Fr_ℓ ∈ Gal(ℚ(μ_m)/ℚ). The case m = 1 is included (then Fr_ℓ = 1 and the norm is 1).

**Hypotheses and conventions.**

- ℓ prime, ℓ ≠ p; m ≥ 1.
- The conductor-one exception of (2) never occurs, because c̃ is a norm from level mp > 1.

**Construction or proof.**

1. Norms are transitive in the square ℚ(μ_m) ⊆ ℚ(μ_{mp}), ℚ(μ_{mℓ}) ⊆ ℚ(μ_{mℓp}) (Algebra.norm_norm), so the left side is N_{ℚ(μ_{mp})/ℚ(μ_m)}(N_{ℚ(μ_{mℓp})/ℚ(μ_{mp})}(1 − ζ_{mℓp})).
2. Apply distribution-relation-of-dvd (ℓ ∣ mp) or distribution-relation-frobenius (ℓ ∤ mp) at level mp.
3. The norm N_{ℚ(μ_{mp})/ℚ(μ_m)} commutes with the Galois action (the extensions are abelian), and Fr_ℓ on ℚ(μ_{mp}) restricts to Fr_ℓ on ℚ(μ_m) (IntegralIwasawaTheory:L0).

**Checks.**

- Checked numerically for p ∈ {2, 3, 5, 7}, m < 30 and ℓ ≤ 13: 812 cases, no failure, including p = 2 and ℓ = 2.

**Sources.** **RUBIN-ES**, Chapter III, §2.1, printed p. 34 (PDF p. 44). The Euler-system relation with Euler polynomial 1 − x.

**Direct dependencies.** [L0/p-extended-cyclotomic-number](#p-extended-cyclotomic-number); [L0/distribution-relation-of-dvd](#distribution-relation-of-dvd); [L0/distribution-relation-frobenius](#distribution-relation-frobenius); `mathlib:Algebra.norm_norm`; `IntegralIwasawaTheory:L0/tower-galois-compatibility`.

<a id="p-extended-nontorsion"></a>
### The cyclotomic family is not torsion

**Target `EulerSystemsCyclotomicMainConjecture:L0/p-extended-nontorsion`**.

c̃_1 = p, and for k ≥ 1, c̃_{p^k} = 1 − ζ_{p^k} with N_{ℚ(μ_{p^k})/ℚ}(1 − ζ_{p^k}) = p. Neither is of finite order, since roots of unity have norm ±1.

**Hypotheses and conventions.**

- p prime, k ≥ 1.

**Construction or proof.**

1. c̃_{p^k} = 1 − ζ_{p^k} (pCycNumber_of_dvd).
2. Iterating distribution-relation-of-dvd down the tower and using Algebra.norm_norm, N_{ℚ(μ_{p^k})/ℚ(μ_p)}(1 − ζ_{p^k}) = 1 − ζ_p; then distribution-relation-conductor-one gives p.
3. A root of unity has norm a root of unity in ℚ, that is ±1 ≠ p.

**Checks.**

- Contrast: RJW's c_m = −ξ_m^{−1} is a root of unity (sourceIssues E2).

**Sources.** **RJW-PADIC-L**, §10.5, printed p. 52 (arXiv v2). The torsion choice this node rules out.

**Direct dependencies.** [L0/p-extended-cyclotomic-number](#p-extended-cyclotomic-number); [L0/distribution-relation-of-dvd](#distribution-relation-of-dvd); [L0/distribution-relation-conductor-one](#distribution-relation-conductor-one); `mathlib:Algebra.norm_norm`.

<a id="real-p-extended-number"></a>
### The real cyclotomic numbers c̃_m^+

**Target `EulerSystemsCyclotomicMainConjecture:L0/real-p-extended-number`**.

c̃_m^+ = N_{ℚ(μ_m)/ℚ(μ_m)^+}(c̃_m) ∈ (ℚ(μ_m)^+)^×, Rubin's c̃_m, attached to the ray class field modulo m (the real subfield) while c̃_m is attached to modulo m∞.

**Hypotheses and conventions.**

- m ≥ 1; for m ≤ 2, ℚ(μ_m)^+ = ℚ(μ_m) = ℚ and c̃_m^+ = c̃_m.
- The real norm has degree e(m)=2 for m>2 and e(1)=e(2)=1. At conductors 1 and 2 it is the identity, not multiplication by complex conjugation.

**Construction or proof.**

1. Definition as a relative norm (real subfield and complex conjugation from IntegralIwasawaTheory:L0).
2. For m > 2, Gal(ℚ(μ_m)/ℚ(μ_m)^+) = {1, complex conjugation}, so c̃_m^+ = c̃_m·c̄̃_m.

**API.**

- `TauCeti.CyclotomicEulerSystem.pCycNumberReal_eq_mul_conj` (characterisation): For m > 2, c̃_m^+ = c̃_m·conj(c̃_m) in ℂ.
- `TauCeti.CyclotomicEulerSystem.pCycNumberReal_of_le_two` (simp): For m ≤ 2, c̃_m^+ = c̃_m.
- `TauCeti.CyclotomicEulerSystem.pCycNumberReal_ne_zero` (other): c̃_m^+ ≠ 0.

**Uses.** Rubin, Chapter III §2.1 and Remark II.1.3: the classes on the ray class fields modulo m (no archimedean place). Rubin, Chapter III (4): c_ℚ is the χ-twisted product of the δc̃_f over Gal(ℚ(μ_f)^+/ℚ).

**Unit tests.**

- `pCycNumberReal_three_three` (value): For p = 3, ℚ(μ_3)^+ = ℚ and c̃_3^+ = N(1 − ζ_3) = 3.
- `pCycNumberReal_one` (degenerate): c̃_1^+ = c̃_1 = p.
- `pCycNumberReal_five_five` (value): For p = 5, c̃_5^+ = (1 − ζ_5)(1 − ζ_5^{−1}) = 2 − ζ_5 − ζ_5^{−1} = (5 − √5)/2, which is not c̃_5.

**Checks.**

- c̃_m^+ is real and, for m > 2, positive (a squared absolute value).

**Sources.** **RUBIN-ES**, Chapter III, §2.1, printed p. 34 (PDF p. 44). The definition of c̃_m.

**Direct dependencies.** `IntegralIwasawaTheory:L0/real-subfield`; [L0/p-extended-cyclotomic-number](#p-extended-cyclotomic-number).

<a id="real-relations"></a>
### Relations for the real cyclotomic numbers

**Target `EulerSystemsCyclotomicMainConjecture:L0/real-relations`**.

The family c̃^+ satisfies the relations of c̃: N_{ℚ(μ_{mp})^+/ℚ(μ_m)^+}(c̃_{mp}^+) = c̃_m^+, and for a prime ℓ ≠ p, N_{ℚ(μ_{mℓ})^+/ℚ(μ_m)^+}(c̃_{mℓ}^+) = (c̃_m^+)^{1 − Fr_ℓ^{−1}} if ℓ ∤ m and = c̃_m^+ if ℓ ∣ m. Moreover N_{ℚ(μ_m)/ℚ(μ_m)^+}(c̃_m) = c̃_m^+ by definition, the relation between conductors m∞ and m.

**Hypotheses and conventions.**

- m ≥ 1; ℓ ≠ p prime.

**Construction or proof.**

1. N_{ℚ(μ_m)/ℚ(μ_m)^+} commutes with the norms between levels, by transitivity in the square of real and full cyclotomic fields (Algebra.norm_norm), and with the Galois action.
2. Apply p-extended-tower-relation and p-extended-auxiliary-relation.

**Checks.**

- Both relations are proved simultaneously by the same commutation.

**Sources.** **RUBIN-ES**, Chapter III, §2.1, printed p. 34 (PDF p. 44). The Euler-system relations for the whole collection {c̃_{m∞}, c̃_m}.

**Direct dependencies.** [L0/real-p-extended-number](#real-p-extended-number); [L0/p-extended-tower-relation](#p-extended-tower-relation); [L0/p-extended-auxiliary-relation](#p-extended-auxiliary-relation); `mathlib:Algebra.norm_norm`.

<a id="smoothed-unit-comparison"></a>
### Smoothed cyclotomic units and the smoothing divisor

**Target `EulerSystemsCyclotomicMainConjecture:L0/smoothed-unit-comparison`**.

Let m ≥ 2 and a ∈ ℕ coprime to m. Then c_m(a) = (1 − ζ_m^a)/(1 − ζ_m) = ∑_{i<a} ζ_m^i is a unit of ℤ[ζ_m] and equals σ_a(1 − ζ_m)/(1 − ζ_m). If p ∣ m it equals σ_a(c̃_m)/c̃_m = c̃_m^{σ_a − 1}; for m = p^n it is RJW's c_n(a) = (ξ^a − 1)/(ξ − 1). The operator σ_a − 1 is the image of the smoothing divisor θ_a = δ_a − δ_1 (the denominator of DirichletPadicLFunctions:L1/arithmetic-pseudomeasure) under the finite projection Λ(ℤ_p^×) → ℤ_p[(ℤ/p^n)^×] ≅ ℤ_p[Gal(ℚ(μ_{p^n})/ℚ)], δ_u ↦ σ_{u mod p^n}. The smoothed family {c̃_m^{σ_a − 1} : (m, a) = 1} satisfies the relations of p-extended-tower-relation and p-extended-auxiliary-relation for the primes ℓ ∤ a.

**Hypotheses and conventions.**

- m ≥ 2 and gcd(a, m) = 1; a need not be prime to p for the unit statement, but the family indexed by all m requires the primes dividing a to be excluded, since σ_a is defined only on ℚ(μ_m) with (a, m) = 1.
- a = ±1 gives the torsion elements 1 and −ζ_m^{−1}; the nondegenerate smoothing uses a ∉ {0, ±1}.

**Construction or proof.**

1. The quotient is the geometric sum, a unit by IsPrimitiveRoot.geom_sum_isUnit.
2. σ_a(1 − ζ_m) = 1 − ζ_m^a by definition of σ_a (IntegralIwasawaTheory:L0); for p ∣ m use pCycNumber_of_dvd.
3. Under the finite projection (PadicMeasuresIwasawaAlgebras:L1/finite-projection-algebra-map) with the Dirac homomorphism (PadicMeasuresIwasawaAlgebras:L1/dirac-hom) and unit reduction (PadicMeasuresIwasawaAlgebras:L1/unit-reduction), δ_a − δ_1 maps to [a mod p^n] − [1], which acts as σ_a − 1.
4. σ_a commutes with the relative norms, so the relations transfer.

**Checks.**

- The signs of the ζ − 1 and 1 − ζ conventions cancel in the quotient.

**Sources.** **RJW-PADIC-L**, §10.2, definition of c_n(a) and Lemma 10.3, printed p. 48 (arXiv v2). The smoothed units compared here.

**Direct dependencies.** [L0/p-extended-cyclotomic-number](#p-extended-cyclotomic-number); [L0/p-extended-tower-relation](#p-extended-tower-relation); [L0/p-extended-auxiliary-relation](#p-extended-auxiliary-relation); `mathlib:IsPrimitiveRoot.geom_sum_isUnit`; `IntegralIwasawaTheory:L0/smoothed-cyclotomic-unit`; `DirichletPadicLFunctions:L1/arithmetic-pseudomeasure`; `PadicMeasuresIwasawaAlgebras:L1/finite-projection-algebra-map`; `PadicMeasuresIwasawaAlgebras:L1/dirac-hom`; `PadicMeasuresIwasawaAlgebras:L1/unit-reduction`.

<a id="qab-euler-hypotheses"></a>
### ℚ^ab and N = p satisfy the Euler-system hypotheses

**Target `EulerSystemsCyclotomicMainConjecture:L0/qab-euler-hypotheses`**.

The pair (𝒦, N) = (ℚ^ab, p) satisfies Rubin's Definition II.1.1: (i) 𝒦 contains ℚ(q) for every prime q ≠ p; (ii) 𝒦 contains the cyclotomic ℤ_p-extension ℚ_∞, in which no finite prime splits completely. In the conductor-indexed presentation of Remark II.1.3, the fields are 𝒦 ∩ ℚ[m∞] = ℚ(μ_m) and 𝒦 ∩ ℚ[m] = ℚ(μ_m)^+.

**Hypotheses and conventions.**

- p prime (Rubin's §2.1 takes any p; the applications take p > 2).

**Construction or proof.**

1. (i) ℚ(q) lies in the ray class field modulo q, which is ℚ(μ_q)^+ ⊆ ℚ^ab (class field theory over ℚ).
2. (ii) ℚ_∞ ⊆ ℚ(μ_{p^∞}) ⊆ ℚ^ab with Gal(ℚ_∞/ℚ) ≅ ℤ_p; p is totally ramified, and for q ≠ p the Frobenius of q has image q in ℤ_p^×, which is not a root of unity, so its image in ℤ_p has infinite order and the decomposition group is infinite (Rubin, Remark II.1.2).
3. The ray class fields of ℚ modulo m∞ and m are ℚ(μ_m) and ℚ(μ_m)^+.

**Checks.**

- Every hypothesis of Definition II.1.1 is checked for this 𝒦 and N, not assumed.

**Sources.** **RUBIN-ES**, Chapter II, Definition 1.1, printed p. 21 (PDF p. 31). The hypotheses verified. **RUBIN-ES**, Chapter II, Remark 1.2, printed p. 22 (PDF p. 32). Condition (ii) for ℚ_∞.

**Direct dependencies.** `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`; `EulerSystemsAndKolyvaginSystems:ES.2/conductor-presentation`; `EulerSystemsAndKolyvaginSystems:ES.2/twisting`; `IntegralIwasawaTheory:I.1`; `IntegralIwasawaTheory:L0/compatible-cyclotomic-tower`.

<a id="cyclotomic-kummer-classes"></a>
### Kummer classes of the cyclotomic numbers

**Target `EulerSystemsCyclotomicMainConjecture:L0/cyclotomic-kummer-classes`**.

For N ≥ 0 and m ≥ 1, κ_N(c̃_m) ∈ H¹(G_{ℚ(μ_m)}, μ_{p^N}) is the Tau Ceti Kummer class of c̃_m (TauCeti.kummerMap, n = p^N invertible in characteristic 0), and likewise κ_N(c̃_m^+) over ℚ(μ_m)^+. The classes are compatible in N, and define κ(c̃_m) ∈ H¹(ℚ(μ_m), ℤ_p(1)) = lim_N H¹(ℚ(μ_m), μ_{p^N}) = (ℚ(μ_m)^×)^, Rubin's (1).

**Hypotheses and conventions.**

- p prime; p^N is invertible in every number field.
- Use the imported SelmerIwasawaCohomology:L0/kummer-limit-map and the existing ProfiniteCohomology Kummer isomorphism; no inverse-limit cohomology carrier is postulated here.

**Construction or proof.**

1. Apply TauCeti.kummerMap to c̃_m and c̃_m^+.
2. Compatibility in N: the p-th power map μ_{p^{N+1}} → μ_{p^N} commutes with the Kummer maps (connecting maps of compatible Kummer sequences; SelmerIwasawaCohomology:L0).
3. Norm compatibility: Cor ∘ κ = κ ∘ N (ProfiniteCohomology Layer 9, kummerIso_norm).

**API.**

- `TauCeti.CyclotomicEulerSystem.pCycKummerClass_eq_zero_iff` (characterisation): κ_N(c̃_m) = 0 iff c̃_m is a p^N-th power in ℚ(μ_m) (from TauCeti.kummerMap_eq_one_iff).
- `TauCeti.CyclotomicEulerSystem.pCycKummerClass_neg` (simp): For p odd, κ_N(−x) = κ_N(x): −1 = (−1)^{p^N}.
- `TauCeti.CyclotomicEulerSystem.pCycKummerClass_cor` (compatibility): Cor_{ℚ(μ_{mℓ})/ℚ(μ_m)} κ_N(x) = κ_N(N x) (ProfiniteCohomology Layer 9).
- `TauCeti.CyclotomicEulerSystem.pCycKummerClass_galois` (functoriality): σ κ_N(x) = κ_N(σ x) for σ ∈ Gal(ℚ(μ_m)/ℚ).
- `TauCeti.CyclotomicEulerSystem.pCycKummerClass_compatible` (relation): The image of κ_{N+1}(x) under μ_{p^{N+1}} → μ_{p^N} is κ_N(x).

**Uses.** Rubin, Chapter III §2.1 (1): c̃ is read in H¹(ℚ(μ_m), ℤ_p(1)). EulerSystemsCyclotomicMainConjecture:L1: the derivative classes are built from these Kummer classes (ES.3).

**Unit tests.**

- `kummer_p_ne_zero` (value): κ_1(c̃_1) = κ_1(p) ≠ 0 in H¹(G_ℚ, μ_p).
- `kummer_pth_power` (degenerate): κ_N(x^{p^N}) = 0 for every x.
- `kummer_torsion_invisible` (non-example): For p = 5, κ_N(c̃_3) = 0 because c̃_3 = −ζ_3 has order prime to 5; RJW's −ξ^{−1} behaves the same way away from p.

**Checks.**

- κ_1(c̃_1) = κ_1(p) ≠ 0 in H¹(G_ℚ, μ_p), as p is not a p-th power in ℚ (TauCeti.kummerMap_eq_one_iff).
- For p = 5, κ_N(c̃_3) = κ_N(−ζ_3) = 0: −ζ_3 has order 6, prime to 5, so it is a 5^N-th power.

**Sources.** **RUBIN-ES**, Chapter III, §2.1, printed p. 34 (PDF p. 44). The identification used to view c̃ as cohomology classes. **RJW-PADIC-L**, §10.5, (10.5)–(10.7), printed p. 52 (arXiv v2). The finite-level Kummer map, as in TauCeti.kummerMap_eq_kummerCocycleClass.

**Direct dependencies.** `tauceti:TauCeti.kummerMap`; `tauceti:TauCeti.kummerMap_eq_one_iff`; `tauceti:TauCeti.KummerCoeff`; [L0/p-extended-cyclotomic-number](#p-extended-cyclotomic-number); [L0/real-p-extended-number](#real-p-extended-number); `SelmerIwasawaCohomology:L0/kummer-limit-map`.

<a id="cyclotomic-euler-system"></a>
### The Euler system of cyclotomic units

**Target `EulerSystemsCyclotomicMainConjecture:L0/cyclotomic-euler-system`** · atlas planet: Euler system of cyclotomic units.

The classes κ(c̃_m) ∈ H¹(ℚ(μ_m), ℤ_p(1)) and κ(c̃_m^+) ∈ H¹(ℚ(μ_m)^+, ℤ_p(1)) form an Euler system for (ℤ_p(1), ℚ^ab, p) in the sense of EulerSystemsAndKolyvaginSystems:ES.2 (Rubin, Definition II.1.1, through the conductor presentation of Remark II.1.3). For every m and prime q ≠ p, Cor κ(c̃_{mq}) = P(Fr_q^{−1} | ℤ_p(1)^*; Fr_q^{−1}) κ(c̃_m) = (1 − Fr_q^{−1})κ(c̃_m) if q ∤ m and = κ(c̃_m) if q ∣ m; Cor κ(c̃_{mp}) = κ(c̃_m); the same holds for c̃^+; and Cor_{ℚ(μ_m)/ℚ(μ_m)^+} κ(c̃_m) = κ(c̃_m^+). RJW's Definition 10.16 convention, P_ℓ(V^*(1), σ_ℓ^{−1}) with V = ℚ_p(1), gives the same factor 1 − σ_ℓ^{−1}.

**Hypotheses and conventions.**

- p prime, 𝒦 = ℚ^ab, N = p.
- ℤ_p(1)^* = Hom(ℤ_p(1), ℤ_p(1)) = ℤ_p with trivial action, so P(Fr_q^{−1}|T^*; x) = 1 − x.

**Construction or proof.**

1. The hypotheses on (𝒦, N) hold (qab-euler-hypotheses).
2. Kummer classes turn norms into corestrictions (cyclotomic-kummer-classes).
3. The unit relations are p-extended-tower-relation, p-extended-auxiliary-relation and real-relations.
4. ES.2's conductor presentation turns these relations into an Euler system for the fields in ℚ^ab.

**Checks.**

- The system is not torsion (p-extended-nontorsion); in particular it is not RJW's c_m.

**Sources.** **RUBIN-ES**, Chapter III, §2.1, printed p. 34 (PDF p. 44). The theorem. **RJW-PADIC-L**, §10.5, Definition 10.16, printed p. 53 (arXiv v2). The same Euler factor in RJW's convention. **RJW-PADIC-L**, Definition 10.16, printed p. 53; Appendix B.3, printed p. 81; §2.2.4, printed pp. 7–8. The cohomological Euler-system family and its Rubin conductor presentation are compared with the generic ES.2 carrier; the notes announce the unconditional main conjecture whose proof is planned here.

**Direct dependencies.** [L0/qab-euler-hypotheses](#qab-euler-hypotheses); [L0/cyclotomic-kummer-classes](#cyclotomic-kummer-classes); [L0/p-extended-tower-relation](#p-extended-tower-relation); [L0/p-extended-auxiliary-relation](#p-extended-auxiliary-relation); [L0/real-relations](#real-relations); `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`; `EulerSystemsAndKolyvaginSystems:ES.2/conductor-presentation`; `EulerSystemsAndKolyvaginSystems:ES.2/twisting`; `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`.

<a id="chi-component"></a>
### χ-components

**Target `EulerSystemsCyclotomicMainConjecture:L0/chi-component`** · atlas planet: χ-components.

Let O be a commutative ring, Δ a finite group, M an O[Δ]-module and χ : Δ → O^× a character. The χ-component is M^χ = {x ∈ M : δx = χ(δ)x for all δ ∈ Δ}, an O-submodule. For a ℤ[Δ]-module B, Rubin's B^χ is (B̂ ⊗_{ℤ_p} O)^χ, with B̂ the p-adic completion (B ⊗ ℤ_p for B finitely generated). Equivalently B^χ ≅ (B̂ ⊗ O_{χ^{−1}})^Δ after fixing a generator of O_{χ^{−1}}.

**Hypotheses and conventions.**

- The χ-functor is exact when |Δ| is invertible in O. A decomposition into one-dimensional character components also requires Δ abelian and O to contain all character values.
- When p divides |Δ| the character functors are those of layer L4 (Greither); this node is the prime-to-p case.

**Construction or proof.**

1. Definition as an eigen-submodule; closure under 0, + and O-scalars uses only that O is commutative.
2. The twist description is Mathlib's invariants (Representation.invariants) of ρ ⊗ χ^{−1}.
3. Exactness and the decomposition use the idempotents |Δ|^{−1}∑ χ(δ)^{−1}δ (chi-sum), as for Representation.averageMap.

**API.**

- `TauCeti.CyclotomicEulerSystem.mem_chiComponent` (characterisation): x ∈ M^χ iff δx = χ(δ)x for all δ.
- `TauCeti.CyclotomicEulerSystem.mem_chiComponent_iff_twist` (equivalence): x ∈ M^χ iff χ(δ)^{−1}δx = x for all δ: M^χ is the Δ-invariants of the twist by χ^{−1}, Rubin's (B̂ ⊗ O_{χ^{−1}})^Δ.
- `TauCeti.CyclotomicEulerSystem.chiComponent_map` (functoriality): Δ-equivariant O-linear maps send M^χ into N^χ.
- `TauCeti.CyclotomicEulerSystem.chiComponent_map_eq` (structure): If |Δ| is a unit, M↦M^χ is exact. If in addition Δ is abelian and O contains every character value, M=⊕χ M^χ.

**Uses.** Rubin, Chapter III (3): H¹(ℚ_n, T^*) ≅ (L_n^×)^χ. Rubin, Chapter III Definition 2.2: E_n^χ and C_{n,χ}. Rubin, Chapter III Theorem 2.3: |A_L^χ| and [E_L^χ : C_{L,χ}]. EulerSystemsCyclotomicMainConjecture:L2: the Λ-modules A_∞^χ, E_∞^χ, C_{∞,χ}.

**Unit tests.**

- `chiComponent_one` (compatibility): For χ = 1, M^χ is Mathlib's ρ.invariants.
- `chiComponent_trivial_rep` (degenerate): Trivial action and χ(δ) − 1 a nonzerodivisor for some δ: M^χ = 0.
- `chiComponent_regular` (value): For |Δ| ∈ O^×, O[Δ]^χ is free of rank one on ∑_δ χ(δ)^{−1}[δ].
- `chiComponent_not_split` (non-example): For Δ=C_p acting regularly on M=𝔽_p[Δ], M^1 is the one-dimensional span of the norm element. The augmentation M→𝔽_p induces the zero map on invariants, although it is surjective on M; invariants are not exact here.

**Checks.**

- The trivial character gives the invariants.

**Sources.** **RUBIN-ES**, Chapter I, §6.2, Definition 6.2, printed p. 14 (PDF p. 24). The definition. **RUBIN-ES**, Chapter I, §6.2, printed p. 15 (PDF p. 25). The exactness and decomposition API.

**Direct dependencies.** `mathlib:Representation.invariants`; `mathlib:Representation.mem_invariants`; `mathlib:Representation.averageMap`.

<a id="chi-sum"></a>
### Twisted sums

**Target `EulerSystemsCyclotomicMainConjecture:L0/chi-sum`**.

For an O[Δ]-module M, χ : Δ → O^× and x ∈ M, chiSum_χ(x) = ∑_{δ∈Δ} χ(δ)^{−1} δx. For M = L^× ⊗ O written additively this is the product ∏_δ (δx)^{χ^{−1}(δ)} of Rubin's (4) and Definition 2.2.

**Hypotheses and conventions.**

- Δ finite; no invertibility of |Δ| is needed to define it.

**Construction or proof.**

1. Finite sum.
2. χ(δε)^{−1} = χ(δ)^{−1}χ(ε)^{−1} gives ε·chiSum(x) = χ(ε)chiSum(x), so chiSum lands in M^χ.

**API.**

- `TauCeti.CyclotomicEulerSystem.chiSum_mem` (other): chiSum_χ(x) ∈ M^χ.
- `TauCeti.CyclotomicEulerSystem.chiSum_add` (simp): chiSum_χ is additive, indeed O-linear.
- `TauCeti.CyclotomicEulerSystem.chiSum_of_mem` (simp): For x ∈ M^χ, chiSum_χ(x) = |Δ|·x.
- `TauCeti.CyclotomicEulerSystem.chiSum_chiSum` (relation): chiSum_χ ∘ chiSum_χ = |Δ|·chiSum_χ; for |Δ| ∈ O^× this gives the idempotent projection onto M^χ.

**Uses.** EulerSystemsCyclotomicMainConjecture:L0/chi-cyclotomic-generator: ξ_{L,χ} = chiSum(1 ⊗ u). Rubin, Chapter III (6): the identity c_ℚ = ξ^{1 − χ^{−1}(p)}.

**Unit tests.**

- `chiSum_trivial` (degenerate): Trivial character on a trivial module: chiSum_1(x) = |Δ|·x.
- `chiSum_trivial_group` (degenerate): For the trivial group, chiSum is the identity.
- `chiSum_sign_regular` (value): For Δ=C₂={1,s}, O=ℤ, χ(s)=−1 and the regular module, chiSumχ([1])=[1]−[s]. The ordinary trace [1]+[s] is a wrong answer.

**Checks.**

- On M^χ, chiSum is multiplication by |Δ|.

**Sources.** **RUBIN-ES**, Chapter III, §2.2, display (4), printed p. 35 (PDF p. 45). The twisted products are chiSum. **RUBIN-ES**, Chapter III, §2.4, Definition 2.2, printed p. 35 (PDF p. 45). ξ_{n,χ} is a twisted product.

**Direct dependencies.** [L0/chi-component](#chi-component).

<a id="chi-sum-frobenius"></a>
### Twisted sums and the Frobenius factor

**Target `EulerSystemsCyclotomicMainConjecture:L0/chi-sum-frobenius`**.

For φ ∈ Δ and u ∈ M: chiSum_χ(u − φ^{−1}u) = (1 − χ(φ)^{−1})·chiSum_χ(u).

**Hypotheses and conventions.**

- Δ finite, χ : Δ → O^× a homomorphism; Δ need not be abelian.

**Construction or proof.**

1. chiSum_χ(φ^{−1}u) = ∑_δ χ(δ)^{−1}δφ^{−1}u; reindex δ' = δφ^{−1}, so χ(δ)^{−1} = χ(δ')^{−1}χ(φ)^{−1}.

**Checks.**

- φ = 1 gives 0 = 0; for χ(φ) = 1 the right side vanishes.

**Sources.** **RUBIN-ES**, Chapter III, proof of Theorem 2.3, equation (6), printed p. 36 (PDF p. 46). The algebra behind (6), with φ the Frobenius of p.

**Direct dependencies.** [L0/chi-sum](#chi-sum).

<a id="one-sub-root-of-unity-unit"></a>
### 1 − ω is a unit for roots of unity of invertible order

**Target `EulerSystemsCyclotomicMainConjecture:L0/one-sub-root-of-unity-unit`**.

In a commutative domain O, if ω^n = 1, ω ≠ 1 and n ∈ O^×, then 1 − ω ∈ O^×. In particular, for χ of order prime to p and χ(p) ≠ 1, 1 − χ^{−1}(p) ∈ O^×.

**Hypotheses and conventions.**

- O a domain; n a unit of O (for O the integers of a finite extension of ℚ_p: p ∤ n).

**Construction or proof.**

1. (ω − 1) divides n (sub_one_dvd_natCast_of_pow_eq_one), and n is a unit, so ω − 1 and 1 − ω are units (isUnit_of_dvd_unit).

**Checks.**

- Fails without invertibility: 1 − (−1) = 2 is not a unit of ℤ_2.

**Sources.** **RUBIN-ES**, Chapter III, proof of Theorem 2.3, equation (6), printed p. 36 (PDF p. 46). Since χ(p) ≠ 1 and χ has order prime to p, 1 − χ^{−1}(p) ∈ O×.

**Direct dependencies.** `mathlib:sub_one_dvd_natCast_of_pow_eq_one`; `mathlib:isUnit_of_dvd_unit`.

<a id="chi-cyclotomic-generator"></a>
### The χ-cyclotomic generators ξ_{n,χ}

**Target `EulerSystemsCyclotomicMainConjecture:L0/chi-cyclotomic-generator`**.

Let χ be an even nontrivial character of G_ℚ of finite order prime to p, with conductor f, fixed field L and Δ = Gal(L/ℚ); let ℚ_n ⊆ ℚ(μ_{p^{n+1}}) be the layers of ℚ_∞ and L_n = Lℚ_n, so Gal(L_n/ℚ_n) = Δ. Put u_0 = N_{ℚ(μ_f)/L}(1 − ζ_f) and, for n > 0, u_n = N_{ℚ(μ_{fp^{n+1}})/L_n}(1 − ζ_{fp^{n+1}}). Then ξ_{n,χ} = chiSum_χ(1 ⊗ u_n) ∈ (O ⊗ L_n^×)^χ. It equals Rubin's ∏_{δ∈Gal(ℚ(μ_f)/ℚ)} (ζ_f^δ − 1)^{χ^{−1}(δ)} (n = 0), respectively the product over Gal(ℚ_n(μ_{fp^{n+1}})/ℚ_n) (n > 0).

**Hypotheses and conventions.**

- χ even, nontrivial, of order prime to p (Rubin §III.2.2); χ is viewed as a Dirichlet character modulo f with χ(q) = 0 for q ∣ f.
- The sign convention is immaterial: ∑ χ^{−1}(δ) = 0 over each group, since χ is nontrivial on it, so (−1) contributes (−1)^0.

**Construction or proof.**

1. Rewrite Rubin's product over Gal(ℚ(μ_f)/ℚ) by grouping δ by its restriction to L: χ^{−1}(δ) depends only on δ|_L, and the inner product is the norm to L. This keeps ξ in L_n^× ⊗ O without a descent step (p may divide [ℚ(μ_f) : L]).
2. chiSum lands in the χ-component (chiSum_mem).

**API.**

- `TauCeti.CyclotomicEulerSystem.xiChi_mem` (other): ξ_{n,χ} ∈ (O ⊗ L_n^×)^χ.
- `TauCeti.CyclotomicEulerSystem.xiChi_neg` (compatibility): The ζ − 1 and 1 − ζ conventions give the same ξ for χ ≠ 1.
- `TauCeti.CyclotomicEulerSystem.xiChi_eq_prod` (characterisation): ξ_{n,χ} is Rubin's product over Gal(ℚ(μ_f)/ℚ) (n = 0) or Gal(ℚ(μ_{fp^{n+1}})/ℚ_n) (n > 0).
- `TauCeti.CyclotomicEulerSystem.xiChi_smul` (simp): δ ξ_{n,χ} = χ(δ) ξ_{n,χ} for δ ∈ Δ.

**Uses.** Rubin, Chapter III Definition 2.2: generator of C_{n,χ}. Rubin, Chapter III (6): c_ℚ = ξ_{L,χ}^{1 − χ^{−1}(p)}. EulerSystemsCyclotomicMainConjecture:L2: C_{∞,χ} = lim C_{n,χ}.

**Unit tests.**

- `xiChi_conductor_five` (value): χ quadratic of conductor 5, p = 3: ξ_{L,χ} = ε^{−2}.
- `xiChi_sign` (compatibility): Replacing 1 − ζ_f by ζ_f − 1 leaves ξ unchanged.
- `xiChi_trivial_character` (non-example): For χ = 1 and f = ℓ^k the analogous product Φ_{ℓ^k}(1) = ℓ is not a unit: nontriviality is needed.

**Checks.**

- For χ the quadratic character of conductor 5 and p = 3: L = ℚ(√5), u_0 = (1 − ζ_5)(1 − ζ_5^{−1}) = (5 − √5)/2 and ξ_{L,χ} = u_0/σ(u_0) = (3 − √5)/2 = ε^{−2}, with ε = (1 + √5)/2.

**Sources.** **RUBIN-ES**, Chapter III, §2.4, Definition 2.2, printed p. 35 (PDF p. 45). The definition of ξ_{n,χ} and C_{n,χ}. **RUBIN-ES**, Chapter III, §2.2, printed pp. 34–35 (PDF pp. 44–45). The standing hypotheses.

**Direct dependencies.** [L0/chi-sum](#chi-sum); [L0/chi-component](#chi-component); `IntegralIwasawaTheory:L0/tower-galois-compatibility`; `IntegralIwasawaTheory:I.1`.

<a id="chi-cyclotomic-generator-unit"></a>
### ξ_{n,χ} is a unit

**Target `EulerSystemsCyclotomicMainConjecture:L0/chi-cyclotomic-generator-unit`**.

For χ ≠ 1, ξ_{n,χ} lies in the image of O ⊗ E_n → O ⊗ L_n^×, E_n the global units of L_n; so ξ_{n,χ} ∈ E_n^χ.

**Hypotheses and conventions.**

- χ nontrivial; conductors as in chi-cyclotomic-generator.

**Construction or proof.**

1. If the conductor g (f, respectively fp^{n+1}) of the root is not a prime power, 1 − ζ_g is a unit (IntegralIwasawaTheory:L0), so u_n ∈ E_n.
2. If g = ℓ^k, the ideal (1 − ζ_g) is the unique prime above ℓ in ℚ(μ_g) (IsCyclotomicExtension.Rat.eq_span_zeta_sub_one_of_liesOver, with conjugates associated by IsPrimitiveRoot.associated_sub_one_pow_sub_one_of_coprime); its norm to L_n is a Δ-invariant ideal, and ∑ χ^{−1}(δ) = 0 kills it in the ideal group ⊗ O.
3. L_n^×/E_n is torsion-free (principal ideals), so O ⊗ E_n → O ⊗ L_n^× is injective with image the elements of trivial valuation.

**Checks.**

- The prime-power case (for example f = 5) is where the χ-part argument is needed.

**Sources.** **RUBIN-ES**, Chapter III, §2.4, Definition 2.2, printed p. 35 (PDF p. 45). Rubin places ξ_{n,χ} in E^χ_n.

**Direct dependencies.** [L0/chi-cyclotomic-generator](#chi-cyclotomic-generator); `mathlib:IsCyclotomicExtension.Rat.eq_span_zeta_sub_one_of_liesOver`; `mathlib:IsPrimitiveRoot.associated_sub_one_pow_sub_one_of_coprime`; `mathlib:NumberField.RingOfIntegers`; `IntegralIwasawaTheory:L0/abelian-circular-unit-variant`.

<a id="chi-cyclotomic-units"></a>
### The χ-cyclotomic units C_{n,χ}

**Target `EulerSystemsCyclotomicMainConjecture:L0/chi-cyclotomic-units`** · atlas planet: χ-cyclotomic units.

C_{n,χ} is the O[Gal(L_n/ℚ)]-submodule of E_n^χ generated by ξ_{n,χ}. Since Δ acts on E_n^χ through χ, it is the O[Gal(L_n/L)]-span of ξ_{n,χ}; for n = 0, C_{L,χ} = O·ξ_{L,χ}.

**Hypotheses and conventions.**

- χ even, nontrivial, of order prime to p.

**Construction or proof.**

1. Span of the generator; chi-cyclotomic-generator-unit places it in E_n^χ.

**API.**

- `TauCeti.CyclotomicEulerSystem.chiCyclotomicUnits_le` (other): C_{n,χ} ⊆ E_n^χ ⊆ (O ⊗ L_n^×)^χ.
- `TauCeti.CyclotomicEulerSystem.chiCyclotomicUnits_stable` (structure): C_{n,χ} is Gal(L_n/ℚ)-stable.
- `TauCeti.CyclotomicEulerSystem.chiCyclotomicUnits_eq_span` (characterisation): The O[Δ]-span of ξ_{L,χ} equals its O-span, so C_{L,χ} = O·ξ_{L,χ}.
- `TauCeti.CyclotomicEulerSystem.chiCyclotomicUnits_index_finite` (other): [E_L^χ : C_{L,χ}] < ∞ (index formula requested from IntegralIwasawaTheory:L0).

**Uses.** Rubin, Chapter III Theorem 2.3: |A_L^χ| divides [E_L^χ : C_{L,χ}]. EulerSystemsCyclotomicMainConjecture:L1: the index of divisibility ind_O(c) = ℓ_O(E_L^χ/C_{L,χ}).

**Unit tests.**

- `chiCyclotomicUnits_conductor_five` (value): χ quadratic of conductor 5, p = 3: E_L^χ = ℤ_3·ε and C_{L,χ} = ℤ_3·ε^{−2} have index 1, matching |A_L^χ| = 1 (h(ℚ(√5)) = 1) in Rubin's Corollary 2.4.
- `chiCyclotomicUnits_conductor_five_p5` (value): The same χ with p = 5 (so p ∣ f and χ(p) = 0): again index 1.
- `chiCyclotomicUnits_torsion_choice` (non-example): Built from RJW's torsion c_m, the span would be 0 in E_L^χ.

**Checks.**

- For n = 0, [E_L^χ : C_{L,χ}] is finite; this is the index formula of IntegralIwasawaTheory:L0 (L(1, χ) ≠ 0).

**Sources.** **RUBIN-ES**, Chapter III, §2.4, Definition 2.2, printed p. 35 (PDF p. 45). The definition.

**Direct dependencies.** [L0/chi-cyclotomic-generator](#chi-cyclotomic-generator); [L0/chi-cyclotomic-generator-unit](#chi-cyclotomic-generator-unit); [L0/chi-component](#chi-component); `IntegralIwasawaTheory:L0/abelian-circular-unit-variant`; `IntegralIwasawaTheory:L0/general-conductor-index`.

<a id="twisted-class-formula"></a>
### The twisted class c_ℚ

**Target `EulerSystemsCyclotomicMainConjecture:L0/twisted-class-formula`**.

Let c = c̃^{χ^{−1}} be the twist by χ^{−1} of the Euler system of cyclotomic units (ES.2, Rubin Proposition II.4.2), an Euler system for (T^*, ℚ^ab, pf) with T = O_χ, T^* = ℤ_p(1) ⊗ χ^{−1}. Under the restriction–Kummer isomorphism H¹(ℚ, T^*) ≅ (L^×)^χ ⊆ L^× ⊗̂ O (Rubin (3)), c_ℚ corresponds to chiSum_χ(1 ⊗ N_{ℚ(μ_{fp})/L}(1 − ζ_{fp})) = ∏_{δ∈Gal(ℚ(μ_{fp})/ℚ)} (1 − ζ_{fp}^δ)^{χ^{−1}(δ)}.

**Hypotheses and conventions.**

- χ even, nontrivial, of order prime to p, conductor f; [L : ℚ] prime to p.

**Construction or proof.**

1. ES.2's twisting lemma (Rubin Lemma II.4.3) with F = ℚ and L' = ℚ(μ_f)^+, which has the same conductor as L because χ is even, gives ∏_{δ∈Gal(ℚ(μ_f)^+/ℚ)} (δc̃_f^+)^{χ^{−1}(δ)}.
2. c̃_f^+ = N_{ℚ(μ_f)/ℚ(μ_f)^+}N_{ℚ(μ_{fp})/ℚ(μ_f)}(1 − ζ_{fp}), so the product is the one over Gal(ℚ(μ_{fp})/ℚ); the sign convention is immaterial for χ ≠ 1.

**Checks.**

- For p ∣ f the norm N_{ℚ(μ_{fp})/ℚ(μ_f)}(1 − ζ_{fp}) is 1 − ζ_f.

**Sources.** **RUBIN-ES**, Chapter III, §2.2, display (4), printed p. 35 (PDF p. 45). The theorem. **RUBIN-ES**, Chapter III, §2.2, display (3), printed p. 35 (PDF p. 45). The dictionary (3), requested from SelmerIwasawaCohomology:L0.

**Direct dependencies.** [L0/cyclotomic-euler-system](#cyclotomic-euler-system); [L0/real-p-extended-number](#real-p-extended-number); [L0/chi-sum](#chi-sum); `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`; `EulerSystemsAndKolyvaginSystems:ES.2/conductor-presentation`; `EulerSystemsAndKolyvaginSystems:ES.2/twisting`; `SelmerIwasawaCohomology:L0`.

<a id="twisted-class-eq-xi-power"></a>
### c_ℚ = ξ_{L,χ}^{1 − χ^{−1}(p)}

**Target `EulerSystemsCyclotomicMainConjecture:L0/twisted-class-eq-xi-power`** · atlas planet: Twisted cyclotomic class.

With χ as above and χ(p) = 0 when p ∣ f: c_ℚ = ξ_{L,χ}^{1 − χ^{−1}(p)} in (L^×)^χ, that is chiSum_χ(1 ⊗ N_{ℚ(μ_{fp})/L}(1 − ζ_{fp})) = (1 − χ^{−1}(p))·ξ_{L,χ}.

**Hypotheses and conventions.**

- χ even, nontrivial, of order prime to p, conductor f.

**Construction or proof.**

1. By twisted-class-formula, c_ℚ is chiSum_χ(1 ⊗ u') with u' = N_{ℚ(μ_f)/L}(N_{ℚ(μ_{fp})/ℚ(μ_f)}(1 − ζ_{fp})).
2. If p ∤ f, the inner norm is (1 − ζ_f)^{1 − Fr_p^{−1}} (distribution-relation-frobenius), so u' = u_0 − Fr_p^{−1}u_0 additively; chi-sum-frobenius with φ = Fr_p|_L gives (1 − χ(Fr_p)^{−1})ξ_{L,χ} = (1 − χ^{−1}(p))ξ_{L,χ}.
3. If p ∣ f, the inner norm is 1 − ζ_f (distribution-relation-of-dvd), so c_ℚ = ξ_{L,χ} = ξ_{L,χ}^{1 − 0}.

**Checks.**

- For χ(p) = 1 the class c_ℚ is trivial: this is the source of Rubin's hypothesis χ(p) ≠ 1 (Remark III.2.1).

**Sources.** **RUBIN-ES**, Chapter III, proof of Theorem 2.3, equation (6), printed p. 36 (PDF p. 46). Equation (6).

**Direct dependencies.** [L0/twisted-class-formula](#twisted-class-formula); [L0/chi-cyclotomic-generator](#chi-cyclotomic-generator); [L0/chi-sum-frobenius](#chi-sum-frobenius); [L0/distribution-relation-frobenius](#distribution-relation-frobenius); [L0/distribution-relation-of-dvd](#distribution-relation-of-dvd).

<a id="twisted-class-generates"></a>
### c_ℚ generates C_{L,χ} when χ(p) ≠ 1

**Target `EulerSystemsCyclotomicMainConjecture:L0/twisted-class-generates`**.

If χ(p) ≠ 1, then 1 − χ^{−1}(p) ∈ O^× and c_ℚ generates C_{L,χ} = O·ξ_{L,χ}.

**Hypotheses and conventions.**

- χ of order prime to p, χ(p) ≠ 1 (including χ(p) = 0 when p ∣ f).

**Construction or proof.**

1. χ^{−1}(p) is 0 or a root of unity ω ≠ 1 of order dividing ord χ, prime to p; then one-sub-root-of-unity-unit makes 1 − ω a unit.
2. c_ℚ = (1 − χ^{−1}(p))ξ_{L,χ} (twisted-class-eq-xi-power) and C_{L,χ} = O·ξ_{L,χ} (chi-cyclotomic-units).

**Checks.**

- For χ(p) = 1 the conclusion fails: c_ℚ = 0.

**Sources.** **RUBIN-ES**, Chapter III, proof of Theorem 2.3, equation (6), printed p. 36 (PDF p. 46). The last sentence.

**Direct dependencies.** [L0/twisted-class-eq-xi-power](#twisted-class-eq-xi-power); [L0/one-sub-root-of-unity-unit](#one-sub-root-of-unity-unit); [L0/chi-cyclotomic-units](#chi-cyclotomic-units).

<a id="unsmoothed-cyclotomic-euler-system"></a>
### The unsmoothed cyclotomic Euler system

**Target `EulerSystemsCyclotomicMainConjecture:L0/unsmoothed-cyclotomic-euler-system`**.

Let p be odd, χ a nontrivial even finite-order character of order prime to p and conductor f prime to p, O=ℤ_p[χ], and T=O(1)⊗χ⁻¹. For m>1 prime to p set b_m=(ζ_m−1)(ζ_m⁻¹−1) in ℚ(μ_m)⁺ and b_1=1. Apply Kummer and the imported finite-character twisting map to this family. The resulting c^unsm is an Euler system for (T,𝒦,fp), where 𝒦=∪_{(m,p)=1}ℚ(μ_m), using the rigidity alternative rather than containment of a ℤ_p-extension. Its initial class generates C_{L,χ}, up to the unit factor 2 coming from realification, including when χ(p)=1.

**Hypotheses and conventions.**

- Compatible roots and arithmetic Frobenius as in L0. The raw b_m family is not itself an Euler system: at m=ℓ prime it has a nonzero ℓ-valuation and fails the required finite condition.
- The twist uses the restriction–Kummer character isomorphism, not a formal change of coefficients on an arbitrary single class. The extension 𝒦 is unramified at p. Source issue E19 corrects the draft’s contradictory field description.

**Construction or proof.**

1. For conductors m>1 the b_m are real norms of 1−ζ_m and obey the nondegenerate auxiliary distribution relation. The raw family is not an Euler system at the base conductor: b_1=1, while the norm of b_ℓ to ℚ is ℓ. After twisting by a nontrivial χ the base-conductor valuation/norm obstruction vanishes in the χ-component.
2. Use ES.2/rigidity-variants: choose γ∈G_{ℚ(μ_{p∞})} with χ(γ)≠1. Then γ−1 is injective on T; the finite-order Frobenius and congruence alternative is verified by Rubin IV Example 8.2.
3. Twisting kills the valuation obstruction at conductor f. Since χ is even, b_f has χ-sum 2ξ_{L,χ}; 2 and the prime-to-p twisting normalisation are units, so its span is C_{L,χ}. No Euler factor 1−χ⁻¹(p) is inserted.

**API.**

- `unsmoothedEulerSystem_class` (data): Its class at conductor m is the finite-character twist of κ(b_m), with the imported conductor presentation.
- `unsmoothedEulerSystem_norm` (compatibility): Corestriction from an auxiliary prime q has factor 1−χ⁻¹(q)Fr_q⁻¹ in the twisted representation, as specified by ES.2’s Tate-dual Euler polynomial.
- `unsmoothedEulerSystem_initial_span` (characterisation): The initial class spans C_{L,χ} for every such χ, including χ(p)=1.

**Uses.** Rubin IX Theorem 1.2: Supplies initial classes without a vanishing p-Euler factor.. EulerSystemsAndKolyvaginSystems:ES.2/rigidity-variants: Tests an arithmetic example whose indexing extension contains no cyclotomic ℤ_p-extension..

**Unit tests.**

- `unsmoothed_base` (degenerate): b_1=1 gives zero in additive Kummer cohomology.
- `unsmoothed_prime` (non-example): b_ℓ has nonzero valuation at ℓ for ℓ≠p, so its raw class fails the finite local condition; accepting the raw family as an Euler system is wrong.
- `unsmoothed_split_p` (value): For the quadratic character of conductor 5 and p=11, χ(11)=1: the p-extended initial class is zero, while the unsmoothed initial class has the same nonzero span as ξ_{L,χ}.

**Checks.**

- Check the norm relations after twisting and verify the finite condition away from p at the initial conductor.
- At χ(p)=1 the initial span is C_{L,χ}, whereas the p-extended initial class vanishes.
- The extension contains conductors coprime to p and the proof uses rigidity alternative (b) or (c).

**Sources.** **RUBIN-ES**, Chapter IX §1, Example 1.1 and Theorem 1.2, printed pp. 133–136; Chapter IV Example 8.2, printed p. 78. The alternative cyclotomic-unit construction removes the vanishing initial Euler factor of the p-extended system.

**Direct dependencies.** [L0/real-relations](#real-relations); [L0/cyclotomic-kummer-classes](#cyclotomic-kummer-classes); [L0/chi-cyclotomic-units](#chi-cyclotomic-units); `EulerSystemsAndKolyvaginSystems:ES.2/twisting`; `EulerSystemsAndKolyvaginSystems:ES.2/rigidity-variants`; `SelmerIwasawaCohomology:L0`.

<a id="stickelberger-annihilator"></a>
### Smoothed Stickelberger annihilation

**Target `EulerSystemsCyclotomicMainConjecture:L0/stickelberger-annihilator`**.

For odd p, m≥1 and an odd integer b prime to mp, let θ_m=Σ_{a∈(ℤ/m)×}(a/m−1/2)σ_a⁻¹, θ_1=0. Then (b−σ_b)θ_m has integral group-ring coefficients and annihilates the ideal class group of ℚ(μ_m). Therefore θ̄_m of L0/stickelberger-class-family is integral and annihilates its p-class group in both cases p|m and p∤m.

**Hypotheses and conventions.**

- Use least nonnegative representatives a modulo m and arithmetic σ_a(ζ_m)=ζ_m^a. The extra factor 1−Fr_p⁻¹ is used only when p∤m.

**Construction or proof.**

1. For integrality, pair the terms under multiplication by b: (ba−⟨ba⟩)/m is an integer and (b−1)/2 is an integer.
2. For a prime ideal P away from mb, apply the imported Stickelberger Gauss-sum ideal relation. The ratio g(P)^b/σ_b(g(P)) lies in ℚ(μ_m), since the Galois action on the auxiliary additive-character root cancels. Its principal ideal is the smoothed θ-ideal power. Subtracting the half-norm term changes this by a rational principal ideal.
3. Ideal classes are generated by primes avoiding any prescribed finite set, so the smoothed operator annihilates the class group. Multiplication by the additional Euler factor preserves the annihilator property.

**Checks.**

- m=1 gives θ_1=0 and the zero operator.
- For m=3,b=5, θ_3=−(1/6)(1−j), and (5−j)θ_3=−(1−j), an integral operator.
- The finite-field Gauss ideal identity alone concerns g^m; the proof must justify descent of the smoothed ratio before asserting a class-group annihilator.

**Sources.** **RUBIN-ES**, Chapter III §4, Definition 4.1 and equations (7)–(8), printed p. 40; Definition 4.2 and its following annihilation argument, printed p. 41. The integral smoothed Stickelberger element annihilates the cyclotomic class group and thus defines the idèle-to-unit map used in the cohomology construction.

**Direct dependencies.** `FiniteFieldsAndCharacterSums:FF.1/stickelberger-relation`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`.

<a id="stickelberger-class-family"></a>
### The Stickelberger cohomology family

**Target `EulerSystemsCyclotomicMainConjecture:L0/stickelberger-class-family`**.

Fix odd p and an integer b prime to 2p. For m≥1 prime to b let F_m=ℚ(μ_m), θ_m=Σ_{a∈(ℤ/m)×}(a/m−1/2)σ_a⁻¹, and θ_1=0. Put θ̄_m=(b−σ_b)θ_m when p|m and θ̄_m=(b−σ_b)(1−Fr_p⁻¹)θ_m otherwise. Integral Stickelberger annihilation and global reciprocity, followed by (1−j) and Rubin’s local functional λ_m, give φ_m:J_{F_m}/(F_m×B_{F_m})→ℤ_p, with B_F=∏_(w|∞)F_w× ×∏_(w|p){1}×∏_(w∤p∞)O_(F,w)×, and hence d_m∈H¹(F_m,ℤ_p). Extend the family by the conductor presentation. It has auxiliary norm polynomial 1−x, is odd under j, and has trivial corestriction to the real subfield.

**Hypotheses and conventions.**

- Use the idèle class quotient modulo the local factors away from p. Multiplication by θ̄_m sends the class-group quotient into the semilocal units modulo the closure of global units. The map 1−j kills global units modulo torsion in this quotient.
- λ_m is the actual homomorphism on local units modulo torsion of Rubin Appendix D Definition 1.2. Its compatibility is Lemma D.1.4; it is not a freely chosen functional. The coefficient representation here is trivial ℤ_p.

**Construction or proof.**

1. Use the integral Stickelberger annihilator to construct the induced map from the idèle class quotient to semilocal units/global units.
2. Apply 1−j, then the imported λ_m, obtaining a continuous ℤ_p-valued character. Global reciprocity identifies this with H¹(F_m,ℤ_p).
3. Check the norm diagrams using Lemma D.1.4 and distribution of θ̄_m. Proposition III.4.3 gives norm polynomial 1−x; use the odd projection for the real corestriction.

**API.**

- `stickelbergerFamily_character` (characterisation): Under global class field theory d_m is the continuous character φ_m constructed from θ̄_m and λ_m.
- `stickelbergerFamily_corestriction` (compatibility): For auxiliary q its raw norm relation is cor(d_{mq})=(1−Fr_q⁻¹)d_m.
- `stickelbergerFamily_odd` (simp): j acts by −1; corestriction to F_m⁺ is zero.

**Uses.** Rubin IX Example 6.2: Provides the actual input to Euler-factor replacement.. EulerSystemsAndKolyvaginSystems:ES.2/euler-factor-change: Checks replacement on a norm-compatible arithmetic family..

**Unit tests.**

- `stickelberger_one` (degenerate): θ_1=0, so the corresponding raw initial character is zero.
- `stickelberger_even` (value): Every even character component of d_m vanishes for odd p.
- `stickelberger_euler_factor` (non-example): The raw factor is 1−x. It differs from 1−q⁻¹x at every auxiliary q; calling the raw family an Euler system for trivial ℤ_p coefficients misses this factor.

**Checks.**

- The class corresponds to the displayed actual idèle character under global reciprocity.
- The raw norm polynomial is 1−x, including the restriction compatibility of λ_m.
- Even components vanish and the real corestriction is zero.

**Sources.** **RUBIN-ES**, Chapter III §4.1–4.3, printed pp. 40–42; Appendix D Definition 1.2 and Lemma 1.4, printed pp. 164–165. The raw Stickelberger family used by IX Example 6.2 has trivial, rather than Tate-twisted, coefficients.

**Direct dependencies.** `FiniteFieldsAndCharacterSums:FF.1/stickelberger-relation`; `ColemanPowerSeries:L3`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`; `EulerSystemsAndKolyvaginSystems:ES.2/conductor-presentation`; [L0/stickelberger-annihilator](#stickelberger-annihilator).

<a id="euler-factor-variant"></a>
### Euler-factor replacement for the Stickelberger family

**Target `EulerSystemsCyclotomicMainConjecture:L0/euler-factor-variant`**.

For the preceding raw family d, apply the imported Euler-factor replacement with f_q(x)=1−x and g_q(x)=1−q⁻¹x. It produces c^St_F∈H¹(F,ℤ_p), an Euler system for (ℤ_p,𝒦_b,pb), with 𝒦_b=∪_{(m,b)=1}ℚ(μ_m) the maximal abelian extension unramified at every prime dividing b. It agrees with d_F on the finite fields whose ramification is supported on pb, in particular at the permitted p-power cyclotomic layers. The operation changes the norm relations and preserves the coefficient representation ℤ_p.

**Hypotheses and conventions.**

- p is odd, b prime to 2p, and the raw family and permitted fields are those of L0/stickelberger-class-family. f_q(0)=g_q(0)=1.
- For trivial T=ℤ_p, T*=ℤ_p(1), arithmetic Fr_q acts on T* by q, and P(Fr_q⁻¹|T*;x)=1−q⁻¹x. The draft’s ℤ_p(1) in IX Example 6.2 is corrected in source issue E18.

**Construction or proof.**

1. Instantiate ES.2/euler-factor-change (Rubin IX Lemma 6.1) with the displayed two polynomials and the raw Stickelberger family.
2. Use its agreement on fields unramified outside pb. The generic lemma produces the new family in the same H¹(F,T), so T remains ℤ_p.
3. Verify its conductor-indexed local finite conditions and use the rigidity of the p-power subextension to identify it as an Euler system.

**API.**

- `stickelbergerEulerSystem_norm` (compatibility): cor(c^St_{F(q)})=(1−q⁻¹Fr_q⁻¹)c^St_F for every permitted auxiliary q.
- `stickelbergerEulerSystem_agrees` (simp): c^St_F=d_F when F is unramified outside pb.
- `stickelbergerEulerSystem_coefficients` (characterisation): Its values lie in H¹(F,ℤ_p); no Kummer identification with H¹(F,ℤ_p(1)) is asserted.

**Uses.** Rubin IX Example 6.2: Provides the requested arithmetic example of Euler-factor replacement.. L0/cyclotomic-euler-system: Separates the Stickelberger trivial-coefficient example from the cyclotomic-unit Tate-twist example..

**Unit tests.**

- `factor_variant_agreement` (value): At a permitted p-power cyclotomic field, the replacement class equals the raw class.
- `factor_variant_polynomial` (non-example): For q=2 and p odd, the target factor is 1−(1/2)x, not 1−x.
- `factor_variant_same_T` (compatibility): Applying the construction to the zero raw family gives the zero family in H¹(F,ℤ_p), with unchanged Galois action.

**Checks.**

- Verify congruence of f_q and g_q modulo q−1 and preserve the coefficient T=ℤ_p.
- At every field unramified outside pb the replacement agrees with the raw family.
- Check the target factor 1−q⁻¹Fr_q⁻¹ at a new auxiliary prime.

**Sources.** **RUBIN-ES**, Chapter IX §6, Lemma 6.1 and Example 6.2, printed pp. 141–143; Chapter III §4.1, printed pp. 40–42. Changing Euler factors converts the raw Stickelberger family into an Euler system without changing T.

**Direct dependencies.** [L0/stickelberger-class-family](#stickelberger-class-family); `EulerSystemsAndKolyvaginSystems:ES.2/euler-factor-change`; `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`; `EulerSystemsAndKolyvaginSystems:ES.2/euler-system-module`.

## L1 — Finite-level descent

Apply the imported error-tolerant Rubin bound to O(1)⊗χ⁻¹. The error terms vanish
by nontriviality and parity; this is distinct from asserting every
Mazur–Rubin hypothesis for the untwisted representation ℤ_p(1). The explicit
cyclotomic derivative adapter records its descent and local relations.
For χ(p)≠1 the initial class generates the circular-unit line and the strict
Selmer group is the class-group dual, yielding the finite class-group bound.

The finite equality combines the bound with the already-owned Gras target of
L4 for those auxiliary characters with ψ(p)=1, and with the precise finite
class-number product requested from IntegralIwasawaTheory L0. Only the
ψ(p)=1 subfields use the unramified Gras theorem, so the argument also treats
p dividing the original conductor without applying Greither outside its
hypotheses. This is a downstream application, not an input to L2 or to L4’s
proof.

<a id="cyclotomic-hypotheses-and-error-terms"></a>
### Hypotheses of Theorem II.2.2 and vanishing of its error terms for the cyclotomic twist

**Target `EulerSystemsCyclotomicMainConjecture:L1/cyclotomic-hypotheses-and-error-terms`**.

Let p > 2 and χ : G_ℚ → O^× even, nontrivial, of finite order prime to p, with conductor f and field L; T = O_χ, W = D_χ, T* = O_{χ^{−1}}(1), W* = T* ⊗ ℚ_p/ℤ_p. Then T* satisfies Hyp(ℚ, T*) with τ = 1, because rank_O T* = 1 (Remark II.2.4). For the Euler system c = c̃^{χ^{−1}} for (T*, ℚ^ab, pf), the field Ω of Theorem II.2.2 is L(μ_{p^∞}). Both error terms n_{W*} and n*_{W*} of Theorem II.2.2 vanish: H¹(Ω/ℚ, W) = 0 because χ ≠ 1 (Lemma III.1.1(i)), and H¹(Ω/ℚ, W*) = 0 because χ is even, so it is not congruent modulo p to the odd cyclotomic character (Lemma III.1.1(ii)).

**Hypotheses and conventions.**

- Theorem II.2.2 is applied to T* in place of T. Its bound is then on S_{Σ_p}(ℚ, W), the dual of W* being W.
- Over ℚ, K(1) = ℚ and (O_ℚ^×)^{1/p^∞} ⊂ ℚ(μ_{p^∞}), since ±1 are p-th powers for odd p. So Ω = ℚ(W*)ℚ(μ_{p^∞}) = L(μ_{p^∞}).

**Construction or proof.**

1. Rank one gives Hyp(ℚ, T*)(i) with τ = 1 and (ii) trivially (Remark II.2.4).
2. Lemma III.1.1: since |Δ| is prime to p, inflation–restriction gives H¹(Ω/ℚ, k_ρ) = Hom(Gal(Ω/L), k_ρ^Δ). This vanishes if ρ ≢ 1 mod p, and then H¹(Ω/ℚ, D_ρ) = 0 by dévissage. Take ρ = χ, and ρ = χ^{−1}ε_cyc, which is odd while χ is even, so ρ ≢ 1 for p > 2.

**Checks.**

- χ = 1 is excluded: then H¹(Ω/ℚ, W) ≠ 0 in general.
- An odd χ can be congruent to ε_cyc (for instance χ = ω), which is why χ is even here.

**Sources.** **RUBIN-ES**, Chapter III, proof of Theorem 2.3, printed p. 36. Hyp(ℚ, T*) with τ = 1. **RUBIN-ES**, Chapter III, proof of Theorem 2.3, printed p. 36. The vanishing of both error terms. **RUBIN-ES**, Chapter III, Lemma 1.1, printed p. 33. Lemma III.1.1(ii).

**Direct dependencies.** [L0/cyclotomic-euler-system](#cyclotomic-euler-system); [L0/twisted-class-formula](#twisted-class-formula); `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`; `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`.

<a id="chi-units-rank-one-and-index"></a>
### E_L^χ is free of rank one, and the index of divisibility is the unit index

**Target `EulerSystemsCyclotomicMainConjecture:L1/chi-units-rank-one-and-index`**.

Let p > 2 and χ : G_ℚ → O^× even, nontrivial, of finite order prime to p, with conductor f and field L; T = O_χ, W = D_χ, T* = O_{χ^{−1}}(1), W* = T* ⊗ ℚ_p/ℤ_p, with χ(p) ≠ 1. Then E_L^χ is a free O-module of rank one, by the Dirichlet unit theorem, since L is totally real and χ ≠ 1 is even. The index of divisibility of the cyclotomic Euler system (Definition II.2.1) is ind_O(c) = ℓ_O(E_L^χ/C_{L,χ}). Indeed L^×/E_L is torsion-free, so a generator of C_{L,χ} is divisible by p^n in H¹(ℚ, T*) ≅ (L^×)^χ exactly when it is divisible by p^n in E_L^χ.

**Hypotheses and conventions.**

- The Galois-module form of the unit theorem is needed: E_L ⊗ ℚ is the augmentation quotient of ℚ[Δ] for totally real L (Herbrand–Minkowski). This is requested with IntegralIwasawaTheory L0. Mathlib has the rank statement (NumberField.Units.finrank_eq) but not the Δ-module structure.
- c_ℚ generates C_{L,χ} when χ(p) ≠ 1 (L0/twisted-class-generates).

**Construction or proof.**

1. The χ-part of μ(L) ⊗ ℤ_p vanishes for odd p, so E_L^χ is torsion-free.
2. E_L ⊗ ℚ_p ≅ (augmentation quotient of ℚ_p[Δ]) contains each nontrivial character once. So E_L^χ has O-rank one, and it is free, being torsion-free over a DVR.
3. H¹(ℚ, T*) ≅ (L^×)^χ by (3). Since L^×/E_L is torsion-free, divisibility of c_ℚ in H¹/torsion is divisibility in E_L^χ. With c_ℚ a generator of C_{L,χ}, ind_O(c) = ℓ_O(E_L^χ/C_{L,χ}).

**Checks.**

- If χ(p) = 1 then c_ℚ = 0 and ind_O(c) = ∞ (Remark II.2.8).

**Sources.** **RUBIN-ES**, Chapter III, proof of Theorem 2.3, printed p. 36. E_L^χ free of rank one. **RUBIN-ES**, Chapter II, Definition 2.1, printed p. 24. The index of divisibility.

**Direct dependencies.** [L0/twisted-class-generates](#twisted-class-generates); [L0/chi-cyclotomic-units](#chi-cyclotomic-units); [L0/chi-component](#chi-component); `mathlib:NumberField.Units.finrank_eq`; `IntegralIwasawaTheory:L0`.

<a id="selmer-is-class-group"></a>
### When χ(p) ≠ 1 the relaxed Selmer group is Hom_O(A_L^χ, D)

**Target `EulerSystemsCyclotomicMainConjecture:L1/selmer-is-class-group`**.

Let χ : G_ℚ → O^× even, nontrivial, of finite order prime to p, with conductor f and field L; T = O_χ, W = D_χ, T* = O_{χ^{−1}}(1), W* = T* ⊗ ℚ_p/ℤ_p, with χ(p) ≠ 1. Then H¹_f(ℚ_p, W) = 0, so S_{Σ_p}(ℚ, W) = S(ℚ, W) ≅ Hom_O(A_L^χ, D), where A_L is the ideal class group of L.

**Hypotheses and conventions.**

- S(K, W) ≅ Hom(A_L, D_χ)^Δ is Rubin's Proposition I.6.1. The unramified local conditions away from p and at p are those of I.6.2. Requested from SelmerIwasawaCohomology L2.

**Construction or proof.**

1. By Lemma I.3.2(i), H¹_ur(ℚ_p, V) = V^I/(Fr_p − 1)V^I = V^I/(χ(p) − 1)V^I, which is 0 since χ(p) ≠ 1. If p | f then V^I = 0 already.
2. The finite local subgroup at p is zero. Imposing the strict zero condition there therefore gives S_{Σ_p}(ℚ,W)=S(ℚ,W); an upper-script S^{Σ_p} would relax that condition and is a different group.
3. Proposition I.6.1: restriction to L is an isomorphism on Δ-invariants since |Δ| is prime to p. Unramified homomorphisms factor through Gal(H_L/L) ≅ A_L, so S(ℚ, W) ≅ Hom(A_L, D_χ)^Δ = Hom_O(A_L^χ, D).

**Checks.**

- χ(p) = 1: H¹_f(ℚ_p, W) can be nonzero, and S_{Σ_p} is larger than S.

**Sources.** **RUBIN-ES**, Chapter III, proof of Theorem 2.3, printed p. 36. The local computation at p. **RUBIN-ES**, Chapter I, Proposition 6.1 and its proof, printed p. 14. The Selmer group is the dual of the χ-part of the class group.

**Direct dependencies.** [L1/cyclotomic-hypotheses-and-error-terms](#cyclotomic-hypotheses-and-error-terms); [L0/chi-component](#chi-component); `SelmerIwasawaCohomology:L2`; `SelmerIwasawaCohomology:L2/restriction-injective-descent`.

<a id="cyclotomic-derivative-classes"></a>
### Cyclotomic Kolyvagin derivative classes

**Target `EulerSystemsCyclotomicMainConjecture:L1/cyclotomic-derivative-classes`**.

Let p>2, T=O(1)⊗χ⁻¹ as in L1, F a finite layer of ℚ∞, M=p^k, and r a squarefree product of the imported (F,M,T)-Kolyvagin primes, with their chosen cyclic generators σ_q. Define κ^cyc_{F,r,M}=κ_{F,r,M}(c) by applying ES.3’s derivative-class construction to the twisted cyclotomic Euler system. Its restriction is the invariant derivative of the Kummer image of the norm-compatible cyclotomic p-unit, using D_r=∏_{q|r}Σ_{i=1}^{|G_q|−1}iσ_q^i and D_{r,F}=N_{F(1)/F}D_r, where F(1) is the imported auxiliary ray-class base field. The construction includes the descent map; an invariant class alone is not a class over F.

**Hypotheses and conventions.**

- χ is even, nontrivial and of finite order prime to p. Auxiliary primes satisfy all ES.1/kolyvagin-primes conditions, not merely q≡1 mod M.
- Use the generic construction’s annihilators and descent when invariants occur. It is not permissible to assert unique descent without its cohomological hypotheses.

**Construction or proof.**

1. Substitute the actual Kummer family into ES.3/derivative-operators and ES.3/derivative-class.
2. Check (σ_q−1)D_q=|G_q|−N_q and M divisibility of the group orders; use the imported norm relation to obtain the invariant mod-M derivative.
3. Use the generic descent theorem and its compatibility with restriction/corestriction. Translate the class back to cyclotomic units using the Kummer norm square.

**API.**

- `cyclotomicDerivative_one` (simp): For r=1 the derivative class is the mod-M reduction of c_F.
- `cyclotomicDerivative_restriction` (compatibility): res_{F(r)/F}(κ^cyc_{F,r,M}) is the mod-M image of D_{r,F}c_{F(r)}, with D_{r,F}=N_{F(1)/F}D_r.
- `cyclotomicDerivative_change_modulus` (compatibility): For M|M′ the classes reduce compatibly whenever the auxiliary primes satisfy the M′ conditions.
- `cyclotomicDerivative_zero` (simp): The zero Euler system gives zero derivative classes.

**Uses.** L1/cyclotomic-local-relation: Transfers the finite/singular relation to cyclotomic units.. L1/kolyvagin-class-group-divisibility: Makes the arithmetic classes used by the general bound explicit..

**Unit tests.**

- `cycDerivative_one` (degenerate): r=1 gives the reduction of the original c_F, not zero by an empty product convention.
- `cycDerivative_order_three` (value): For a cyclic group of order 3, D=σ+2σ² and (σ−1)D=3−(1+σ+σ²).
- `cycDerivative_admissibility` (non-example): If M does not divide |G_q|, the term |G_q| in (σ_q−1)D_q need not vanish modulo M; such q is excluded.

**Checks.**

- Restriction is the actual D_{r,F} derivative of the Kummer class, rather than a freely postulated lift.
- The r=1 and change-of-modulus formulas agree with ES.3/derivative-class.
- Check the telescoping identity at a cyclic group of order 3.

**Sources.** **RUBIN-ES**, Chapter IV §4, Definition 4.1, printed p. 62; Definition 4.10 and Lemma 4.13, printed pp. 66–67. The generic derivative classes are specialized to the cyclotomic-unit Euler system, retaining their actual descent.

**Direct dependencies.** [L0/twisted-class-formula](#twisted-class-formula); `EulerSystemsAndKolyvaginSystems:ES.1/kolyvagin-primes`; `EulerSystemsAndKolyvaginSystems:ES.3/derivative-operators`; `EulerSystemsAndKolyvaginSystems:ES.3/derivative-class`.

<a id="cyclotomic-local-relation"></a>
### Local conditions of cyclotomic derivatives

**Target `EulerSystemsCyclotomicMainConjecture:L1/cyclotomic-local-relation`**.

For κ^cyc_{F,r,M}, localization lies in H¹_f(F_w,T/MT) whenever w∤pr. If rq is admissible and q∤r, then (κ^cyc_{F,rq,M})^s_q=φ^fs_{q,σ_q}((κ^cyc_{F,r,M})_q). Here φ^fs is ES.1’s finite–singular comparison with arithmetic Frobenius, its Q_q(Fr_q⁻¹) factor, and evaluation at the same chosen σ_q. The generator-independent formula retains the tensor factor G_q. In rank one it identifies the orders of these finite and singular classes. No finite condition at p follows solely from this theorem.

**Hypotheses and conventions.**

- Use precisely the admissible primes and modulus of L1/cyclotomic-derivative-classes. Local groups, comparison maps and their normalisations are imported from ES.1/finite-singular-comparison.

**Construction or proof.**

1. Apply the generic derivative-local-properties theorem to the actual cyclotomic family.
2. Use the Kummer norm and residue maps to read its finite/singular relation as the valuation/residue relation for cyclotomic derivatives. Keep the same arithmetic Frobenius convention.
3. At primes above p use only the local condition actually supplied by the chosen Euler system. The stronger p-finiteness in IX Theorem 1.2 needs an additional argument and is not smuggled into this result.

**Checks.**

- For r=1 recover finiteness away from p.
- For a single auxiliary prime q check the finite–singular equality using the same generator in D_q and φ^fs_q.
- No conclusion at p is accepted without its separate local input.

**Sources.** **RUBIN-ES**, Chapter IV Theorems 5.1 and 5.4, Corollary 5.5, printed pp. 67–68. The general local relation controls precisely the local conditions required in the cyclotomic descent.

**Direct dependencies.** [L1/cyclotomic-derivative-classes](#cyclotomic-derivative-classes); `EulerSystemsAndKolyvaginSystems:ES.1/finite-singular-comparison`; `EulerSystemsAndKolyvaginSystems:ES.3/derivative-local-properties`; `EulerSystemsAndKolyvaginSystems:ES.3/congruence`.

<a id="kolyvagin-class-group-divisibility"></a>
### Kolyvagin's bound: |A_L^χ| divides [E_L^χ : C_{L,χ}] (Rubin, Theorem III.2.3)

**Target `EulerSystemsCyclotomicMainConjecture:L1/kolyvagin-class-group-divisibility`** · atlas planet: Kolyvagin's class-group bound.

Let p > 2 and χ : G_ℚ → O^× even, nontrivial, of finite order prime to p, with conductor f and field L; T = O_χ, W = D_χ, T* = O_{χ^{−1}}(1), W* = T* ⊗ ℚ_p/ℤ_p, with χ(p) ≠ 1. Then |A_L^χ| divides [E_L^χ : C_{L,χ}].

**Hypotheses and conventions.**

- Theorem II.2.2 (the error-tolerant Euler-system bound, p > 2) is imported from EulerSystemsAndKolyvaginSystems ES.4, with its derivative classes and Chebotarev inputs (ES.1, ES.3). Chapters IV–V, where it is proved, are that roadmap's.
- Mazur–Wiles proved it first; this proof is Kolyvagin's.

**Construction or proof.**

1. Theorem II.2.2 for T*, with the cyclotomic Euler system c: ℓ_O(S_{Σ_p}(ℚ, W)) ≤ ind_O(c) + n_{W*} + n*_{W*}.
2. The error terms vanish (L1/cyclotomic-hypotheses-and-error-terms), and ind_O(c) = ℓ_O(E_L^χ/C_{L,χ}) (L1/chi-units-rank-one-and-index).
3. S_{Σ_p}(ℚ, W) = Hom_O(A_L^χ, D) (L1/selmer-is-class-group), whose length is that of A_L^χ. Lengths over O give divisibility of orders.

**Checks.**

- χ(p) = 1: c_ℚ = 0, so Theorem II.2.2 gives nothing (Remark III.2.5); L2–L3 handle it through the main conjecture.
- p | ord χ: the Selmer group is no longer exactly the class group (Remark III.2.5).

**Sources.** **RUBIN-ES**, Chapter III, the paragraph before Theorem 2.3, printed p. 35. Attribution. **RUBIN-ES**, Chapter III, proof of Theorem 2.3, printed p. 36. The end of the proof.

**Direct dependencies.** [L1/cyclotomic-hypotheses-and-error-terms](#cyclotomic-hypotheses-and-error-terms); [L1/chi-units-rank-one-and-index](#chi-units-rank-one-and-index); [L1/selmer-is-class-group](#selmer-is-class-group); `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`; `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`; [L1/cyclotomic-local-relation](#cyclotomic-local-relation).

<a id="mazur-wiles-chi-equality"></a>
### The equality |A_L^χ| = [E_L^χ : C_{L,χ}] (Rubin, Corollary III.2.4)

**Target `EulerSystemsCyclotomicMainConjecture:L1/mazur-wiles-chi-equality`**.

Let p > 2 and χ : G_ℚ → O^× even, nontrivial, of finite order prime to p, with conductor f and field L; T = O_χ, W = D_χ, T* = O_{χ^{−1}}(1), W* = T* ⊗ ℚ_p/ℤ_p, with χ(p) ≠ 1. Then |A_L^χ| = [E_L^χ : C_{L,χ}] (Mazur–Wiles).

**Hypotheses and conventions.**

- p>2, χ even nontrivial of order prime to p, L its fixed field and χ(p)≠1, as in Rubin III Corollary 2.4. A common finite unramified coefficient extension O′ contains all characters ψ of Δ=Gal(L/ℚ).
- Use the exact prime-to-p degree circular-unit class-number product, requested from IntegralIwasawaTheory:L0: after matching each ψ-line with the primitive-conductor generator, the sum of O′-lengths of E_Lψ/Cψ equals that of A_Lψ over all ψ≠1. This includes the proof that the conductor/norm lattice correction is a p-adic unit for p∤|Δ|.

**Construction or proof.**

1. For each ψ≠1 with ψ(p)≠1 apply L1/kolyvagin-class-group-divisibility to the field Lψ cut out by ψ. Since [L:Lψ] is prime to p, restriction/norm identifies its ψ class and unit components with those of L; the corresponding circular-unit line differs only by the prime-to-p norm scalar.
2. If ψ(p)=1, its primitive conductor is prime to p. Apply the already-owned L4/greither-gras-conjecture to the real unramified-at-p field Lψ, of degree prime to p. This gives equality of the ψ class and circular-unit lengths without using the finite equality being proved here.
3. The imported class-number product says the sum of the nonnegative differences ℓ(E_Lψ/Cψ)−ℓ(A_Lψ) is zero. Each difference is therefore zero, including χ. Finite unramified coefficient extension preserves this equality and descent gives the claimed orders over O.
4. This argument also explains why the p|f case cannot be proved by applying the unramified Gras theorem directly to L: only the ψ(p)=1 subfields use that theorem. The remaining ψ use the finite Euler-system bound.

**Checks.**

- Needs the bound for all characters of Δ, not only χ.

**Sources.** **RUBIN-ES**, Chapter III, Corollary 2.4 and its proof, printed p. 36. States the finite class-group/circular-unit equality and invokes the analytic product argument. The plan makes that product precise and imports the already-owned unramified Gras theorem for the other characters.

**Direct dependencies.** [L1/kolyvagin-class-group-divisibility](#kolyvagin-class-group-divisibility); [L4/greither-gras-conjecture](#greither-gras-conjecture); [L0/chi-cyclotomic-units](#chi-cyclotomic-units); `IntegralIwasawaTheory:L0/general-conductor-index`; `IntegralIwasawaTheory:L0`.

## L2 — Iwasawa divisibility

Pass to norm inverse limits and compare global p-units with semilocal
multiplicative groups. The singular local quotient is zero when χ(p)≠1 and O
when χ(p)=1, so its characteristic ideal contributes at most J. A second J can
come from replacing p-units by units. The generic Euler-system bound therefore
first gives char(A∞χ) dividing J² char(E∞χ/C∞χ). Abelian Leopoldt excludes J
from the class-module characteristic ideal and removes both artificial factors.

Iwasawa’s local multiplicative-module theorem, invoked as [Iw3] Theorem 25 in
Rubin III.2.7, is an explicit supplier request: Y∞χ is finitely generated,
torsion-free and of Λχ-rank one. Neither a rank calculation of global units nor
a free formal module substitutes for this input.

<a id="iwasawa-hypotheses-cyclotomic"></a>
### Hypotheses of the Iwasawa-theoretic Euler-system theorems over ℚ_∞

**Target `EulerSystemsCyclotomicMainConjecture:L2/iwasawa-hypotheses-cyclotomic`**.

Let p an odd prime and χ : G_ℚ → O^× even, nontrivial, of finite order prime to p, with field L, Λ = O[[Gal(ℚ_∞/ℚ)]] and J = char(O) its augmentation ideal, and T* = O_{χ^{−1}}(1). The cyclotomic ℤ_p-extension ℚ_∞/ℚ has Gal ≅ ℤ_p, and no finite prime splits completely in it. Hyp(ℚ_∞, T*) holds with τ = 1, because rank_O T* = 1. Hyp(ℚ_∞/ℚ) holds because K = ℚ is totally real and Leopoldt's conjecture holds for ℚ. So Rubin's Theorem II.3.3 applies to the cyclotomic Euler system c: char(X_∞) divides ind_Λ(c).

**Hypotheses and conventions.**

- Theorems II.3.2–II.3.4 and Proposition II.3.7 are imported from EulerSystemsAndKolyvaginSystems ES.8.
- Theorem II.3.3 itself also holds for p = 2 (Remark III.2.5), but p = 2 for the cyclotomic main conjecture is left to Greither (L4).

**Construction or proof.**

1. Rank one gives Hyp(ℚ_∞, T*)(i) with τ = 1 and (ii) trivially.
2. Rubin notes that Hyp(K_∞/K) is satisfied if K = ℚ; over ℚ, O_ℚ^× = {±1} is finite, so Leopoldt holds trivially.
3. Every finite prime q ≠ p is finitely decomposed in ℚ_∞ (Frob_q generates an open subgroup), and p is totally ramified.

**Checks.**

- χ need not satisfy χ(p) ≠ 1 here; the χ(p) = 1 case enters only through the augmentation terms (L2/cyclotomic-iwasawa-divisibility).

**Sources.** **RUBIN-ES**, Chapter II §3, Hypothesis Hyp(K∞/K), printed p. 27. Hyp(ℚ_∞/ℚ). **RUBIN-ES**, Chapter II §3, Theorem 3.3, printed p. 28. The imported theorem. **RUBIN-ES**, Chapter III, proof of Theorem 2.7, printed p. 38. Its application to T*.

**Direct dependencies.** [L1/cyclotomic-hypotheses-and-error-terms](#cyclotomic-hypotheses-and-error-terms); `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses`; `EulerSystemsAndKolyvaginSystems:ES.8/leopoldt-tower-hypothesis`; `EulerSystemsAndKolyvaginSystems:ES.8/rubin-iwasawa-divisibility`; `EulerSystemsAndKolyvaginSystems:ES.8/true-selmer-iwasawa-divisibility`; `IntegralIwasawaTheory:I.1`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`.

<a id="limit-unit-diagram"></a>
### The limit of units, local units and cyclotomic units (Rubin, Proposition III.2.6)

**Target `EulerSystemsCyclotomicMainConjecture:L2/limit-unit-diagram`**.

Let p an odd prime and χ : G_ℚ → O^× even, nontrivial, of finite order prime to p, with field L, Λ = O[[Gal(ℚ_∞/ℚ)]] and J = char(O) its augmentation ideal. With A_∞, E_∞, C_{∞,χ}, U_∞, Y_∞ = lim (L_{n,p})^ and E′_∞ = lim (E′_n)^ (p-units) the norm inverse limits: (i) the restriction isomorphisms identify Λ{c_{ℚ_n}} ⊂ H¹_∞(ℚ, T*) ⊂ H¹_∞(ℚ_p, T*) ↠ H¹_{∞,s}(ℚ_p, T*) with C_{∞,χ} ⊂ (E′_∞)^χ ⊂ Y_∞^χ ↠ Y_∞^χ/U_∞^χ; (ii) Y_∞^χ/U_∞^χ ≅ ℤ_p[Δ/Δ_p]^χ, which is 0 if χ(p) ≠ 1 and O if χ(p) = 1; (iii) (E′_∞)^χ/E_∞^χ injects into O.

**Hypotheses and conventions.**

- The injectivity of (E′_∞)^χ → Y_∞^χ uses Leopoldt's conjecture for the real abelian field L (Brumer, Ax), which is known.
- H¹_∞(ℚ, T*) = lim S^{p}(ℚ_n, T*) is Rubin's Corollary B.3.4, requested with SelmerIwasawaCohomology L3.

**Construction or proof.**

1. The image of c_{ℚ_n} in (L_n^×)^χ is ξ_{n,χ} (Lemma II.4.3, as for (4)), which gives the left-hand isomorphism.
2. S^{p}(ℚ_n, T*) ≅ (E′_n)^χ by (3), and the local restriction isomorphisms H¹(ℚ_{n,p}, T*) ≅ (L_{n,p}^×)^χ ⊃ H¹_f ≅ U_n^χ give the rest.
3. (ii): L_{m,p}^×/U_m ≅ ⊕_{w|p} ℤ ≅ ℤ[Δ/Δ_p] compatibly with norms, and ℤ_p[Δ/Δ_p]^χ ≠ 0 exactly when χ is trivial on Δ_p, that is χ(p) = 1.
4. (iii): E_∞^χ is the kernel of (E′_∞)^χ → Y_∞^χ/U_∞^χ.

**Checks.**

- χ(p) ≠ 1: Y_∞^χ = U_∞^χ and (E′_∞)^χ = E_∞^χ.
- χ(p) = 1: both quotients are at most O, and these are the augmentation corrections.

**Sources.** **RUBIN-ES**, Chapter III, Proposition 2.6, printed p. 37. Part (iii). **RUBIN-ES**, Chapter III, proof of Proposition 2.6, printed p. 38. Part (ii).

**Direct dependencies.** [L0/chi-cyclotomic-units](#chi-cyclotomic-units); [L0/chi-cyclotomic-generator](#chi-cyclotomic-generator); `SelmerIwasawaCohomology:L3/iwasawa-cohomology`; `IntegralIwasawaTheory:I.1`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`; `IntegralIwasawaTheory:L4/abelian-leopoldt`.

<a id="lambda-index-of-cyclotomic-units"></a>
### The Λ-index of the cyclotomic Euler system

**Target `EulerSystemsCyclotomicMainConjecture:L2/lambda-index-of-cyclotomic-units`**.

Let p an odd prime and χ : G_ℚ → O^× even, nontrivial, of finite order prime to p, with field L, Λ = O[[Gal(ℚ_∞/ℚ)]] and J = char(O) its augmentation ideal. Then (E′_∞)^χ is a torsion-free, finitely generated Λ-module of rank one, ind_Λ(c) = char((E′_∞)^χ/C_{∞,χ}), and ind_Λ(c) divides J·char(E_∞^χ/C_{∞,χ}).

**Hypotheses and conventions.**

- Y_∞^χ is torsion-free, finitely generated and of rank one over Λ (Iwasawa, [Iw3] Theorem 25). The precise local rank-one input is requested from IntegralIwasawaTheory:I.1.

**Construction or proof.**

1. (E′_∞)^χ is a nonzero Λ-submodule of Y_∞^χ, so it inherits torsion-freeness and rank one.
2. Proposition III.2.6(i) identifies c_{ℚ,∞} with a generator of C_{∞,χ} inside (E′_∞)^χ ≅ H¹_∞(ℚ, T*). So ind_Λ(c) = {φ(c) : φ ∈ Hom_Λ(H¹_∞, Λ)} = char((E′_∞)^χ/C_{∞,χ}).
3. By Proposition III.2.6(iii), char((E′_∞)^χ/E_∞^χ) divides char(O) = J, and multiplicativity of char gives the divisibility.

**Checks.**

- χ(p) ≠ 1: (E′_∞)^χ = E_∞^χ and ind_Λ(c) = char(E_∞^χ/C_{∞,χ}) exactly.

**Sources.** **RUBIN-ES**, Chapter II, Definition 3.1, printed p. 28. The Λ-index. **RUBIN-ES**, Chapter III, proof of Theorem 2.7, printed p. 38. The index computation.

**Direct dependencies.** [L2/limit-unit-diagram](#limit-unit-diagram); [L2/iwasawa-hypotheses-cyclotomic](#iwasawa-hypotheses-cyclotomic); `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`; `EulerSystemsAndKolyvaginSystems:ES.8/lambda-index`; `IntegralIwasawaTheory:I.1`.

<a id="cyclotomic-iwasawa-divisibility"></a>
### Divisibility of characteristic ideals: char(A_∞^χ) divides char(E_∞^χ/C_{∞,χ}) (Rubin, Theorem III.2.7)

**Target `EulerSystemsCyclotomicMainConjecture:L2/cyclotomic-iwasawa-divisibility`** · atlas planet: Cyclotomic Iwasawa divisibility.

Let p an odd prime and χ : G_ℚ → O^× even, nontrivial, of finite order prime to p, with field L, Λ = O[[Gal(ℚ_∞/ℚ)]] and J = char(O) its augmentation ideal. Then char(A_∞^χ) divides char(E_∞^χ/C_{∞,χ}), where A_∞ = lim A_n is the inverse limit of the p-parts of the class groups of L_n. No hypothesis on χ(p) is needed.

**Hypotheses and conventions.**

- Theorem II.3.3 and Proposition II.3.7 are imported (ES.8). Hom_O(S(ℚ_∞, W), D) ≅ A_∞^χ is (5).
- Leopoldt's conjecture for the real abelian field L is used to exclude J from char(A_∞^χ).
- The Iwasawa limit of the ordinary finite-condition Selmer group is the class-group dual for all χ, by Rubin I Proposition 6.1 and passage to norm limits. Do not use L1/selmer-is-class-group’s strict-at-p comparison here: that target assumes χ(p)≠1.

**Construction or proof.**

1. Theorem II.3.3 with Proposition II.3.7: char(Hom_O(S(ℚ_∞, W), D)) divides ind_Λ(c)·char(H¹_{∞,s}(ℚ_p, T*)).
2. ind_Λ(c) divides J·char(E_∞^χ/C_{∞,χ}) (L2/lambda-index-of-cyclotomic-units), and char(H¹_{∞,s}(ℚ_p, T*)) = char(Y_∞^χ/U_∞^χ) divides J (Proposition III.2.6(ii)). So char(A_∞^χ) divides J²·char(E_∞^χ/C_{∞,χ}).
3. J does not divide char(A_∞^χ). J | char(A_∞^χ) iff A_∞^χ/JA_∞^χ = Gal(M_∞/L_∞)^χ is infinite, with M_∞/L abelian. L is real abelian, so Leopoldt holds and L has no ℤ_p²-extension. So Gal(M_∞/L) has ℤ_p-rank one and [M_∞ : L_∞] is finite ([Iw3] §3.1).
4. Since J is a height-one prime of the UFD Λ, coprime to char(A_∞^χ), the J² can be removed.

**Checks.**

- χ(p) ≠ 1: the J-terms are units and step 3 is not needed.
- χ(p) = 1: both J-factors are present and step 3 removes them. This is the augmentation correction the roadmap asks for.

**Sources.** **RUBIN-ES**, Chapter III, proof of Theorem 2.7, printed p. 38. The reduction to J ∤ char(A_∞^χ). **RUBIN-ES**, Chapter III, proof of Theorem 2.7, printed p. 38. The Leopoldt step.

**Direct dependencies.** [L2/lambda-index-of-cyclotomic-units](#lambda-index-of-cyclotomic-units); [L2/limit-unit-diagram](#limit-unit-diagram); [L2/iwasawa-hypotheses-cyclotomic](#iwasawa-hypotheses-cyclotomic); `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses`; `EulerSystemsAndKolyvaginSystems:ES.8/leopoldt-tower-hypothesis`; `EulerSystemsAndKolyvaginSystems:ES.8/rubin-iwasawa-divisibility`; `EulerSystemsAndKolyvaginSystems:ES.8/true-selmer-iwasawa-divisibility`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`; `IntegralIwasawaTheory:L4/abelian-leopoldt`; `SelmerIwasawaCohomology:L2`.

## L3 — Equality and equivalent formulations

The finite-layer comparison and L2’s divisibility give componentwise equality.
Equal total μ and λ do not by themselves identify characteristic polynomials:
the quotient supplied by divisibility has μ=λ=0 and hence is a unit by
Weierstrass preparation. The compact four-term sequence is imported from
IntegralIwasawaTheory, with the RJW notation translated here. The Coleman
quotient identifies the resulting analytic ideal. The trivial component is
handled by the pole residue and the augmentation ideal, not by treating the
pseudomeasure as an everywhere integral measure.

Kummer duality gives the odd-character formulation. The Greenberg Selmer
formulation transports the equality through the dictionary owned by
SelmerIwasawaCohomology L4. For positive even Tate twists the integral ideal
retains the twisted augmentation factor cancelling the pseudomeasure’s pole.

<a id="galois-unit-four-term-sequence"></a>
### The four-term sequence 0 → E⁺/C⁺ → U⁺/C⁺ → X⁺ → Y⁺ → 0 (RJW 13.13–13.14, corrected)

**Target `EulerSystemsCyclotomicMainConjecture:L3/galois-unit-four-term-sequence`**.

Let p an odd prime, F_n = ℚ(μ_{p^n}), F_∞^+ = ∪F_n^+, G^+ = Γ^+ = Gal(F_∞^+/ℚ), Λ = Λ(Γ^+), and U^+_{∞,1}, E^+_{∞,1}, C^+_{∞,1} the limits of the principal local units, the closures of the global units and of the cyclotomic units in them (RJW Definitions 11.8, 13.12). Let X_∞^+ = Gal(M_∞^+/F_∞^+) and Y_∞^+ = Gal(L_∞^+/F_∞^+), where M_∞^+ (resp. L_∞^+) is the maximal abelian pro-p extension of F_∞^+ unramified outside p (resp. unramified). Then there is an exact sequence of Λ-modules 0 → E^+_{∞,1} → U^+_{∞,1} → Gal(M_∞^+/L_∞^+) → 0 (Proposition 13.13). Hence Gal(M_∞^+/L_∞^+) ≅ U^+_{∞,1}/E^+_{∞,1} ≅ (U^+_{∞,1}/C^+_{∞,1})/(E^+_{∞,1}/C^+_{∞,1}), and 0 → E^+_{∞,1}/C^+_{∞,1} → U^+_{∞,1}/C^+_{∞,1} → X_∞^+ → Y_∞^+ → 0 is exact (Corollary 13.14).

**Hypotheses and conventions.**

- RJW's proof prints Gal(M_∞^+/L_∞^+) ≅ E/U ≅ (E/C)/(U/C); the quotients must be reversed, to U/E ≅ (U/C)/(E/C) (PadicMeasuresIwasawaAlgebras/E5). The stated sequence of Corollary 13.14 is unaffected.
- RJW justify exactness of the inverse limit by 'finitely generated ℤ_p-modules (so satisfy the Mittag-Leffler condition)'. That implication is false in general (PadicMeasuresIwasawaAlgebras/E6: ℤ_p with multiplication by p). The repair used here is compactness: the finite-level modules are compact Hausdorff and the transition maps are continuous, so lim is exact.
- E_n → U_n is injective by Leopoldt's conjecture for F_n^+, known by Brumer (RJW's printed rank r₁ + r₂ − 1 = p^{n−1}(p − 1)/2 should read p^{n−1}(p − 1)/2 − 1: PadicMeasuresIwasawaAlgebras/E7).
- The finite-level sequence 0 → E^+_{n,1} → U^+_{n,1} → Gal(M_n^+/L_n^+) → 0 is global class field theory (Washington, Corollary 13.6), requested with the Tau Ceti ClassFieldTheory layer.

**Construction or proof.**

1. Import the canonical compact four-term unit/class sequence from IntegralIwasawaTheory:L1/four-term-cyclotomic-sequence. Identify its p-ramified and everywhere-unramified Galois groups with RJW’s X∞⁺ and Y∞⁺.
2. Use the imported principal global-unit closure comparison to match its E, C and U with RJW’s notation. The quotient is U/E ≅ (U/C)/(E/C). Compactness, rather than finite generation alone, justifies exactness of the norm inverse limit.

**Checks.**

- The orientation check: the printed E/U is not a quotient, since E ⊆ U.

**Sources.** **RJW-PADIC-L**, Proposition 13.13 and its proof, p. 68 (arXiv v2). The finite-level sequence. **RJW-PADIC-L**, Proof of Proposition 13.13, p. 68 (arXiv v2). The limit step, repaired by compactness (E6). **RJW-PADIC-L**, Corollary 13.14 and its proof, p. 68 (arXiv v2). The four-term sequence; the quotient orientation is corrected (E5).

**Direct dependencies.** [L2/limit-unit-diagram](#limit-unit-diagram); `IntegralIwasawaTheory:L1/four-term-cyclotomic-sequence`; `IntegralIwasawaTheory:L1/principal-global-unit-closures`.

<a id="trivial-character-component"></a>
### The trivial-character component of the main conjecture

**Target `EulerSystemsCyclotomicMainConjecture:L3/trivial-character-component`**.

Let p an odd prime, F_n = ℚ(μ_{p^n}), F_∞^+ = ∪F_n^+, G^+ = Γ^+ = Gal(F_∞^+/ℚ), Λ = Λ(Γ^+), and U^+_{∞,1}, E^+_{∞,1}, C^+_{∞,1} the limits of the principal local units, the closures of the global units and of the cyclotomic units in them (RJW Definitions 11.8, 13.12), and let e₁ be the idempotent of the trivial character of Δ^+ = Gal(ℚ(μ_p)^+/ℚ), so e₁Λ = ℤ_p[[Γ₀]] with Γ₀ ≅ ℤ_p. Then e₁X_∞^+ = e₁Y_∞^+ = 0, and e₁(I(Γ^+)ζ_p) = e₁Λ. So both sides of the main conjecture have trivial component the unit ideal. The pole of ζ_p at the trivial character is cancelled by the augmentation ideal: for a topological generator a of ℤ_p^×, the value of ([a] − [1])ζ_p at the trivial character is −(1 − p^{−1})·log_p(a), a p-adic unit.

**Hypotheses and conventions.**

- ζ_{p,p−1} has a simple pole at s = 1 with residue (1 − p^{−1}) (RJW Theorem 7.1(ii)), and lim_{s→1}(s − 1)^{−1}(⟨a⟩^{1−s} − 1) = −log_p(a) (Lemma 7.2(ii)).
- log_p(a) has valuation exactly 1 when a generates ℤ_p^× (p odd), so (1 − p^{−1})log_p(a) ∈ ℤ_p^×.

**Construction or proof.**

1. e₁X_∞^+ is the Galois group over ℚ_∞ of the maximal abelian pro-p extension of ℚ_∞ unramified outside p. Its Γ₀-coinvariants form the Galois group of the maximal abelian pro-p extension of ℚ unramified outside p over ℚ_∞, which is trivial by Kronecker–Weber for odd p. By Nakayama, e₁X_∞^+ = 0, and so its quotient e₁Y_∞^+ = 0.
2. The value of ([a] − [1])ζ_p at the trivial character is the numerator of (7.1) at s = 1, namely the residue (1 − p^{−1}) times −log_p(a). This is a unit, so ([a] − [1])ζ_p is a unit of the local ring e₁Λ, and e₁(I(Γ^+)ζ_p) = e₁Λ.

**Checks.**

- e₁ζ_p itself is not in e₁Λ (it has a pole); only I(Γ^+)ζ_p is an ideal of Λ (RJW Proposition 11.5).
- With e₁X_∞^+ = e₁Y_∞^+ = 0, the four-term sequence gives e₁(E/C) ≅ e₁(U/C) ≅ e₁Λ/e₁(I(Γ^+)ζ_p) = 0.

**Sources.** **RJW-PADIC-L**, Theorem 7.1(ii), p. 40 (arXiv v2). The residue.

**Direct dependencies.** [L3/galois-unit-four-term-sequence](#galois-unit-four-term-sequence); `IntegralIwasawaTheory:I.1`; `DirichletPadicLFunctions:L1/arithmetic-pseudomeasure`; `DirichletPadicLFunctions:L3/rjw2-principal-pole`.

<a id="finite-layer-comparison"></a>
### Finite-layer comparison for the unit/class equality

**Target `EulerSystemsCyclotomicMainConjecture:L3/finite-layer-comparison`**.

For odd p, a finite real abelian L with p∤[L:ℚ], and all sufficiently large n, let B∞χ=(E∞/C∞)χ and ω_n=γ^{p^n}−1. There is a constant B independent of n such that the absolute differences between the total ℤ_p-lengths of ⊕χ B∞χ/ω_nB∞χ and (E(L_n)/C(L_n))_p, and between those of ⊕χ A∞χ/ω_nA∞χ and A_p(L_n), are at most B, after removing the trivial character. The full Sinnott conductor correction has bounded p-adic valuation in this comparison. Consequently the products of the class and unit-quotient characteristic ideals have equal total μ and λ. This target includes the finiteness of the displayed coinvariants for sufficiently large n.

**Hypotheses and conventions.**

- Modules are finitely generated torsion over each O[[T]] component. The assertion is a required comparison theorem, not a definition of E∞/C∞ or an assumption of the main conjecture. Take the sum over all nontrivial characters of Δ=Gal(L/ℚ) after a common unramified coefficient extension containing their values; interpret the corresponding total ℤ_p-lengths with this same scalar extension on both sides.
- The class-side control is imported from IntegralIwasawaTheory. The remaining bound for the circular-unit norm descent is explicitly a gap until a read source or complete proof supplies it.

**Construction or proof.**

1. Use IntegralIwasawaTheory:L2/arithmetic-class-number-growth and L2/general-inertia-control for the class side.
2. Use the finite-conductor index formula and its conductor correction, together with norm descent of global/circular units. Establish the uniformly bounded error for the E/C side; this is the precise missing input.
3. Compare the coefficients of p^n and n in the length growth functions. Do not conclude equality of characteristic polynomials from equality of μ and λ alone.

**Checks.**

- The error bound is uniform in n, not just a finite error at each individual level.
- For a prime-power cyclotomic field recover the p-primary equality from the circular-unit index formula.
- For general conductor keep and bound the full Sinnott correction; do not replace it by 1.

**Sources.** **RUBIN-ES**, Chapter III §2, proof of Corollary 2.8, printed p. 38 (citing Mazur–Wiles §1.6 and Rubin’s appendix p. 414). Isolates the exact finite-layer comparison invoked by the componentwise equality proof.

**Direct dependencies.** `IntegralIwasawaTheory:L2/arithmetic-class-number-growth`; `IntegralIwasawaTheory:L2/general-inertia-control`; `IntegralIwasawaTheory:L0/general-conductor-index`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-6`.

<a id="componentwise-iwasawa-equality"></a>
### Equality of characteristic ideals: char(Y_∞^χ) = char(E_∞^χ/C_{∞,χ}) (Rubin, Corollary III.2.8)

**Target `EulerSystemsCyclotomicMainConjecture:L3/componentwise-iwasawa-equality`**.

Let p be odd and χ an even nontrivial character of order prime to p, with field L. Then char(A_∞^χ) = char(E_∞^χ/C_{∞,χ}). For L = ℚ(μ_p)^+ and all even χ ≠ 1 of Δ^+ at once, char(Y_∞^+) = char(E^+_{∞,1}/C^+_{∞,1}) away from the trivial component; the trivial components vanish on both sides (L3/trivial-character-component).

**Hypotheses and conventions.**

- Use L3/finite-layer-comparison, including the bounded circular-unit norm-descent error recorded as a gap. For general conductor use the full Sinnott index formula rather than the prime-power equality without its correction.

**Construction or proof.**

1. By L2, for every nontrivial even component write char(E∞χ/C∞χ)=char(A∞χ)·(hχ) in Oχ[[T]]. The divisibility supplies the actual integral quotient hχ.
2. The finite-layer comparison gives zero total difference in μ and λ. Each hχ has nonnegative μ and λ, so every hχ has μ=λ=0.
3. By Weierstrass preparation a nonzero nonunit of Oχ[[T]] has positive μ or positive λ. Thus every hχ is a unit. This is why divisibility plus growth gives equality; growth alone would not identify two distinguished polynomials.
4. For the full real cyclotomic tower combine these equalities with the trivial-character calculation.

**Checks.**

- A component-by-component equality does not follow from the totals without step 1's divisibilities.

**Sources.** **RUBIN-ES**, Chapter III, Corollary 2.8 and its proof, printed p. 38. The argument, cited.

**Direct dependencies.** [L2/cyclotomic-iwasawa-divisibility](#cyclotomic-iwasawa-divisibility); [L3/trivial-character-component](#trivial-character-component); `IntegralIwasawaTheory:L0/index-formula`; `IntegralIwasawaTheory:L0/general-conductor-index`; `IntegralIwasawaTheory:L2/arithmetic-class-number-growth`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`; [L3/finite-layer-comparison](#finite-layer-comparison); `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-6`.

<a id="cyclotomic-main-conjecture"></a>
### The Iwasawa main conjecture over ℚ for odd p (RJW Theorem 13.8; Rubin Theorem III.2.10)

**Target `EulerSystemsCyclotomicMainConjecture:L3/cyclotomic-main-conjecture`** · atlas planet: Iwasawa main conjecture.

Let p an odd prime, F_n = ℚ(μ_{p^n}), F_∞^+ = ∪F_n^+, G^+ = Γ^+ = Gal(F_∞^+/ℚ), Λ = Λ(Γ^+), and U^+_{∞,1}, E^+_{∞,1}, C^+_{∞,1} the limits of the principal local units, the closures of the global units and of the cyclotomic units in them (RJW Definitions 11.8, 13.12). Then X_∞^+ is a finitely generated torsion Λ(Γ^+)-module and char_{Λ(Γ^+)}(X_∞^+) = I(Γ^+)ζ_p (RJW Theorem 13.8). In χ-components: for even χ ≠ 1 of order prime to p, char(Z_∞^χ) = L_χΛ, where Z_∞ is the Galois group of the maximal abelian p-extension of L_∞ unramified outside p (Rubin Theorem III.2.10). This holds for every odd p, unconditionally. The stronger statement X_∞^+ ≅ Λ(Γ^+)/I(Γ^+)ζ_p (RJW Theorem 13.11) is not asserted; it needs p to be a Vandiver prime.

**Hypotheses and conventions.**

- The local-unit theorem U^+_{∞,1}/C^+_{∞,1} ≅ Λ(Γ^+)/I(Γ^+)ζ_p through the Coleman map (RJW Theorem 12.23(ii), Iwasawa) is requested from ColemanPowerSeries L4.
- Y_∞^+ is finitely generated and torsion (Iwasawa), requested with IntegralIwasawaTheory.

**Construction or proof.**

1. Take characteristic ideals in the four-term sequence (L3/galois-unit-four-term-sequence). char is multiplicative (RJW Lemma 13.6), so char(E/C)·char(X_∞^+) = char(U/C)·char(Y_∞^+).
2. char(U/C) = I(Γ^+)ζ_p (Theorem 12.23(ii)), and char(E/C) = char(Y_∞^+) (L3/componentwise-iwasawa-equality), which is nonzero since Y_∞^+ is torsion. Cancel in the domain components of Λ.
3. Torsion: U/C ≅ Λ/I(Γ^+)ζ_p is torsion because ζ_p ≠ 0, and Y_∞^+ is torsion, so X_∞^+ is torsion. The trivial component is handled by L3/trivial-character-component.
4. χ-form: the sequence 0 → E_∞^χ/C_{∞,χ} → U_∞^χ/C_{∞,χ} → Z_∞^χ → A_∞^χ → 0 with Corollary III.2.8 and char(U_∞^χ/C_{∞,χ}) = L_χΛ (Theorem III.2.9(ii)) gives Theorem III.2.10.

**Checks.**

- Without the Vandiver hypothesis only characteristic ideals are compared, not modules.
- p = 2 is not covered here (Greither, L4).

**Sources.** **RJW-PADIC-L**, Theorem 13.8, p. 67 (arXiv v2). The statement. **RJW-PADIC-L**, Theorem 13.11, p. 67 (arXiv v2). The Vandiver case, not asserted here. **RUBIN-ES**, Chapter III, Theorem 2.10 and its proof, printed p. 39. The χ-component form.

**Direct dependencies.** [L3/galois-unit-four-term-sequence](#galois-unit-four-term-sequence); [L3/componentwise-iwasawa-equality](#componentwise-iwasawa-equality); [L3/trivial-character-component](#trivial-character-component); `ColemanPowerSeries:L4/local-iwasawa-real-quotient-comparison`; `IntegralIwasawaTheory:L2/class-module-finiteness-torsion`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`; `ColemanPowerSeries:L4`.

<a id="odd-character-formulation"></a>
### The odd-character form of the main conjecture at odd p

**Target `EulerSystemsCyclotomicMainConjecture:L3/odd-character-formulation`**.

Let p be odd, F_∞ = ℚ(μ_{p^∞}), Δ = Gal(ℚ(μ_p)/ℚ), Γ = Gal(F_∞/ℚ(μ_p)) and Y_∞ = lim← A_p(ℚ(μ_{p^{n+1}})), the Galois group of the maximal unramified abelian pro-p extension of F_∞. For every odd character χ ≠ ω of Δ, char_{ℤ_p(χ)[[T]]}(Y_{∞,χ}) = (G_p(T, χ̌)) with χ̌ = ωχ^{−1}, and Y_{∞,ω} has characteristic ideal (1). This is equivalent to the even form char_{Λ(Γ^+)}(X_∞^+) = I(Γ^+)ζ_p (Theorem 13.8): each follows from the other by Kummer duality between the odd part of Y_∞ and the even part of X_∞.

**Hypotheses and conventions.**

- For odd p the χ-parts are exact, since p ∤ |Δ| = p − 1, and ½ is a unit, so Greither's normalisation agrees with the classical one.

**Construction or proof.**

1. Even to odd. This is the case F = ℚ, p odd, of L4/greither-main-conjecture-all-p. Its proof passes from the real main conjecture (here Theorem 13.8, through the four-term sequence and the local-unit theorem) to the odd components by Kummer duality (Greither, Lemma 3.3 and Proposition 3.4).
2. Odd to even. Kummer duality is an equality V_ρ(X^+) ≅ V_χ(Y)^*(1) of ℚ_p-representations for ρ = ωχ^{−1}. Together with μ = 0 (Ferrero–Washington) it turns the odd characteristic ideals into the even ones componentwise. The χ = ω component corresponds to the trivial component of X_∞^+, which is treated in L3/trivial-character-component.
3. The χ-parts match RJW's Λ(Γ^+)-module X_∞^+ through the decomposition Λ(Γ^+) = ∏_ρ ℤ_p(ρ)[[T]] over the even characters ρ of Δ, which is valid because p ∤ |Δ|.

**Checks.**

- χ = ω is the component where Y_∞ is finite; its characteristic ideal is (1), matching the unit trivial component of I(Γ^+)ζ_p.

**Sources.** **RJW-PADIC-L**, Remark 13.9, p. 67 (arXiv v2). RJW leave the odd form to the literature. **GREITHER-1992**, §1, the Main Conjecture (= Theorem 3.2), p. 452. The odd form; for odd p the factor ½ is a unit.

**Direct dependencies.** [L3/cyclotomic-main-conjecture](#cyclotomic-main-conjecture); [L4/greither-kummer-duality](#greither-kummer-duality); [L4/greither-main-conjecture-all-p](#greither-main-conjecture-all-p); [L4/greither-chi-parts](#greither-chi-parts); `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`.

<a id="tate-twisted-selmer-formulation"></a>
### The main conjecture as Greenberg's conjecture for the Tate twists ℚ_p(n) (RJW §13.5)

**Target `EulerSystemsCyclotomicMainConjecture:L3/tate-twisted-selmer-formulation`** · atlas planet: Greenberg Selmer form of the main conjecture.

Let p be odd, F = ℚ(μ_{p^∞})^+, Γ^+ = Gal(F/ℚ) and χ the cyclotomic character. For n ∈ ℤ let W_n = (ℚ_p/ℤ_p)(n), let S_n = H¹_{L_Gr}(F, W_n) be its Greenberg Selmer group, and S_n^∨ its Pontryagin dual, a finitely generated Λ(Γ^+)-module. The Greenberg condition is unramified away from p; at p it is the whole of H¹ for n ≥ 1 and the unramified subgroup for n ≤ 0. Let r_n be the order of the pole of L_∞(ℚ_p(n), s) = π^{−(s−n)/2}Γ((s−n)/2) at s = 1, and Tw_n the automorphism of Λ(Γ^+) with [g] ↦ χ(g)^n[g] (on measures, multiplication by x^n, RJW's ∂^n). Then:
(a) Greenberg's Conjecture 13.21(i) holds for every n. S_n^∨ has Λ(Γ^+)-rank r_n, which is 1 for odd n ≥ 1 and 0 otherwise.
(b) For even n ≥ 2, where r_n = r_{1−n} = 0: S_n^∨ ≅ X_∞^+(−n) and char(S_n^∨) = Tw_n(I(Γ^+)ζ_p) = Tw_n(I(Γ^+))·∂^nζ_p.
(c) For odd n ≤ −1, where r_n = r_{1−n} = 0: S_n^∨ ≅ Y_∞^{c=−1}(−n), and char(S_n^∨) is the Tw_n-twist of the odd-character characteristic ideal.
(d) For even n ≤ 0, r_{1−n} = 1, so Conjecture 13.21(ii) does not apply; this includes n = 0 (Remark 13.23).

**Hypotheses and conventions.**

- Definition 13.19 asks for a G_ℚ-invariant filtration. Greenberg's condition needs only a G_{ℚ_p}-stable one; this is SelmerIwasawaCohomology/E2, and the published version prints the same text. Here V = ℚ_p(n) is one-dimensional, so nothing changes.
- RJW's Example 13.22 calls Greenberg's conjecture for ℚ_p(n) 'essentially' Theorem 13.8, with p-adic L-function ∂^nζ_p. That element has a pole at the even character x^{−n} and is not in Λ(Γ^+). The integral characteristic ideal carries the factor Tw_n(I(Γ^+)), the ideal of the character x^{−n}; part (b) states the precise identity.

**Construction or proof.**

1. The identification of S_n. For n ≥ 1, S_n = Hom_cts((X_∞)^{c=(−1)^n}, W_n); for n ≤ 0, S_n = Hom_cts((Y_∞)^{c=(−1)^n}, W_n). Here X_∞ and Y_∞ are the Galois groups over F_∞ = ℚ(μ_{p^∞}) of the maximal abelian pro-p extensions unramified outside p and everywhere unramified, and (X_∞)^{c=1} ≅ X_∞^+ (RJW §13.5.2, requested from SelmerIwasawaCohomology L4). The Pontryagin dual of Hom_cts(M, W_n) is M(−n), with g acting as χ(g)^{−n}g. So char(M(−n)) = Tw_n(char M), since M(−n) is M pulled back along Tw_n^{−1}.
2. Gamma factors. The poles of Γ((s − n)/2) are at s = n − 2k, k ≥ 0, so r_n = 1 exactly when n is odd and n ≥ 1. The dual ℚ_p(n)^∨ = ℚ_p(1 − n) has r_{1−n} = 1 exactly when n is even and n ≤ 0. So (ii) applies exactly for even n ≥ 2 and odd n ≤ −1, the critical cases of Remark 13.23.
3. (a) X_∞^+ is torsion by Theorem 13.8, and Y_∞ is torsion. X_∞ has Λ(Γ)-rank r_2(ℚ(μ_p)) = (p − 1)/2, all of it on the c = −1 side (Iwasawa; requested from IntegralIwasawaTheory L1), which is rank one over the minus part of Λ(Γ). Twisting by an odd power of χ carries that minus part to Λ(Γ^+). So S_n^∨ has rank 1 for odd n ≥ 1 and is torsion otherwise.
4. (b) For even n ≥ 2, S_n^∨ = X_∞^+(−n), and Theorem 13.8 gives char = Tw_n(I(Γ^+)ζ_p) = Tw_n(I(Γ^+))·Tw_n(ζ_p). Tw_n(ζ_p) = ∂^nζ_p is RJW's twist of Kubota–Leopoldt.
5. (c) For odd n ≤ −1, S_n^∨ = Y_∞^{c=−1}(−n). The twist by the odd character χ^n turns Y_∞'s odd part into a Λ(Γ^+)-module, and the odd-character formulation gives its characteristic ideal componentwise.
6. (d) is the gamma-factor count.

**Checks.**

- p = 3: Γ^+ = ℤ_3^×/{±1} ≅ 1 + 3ℤ_3 and X_∞^+ = 0, since the only abelian 3-ramified pro-3 extension of ℚ is the cyclotomic ℤ_3-extension. So S_n = 0 for even n ≥ 2, and char(S_n^∨) = Λ = Tw_n(I(Γ^+)ζ_3), while ∂^nζ_3 alone has a pole at x^{−n}. This separates the precise identity from the 'essentially' of Example 13.22.
- n = 0 is excluded from (ii), and n = 1 has corank 1, matching r_1 = 1.

**Sources.** **RJW-PADIC-L**, §13.5.1, Definition 13.19, p. 70 (arXiv v2). Greenberg's local condition. **RJW-PADIC-L**, §13.5.2, p. 70 (arXiv v2). X_∞ as a Greenberg Selmer group. **RJW-PADIC-L**, §13.5.2(3), p. 71 (arXiv v2). The local condition at p; 'n ≥ 0' should read n ≤ 0 (source issue E12). **RJW-PADIC-L**, Conjecture 13.21 and Example 13.22, p. 71 (arXiv v2). Greenberg's conjecture and the case of even n. **RJW-PADIC-L**, Remark 13.23, p. 72 (arXiv v2). n = 0; its gamma-factor identity is misprinted (source issue E13).

**Direct dependencies.** [L3/cyclotomic-main-conjecture](#cyclotomic-main-conjecture); [L3/odd-character-formulation](#odd-character-formulation); `SelmerIwasawaCohomology:L2/greenberg-condition`; `SelmerIwasawaCohomology:L4/tate-twist-greenberg-selmer`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`.

## L4 — Abelian fields and the prime 2

Use K_n=F(ζ_(2p^(n+1))) for F/ℚ abelian and unramified at p. In particular
K_0=F(i) for p=2. Character quotients are integral coinvariant quotients;
semisimple eigenspace arguments are insufficient when p divides the finite
Galois group order. The local comparison and the Kolyvagin induction are
tracked with their finite error constants. Kummer duality, the class-number
product and Ferrero–Washington then give Greither’s all-prime main conjecture,
with its essential factor 1/2 at p=2.

The finite-level applications distinguish the nonzero constant-term case
from the split-prime trivial-zero case. In the latter, valuation and logarithm
lattices of global 2-units give the correction. The Gauss sum lies in the
decomposition field D of 2; it must be normed from D to F. The analytic gamma,
exceptional derivative and nonvanishing results are imported by precise
DirichletPadicLFunctions node ids. The supplier’s remaining nonvanishing gap is
listed explicitly at the end.

<a id="greither-chi-parts"></a>
### Greither's χ-parts, including the case p ∣ |Δ|

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-chi-parts`**.

Let Δ be a finite abelian group, χ a p-adic character of Δ, and M a ℤ_p[Δ]-module. The χ-part of M is M_χ = M ⊗_{ℤ_p[Δ]} ℤ_p(χ), where ℤ_p(χ) = ℤ_p[χ(δ) | δ ∈ Δ] with Δ acting through χ. Properties: (a) M ↦ M_χ is right exact, and exact if p ∤ |Δ|; (b) Q_p-conjugate characters give isomorphic parts; (c) the kernels of ℤ_p[Δ] → ℤ_p(χ) are the minimal primes of ℤ_p[Δ]; (d) if p ∤ |Δ|, M ≅ ∏_χ M_χ over Q_p-conjugacy classes. For Δ = Gal(F/ℚ) with complex conjugation j: (e) for odd χ, (1 + j)M maps to 0 in M_χ; (f) for M = A_p(F), M_χ ≅ (M/im M^+)_χ for odd χ; (g) if p = 2 and Δ = Δ₂ × Δ₀ with Δ₀ odd and Δ₂ cyclic of 2-power order, then for a minus module M and odd χ, M_χ ≅ M_{χ₀}, with χ₀ = χ|_{Δ₀}.

**Hypotheses and conventions.**

- When p | |Δ| the χ-part is only right exact; this is why Greither's bounds carry controlled error terms, unlike Rubin's §III.2, which assumes p ∤ |Δ|.

**Construction or proof.**

1. Define M_χ by base change along ℤ_p[Δ] → ℤ_p(χ).
2. (a)–(d): standard. (e): χ(j) = −1 kills 1 + j. (f): the norm A_p(F) → A_p(F^+) is onto, so im M^+ = (1 + j)M.
3. (g): χ odd on a cyclic 2-group forces χ injective on Δ₂ with χ(j) = −1, so ℤ_2(χ) = ℤ_2[Δ₂]/(j + 1), and M_χ = M/(1 + j)M = M for a minus module.

**API.**

- `chiPart` (constructor): M_χ = M ⊗_{ℤ_p[Δ]} ℤ_p(χ).
- `chiPart_rightExact` (characterisation): M ↦ M_χ is right exact, and exact when p ∤ |Δ|.
- `chiPart_odd_kills_plus` (characterisation): For odd χ, (1 + j)M ↦ 0 in M_χ.
- `chiPart_minus_two` (characterisation): p = 2, Δ₂ cyclic, M a minus module, χ odd: M_χ ≅ M_{χ|Δ₀} (property (g)).

**Uses.** EulerSystemsCyclotomicMainConjecture:L4/greither-main-conjecture-all-p: the χ-parts in which the main conjecture is stated for all p. EulerSystemsCyclotomicMainConjecture:L4/greither-real-main-conjecture: the ρ-parts of X and E_∞/C_∞ when p divides [F : ℚ].

**Unit tests.**

- `chiPart.test_prime_to_p` (value): p ∤ |Δ|: M ≅ ∏_χ M_χ over conjugacy classes (property (d)).
- `chiPart.test_not_exact` (non-example): p = 2, Δ = ⟨δ⟩ ≅ ℤ/2, χ(δ) = −1: 0 → ℤ_2 → ℤ_2[Δ] → ℤ_2(χ) → 0 (1 ↦ 1 + δ) is exact, but its χ-part ℤ/2 → ℤ_2 → ℤ_2 → 0 has zero first map, so (·)_χ is not left exact when p ∣ |Δ|.
- `chiPart.test_minus_module` (characterisation): For a minus module (j acts as −1) and odd χ of a cyclic 2-group, M_χ = M.

**Checks.**

- Greither's introductory example: an imaginary abelian field whose 2-class group (ℤ/2)^3 equals its minus part, on which the usual Stickelberger theorem says nothing about the Galois structure.

**Sources.** **GREITHER-1992**, Introduction, the Definition and properties (a)–(f), p. 451. (a). **GREITHER-1992**, Introduction, property (g), p. 451. The p = 2 phenomenon.

**Direct dependencies.** [L0/chi-component](#chi-component).

<a id="greither-semilocal-norm-descent"></a>
### Norm descent for semilocal units, with bounded errors (Greither, Lemmas 2.1–2.2)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-semilocal-norm-descent`**.

Let p be a prime, F/ℚ abelian with p ∤ cond(F), K_n = F(ζ_{2p^{n+1}}) (so K_0 = F(√−1) when p = 2), K_∞ = ∪K_n, 𝒰_n = (ℤ_p ⊗ 𝒪_{K_n})^× the semilocal units above p, U_n its pro-p part, 𝒞_n Sinnott's circular units of K_n and C_n the pro-p part of their closure in 𝒰_n; 𝒰_∞, U_∞, 𝒞_∞, C_∞ the inverse limits; t = 1 for odd p and t = 2 for p = 2. (Lemma 2.2) Let H ⊆ Δ be finite abelian groups, X a ℤ_pΔ-module, X′ a ℤ_p(Δ/H)-module, and N: X → X′, i: X′ → X Δ-maps with Ni = |H| and iN = Σ_{σ∈H}σ. Then the kernel and cokernel of the induced map N̄: X_H → X′ are annihilated by |H|. (Lemma 2.1) For F′ ⊆ F with H = Gal(F/F′), the kernel and cokernel of the norm map α: (𝒰_n)_H → 𝒰′_n are annihilated by |H| = [F:F′]. (Corollary) If χ is a character of F′, the kernel and cokernel of α_χ: (𝒰_∞)_χ → (𝒰′_∞)_χ are annihilated by [F:F′]².

**Hypotheses and conventions.**

- These bounds are the 'character functors and their bounded errors when the group order is divisible by p' of the stage. Since F/F′ is unramified above p, 𝒰_n is cohomologically trivial as an H-module, so α is in fact an isomorphism. The bound by |H| is all that Greither's later arguments use.

**Construction or proof.**

1. Lemma 2.2: if N̄(x̄) = 0, then |H|·x = iN(x) + (|H| − Σσ)x ∈ I_H·X, since Σσ ≡ |H| mod the augmentation ideal; so |H| kills ker N̄. For x′ ∈ X′, |H|x′ = N(i(x′)), so |H| kills coker N̄.
2. Lemma 2.1: the kernel of the norm (𝒰_n)_H → 𝒰_n^H = 𝒰′_n is a Tate cohomology group of H in degree −1, and the cokernel is Ĥ⁰(H, 𝒰_n). Both are annihilated by |H|.
3. Corollary: for A = ker α and B = coker α, taking χ-parts gives A_χ → 𝒰_{∞,χ} → Im(α)_χ → 0 and Tor(ℤ_p(χ), B) → Im(α)_χ → 𝒰′_{∞,χ} → B_χ → 0, with Tor over ℤ_p[Gal(F/ℚ)]. [F:F′] annihilates A_χ, B_χ and the Tor term, so the composite has kernel and cokernel killed by [F:F′]². Coinvariants commute with the inverse limit because the modules are compact.

**Checks.**

- F′ = F: every bound is trivial.
- p ∤ [F:F′]: α_χ is an isomorphism on pro-p parts.

**Sources.** **GREITHER-1992**, §2, the setting, p. 455. The definitions of 𝒰_n, U_n, 𝒞_n, C_n. **GREITHER-1992**, §2, Lemma 2.2, p. 456. Lemma 2.2.

**Direct dependencies.** [L4/greither-chi-parts](#greither-chi-parts).

<a id="greither-circular-unit-limit"></a>
### Generators of the limit of circular units (Greither, Lemma 2.3)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-circular-unit-limit`**.

Let p be a prime, F/ℚ abelian with p ∤ cond(F), K_n = F(ζ_{2p^{n+1}}) (so K_0 = F(√−1) when p = 2), K_∞ = ∪K_n, 𝒰_n = (ℤ_p ⊗ 𝒪_{K_n})^× the semilocal units above p, U_n its pro-p part, 𝒞_n Sinnott's circular units of K_n and C_n the pro-p part of their closure in 𝒰_n; 𝒰_∞, U_∞, 𝒞_∞, C_∞ the inverse limits; t = 1 for odd p and t = 2 for p = 2. Let m = cond(F) and G = Gal(K_∞/ℚ). For 1 ≠ m′ | m put η_{m′,F} = (N_{ℚ(m′)/ℚ(m′)∩F}(1 − ζ_{m′}^{p^{−ν}}·ζ_{p^{ν+t}}))_{ν∈ℕ}, a norm-coherent sequence. Then, up to a finite torsion group of order prime to p, 𝒞_∞ is the closure of the ℤ_pG-span of {±η_{m′,F} : 1 ≠ m′ | m} ∪ 𝒞_∞(ℚ(ζ_{p^∞})).

**Hypotheses and conventions.**

- Sinnott's circular numbers D(k) = ℤ[Gal(k/ℚ)]-span{±N_{ℚ(n)/ℚ(n)∩k}(1 − ζ_n^a)} and circular units D(k) ∩ 𝒪_k^× are requested with IntegralIwasawaTheory L0 ('variants and correction factors for general abelian fields').

**Construction or proof.**

1. ⊇ is the definition: the η_{m′,F} are norm-coherent circular units.
2. Remark 1: if some relative norm of a circular number x is a unit, then x is a unit, hence a circular unit (Sinnott, p. 202).
3. Remark 2: in D(k) one may take a = 1, since N_{ℚ(n)/ℚ(n)∩k}(1 − ζ_n^a) is a Galois conjugate of the element for n/gcd(n, a).
4. Remark 3: for k of conductor dividing m, D(k) ∩ 𝒪_k[1/m]^× = ⟨±N_{ℚ(n)/ℚ(n)∩k}(1 − ζ_n) : n | m⟩. Indices n not prime to m reduce to gcd(n, m). For n prime to m, k ∩ ℚ(n) = ℚ, so those factors are integers prime to m, hence ±1.
5. ⊆: it suffices that the universal norms in D_ν lie in A_ν, the closure of the Galois span of the η_{m′,F} at level ν and 𝒞_ν(ℚ). The key claim (**) is N_{ν+μ/ν}(D_{ν+μ}) ⊆ A′_ν·(D_ν)^{p^μ}. For x(n), n = m′p^a: when a ≤ ν + t the norm is a p^μ-th power; when a > ν + t and m′ ≠ 1, x(n) is in the Galois span of η_{m′,F}; when m′ = 1 it lies in the cyclotomic part.
6. Let μ → ∞, intersect with the global units (Remark 1), and pass to closures and the limit.

**Checks.**

- F = ℚ: m = 1, so there are no η's, and 𝒞_∞ = 𝒞_∞(ℚ(ζ_{p^∞})), the cyclotomic units of ℚ(μ_{p^∞}).
- The prime-to-p torsion (±1 and roots of unity of order prime to p) disappears on pro-p parts.

**Sources.** **GREITHER-1992**, §2, Lemma 2.3, p. 456. Lemma 2.3. **GREITHER-1992**, §2, proof of Lemma 2.3, p. 457. The inclusion ⊆.

**Direct dependencies.** [L4/greither-semilocal-norm-descent](#greither-semilocal-norm-descent); `IntegralIwasawaTheory:L0/abelian-circular-unit-variant`.

<a id="greither-coleman-sequence-all-p"></a>
### Coleman's exact sequence over unramified coefficients, including p = 2 (Greither, Theorem 2.4–Corollary 2.7)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-coleman-sequence-all-p`**.

Let p be a prime, 𝒪 a finite unramified étale ℤ_p-algebra (a finite product of unramified DVRs) with Galois group Δ and primitive idempotents e_1, …, e_g, Frob its Frobenius, 𝒪[[X]]° = {f : f(0) ≡ 1 mod p}, φ: 𝒪[[X]] → 𝒪[[X]] the ℤ_p-algebra endomorphism with φ|_𝒪 = Frob and φ(1 − X) = (1 − X)^p, and Γ′ = ℤ_p^× acting by [a](1 − X) = (1 − X)^a. (Theorem 2.4) After fixing ζ = (ζ_{p^{ν+t}}) generating ℤ_p(1), for odd p there is an exact sequence of Δ × Γ′-modules 0 → ℤ_p(1)^g → 𝒪[[X]]° → 𝒪[[X]] → ℤ_p(1)^g → 0, the middle map being (1 − φ/p)∘log. For p = 2 the outer terms are (ℤ_2(1) × {±1})^g. The i-th factor maps by ζ ↦ e_i(1 − X) (and −1 ↦ −e_i for p = 2), and the last map is f ↦ ζ^{Tr(e_if′(0))}, with a second component (−1)^{Tr(e_if(0))} for p = 2. (Lemma 2.5, Theorem 2.6) With R = 𝒪[[Γ′]] and 𝒱 = ker(ψ) for Coleman's trace operator ψ: 𝒪[[X]] = R·(1 − X) + φ(𝒪[[X]]) and 𝒱 = R·(1 − X), that is, the ℤ_p[[Γ′]]-span of 𝒪·(1 − X). (Corollary 2.7) D = (1 − X)d/dX satisfies D𝒱 = 𝒱 and gives an R-isomorphism 𝒱 → 𝒱(1).

**Hypotheses and conventions.**

- The input is Coleman's Division values in local fields, Theorem 2.2, for the multiplicative formal group over an unramified 𝒪_H, with torsion 𝒞 = {±1} at p = 2. Also Coleman's Local units modulo circular units, Lemma 2 and Theorem 3. These are requested from ColemanPowerSeries L1 and L3, whose coefficient extension (L0) covers unramified 𝒪; the p = 2 case is part of the request.

**Construction or proof.**

1. Reduce to g = 1 (𝒪 a domain) using the idempotents.
2. Coleman's sequence is 0 → 𝒞[+][𝒜_∞]X → ℱ(𝔪) → A → 0 with Θ_ℱ = Θ∘λ. Here λ = log (the Lubin–Tate logarithm of G_m) and Θf = f − φf/π with π = p, so Θ_ℱ = (1 − φ/p)log. ℱ(𝔪) = 𝒪[[X]]°.
3. 𝒞 is the torsion ≡ 1 mod p: trivial for odd p and {±1} for p = 2. [𝒜_∞]X is the topological span of the (1 − X)^a, which is Γ′-isomorphic to ℤ_p(1).
4. A = {g : g′(0) ∈ (1 − Frob)𝒪} for odd p; for p = 2 also g(0) ∈ 2𝒪 + (1 − Frob)𝒪. Since (1 − Frob)𝒪 = ker(Tr: 𝒪 → ℤ_p), A is the kernel of the last map, which is surjective.
5. Lemma 2.5 and Theorem 2.6 as in Coleman's second paper, Lemma 2 and Theorem 3, using ψφ(g) = p·Frob(g) (so ψφ is injective) and ψ(1 − X) = 0.
6. Corollary 2.7: D(1 − X) = −(1 − X), and D([a]g) = a·[a]D(g) (chain rule), so D commutes with R up to the twist. ker D = 𝒪 and 𝒪 ∩ 𝒱 = 0 (ψ is multiplication by p on 𝒪).

**Checks.**

- p = 2 differs only by the ±1 torsion, which appears in the first and last terms.

**Sources.** **GREITHER-1992**, §2, before Theorem 2.4, p. 458. The set-up with 𝒪 unramified. **GREITHER-1992**, §2, proof of Theorem 2.4, p. 459. The translation from Coleman's Theorem 2.2.

**Direct dependencies.** `ColemanPowerSeries:L1`; `ColemanPowerSeries:L3`; `mathlib:PowerSeries`; `ColemanPowerSeries:L1/unramified-interpolation-equivalence`; `ColemanPowerSeries:L1/unramified-interpolation-frobenius-equivariant`.

<a id="greither-semilocal-coleman-map"></a>
### The semilocal Coleman map and its kernel and cokernel (Greither, Theorem 2.8, Lemma 2.9, Proposition 2.10)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-semilocal-coleman-map`**.

In the setting of the previous lemma, let 𝒩 be Coleman's norm operator, 𝔐 = {f ∈ 𝒪((X))^× : 𝒩f = Frob(f)} and 𝔐° = 𝔐 ∩ 𝒪[[X]]°. (Theorem 2.8) There is an exact sequence 0 → ℤ_p(1)^g → 𝔐° → 𝒱 → ℤ_p(1)^g → 0, the middle map being β = (1 − φ/p)log. (Lemma 2.9) With U_i = {x ∈ 𝒪[ζ_{p^{i+1}}] : x ≡ 1 mod (1 − ζ_{p^{i+1}})}, the map a ↦ f_a (Coleman's interpolating series, f_a(1 − ζ_{p^{i+t}}) = Frob^i(a_i)) is a ℤ_p[[Γ′]]-isomorphism U_∞ = lim U_i → 𝔐°. (Proposition 2.10) With δ = D∘log and α = Dβ = (1 − φ)δ, there are exact sequences of ℤ_p[[Γ′]][Δ]-modules 0 → ℤ_p(1)^g → 𝔐° →α 𝒱(1) → ℤ_p(1)^g → 0 and 0 → ℤ_p(1)^g → U_∞ →αψ 𝒱(1) → ℤ_p(1)^g → 0.

**Construction or proof.**

1. Theorem 2.8. 1 − X ∈ 𝔐 since 𝒩(1 − X) = 1 − X = Frob(1 − X). Claim: the preimage of 𝒱 under β is 𝔐° (odd p), respectively ±𝔐° (p = 2). Using ψφ = p·Frob and ψ∘log = log∘𝒩, one gets ψβ(f) = log(𝒩f/Frob f). This is 0 exactly when 𝒩f/Frob f is a root of unity ≡ 1 mod p𝒪: 1 for odd p, ±1 for p = 2, and 𝒩(−1)/Frob(−1) = −1.
2. The maps 𝒪[[X]] → (ℤ_p(1)[×{±1}])^g and 𝒱 → ℤ_p(1)^g have the same kernel, and the second is surjective (take y·(1 − X), y ∈ 𝒪). For p = 2 this uses that g′(0) determines g(0) mod 2 for g ∈ 𝒱, by Theorem 2.6. Combine with Theorem 2.4.
3. Lemma 2.9 is Coleman's Corollary 17, with Theorem 16 for the existence and uniqueness of f_a. 𝒪 may be a finite product of unramified rings.
4. Proposition 2.10: all maps are Δ-equivariant. The first sequence combines Corollary 2.7 with Theorem 2.8, using Dφ = pφD, so D(1 − φ/p) = (1 − φ)D. The second follows through Lemma 2.9.

**Checks.**

- The kernel ℤ_p(1)^g is the Tate module of the roots of unity, one copy per factor of 𝒪.
- The cokernel ℤ_p(1)^g is the cyclotomic moment; its ρ-part vanishes when χ(p) ≠ 1.

**Sources.** **GREITHER-1992**, §2, proof of Theorem 2.8, p. 462. Lemma 2.9. **GREITHER-1992**, §2, Proposition 2.10, p. 462. Proposition 2.10.

**Direct dependencies.** [L4/greither-coleman-sequence-all-p](#greither-coleman-sequence-all-p); `ColemanPowerSeries:L1`; `ColemanPowerSeries:L3`; `ColemanPowerSeries:L1/unramified-interpolation-equivalence`; `ColemanPowerSeries:L1/unramified-interpolation-frobenius-equivariant`.

<a id="greither-circular-unit-generators"></a>
### One generator per character for the circular units (Greither, Lemma 2.11 and Corollary 2.12)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-circular-unit-generators`**.

Let p be a prime, F/ℚ abelian with p ∤ cond(F), K_n = F(ζ_{2p^{n+1}}) (so K_0 = F(√−1) when p = 2), K_∞ = ∪K_n, 𝒰_n = (ℤ_p ⊗ 𝒪_{K_n})^× the semilocal units above p, U_n its pro-p part, 𝒞_n Sinnott's circular units of K_n and C_n the pro-p part of their closure in 𝒰_n; 𝒰_∞, U_∞, 𝒞_∞, C_∞ the inverse limits; t = 1 for odd p and t = 2 for p = 2. Let F be unramified over p, 𝒪 = ℤ_p ⊗ 𝒪_F, Δ = Gal(F/ℚ), and for a p-adic character χ of Δ and a ℤ_p[Δ]-module M let V_χ(M) = ℚ_p ⊗ M ⊗_{ℤ_p[Δ]} ℤ_p[χ]. Let χ have conductor m | cond(F) and F′ = F ∩ ℚ(m). (a) V_χ(ℚ_p ⊗_ℚ F) is generated over ℚ_pΔ by y_χ = (Tr_{ℚ(m)/F′}(ζ_m))_χ. (b) If χ ≠ 1, V_χ(C_∞) = V_χ(ℤ_p[[Γ′]][Δ])·(η_m)_χ with η_m = (N_{ℚ(m)/F′}(1 − ζ_mζ_{p^{ν+t}})^{Frob^{−ν}})_ν. (Corollary 2.12) V_χ(𝒱) is free of rank one over ℚ_p ⊗ ℤ_p(χ)[[Γ′]] on z_χ = y_χ·(1 − X).

**Hypotheses and conventions.**

- Greither writes 'F′ = F ∩ ℚ(M)'. M is not defined; ℚ(m) is meant (source issue E14).
- Greither's R is 𝒪[[Γ′]] on p. 460 but ℤ_p[[Γ′]] in Lemma 2.11(b), Corollary 2.12 and p. 465 (source issue E16); the node names each ring explicitly.

**Construction or proof.**

1. (a) ℚ_pF is generated by the x_{m′} = Tr_{ℚ(m′)/F∩ℚ(m′)}(ζ_{m′}), m′ | cond(F), by additive normal bases. ker χ acts trivially on V_χ, so ℚ_pF′ surjects onto V_χ(ℚ_pF). For a proper divisor m′ of m, pick a ≡ 1 mod m′ with χ(a) ≠ 1; then σ_a fixes x_{m′} and multiplies its image by χ(a), so the image is 0.
2. (b) By Lemma 2.3, C_∞ is generated by −1, the η_{m′} and the cyclotomic part C_0. Tensoring with ℚ_p, the fixed part under ker χ comes from F^{ker χ} (norm argument). As in (a) only η_m survives; C_0 dies because χ is nontrivial, and −1 dies in the pro-p part (odd p) or after ⊗ℚ_2 (p = 2).
3. Corollary 2.12: by (a), p^N·𝒪_χ ⊆ (ℤ_pΔ)·y_χ for some N. 𝒱 is the ℤ_p[[Γ′]]-span of 𝒪·(1 − X) (Theorem 2.6), so p^N·V_χ(𝒱) lies in the ℤ_p[[Γ′]][Δ]-span of y_χ(1 − X). That element is nonzero, and ℚ_p ⊗ ℤ_p(χ)[[Γ′]] is a PID, so V_χ(𝒱) is free on it.

**Checks.**

- For odd p, ±1 disappears in the pro-p part; for p = 2 it disappears only after ⊗ℚ_2, which is why V_χ is used.

**Sources.** **GREITHER-1992**, §2, before Lemma 2.11, p. 463. Working over ℚ_p, one character at a time.

**Direct dependencies.** [L4/greither-circular-unit-limit](#greither-circular-unit-limit); [L4/greither-coleman-sequence-all-p](#greither-coleman-sequence-all-p); [L4/greither-chi-parts](#greither-chi-parts).

<a id="greither-stickelberger-image"></a>
### The Coleman image of the circular units is the Stickelberger series (Greither, Theorem 2.13 and Lemma 2.15)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-stickelberger-image`**.

Let p be a prime, F/ℚ abelian with p ∤ cond(F), K_n = F(ζ_{2p^{n+1}}) (so K_0 = F(√−1) when p = 2), K_∞ = ∪K_n, 𝒰_n = (ℤ_p ⊗ 𝒪_{K_n})^× the semilocal units above p, U_n its pro-p part, 𝒞_n Sinnott's circular units of K_n and C_n the pro-p part of their closure in 𝒰_n; 𝒰_∞, U_∞, 𝒞_∞, C_∞ the inverse limits; t = 1 for odd p and t = 2 for p = 2. Let F be unramified over p, Δ = Gal(F/ℚ), Δ′ = Gal(K_0/ℚ) = Δ × Φ, Γ = Gal(K_∞/K_0), and Λ_ρ = ℤ_p(ρ)[[T]] with the involution T′ = (1 + T)^{−1} − 1. For every even nontrivial character ρ of Δ′ with χ = ωρ^{−1}: αψ(V_ρ(C_∞)) = G_p(T′, ρ)·z_{χ^{−1}} ⊂ V_ρ(𝒱(1)) = (V_{χ^{−1}}(𝒱))(1), where G_p(T, ρ) is the Stickelberger series (Washington's f(T, ρ)).

**Hypotheses and conventions.**

- The statement is over ℚ_p (V_ρ). Greither expects an integral version (Remark, p. 468), which is not claimed.
- Lemma 2.15(b) as printed has ζ_mζ_{p^{ν′−1}} in its second term where ζ_m^p·ζ_{p^{ν′−1}} is meant (E15). The proof's left-hand side has the correct ζ_m^p.

**Construction or proof.**

1. Let m = cond(ρ|Δ) and η = η_m. By Lemma 2.11(b), applied to ρ|Δ, it suffices that αψ(η_ρ) = G_p(T′, ρ)·z_{χ^{−1}} in V_{χ^{−1}}(𝒱).
2. Let f_0 = ζ_mX + (1 − ζ_m) and e = |(𝒪/p𝒪)^×|. Then f_0^e ≡ 1 mod p and 𝒩(f_0) = Frob(f_0), so f_0^e ∈ 𝔐°, and ψ(η^e) = N_{ℚ(m)/ℚ(m)∩F}(f_0^e). It suffices that (1 − φ)δ(f_0)_{χ^{−1}} = (G_p(T′, ρ)·ζ_m(1 − X))_{χ^{−1}}, then take the norm.
3. Evaluate at X = 1 − ζ_{p^{ν′}} (ν′ = ν + t); these evaluations separate points. The left side: δ(f_0) = (1 − X)ζ_m/(ζ_mX + 1 − ζ_m), so (1 − φ)δ(f_0)|_{1−ζ_{p^{ν′}}} = ζ_{p^{ν′}}ζ_m/(1 − ζ_{p^{ν′}}ζ_m) − ζ_{p^{ν′−1}}ζ_m^p/(1 − ζ_{p^{ν′−1}}ζ_m^p).
4. The right side: with q_ν = m·p^{ν′} and the Stickelberger elements ξ′_ν(ρ) = −q_ν^{−1}Σ_a a·ρω^{−1}(a)γ_ν(a) (Washington, p. 118), G_p(T′, ρ) = lim ξ′_ν(ρ). Then q_ν·G_p(T′, ρ)z_{χ^{−1}}|_{1−ζ_{p^{ν′}}} = −(Σ_{(a,q_ν)=1} a(ζ_mζ_{p^{ν′}})^a)_{χ^{−1}}.
5. Lemma 2.15: (a) Σ_{a=1}^{q_ν} a·x^a = −q_ν·x/(1 − x) for x = ζ_mζ_{p^{ν′}}, a root of unity of order q_ν, x ≠ 1. (b) Removing the multiples of p gives Σ_{(a,p)=1} a·x^a = −q_ν·x/(1 − x) + q_ν·x^p/(1 − x^p), with x^p = ζ_m^pζ_{p^{ν′−1}}. So the terms with (a, p) = 1 give the left side.
6. The terms with (a, m) > 1 lie in ℚ(ζ_d, ζ_{p^{ν′}}) for proper divisors d of m. Their χ^{−1}-part vanishes because m is the conductor (as in Lemma 2.11), so they contribute 0.

**Checks.**

- m = 1 is excluded: ρ|Δ trivial would make ρ = 1 on Δ′ unless ρ is a power of ω; the trivial ρ is excluded, and V_1(U_∞/C_∞) = 0 (Greither's Remark, p. 466).
- The Lemma 2.15 identities, checked numerically: (m, p, ν′) = (3, 2, 2), (5, 3, 1), (7, 2, 3), (3, 5, 1) agree to 10^{−13} with ζ_m^p in (b) and differ by 8 to 21 with the printed ζ_m.

**Sources.** **GREITHER-1992**, §2, proof of Theorem 2.13, p. 466. The reduction to one generator. **GREITHER-1992**, §2, proof of Theorem 2.13, right-hand side, p. 467. The Stickelberger computation; Lemma 2.15(b) is misprinted (source issue E15). **GREITHER-1992**, §2, Remark after Theorem 2.13, p. 468. Greither's remark that an integral version is expected.

**Direct dependencies.** [L4/greither-semilocal-coleman-map](#greither-semilocal-coleman-map); [L4/greither-circular-unit-generators](#greither-circular-unit-generators); `DirichletPadicLFunctions:L2`; `mathlib:Finset.prod_range_succ`.

<a id="greither-semilocal-units"></a>
### Semilocal units modulo circular units (Greither, Theorem 2.13 and Corollary 2.14)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-semilocal-units`**.

Let p any prime (p = 2 included), F/ℚ abelian and unramified at p, K_n = F(ζ_{2p^{n+1}}) (so K_0 = F(√−1) when p = 2), K_∞ = ∪K_n, Δ′ = Gal(K_0/ℚ), Γ = Gal(K_∞/K_0) ≅ ℤ_p, and Λ_χ = ℤ_p(χ)[[T]], and ρ an even nontrivial character of Δ′, with χ = ωρ^{−1}. Then Q_p ⊗ (U_∞/C_∞)_ρ and Q_p(χ)[[T]]/(G_p(T, ρ))*(1) have the same characteristic ideal over Q_pΛ_ρ, and they are isomorphic if χ(p) ≠ 1. Here U_∞ and C_∞ are the pro-p parts of the limits of semilocal units and of Sinnott's circular units, G_p(T, ρ) is Washington's f(T, ρ) with L_p(s, ρ) = G_p(u^s − 1, ρ), and * means Δ′ × Γ acts through the inverse. This is the form of Iwasawa's and Gillard's theorem for all p that Greither proves in §2.

**Hypotheses and conventions.**

- The proof uses Coleman's theory adapted to unramified coefficients and p = 2 (L4/greither-coleman-sequence-all-p, L4/greither-semilocal-coleman-map). Coleman's own theorems are requested from ColemanPowerSeries L1 and L3.
- Characteristic ideals are compared after ⊗Q_p, so only up to powers of p. The μ = 0 input of §3 removes these.

**Construction or proof.**

1. Theorem 2.13 (L4/greither-stickelberger-image) gives αψ(V_ρ(C_∞)) = G_p(T′, ρ)·z_{χ^{−1}}, and z_{χ^{−1}} is a free generator (Corollary 2.12). So V_ρ(𝒱(1))/αψ(V_ρ(C_∞)) ≅ ℚ_p(χ^{−1})[[T]]/(G_p(T′, ρ))(1), and T ↦ T′ turns it into (ℚ_p(χ)[[T]]/(G_p(T, ρ)))*(1).
2. Proposition 2.10 gives 0 → V_ρ(ℤ_p(1)^g) → V_ρ(U_∞/C_∞) → V_ρ(𝒱(1))/αψ(V_ρ(C_∞)) → V_ρ(ℤ_p(1)^g) → 0, using ℤ_p(1)^g ∩ C_∞ = ℤ_p(1) and V_ρ(ℤ_p(1)) = 0 since ρ ≠ ω. Since ℤ_p(1)^g ≅ ℤ_p[Δ/D] ⊗ ℤ_p(1), with D the decomposition group of p, the outer terms vanish when χ(p) ≠ 1.
3. Multiplicativity of characteristic ideals gives the corollary.

**Checks.**

- χ(p) = 1 (p splits in the χ-field): isomorphism is lost, but equality of characteristic ideals remains.

**Sources.** **GREITHER-1992**, §2, Theorem 2.13 and Corollary 2.14, p. 465. The corollary. **GREITHER-1992**, §2, proof of Corollary 2.14, p. 465. The sequence with the outer terms.

**Direct dependencies.** [L4/greither-chi-parts](#greither-chi-parts); [L4/greither-semilocal-coleman-map](#greither-semilocal-coleman-map); [L4/greither-stickelberger-image](#greither-stickelberger-image); [L4/greither-semilocal-norm-descent](#greither-semilocal-norm-descent); `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`.

<a id="greither-chebotarev-at-two"></a>
### Kolyvagin primes with prescribed class and Kummer symbol, including p = 2 (Greither, Theorem 3.7 and Corollary 3.8)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-chebotarev-at-two`**.

Let K/ℚ be real abelian, G = Gal(K/ℚ), M a power of p (M ≥ 4 if p = 2), c ∈ A(K), W ⊆ K^×/K^{×M} a finite ℤ[G]-submodule and ψ: W → (ℤ/M)[G] a G-homomorphism; let 2^c be the exact power of 2 dividing cond(K). Then there are infinitely many primes λ of K such that, with ℓ the rational prime below λ and the bracketed factors present only for p = 2: (1) [λ] = [2^{c+2}]·c in A(K); (2) ℓ ≡ 1 mod M and ℓ splits completely in K; (3) (w)_ℓ = 0 in 𝒥_ℓ/M𝒥_ℓ for all w ∈ W, and there is u ∈ (ℤ/M)^× with φ_ℓ(w) = [2^{c+2}]·u·ψ(w)λ for all w ∈ W. (Complement) For K = K_ν^+ and p = 2 the factor 2^{c+2} may be replaced by 4. (Corollary 3.8) For K = K_ν^+ and every p, the conclusions hold with [λ] = p²·c and φ_ℓ(w) = p²·u·ψ(w)λ. Here 𝒥_ℓ is the group of divisors above ℓ and φ_ℓ: (𝒪_K/ℓ)^× → 𝒥_ℓ/M𝒥_ℓ is Rubin's map (Lemma 3.5).

**Hypotheses and conventions.**

- For odd p this is Rubin's Theorem 3.1 (The main conjecture, appendix to Lang's Cyclotomic Fields), requested with EulerSystemsAndKolyvaginSystems ES.4 (ES.1's Chebotarev step). Lemmas 3.5 (the map φ_ℓ) and 3.6 (the Euler-system identities (κ_r)_ℓ = 0 for ℓ ∤ r and (κ_{ℓr′})_ℓ = φ_ℓ(κ_{r′})) are Rubin's Lemmas 2.3 and 2.4.
- H is the 2-class field of K in the wide sense, so Gal(H/K) ≅ A(K); the Chebotarev input and the class field theory are requested (IntegralIwasawaTheory L1 and the Tau Ceti ClassFieldTheory request).

**Construction or proof.**

1. Claim (a): [H ∩ K′ : K] ≤ 2^c, and H ∩ K′ = K for K = K_ν^+. If c > 0, 2 ramifies in K/ℚ with exponent at most 2^{c−1}, so the primes above 2 ramify in K′/K with exponent at least M/2^c. For K = K_ν^+ the only subfield of K′ unramified everywhere over K is K.
2. Claim (b): Gal(H ∩ K″/K) is killed by 2^{c+1} (by 2 for K = K_ν^+). Complex conjugation j of K′ acts as −1 on Gal(K″/K′) and trivially on Gal(HK′/K′), so K″ ∩ HK′/K′ is 2-elementary; combine with (a).
3. Claim (c): the Kummer injection Gal(K″/K′) → Hom(W, μ_M) has cokernel killed by 2. The kernel U of K^×/K^{×M} → K′^×/K′^{×M} embeds in H¹(K′/K, μ_M). With Z = K(μ_4) ∩ K′, either Z = K and |U| ≤ 2, or U is a Klein four group bounded by |H¹(K′/Z, μ_M)|·|H¹(Z/K, μ_M)| ≤ 4.
4. Core: the square Gal(K″H/K) → Gal(K″/K), Gal(H/K) → Gal(K″ ∩ H/K) is cartesian, with lower right term killed by 2^{c+1}. With ι: (ℤ/M)[G] → μ_M, ι(1) = ζ_M and ι(g) = 0 for g ≠ 1, 2ιψ lifts to γ ∈ Gal(K″/K′) by (c). Choose δ ∈ Gal(K″H/K) with δ|K″ = 2^{c+1}γ and δ|H = 2^{c+1}·(c's Artin symbol). Chebotarev gives infinitely many degree-one primes λ with Frobenius δ.
5. δ is trivial on K′, so ℓ ≡ 1 mod M; its class on H gives (1). Comparing 'w is an M-th power mod λ' through γ and through φ_ℓ gives φ_ℓ(w) = 2^{c+2}·u·ψ(w)λ, as in Rubin, p. 403.
6. Complement: for K = K_ν^+, 2 replaces 2^{c+1} in the construction of δ, so the factor becomes 4. Corollary 3.8: for odd p, replace c by p²c and ψ by p²ψ in Rubin's theorem.

**Checks.**

- p = 2 loses only a bounded power of 2 (4 at the layers K_ν^+), which the final argument absorbs.

**Sources.** **GREITHER-1992**, §3, Rubin's maps and Euler systems, p. 471. Every circular number starts an Euler system. **GREITHER-1992**, §3, proof of Theorem 3.7, p. 472. The fields K′ = K(μ_M), K″ = K′(W^{1/M}), H. **GREITHER-1992**, §3, proof of Theorem 3.7, p. 473. The cartesian diagram and the choice of δ. **GREITHER-1992**, §3, Corollary 3.8, p. 474. Corollary 3.8.

**Direct dependencies.** [L4/greither-chi-parts](#greither-chi-parts); `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`; `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`; `IntegralIwasawaTheory:L1`.

<a id="greither-finite-level-links"></a>
### Links between the Iwasawa modules and the finite layers, with bounded constants (Greither, Lemmas 3.9–3.11)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-finite-level-links`**.

Let F/ℚ be abelian and unramified at p, K_n = F(ζ_{2p^{n+1}}), Δ = Gal(K_0^+/ℚ), G_n = Gal(K_n^+/ℚ), Γ_n = Gal(K_n^+/K_0^+), γ a generator of Γ = lim Γ_n and γ_n = γ^{p^n}. Write X = lim A(K_n^+), and E_∞, C_∞ for the plus-part limits of the global units and circular units. For an even character χ ≠ 1 of Δ put Λ_χ = ℤ_p(χ)[[T]], Λ_{n,χ} = Λ_χ/(1 − γ_n), and let H_χ generate char((E_∞/C_∞)_χ). Fix a quasi-isomorphism X_χ → ⊕_{i=1}^k Λ_χ/(g_i), so that char(X_χ) = (g) with g = g_1⋯g_k. (Lemma 3.9) There are c_1 = c_1(F) and G_n-maps ϑ_n: E_{n,χ} → Λ_{n,χ} with (γ − 1)²p^{c_1}·H_χ·Λ_{n,χ} ⊆ ϑ_n(im C_{n,χ}) ⊆ p^{−c_1}·H_χ·Λ_{n,χ}. (Lemma 3.10) There are c_2 = c_2(F) and G_n-maps τ_n: A_{n,χ} → ⊕_i Λ_{n,χ}/(g_i) with p^{c_2}·coker(τ_n) = 0. (Lemma 3.11) γ − 1 acts on X with finite kernel and cokernel.

**Hypotheses and conventions.**

- Rubin's Lemma 1.2 (Invent. Math. 93 (1988)) bounds (γ − 1)Ĥ^i(Γ_{mn}, E_m) for i ∈ {−1, 0} uniformly. Greither notes that its hypothesis '[K_0^+ : ℚ] prime to p' is not used in full: it suffices that the primes above p are totally ramified in K_∞^+/K_0^+ and that K_0^+ is linearly disjoint from the cyclotomic ℤ_p-extension of ℚ. Requested with IntegralIwasawaTheory L2.

**Construction or proof.**

1. Lemma 3.9. The sequence 0 → lim H^{−1}(Γ_{mn}, E_m) → (E_∞)_{1−γ_n} → E_n → lim H⁰(Γ_{mn}, E_m) → 0 has outer terms killed by (γ − 1)p^κ.
2. V_χ(U_∞) is free cyclic over ℚ_p ⊗ Λ_χ (proof of Corollary 2.14), hence so is V_χ(E_∞). This gives α: E_{∞,χ} → Λ_χ with finite cokernel and kernel killed by a power of p.
3. A Tor argument gives 0 → A_n → (E_{∞,χ})_{1−γ_n} → E_{n,χ} → B_n → 0 with (γ − 1)p^{c′} killing A_n and B_n. Maps ϑ_n then fit a square with (γ − 1)²p^{2c′}α on top (Rubin, p. 705).
4. H_χ·(α(E_{∞,χ})/α(im C_{∞,χ})) is finite, so p^sH_χ ∈ α(im C_{∞,χ}), giving (γ − 1)²p^{s+2c′}H_χΛ_{n,χ} ⊆ ϑ_n(im C_{n,χ}). Also p^{s′}·im C_{∞,χ} ⊆ H_χE_{∞,χ}, because ℚ_pE_{∞,χ} is cyclic. Take c_1 = max(s′, s + 2c′).
5. Lemma 3.11. X is finitely generated Λ-torsion, so it suffices that Z = X/(γ − 1)X is finite. Z is the Galois group of the maximal unramified p-extension N of K_∞^+ that is abelian over K_0^+. N is unramified outside p and is a compositum of finitely many ℤ_p-extensions and a finite extension. By Leopoldt for the real abelian K_0^+ its only ℤ_p-extension is K_∞^+, so N/K_∞^+ is finite.
6. Lemma 3.10. By Washington, p. 278, A_n ≅ X/Y_n with Y_n = ((1 − γ_n)/(1 − γ))·Y_0 and (γ − 1)X ⊆ Y_0 ⊆ X. So the kernel of X/(1 − γ_n)X → A_n is a quotient of Y_0/(γ − 1)X, which is finite by 3.11. The kernels are bounded, the same holds on χ-parts (Tor), and τ_n comes from the quasi-isomorphism.

**Checks.**

- The constants c_1, c_2 depend on F only, not on n; this is what the induction needs.

**Sources.** **GREITHER-1992**, §3, Lemmas 3.9–3.10, p. 475. Lemmas 3.9 and 3.10. **GREITHER-1992**, §3, Lemma 3.11 and the proof of 3.10, p. 477. The proof of Lemma 3.10.

**Direct dependencies.** [L4/greither-chi-parts](#greither-chi-parts); [L4/greither-semilocal-units](#greither-semilocal-units); `IntegralIwasawaTheory:L2`; `IntegralIwasawaTheory:L4/abelian-leopoldt`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`.

<a id="greither-kolyvagin-step"></a>
### The Kolyvagin step and the Maschke lift (Greither, Lemmas 3.12–3.13)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-kolyvagin-step`**.

(Lemma 3.12) Let K/ℚ be real abelian, G = Gal(K/ℚ), Δ ⊆ G, χ a character of Δ, M a power of p, r = ℓ_1⋯ℓ_ν ∈ 𝒮_{M,K}, ℓ = ℓ_ν, λ a prime of K above ℓ, and c = [λ] ∈ A = A(K). Let B ⊆ A be generated by the classes of the primes above ℓ_1, …, ℓ_{ν−1}. Let x ∈ K^×/K^{×M} with (x)_{[q]} = 0 for every prime q ∤ r, and W its ℤ_p[G]-span. Suppose E, g, η ∈ ℤ_p[G] satisfy (i) E·Ann((c)_χ ∈ (A/B)_χ) ⊆ g·(ℤ_p[G])_χ; (ii) (ℤ_p[G])_χ/(g) is finite; (iii) M ≥ |A_χ|·|η·((𝒥_ℓ/M𝒥_ℓ)/(W)_{[ℓ]})_χ|. Then there is a G-homomorphism ψ: W_χ → (ℤ/M)[G]_χ with (g·ψ(x)λ)_χ = E·η·(x_{[ℓ]})_χ. (Lemma 3.13) For a ℤ_p[Δ]-module N and π: N → N_χ the projection, there is a ℤ_p[Δ]-map ε_χ: N_χ → N with π∘ε_χ = |Δ|·id.

**Construction or proof.**

1. Lemma 3.12. Choose a lift β of x and write (β)_{[ℓ]} = v_λ(β)λ, where ℓ splits totally in K. Since M·A_χ = 0 by (iii), the image of (β)_{[ℓ]} in (A/B)_χ is that of the principal ideal (β), hence trivial. So v_λ(β) kills (c)_χ, and by (i) E·v_λ(β)_χ = g·δ in R = (ℤ_p[G])_χ.
2. Division by g is unique in R, which has no ℤ_p-torsion and R/(g) finite by (ii). Define ψ(ρx) = ηρδ mod MR. Then g·ψ(x)λ = η·E·v_λ(β) = E·η·(x)_{[ℓ]}.
3. Well-definedness: if ρx = 0, then ρβ = y^M. By (iii) and h = |A_χ|, ηρ kills M·h^{−1}(𝒥_ℓ/M𝒥_ℓ)_χ ≅ R/hR, so h | ηρ in R/MR. Writing (y) over the primes q, multiplying by η and passing to (A/B)_χ shows that η·v_λ(y) kills c_χ. By (i), E·η·v_λ(y)_χ ∈ gR, hence E·η·v_λ(ρx) ∈ MgR, and ηρδ ∈ MR.
4. Lemma 3.13 (Maschke): reduce to N = ℤ_p[Δ], N_χ = ℤ_p(χ); with f a ℤ_p-linear section of π, ε_χ(y) = Σ_{δ∈Δ} δf(δ^{−1}y).

**Checks.**

- The factor |Δ| from 3.13 and the factors p² from Corollary 3.8 are what the induction accumulates.

**Sources.** **GREITHER-1992**, §3, before Lemma 3.12, p. 477. After Rubin's Lemma 7.1. **GREITHER-1992**, §3, Lemma 3.13, p. 479. The factor |Δ| from Maschke.

**Direct dependencies.** [L4/greither-chi-parts](#greither-chi-parts); [L4/greither-chebotarev-at-two](#greither-chebotarev-at-two); `EulerSystemsAndKolyvaginSystems:ES.4/rubin-hypotheses`; `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`.

<a id="greither-real-main-conjecture"></a>
### The real main conjecture for all p (Greither, Theorem 3.1)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-real-main-conjecture`**.

Let p any prime (p = 2 included), F/ℚ abelian and unramified at p, K_n = F(ζ_{2p^{n+1}}) (so K_0 = F(√−1) when p = 2), K_∞ = ∪K_n, Δ′ = Gal(K_0/ℚ), Γ = Gal(K_∞/K_0) ≅ ℤ_p, and Λ_χ = ℤ_p(χ)[[T]]. For every even character ρ ≠ 1 of K_0, the characteristic ideal of the Λ_ρ-module X_ρ (X = lim A_p(K_n)) divides the characteristic ideal of (E_∞/C_∞)_ρ, where E_∞ is the limit of the pro-p parts of the closures of the global units. For ρ = 1 both are (1). Equality holds, as a by-product of the proof of Theorem 3.2. X and E_∞/C_∞ may be replaced by their plus parts.

**Hypotheses and conventions.**

- The proof is Kolyvagin–Rubin's Euler system of circular units (Rubin, Invent. Math. 103 (1991)). Every circular number starts an Euler system (Greither §3, via Lemma 2.3).
- For p = 2, Rubin's Chebotarev step is replaced by Greither's Theorem 3.7 (L4/greither-chebotarev-at-two), which loses a factor 2^{c+2}, or 4 at the layers K_n^+.
- Factors of p and (γ − 1) accumulate through Lemmas 3.9–3.13; they are removed at the end using μ = 0 (Ferrero–Washington) and Leopoldt for real abelian fields.

**Construction or proof.**

1. Reduce to plus parts and to even χ ≠ 1: for χ = 1, X_χ is quasi-isomorphic to lim A(ℚ_ν) = 0.
2. Fix n, K = K_n^+, h a power of p with h ≥ |Λ_{n,χ}/(H_χ)|, |Λ_{n,χ}/(ord Δ)|, |Λ_{n,χ}/(p)|, and M = |A_χ|·h^{3k+ck+1} with c = max(c_1, c_2). By Lemma 3.10 choose c_i ∈ A_χ with τ_n(c_i) = p^{c_2} in the i-th place; then p^{c_2}·Ann(c_i in A_χ/(c_1, …, c_{i−1})) ⊆ g_iΛ_{n,χ}. By Lemma 3.9 choose a circular unit ξ with ϑ_n(ξ) = (γ − 1)²p^{c_1}H_χ, and an Euler system starting with ξ.
3. Construct primes λ_1, …, λ_{k+1} of K inductively (Corollary 3.8, Lemmas 3.12–3.13) with [λ_i]_χ = p²c_i, ℓ_i ∈ 𝒮_{M,K}, v_{λ_1}(κ_{ℓ_1}) = unit·|Δ|·(γ − 1)²p^{2+c_1}H_χ, and for 2 ≤ i ≤ k + 1: g_{i−1}·v_{λ_i}(κ_{r_i}) = unit·|Δ|·p^{2+c_2}(γ − 1)^{2^{i−1}}·v_{λ_{i−1}}(κ_{r_{i−1}}). At step i, apply Lemma 3.12 with η = (γ − 1)^{2^{i−1}} and E = p^{c_2}; its hypothesis (iii) is the bound on N = (γ − 1)^{2^{i−1}}(𝒥_{ℓ_{i−1}}/(M, (κ_{r_{i−1}})_{[ℓ_{i−1}]})), where Greither prints the exponent as 2^t (source issue E17).
4. Multiplying out gives g_1⋯g_k·v_{λ_{k+1}}(κ_{r_{k+1}}) = |Δ|^{k+1}p^{k(2+c_2)+(2+c_1)}(γ − 1)^{2^{k+1}}·H_χ = η·H_χ in Λ_{n,χ}/(M). So g divides ηH_χ in Λ_{n,χ}/(p^n) for every n, and hence in Λ_χ (as in Rubin).
5. By Lemma 3.11 and μ = 0 (Ferrero–Washington), η acts on X_χ with finite kernel and cokernel, so η and g are coprime in ℚ_pΛ_χ: p^N = aη + bg. Hence g | p^N·H_χ, and since μ = 0, p ∤ g, so g | H_χ.

**Checks.**

- For odd p and p ∤ [F : ℚ] this is Rubin's III.2.7 (L2/cyclotomic-iwasawa-divisibility).
- p = 2 is new in this source.

**Sources.** **GREITHER-1992**, §3, Theorem 3.1, p. 468. The statement. **GREITHER-1992**, §3, Remark b) after Theorem 3.1, p. 468. The trivial character. **GREITHER-1992**, §3, before Theorem 3.7, p. 471. The p = 2 modification. **GREITHER-1992**, §3, proof of Theorem 3.7, p. 472. Odd p is Rubin's. **GREITHER-1992**, §3, the proof strategy, p. 470. The accumulated factors and their removal. **GREITHER-1992**, §3, the induction, p. 480. The induction. **GREITHER-1992**, §3, the end of the proof, p. 481. g | ηH_χ. **GREITHER-1992**, §3, the end of the proof, p. 482. Removing p and γ − 1.

**Direct dependencies.** [L4/greither-chi-parts](#greither-chi-parts); [L2/cyclotomic-iwasawa-divisibility](#cyclotomic-iwasawa-divisibility); `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses`; `EulerSystemsAndKolyvaginSystems:ES.8/leopoldt-tower-hypothesis`; `EulerSystemsAndKolyvaginSystems:ES.8/rubin-iwasawa-divisibility`; `EulerSystemsAndKolyvaginSystems:ES.8/true-selmer-iwasawa-divisibility`; `IntegralIwasawaTheory:L0/general-conductor-index`; `IntegralIwasawaTheory:L4/fw-arithmetic-mu-zero`; [L4/greither-chebotarev-at-two](#greither-chebotarev-at-two); [L4/greither-finite-level-links](#greither-finite-level-links); [L4/greither-kolyvagin-step](#greither-kolyvagin-step); `IntegralIwasawaTheory:L4/abelian-leopoldt`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`.

<a id="greither-kummer-duality"></a>
### Kummer duality between the odd and even sides (Greither, Lemma 3.3 and Proposition 3.4)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-kummer-duality`**.

Let p any prime (p = 2 included), F/ℚ abelian and unramified at p, K_n = F(ζ_{2p^{n+1}}) (so K_0 = F(√−1) when p = 2), K_∞ = ∪K_n, Δ′ = Gal(K_0/ℚ), Γ = Gal(K_∞/K_0) ≅ ℤ_p, and Λ_χ = ℤ_p(χ)[[T]]. X = lim A_p(K_n) is quasi-isomorphic over Λ to Hom_{ℤ_p}(A_∞, ℚ_p/ℤ_p), where A_∞ = lim→ A_p(K_n) and Λ acts through σ ↦ σ, not its inverse (Lemma 3.3, after Iwasawa and Solomon). For each even ρ, with χ = ωρ^{−1}: V_ρ(Y^+) ≅ V_χ(X)*(1), where Y is the Galois group of the maximal abelian p-ramified p-extension of K_∞ and V = Q_p ⊗ (·) (Proposition 3.4).

**Hypotheses and conventions.**

- Greenberg analyses the Kummer pairing at p = 2 without ⊗Q_p; Greither tensors with Q_p for simplicity, so the duality holds up to finite and p-power errors.

**Construction or proof.**

1. Lemma 3.3 from Iwasawa's quasi-isomorphism over Λ, as in Solomon.
2. Proposition 3.4 from the Kummer pairing between Y^+ and A_∞, as in Greenberg.

**Checks.**

- The twist (1) and the inversion * are what exchange even ρ with odd χ = ωρ^{−1}.

**Sources.** **GREITHER-1992**, §3, Lemma 3.3, p. 469. Lemma 3.3. **GREITHER-1992**, §3, Proposition 3.4, p. 469. Proposition 3.4.

**Direct dependencies.** [L4/greither-chi-parts](#greither-chi-parts); `SelmerIwasawaCohomology:L3/iwasawa-cohomology`; `IntegralIwasawaTheory:L2/class-module-finiteness-torsion`.

<a id="greither-main-conjecture-all-p"></a>
### The main conjecture for all p, with the one-half normalisation (Greither, Theorem 3.2)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-main-conjecture-all-p`** · atlas planet: Main conjecture for all p (Greither).

Let p any prime (p = 2 included), F/ℚ abelian and unramified at p, K_n = F(ζ_{2p^{n+1}}) (so K_0 = F(√−1) when p = 2), K_∞ = ∪K_n, Δ′ = Gal(K_0/ℚ), Γ = Gal(K_∞/K_0) ≅ ℤ_p, and Λ_χ = ℤ_p(χ)[[T]], and X = lim A_p(K_n), X^+ = lim A_p(K_n^+). For every odd character χ ≠ ω of K_0 (with χ̌ = ωχ^{−1}), (X/im X^+)_χ ≅ X_χ canonically, and char(X_χ) = ((1/2)·G_p(T, χ̌)) as ideals of Λ_χ = ℤ_p(χ)[[T]]. For the exceptional character χ=ω, X_ω is finite and its characteristic ideal is (1); the pole-cleared analytic expression is ((1/2)·G_p(T,1)·(T−q₀))=(1). For odd p, 1/2 is a unit, and this is the Mazur–Wiles theorem in odd-character form; for p = 2 the factor 1/2 is essential.

**Hypotheses and conventions.**

- (1/2)G_p(T, ψ) ∈ ℤ_p(ψ)[[T]] for nontrivial ψ, and (1/2)G_p(T, ψ)(T − q₀) is a unit for trivial ψ (Washington pp. 122–125). This is the normalisation Federer gives.

**Construction or proof.**

1. Two exact sequences: 0 → U_∞/E_∞ → Y → X → 0 (class field theory) and 0 → E_∞/C_∞ → U_∞/C_∞ → U_∞/E_∞ → 0.
2. By Theorem 3.1, h_ρ·char(X_ρ) = char((E_∞/C_∞)_ρ). With Corollary 2.14, h_ρ·char(Y_ρ) = char(U_∞/C_∞)_ρ = char(Λ/(½G_p(T, ρ))*(1)).
3. Proposition 3.4 converts char(Y_ρ^+) into char(X_χ*(1)), so char(X_χ) divides (½G_p(T, χ̌)) for every odd χ ≠ ω.
4. X_ω is finite (for odd p by Mazur–Wiles p. 183; for p = 2, F = ℚ or ℚ(i) gives X = 0).
5. The analytic class number formula for minus class groups turns the divisibilities into equalities (Greenberg).

**Checks.**

- χ = ω is excluded: that component is finite, and there char is (1).
- For p = 2 the characteristic ideal is that of ½G₂, not of G₂.

**Sources.** **GREITHER-1992**, §1, the Main Conjecture (= Theorem 3.2), p. 452. The statement including p = 2. **GREITHER-1992**, §3, proof of 3.1 ⇒ 3.2, p. 470. The last step.

**Direct dependencies.** [L4/greither-real-main-conjecture](#greither-real-main-conjecture); [L4/greither-semilocal-units](#greither-semilocal-units); [L4/greither-kummer-duality](#greither-kummer-duality); `IntegralIwasawaTheory:L4/fw-arithmetic-mu-zero`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`; `IntegralIwasawaTheory:L2`.

<a id="greither-split-prime-divisor-classes"></a>
### Classes of the primes above p, and injectivity of E⁺ → E (Greither, Lemma 4.2 and Corollary 4.3)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-split-prime-divisor-classes`**.

Let p be a prime and F an imaginary abelian field such that p splits completely in F, every prime of F above p is totally ramified in the cyclotomic ℤ_p-extension F_∞/F, and μ_{p^∞}(F_∞) is finite; let Δ = Gal(F/ℚ), j complex conjugation and Γ = Gal(F_∞/F). Let B_n be the subgroup of the divisor group of F_n generated by the primes above p, D_n its image in A_n = A_p(F_n), D_∞ = lim D_n, and D_∞^+ the same for F_n^+. Then D_∞/im D_∞^+ ≅ ℤ_p[Δ]/(1 + j)ℤ_p[Δ] as ℤ_p[Δ][[Γ]]-modules, with Γ acting trivially on the right (Lemma 4.2). For p = 2, with X = lim A_n, E = X/D_∞ ≅ lim A_n/D_n (a quotient of class groups, not a unit group) and E^+ the same for F^+, the canonical map E^+ → E is injective (Corollary 4.3).

**Hypotheses and conventions.**

- Lemma 4.2 uses only the three hypotheses above (Greither's parenthesis before the lemma), so it holds for every p; Corollary 4.3 is stated for p = 2.

**Construction or proof.**

1. Fix a norm-coherent sequence 𝔭_n of primes above p in F_n, and let h be the p-class number of F. The projective system B_n/(hB_0 + B_n^+) is isomorphic to (ℤ/hp^nℤ)[Δ]/(1 + j) via 1 ↦ 𝔭_n; hB_0 maps to 0 in D_n.
2. It is enough that the kernels of α_n: B_n/(hB_0 + B_n^+) → D_n/im D_n^+ have bounded order, which follows from |D_n|/|D_n^+| ≥ const·p^{n|Δ|/2}.
3. Apply the ambiguous-class formula for a cyclic extension K/F′ (Lang, Cyclotomic Fields II, Chapter 13 §4, formulas (2)–(3)) to (F_n, F) and (F_n^+, F^+). The products of ramification indices are e(F_n/F) = p^{n|Δ|} and e(F_n^+/F^+) = p^{n|Δ|/2}. The two unit norm indices differ by a bounded factor because F has only finitely many p-power roots of unity.
4. The kernels have bounded order and the limit ℤ_p[Δ]/(1 + j) is ℤ_p-torsion-free, so lim α_n is an isomorphism.
5. Corollary 4.3: from the rows 0 → D_∞^± → X^± → E^± → 0 it suffices that D_∞ ∩ im X^+ = im D_∞^+. On Q = (D_∞ ∩ im X^+)/im D_∞^+, j acts as +1 (Q lies in the image of X^+) and as −1 (Q lies in D_∞/im D_∞^+ ≅ ℤ_2[Δ]/(1 + j)). That module has no 2-torsion, so Q = 0.

**Checks.**

- Γ acts trivially on D_∞/im D_∞^+, so for odd χ its χ-part has characteristic ideal (T) over Λ_χ (used in the trivial-zero reduction).

**Sources.** **GREITHER-1992**, §4, proof of Lemma 4.2, p. 484. The start of the proof. **GREITHER-1992**, §4, proof of Corollary 4.3, p. 485. The end of the proof of 4.3.

**Direct dependencies.** [L4/greither-chi-parts](#greither-chi-parts); `IntegralIwasawaTheory:L1`; `IntegralIwasawaTheory:L2`.

<a id="greither-trivial-zero-reduction"></a>
### The trivial-zero reduction when χ(2) = 1 (Greither, Lemma 4.4, Proposition 4.5 and (***))

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-trivial-zero-reduction`**.

Let p = 2, F an imaginary abelian field unramified at 2 with Δ = Gal(F/ℚ) = Δ_2 × Δ_0, Δ_2 cyclic and |Δ_0| odd, j complex conjugation, F_n the layers of the cyclotomic ℤ_2-extension, A_n = A_2(F_n), and χ an odd character of Δ, injective on Δ, with χ(2) = 1 (so 2 splits completely in F) and ξ = χ|Δ_0 nontrivial; χ̌ = ωχ^{−1} and Λ_χ = ℤ_2(χ)[[T]]. Let E_n = A_n/D_n and E_n^+ = A_n^+/D_n^+. For a module M and x ∈ ℤ_2[[Γ]] write M_x = M/xM, and M^{(x)} for the kernel of x. Let γ generate Γ and T = γ − 1. Define Z and Z^+ as the kernels in the rows 0 → Z^+ → (E^+)_{1−γ} → E_0^+ → 0 and 0 → Z → E_{1−γ} → E_0 → 0, with vertical maps α, β and ε. Then: (Lemma 4.4) if Z/im Z^+ is finite, |ker β| ≤ |(E/E^+)^{(1−γ)}| < ∞; (Proposition 4.5) |½G′_2(0, χ̌)|_2^{d(χ)} ≤ (|E_{0ξ}|/|E^+_{0ξ}|)·|(Z/Z^+)_ξ|, where ′ = d/dT; and hence (***) |A(F)_χ| = |(A_0)_ξ|/|(A_0^+)_ξ| ≥ |½G′_2(0, χ̌)|_2^{d(χ)}·|(Z/im Z^+)_ξ|^{−1}·|(D_0)_ξ|/|(D_0^+)_ξ|.

**Hypotheses and conventions.**

- Greither writes |x|_p = p^{v(x)} with v(p) = 1, so |x|_p^{d(χ)} is the order of ℤ_p(χ)/xℤ_p(χ); an inequality between such orders is a divisibility of 2-powers.
- |Δ_0| is odd, so (·)_ξ is exact on ℤ_2[Δ_0]-modules, and (**) and Lemma 4.4 hold after taking ξ-parts.
- In these finite-index formulas Greither’s notation |a|_p means p^{v_p(a)}, the reciprocal of the usual p-adic absolute value; d(χ)=[ℚ_p(χ):ℚ_p]. Thus |a|_p^{d(χ)}=Nχ(a).

**Construction or proof.**

1. (**) The snake lemma, with |E_0|·|E_0^+|^{−1} = |coker ε|·|ker ε|^{−1}, gives |(E/E^+)_{1−γ}| = |coker β| ≤ |ker β|·|E_0|·|E_0^+|^{−1}·|Z/im Z^+|; the inequality drops |ker α|^{−1}.
2. Lemma 4.4. The norm F_n → F_n^+ gives β′ with β′β = 2, so ker β is killed by 2. It is finite because E^+, a quotient of X^+, is finitely generated over ℤ_2. Since E_0 is finite, the hypothesis makes (E/E^+)_{1−γ} finite, so T has finite kernel and cokernel on E/E^+. The sequence Tor^Λ(Λ/(T), E/E^+) → (E^+)_{1−γ} → E_{1−γ} → (E/E^+)_{1−γ} → 0 bounds ker β by the Tor term, which is (E/E^+)^{(1−γ)}.
3. Proposition 4.5. Corollary 4.3 and the snake lemma give 0 → (D_∞/D_∞^+)_ξ → (X/im X^+)_ξ → (E/E^+)_ξ → 0, and ξ may be replaced by χ in all three terms. char((D_∞/D_∞^+)_χ) = (T) by Lemma 4.2, and char((X/im X^+)_χ) = (½G_2(T, χ̌)) by Theorem 3.2. So ½G_2(T, χ̌) is divisible by T, the trivial zero forced by χ(2) = 1, and char((E/E^+)_χ) = (½G_2(T, χ̌)·T^{−1}).
4. The coinvariant lemma (Coates, Lemma 9) gives |coker β_ξ| = |(E/E^+)_{ξ,1−γ}| = |(E/E^+)^{(1−γ)}_ξ|·|½G′_2(0, χ̌)|_2^{d(χ)}. Combine this with (**) and the ξ-version of Lemma 4.4. If (Z/Z^+)_ξ is infinite, the proposition is trivial.
5. (***) |E_0|/|E_0^+| = |A_0|·|A_0^+|^{−1}·|D_0|^{−1}·|D_0^+|, also in ξ-parts. Since ξ is nontrivial, (A_0^+)_ξ → A_{0ξ} and (D_0^+)_ξ → D_{0ξ} are injective, and |(A_0)_ξ|/|(A_0^+)_ξ| = |A(F)_χ|.

**Checks.**

- The inequality bounds |A(F)_χ| from below. The trivial-zero formula identifies the right side of (***) with |½B_{1,χ^{−1}}|_2^{d(χ)}.

**Sources.** **GREITHER-1992**, §4, Convention and Remark before Lemma 4.4, p. 486. ξ-parts are exact because |Δ_0| is odd. **GREITHER-1992**, §4, proof of Proposition 4.5, p. 487. T divides ½G_2(T, χ̌).

**Direct dependencies.** [L4/greither-split-prime-divisor-classes](#greither-split-prime-divisor-classes); [L4/greither-main-conjecture-all-p](#greither-main-conjecture-all-p); [L4/greither-chi-parts](#greither-chi-parts); `IntegralIwasawaTheory:L2`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`; `PadicMeasuresIwasawaAlgebras:L4/finite-coinvariants-euler-characteristic`; `PadicMeasuresIwasawaAlgebras:L4/coinvariants-euler-product`.

<a id="greither-split-units-quotient"></a>
### Z/Z⁺ as a quotient of 2-adic semilocal units (Greither, Proposition 4.7)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-split-units-quotient`**.

Let p = 2, F an imaginary abelian field unramified at 2 with Δ = Gal(F/ℚ) = Δ_2 × Δ_0, Δ_2 cyclic and |Δ_0| odd, j complex conjugation, F_n the layers of the cyclotomic ℤ_2-extension, A_n = A_2(F_n), and χ an odd character of Δ, injective on Δ, with χ(2) = 1 (so 2 splits completely in F) and ξ = χ|Δ_0 nontrivial; χ̌ = ωχ^{−1} and Λ_χ = ℤ_2(χ)[[T]]. With Z, Z^+ as in the trivial-zero reduction, fix a prime 𝔭 of F above 2. The primes above 2 are 𝔭_δ = 𝔭^δ (δ ∈ Δ), and (ℚ_2 ⊗ F)^× = (ℚ_2^×)^Δ. Let V = {±1} × 2^ℤ ⊂ ℚ_2^×, N(F) = (ℚ_2 ⊗ F)^×/closure(O_F[1/2]^×)·V^Δ, and N(F^+) the same with Δ^+ = Δ/{1, j}. N(F) is a quotient of (ℤ_2^×)^Δ. Then (a) there is a natural isomorphism Z_ξ ≅ N(F)_ξ, and likewise Z^+_ξ ≅ N(F^+)_ξ; (b) (Z/im Z^+)_χ ≅ (N(F)/N(F^+))_χ ≅ N(F)_χ.

**Construction or proof.**

1. Let L be the maximal unramified abelian 2-extension of F_∞ in which every prime above 2 splits completely, so Gal(L/F_∞) ≅ E = X/D_∞ by class field theory. Let L_0 be the same over F, so Gal(L_0/F) ≅ E_0. Put M = L ∩ F^ab, G = Gal(L/F) and G/G′ = Gal(M/F).
2. Claim: Gal(M/L_0) ≅ N(F). M is the maximal abelian 2-ramified 2-extension of F that is unramified over F_∞ and in which every prime above 2 has inertial degree one. It corresponds to a closed subgroup H of C_2(F) = J_F/F^×·∏_{q∤2}U_q. Decomposition equals inertia at each 𝔭_δ, which forces (2·u_δ^{−1})^{(δ)} ∈ H with u_δ ∈ {±1}, and M/F_∞ unramified gives (−1)^{(δ)} ∈ H. So H is the image of V^Δ.
3. Hence Gal(M/F) = C_2(F)/im V^Δ, and 0 → N(F) → G/G′ → E_0 → 0 is exact.
4. With 0 → E_{1−γ} → G/G′ → Γ → 0 (Washington, Lemma 13.14) and Δ acting trivially on Γ, Γ_ξ = 0. So E_{ξ,1−γ} ≅ (G/G′)_ξ, and N(F)_ξ ≅ ker(E_{ξ,1−γ} → E_{0ξ}) = Z_ξ. This is (a); the argument for F^+ is the same.
5. (b) Naturality of (a) for F and F^+ gives (Z/im Z^+)_ξ ≅ (N(F)/N(F^+))_ξ. Since j acts as −1 on the right side, ξ may be replaced by χ on both sides.

**Checks.**

- Γ carries the trivial Δ-action, so Γ_ξ = 0 for ξ ≠ 1; this is where the nontriviality of ξ enters.

**Sources.** **GREITHER-1992**, §4, before Proposition 4.7, p. 488. N(F) is a quotient of (ℤ_2^×)^Δ. **GREITHER-1992**, §4, proof of Proposition 4.7(a), p. 489. The second exact sequence.

**Direct dependencies.** [L4/greither-trivial-zero-reduction](#greither-trivial-zero-reduction); [L4/greither-chi-parts](#greither-chi-parts); `IntegralIwasawaTheory:L1`.

<a id="greither-gauss-sum-vectors"></a>
### The Gauss-sum 2-unit with its valuation and logarithm vectors (Greither, (G1), (G2) and Lemma 4.8)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-gauss-sum-vectors`**.

Let p = 2, F an imaginary abelian field unramified at 2 with Δ = Gal(F/ℚ) = Δ_2 × Δ_0, Δ_2 cyclic and |Δ_0| odd, j complex conjugation, F_n the layers of the cyclotomic ℤ_2-extension, A_n = A_2(F_n), and χ an odd character of Δ, injective on Δ, with χ(2) = 1 (so 2 splits completely in F) and ξ = χ|Δ_0 nontrivial; χ̌ = ωχ^{−1} and Λ_χ = ℤ_2(χ)[[T]]. Let W = O_F[1/2]^×/O_{F^+}[1/2]^×. Let M be the free ℤ_2-module on the 𝔭_δ modulo the span of the 𝔭_δ + 𝔭_{δj}, so M ≅ ℤ_2[Δ]/(1 + j). Define μ: W → M, u ↦ Σ_δ v_{𝔭_δ}(u)·𝔭_δ, and λ: W → 4M, u ↦ Σ_δ log_2(u^{δ^{−1}})·𝔭_δ, where log_2: F → F_𝔭 = ℚ_2 and log_2(ℤ_2^×) = 4ℤ_2. Let m be the conductor of F (odd), 𝔓 a prime of ℚ(μ_m) above 𝔭, f = ord(2 mod m), η the m-th power residue symbol at 𝔓, ψ the nontrivial additive character of 𝔽_2, and g = −Σ_a η^{−1}(a)ψ(Tr a) the Gauss sum. Let D be the decomposition field of 2 in ℚ(μ_m), so F ⊆ D and g ∈ D, and put g_F = N_{D/F}(g) ∈ F, a 2-unit. With ⟨g_F⟩ its ℤ_2Δ-span in W: (G1) μ_χ(g_F) = B_{1,χ^{−1}}·(𝔭)_χ (Stickelberger); (G2) λ_χ(g_F) = 4·G′_2(0, χ̌)·unit·(𝔭)_χ, by Gross–Koblitz, Ferrero–Greenberg and Lemma 4.8 (Σ_{(b,m)=1} χ^{−1}(b)ζ_2(b, s) = L_2(s, χ̌) as meromorphic functions on ℤ_2), with L_2(s, χ̌) = G_2(u^s − 1, χ̌) and log_2(u) associated to 4. Both μ_χ(g_F) and λ_χ(g_F) are nonzero.

**Hypotheses and conventions.**

- The carriers W and M and maps μ and λ are defined for every imaginary abelian F in which 2 splits completely. The stated χ-assumptions apply to the character formulas and the subsequent trivial-zero argument. In the m=7 tests only the carriers and (G1) are being tested; ξ is trivial there.
- Greither takes g itself and asserts g ∈ F. In general g lies only in D, and D can be larger than F (source issue E5). Its norm g_F is what his sums over all b with (b, m) = 1 compute, and it equals g when F = D.
- Greither's (G1) and μ_χ carry an extra factor m and drop b from the exponent (source issue E6). m is odd, so this does not change any 2-adic order.
- Use the primitive odd character η=χ⁻¹ with η(2)=1 in DirichletPadicLFunctions:L3/rjw2-ferrero-greenberg. Its conductor-log correction vanishes. Its nonvanishing supplier still has an explicit Gauss-ideal/Baker–Brumer proof gap; this application does not certify that gap closed.

**Construction or proof.**

1. g is fixed by σ_2, since Tr(a²) = Tr(a) (Frobenius invariance), so g ∈ D, where 2 splits completely. F ⊆ D because 2 splits completely in F.
2. (G1) By Stickelberger's theorem at p = 2, (g) = ∏_{b ∈ (ℤ/m)^×/⟨2⟩} (σ_b^{−1}𝔓)^{Σ_{t=1}^{f}⟨2^t b/m⟩}. Taking N_{D/F} collects all b with σ_b|_F = δ: μ(g_F) = Σ_δ Σ_{b mod m, σ_b ↦ δ} ⟨b/m⟩·𝔭_{δ^{−1}}, and μ_χ(g_F) = (Σ_b ⟨b/m⟩χ^{−1}(b))·(𝔭)_χ = B_{1,χ^{−1}}·(𝔭)_χ, since χ has conductor m.
3. (G2) λ_χ(g_F) = (Σ_δ log_2(g_F^δ)·χ^{−1}(δ))·(𝔭)_χ. Gross–Koblitz writes each conjugate of g as a product of Morita Γ_2-values, so this is Σ_{(b,m)=1} χ^{−1}(b)·log_2 Γ_2(⟨b/m⟩)·(𝔭)_χ. Ferrero–Greenberg (Gross [10], p. 993) turns it into Σ_{(b,m)=1} χ^{−1}(b)·ζ′_2(b, 0)·(𝔭)_χ.
4. Lemma 4.8 identifies the last sum with L′_2(0, χ̌)·(𝔭)_χ. It suffices to check s = 1 − n for odd n ∈ ℕ, using the definitions (Washington, Chapter 5; Gross [10], p. 989). Then L′_2(0, χ̌) = log_2(u)·G′_2(0, χ̌), and log_2(u) is associated to 4.
5. μ_χ(g_F) ≠ 0 because B_{1,χ^{−1}} ≠ 0 for odd χ. λ_χ(g_F) ≠ 0 by Gross [10], 1.15, a consequence of his Conjecture 2.12, which he proves for abelian fields.

**API.**

- `twoUnitQuotient` (constructor): W = O_F[1/2]^×/O_{F^+}[1/2]^×, a ℤΔ-module with ℚ_2 ⊗ W ≅ ℚ_2Δ/(1 + j).
- `primeDivisorModule` (constructor): M = ℤ_2[Δ]/(1 + j) on the classes of the 𝔭_δ; M_χ ≅ ℤ_2(χ) by (𝔭)_χ ↦ 1.
- `valuationVector` (constructor): μ(u) = Σ_δ v_{𝔭_δ}(u)·𝔭_δ, a ℤΔ-linear map W → M.
- `logVector` (constructor): λ(u) = Σ_δ log_2(u^{δ^{−1}})·𝔭_δ, a ℤΔ-linear map W → 4M.
- `gaussSumNorm` (constructor): g_F = N_{D/F}(g) for the Gauss sum g = −Σ_a η^{−1}(a)ψ(Tr a) ∈ D.
- `valuationVector_gaussSumNorm` (characterisation): (G1) μ_χ(g_F) = B_{1,χ^{−1}}·(𝔭)_χ.
- `logVector_gaussSumNorm` (characterisation): (G2) λ_χ(g_F) = 4·G′_2(0, χ̌)·unit·(𝔭)_χ.

**Uses.** EulerSystemsCyclotomicMainConjecture:L4/greither-trivial-zero-formula: the lines λ_χ⟨g_F⟩ and μ_χ⟨g_F⟩ whose indices give G′_2(0, χ̌) and B_{1,χ^{−1}}.

**Unit tests.**

- `logVector.test_kernel` (value): log_2 kills V = {±1} × 2^ℤ and log_2(ℤ_2^×) = log_2(1 + 4ℤ_2) = 4ℤ_2, so λ lands in 4M.
- `gaussSum.test_conductor_seven` (value): m = 7, F = D = ℚ(√−7), f = 3: |g|² = 8 and (g) = 𝔭·𝔭̄², so μ(g) = 𝔭 + 2𝔭̄ = −𝔭 in M, and μ_χ(g) = −(𝔭)_χ = B_{1,χ}·(𝔭)_χ with B_{1,χ} = −1 for the quadratic character χ.
- `gaussSum.test_not_in_F` (non-example): m = 217 = 7·31, χ = (quadratic character mod 7)·(cubic character mod 31), odd with χ(2) = 1, F its sextic field: σ_120 fixes F but σ_120(g) ≠ g (v_𝔓(g) = s(151) = 5, v_{σ_120^{−1}𝔓}(g) = s(18120) = 6 in binary digit sums), so g ∉ F and the norm g_F is needed.
- `twoUnitQuotient_real` (degenerate): The global 2-unit 2 and every real 2-unit have zero class in W.
- `twoUnitQuotient_seven` (value): For F=ℚ(√−7), α=(1+√−7)/2 has norm 2. In W one has [ᾱ]=−[α], and [α] has infinite order, as seen from its unequal valuations at the two primes above 2.
- `twoUnitQuotient_torsion` (compatibility): For F=ℚ(√−7), both global units ±1 come from ℚ and vanish in W. Replacing W by all S-units without dividing by the real S-units fails this test.
- `primeDivisorModule_seven` (value): For F=ℚ(√−7), M is free of rank one on 𝔭, with 𝔭̄=−𝔭.
- `primeDivisorModule_plus` (degenerate): For every δ, 𝔭_δ+𝔭_{δj}=0. The quotient imposes this relation integrally, without dividing by 2.
- `primeDivisorModule_not_zero` (non-example): In the two-prime case the individual class 𝔭 is nonzero. Quotienting by each prime separately would incorrectly give zero.
- `valuationVector_real` (degenerate): μ(2)=𝔭+𝔭̄=0 for F=ℚ(√−7), so the map factors through the real 2-unit quotient.
- `valuationVector_alpha` (value): Choose 𝔭=(α) above 2 for F=ℚ(√−7); then μ(α)=𝔭 and μ(ᾱ)=−𝔭.
- `valuationVector_unit` (compatibility): The valuation vector of a global unit is zero. This tests valuation, rather than logarithm, as the definition of μ.
- `logVector_sign` (degenerate): λ(−1)=0 because the Iwasawa logarithm kills −1.
- `logVector_uniformizer` (degenerate): λ(2)=0 because log₂(2)=0; assigning log₂(2)=1 is incompatible with the chosen branch.
- `logVector_alpha` (value): For F=ℚ(√−7) and an embedding where α=(1+√−7)/2 is a 2-adic unit, α≡3 mod 8. Then λ(α)=2log₂(α)𝔭, with v₂(log₂(α))=2. Its coefficient has valuation 3, so λ is nonzero and the pair of conjugate primes must both be included.
- `gaussSumNorm_transitivity` (compatibility): For F⊆F′⊆D, N_(F′/F)(g_F′)=g_F. Taking g itself in every field fails this norm compatibility when g is not in F.
- `gaussSumNorm_seven_conjugates` (value): For m=7 and F=D=ℚ(√−7), g_F=g and g_F·conj(g_F)=8. This checks the finite-field cardinality 2^3 and the additive-character normalisation.

**Checks.**

- The index computations in the trivial-zero formula use only the ℤ_2(χ)-lines spanned by μ_χ(g_F) and λ_χ(g_F), so units (including m) do not matter.

**Sources.** **GREITHER-1992**, §4, definitions before (G1), p. 490. The definitions of W, M, μ, λ. **GREITHER-1992**, §4, the Gauss sum, p. 490. Greither's claim g ∈ F, corrected here (source issue E5). **GREITHER-1992**, §4, (G2), p. 491. The derivation of (G2). **GROSS-1981**, §4, equations (4.3)–(4.6), printed pp. 993–994; Proposition 1.16, printed p. 983. The abelian exceptional derivative is obtained from Gauss-sum logarithms and the gamma evaluation. Conjecture 1.15 is not itself a proved general injectivity theorem.

**Direct dependencies.** `FiniteFieldsAndCharacterSums:FF.1/stickelberger-relation`; [L4/greither-chi-parts](#greither-chi-parts); `DirichletPadicLFunctions:L3`; `DirichletPadicLFunctions:L3/robert-gross-koblitz-comparison`; `DirichletPadicLFunctions:L3/rjw2-ferrero-greenberg`; `DirichletPadicLFunctions:L3/rjw2-fg-nonvanishing`.

<a id="greither-trivial-zero-formula"></a>
### The trivial-zero formula (Greither, Lemmas 4.9–4.10 and Theorem 4.6)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-trivial-zero-formula`**.

Let p = 2, F an imaginary abelian field unramified at 2 with Δ = Gal(F/ℚ) = Δ_2 × Δ_0, Δ_2 cyclic and |Δ_0| odd, j complex conjugation, F_n the layers of the cyclotomic ℤ_2-extension, A_n = A_2(F_n), and χ an odd character of Δ, injective on Δ, with χ(2) = 1 (so 2 splits completely in F) and ξ = χ|Δ_0 nontrivial; χ̌ = ωχ^{−1} and Λ_χ = ℤ_2(χ)[[T]]. With Z, Z^+, D_0 as in the trivial-zero reduction and μ, λ as in the Gauss-sum construction: (Lemma 4.9) |coker(λ_χ: W′_χ → 4ℤ_2(χ))| = |(Z/im Z^+)_χ|, where W′_χ is the 2-adic completion of W_χ modulo 2-torsion, of rank one over ℤ_2(χ); (Lemma 4.10) |coker μ_χ| = |(D_0/im D_0^+)_χ|; and (Theorem 4.6) |½G′_2(0, χ̌)|_2^{d(χ)}·|(Z/im Z^+)_ξ|^{−1}·|(D_0)_ξ|/|(D_0^+)_ξ| = |½B_{1,χ^{−1}}|_2^{d(χ)}.

**Hypotheses and conventions.**

- In these finite-index formulas Greither’s notation |a|_p means p^{v_p(a)}, the reciprocal of the usual p-adic absolute value; d(χ)=[ℚ_p(χ):ℚ_p]. Thus |a|_p^{d(χ)}=Nχ(a).

**Construction or proof.**

1. ℚ_2 ⊗ W ≅ ℚ_2Δ/(1 + j), so ℚ_2 ⊗ W_χ ≅ ℚ_2(χ), and λ_χ, μ_χ induce monomorphisms W′_χ → M_χ ≅ ℤ_2(χ).
2. Lemma 4.9. Compare W′_χ → 4ℤ_2(χ) with V^Δ → ((ℚ_2F)^×/(ℚ_2F^+)^×)_χ → 4ℤ_2(χ), where λ′ is λ on (ℚ_2^×)^Δ. Since ker(log_2: ℚ_2^× → 4ℤ_2) = V, the lower sequence is exact. So coker λ_χ ≅ (N(F)/N(F^+))_χ, which is (Z/im Z^+)_χ by Proposition 4.7(b).
3. Lemma 4.10. The definition of μ gives coker μ ≅ D_0/im D_0^+ naturally.
4. Theorem 4.6. |(Z/im Z^+)_χ|^{−1}·|(D_0/im D_0^+)_χ| = |coker λ_χ|^{−1}·|coker μ_χ|. Computing both indices through the lines spanned by λ_χ(⟨g_F⟩) and μ_χ(⟨g_F⟩), the factors |W′_χ/⟨g_F⟩| cancel, and (G1), (G2) give |G′_2(0, χ̌)|_2^{−d(χ)}·|B_{1,χ^{−1}}|_2^{d(χ)}. Multiplying by |½|_2^{d(χ)} on both sides and using injectivity of (D_0^+)_ξ → D_{0ξ} gives 4.6.

**Checks.**

- The ½ cancels between the two sides of 4.6; the content is |(Z/im Z^+)_χ|^{−1}·|(D_0/im D_0^+)_χ| = |G′_2(0, χ̌)|_2^{−d(χ)}·|B_{1,χ^{−1}}|_2^{d(χ)}.

**Sources.** **GREITHER-1992**, §4, reduction to Theorem 4.6, p. 488. Theorem 4.6 suffices for Theorem 4.1. **GREITHER-1992**, §4, proof of Theorem 4.6, p. 492. The end of the proof.

**Direct dependencies.** [L4/greither-split-units-quotient](#greither-split-units-quotient); [L4/greither-gauss-sum-vectors](#greither-gauss-sum-vectors); [L4/greither-split-prime-divisor-classes](#greither-split-prime-divisor-classes).

<a id="greither-relative-class-group-bound"></a>
### |A₂(F)_χ| is divisible by |½B_{1,χ⁻¹}|^{d(χ)} (Greither, Theorem 4.1 = Theorem B)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-relative-class-group-bound`**.

Let p = 2 and F an imaginary abelian field unramified at 2 with Δ = Gal(F/ℚ) = Δ_2 × Δ_0 and Δ_2 cyclic. For every odd character χ of Δ, |A_2(F)_χ| ≥ |½B_{1,χ^{−1}}|_2^{d(χ)}, that is, the 2-power |A_2(F)_χ| is divisible by |½B_{1,χ^{−1}}|_2^{d(χ)} = 2^{d(χ)·v_2(½B_{1,χ^{−1}})}. Here A_2(F)_χ ≅ (A_2(F)/im A_2(F^+))_χ ≅ A_2(F)^−_χ, since χ is odd and the norm A_2(F) → A_2(F^+) is onto.

**Hypotheses and conventions.**

- Greither states Theorem 4.1 for every p and χ faithful on Δ_p. For odd p he cites Mazur–Wiles (|Δ| prime to p) and Solomon (general case), neither read here, and says the argument below works for all p. The node is the case p = 2 (Theorem B), where every odd χ is faithful on the cyclic Δ_2.
- In these finite-index formulas Greither’s notation |a|_p means p^{v_p(a)}, the reciprocal of the usual p-adic absolute value; d(χ)=[ℚ_p(χ):ℚ_p]. Thus |a|_p^{d(χ)}=Nχ(a).

**Construction or proof.**

1. χ(j) = −1 makes χ injective on Δ_2, so ker χ ⊂ Δ_0. Replace F by the fixed field of ker χ, so that χ is injective on Δ.
2. Case χ(2) ≠ 1. Let D be the decomposition group of 2 in Δ, Δ̄ = Δ/D, γ a topological generator of Γ and γ_n = γ^{p^n}. As in Washington p. 278 there is an exact sequence 0 → ((1 − γ_n)/(1 − γ))·Y_0/(1 − γ_n)X → X/(1 − γ_n)X → A(K_n) → 0, whose first term is a quotient of Z = Y_0/(1 − γ)X.
3. With L and G = Gal(L/F) as on Washington p. 277, 𝔓 a prime of L above a divisor 𝔭 of p and σ a generator of its inertia group, Z is the ℤ_p-span of the z_τ = [σ^τσ^{−1}] (τ ∈ Gal(L/ℚ)). z_τ = 0 for τ ∈ G, so Z is a quotient of the augmentation ideal of ℤ_pΔ; it is cyclic because Δ_p is cyclic, and D acts trivially, so Z is a quotient of ℤ_pΔ̄. Taking χ-parts gives (ℤ_pΔ̄)_χ → X_χ/(1 − γ_n)X_χ → A(K_n)_χ → 0. The Frobenius at 2 acts on the left term trivially and by χ(2), so that term is cyclic over ℤ_2(χ), killed by 1 − χ(2), of order at most |1 − χ(2)|_2^{d(χ)}.
4. char(X_χ) = (½G_2(T, χ̌)) by Theorem 3.2, and ½G_2(T, χ̌)|_{T=0} = ½L_2(0, χ̌) = −½(1 − χ^{−1}(2))B_{1,χ^{−1}} ≠ 0. The coinvariant lemma (Coates, Lemma 9) gives |X_χ/(1 − γ)X_χ| ≥ |½G_2(0, χ̌)|_2^{d(χ)}, and |1 − χ(2)|_2 = |1 − χ^{−1}(2)|_2. So |A(F)_χ| ≥ |½B_{1,χ^{−1}}|_2^{d(χ)}.
5. Case χ(2) = 1. Then 2 splits completely in F. (***) of the trivial-zero reduction and Theorem 4.6 give |A(F)_χ| ≥ |½G′_2(0, χ̌)|_2^{d(χ)}·|(Z/im Z^+)_ξ|^{−1}·|(D_0)_ξ|/|(D_0^+)_ξ| = |½B_{1,χ^{−1}}|_2^{d(χ)}.

**Checks.**

- When χ is not of 2-power order, equality holds; this is Theorem A.
- For χ of 2-power order, |A(F)_χ| = 2·|½B_{1,χ^{−1}}|_2^{d(χ)} (p. 482), strictly larger than the bound.

**Sources.** **GREITHER-1992**, §4, before the proof of Theorem 4.1, p. 482. The proof is written for p = 2. **GREITHER-1992**, §4, proof of Theorem 4.1, p. 483. The two cases χ(2) ≠ 1 and χ(2) = 1. **GREITHER-1992**, §4, the case χ(2) ≠ 1, p. 484. The coinvariant lemma.

**Direct dependencies.** [L4/greither-trivial-zero-reduction](#greither-trivial-zero-reduction); [L4/greither-trivial-zero-formula](#greither-trivial-zero-formula); [L4/greither-main-conjecture-all-p](#greither-main-conjecture-all-p); [L4/greither-chi-parts](#greither-chi-parts); `IntegralIwasawaTheory:L2`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`; `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`; `PadicMeasuresIwasawaAlgebras:L4/finite-coinvariants-euler-characteristic`; `PadicMeasuresIwasawaAlgebras:L4/coinvariants-euler-product`.

<a id="relative-class-group-bound-odd"></a>
### The relative class-group bound for odd primes

**Target `EulerSystemsCyclotomicMainConjecture:L4/relative-class-group-bound-odd`**.

Let p be odd and F/ℚ imaginary abelian, unramified at p, with cyclic p-Sylow subgroup Δ_p. For every odd p-adic character χ of Δ=Gal(F/ℚ), the finite χ-part of the p-class group has order at least Nχ((1/2)B_{1,χ⁻¹}), where Nχ(a)=p^{[ℚ_p(χ):ℚ_p]v_p(a)}. The Bernoulli number is evaluated for the primitive Dirichlet character attached to χ. This is Greither Theorem 4.1 at odd p, complementing the separate p=2 target.

**Hypotheses and conventions.**

- The χ-part is the coinvariant character quotient, which is not exact when p divides |Δ|. The target cannot be reduced to a semisimple eigenspace argument in that case.
- In the split case χ(p)=1, the derivative/trivial-zero comparison and the finite-level coinvariant error must be justified at odd p. Greither explicitly writes the p=2 proof and cites the earlier odd-p literature; the missing read proof of the odd-p comparison is recorded as a gap.

**Construction or proof.**

1. For χ(p)≠1 combine the all-prime characteristic ideal with finite-level class control and the Euler characteristic of coinvariants.
2. For χ(p)=1 remove the split-prime divisor module and compare the p-unit valuation and logarithm lattices. The odd-p lattice comparison, including kernel/cokernel factors, is the remaining gap; the p=2 identity cannot simply be reused with 4 replaced by p.
3. Descend to the field cut out by χ with norm/transfer, keeping the non-exact character quotient.

**Checks.**

- For χ(p)≠1 the comparison specializes the all-prime characteristic ideal through finite-level control.
- For χ(p)=1 exhibit the exact valuation/logarithm lattice factor rather than cancelling a zero constant term.
- Use the coinvariant χ-part for p-divisible character order.

**Sources.** **GREITHER-1992**, Greither, Theorem 4.1, printed pp. 482–484, including the paragraph specifying that only the case p=2 is proved there. The statement includes odd primes; its missing odd-p trivial-zero comparison is kept explicit.

**Direct dependencies.** [L4/greither-main-conjecture-all-p](#greither-main-conjecture-all-p); [L4/greither-chi-parts](#greither-chi-parts); `IntegralIwasawaTheory:L2`; `PadicMeasuresIwasawaAlgebras:L4/finite-coinvariants-euler-characteristic`; `PadicMeasuresIwasawaAlgebras:L4/coinvariants-euler-product`.

<a id="greither-iwasawa-leopoldt-two"></a>
### The Iwasawa–Leopoldt conjecture at p = 2 (Greither, Theorem A)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-iwasawa-leopoldt-two`** · atlas planet: Iwasawa–Leopoldt conjecture at p = 2 (Greither A).

Let F/ℚ be an imaginary abelian field unramified at 2 with Galois group Δ = Δ_2 × Δ_0, Δ_2 cyclic and |Δ_0| odd. For every odd 2-adic character χ of Δ that is not of 2-power order (that is, χ|Δ_0 ≠ ε), |A_2(F)^−_χ| = |½B_{1,χ^{−1}}|_2^{d(χ)}, where A_2(F)^− = {x ∈ A_2(F): x^j = −x}, d(χ) = [ℤ_2(χ):ℤ_2] and |a|_2 = 2^e for a = 2^e·u ∈ ℤ_2(χ) with u a unit. For the single odd character χ_2 of 2-power order (up to ℚ_2-conjugacy), with L the fixed field of Δ_0, |A_2(F)_{χ_2}| = |A_2(L)^−| = 2·|½B_{1,χ_2^{−1}}|_2^{d(χ_2)}·k_L, where k_L = |ker(A_2(L^+) → A_2(L))| = 1. Consequently (1 − e_ε)A_2(F)^− is annihilated by ½ times the images in (1 − e_ε)ℤ_2[Δ]/(1 + j) of the Stickelberger elements of F, which sharpens Stickelberger's theorem at 2.

**Hypotheses and conventions.**

- The characters χ are taken up to ℚ_2-conjugacy, and each class contributes one factor with exponent d(χ).
- In these finite-index formulas Greither’s notation |a|_p means p^{v_p(a)}, the reciprocal of the usual p-adic absolute value; d(χ)=[ℚ_p(χ):ℚ_p]. Thus |a|_p^{d(χ)}=Nχ(a).

**Construction or proof.**

1. For each odd χ with χ|Δ_0 ≠ ε, |A_2(F)^−_χ| = |(A_2(F)/im A_2(F^+))_χ|. For a cyclic 2-group Δ_2 the minus quotient ℤ_2(χ_0)[Δ_2]/(1 + j) is the domain ℤ_2(χ); see the χ-parts node, property (g).
2. The analytic class number formula for F and for L (with Q_L = 1 and w_L = 2) and k_F = k_L give |(1 − e_ε)A_2(F)^−| = ∏ |½B_{1,χ^{−1}}|_2^{d(χ)} over the odd χ with χ|Δ_0 ≠ ε, modulo ℚ_2-conjugacy. The same product of the |A_2(F)^−_χ| equals |(1 − e_ε)A_2(F)^−|, because ξ-parts are exact.
3. Theorem B bounds each factor below; the products agree, so every factor is an equality.
4. k_L = 1. Every nontrivial subgroup of the cyclic 2-group Gal(L/ℚ) contains j, and some odd prime ℓ ramifies in L, so L/L^+ is ramified above ℓ. L is unramified at 2, so i ∉ L, and μ(L)/μ(L)² is generated by −1. Let 𝔞 be a class of L^+ with 𝔞O_L = (α). Then α/ᾱ is a unit of absolute value 1 everywhere, so a root of unity. If α/ᾱ = ζ² = ζ/ζ̄, then α/ζ ∈ L^+ generates 𝔞, which is trivial. Otherwise α can be rescaled so that ᾱ = −α. Then δ = α² ∈ L^+, L = L^+(√δ) and δO_{L^+} = 𝔞², so v_𝔮(δ) is even at every 𝔮 above ℓ. This contradicts the ramification of L/L^+ above ℓ.
5. The annihilation statement: for (1 − e_ε)A_2(F)^− the χ-parts are cyclic of order |½B_{1,χ^{−1}}|_2^{d(χ)}, the χ-component of ½ times a Stickelberger element.

**Checks.**

- Examples show some condition on Δ_2 is necessary (Greither, Remark a)).
- F = ℚ(ζ_5): χ_2 of order 4, d(χ_2) = 2, B_{1,χ_2^{−1}} = (−3 + i)/5, so 2·|½B|_2^2 = 2·2^{−1} = 1 = |A_2(ℚ(ζ_5))|.

**Sources.** **GREITHER-1992**, §1, Remark a) after Theorem A, p. 453. The Stickelberger consequence. **GREITHER-1992**, §1, Remark b) after Theorem A, p. 453. The 2-power-order character; the printed formula lacks the exponent d(χ_2) (source issue E4). **GREITHER-1992**, §1, Theorem B implies Theorem A, p. 454. The deduction.

**Direct dependencies.** [L4/greither-relative-class-group-bound](#greither-relative-class-group-bound); [L4/greither-chi-parts](#greither-chi-parts); `IntegralIwasawaTheory:L0`.

<a id="greither-ray-class-real-fields"></a>
### Ray class groups of real abelian fields and ½L_p(1, χ) (Greither, Theorem 4.11)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-ray-class-real-fields`**.

Let F be a real abelian field and p a prime unramified in F, with Δ = Gal(F/ℚ) = Δ_p × Δ_0 and Δ_p the p-part. Let A′(F) = lim_ν C_{(p^ν)}(F), where C_{(p^ν)}(F) is the p-part of the ray class group modulo p^ν. Let e = e_ε = |Δ_0|^{−1}Σ_{δ∈Δ_0}δ. Then (1 − e)A′(F) is finite, and for every character χ_0 ≠ 1 of Δ_0, |A′(F)_{χ_0}| = ∏_{χ|Δ_0 = χ_0} |½L_p(1, χ)|_p^{d(χ)}, the product over the characters χ of Δ restricting to χ_0, taken up to conjugacy over ℚ_p(χ_0). Equivalently, as in the proof, the product runs over all such χ with exponent d(χ_0).

**Hypotheses and conventions.**

- Leopoldt's conjecture for F and p (true for abelian F) is used to identify A′(F) with Y/TY and to make (1 − e)A′(F) finite.
- In these finite-index formulas Greither’s notation |a|_p means p^{v_p(a)}, the reciprocal of the usual p-adic absolute value; d(χ)=[ℚ_p(χ):ℚ_p]. Thus |a|_p^{d(χ)}=Nχ(a).

**Construction or proof.**

1. Y = lim A′(F_n) is the Galois group of the maximal abelian p-ramified p-extension of F_∞, a Λ_Δ-module with A′(F) ≅ Y/TY. Define T̂ by 1 + T̂ = u·(1 + T)^{−1}. By Theorem 3.2 and Proposition 3.4, char_{Λ_χ}(Y_χ) = ½G_p(T̂, χ)Λ_χ for every χ, so char_{Λ_{χ_0}}(Y_{χ_0}) = (∏_χ ½G_p(T̂, χ)) over χ|Δ_0 = χ_0.
2. Let δ(χ_0) be the order of the T-coinvariants of the torsion of Y_{χ_0}. Iwasawa theory gives |A′_{χ_0}| = ∏_χ |½G_p(T̂, χ)|_{T=0}|_p^{d(χ_0)}·δ(χ_0) = ∏_χ |½L_p(1, χ)|_p^{d(χ_0)}·δ(χ_0).
3. It suffices that ∏_{χ_0 ≠ 1}|A′_{χ_0}| = ∏_{χ|Δ_0 ≠ 1}|½L_p(1, χ)|_p; then every δ(χ_0) = 1. The left side is |(1 − e)A′| = |A′(F)|/|A′(L)|, with L the fixed field of Δ_0.
4. 0 → (1 − e)(U_F/Ē_F) → (1 − e)A′(F) → (1 − e)A(F) → 0, and |(1 − e)(U_F/Ē_F)| = p^{−[F:ℚ]+[L:ℚ]}·R_p(F)·R_p(L)^{−1}. The proof compares log_p: (1 − e)U_F → (1 − e)p(ℤ_p ⊗ O_F), whose kernel and cokernel have equal order (1 for odd p, 2^{g(F)−g(L)} for p = 2, g the number of primes above 2), and uses (1 − e)Ē_F ∩ ker log_p = 0.
5. The p-adic class number formula for F and for L (Washington, Theorem 5.24) gives the quotient (2p)^{…}·(d(F)/d(L))^{1/2}·∏(1 − p^{−1}χ(p))^{−1}·½L_p(1, χ). F and L are unramified at p and χ(p) ≠ 0, so its p-value is that of ∏_{χ|Δ_0 ≠ 1}½L_p(1, χ).

**Checks.**

- Every δ(χ_0) = 1: the torsion of Y_{χ_0} has trivial T-coinvariants for χ_0 ≠ 1.
- For p = 2 the kernel and cokernel of log_2 on (1 − e)U_F both have order 2^{g(F)−g(L)}; for odd p both are trivial.

**Sources.** **GREITHER-1992**, §4, proof of Theorem 4.11, p. 493. The coinvariant step. **GREITHER-1992**, §4, proof of Theorem 4.11, p. 494. The p-adic class number formula.

**Direct dependencies.** [L4/greither-main-conjecture-all-p](#greither-main-conjecture-all-p); [L4/greither-kummer-duality](#greither-kummer-duality); [L4/greither-chi-parts](#greither-chi-parts); `IntegralIwasawaTheory:L1`; `IntegralIwasawaTheory:L4/abelian-leopoldt`; `DirichletPadicLFunctions:L3`.

<a id="greither-ray-class-transfer"></a>
### Norm and inclusion maps on p-adic ray class groups (Greither, Lemma 4.13)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-ray-class-transfer`**.

Let F/K be a p-extension of cyclic number fields that are unramified above p, with C = Gal(F/K). There are Galois-equivariant homomorphisms α: A′(F) → A′(K), induced by N_{F/K}, and β: A′(K) → A′(F), induced by K ⊂ F, such that α is surjective, β is injective, and βα is multiplication by the norm element Σ_{σ∈C}σ.

**Construction or proof.**

1. Gal(F/ℚ) is cyclic and generated by inertia groups, so some prime ℓ ≠ p ramifies totally in F/ℚ. Hence F/K has no p-ramified subextension, and α is onto.
2. For a divisor 𝔪 of K, ker(C_𝔪(K) → C_𝔪(F)) embeds into H¹(C, E_𝔪(F)) with E_𝔪(F) = ker(O_F^× → (O_F/𝔪O_F)^×). Since lim is left exact, it suffices that lim_ν H¹(C, E_{(p^ν)}(F)) = 0.
3. Leopoldt's conjecture for p and F gives N ≥ 2 such that every x ∈ E_{(p^{N+1})}(F) is a p-th power of a unit y, and y ∈ E_{(p^N)}(F) because p is unramified in F.
4. Let p^c = |C| and ν ≥ N. Every 1-cocycle x = (x_σ) in Z¹(C, E_{(p^{ν+c})}(F)) has x_σ = y_σ^{p^c} with y_σ ∈ E_{(p^ν)}(F). E_{(p^ν)}(F) contains no nontrivial p-power root of unity: for odd p because F is unramified at p, and for p = 2 because −1 ≢ 1 mod 4 and ν ≥ 2. So (y_σ) is again a cocycle, and the image of x in H¹(C, E_{(p^ν)}(F)) is divisible by p^c, hence zero.

**Checks.**

- For p = 2 the field F contains −1. The cocycle step needs ν ≥ N ≥ 2, not the absence of 2-power roots of unity from F that Greither states (source issue E11).

**Sources.** **GREITHER-1992**, §4, proof of Lemma 4.13, p. 495. The maps α and β. **GREITHER-1992**, §4, proof of Lemma 4.13, p. 495. The use of Leopoldt's conjecture.

**Direct dependencies.** `IntegralIwasawaTheory:L1`; `IntegralIwasawaTheory:L4/abelian-leopoldt`.

<a id="greither-real-iwasawa-leopoldt"></a>
### The real analogue of the Iwasawa–Leopoldt conjecture (Greither, Theorem 4.12 = Theorem C)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-real-iwasawa-leopoldt`** · atlas planet: Real Iwasawa–Leopoldt analogue (Greither C).

Let F be a real abelian field and p a prime unramified in F, with Δ = Gal(F/ℚ) = Δ_p × Δ_0 and Δ_p cyclic. For every character χ of Δ with χ|Δ_0 ≠ ε (the order of χ is not a power of p) and χ|Δ_p faithful, |A′(F)_χ| = |½L_p(1, χ)|_p^{d(χ)}. Here A′(F) is the p-part of the projective limit of the ray class groups C_{(p^ν)}(F); A′(F) is infinite, but (1 − e_ε)A′(F) is finite.

**Hypotheses and conventions.**

- In these finite-index formulas Greither’s notation |a|_p means p^{v_p(a)}, the reciprocal of the usual p-adic absolute value; d(χ)=[ℚ_p(χ):ℚ_p]. Thus |a|_p^{d(χ)}=Nχ(a).

**Construction or proof.**

1. Let χ′ = χ|Δ_0 ≠ 1. If Δ_p = 1, the statement is Theorem 4.11. Otherwise let C be the subgroup of Δ_p of order p, and F_1 its fixed field.
2. Lemma 4.13 gives α: A′(F) → A′(F_1) onto and β: A′(F_1) → A′(F) injective with βα = N_C.
3. If Δ_p = ⟨σ⟩ has order p^k, then N_C = Φ_{p^k}(σ), and for χ faithful on Δ_p, A′(F)_χ = A′(F)_{χ′}/Φ_{p^k}(σ)A′(F)_{χ′} (Φ_{p^k} is irreducible over the unramified ℚ_p(χ′)). Since α is onto and β injective, N_C·A′(F)_{χ′} = β(A′(F_1)_{χ′}) ≅ A′(F_1)_{χ′}, so |A′(F)_χ| = |A′(F)_{χ′}|/|A′(F_1)_{χ′}| (Solomon, Corollary II.1).
4. A character of F is a character of F_1 exactly when it is not faithful on Δ_p. By Theorem 4.11 the quotient is ∏|½L_p(1, ξ)|_p^{d(χ′)} over the ξ with ξ|Δ_0 = χ′ that are faithful on Δ_p. These ξ are the ℚ_p(χ′)-conjugates of χ, so the product is |½L_p(1, χ)|_p^{d(χ)}.

**Checks.**

- χ|Δ_0 ≠ ε is needed: for Δ_p = 1 and χ = 1, A′(F)_χ has ℤ_p-rank one and L_p(s, 1) has a pole at s = 1.

**Sources.** **GREITHER-1992**, §1, Theorem C, p. 454. Theorem C with χ|Δ_0 ≠ ε. **GREITHER-1992**, §4, Theorem 4.12, p. 494. Theorem 4.12; its printed hypothesis omits χ|Δ_0 ≠ ε (source issue E9). **GREITHER-1992**, §4, proof of Theorem 4.12, p. 494. The order of the χ-part.

**Direct dependencies.** [L4/greither-ray-class-real-fields](#greither-ray-class-real-fields); [L4/greither-ray-class-transfer](#greither-ray-class-transfer); [L4/greither-chi-parts](#greither-chi-parts).

<a id="greither-gras-conjecture"></a>
### Units modulo circular units and the Gras conjecture (Greither, Theorem 4.14 and Corollary 4.15)

**Target `EulerSystemsCyclotomicMainConjecture:L4/greither-gras-conjecture`** · atlas planet: Gras conjecture for real abelian fields (Greither).

Let F/ℚ be real abelian with Δ = Gal(F/ℚ) = Δ_p × Δ_0 and Δ_p cyclic, and p unramified in F. Let 𝒞_F be Sinnott's group of circular units of F, E_F the unit group, C_F = 𝒞_F ∩ E_F, and (·)_p the p-adic completion. For every nontrivial character χ′ of Δ_0, |(E_F/C_F)_{p,χ′}| = |A(F)_{χ′}|·|((ℤ_p/2ℤ_p)[Δ])_{χ′}|·|(R : U)_{χ′}|, where R = ℤ[Δ] and U are as in Sinnott, and |((ℤ_p/2ℤ_p)[Δ])_{χ′}| is 2^{d(χ′)|Δ_p|} for p = 2 and 1 for odd p. If |Δ| is prime to p, then [E_{F,p}/C̄_{F,p}] = [A(F)] in the Grothendieck group K_0 of finite ℤ_p[Δ]-modules, where C̄_F is Sinnott's larger group of circular units. In particular, for p = 2 and |Δ| odd, E_F/C̄_F and A_2(F) have isomorphic composition series as ℤ_2[Δ]-modules (the Gras conjecture).

**Hypotheses and conventions.**

- Sinnott's (R : U) is a generalised index of lattices, so |(R : U)_{χ′}| can be a negative power of p.
- Greither prints the middle factor as 2^{d(χ′)|Δ_p|} for every p. His proof gives [e′(ℤ_p/2)[Δ]], which is 0 for odd p; the node states the corrected factor.

**Construction or proof.**

1. Let e′ = 1 − e_ε. The statement is equivalent to [e′(E_p/C_p)] = [e′A(F)] + [e′(ℤ_p/2)[Δ]] + [e′R/e′U] in K_0(ℤ_p[Δ]). R_{χ′} = ℤ_p(χ′)[Δ_p] is local, so the class of an R_{χ′}-module is determined by its order.
2. Let 𝒪 be ℤ_p with all character values adjoined. Theorem 4.11 gives [𝒪 ⊗ e′A′(F)] = Σ_χ[𝒪_χ/(½L_p(1, χ))] − [e′U_p : e′E_p] over the χ nontrivial on Δ_0. Since [E_p/C_p] = [U_p/C_p] − [U_p/E_p] and K_0(ℤ_pΔ) → K_0(𝒪Δ) is injective, it remains to prove (*) for [𝒪 ⊗ e′(U_p/C_p)].
3. (*) follows Sinnott §4 with p-adic L-functions: the logarithmic embedding λ: 𝒪 ⊗ U_p → p𝒪^{(Δ)}, u ↦ Σ_δ log_p(u^{δ^{−1}})·δ, gives [𝒪 ⊗ e′(U_p/C_p)] = [e′p𝒪^{(Δ)}/λ(e′C_p)], and Sinnott's Proposition 4.2 and its corollary, rewritten with L_p(1, χ), give λ(e′C_p) = e′ω′U. With R_{χ′} = ∏_χ 𝒪 the maximal order, [e′p𝒪R/e′ω′𝒪R] = [∏_χ 𝒪/(½L_p(1, χ))], and the three formulas combine to (*).
4. Corollary 4.15. If |Δ| is prime to p, then ℤ_pR = ℤ_pU, so [E_p/C_p] = [A(F)] + [(1 − e_ε)(ℤ_p/2)[Δ]]. For odd p that term vanishes and C̄_F/C_F is 2-elementary. For p = 2, every totally positive element of C_F is a square in E_F (Sinnott, p. 209, with (2, |Δ|) = 1), so C̄_F/C_F ≅ (1 − e_ε)(ℤ/2)[Δ], which cancels the extra term.

**Checks.**

- For odd p the factor |((ℤ_p/2ℤ_p)[Δ])_{χ′}| is 1: both sides of 4.14 are then powers of p.

**Sources.** **GREITHER-1992**, §4, Theorem 4.14, p. 495. Theorem 4.14; its printed factor 2^{d(χ′)|Δ_p|} is corrected for odd p (source issue E10). **GREITHER-1992**, §4, proof of Corollary 4.15, p. 496. Corollary 4.15. **GREITHER-1992**, §4, proof of Theorem 4.14, p. 497. Sinnott's §4 with p-adic L-functions.

**Direct dependencies.** [L4/greither-ray-class-real-fields](#greither-ray-class-real-fields); [L4/greither-chi-parts](#greither-chi-parts); `IntegralIwasawaTheory:L0/abelian-circular-unit-variant`; `IntegralIwasawaTheory:L0/general-conductor-index`; `DirichletPadicLFunctions:L3`.

## Supplier contracts and source obligations

The generic Euler-system carrier, conductor presentation, Tate-dual Euler
polynomial, twisting, rigidity and Euler-factor replacement are imported from
ES.2. Kolyvagin primes and finite–singular comparison come from ES.1; universal
derivative descent and its local relations from ES.3; the finite bound from
ES.4; and the rank-one Iwasawa bound and index from ES.8. These are direct
imports, as required by RT-AREA-iwasawa-1/36. Kato’s application must also import
those generic targets directly; no cyclotomic-unit theorem is a carrier for
Kato’s Euler system.

The Selmer/class-group dictionary used in L3 is
`SelmerIwasawaCohomology:L4/tate-twist-greenberg-selmer`, resolving
RT-AREA-iwasawa-1/21. This roadmap translates characteristic ideals through
that comparison and does not reconstruct the comparison.

The remaining stage-level requests are the following exact contracts. A
request is not a substitute implementation or a claim that its owner has
already supplied a proof.

- **`ColemanPowerSeries:L1`**: Coleman interpolation over a finite product of unramified coefficient rings, with coefficient Frobenius and the twisted norm equation. Reuse L1/unramified-interpolation-equivalence and L1/unramified-interpolation-frobenius-equivariant; supply the comparison with Greither’s all-prime normalisation if its current API does not yet cover the p=2 signs.
- **`ColemanPowerSeries:L3`**: Rubin Appendix D Definition 1.2: the actual local functionals λ_m:ℤ_p[μ_m]×/torsion→ℤ_p, with Lemma D.1.4’s restriction/Artin compatibility, sufficient for the Stickelberger family of III.4. Also Greither’s unramified-coefficient Θ=(1−φ/p)log exact sequences at every prime, retaining the extra {±1} term at p=2; finite flat scalar extension from the ℚ_p tower alone does not supply coefficient Frobenius.
- **`ColemanPowerSeries:L4`**: The general abelian character comparison char(U∞χ/C∞χ)=(Lχ) of Rubin III.2.9(ii), over the actual unramified cyclotomic local fields, extending the existing L4/local-iwasawa-real-quotient-comparison for the ℚ cyclotomic tower.
- **`DirichletPadicLFunctions:L2`**: The Stickelberger series G_p(T, ρ) = lim ξ_ν(ρ) (Washington §7.2, p. 118) for even ρ, with L_p(s, ρ) = G_p(u^s − 1, ρ), including p = 2.
- **`DirichletPadicLFunctions:L3`**: For Greither's §4: L_p(s, χ) = G_p(u^s − 1, χ) with G_p the Iwasawa power series (Washington, Theorem 7.10), including p = 2 and the trivial zero of G₂(T, χ̌) at T = 0 when χ(2) = 1; Leopoldt's formula for L_p(1, χ) and the p-adic class number formula (Washington, Theorem 5.24) for a real abelian field unramified at p, with the p-adic regulator R_p(F).
- **`IntegralIwasawaTheory:I.1`**: The cyclotomic ℤ_p-extension, decomposition of finite primes, and disjointness from a finite prime-to-p extension L. In addition, the local multiplicative inverse limit Y∞χ=lim (L_n⊗ℚ_p)× completed at p is finitely generated, torsion-free and Λχ-rank one (Iwasawa [Iw3], Theorem 25, as invoked by Rubin III.2.7). This is a multiplicative local-module theorem, not merely the construction of Γ≅ℤ_p.
- **`IntegralIwasawaTheory:L0`**: The Galois-module form of the unit theorem for a totally real abelian field (each nontrivial even prime-to-p character occurs once), and the characterwise finite circular-unit comparisons needed in the ramified-conductor case. Mathlib’s NumberField.Units.finrank_eq supplies only the additive rank. Also the minus analytic class-number product and Sinnott’s (R:U) correction at the exact generality used in Greither 4.14–4.15. Precisely, for every real abelian L with p∤[L:ℚ] and odd p, after extending scalars to a common unramified O′ containing all Δ-characters, Σ_(ψ≠1) ℓ_O′(E_Lψ/Cψ)=Σ_(ψ≠1) ℓ_O′(A_Lψ). Here Cψ is the primitive-conductor ξ-line transported from the field cut out by ψ; prove the conductor/norm-lattice correction is a p-adic unit. This is the finite class-number product used in Rubin III Corollary 2.4, including p|cond(L).
- **`IntegralIwasawaTheory:L1`**: Class field theory for Greither's §4 Iwasawa modules: for an abelian field F and its cyclotomic ℤ_p-extension, Gal(L/F_∞) ≅ X/D_∞ for the maximal unramified abelian p-extension L in which the primes above p split completely; the maximal abelian p-ramified pro-p extension of F_∞ with Galois group Y and, for real F, A′(F) ≅ Y/TY, where A′(F) = lim C_{(p^ν)}(F) is the limit of the p-parts of the ray class groups; the idèle class group C_2(F) = J_F/F^×·∏_{q∤2}U_q; the exact sequence 0 → E_{1−γ} → G/G′ → Γ → 0 (Washington, Lemma 13.14); and the ambiguous-class formula for cyclic extensions (Lang, Cyclotomic Fields II, Chapter 13 §4, (2)–(3)). Also Iwasawa's rank theorem for F_∞ = ℚ(μ_{p^∞}), p odd: X_∞ has Λ(Γ)-rank r_2(ℚ(μ_p)) = (p − 1)/2, carried by the c = −1 part, and Y_∞ is torsion.
- **`IntegralIwasawaTheory:L2`**: The coinvariant lemma: for a finitely generated torsion Λ_χ = ℤ_p(χ)[[T]]-module M with char(M) = (f) and M/TM finite, |M/TM| = |f(0)|_p^{d(χ)}·|M^{T=0}| (Coates, p-adic L-functions and Iwasawa theory, Lemma 9); and Washington's construction on pp. 277–278 (the module Y_0, the exact sequence 0 → ((1 − γ_n)/(1 − γ))·Y_0/(1 − γ_n)X → X/(1 − γ_n)X → A(K_n) → 0, and Z = Y_0/(1 − γ)X spanned by the inertia commutators) for a cyclotomic ℤ_p-extension in which p is not totally split. Also Rubin's Lemma 1.2 (Invent. Math. 93 (1988)): uniform bounds on (γ − 1)Ĥ^i(Γ_{mn}, E_m), i ∈ {−1, 0}, under Greither's weakened hypotheses. Also finite exceptional ω class-module control for Greither Theorem 3.2, and the odd-p split-prime lattice/coinvariant comparison required by Theorem 4.1.
- **`SelmerIwasawaCohomology:L0`**: For χ of order prime to p, the restriction–Kummer isomorphism H¹(ℚ,O(1)⊗χ⁻¹)≃(L×)^χ, its finite-level tower version, and compatibility with character twisting. The plain Kummer inverse-limit map is already imported by node id; this request is for the representation/character comparison only.
- **`SelmerIwasawaCohomology:L2`**: Rubin I Proposition 6.1 for finite-order prime-to-p χ: the finite-condition Selmer group of Dχ is Hom_O(A_Lχ,D). The strict subscript and relaxed superscript local conditions must be distinguished, including the local unramified calculation at p.
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`**: Over ℚ: the ray class field modulo m∞ is ℚ(μ_m) and modulo m is ℚ(μ_m)^+, and the maximal p-subextension ℚ(q) of the ray class field modulo q lies in ℚ(μ_q). Also the idelic form over F_n^+: Gal(M_n^+/L_n^+) ≅ U^+_{n,1}/(closure of global units) (Washington Corollary 13.6). Also the idèlic correspondence for F abelian: the maximal abelian 2-ramified 2-extension with prescribed inertia corresponds to a closed subgroup of C_2(F) = J_F/F^×·∏_{q∤2}U_q (Greither, Proposition 4.7). For the Stickelberger construction also the actual idèlic exact sequence 0→U_F/closure(E_F)→J_F/(F×B_F)→A_F→0 and reciprocity identifying continuous ℤ_p-valued idèle characters with H¹(F,ℤ_p), with corestriction corresponding to inclusion of idèles.

**G1 — Bounded circular-unit descent in the finite-layer equality.** Establish uniformly bounded errors for the actual norm-limit E∞/C∞ at finite levels, with the Sinnott conductor correction at general abelian conductor. The class-side control and index formulas are imported by precise IntegralIwasawaTheory node ids. Rubin III.2.8 cites Mazur–Wiles §1.6 and Rubin’s appendix p. 414; the circular-unit control proof in those references was not read. The product argument is specified, including the Weierstrass step after divisibility, but the missing bound is not asserted proved.

**G2 — Odd-p split-prime finite comparison for Greither 4.1.** Greither states Theorem 4.1 for every p but writes the proof at p=2, citing Mazur–Wiles and Solomon for odd p. The odd-p χ(p)=1 valuation/logarithm lattice comparison and the resulting finite-level kernel/cokernel bound have not been established from a read proof. The new node records the exact target and separates this gap from the fully decomposed 2-adic argument.

**G3 — Imported exceptional nonvanishing is not a closed supplier proof.** DirichletPadicLFunctions:L3/rjw2-fg-nonvanishing is the precise owner and states the needed abelian nonvanishing. Its accepted packet still records a missing nonzero Gauss-ideal character projection and its Baker–Brumer comparison. This is an imported supplier gap, not a new analytic construction here. Gross Conjecture 1.15 is not a theorem; use the abelian argument in §4 and the algebraic-coefficient Proposition 1.16.

Imported nodes retain their own source limitations. In particular,
IntegralIwasawaTheory’s general-conductor index node retains its unresolved
norm-lattice normalisation, and its all-prime Ferrero–Washington arithmetic
node retains the dyadic reflection input. A citation here is not a declaration
that those supplier proof obligations have disappeared.

## Source corrections used by the targets

These findings are scoped to the versions listed above. Formulas below are
mathematical specifications, with the disputed claims described in our own
words. The packet retains the search history and the distinction between
misprints and proof errors.

**E1 — RUBIN-ES, Chapter III, §2.1, display (2), printed p. 34 (PDF p. 44); also Remark 2.1 for p = 2.**

The source gives, for each m ≥ 1 and each prime ℓ, N_{Q(µmℓ)/Q(µm)}(ζmℓ − 1) = (ζm − 1) if ℓ | m; (ζm − 1)^{1−Fr_ℓ^{−1}} if ℓ ∤ m and m > 1; (−1)^{ℓ−1}ℓ if m = 1. Here Frℓ denotes the Frobenius attached to ℓ in Gal(Q(µm)/Q). **Correction:** N(ζ_{mℓ} − 1) = (−1)^{ℓ+1}(ζ_m − 1) if ℓ ∣ m and (−1)^{ℓ−1}(ζ_m − 1)^{1 − Fr_ℓ^{−1}} if ℓ ∤ m, m > 1. Equivalently, in the 1 − ζ convention: N(1 − ζ_{mℓ}) = 1 − ζ_m, (1 − ζ_m)^{1 − Fr_ℓ^{−1}}, and ℓ for m = 1, with no sign. The printed formula holds for odd ℓ. **Reason:** N(ζ − 1) = (−1)^d N(1 − ζ) with d = [ℚ(μ_{mℓ}) : ℚ(μ_m)] = ℓ or ℓ − 1, and the 1 − ζ form has no sign. For ℓ = m = 2: N_{ℚ(i)/ℚ}(i − 1) = (i − 1)(−i − 1) = 2, while ζ_2 − 1 = −2. For ℓ = 2, m = 3: ℚ(μ_6) = ℚ(μ_3) and ζ_6 − 1 = ζ_3, while (ζ_3 − 1)^{1 − Fr_2^{−1}} = −ζ_3. A numerical check over m < 40 and ℓ ≤ 13 finds failures exactly at ℓ = 2. Remark 2.1's 'c̃_{m∞} = ζ_m − 1 for p ∣ m' inherits the sign at p = 2. The Euler-system conclusions are unaffected: for odd p, −1 is a p^N-th power, so the sign vanishes in H¹(F, ℤ_p(1)), and ℓ = 2 occurs only as an auxiliary prime.

**E2 — RJW-PADIC-L, §10.5, printed p. 52 (arXiv v2), the definition of c_m and its norm relations.**

With m = Dp^n, n ≥ 1, the source sets c_m := (ξ_m^{−1} − 1)/(ξ_m − 1) ∈ O^×_{Q(µm)}, extending the units c_n(−1) of Example 10.2 for D = 1. It claims N_{Q(µmℓ)/Q(µm)}(c_{mℓ}) = c_m if ℓ | m, (1 − ℓ^{−1})c_m if ℓ ∤ m. **Correction:** Use c_m(a) = (ξ_m^a − 1)/(ξ_m − 1) for a fixed integer a ∉ {0, ±1}, over the m prime to a (the primes dividing a join Σ), or Rubin's unsmoothed N_{ℚ(μ_{mp})/ℚ(μ_m)}(1 − ξ_{mp}). For ℓ ∤ m (and ℓ ∤ a) the relation is N(c_{mℓ}(a)) = c_m(a)^{1 − σ_ℓ^{−1}}, σ_ℓ the Frobenius of ℓ in Gal(ℚ(μ_m)/ℚ). **Reason:** ξ^{−1} − 1 = −ξ^{−1}(ξ − 1), so c_m = −ξ_m^{−1} is a root of unity and z_m = δ(c_m) is torsion; the family is zero after ⊗ ℚ_p and carries no arithmetic. Example 10.2 admits a = −1 among 'a prime to p', which is exactly this degenerate choice. The relation '(1 − ℓ^{−1})c_m' is not defined in ℚ(μ_m)^×; the operator meant is 1 − σ_ℓ^{−1}, as in the corestriction relation and Definition 10.16 that follow.

**E3 — RUBIN-ES, Chapter III, proof of Theorem 2.10, printed p. 39 (author draft of the 1999 AWS notes).**

The source says the corollary follows from Corollary 2.8 together with Theorem 2.9(ii). **Correction:** Applying Corollary 2.8 and Theorem 2.9(ii) proves the theorem. **Reason:** The statement being proved is Theorem 2.10; no corollary follows it. The exact sequence 0 → E_∞^χ/C_{∞,χ} → U_∞^χ/C_{∞,χ} → Z_∞^χ → A_∞^χ → 0, with char(A_∞^χ) = char(E_∞^χ/C_{∞,χ}) (Corollary 2.8) and char(U_∞^χ/C_{∞,χ}) = L_χΛ (Theorem 2.9(ii)), gives char(Z_∞^χ) = L_χΛ, which is Theorem 2.10.

**E4 — GREITHER-1992, §1, Remark b) after Theorem A, p. 453 (Numdam scan of the published article).**

|A₂(F)_{χ₂}| = |A₂(L)^−| = 2·|2^{−1}B_{1,χ₂^{−1}}|₂·k_L **Correction:** |A₂(F)_{χ₂}| = |A₂(L)^−| = 2·|2^{−1}B_{1,χ₂^{−1}}|₂^{d(χ₂)}·k_L, as restated on p. 482 (where k_L, which equals 1 here, is omitted). **Reason:** With Greither's |a|₂ = 2^e for a = 2^e·u ∈ ℤ₂(χ), the exponent d(χ₂) is needed whenever ℤ₂(χ₂) ≠ ℤ₂. F = L = ℚ(ζ₅): χ₂ has order 4, d(χ₂) = 2, B_{1,χ₂^{−1}} = (−3 + i)/5 with v₂ = 1/2, so |½B|₂ = 2^{−1/2}. The printed right side is √2·k_L, not an integer; with the exponent it is 2·2^{−1} = 1 = |A₂(ℚ(ζ₅))|.

**E5 — GREITHER-1992, §4, proof of Theorem 4.6, definition of the Gauss sum g, p. 490.**

The source concludes g ∈ F, citing the general assertion that, for arbitrary p, g^{p−1} belongs to the decomposition field associated with p in ℚ(m). **Correction:** g lies in the decomposition field D of 2 in ℚ(μ_m), which contains F but can be larger. Replace g by g_F = N_{D/F}(g) ∈ F. The subsequent formulas μ(g) = m·Σ_δ Σ_{b mod m, σ_b ↦ δ}⟨b/m⟩·𝔭_{δ^{−1}} (up to the factor m, see E6) and λ_χ(g_χ) = Σ_{(b,m)=1} χ^{−1}(b)·log₂Γ₂(⟨b/m⟩)·(𝔭)_χ are the ones for g_F, so (G1), (G2) and Theorem 4.6 hold with g_F. **Reason:** m = 217 = 7·31, χ = (quadratic character mod 7)·(cubic character mod 31): χ is odd, χ(2) = 1, and its fixed field F is cyclic of degree 6 and conductor 217 with 2 totally split, but D has degree 12. σ₁₂₀ fixes F (120 ≡ 1 mod 7, 120 ≡ 3³ mod 31). By Stickelberger, v_𝔓(g) = s(151) = 5 and v_{σ₁₂₀^{−1}𝔓}(g) = s(151·120 mod 32767) = 6 (binary digit sums, 2^{15} − 1 = 217·151), so σ₁₂₀(g) ≠ g. A numerical evaluation over 𝔽_{2^{15}} confirms |g(η^{−1}) − g(η^{−120})| ≈ 66, while g(η^{−1}) = g(η^{−2}).

**E6 — GREITHER-1992, §4, (G1) and the formulas for μ(g), μ_χ(g_χ), pp. 490–491.**

(G1) g𝒪_{ℚ(m)} = 𝔭^{Σ_b Σ_{t=1}^{f} m⟨p^t/m⟩·σ_b^{−1}}; μ(g) = m·Σ_{δ∈Δ} Σ_{b mod m, σ_b ↦ δ} ⟨b/m⟩·𝔭_{δ^{−1}}; μ_χ(g_χ) = m·B_{1,χ^{−1}}·(𝔭)_χ **Correction:** (g) = ∏_{b ∈ (ℤ/m)^×/⟨p⟩} (σ_b^{−1}𝔓)^{Σ_{t=1}^{f}⟨p^t b/m⟩} in ℚ(μ_m) (the inner term needs b, and the factor m belongs to g^m); correspondingly μ(g_F) and μ_χ(g_F) = B_{1,χ^{−1}}·(𝔭)_χ carry no factor m. **Reason:** m = 7, F = ℚ(√−7), f = 3: |g|² = 8, so the norm of (g) from ℚ(μ₇) is 2⁹, and (g) = 𝔓·(σ₃^{−1}𝔓)² by the corrected formula. The printed exponent gives every conjugate of 𝔭 the exponent 2 + 4 + 1 = 7, norm 2^{42}. Stickelberger's theorem factors g^m with the factor m. m is odd, so the extra factor is a 2-adic unit and the orders in Theorem 4.6 are unchanged.

**E7 — GREITHER-1992, §4, derivation of (G2), p. 491.**

The source identifies this expression with log₂(u)G′₂(0, χ̌)(𝔭_χ), invoking L′₂(s, χ̌) = G₂(u^s − 1, χ̌). **Correction:** by the formula L₂(s, χ̌) = G₂(u^s − 1, χ̌) **Reason:** Differentiating L₂(s, χ̌) = G₂(u^s − 1, χ̌) at s = 0 gives L′₂(0, χ̌) = log₂(u)·G′₂(0, χ̌), the step made. With the printed L′₂ on the left, s = 0 would give L′₂(0, χ̌) = G₂(0, χ̌), which is 0 in this case (the trivial zero).

**E8 — GREITHER-1992, §4, Lemma 4.8, p. 491.**

Σ_{(b,m)=1} χ^{−1}(b)·ζ₂(b/s) = L₂(s, χ̌) **Correction:** Σ_{(b,m)=1} χ^{−1}(b)·ζ₂(b, s) = L₂(s, χ̌) **Reason:** ζ₂(b, s) is Gross's two-variable function, introduced in the preceding paragraph and used as ζ′₂(b, 0) in the display above; ζ₂(b/s) is not defined.

**E9 — GREITHER-1992, §4, Theorem 4.12 (= Theorem C), p. 494.**

For every character χ of Δ whose restriction χ|Δ_p is faithful, the source asserts |A′(F)_χ| = |½L_p(1, χ)|_p^{d(χ)}. **Correction:** Then for all characters χ of Δ such that χ|Δ_0 ≠ ε and χ|Δ_p is faithful, as in Theorem C (p. 454). **Reason:** The proof applies Theorem 4.11, which requires χ_0 = χ|Δ_0 ≠ 1. Without it the statement fails: for Δ_p = 1 and χ = 1 (faithful on the trivial group), A′(F)_χ has ℤ_p-rank one (the cyclotomic ℤ_p-extension), and L_p(s, 1) has a pole at s = 1.

**E10 — GREITHER-1992, §4, Theorem 4.14, p. 495.**

|(E_F/C_F)_{χ′}| = |A(F)_{χ′}|·2^{d(χ′)|Δ_p|}·|(R : U)_{χ′}| **Correction:** |(E_F/C_F)_{χ′}| = |A(F)_{χ′}|·|((ℤ_p/2ℤ_p)[Δ])_{χ′}|·|(R : U)_{χ′}|, where the middle factor is 2^{d(χ′)|Δ_p|} for p = 2 and 1 for odd p. **Reason:** The section fixes an arbitrary prime p. For odd p the left side, |A(F)_{χ′}| and the generalised index |(R : U)_{χ′}| of ℤ_p-lattices are powers of p, so the printed identity would force 2^{d(χ′)|Δ_p|} to be a power of p. The proof's reformulation [e′(E_p/C_p)] = [e′A(F)] + [e′(ℤ_p/2)[Δ]] + [e′R/e′U] (p. 496) has the term [e′(ℤ_p/2)[Δ]], which is 0 for odd p, and the proof of Corollary 4.15 uses exactly that.

**E11 — GREITHER-1992, §4, proof of Lemma 4.13, p. 495.**

The source concludes that (y_σ) remains a cocycle because F contains no p-power roots of unity. **Correction:** Since E_{(p^ν)}(F) contains no nontrivial p-power root of unity (for p = 2 because ν ≥ N ≥ 2 and −1 ≢ 1 mod 4), (y_σ) is again a cocycle. **Reason:** The lemma allows p = 2, and every number field contains the 2-power root of unity −1, so the sentence is false for p = 2. The step only needs p^c-th roots to be unique inside E_{(p^ν)}(F), which holds because −1 ∉ E_{(2^ν)}(F) for ν ≥ 2; Greither's choice N ≥ 2 provides this.

**E12 — RJW-PADIC-L, §13.5.2, item (3), p. 71 (arXiv v2); p. 197 in Essential Number Theory 4 (2025).**

The source describes the condition at p as empty for n ≥ 1, and says that for n ≥ 0 it requires σ to be unramified at p as well. **Correction:** … while for n ≤ 0 the local condition at p means σ is also unramified at p **Reason:** The display just above gives L^Gr_{v_p} = H¹(K_∞^+, W_n) for n ≥ 1 and H¹_ur(K_∞^+, W_n) for n ≤ 0, as Definition 13.19 gives with Fil¹ℚ_p(n) = ℚ_p(n) for n ≥ 1 and 0 for n ≤ 0. The next display also uses n ≤ 0. As printed, n ≥ 1 would satisfy both clauses.

**E13 — RJW-PADIC-L, Remark 13.23, pp. 71–72 (arXiv v2); p. 198 in Essential Number Theory 4 (2025).**

The source uses ℚ_p^∨ = ℚ_p(1) to obtain L_∞(ℚ_p^∨, s) = L_∞(ℚ_p, 1 − s), and concludes r_{ℚ_p^∨} = 1. **Correction:** L_∞(ℚ_p^∨, s) = L_∞(ℚ_p, s − 1) **Reason:** With the notes' L_∞(ℚ_p(n), s) = π^{−(s−n)/2}Γ((s−n)/2) (p. 71), n = 1 gives π^{−(s−1)/2}Γ((s−1)/2) = L_∞(ℚ_p, s − 1). L_∞(ℚ_p, 1 − s) = π^{−(1−s)/2}Γ((1−s)/2) is a different function. Both have a pole at s = 1, so r_{ℚ_p^∨} = 1 stands.

**E14 — GREITHER-1992, §2, Lemma 2.11, p. 463 (Numdam scan of the published article).**

The source takes a character χ of Δ having conductor m, with m dividing cond(F), and sets F′ = F ∩ ℚ(M). **Correction:** … and write F′ = F ∩ ℚ(m). **Reason:** M is not defined anywhere in §2. Part (a) uses y_χ = (Tr_{ℚ(m)/F′}(ζ_m))_χ, which needs F′ ⊆ ℚ(m), and the proof takes F′ to contain F^{ker χ} ⊆ ℚ(m). Checked on the page image.

**E15 — GREITHER-1992, §2, Lemma 2.15(b), p. 467.**

Σ_{1≤a≤q_ν, (a,p)=1} a·(ζ_m·ζ_{p^{ν′}})^a = −q_ν·ζ_mζ_{p^{ν′}}/(1 − ζ_mζ_{p^{ν′}}) + q_ν·ζ_mζ_{p^{ν′−1}}/(1 − ζ_mζ_{p^{ν′−1}}) **Correction:** … + q_ν·ζ_m^pζ_{p^{ν′−1}}/(1 − ζ_m^pζ_{p^{ν′−1}}) **Reason:** Removing the terms a = pb from (a) gives −q_ν·x/(1 − x) + q_ν·x^p/(1 − x^p) with x = ζ_mζ_{p^{ν′}}, and x^p = ζ_m^pζ_{p^{ν′−1}}. Numerically, for (m, p, ν′) = (3, 2, 2), (5, 3, 1), (7, 2, 3), (3, 5, 1) the corrected form agrees to 10^{−13}; the printed form is off by 8.7 to 20.8. The proof's left-hand side (p. 466) has ζ_m^p, so the argument is unaffected.

**E16 — GREITHER-1992, §2, the definition of R (p. 460) against Lemma 2.11(b), Corollary 2.12 (pp. 463–464) and the notation before Theorem 2.13 (p. 465).**

The source defines R = 𝒪[[Γ′]] on p. 460. Lemma 2.11(b) gives V_χ(C_∞) = V_χ(R[Δ])·(η_m)_χ. On p. 465 it writes Γ′ = Φ × Γ and R ≅ ℤ_p[[Γ]][Φ] ≅ ℤ_p[[T]][Φ]. **Correction:** From Lemma 2.11 on, R stands for ℤ_p[[Γ′]] ≅ ℤ_p[[Γ]][Φ]; the ring 𝒪[[Γ′]] of p. 460 is ℤ_p[[Γ′]] ⊗ 𝒪. **Reason:** In Lemma 2.11(b) V_χ(R[Δ]) must act on V_χ(C_∞), and 𝒪 does not act on the circular units. On p. 465 R ≅ ℤ_p[[Γ]][Φ] holds only for R = ℤ_p[[Γ′]]. Theorem 2.6 (𝒱 = R·(1 − X)) needs R = 𝒪[[Γ′]], or equivalently the ℤ_p[[Γ′]]-span of 𝒪·(1 − X), which is how the proof of Corollary 2.12 uses it.

**E17 — GREITHER-1992, §3, proof of Theorem 3.1, the module N, p. 480 (Numdam scan of the published article).**

The source concludes that N = (γ − 1)^{2^t}(𝒥_{ℓ_{i−1}}/(M, (κ_{r_{i−1}})_{[ℓ_{i−1}]})) is a cyclic Λ_{nχ}-module killed by dH_χ. **Correction:** N = (γ − 1)^{2^{i−1}}(𝒥_{ℓ_{i−1}}/(M, (κ_{r_{i−1}})_{[ℓ_{i−1}]})) **Reason:** No t is defined in §3; §2's t ∈ {1, 2} does not fit. N is the module in hypothesis (iii) of Lemma 3.12, applied on p. 481 with η = (γ − 1)^{2^{i−1}}. The preceding line shows that v_{λ_{i−1}}(κ_{r_{i−1}}) divides (γ − 1)^{2^{i−1}}·d·H_χ with d free of γ − 1, which is why N is killed by dH_χ. Checked on the page image.

**E18 — RUBIN-ES, Author draft, Chapter IX §6, Example 6.2, printed p. 143; compare Chapter III §4.1, printed p. 42.**

The example labels the Euler system produced by replacing the Stickelberger norm factors as having coefficient ℤ_p(1). **Correction:** Its coefficient is the trivial representation ℤ_p. **Reason:** III.4.1 explicitly constructs the raw family in H¹(F,ℤ_p). IX Lemma 6.1 replaces the norm polynomials within the same H¹(F,T). For T=ℤ_p its Tate-dual Euler polynomial is 1−q⁻¹x, the factor used in Example 6.2; a Tate twist would give a different polynomial.

**E19 — RUBIN-ES, Author draft, Chapter IX §1, Example 1.1, printed p. 135; same reversal in III §4.1, printed p. 42, for ℚ^{ab,b}.**

The extension ℚ^{ab,p} is described as unramified outside p, although the family is indexed by conductors prime to p and the text denies the cyclotomic ℤ_p-subextension condition. **Correction:** Use the maximal abelian extension unramified at p, namely the union of ℚ(μ_m) for (m,p)=1. Likewise ℚ^{ab,b} is the union over conductors prime to b, unramified at the primes dividing b. **Reason:** The stated raw family uses exactly conductors coprime to p. An extension unramified outside p would instead consist of p-power cyclotomic fields and contain the cyclotomic ℤ_p-extension, contradicting both the indexing and the reason the rigidity alternative is invoked.

## Suggested statements and acceptance

The companion suggested Lean file is a compact statement file over the pinned
carriers. Its only new data definitions are the actual eigensubmodule and the
finite twisted sum on an existing representation. It states the distribution
milestones and a few character and boundary examples. Towers, integral
cohomology, Euler-system modules and arithmetic completed modules whose
carriers are supplied by the imported roadmaps remain full targets in this
document. No field, representation or norm is supplied by an unproved data
placeholder.

Acceptance checks the complete target catalogue, every definition’s use-derived
API and discriminating tests, the source locators and corrections, and the
acyclic dependency graph. In particular it checks: conductor 1 and 2 real
norms; the sign at an auxiliary prime 2; a nonzero Kummer class of p; the
χ(p)=1 initial-class distinction; the Stickelberger example’s unchanged
coefficient representation; the derivative descent and local conditions; the
two augmentation corrections; the product-to-component equality argument;
the twisted pole factor; non-exact character quotients at p=2; and the Gauss
sum’s norm from its actual field of definition. The three source obligations
above must remain visible until their stated inputs are established.
