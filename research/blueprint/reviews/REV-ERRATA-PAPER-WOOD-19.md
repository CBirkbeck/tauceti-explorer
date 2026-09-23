# Independent review — REV-ERRATA-PAPER-WOOD-19

Codex, session `codex-a71f92`, 23 September 2026. Refs #1803.

## Verdict and independence

All eight inherited findings are **confirmed**, after the amendments below. No new numbered finding is added. This is a complete finding-by-finding review, not an assertion that the entire paper has been re-proved or searched exhaustively for further errors.

The original errata worker was Claude Code, session `cc-fb70e5`. The reviewed input is commit `408103ee8a404c4828394d8ba288089fff98ff5f`. Each JSON entry now has its own verdict and reason, attributed to this review job. The earlier wording remains available at that commit; amended fields are recorded in `independentReviewAudit`.

## Public sources and scope

- [arXiv 1702.04644v2](https://arxiv.org/pdf/1702.04644v2), 13 July 2018; SHA-256 `2eacf07f9c79a08a65bbfa332b964f0f9bd4ab5abb93e5db8be72e43669be1bd`.
- [Published Duke Mathematical Journal PDF, NSF PAR](https://par.nsf.gov/servlets/purl/10152050), 168 (2019), 377–427, DOI 10.1215/00127094-2018-0037; SHA-256 `154e700c1b634b9e9bde4334a19678d05ff98ca18efb6b07cb5b809f2da9c03d`.
- [SGA 1, 2003 retypeset text](https://pi.math.cornell.edu/~dkmiller/bin/sga1.pdf), Exposé XIII, Corollary 2.12 and its proof, printed pp.290–292, original marginal pagination 392–394; SHA-256 `a28dfc3150749205935cd513ecd9eaa525464ea313e9cc976ee67c23d075e873`.

I read the introduction, §§2.1–2.3, the invariant definition and Lemmas 3.2–3.11 with their proofs, Definition 3.12 and the relevant start of Theorem 3.13's proof, Proposition 4.1 and proof, Remark 4.2, Proposition 4.4 and proof, Theorem 4.5, Theorems 4.7–4.8 and their proofs, the derivation of Theorem 1.2, §5, the relevant §8 tables, and Appendix A.1 with its immediate context. Each finding was collated in both paper versions. Published page images were checked at pp.379, 393–395, 402–403, 406–411 and 421; the Conjecture 5.1 notation was also checked in the v2 image. The publisher PDF's math-font extraction is unreliable, so the image checks matter.

Correction searches on 23 September 2026:

- The [arXiv history](https://arxiv.org/abs/1702.04644) lists v1 and v2, no later version.
- The [author's publications page](https://people.math.harvard.edu/~mmwood/Publications/) links this paper and its preprint, without a corresponding erratum link.
- The [Crossref DOI record](https://api.crossref.org/works/10.1215/00127094-2018-0037) has an empty relation object and no update-to/updated-by entry.
- Exact-title searches combined with erratum, correction, liminf, and Conjecture 5.1/generator found no matching correction. A result concerning *A predicted distribution for Galois groups of maximal unramified extensions* was excluded as a different paper.
- The [Project Euclid landing page](https://projecteuclid.org/euclid.dmj/1548730815) did not expose usable article text; NSF PAR supplied the published PDF.

These checks do not prove that no correction exists. I did not independently repeat the original worker's searches through later Liu and Liu–Willyard papers. The JSON's `known: new` is limited to “no correction located in these searches.”

## Finding-by-finding checks

### E1 — Confirmed gap; do not assert nonexistence of the limit

Theorem 1.2 is on v2 p.2, not p.3. The published locators are p.379 and, for Theorem 4.8 and the relevant proof, pp.406–410.

The selected large multidegrees have the prescribed parity and the component count supplied by Proposition 4.1 and Theorem 4.5. For fixed n, the component point estimate is q^d+O_n(q^(d−1/2)); d=2n−1 in the imaginary case and 2n in the real case. Divide by the corresponding quadratic count q^d−q^(d−1) and by |H₂(G′,c)[q−1]|. This last positive integer is bounded by the fixed finite multiplier order. Consequently the retained terms give the claimed polynomial-in-n lower bound with an error O_n(q^(−1/2)). Discarding all remaining terms preserves that inequality.

The argument therefore proves the liminf bound. It does not show that the remaining normalized terms converge. Replacing lim by liminf is justified; retaining lim requires an additional proof. The fixed positive group-theoretic factors in §2.1 transfer the lower bound to E. I do not claim to have found a group for which the limit fails to exist. The good-case calculation is not challenged.

### E2 — Confirmed; explicit characteristic-3 counterexample

SGA 1 XIII Corollary 2.12 gives inertia generators for the tame fundamental group, but its presentation with only the indicated relation is for the maximal prime-to-p quotient. For genus zero this quotient is free pro-prime-to-p of rank |S|−1. The whole tame group need not be pro-prime-to-p.

Here is a counterexample fitting a branch set arising from a prime-to-p cover. Over an algebraic closure of F3 let E be y²=x³+x²+1 with its point at infinity. The cubic is smooth: the affine partial derivatives could vanish only at (0,0), which is not on it, and the point at infinity is smooth. P=(2,1) has order 3: its tangent y=2x has triple intersection at P (equivalently 2P=(2,2)=−P).

Translation by P and inversion generate H≅C3⋊C2≅S3. Nonidentity translations have no fixed points. Every reflection x↦−x+aP has four fixed points, since [2] is étale of degree four; two distinct reflections cannot fix the same point, since their product would be a nonidentity translation fixing it. Every nontrivial stabilizer thus has order two. The quotient is tame, even in characteristic 3. Riemann–Hurwitz gives
0=6(2g(E/H)−2)+12,
so E/H has genus zero. There are four branch points (twelve ramification points in orbits of three).

Moreover E→E/⟨P⟩ is an étale degree-three quotient, and E/⟨P⟩→E/H is a quadratic cover with that same branch set. Move one branch point to infinity. The latter cover supplies a prime-to-3 target F=C2 and the same S as in Definition 3.12, whereas the full tame fundamental group still has quotient S3 of order divisible by 3.

This replaces the inherited modular-cover assertion, which I did not use. The repair is to use the maximal prime-to-p quotient. For the intended targets |F| is prime to p, and H₂(F,ℤ) is finite and annihilated by |F|, so the reduced Schur cover also has prime-to-p order. Both homomorphisms factor through the repaired quotient; this does not show a failure of the intended invariant.

### E3 — Confirmed; admissibility is sufficient, not minimal

In Proposition 4.4, take G=C3 and G′=⟨σ⟩≅C2. The marked ℚ(√−3)/ℚ extension has allowed finite inertia and the specified imaginary infinity type. A C3-extension of it has degree six over ℚ and cannot have a Galois closure with group C2. Thus the first displayed bijection is false without an extra condition.

The proof's inverse uses the first projection of ker(G′→C2), which is not surjective in this example. Require admissibility, or explicitly require σ∈G′ and surjectivity of that projection. Conjugation by σ gives surjectivity of the second projection. The two projection kernels intersect trivially, and the fixed field of the first is carried to that of the second by σ; their compositum recovers M. The allowed nontrivial inertia elements lie outside the kernel and have order two, so M/K is unramified at finite places, with the specified infinity behavior. This checks the proposed repair to the inverse construction. The paper's intended applications have admissible G′.

### E4 — Confirmed misprint

The intermediate Ẽ slice on published p.407 is q^n. The definitions and both input theorems use q^(2n). Replace that single exponent; the surrounding limit argument is unaffected.

### E5 — Confirmed misprints

The bad imaginary-case paragraph on published p.409 uses G where the Hurwitz group and its reduced multiplier are G′. It also writes a scalar-n point estimate where the component dimension is Σn_i=2n−1. Substitution into Theorem 4.7 gives q^(2n−1)+O_n(q^(2n−3/2)); the following display already has that exponent. No change to the theorem's dimension variable is intended.

### E6 — Confirmed misprints

The real-case sentence on published p.409 retains the imaginary case's extra infinity contribution. Here infinity splits. A tame inertia group of order two contributes |G′|/2 per degree of finite branch divisor in M and one in the quadratic cover. Hence the exponents are (Σn_i)|G′|/2 and Σn_i, without +1. The real count on p.410 has Σn_i=2n and is consistent. The imaginary +1 is correct.

### E7 — Confirmed false formulation; independent nontrivial-multiplier example

The homomorphism property, or Lemma 3.11 with exponent zero, gives I(ρ,1)=1. To disprove the unrestricted-u formulation it remains to exhibit a good admissible G′ for which A=H₂(G′,c)[2] is nontrivial over ℚ. The table suggests such examples; the following argument verifies one without relying on its computation.

Put S=SL₂(F5), G=S/{±I}=PSL₂(F5), and F=G≀C2. S is perfect: upper and lower unipotents U(t), L(t) generate S, and h=diag(2,3) satisfies [h,U(t)]=U(3t), [h,L(t)]=L(3t). Multiplication by 3 is invertible in F5, so all these generators are commutators. G is therefore perfect.

Write σ for the swapping involution. The involutions outside G² are exactly (a,a⁻¹)σ, all conjugate to σ, so F is good. It contains σ and its kernel projects onto G. In the quotient by the normal closure of σ the two commuting G factors become identified, forcing their common image to be abelian and thus trivial. Therefore those outside involutions generate F, proving admissibility.

Consider
B=((S×S)/⟨(−I,−I)⟩)⋊C2 → F.
Its kernel Z is central of order two, generated by z=[(−I,I)]. It lies in [B,B], since the image of the first perfect factor S contains z. The homology five-term sequence therefore makes H₂(F,ℤ)→Z surjective.

The centralizer of σ in F consists of (a,a)σ^ε. Each such element has lift [(A,A)]σ^ε in B, commuting with the lift of σ. Any other lift differs by central z and also commutes. The commutators used to define the reduced multiplier vanish under the transgression; all elements of c are conjugates of σ. Thus the surjection factors through H₂(F,c)→C2. Since H₂(F,c) is finite abelian, it has nonzero 2-torsion. This proves the required example; it does not assert an exact calculation of its entire multiplier.

For Q=ℚ and a nonidentity h∈A, setting u=1 gives an identically zero numerator in Conjecture 5.1. The tame quadratic denominators are positive for large bounds (for example ℚ(√−3) in the imaginary case and ℚ(√5) in the real case). The predicted average one is therefore impossible.

For the repair let μ_L=⟨ζ⟩ and u=ζ^a. Since the exponent of A divides |μ_Q| and |μ_Q| divides |μ_L|, evaluation at ζ identifies Hom(μ_L,A) with A. Evaluation at u is then h↦h^a. Taking u a generator is sufficient; more generally it suffices that gcd(a,exp(A))=1. This only repairs the indexing of a conjecture, not its unproved average-one assertion.

Finally, both page images print H₂(G′,c)|μ_Q| without torsion brackets. The original report's claim about braces was inaccurate. The JSON now records the actual notation and the bracket correction.

### E8 — Confirmed misprints

Both Appendix A.1 occurrences on published p.421 replace an order-12 group by an order-18 one. A trivial semidirect product is (C2×C2)×C3. The surrounding argument about unramified abelian extensions is valid here because the base is imaginary quadratic: ideal-class conjugation acts by inversion and preserves every subgroup, hence the extension is Galois over ℚ. No broader base-field claim is inferred.

## Diagnostics, validation and limits

A scratch-only, Python-standard-library diagnostic enumerates SL₂(F5) (120 elements), PSL₂(F5) (60), F (7200) and B (14400); checks the unipotent commutator identities, generation by the 60 outside involutions, the central kernel of order two, and all 240 lifts of the 120 centralizer elements commuting with the swap. It also checks the characteristic-3 point doubling and the 36 pairs in the six-point E(F3) group law, 100 discriminant/dimension substitutions, and the two product orders. These finite checks supplement the written arguments; they do not substitute for the geometric or homological steps.

Checks run for the submission: errata validator; intake path checks for all four deliverables; 65 relevant unit tests (errata validator, registry, source issues, intake and issue completion); finite diagnostics; read-only simulation that this completed review contributes exactly eight confirmed rows. No extraction, generated register, queue, roadmap or library files are changed. No Lean was written or compiled; nothing is claimed formalized.

No inherited finding remains undecided. In particular the E1 limit-existence question and the repaired E7 average remain open here; confirming the findings is not supplying proofs of those statements.
