# Ordinary bidual evaluation of the polynomial section ideal


For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J.

This is ordinary R-linear reflexivity of the actual polynomial ideal. It does not establish arbitrary coefficient-module Hom exchange, higher Ext vanishing, relative stable reflexivity, completion or family/sheaf descent.

The inverse ψ sends F to F(incl). The relation d·ε=b·incl implies dF(ε)=bF(incl). The existing dual syzygy expresses F(incl)=dr+ιαc, proving it lies in J. Evaluating η(j) at inclusion proves ψη=id. Conversely d is regular, so the same relation gives F(ε)=ε(ψ(F)). The dual presentation writes every functional as z₀·incl−z₁·ε, proving ηψ=id. This proves native Module.IsReflexive R J and identifies the native evaluation equivalence; ordinary reflexivity of D follows from Mathlib’s existing instance.

These deductions use only the polynomial algebra over any commutative coefficient ring. Knudsen’s printed Proposition3.1 assumes noetherianity and an invertible discriminant and has the stronger stable-reflexivity conclusion. Corollary3.2 and §4 require completion and local-to-family comparison; those obligations remain explicit.

The roadmap builds on the parent’s nodal-curve, stabilization and DVR existence/uniqueness results. Full pointed moduli, coarse spaces, fine level schemes and all six reserved-key consumers keep their existing distinct contracts. The nineteen Yuan and two DGH routed requirements are unchanged.

The definitions use [native Mathlib bidual evaluation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dual/Defs.lean), following the [human discussion of dual linear maps](https://leanprover-community.github.io/archive/stream/113489-new-members/topic/How.20to.20express.20dual.20linear.20maps.3F.html). A bounded open-PR search for module reflexive returned no matches. The source is [Knudsen, §3](https://arxiv.org/html/1106.1588v2#S3); the explicit inverse proof is an authored deduction.

## Declaration contracts


### The dual generator module relation


`StableReductionPartII:MC.2/section-dual-generator-module-relation` — `NodeSectionFactorization.PolynomialModel.dualGenerator_module_relation`.

For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. d·ε=b·incl in D.

Hypotheses: No noetherianity, invertible discriminant, nonzero coefficient ring or nonzero parameters are assumed. Duals here are R-linear.

Prerequisites: `StableReductionPartII:MC.2/section-dual-generator-formula`, `StableReductionPartII:MC.2/section-dual-multiplication`.

Proof: Evaluate both linear maps at j∈J and use dε(j)=bj; multiplication by 1 is inclusion.

Acceptance: Use the actual ideal subtype and native Module.Dual, Module.Dual.eval and Module.IsReflexive; no abstract replacement carrier. This is ordinary R-linear reflexivity of the actual polynomial ideal. It does not establish arbitrary coefficient-module Hom exchange, higher Ext vanishing, relative stable reflexivity, completion or family/sheaf descent.

### The bidual generator relation


`StableReductionPartII:MC.2/section-bidual-relation` — `NodeSectionFactorization.PolynomialModel.sectionBidual_relation`.

For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. Every F∈Hom_R(D,R) satisfies dF(ε)=bF(incl).

Hypotheses: No noetherianity, invertible discriminant, nonzero coefficient ring or nonzero parameters are assumed. Duals here are R-linear.

Prerequisites: `StableReductionPartII:MC.2/section-dual-generator-module-relation`.

Proof: Apply the R-linear functional F to d·ε=b·incl and use R-linearity.

Acceptance: Use the actual ideal subtype and native Module.Dual, Module.Dual.eval and Module.IsReflexive; no abstract replacement carrier. This is ordinary R-linear reflexivity of the actual polynomial ideal. It does not establish arbitrary coefficient-module Hom exchange, higher Ext vanishing, relative stable reflexivity, completion or family/sheaf descent.

### Bidual values belong to the section ideal


`StableReductionPartII:MC.2/section-bidual-value-membership` — `NodeSectionFactorization.PolynomialModel.sectionBidual_value_mem`.

For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. For every F∈Hom_R(D,R), F(incl)∈J.

Hypotheses: No noetherianity, invertible discriminant, nonzero coefficient ring or nonzero parameters are assumed. Duals here are R-linear.

Prerequisites: `StableReductionPartII:MC.2/section-bidual-relation`, `StableReductionPartII:MC.2/section-dual-syzygy`, `mathlib:Ideal.mem_span_pair`.

Proof: Apply the earlier dual syzygy to x=F(ε), y=F(incl). It gives y=dr+ιαc, hence ideal membership.

Acceptance: Use the actual ideal subtype and native Module.Dual, Module.Dual.eval and Module.IsReflexive; no abstract replacement carrier. This is ordinary R-linear reflexivity of the actual polynomial ideal. It does not establish arbitrary coefficient-module Hom exchange, higher Ext vanishing, relative stable reflexivity, completion or family/sheaf descent.

### Inverse of section bidual evaluation


`StableReductionPartII:MC.2/section-bidual-inverse` — `NodeSectionFactorization.PolynomialModel.sectionBidualInverse`.

For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. Construct the R-linear map ψ:Hom_R(D,R)→J with underlying value ψ(F)=F(incl).

Hypotheses: No noetherianity, invertible discriminant, nonzero coefficient ring or nonzero parameters are assumed. Duals here are R-linear.

Prerequisites: `StableReductionPartII:MC.2/section-bidual-value-membership`.

Proof: Use membership to form the actual ideal subtype. Addition and scalar multiplication are inherited from evaluation at incl.

Acceptance: Use the actual ideal subtype and native Module.Dual, Module.Dual.eval and Module.IsReflexive; no abstract replacement carrier. This is ordinary R-linear reflexivity of the actual polynomial ideal. It does not establish arbitrary coefficient-module Hom exchange, higher Ext vanishing, relative stable reflexivity, completion or family/sheaf descent.

API `NodeSectionFactorization.PolynomialModel.sectionBidualInverse_value` (projection): For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. The image of ψ(F) in R is F(incl).

API `NodeSectionFactorization.PolynomialModel.sectionBidualInverse_eval` (relation): For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. For every j∈J, ψ(η(j))=j.

API `NodeSectionFactorization.PolynomialModel.sectionBidual_eval_inverse` (relation): For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. For every F∈Hom_R(D,R), η(ψ(F))=F.

Test `NodeSectionFactorization.PolynomialModel.sectionBidualInverse.test_zero` (degenerate): For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. ψ(0)=0.

Test `NodeSectionFactorization.PolynomialModel.sectionBidualInverse.test_first` (computation): For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. ψ(η(⟨c,c∈J⟩))=⟨c,c∈J⟩.

Test `NodeSectionFactorization.PolynomialModel.sectionBidualInverse.test_second` (computation): For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. ψ(η(⟨d,d∈J⟩))=⟨d,d∈J⟩.

### Underlying value of the bidual inverse


`StableReductionPartII:MC.2/section-bidual-inverse-value` — `NodeSectionFactorization.PolynomialModel.sectionBidualInverse_value`.

For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. The image of ψ(F) in R is F(incl).

Hypotheses: No noetherianity, invertible discriminant, nonzero coefficient ring or nonzero parameters are assumed. Duals here are R-linear.

Prerequisites: `StableReductionPartII:MC.2/section-bidual-inverse`.

Proof: Unfold the defining subtype map.

Acceptance: Use the actual ideal subtype and native Module.Dual, Module.Dual.eval and Module.IsReflexive; no abstract replacement carrier. This is ordinary R-linear reflexivity of the actual polynomial ideal. It does not establish arbitrary coefficient-module Hom exchange, higher Ext vanishing, relative stable reflexivity, completion or family/sheaf descent.

### Evaluation has a left inverse


`StableReductionPartII:MC.2/section-bidual-inverse-evaluation` — `NodeSectionFactorization.PolynomialModel.sectionBidualInverse_eval`.

For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. For every j∈J, ψ(η(j))=j.

Hypotheses: No noetherianity, invertible discriminant, nonzero coefficient ring or nonzero parameters are assumed. Duals here are R-linear.

Prerequisites: `StableReductionPartII:MC.2/section-bidual-inverse`, `mathlib:Module.Dual.eval`.

Proof: Evaluate η(j) at incl; the underlying value is incl(j)=j. Apply subtype extensionality.

Acceptance: Use the actual ideal subtype and native Module.Dual, Module.Dual.eval and Module.IsReflexive; no abstract replacement carrier. This is ordinary R-linear reflexivity of the actual polynomial ideal. It does not establish arbitrary coefficient-module Hom exchange, higher Ext vanishing, relative stable reflexivity, completion or family/sheaf descent.

### Evaluation has a right inverse


`StableReductionPartII:MC.2/section-bidual-evaluation-inverse` — `NodeSectionFactorization.PolynomialModel.sectionBidual_eval_inverse`.

For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. For every F∈Hom_R(D,R), η(ψ(F))=F.

Hypotheses: No noetherianity, invertible discriminant, nonzero coefficient ring or nonzero parameters are assumed. Duals here are R-linear.

Prerequisites: `StableReductionPartII:MC.2/section-bidual-inverse-value`, `StableReductionPartII:MC.2/section-bidual-relation`, `StableReductionPartII:MC.2/section-coordinate-regular`, `StableReductionPartII:MC.2/section-dual-generator-formula`, `StableReductionPartII:MC.2/section-dual-presentation-surjective`, `StableReductionPartII:MC.2/section-dual-presentation-formula`, `StableReductionPartII:MC.2/section-dual-multiplication`, `mathlib:Module.Dual.eval`.

Proof: Set j=ψ(F), so F(incl)=j. Both dF(ε) and dε(j) equal bj; cancel the regular coordinate d to get F(ε)=ε(j). Write every h∈D as z₀·incl−z₁·ε using the actual dual presentation. R-linearity and equality on incl and ε give h(j)=F(h), hence extensional equality.

Acceptance: Use the actual ideal subtype and native Module.Dual, Module.Dual.eval and Module.IsReflexive; no abstract replacement carrier. This is ordinary R-linear reflexivity of the actual polynomial ideal. It does not establish arbitrary coefficient-module Hom exchange, higher Ext vanishing, relative stable reflexivity, completion or family/sheaf descent.

### Ordinary reflexivity of the section ideal


`StableReductionPartII:MC.2/section-ideal-ordinary-reflexive` — `NodeSectionFactorization.PolynomialModel.sectionIdealReflexive`.

For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. The actual ideal J satisfies Module.IsReflexive R J, with its native bidual evaluation map.

Hypotheses: No noetherianity, invertible discriminant, nonzero coefficient ring or nonzero parameters are assumed. Duals here are R-linear.

Prerequisites: `StableReductionPartII:MC.2/section-bidual-inverse-evaluation`, `StableReductionPartII:MC.2/section-bidual-evaluation-inverse`, `mathlib:Module.IsReflexive`, `mathlib:Module.Dual.instIsReflecive`.

Proof: The explicit two-sided inverse makes native evaluation bijective, exactly the field required by Module.IsReflexive.

Acceptance: Use the actual ideal subtype and native Module.Dual, Module.Dual.eval and Module.IsReflexive; no abstract replacement carrier. This is ordinary R-linear reflexivity of the actual polynomial ideal. It does not establish arbitrary coefficient-module Hom exchange, higher Ext vanishing, relative stable reflexivity, completion or family/sheaf descent.

Test `NodeSectionFactorization.PolynomialModel.sectionIdealReflexive.test_nonreduced` (degenerate): For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. For A=Z/4 and γ=δ=s=t=0, the actual ideal J is reflexive over R; no reducedness or unit discriminant is used.

Test `NodeSectionFactorization.PolynomialModel.sectionIdealReflexive.test_zeroRing` (degenerate): For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. For A=Z/1 and γ=δ=s=t=0, native Module.IsReflexive R J still holds.

Test `NodeSectionFactorization.PolynomialModel.sectionIdealReflexive.test_dual` (compatibility): For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. The native instance Module.Dual.instIsReflecive also gives Module.IsReflexive R D from the proved reflexivity of J.

### Canonical section bidual equivalence


`StableReductionPartII:MC.2/section-bidual-equivalence` — `NodeSectionFactorization.PolynomialModel.sectionBidualEquiv`.

For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. Construct E:J≃ₗ[R]Hom_R(D,R) as native Module.evalEquiv R J using the proved ordinary reflexivity.

Hypotheses: No noetherianity, invertible discriminant, nonzero coefficient ring or nonzero parameters are assumed. Duals here are R-linear.

Prerequisites: `StableReductionPartII:MC.2/section-ideal-ordinary-reflexive`, `mathlib:Module.evalEquiv`, `StableReductionPartII:MC.2/section-dual-generator-values`.

Proof: Supply the proved native reflexivity instance and use the library evaluation equivalence.

Acceptance: Use the actual ideal subtype and native Module.Dual, Module.Dual.eval and Module.IsReflexive; no abstract replacement carrier. This is ordinary R-linear reflexivity of the actual polynomial ideal. It does not establish arbitrary coefficient-module Hom exchange, higher Ext vanishing, relative stable reflexivity, completion or family/sheaf descent.

API `NodeSectionFactorization.PolynomialModel.sectionBidualEquiv_apply` (simp): For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. For every j∈J and h∈D, E(j)(h)=h(j).

API `NodeSectionFactorization.PolynomialModel.sectionBidualEquiv_inverse` (equivalence): For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. For every F∈Hom_R(D,R), E⁻¹(F)=ψ(F).

API `NodeSectionFactorization.PolynomialModel.sectionBidualEquiv_native` (compatibility): For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. The underlying linear map of E equals Module.Dual.eval R J.

Test `NodeSectionFactorization.PolynomialModel.sectionBidualEquiv.test_epsilon_first` (computation): For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. E(⟨c,c∈J⟩)(ε)=−a.

Test `NodeSectionFactorization.PolynomialModel.sectionBidualEquiv.test_epsilon_second` (computation): For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. E(⟨d,d∈J⟩)(ε)=b.

Test `NodeSectionFactorization.PolynomialModel.sectionBidualEquiv.test_negative_generator` (non-example): For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. E(−⟨d,d∈J⟩)(ε)=−b; the sign agrees with the ordered dual presentation.

Test `NodeSectionFactorization.PolynomialModel.sectionBidualEquiv.test_roundtrip` (characterisation): For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. For arbitrary F∈Hom_R(D,R), E(ψ(F))=F.

### Bidual equivalence evaluation


`StableReductionPartII:MC.2/section-bidual-equivalence-apply` — `NodeSectionFactorization.PolynomialModel.sectionBidualEquiv_apply`.

For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. For every j∈J and h∈D, E(j)(h)=h(j).

Hypotheses: No noetherianity, invertible discriminant, nonzero coefficient ring or nonzero parameters are assumed. Duals here are R-linear.

Prerequisites: `StableReductionPartII:MC.2/section-bidual-equivalence`, `mathlib:Module.Dual.eval`.

Proof: This is the defining native evaluation formula.

Acceptance: Use the actual ideal subtype and native Module.Dual, Module.Dual.eval and Module.IsReflexive; no abstract replacement carrier. This is ordinary R-linear reflexivity of the actual polynomial ideal. It does not establish arbitrary coefficient-module Hom exchange, higher Ext vanishing, relative stable reflexivity, completion or family/sheaf descent.

### Explicit inverse of the bidual equivalence


`StableReductionPartII:MC.2/section-bidual-equivalence-inverse` — `NodeSectionFactorization.PolynomialModel.sectionBidualEquiv_inverse`.

For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. For every F∈Hom_R(D,R), E⁻¹(F)=ψ(F).

Hypotheses: No noetherianity, invertible discriminant, nonzero coefficient ring or nonzero parameters are assumed. Duals here are R-linear.

Prerequisites: `StableReductionPartII:MC.2/section-bidual-equivalence`, `StableReductionPartII:MC.2/section-bidual-evaluation-inverse`.

Proof: Apply injectivity of E; native inverse cancellation and η(ψ(F))=F identify both images.

Acceptance: Use the actual ideal subtype and native Module.Dual, Module.Dual.eval and Module.IsReflexive; no abstract replacement carrier. This is ordinary R-linear reflexivity of the actual polynomial ideal. It does not establish arbitrary coefficient-module Hom exchange, higher Ext vanishing, relative stable reflexivity, completion or family/sheaf descent.

### Agreement with native bidual evaluation


`StableReductionPartII:MC.2/section-bidual-equivalence-native` — `NodeSectionFactorization.PolynomialModel.sectionBidualEquiv_native`.

For every commutative ring A and γ,δ,s,t∈A, put q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R, and ε∈D with dε(j)=bj. Write η=Module.Dual.eval R J. The underlying linear map of E equals Module.Dual.eval R J.

Hypotheses: No noetherianity, invertible discriminant, nonzero coefficient ring or nonzero parameters are assumed. Duals here are R-linear.

Prerequisites: `StableReductionPartII:MC.2/section-bidual-equivalence`, `mathlib:Module.Dual.eval`.

Proof: Unfold native Module.evalEquiv; its forward linear map is evaluation.

Acceptance: Use the actual ideal subtype and native Module.Dual, Module.Dual.eval and Module.IsReflexive; no abstract replacement carrier. This is ordinary R-linear reflexivity of the actual polynomial ideal. It does not establish arbitrary coefficient-module Hom exchange, higher Ext vanishing, relative stable reflexivity, completion or family/sheaf descent.

---


The preceding checkpoint specification follows unchanged. The ordinary bidual calculation above resolves only its polynomial evaluation step; its stronger remaining obligations retain their stated scope.

# Stable reduction of curves and stable maps, Part II

## Scope and execution state

This is a **partial research checkpoint**, not an accepted or closed blueprint.
It continues the parent StableReduction roadmap at its moduli-stack boundary.
The parent owns nodal curve families, dualizing/cohomological curve theory,
stability, family gluing, forgetting and contraction, and stable reduction over
traits. Here those objects become moduli groupoids and stack morphisms; the
parent is imported rather than planned a second time. Stable-map moduli are
not constructed in this continuation.

Every stage is partial. The packet records 188 declaration nodes, 187 distinct
API names (189 entries across all nodes; 188 definition/construction entries),
178 definition/construction tests and 182 tests on all nodes, 35 planets,
135 precise supplier requests, fourteen gaps and 104 inspected pinned-library
declarations. Every implementation status remains unchecked. The complete
canonical suggested file is an admitted plan. The separate native proof checks
establish the actual polynomial section algebra and now both specified matrix
cokernel comparisons and the ordinary and transposed alternating complex.
They do not close any moduli stage or establish arbitrary-module Hom/Ext,
tensor/completion or actual family/stack comparisons.

The two binding routes contribute nineteen Yuan items and two DGH items.
The reserved moduli-curves node also serves the six key-definition consumers.
Hurwitz spaces, their Sp/GSp torsors, pure mapping-class groups and tautological
Chow-ring presentations remain with their existing consumer owners. The source
proofs and missing foundations listed below must be reconciled before any stage
can be called source_decomposed or closed.


## The two polynomial matrix presentations

This continuation checks ordinary module exactness and the prescribed cokernel
maps in the actual polynomial node model. It contributes 27 declaration-sized
items: two ordered syzygies, two actual presentation maps and their APIs,
six promoted coordinate/cokernel API lemmas, the four matrix action formulas,
and the separate alternating and transposed exactness lemmas. These are local
algebra inputs to MC.2. The packet remains a plan with unchecked implementations.

Let A be any commutative ring, including the zero ring. For γ,δ,s,t∈A set
q(x,y)=x²+γxy+δy² and R=AdjoinRoot(F), where
F=X²+C(γY)X+C(δY²−q(s,t)). Write u=[X], v=[Y], ι:A→R,
c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδv+ιδ·ιt+ιγu.
The actual ideal is J=(c,d), and D=Hom_R(J,R). The existing native coordinate
equivalence E:R≃A[Y]×A[Y] has inverse (p,q₁)↦of(p)+u·of(q₁).
It proves that d is regular, and the polynomial relation gives cb+da=0.
The already characterized ε∈D satisfies dε(j)=bj, ε(c)=−a and ε(d)=b.

The matrices are ordered as Φ=((a,b),(−c,d)) and Ψ=((d,−b),(c,a)).
Their actions and those of their transposes are separate consumed lemmas.
The presentations use native linear maps and native module quotients:

| Presentation | Formula on a vector z | Kernel | Cokernel comparison |
| --- | --- | --- | --- |
| P_J:R²→J | cz₀−dz₁ | im Ψ | coker Ψ≃J, [z]↦cz₀−dz₁ |
| P_D:R²→D | z₀·incl−z₁·ε | im Φ | coker Φ≃D, [z]↦z₀·incl−z₁·ε |

The negative second generator is part of both contracts. In particular,
the second basis class represents −d in J and −ε in D. For the dual comparison
the denominator-free formula is d e_D([z])(j)=(dz₀−bz₁)j.
It does not require a chosen fraction ring. Both maps are surjective:
write a span element as xc+yd to get P_J(x,−y), and use the established dual
normal form h=r·incl+ια·ε to get P_D(r,−ια).
The existing Mathlib first isomorphism theorem constructs the equivalences
after transport along the separately proved kernel equalities. Quotient
induction proves their uniqueness; regularity of d proves pointwise uniqueness
for the dual. Generic quotient and first-isomorphism theory are imported.

The first syzygy is: cx=dy implies x=dr+ιαb and y=cr−ιαa for some
r∈R and α∈A. If E(x)=(p,q₁), the second coordinate evaluated at Y=t gives
p(t)=(s+γt)q₁(t). Put α=q₁(t), divide the two coordinate polynomials after
subtracting their values at t by Y−t, and reconstruct r. The identity
E(b)=(C(s+γt),1) gives x=dr+ιαb. Substitution and cancellation of d give
the second equality. Hence ker P_J=im Ψ, with the explicit preimage (r,−ια).

The second syzygy is: dx=by implies x=br−ιαa and y=dr+ιαc.
Now the second coordinate of by, evaluated at t, forces p(t)=−s q₁(t)
for E(y)=(p,q₁). The promoted formula E(c)=(−Cs,1) gives y=dr+ιαc.
Cancellation gives x=br−ιαa. Thus ker P_D=im Φ, with preimage (−ια,r).
The characterization P_D(z)=0 iff dz₀=bz₁ is checked on the actual dual:
evaluate on d in one direction; multiply every evaluation by d and cancel
in the other direction.

The second coordinate of Φz and first coordinate of Ψz reduce ordinary
exactness to these two presentation kernels. For the transposed left matrix,
its second coordinate gives d(−z₁)=bz₀; the second syzygy yields
z=Ψᵀ(r,ια). For the transposed right matrix its first coordinate gives
c(−z₁)=dz₀; the first syzygy yields z=Φᵀ(−ια,−r).
The reverse containments are direct calculations from cb+da=0.
All four kernel/image equalities therefore hold without assuming them from
the matrix product identity.

Fresh source scope is [Knudsen, §3](https://arxiv.org/html/1106.1588v2#S3),
including the full setup and Proposition 3.1/Corollary 3.2 proofs, also read
in the primary PDF on printed pp.11–13. Knudsen assumes noetherian A and
unit discriminant in that passage. The arbitrary coefficient-ring range here
is an authored coordinate proof, checked in native Lean. It does not extend
the published relative stable-reflexivity, completion or family conclusions.

Twelve new proof examples exercise both actual presentations on their two
basis vectors and zero, the constructed ideal comparison over Z/4 and the
zero ring, the constructed dual comparison over Z/3 and Z/2, and actual
ordinary/transposed exactness over Z/4 and the zero ring. They instantiate
constructed equivalences. The inherited sign and receiving-ring counterexamples
remain. Existing planets are retained; these consumed algebra lemmas do not
introduce duplicate display targets.

The next algebra input is arbitrary coefficient-module tensor exactness.
Use the two cokernel comparisons and coefficient projectivity/freeness to
identify the image modules and obtain the required split exact sequences
over A before tensoring with an arbitrary A-module M. Check torsion M=Z/2
over Z explicitly. Actual module-valued Hom exchange, bidual evaluation and
higher Ext need their own natural maps and proofs. No conclusion about these,
adic completion, completed-local approximation or actual nodal-family sheaves
is inferred from ordinary matrix exactness. All eight moduli stages, fourteen
gaps and 135 supplier requests remain open.

The polynomial model in MC.2 uses the native quotient, ideal and coefficient
scalar tower. This checkpoint retains the actual A-linear ideal projection
and canonical section splitting, names the inherited dual generator ε and
correction map K, and checks their native proof bodies separately. The complete
Mathlib-only suggested sketch and the separate immutable proof extraction are
checked separately. Every submitted body added here remains an admitted sketch
under PROTOCOL section 13; no stage is closed.

Fresh source reading covers Knudsen2012 v2 §3 Key Example through the proofs of
Proposition3.1 and Corollary3.2 in HTML. The published proposition assumes
noetherian A and unit discriminant. The evaluation, kernel and coefficient
splitting are explicit arbitrary-ring algebra deductions verified on the native
quotient; they do not extend the published relative stable-reflexivity or
completed-family theorem. Earlier whole-paper, Appendix and PDF receipts are
historical. Bourbaki and the cited unproved exercise remain open.

## Coefficient projectivity and tensor retraction

The actual ideal J is projective over A because its native inclusion into the
A-free quotient R has the canonical A-linear sectionProjection as a retraction.
The actual R-linear dual D is A-free by its constructed coefficient-linear
normal equivalence with R×A. The existing projective/free-flat instances give
both previously planned coefficient-flatness statements.

For every A-module M, tensoring the actual inclusion and projection preserves
their retraction identity; the tensor inclusion is therefore injective without
assuming M flat. Six new checked examples cover Z/4, the zero ring and the
torsion coefficient module Z/2 over Z. This does not establish tensor exactness
of the alternating matrix complex or the canonical tensor-dual comparison.
Matrix cokernels, Hom/Ext exchange, completion and all family geometry remain
open. The durable native proof extraction and exact checks are in the handoff.

## Canonical coefficient splitting

Write R=A[Y][X]/(q(X,Y)−q(s,t)), u=[X], v=[Y], ι:A→R and
J=(u−ιs,v−ιt). Native quotient evaluation ev:R→A has ev∘ι=id and
kernel J. The built bivariate evaluation-ideal theorem proves the kernel on
polynomial representatives; its image through the actual quotient map is the
coordinate ideal J. No ideal-generation hypothesis is added.

The explicit ι agrees with the inherited algebra map A→R. Therefore
ev(a·r)=a ev(r) for the existing scalar action. Define p:R→J by
p(r)=r−ι(ev(r)). Kernel membership makes this an actual ideal element;
addition and coefficient linearity make it an A-linear map. It fixes every
j∈J and kills every coefficient ι(a).

The inherited sectionSplit is e:R≃J×A, e(r)=(p(r),ev(r)), with inverse
(j,a)↦j+ι(a). The two projection identities prove both inverse laws;
linearity uses the existing scalar tower. The section law e(ι(a))=(0,a)
uses exactly these maps. This supplies the retraction for coefficient flatness
of J from the free coefficient module R.

Four projection tests cover an arbitrary actual ideal element, the zero ring,
Z/4 at the nonzero section s=1 with zero discriminant, and failure of R-linearity.
The three inherited splitting tests are checked as well. In the last fixture,
R=ℚ[Y][X]/(X²+YX), p(1)=0 and p(u)=u≠0. Monicity and the native quotient
degree bound prove u≠0, so p(u·1)≠u p(1). A coefficient splitting does not
assert R-flatness, R-projectivity or invertibility at the node.

The separate canonical proof extraction has 34 axiom audits and 16
examples, zero errors/warnings and no admitted-proof axiom dependency. It includes
the inherited thirteen evaluation/projection/splitting proofs and 21 dual-generator
and correction declarations. Its exact
source survives at the immutable suggested-file revision linked in the
[handoff](../handoff/DESIGN-StableReductionPartII.md). The complete current
[suggested sketch](../suggested/StableReductionPartII.lean) is checked separately;
its admissions do not establish the remaining cokernel, tensor, ambient,
completion or moduli assertions.

Historical fifteen-body normal-form, coefficient-freeness, regularity and
coefficient-map proofs remain at immutable cef4c2085eddbf723e9050f7d4924924d593a0e3.
They are not freshly checked or reinstalled by this checkpoint.

## Native dual generator and correction

Over every commutative A, including the zero ring, keep the actual quotient
R, coefficient map ι and ideal J above. Write c=u−ιs, d=v−ιt,
b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. The quotient relation gives
cb+da=0. Monicity of F supplies native A[Y]-module freeness directly; the
free-module torsion-freeness instance makes the action of the monic Y−t
injective, and this is multiplication by d. This route does not assume the
full two-coefficient normal-form theorem.

For actual j∈J, native ideal membership gives j=xc+yd. The element
−ax+by satisfies d(−ax+by)=bj. Choose this witness for each j;
regularity of d makes it unique and proves additivity and R-linearity.
This defines the named `dualGenerator : J →ₗ[R] R` on the existing ideal,
with no denominator or localization. Its formula is dε(j)=bj,
its values are ε(c)=−a and ε(d)=b, and every map with that formula equals it.
The membership proofs for c and d are actual lemmas, not admitted arguments.

Restrict ε to coefficient scalars and compose it with the existing ideal
projection p. This defines `dualCorrectionMap : R →ₗ[A] R`, K(r)=ε(p(r)).
Consequently dK(r)=b(r−ι(ev(r))). Multiplicativity of ev and ι and cancellation
of d give K(rz)=rK(z)+ι(ev(z))K(r). The projection fixes c,d and kills
coefficients, so K(c)=−a, K(d)=b and K(ι(α))=0. The same cancellation proves
uniqueness among all A-linear maps with the denominator-free formula.
These are the existing two construction nodes, with concrete canonical names;
no parallel dual or correction carrier is planned.

Eight additional lemma nodes make the consumed interfaces explicit: monicity,
A[Y]-freeness, cb+da=0, ideal divisibility, the canonical ε formula, its generic
generator values, the K formula and its product law. The latter two are
consumed by coefficient naturality and tensor-action plans. Their proof
obligations retain the actual quotient and inherited coefficient action.
The pinned binary-ideal membership, quotient relation, basis torsion-freeness
and scalar restriction results are imported. The free-module instance exists
and is used by Lean; its priority-annotated name is absent from the declaration
index, so its indexed supporting basis theorem is cited in the packet.

The eight added API items are `sectionFirst_mem`, `sectionSecond_mem`,
`dualGenerator_spec`, `dualCorrectionMap_apply`, `dualCorrectionMap_spec`,
`dualCorrectionMap_product`, `dualCorrectionMap_values` and
`dualCorrectionMap_coefficient`, all in the PolynomialModel namespace.
The two original API lists and their six test contracts are preserved.
Four extra tests exercise named maps: ε(d)=u+1 over Z/4 at s=1 with zero
discriminant; ε(c)=−u, ε(d)=u and u≠−u over F₃; K(u)=u over F₂ with unit
discriminant; and K(rd)=rb for arbitrary r, detecting the product-law orientation.
The older custom-presentation `dualSignThree` example remains an admitted sketch;
the new canonical sign fixture is checked on the actual native quotient.

The preceding handoff's C1–C8 derivations for arbitrary coefficient modules,
Hom exchange and canonical bidual/Ext computations remain available at the
immutable revision linked in the handoff. This checkpoint integrates the
native ε calculation, not those entire arguments. Cokernel identifications,
tensor exchange, two-base completion,
pointed-family identification and geometric descent still require their
existing proofs and supplier interfaces. No stage or moduli key is closed.

## Conventions and interfaces

The genus and marking number are nonnegative integers with 2g−2+n>0 for pointed
stable moduli. Markings are ordered, disjoint and contained in the relative
smooth locus. Arithmetic genus is used on nodal fibres; a self-node contributes
two flags on the normalization. Stability is the parent’s ampleness condition
for the log-dualizing line. The moduli definition retains isomorphisms and
automorphism groups over every base scheme. The smooth and stable flavours use
one underlying interface. A classifying family is a map to this stack, not
automatically a point of a scheme.

Three objects have distinct meanings: the moduli stack, its coarse algebraic
space, and a smooth-curve fine level scheme. Coarse points classify geometric
isomorphism classes and forget inertia; a coarse universal curve is not supplied.
The smooth stable stack is not evidence for smoothness of its coarse scheme.
Full level N≥3 is prime to the characteristic, with a fixed trivialization of
μ_N for a symplectic component. The homogeneous similitude interpretation over
Z[1/N] retains multiplier components. DGH uses one component fixed by ζ_N.
At a nodal boundary the Jacobian is semiabelian, so the smooth full-torsion-frame
definition is not asserted to give a fine stable moduli scheme.

The universal stable curve includes an arbitrary extra section, which can meet
a node or collide with a marking. Knudsen expansion inserts a three-flag rational
bridge at a node or a rational tail at a collision. It is inverse to forgetting
the final mark and stabilizing. The total universal stack can be smooth over Z
while its projection to moduli is nodal. The genus-zero tests are M̄₀,₃=Spec Z
and M̄₀,₄=P¹, with smooth M₀,₄ obtained by deleting 0,1,∞. The genus-one
stack retains the elliptic involution; it is not its coarse j-line.

For g≥2 tricanonical embedding has degree6g−6, rank of sections5g−5,
projective dimension5g−6 and Hilbert polynomial(6t−1)(g−1). The Hilbert locus
also imposes the canonical polarization, not just that polynomial. Projective
frames form a PGL(5g−5)-torsor and give the quotient-stack atlas. Properness
uses the parent’s stable reduction and a stack valuative criterion allowing a
finite extension of the trait field. The finite unramified diagonal uses stable
model uniqueness, including nodal generic fibres.

Boundary branches are chart-local node parameters. Normal crossings do not
mean globally simple normal crossings: Δ₀ can have several branches at one
curve. Normalization remembers a distinguished node and graph automorphisms,
including the constant branch-exchange group in characteristic two. A separating
clutching map can have multiple preimages even when the genera differ and there
is a marking. For three nonisomorphic elliptic curves in a genus-three chain
with a central marking, either outer tail gives a different preimage in
M̄₁,₁×M̄₂,₂. Corollary3.9(b) of KnudsenII therefore requires independent
review; the draft uses finite unramified clutching rather than that global
closed-immersion claim. A chosen boundary branch has conormal L_a⊗L_b and
normal first Chern class−ψ_a−ψ_b. Forgetting corrects the marking cotangent
line by the positive collision divisor on the source.

The Hodge vector bundle E=f_*ω has rank g; λ=det E is a line. Markings are
not included in ω in this definition. Integral Noether means an isomorphism
λ¹²≅⟨ω,ω⟩⊗O(Δ), not only an equality in rational Chow. Mumford’s rational
GRR calculation is supplemented by torsion freeness of the complex stack Picard
group and injection from the integral Picard group. Those arguments require
geometric irreducibility and topology imports. The line-valued Deligne pairing
is a separate missing foundational construction. Universal integral units are
±1; an arbitrary family base can have other units. Thus semi-canonical refers
to pullbacks of a universal integral choice. A generically smooth family pulls
Δ back as a Cartier divisor; a constant nodal family does not. At a trait each
node contributes its thickness, with residue degrees before splitting.

The compactification construction retains more than the classifying image.
Choose a projective compactification S̄₀ and a finite moduli scheme cover V.
For W=S×_{M̄_g}V choose a component W₀ dominating integral S. Its map to
S×V is finite and can remember several isomorphisms of the same two families.
Close its image in S̄₀×V and normalize in K(W₀). This preserves the base
coordinate and the finite function-field data, and its open part is the
normalization of W₀. Closing only the image in V loses a positive-dimensional
constant-family base. The resulting cover is finite surjective over S and its
projective compactification carries the stable pullback family.

Smooth Torelli takes a curve-level family to its relatively polarized Jacobian.
Strong Torelli gives at most two geometric level preimages, with sign ambiguity
on nonhyperelliptic curves. Hyperelliptic involution realizes sign change;
genus2 is consequently injective on geometric points. Finite geometric fibres
do not assert that the smooth Torelli morphism is finite. For maximal variation
the coarse classifying map is generically quasi-finite onto its image; its
composition with compactified Torelli is generically finite, so pullback of an
ample rational Hodge line is nef and big. The all-characteristic boundary
extension and the relative-family Jacobian require supplier extensions.

Degree-d Picard parameters are fppf sheafified line classes. They are torsors
under the relative Jacobian, not necessarily equipped with an origin or a
universal line. Geometric algebraically closed field points can be described by
triples (C,level,L). Over general bases a Brauer obstruction can prevent a
global line bundle, and the triple groupoid still has scalar G_m inertia. A
chosen section permits rigidification; an unpointed universal curve is not
silently endowed with one.

## Library baseline and ownership

Mathlib is pinned to082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti to
f790474821cf4256814db967cb154e7af3d0c369. The parent’s reviewed library audit,
AUDIT02 and its accepted REV-AUDIT02, were read in full. The pinned source
search found schemes, ring operations and categorical stack descent, but no
stable pointed-family/moduli, curve-relative Picard, Hodge-line or Torelli
declarations meeting the targets. A pseudofunctor IsStack predicate does not
provide an algebraic-stack atlas or properness theorem. Searches covered both
the declaration index and Mathlib/Tau Ceti source trees.

The upstream StableReduction and JacobianChallenge reader documents were read
in full for ownership and density. Supplier descriptions were read before use.
JacobianChallenge layerD covers a field Picard problem; relative abelian-scheme
duality does not supply a curve-family Jacobian. SF.5 covers intersection and
GRR, not a complete nef-vector-bundle or Deligne-pairing theory. C5 has a
good-prime level scope, not automatically an all-characteristic unlevel Torelli
extension. These boundaries appear as rescope proposals and gaps, rather than
as fictitious supplier theorems. The parent’s already planned curve cohomology,
infinitesimal automorphisms, family pushouts and contractions have no duplicate
nodes here.

### Additional inspected polynomial and module baseline

The following 19 declarations were read at Mathlib's fixed commit. They supply
the generic infrastructure; only their pointed polynomial applications are
planned as new nodes. The packet records exact modules, lines and git blobs.

- `mathlib:Polynomial.divByMonic`: Quotient in division by a monic polynomial.
- `mathlib:Polynomial.modByMonic`: Remainder in division by a monic polynomial.
- `mathlib:Polynomial.mapRingHom`: Coefficientwise mapping as a bundled polynomial ring homomorphism.
- `mathlib:Polynomial.evalRingHom`: Polynomial evaluation as a bundled ring homomorphism.
- `mathlib:Polynomial.Monic.isRegular`: A monic polynomial is a regular element over every ring.
- `mathlib:Matrix.mulVecLin`: Matrix-vector multiplication as a native linear map.
- `mathlib:Submodule.Quotient.mk`: Native projection to a quotient by a linear-map range.
- `mathlib:TensorProduct.lift`: Extends a bilinear map to the tensor product; pure-tensor evaluation specifies it.
- `mathlib:TensorProduct`: Native tensor product of modules over a commutative semiring.
- `mathlib:AdjoinRoot`: Native quotient A[X]/(F); no pointed-node theorem.
- `mathlib:AdjoinRoot.of`: Coefficient ring map into the native quotient.
- `mathlib:AdjoinRoot.root`: Class of the polynomial variable in the quotient.
- `mathlib:AdjoinRoot.lift`: Descends evaluation given its actual vanishing relation.
- `mathlib:AdjoinRoot.map`: Induced quotient ring map with the required divisibility condition.
- `mathlib:AdjoinRoot.map_comp_map`: Composition of the existing quotient coefficient maps.
- `mathlib:Module.Flat`: Actual coefficient-module flatness predicate, characterized by tensor injectivity.
- `mathlib:Module.Flat.of_retract`: A linear retract of a flat module is flat.
- `mathlib:Module.Flat.of_linearEquiv`: Transport of flatness through a linear equivalence.
- `mathlib:Module.Flat.of_free`: Free modules are flat.

## Declaration-level layers

Each declaration below gives its full planned mathematical statement, proof
outline and graph prerequisites. Definitions and constructions include the API
and tests a plausible wrong implementation would fail. Requests at a stage
boundary remain open; the final sections enumerate what closure still needs.

### MC.0. The pointed curve moduli problem

For every g,n≥0 with 2g−2+n>0 construct the groupoid-valued moduli pseudofunctor of smooth or stable ordered n-pointed genus-g curves over arbitrary schemes, using the parent’s curve-family objects. Establish base-change coherence and effective descent; keep isomorphism groupoids distinct from their sets of isomorphism classes. Construct the universal family with an arbitrary additional section, including sections at a node or coinciding with an existing mark.

**Status:** partial.

#### Moduli stacks of pointed curves

`StableReductionPartII:key/moduli-curves` — definition.

Define a single moduli pseudofunctor CurvesModuli(ε,g,n), ε=smooth or stable, on schemes. Its fibre over S is the groupoid of parent curve families f:C→S, proper flat finitely presented of pure relative dimension one, with geometrically connected fibres of arithmetic genus g and an ordered list of n disjoint sections through the relative smooth locus. In the stable flavour fibres are nodal and ω_{C/S}(Σsᵢ) is relatively ample; the smooth flavour is the full subcategory with f smooth. Arrows are marking-preserving S-isomorphisms; pullback is scheme-theoretic base change with its canonical associator. Write M_{g,n} and M̄_{g,n}. This is a groupoid-valued functor; no coarse or fine representability is built into its definition.

**Construction/proof.** (1) Use the parent’s stable-pointed and smooth-curve family data, without redefining stability. (2) Form the fibre groupoid using marking-preserving relative isomorphisms. (3) Use pullback universal properties to obtain coherent reindexing; the effective-descent assertion is a separate node.

**Dependencies:** `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `SchemeAndStackFoundations:SF.1`, `mathlib:AlgebraicGeometry.Scheme`.

**API.**

- `CurvesModuli.obj` (data): The fibre groupoid over S has precisely the parent smooth/stable pointed families as objects.
- `CurvesModuli.iso` (characterisation): Morphisms are exactly S-isomorphisms carrying every ordered marking to the marking of the same index.
- `CurvesModuli.pullback` (functoriality): For T→S pull back the family and every section; identity and composition agree via coherent canonical isomorphisms.
- `CurvesModuli.smoothInclusion` (projection): The smooth flavour is the full subcategory of the stable flavour on smooth families.
- `CurvesModuli.geometricPoints` (characterisation): Over an algebraically closed field the objects and automorphism groups are those of pointed curves, not only isomorphism classes.

**Discriminating tests.**

- `CurvesModuli.rationalThree` (computation): Over an algebraically closed field the smooth three-pointed rational curve has a unique isomorphism to (P¹;0,1,∞) and trivial automorphism group.
- `CurvesModuli.rationalTwoExcluded` (non-example): (P¹;0,∞) fails the stable-range condition and has a positive-dimensional automorphism group.
- `CurvesModuli.ellipticInvolution` (non-example): In characteristic zero a pointed elliptic curve (E,0) has the nontrivial automorphism [−1]; its fibre groupoid is not a discrete set.
- `CurvesModuli.selfNodeFlags` (compatibility): An irreducible rational nodal curve with one smooth marking is stable of arithmetic genus one: the normalization has three special flags.

**Uses.** KEYDEF-algebraicgeometry: algebraicgeometry/moduli-curves, six cited papers; PAPER-YUAN-26/69 and PAPER-DIMITROV-GAO-HABEGGER-21/10; PAPER-CANNING-LARSON-PAYNE-24/2; PAPER-CHEN-24/1; PAPER-LANDESMAN-LITT-24/9; PAPER-ABDURRAHMAN-VENKATESH-25/54.

**Acceptance:** The genus-zero stable range begins at n=3; a two-pointed rational curve is excluded. A self-node contributes two normalization flags to stability.

**Source:** knudsen2, Definitions1.1–1.2,pp.162–164.

#### Pullback coherence for pointed moduli

`StableReductionPartII:MC.0/pullback-coherence` — lemma.

The canonical isomorphisms (C×_S T)×_T U≅C×_S U and C×_S S≅C preserve all markings and satisfy the pentagon and unit identities, defining the moduli pseudofunctor on arbitrary schemes.

**Construction/proof.** (1) Use the unique morphisms supplied by pullback universal properties; their composites have equal projections, hence agree. (2) Import the parent’s base-change preservation of geometric genus, nodality, smooth sections and log-dualizing ampleness.

**Dependencies:** `StableReductionPartII:key/moduli-curves`, `SchemeAndStackFoundations:SF.0`.

**Acceptance:** Composition is coherent, not asserted definitionally equal.

**Source:** knudsen2, Definition1.2,p.164.

#### Effective descent of pointed stable curves

`StableReductionPartII:MC.0/effective-descent` — theorem.

CurvesModuli(ε,g,n) has effective fppf descent of objects and isomorphisms, hence is a stack; compare with Mathlib’s pseudofunctor IsStack predicate rather than asserting this predicate supplies an algebraic atlas.

**Construction/proof.** (1) Descend the relatively ample log-dualizing line with the family by polarized-scheme descent. (2) Descend the ordered sections and their disjoint smooth-locus condition. (3) Use the parent’s geometric-fibre and base-change characterizations to descend the fixed-genus and stability conditions.

**Dependencies:** `StableReductionPartII:MC.0/pullback-coherence`, `SchemeAndStackFoundations:SF.1`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `mathlib:CategoryTheory.Pseudofunctor.IsStack`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Acceptance:** Do not replace the fibre groupoid by isomorphism classes before descent.

**Source:** knudsen2, Definition1.2,p.164; §2.

#### The universal curve with an arbitrary extra section

`StableReductionPartII:MC.0/universal-curve` — construction.

Define Z̄_{g,n} over M̄_{g,n} by an object (C/S;s₁,…,sₙ;Δ), where Δ:S→C is an arbitrary additional section. It may hit a node or an old marking. For S→M̄_{g,n} classified by C/S, the fibre product S×_{M̄} Z̄ is canonically C. This representable proper flat nodal morphism is the universal curve; it is smooth over the smooth base only after restricting the total space to smooth fibres.

**Construction/proof.** (1) The groupoid of pairs (T→S, a section of C_T/T) is the representable fibre category of C. (2) Use its universal property to construct the canonical relative scheme and pullback square. (3) The smooth-universal family is the base change to M_{g,n}; the universal total stack can be smooth over Z even though its projection is nodal.

**Dependencies:** `StableReductionPartII:key/moduli-curves`, `StableReductionPartII:MC.0/pullback-coherence`, `SchemeAndStackFoundations:SF.1`.

**API.**

- `UniversalCurve.fiber` (universal-property): S×_{M̄} Z̄≅C for every classifying family C/S.
- `UniversalCurve.section` (projection): An S-object of Z̄ over C is an arbitrary section Δ of C/S.
- `UniversalCurve.baseChange` (functoriality): The representing isomorphism is natural in S and respects the pointed-family cocycle.

**Discriminating tests.**

- `UniversalCurve.nodeAllowed` (degenerate): An extra section at the node of an irreducible one-pointed rational genus-one stable curve is allowed.
- `UniversalCurve.collisionAllowed` (non-example): The extra section may equal s₁; imposing disjointness would give only an open part of the universal curve.
- `UniversalCurve.smoothFiber` (compatibility): Over a smooth curve over an algebraically closed field, the fibre is the whole smooth proper curve.

**Uses.** StableReductionPartII:MC.1/frame-torsor; StableReductionPartII:MC.2/expansion; StableReductionPartII:MC.3/cotangent-line; StableReductionPartII:MC.4/finite-projective-cover; StableReductionPartII:MC.5/hodge-bundle.

**Acceptance:** The universal projection is not a smooth morphism at a node.

**Source:** knudsen2, Definition1.2,p.164.

**To close this layer.**

- Resolve stable-family descent/type suppliers and supply Lean moduli-pseudofunctor signatures.
- Check literal Knudsen source excerpts and arbitrary-scheme approximation.


### MC.1. The unpointed Deligne–Mumford construction

For g≥2 construct the tricanonical Hilbert locus with polynomial (6t−1)(g−1), identify its projective-frame torsor and quotient stack, and prove representability, finiteness and unramifiedness of the diagonal. Import the parent’s infinitesimal automorphism vanishing and compute the obstruction space, algebraize versal deformations and obtain independent node-smoothing parameters. Deduce a smooth proper Deligne–Mumford stack over Z of relative dimension 3g−3 with relative normal-crossings boundary.

**Status:** partial.

#### Tricanonical Hilbert polynomial and frame rank

`StableReductionPartII:MC.1/tricanonical-cohomology` — application.

Apply the parent’s pluricanonical vanishing, very-ampleness and cohomology/base-change API to a stable genus-g curve, g≥2. Its tricanonical direct image has rank 5g−5, the embedding is into P^{5g−6}, its degree is 6g−6 and its Hilbert polynomial is (6t−1)(g−1). These are the numerical inputs to the Hilbert moduli construction, not a second development of the parent’s curve cohomology.

**Construction/proof.** (1) Import the parent’s m≥2 vanishing and m≥3 very-ampleness with arbitrary-base-change locally free direct images. (2) Compute the degree of ω³ from deg ω=2g−2 and its Hilbert polynomial and rank by the parent’s Riemann–Roch.

**Dependencies:** `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `AlgebraicModuliForArithmeticGeometry:R09.1`.

**Acceptance:** For m=3 the rank is 5g−5 and the projective dimension is 5g−6.

**Source:** dm, Theorem1.2 and corollary,pp.77–78.

#### The tricanonical Hilbert locus

`StableReductionPartII:MC.1/tricanonical-hilbert` — construction.

For g≥2 let U_g be the locally closed locus in Hilb(P^{5g−6}_Z) with Hilbert polynomial (6t−1)(g−1) whose universal fibres are stable connected genus-g curves and whose hyperplane sheaf is ω³ with the complete basis of global sections. Its universal family and projective-frame interpretation identify U_g with tricanonically framed stable families. The canonical-line condition is included, not merely the Hilbert polynomial.

**Construction/proof.** (1) Use the universal flat Hilbert family with the stated polynomial. (2) Cut out the stable open locus and the canonical-polarization/frame condition using relative line-bundle comparison and base change. (3) The representing functor includes projective frames, hence a PGL(5g−5)-action.

**Dependencies:** `StableReductionPartII:MC.1/tricanonical-cohomology`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`.

**API.**

- `TricanonicalHilbert.universal` (data): Pull back the universal embedded stable curve with O(1)≅ω³.
- `TricanonicalHilbert.frame` (characterisation): S-points identify with stable families equipped with a projective frame of f_*ω³.
- `TricanonicalHilbert.action` (structure): PGL(5g−5) acts by changing the projective frame and preserves the locus.

**Discriminating tests.**

- `TricanonicalHilbert.genusTwo` (computation): For g=2 the embedding is in P⁴, has degree6, and Hilbert polynomial6t−1.
- `TricanonicalHilbert.wrongPolarization` (non-example): The Hilbert polynomial alone does not impose the isomorphism O(1)≅ω³.
- `TricanonicalHilbert.pullback` (compatibility): A base change of a framed family corresponds to the base change of its point of U_g.

**Uses.** StableReductionPartII:MC.1/frame-torsor; StableReductionPartII:MC.4/finite-degree-equations.

**Acceptance:** A curve with the same Hilbert polynomial but the wrong polarization is excluded.

**Source:** dm, p.78, definition of H_g.

#### The projective-frame torsor

`StableReductionPartII:MC.1/frame-torsor` — theorem.

For a stable genus-g family C/S, g≥2, the fibre product S×_{M̄_g} U_g is the PGL(5g−5)-torsor of projective frames of P(f_*ω³); it is representable smooth and surjective over S.

**Construction/proof.** (1) Use the framed representing property and locally free base change. (2) Trivialize f_*ω³ locally; transitions are projective linear maps. (3) Import the smoothness of PGL over Z and descent of a torsor.

**Dependencies:** `StableReductionPartII:MC.1/tricanonical-hilbert`, `StableReductionPartII:MC.0/universal-curve`, `AlgebraicModuliForArithmeticGeometry:R09.4`.

**Acceptance:** The torsor need not have a global section.

**Source:** dm, Proposition5.1 proof,p.104.

#### Hilbert quotient presentation

`StableReductionPartII:MC.1/hilbert-quotient` — theorem.

For g≥2 the natural morphism [U_g/PGL(5g−5)]→M̄_g is an equivalence of stacks; it gives a finite-type smooth atlas and does not require a GIT coarse quotient.

**Construction/proof.** (1) An equivariant family descends through the projective-frame torsor by effective descent. (2) Every stable family acquires a frame locally; marking-free isomorphisms are exactly the descended arrows.

**Dependencies:** `StableReductionPartII:MC.1/frame-torsor`, `StableReductionPartII:MC.0/effective-descent`, `AlgebraicModuliForArithmeticGeometry:R09.4`.

**Acceptance:** Keep quotient stack and coarse quotient distinct.

**Source:** dm, Proposition5.1,p.104.

#### Representability of the Isom functor

`StableReductionPartII:MC.1/isom-representable` — theorem.

For two stable genus-g families g≥2 over S, Isom_S(C,D) is represented by a quasi-projective S-scheme of finite presentation, compatible with arbitrary base change; a marked Isom functor is its closed subfunctor imposing equality of each ordered section.

**Construction/proof.** (1) Apply polarized relative Isom representability to the canonical polarization. (2) For markings use the closed equalizers of their evaluations on the separated target family.

**Dependencies:** `StableReductionPartII:MC.1/tricanonical-cohomology`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `SchemeAndStackFoundations:SF.0`.

**Acceptance:** The representing object is not the set of geometric isomorphism classes.

**Source:** dm, Definition1.10 and paragraph after it,p.84.

#### Unramified Isom scheme

`StableReductionPartII:MC.1/isom-unramified` — theorem.

The stable-curve Isom scheme is unramified over its base, including in positive characteristic; its geometric tangent spaces at automorphisms vanish.

**Construction/proof.** (1) Identify first-order automorphisms with vector fields. (2) Use vanishing and the finite-presentation infinitesimal criterion for unramifiedness.

**Dependencies:** `StableReductionPartII:MC.1/isom-representable`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `SchemeAndStackFoundations:SF.0`.

**Acceptance:** No characteristic-zero assumption is used.

**Source:** dm, Theorem1.11 proof,p.84.

#### Properness of stable-curve Isom

`StableReductionPartII:MC.1/isom-proper` — theorem.

The stable-curve Isom scheme is proper over the base. For a trait any generic-fibre isomorphism between stable models extends uniquely; do not require the generic fibre to be smooth in the final theorem.

**Construction/proof.** (1) Use the parent’s uniqueness of stable models, with limit/descent to the required noetherian test setting. (2) Apply the scheme valuative criterion to the Isom scheme; the source’s smooth-generic test reduction requires the universal density argument, not an assumption on every trait.

**Dependencies:** `StableReductionPartII:MC.1/isom-representable`, `tauceti:TauCetiRoadmap/StableReduction#layer-8-canonical-contraction-and-unpointed-stable-reduction`, `tauceti:TauCetiRoadmap/StableReduction#layer-9-marked-stabilization-and-stable-pointed-reduction`, `SchemeAndStackFoundations:SF.0`.

**Acceptance:** The final Isom theorem includes singular generic stable curves.

**Source:** dm, Theorem1.11 and Lemma1.12,pp.84–85.

#### Finite unramified diagonal

`StableReductionPartII:MC.1/finite-unramified-diagonal` — theorem.

The diagonal of M̄_g, g≥2, is representable finite and unramified; hence the stack is separated Deligne–Mumford of finite type over Z.

**Construction/proof.** (1) Unramified finite presentation is quasi-finite; proper quasi-finite implies finite. (2) Identify diagonal fibres with the Isom schemes and apply the smooth-atlas/unramified-diagonal DM criterion.

**Dependencies:** `StableReductionPartII:MC.1/hilbert-quotient`, `StableReductionPartII:MC.1/isom-unramified`, `StableReductionPartII:MC.1/isom-proper`, `AlgebraicModuliForArithmeticGeometry:R09.4`, `SchemeAndStackFoundations:SF.0`.

**Acceptance:** Finite inertia follows; it does not imply a fine coarse moduli scheme.

**Source:** dm, Theorem1.11;Proposition5.1,p.104.

#### Vanishing of stable-curve obstruction space

`StableReductionPartII:MC.1/obstruction-vanishing` — theorem.

For a geometric nodal curve C, Ext²(Ω_C,O_C)=0. The local-to-global map Ext¹(Ω_C,O_C)→⊕_nodes Ext¹_{O_C,x}(Ω_C,x,O_C,x) is surjective.

**Construction/proof.** (1) Use the lci nodal two-term resolution and local Ext sheaves supported at finitely many nodes. (2) Apply the local-to-global Ext spectral sequence and H²=0 on curves; H¹ of a finite-support sheaf vanishes.

**Dependencies:** `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `AlgebraicModuliForArithmeticGeometry:R09.6`.

**Acceptance:** Obstructions vanish, while one independent smoothing parameter remains per node.

**Source:** dm, Lemma1.3 and Proposition1.5,pp.79–82.

#### Independent node-smoothing parameters

`StableReductionPartII:MC.1/versal-node-parameters` — theorem.

For a geometric stable genus-g curve g≥2 with r nodes, a versal deformation over the complete unramified coefficient ring has formally smooth base with 3g−3 variables and local node equations uv=tᵢ for r distinct parameters; the framed base has an additional dim PGL(5g−5) smooth factor. The parameters are chart-local and may be permuted by stabilizers.

**Construction/proof.** (1) The local node deformation has one smoothing coordinate per node. (2) Surjectivity of the global-to-local tangent map and obstruction vanishing give a smooth lifting map. (3) Use the parent’s curve Riemann–Roch dimension and formal algebraization with ample ω³.

**Dependencies:** `StableReductionPartII:MC.1/obstruction-vanishing`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `StableReductionPartII:MC.1/tricanonical-cohomology`, `AlgebraicModuliForArithmeticGeometry:R09.6`.

**Acceptance:** An automorphism can permute node parameters; no globally chosen ordering of nodes is asserted.

**Source:** dm, Proposition1.5 and Theorem1.6,pp.81–83.

#### Smooth moduli of dimension 3g−3

`StableReductionPartII:MC.1/smooth-dimension` — theorem.

For g≥2, M̄_g→Spec Z is smooth of relative dimension 3g−3, and M_g is its dense open substack of smooth curves.

**Construction/proof.** (1) Translate the versal smooth formal rings to atlas smoothness by the finite-presentation formal criterion. (2) Smooth fibres correspond to all tᵢ≠0, a dense open in every versal chart.

**Dependencies:** `StableReductionPartII:MC.1/finite-unramified-diagonal`, `StableReductionPartII:MC.1/versal-node-parameters`, `AlgebraicModuliForArithmeticGeometry:R09.6`.

**Acceptance:** The total universal curve is smooth over Z, while its projection to moduli is nodal.

**Source:** dm, Corollary1.7;Theorem5.2,pp.83,104–105.

#### Relative normal-crossings boundary

`StableReductionPartII:MC.1/normal-crossing-boundary` — theorem.

For g≥2 the boundary Δ=M̄_g minus M_g is an effective Cartier divisor with relative normal crossings over Z: on an étale local regular chart its equation is a unit times ∏_{i=1}^r tᵢ. Its global irreducible components need not be smooth and the divisor need not have simple normal crossings.

**Construction/proof.** (1) In the node charts the family is singular exactly when one of the smoothing parameters vanishes. (2) Use the independent parameters to prove the relative Cartier and normal-crossings condition étale locally.

**Dependencies:** `StableReductionPartII:MC.1/smooth-dimension`, `StableReductionPartII:MC.1/versal-node-parameters`, `SchemeAndStackFoundations:SF.0`.

**Acceptance:** Two nonseparating nodes can give two branches of Δ₀ through one point.

**Source:** dm, Definition1.8;Corollary1.9;Theorem5.2,pp.83,104–105.

#### Properness from stable reduction

`StableReductionPartII:MC.1/proper-moduli` — theorem.

For g≥2 M̄_g→Spec Z is proper as a morphism of algebraic stacks. The existence test permits a finite extension of the trait fraction field; the separatedness test uses unique isomorphism extension.

**Construction/proof.** (1) Import the parent’s stable-reduction existence over a finite DVR extension and uniqueness. (2) Apply the stack valuative criterion with extension allowed; ordinary scheme IsProper is not a replacement for this criterion.

**Dependencies:** `StableReductionPartII:MC.1/finite-unramified-diagonal`, `tauceti:TauCetiRoadmap/StableReduction#layer-8-canonical-contraction-and-unpointed-stable-reduction`, `AlgebraicModuliForArithmeticGeometry:R09.4`.

**Acceptance:** A family can require a finite ramified extension to acquire a stable model.

**Source:** dm, Theorem5.2 proof and criterion4.19,pp.103–105.

**To close this layer.**

- Read the stack valuative and algebraization arguments in DM §§2–4 at full depth.
- Resolve Hilbert/Isom/deformation suppliers and separate each nonroutine formal-to-algebraic criterion.


### MC.2. Universal curves and the full pointed stable range

Identify the universal stable curve over the (g,n)-stack with the (g,n+1)-stack by contraction and expansion, including collision and node charts. Prove the inverse comparison and arbitrary-base-change compatibility. Establish the genus-zero base (0,3), the genus-one base (1,1), and the resulting smooth proper Deligne–Mumford theorem of relative dimension 3g−3+n for every stable pair. Compute M₀,₃, M₀,₄ and its compactification and the unstable rational-tail contraction.

**Status:** partial.

#### The binary quadratic node form

`StableReductionPartII:MC.2/binary-node-form` — definition.

For a commutative ring A and γ,δ∈A define q_{γ,δ}(x,y)=x²+γxy+δy². Its nondegeneracy condition is that γ²−4δ is a unit. Over a field this describes a possibly nonsplit ordinary double point, including characteristic two. The definition is the polynomial form; the discriminant condition is an explicit hypothesis, not an arbitrary predicate field.

**Construction/proof.** (1) Construct the polynomial and its evaluation using the existing ring operations. (2) Use the determinant of its derivative coefficient matrix for the discriminant; the lifting lemma is a separate node.

**Dependencies:** `mathlib:CommRing`, `mathlib:RingHom`, `mathlib:IsUnit`.

**API.**

- `NodeForm.eval` (simp): q(x,y)=x²+γxy+δy².
- `NodeForm.map` (functoriality): For a ring map φ, φ(q(x,y))=q_{φγ,φδ}(φx,φy).
- `NodeForm.linearCorrection` (relation): For ε²=0 and f=(γ²−4δ)(xu+yv), the explicit coordinate changes μ=−2δu+γv and ν=γu−2v give q(x+εμ,y+εν)=q(x,y)+εf. This ring identity specializes to formal power series; expressing a zero-constant series as xu+yv is the separate algebraic input.

**Discriminating tests.**

- `NodeForm.split` (computation): q_{0,−1}(x,y)=x²−y²; this is nondegenerate when2 is invertible.
- `NodeForm.characteristicTwo` (computation): Over a characteristic-two field q_{1,0}=x²+xy has unit discriminant1 and two distinct branches.
- `NodeForm.doubleLineExcluded` (non-example): q_{0,0}=x² has discriminant0 and is excluded from the nondegenerate node hypothesis.

**Uses.** StableReductionPartII:MC.2/small-extension-coordinate-correction: Let A be a commutative ring, ε²=0, and d=γ²−4δ a unit. Every zero-constant-term series f=d(xu+yv) admits μ=−2δu+γv and ν=γu−2v such that q(x+εμ,y+εν)=q(x,y)+εf. The identity works also in characteristic two.; StableReductionPartII:MC.2/pointed-node-normal-form: Let Λ be complete noetherian local with residue field k and let q over k have unit discriminant. The pointed node k[[x,y]]/(q), with x,y↦0, has a formally versal hull A_pd=Λ[[s,t]] and R_pd=A_pd[[x,y]]/(q̃(x,y)−q̃(s,t)), with section x↦s,y↦t. The tangent map is an isomorphism k²→k². This is a hull, not a claim that the deformation groupoid is represented by a fine scheme.; StableReductionPartII:MC.2/node-matrix-factorization: For a commutative ring A and γ,δ,x,y,s,t∈A define Φ=((δy+δt+γx,x+s+γt);(−(x−s),y−t)) and Ψ=((y−t,−(x+s+γt));(x−s,δy+δt+γx)). These explicit matrices constitute the special node-section factorization; their polynomial product relation and the noetherian nodal exactness theorem are separate nodes. No unit-discriminant hypothesis is needed to form the matrices.; StableReductionPartII:MC.2/node-factorization-products: For a commutative ring A and arbitrary γ,δ,x,y,s,t∈A, the displayed Φ and Ψ satisfy ΦΨ=ΨΦ=(q(x,y)−q(s,t))I₂. This polynomial identity needs neither noetherianity nor the unit-discriminant hypothesis.; StableReductionPartII:MC.2/node-factorization-exact: Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). In this actual quotient the alternating Φ,Ψ complex and its transpose are exact: ker Φ=im Ψ, ker Ψ=im Φ, ker Φᵀ=im Ψᵀ and ker Ψᵀ=im Φᵀ. Cokernel identifications are the two separate construction nodes.

**Acceptance:** No division by2 is used.

**Source:** knudsen2012, Definition1.1,pp.4–5.

#### Coordinate correction over a small extension

`StableReductionPartII:MC.2/small-extension-coordinate-correction` — theorem.

Let A be a commutative ring, ε²=0, and d=γ²−4δ a unit. Every zero-constant-term series f=d(xu+yv) admits μ=−2δu+γv and ν=γu−2v such that q(x+εμ,y+εν)=q(x,y)+εf. The identity works also in characteristic two.

**Construction/proof.** (1) Expand the two squares and the cross term. (2) Terms with ε² vanish; the remaining coefficient is d(xu+yv).

**Dependencies:** `StableReductionPartII:MC.2/binary-node-form`.

**Acceptance:** Whenγ=1 and char2 the formulas still give the required correction.

**Source:** knudsen2012, Lemma2.6 and proof,pp.8–9.

#### Normal form of a pointed nodal deformation

`StableReductionPartII:MC.2/pointed-node-normal-form` — theorem.

Let Λ be complete noetherian local with residue field k and let q over k have unit discriminant. The pointed node k[[x,y]]/(q), with x,y↦0, has a formally versal hull A_pd=Λ[[s,t]] and R_pd=A_pd[[x,y]]/(q̃(x,y)−q̃(s,t)), with section x↦s,y↦t. The tangent map is an isomorphism k²→k². This is a hull, not a claim that the deformation groupoid is represented by a fine scheme.

**Construction/proof.** (1) Use power-series division by a monic quadratic to express each element uniquely as f(y)+xg(y); flatness of noetherian formal power-series rings gives flatness of R_pd. (2) Lift pointed coordinates across a small extension and use coordinate correction to remove the error. (3) Use flatness and nilpotent Nakayama to show that the resulting surjective map has zero kernel. (4) Compute the tangent pair from the images of x,y under the section.

**Dependencies:** `StableReductionPartII:MC.2/binary-node-form`, `StableReductionPartII:MC.2/small-extension-coordinate-correction`, `AlgebraicModuliForArithmeticGeometry:R09.6`.

**Acceptance:** Do not assert absence of automorphisms in the pointed-node deformation groupoid.

**Source:** knudsen2012, Proposition2.1 and Lemmas2.5,2.7–2.9,pp.6–10.

#### The node-section matrix factorization

`StableReductionPartII:MC.2/node-matrix-factorization` — construction.

For a commutative ring A and γ,δ,x,y,s,t∈A define Φ=((δy+δt+γx,x+s+γt);(−(x−s),y−t)) and Ψ=((y−t,−(x+s+γt));(x−s,δy+δt+γx)). These explicit matrices constitute the special node-section factorization; their polynomial product relation and the noetherian nodal exactness theorem are separate nodes. No unit-discriminant hypothesis is needed to form the matrices.

**Construction/proof.** (1) Use the pinned Matrix.of to form the two matrices from their four entries. (2) The product relation and exactness are separate applications; forming the two matrices does not depend on those proofs.

**Dependencies:** `StableReductionPartII:MC.2/binary-node-form`, `mathlib:Matrix`, `mathlib:Matrix.of`, `mathlib:Matrix.scalar`.

**API.**

- `NodeSectionFactorization.left` (projection): The left matrix is Φ with the stated entries.
- `NodeSectionFactorization.right` (projection): The right matrix is Ψ with the stated entries.
- `NodeSectionFactorization.products` (relation): ΦΨ=ΨΦ=(q(x,y)−q(s,t))I₂.
- `NodeSectionFactorization.PolynomialModel.cokernels` (characterisation): In the actual polynomial quotient the right cokernel is J via [z]↦cz₀−dz₁; the left cokernel is the actual R-linear dual via [z]↦z₀incl−z₁ε.

**Discriminating tests.**

- `NodeSectionFactorization.atOrigin` (computation): At s=t=0 the left matrix has entries (δy+γx,x;−x,y), the explicit specialization used for the node ideal.
- `NodeSectionFactorization.characteristicTwo` (compatibility): The same product identities hold when2=0 andγ=1.
- `NodeSectionFactorization.repeatedRootExcluded` (non-example): The geometric node conclusions require unit discriminant; the raw matrix product identity alone does not exclude a double line.

**Uses.** StableReductionPartII:MC.2/node-factorization-products: For a commutative ring A and arbitrary γ,δ,x,y,s,t∈A, the displayed Φ and Ψ satisfy ΦΨ=ΨΦ=(q(x,y)−q(s,t))I₂. This polynomial identity needs neither noetherianity nor the unit-discriminant hypothesis.; StableReductionPartII:MC.2/node-factorization-exact: Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). In this actual quotient the alternating Φ,Ψ complex and its transpose are exact: ker Φ=im Ψ, ker Ψ=im Φ, ker Φᵀ=im Ψᵀ and ker Ψᵀ=im Φᵀ. Cokernel identifications are the two separate construction nodes.

**Acceptance:** The general Eisenbud regular-local MCM equivalence is not needed.

**Source:** knudsen2012, §3,pp.11–12.

#### Products of the explicit node matrices

`StableReductionPartII:MC.2/node-factorization-products` — theorem.

For a commutative ring A and arbitrary γ,δ,x,y,s,t∈A, the displayed Φ and Ψ satisfy ΦΨ=ΨΦ=(q(x,y)−q(s,t))I₂. This polynomial identity needs neither noetherianity nor the unit-discriminant hypothesis.

**Construction/proof.** (1) Compute the two off-diagonal entries as zero. (2) Each diagonal entry is δ(y²−t²)+γx(y−t)+(x+s+γt)(x−s)=q(x,y)−q(s,t).

**Dependencies:** `StableReductionPartII:MC.2/binary-node-form`, `StableReductionPartII:MC.2/node-matrix-factorization`, `mathlib:Matrix.mul_apply`.

**Acceptance:** The identity specializes in characteristic two.

**Source:** knudsen2012, §3,pp.11–12.

#### Exactness of the node-section complex

`StableReductionPartII:MC.2/node-factorization-exact` — theorem.

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). In this actual quotient the alternating Φ,Ψ complex and its transpose are exact: ker Φ=im Ψ, ker Ψ=im Φ, ker Φᵀ=im Ψᵀ and ker Ψᵀ=im Φᵀ. Cokernel identifications are the two separate construction nodes.

**Hypotheses:** A is any commutative ring; γ,δ,s,t∈A. The proof uses regular F before quotienting, not regularity of A.

**Construction/proof.** (1) Lift a vector killed by Φ to B², write Φz̃=Fw, multiply by Ψ and cancel F coordinatewise. Reduce modulo F. (2) Interchange the matrices for the second equality. (3) Their transposes also factor FI₂; repeat the same argument for the dual complex.

**Dependencies:** `StableReductionPartII:MC.2/node-matrix-factorization`, `StableReductionPartII:MC.2/node-factorization-products`, `StableReductionPartII:MC.2/polynomial-relation-regular`, `mathlib:Matrix.mulVecLin`.

**Discriminating tests.**

- `NodeSectionFactorization.PolynomialModel.quotientCharacteristicTwo` (compatibility): In A[u,v]/(u²+uv), characteristic two does not affect ker Φ=im Ψ.
- `NodeSectionFactorization.PolynomialModel.receivingRingNotExact` (non-example): Over Z with γ=1,δ=0 and all coordinates zero, both matrices are zero but kernel is Z² and image is zero.

**Acceptance:** The conclusion does not hold for arbitrary specialized coordinate values in another ring. No general MCM/matrix-factorization equivalence is reproved.

**Source:** knudsen2012, Proposition3.1 and proof,pp.11–12.

#### Polynomial-model convention

The following declarations use A[Y][X]/(F), with F monic in X. They
are special applications of existing polynomial and linear algebra. General
matrix-factorization and MCM theory remains with StablePeriodicCurved, layer7.
All coefficient images are written with ι in the convention below; abbreviated
products a,b,c,d always live in the actual quotient. Monic division proves the
stronger arbitrary-ring range, including zero rings and degenerate quadratic
forms. The geometric unit-discriminant condition is still required for nodality.
The published Proposition3.1 assumes noetherianity and unit discriminant; the
range extension here is the explicit elementary derivation, not a quotation.

#### Polynomial ring of a pointed section

`StableReductionPartII:MC.2/polynomial-node-model` — construction.

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). Construct these as native polynomial quotient, ideal and linear-map modules; the section evaluation ev:R→A sends u to s and v to t.

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) Use the nested polynomial A[Y][X] and the existing quotient AdjoinRoot F. (2) Evaluation at (s,t) kills F, so its ring map descends. (3) Take the two-generator ideal and its actual R-linear dual.

**Dependencies:** `StableReductionPartII:MC.2/binary-node-form`, `mathlib:AdjoinRoot`, `mathlib:AdjoinRoot.of`, `mathlib:AdjoinRoot.root`, `mathlib:AdjoinRoot.lift`, `mathlib:Polynomial.evalRingHom`.

**API.**

- `NodeSectionFactorization.PolynomialModel.polynomial` (data): F=X²+γYX+δY²−q(s,t) in A[Y][X].
- `NodeSectionFactorization.PolynomialModel.coefficientHom` (functoriality): ι is the composite of the two coefficient inclusions and the quotient map.
- `NodeSectionFactorization.PolynomialModel.sectionEval` (projection): ev(u)=s, ev(v)=t, ev(ιz)=z.
- `NodeSectionFactorization.PolynomialModel.sectionIdeal` (data): J is Ideal.span {u−ιs,v−ιt}; sectionDual is J→ₗ[R]R.

**Discriminating tests.**

- `NodeSectionFactorization.PolynomialModel.modelRelation` (computation): q(u,v)=ι(q(s,t)).
- `NodeSectionFactorization.PolynomialModel.modelZero` (degenerate): If A is the zero ring then R, J and D are subsingleton.
- `NodeSectionFactorization.PolynomialModel.evaluationCoordinates` (compatibility): Native AdjoinRoot.lift evaluates u,v and coefficients to s,t and the original coefficient.

**Uses.** StableReductionPartII:MC.2/dual-section-ideal: Provides the explicit polynomial-model calculation used before the separately open completed-local and sheaf descent steps.; StableReductionPartII:MC.2/node-factorization-exact: Exposes the concrete quotient, regular coordinate and actual module maps; not an arbitrary receiving ring.

**Acceptance:** The section can meet the singular point; no smoothness or invertibility of J is assumed.

**Source:** knudsen2012, §3, printed pp.11–12: monic division, κ/λ comparisons and proof of Proposition3.1.

#### Regularity of the monic relation

`StableReductionPartII:MC.2/polynomial-relation-regular` — lemma.

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). Multiplication by F on A[Y][X] is injective.

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) For nonzero A, F is monic of degree two in X; the top nonzero coefficient of a product survives. (2) If A is the zero ring the domain is a singleton.

**Dependencies:** `StableReductionPartII:MC.2/polynomial-node-model`, `mathlib:Polynomial.Monic.isRegular`.

**Acceptance:** Do not deduce this from unit discriminant after specializing coordinates to a receiving ring.

**Source:** knudsen2012, §3, printed pp.11–12: monic division, κ/λ comparisons and proof of Proposition3.1.

#### Monic normal form in the section ring

`StableReductionPartII:MC.2/polynomial-normal-form` — lemma.

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). For every r∈R there is a unique pair (p,q₁)∈A[Y]² with r=p(v)+u q₁(v). Thus R is free over A[Y] with basis (1,u), and free over A by the monomials vⁿ,u vⁿ.

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) Divide a representative by the monic quadratic F in X. (2) The remainder has X-degree less than two, giving the pair. (3) A difference of two such representatives divisible by F must vanish by degree, or is zero in the zero-ring case.

**Dependencies:** `StableReductionPartII:MC.2/polynomial-node-model`, `mathlib:Polynomial.divByMonic`, `mathlib:Polynomial.modByMonic`.

**Acceptance:** No relation truncating powers of v is introduced.

**Source:** knudsen2012, §3, printed pp.11–12: monic division, κ/λ comparisons and proof of Proposition3.1.

#### Regularity of the second section coordinate

`StableReductionPartII:MC.2/section-coordinate-regular` — lemma.

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). Multiplication by d=v−ιt on R is injective.

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) In the unique two-coefficient form, multiplication by d multiplies each coefficient polynomial by Y−t. (2) Cancel the monic Y−t separately on both coefficient polynomials.

**Dependencies:** `StableReductionPartII:MC.2/polynomial-normal-form`, `mathlib:Polynomial.Monic.isRegular`.

**Acceptance:** A can have zero divisors; d is not chosen to be invertible.

**Source:** knudsen2012, §3, printed pp.11–12: monic division, κ/λ comparisons and proof of Proposition3.1.

#### Kernel of section evaluation

`StableReductionPartII:MC.2/section-evaluation-kernel` — lemma.

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). ev∘ι=id_A, ker(ev)=J, and 0→J→R→A→0 splits A-linearly by ι.

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) For r=p(v)+u q₁(v), subtract ι(p(t)+s q₁(t)). (2) Divide p(Y)−p(t) and q₁(Y)−q₁(t) by Y−t; the difference is d times a polynomial expression plus c·ι(q₁(t)). (3) Both generators evaluate to zero; ev∘ι=id gives the splitting.

**Dependencies:** `StableReductionPartII:MC.2/polynomial-normal-form`, `StableReductionPartII:MC.2/polynomial-node-model`.

**Acceptance:** The splitting is A-linear; the section map ι is not R-linear for the evaluation action on A.

**Source:** knudsen2012, §3, printed pp.11–12: monic division, κ/λ comparisons and proof of Proposition3.1.

#### Cokernel presentation of the section ideal

`StableReductionPartII:MC.2/section-ideal-cokernel` — construction.

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). For Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), construct eJ:coker Ψ≃ₗ[R]J with eJ([z₀,z₁])=c z₀−d z₁.

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) κ=((0,−1),(−d,b)) is injective since det κ=−d. (2) κΦ=((c,−d),(0,0)); exactness identifies coker Ψ with im Φ. (3) Projection to the first coordinate gives precisely the displayed ideal and map.

**Dependencies:** `StableReductionPartII:MC.2/node-factorization-exact`, `StableReductionPartII:MC.2/section-coordinate-regular`, `mathlib:Submodule.Quotient.mk`, `mathlib:Matrix.mulVecLin`.

**API.**

- `NodeSectionFactorization.PolynomialModel.cokernelIdeal` (characterisation): The R-linear equivalence is specified by [z]↦c z₀−d z₁.
- `NodeSectionFactorization.PolynomialModel.cokernelIdealGenerators` (simp): The classes of (1,0),(0,1) map to c,−d.
- `NodeSectionFactorization.PolynomialModel.cokernelIdealUnique` (extensionality): Any two linear equivalences with the displayed quotient formula agree.

**Discriminating tests.**

- `NodeSectionFactorization.PolynomialModel.idealCokernelFirst` (computation): [1,0] maps to c.
- `NodeSectionFactorization.PolynomialModel.idealCokernelSecond` (computation): [0,1] maps to −d, retaining the sign outside characteristic two.
- `NodeSectionFactorization.PolynomialModel.idealCokernelZero` (degenerate): The zero vector maps to the zero ideal element.

**Uses.** StableReductionPartII:MC.2/dual-section-ideal: Provides the explicit polynomial-model calculation used before the separately open completed-local and sheaf descent steps.; StableReductionPartII:MC.2/node-factorization-exact: Exposes the concrete quotient, regular coordinate and actual module maps; not an arbitrary receiving ring.

**Acceptance:** The RIGHT matrix has cokernel J.

**Source:** knudsen2012, §3, printed pp.11–12: monic division, κ/λ comparisons and proof of Proposition3.1.

#### Denominator-free dual generator

`StableReductionPartII:MC.2/section-dual-generator` — construction.

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). There is a unique ε∈D with d ε(j)=b j for every j∈J. Its generator values are ε(c)=−a and ε(d)=b.

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) For j=cx+dy set ε(j)=−ax+by. (2) If cx+dy=0, multiply by b and use bc=−ad to obtain d(−ax+by)=0; cancel d. (3) This defines an R-linear map and its two values. Multiplication by regular d proves uniqueness.

**Dependencies:** `StableReductionPartII:MC.2/section-coordinate-regular`, `StableReductionPartII:MC.2/node-factorization-products`, `StableReductionPartII:MC.2/polynomial-node-model`.

**API.**

- `NodeSectionFactorization.PolynomialModel.dualGenerator_existsUnique` (characterisation): Exactly one actual R-linear map satisfies d ε(j)=b j.
- `NodeSectionFactorization.PolynomialModel.dualGeneratorValues` (simp): ε(c)=−a and ε(d)=b.
- `NodeSectionFactorization.PolynomialModel.dualGeneratorUnique` (extensionality): Two R-linear maps with the denominator-free characterization are equal.

**Discriminating tests.**

- `NodeSectionFactorization.PolynomialModel.dualZeroBase` (degenerate): For a zero coefficient ring D and R×A are subsingleton.
- `NodeSectionFactorization.PolynomialModel.dualSignThree` (computation): In F₃[u,v]/(u²+uv), ε(u)=−u, ε(v)=u and u≠−u.
- `NodeSectionFactorization.PolynomialModel.dualGeneratorSecond` (compatibility): For every A and all coefficients the value on d is b, including A with zero divisors.

**Uses.** StableReductionPartII:MC.2/dual-section-ideal: Provides the explicit polynomial-model calculation used before the separately open completed-local and sheaf descent steps.; StableReductionPartII:MC.2/node-factorization-exact: Exposes the concrete quotient, regular coordinate and actual module maps; not an arbitrary receiving ring.

**Acceptance:** The notation b/d is explanatory only; no inverse or localization surrogate is used.

**Source:** knudsen2012, §3, printed pp.11–12: monic division, κ/λ comparisons and proof of Proposition3.1.

#### Normal form in the actual section dual

`StableReductionPartII:MC.2/section-dual-normal-form` — lemma.

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). With the characterized ε, every h∈D has a unique expression h=r·incl+ια·ε with (r,α)∈R×A.

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) Use the proved existence pair for every ideal input. (2) For two pairs evaluate at the actual generator d; the characterization of ε and regularity give ε(d)=b. Apply the separate coordinate-uniqueness lemma.

**Dependencies:** `StableReductionPartII:MC.2/section-dual-normal-existence`, `StableReductionPartII:MC.2/section-dual-coordinate-uniqueness`, `StableReductionPartII:MC.2/section-dual-generator`, `StableReductionPartII:MC.2/section-coordinate-regular`.

**Acceptance:** The second coordinate lies in A, not a second independent copy of R.

**Source:** knudsen2012, §3, printed pp.11–12: monic division, κ/λ comparisons and proof of Proposition3.1.


#### Coefficient-linear normal coordinates of the dual

`StableReductionPartII:MC.2/section-dual-normal-equivalence` — construction.

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). Construct the A-linear equivalence D≃ₗ[A]R×A whose inverse sends (r,α) to j↦rj+ια ε(j).

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) Construct the actual A-linear map (r,α)↦m(r)+α·ε. Native scalar restriction supplies A-linearity of the first summand. (2) Normal-form uniqueness gives injectivity and existence gives surjectivity. Apply the pinned bijective-linear-map equivalence and take its inverse. (3) The inverse formula is its actual pointwise value, rather than an assumed model of the dual.

**Dependencies:** `StableReductionPartII:MC.2/section-dual-normal-form`, `StableReductionPartII:MC.2/section-dual-multiplication`, `mathlib:LinearMap.map_smul_of_tower`, `mathlib:LinearEquiv.ofBijective`.

**API.**

- `NodeSectionFactorization.PolynomialModel.dualNormalEquiv` (characterisation): The inverse evaluates as rj+ιαε(j).
- `NodeSectionFactorization.PolynomialModel.dualNormalEquivInclusion` (simp): The inclusion j↦j has coordinates (1,0).
- `NodeSectionFactorization.PolynomialModel.dualNormalEquivGenerator` (simp): The dual generator ε has coordinates (0,1).

**Discriminating tests.**

- `NodeSectionFactorization.PolynomialModel.normalInclusion` (computation): The coordinates of inclusion are (1,0).
- `NodeSectionFactorization.PolynomialModel.normalGenerator` (computation): The coordinates of ε are (0,1).
- `NodeSectionFactorization.PolynomialModel.normalRoundTrip` (compatibility): Applying the equivalence after its inverse fixes every pair (r,α).
- `NodeSectionFactorization.PolynomialModel.normalInclusionCanonical` (computation): An actually constructed normal equivalence sends the actual map m(1) to (1,0).
- `NodeSectionFactorization.PolynomialModel.normalGeneratorNonreduced` (computation): Over Z/4Z with γ=δ=s=t=0, an actually constructed normal equivalence sends the canonical native ε to (0,1).
- `NodeSectionFactorization.PolynomialModel.normalRoundTripCanonical` (compatibility): An actually constructed equivalence satisfies every pair round trip and the prescribed pointwise inverse formula.

**Uses.** StableReductionPartII:MC.2/dual-section-ideal: Provides the explicit polynomial-model calculation used before the separately open completed-local and sheaf descent steps.; StableReductionPartII:MC.2/node-factorization-exact: Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). In this actual quotient the alternating Φ,Ψ complex and its transpose are exact: ker Φ=im Ψ, ker Ψ=im Φ, ker Φᵀ=im Ψᵀ and ker Ψᵀ=im Φᵀ. Cokernel identifications are the two separate construction nodes.

**Acceptance:** This equivalence is not R-linear for the componentwise action.

**Source:** knudsen2012, §3, printed pp.11–12: monic division, κ/λ comparisons and proof of Proposition3.1.


#### Cokernel presentation of the section dual

`StableReductionPartII:MC.2/section-dual-cokernel` — construction.

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). Construct eD:coker Φ≃ₗ[R]D with d eD([z₀,z₁])(j)=(d z₀−b z₁)j; equivalently [z]↦z₀ incl−z₁ ε.

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) λ=((1,0),(−c,d)) is injective, and λΨ=((d,−b),(0,0)). (2) Exactness gives coker Φ≅(d,b). (3) The calculation Ann(c)=(b) modulo d identifies this ideal divided by d with the actual Hom_R(J,R).

**Dependencies:** `StableReductionPartII:MC.2/node-factorization-exact`, `StableReductionPartII:MC.2/section-dual-normal-form`, `StableReductionPartII:MC.2/section-coordinate-regular`, `mathlib:Submodule.Quotient.mk`, `mathlib:Matrix.mulVecLin`.

**API.**

- `NodeSectionFactorization.PolynomialModel.cokernelDual` (characterisation): The denominator-free evaluation formula specifies the equivalence.
- `NodeSectionFactorization.PolynomialModel.cokernelDualGenerators` (simp): [1,0] acts as inclusion and [0,1] as −ε.
- `NodeSectionFactorization.PolynomialModel.cokernelDualUnique` (extensionality): Two equivalences with the displayed evaluation formula agree by regularity of d.

**Discriminating tests.**

- `NodeSectionFactorization.PolynomialModel.dualCokernelFirst` (computation): [1,0] evaluates on d to d.
- `NodeSectionFactorization.PolynomialModel.dualCokernelSecond` (computation): [0,1] evaluates on d to −b.
- `NodeSectionFactorization.PolynomialModel.dualCokernelZero` (degenerate): The zero class evaluates to zero on every j.

**Uses.** StableReductionPartII:MC.2/dual-section-ideal: Provides the explicit polynomial-model calculation used before the separately open completed-local and sheaf descent steps.; StableReductionPartII:MC.2/node-factorization-exact: Exposes the concrete quotient, regular coordinate and actual module maps; not an arbitrary receiving ring.

**Acceptance:** The LEFT matrix has cokernel D; its second basis class represents −ε.

**Source:** knudsen2012, §3, printed pp.11–12: monic division, κ/λ comparisons and proof of Proposition3.1.

#### Residue of the section dual

`StableReductionPartII:MC.2/section-dual-residue` — construction.

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). Construct the A-linear residue ρ:D→A as the second normal coordinate. It is surjective, ρ(ε)=1, and ker ρ is exactly the image of injective multiplication R→D. Furthermore ρ(zh)=ev(z)ρ(h). Hence D/R≅A with the section action.

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) Compose the checked normal equivalence with the native A-linear second projection. The pairs (0,α) prove surjectivity and ε has pair (0,1). (2) The inverse formula identifies zero residue exactly with maps j↦rj. The separate actual multiplication construction is injective by regularity of d. (3) Apply the independently derived correction/scalar-action formula to identify ρ(zh)=ev(z)ρ(h). (4) For nonzero A, a purported R-linear splitting has dσ(1)=σ(ev(d))=σ(0)=0. Pointwise regularity forces σ(1)=0, contradicting its right inverse property.

**Dependencies:** `StableReductionPartII:MC.2/section-dual-normal-equivalence`, `StableReductionPartII:MC.2/section-dual-scalar-action`, `StableReductionPartII:MC.2/section-dual-correction-formula`, `StableReductionPartII:MC.2/section-dual-multiplication`, `StableReductionPartII:MC.2/section-coordinate-regular`, `StableReductionPartII:MC.2/section-evaluation-kernel`, `mathlib:LinearMap.snd`.

**API.**

- `NodeSectionFactorization.PolynomialModel.dualResidue` (characterisation): ρ is surjective with the specified kernel and section action.
- `NodeSectionFactorization.PolynomialModel.dualResidueGenerator` (simp): Every characterized residue sends ε to 1.
- `NodeSectionFactorization.PolynomialModel.dualResidueInclusion` (simp): Every characterized residue kills multiplication maps j↦rj.
- `NodeSectionFactorization.PolynomialModel.dualMultiplication` (constructor): The R-linear map m:R→D sends r to (j↦rj); its range is the submodule in the actual dual quotient.
- `NodeSectionFactorization.PolynomialModel.dualMultiplicationApply` (simp): m(r)(j)=rj.

**Discriminating tests.**

- `NodeSectionFactorization.PolynomialModel.residueGenerator` (computation): ρ(ε)=1.
- `NodeSectionFactorization.PolynomialModel.residueInclusion` (compatibility): ρ(incl)=0.
- `NodeSectionFactorization.PolynomialModel.residueNoRingSplit` (non-example): For nonzero A a right inverse σ of ρ cannot satisfy σ(ev(r)z)=r·σ(z) for all r,z.
- `NodeSectionFactorization.PolynomialModel.residueGeneratorCanonical` (characterisation): An actually constructed surjective A-linear residue sends the canonical native dual generator to 1, including the zero base.
- `NodeSectionFactorization.PolynomialModel.residueMultiplicationCanonical` (characterisation): An actually constructed surjective A-linear residue kills m(r) for every r∈R.

**Uses.** StableReductionPartII:MC.2/dual-section-ideal: Provides the explicit polynomial-model calculation used before the separately open completed-local and sheaf descent steps.; StableReductionPartII:MC.2/node-factorization-exact: Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). In this actual quotient the alternating Φ,Ψ complex and its transpose are exact: ker Φ=im Ψ, ker Ψ=im Φ, ker Φᵀ=im Ψᵀ and ker Ψᵀ=im Φᵀ. Cokernel identifications are the two separate construction nodes.

**Acceptance:** For nonzero A, there is no R-linear section of ρ: d kills A but acts injectively on D.

**Source:** knudsen2012, §3, printed pp.11–12: monic division, κ/λ comparisons and proof of Proposition3.1.


#### Scalar correction in dual coordinates

`StableReductionPartII:MC.2/section-dual-scalar-correction` — construction.

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). There is a unique A-linear K:R→R satisfying d K(r)=b(r−ι(ev r)). It obeys K(rz)=rK(z)+ι(ev z)K(r), K(c)=−a, K(d)=b and K(ια)=0.

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) For r=p(v)+u q₁(v), let P=(p(Y)−p(t))/(Y−t), Q=(q₁(Y)−q₁(t))/(Y−t) by exact monic division. (2) Set K(r)=b(P(v)+uQ(v))−a·ι(q₁(t)); multiply by d and use bc=−ad. (3) A-linearity, uniqueness and the twisted product identity follow by multiplying by d and cancelling.

**Dependencies:** `StableReductionPartII:MC.2/section-evaluation-kernel`, `StableReductionPartII:MC.2/section-dual-generator`, `StableReductionPartII:MC.2/section-coordinate-regular`.

**API.**

- `NodeSectionFactorization.PolynomialModel.dualScalarCorrection` (characterisation): The denominator-free identity uniquely specifies the correction.
- `NodeSectionFactorization.PolynomialModel.dualScalarCorrectionConstants` (simp): K(ια)=0 for every α∈A.
- `NodeSectionFactorization.PolynomialModel.dualScalarCorrectionUnique` (extensionality): Two A-linear maps satisfying the identity agree.

**Discriminating tests.**

- `NodeSectionFactorization.PolynomialModel.correctionFirst` (computation): K(c)=−a.
- `NodeSectionFactorization.PolynomialModel.correctionSecond` (computation): K(d)=b.
- `NodeSectionFactorization.PolynomialModel.correctionConstants` (compatibility): K(ια)=0, including α=1.

**Uses.** StableReductionPartII:MC.2/dual-section-ideal: Provides the explicit polynomial-model calculation used before the separately open completed-local and sheaf descent steps.; StableReductionPartII:MC.2/node-factorization-exact: Exposes the concrete quotient, regular coordinate and actual module maps; not an arbitrary receiving ring.

**Acceptance:** The product law uses ev(z) multiplying K(r); reversing that convention without changing the first term is incorrect.

**Source:** knudsen2012, §3, printed pp.11–12: monic division, κ/λ comparisons and proof of Proposition3.1.

#### Node-ring action on the dual coordinates

`StableReductionPartII:MC.2/section-dual-scalar-action` — lemma.

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). For normal coordinates (r,α) of h and the unique K, the coordinates of z·h are (zr+ια K(z), (ev z)α).

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) Expand h in the inverse equivalence formula and use the separate generator-action correction. (2) The injective inverse equivalence identifies the resulting pair (zr+ιαK(z),ev(z)α). This argument does not assume the residue theorem.

**Dependencies:** `StableReductionPartII:MC.2/section-dual-normal-equivalence`, `StableReductionPartII:MC.2/section-dual-generator-action`.

**Acceptance:** The correction term rules out a componentwise R action.

**Source:** knudsen2012, §3, printed pp.11–12: monic division, κ/λ comparisons and proof of Proposition3.1.


#### Coefficient flatness of the section ideal

`StableReductionPartII:MC.2/section-ideal-coefficient-flat` — lemma.

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). J is flat as an A-module.

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) R is A-free by monomial normal form. (2) The A-linear retraction R→J sends r to r−ιev(r); the evaluation splitting makes J a direct summand. (3) Apply the existing retract-of-flat theorem.

**Dependencies:** `StableReductionPartII:MC.2/section-evaluation-kernel`, `StableReductionPartII:MC.2/polynomial-normal-form`, `mathlib:Module.Flat.of_retract`, `mathlib:Module.Flat.of_free`.

**Acceptance:** No claim that J is R-flat, projective over R or invertible at the node.

**Source:** knudsen2012, §3, printed pp.11–12: monic division, κ/λ comparisons and proof of Proposition3.1.

#### Coefficient flatness of the section dual

`StableReductionPartII:MC.2/section-dual-coefficient-flat` — lemma.

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). D is A-free and hence A-flat.

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) Normal coordinates identify D with R×A as A-modules. (2) The right side is A-free; transport and apply the existing free-flat instance.

**Dependencies:** `StableReductionPartII:MC.2/section-dual-normal-equivalence`, `StableReductionPartII:MC.2/polynomial-normal-form`, `mathlib:Module.Flat.of_linearEquiv`, `mathlib:Module.Flat.of_free`.

**Acceptance:** The theorem is about the actual R-linear dual with restriction to A.

**Source:** knudsen2012, §3, printed pp.11–12: monic division, κ/λ comparisons and proof of Proposition3.1.

#### Coefficient map of pointed node rings

`StableReductionPartII:MC.2/section-coefficient-map` — construction.

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). For any ring map f:A→A′, define R′ using the mapped coefficients and φ:R→R′ by the native AdjoinRoot.map. It sends u,v and ιz to u′,v′ and ι′f(z), preserves the section evaluation and sends c,d,a,b to their primed counterparts.

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) Coefficient mapping sends F to F′. Apply the existing quotient map construction. (2) Check the images on the two variables and coefficients. (3) Use the existing composition law and generator extensionality for identity and composition.

**Dependencies:** `StableReductionPartII:MC.2/polynomial-node-model`, `mathlib:AdjoinRoot.map`, `mathlib:Polynomial.mapRingHom`, `mathlib:AdjoinRoot.map_comp_map`.

**API.**

- `NodeSectionFactorization.PolynomialModel.coefficientMap` (functoriality): The native quotient homomorphism is induced by the mapped polynomial.
- `NodeSectionFactorization.PolynomialModel.coefficientMapValues` (simp): φ(u)=u′, φ(v)=v′ and φ(ιz)=ι′f(z).
- `NodeSectionFactorization.PolynomialModel.coefficientMapIdentity` (compatibility): For f=id_A, φ=id_R.
- `NodeSectionFactorization.PolynomialModel.coefficientMapComposition` (functoriality): For A→A′→A″, φ_g∘φ_f=φ_{g∘f}.

**Discriminating tests.**

- `NodeSectionFactorization.PolynomialModel.mapIdentity` (compatibility): The identity coefficient map induces the identity on R.
- `NodeSectionFactorization.PolynomialModel.mapZeroCoefficient` (degenerate): φ(ι0)=0 for every coefficient map.
- `NodeSectionFactorization.PolynomialModel.mapSectionCoordinates` (computation): φ(c)=c′ and φ(d)=d′ with all four parameters mapped.

**Uses.** StableReductionPartII:MC.2/dual-section-ideal: Provides the explicit polynomial-model calculation used before the separately open completed-local and sheaf descent steps.; StableReductionPartII:MC.2/node-factorization-exact: Exposes the concrete quotient, regular coordinate and actual module maps; not an arbitrary receiving ring.

**Acceptance:** No flatness or injectivity of f is required.

**Source:** knudsen2012, §3, printed pp.11–12: monic division, κ/λ comparisons and proof of Proposition3.1.

#### Coefficient base change of the node ring

`StableReductionPartII:MC.2/section-ring-base-change` — theorem.

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). For any f:A→A′, the canonical A′-linear map A′⊗_A R→R′, a′⊗r↦ι′a′ φ(r), is an equivalence (and respects the algebra multiplication).

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) Extend the monomial basis vⁿ,u vⁿ through tensoring. (2) The same monic normal form over A′ identifies the image basis with that of R′. (3) Multiplication compatibility follows on pure tensors.

**Dependencies:** `StableReductionPartII:MC.2/section-coefficient-map`, `StableReductionPartII:MC.2/polynomial-normal-form`, `mathlib:TensorProduct.lift`.

**Acceptance:** The algebra-equivalence adapter section-ring-tensor-equivalence specifies the same natural underlying linear map; the prototype records signatures, not verified implementation proofs.

**Source:** knudsen2012, §3, printed pp.11–12: monic division, κ/λ comparisons and proof of Proposition3.1.

#### Coefficient base change of the section ideal

`StableReductionPartII:MC.2/section-ideal-base-change` — theorem.

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). For any f:A→A′, the canonical map A′⊗_A J→J′, a′⊗j↦ι′a′ φ(j), is an A′-linear equivalence onto J′=(c′,d′).

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) Tensor the split A-linear evaluation sequence: it stays exact for every A′. (2) Identify R′ and A′ and compare their evaluations. (3) The kernel is exactly J′, with the specified images of c,d.

**Dependencies:** `StableReductionPartII:MC.2/section-ring-base-change`, `StableReductionPartII:MC.2/section-evaluation-kernel`, `StableReductionPartII:MC.2/section-ideal-coefficient-flat`, `mathlib:TensorProduct.lift`.

**Acceptance:** No flatness of f is used; the source sequence is split.

**Source:** knudsen2012, §3, printed pp.11–12: monic division, κ/λ comparisons and proof of Proposition3.1.

#### Natural coefficient base change of the section dual

`StableReductionPartII:MC.2/section-dual-base-change` — theorem.

Set q=X²+γXY+δY², F=q(X,Y)−q(s,t), R=A[Y][X]/(F), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u, J=(c,d), D=Hom_R(J,R). For every f:A→A′, the natural comparison A′⊗_A D≃ₗ[A′]D′ satisfies e(a′⊗h)(φ(j))=ι′a′φ(h(j)). It sends ε to ε′ and multiplication maps to multiplication maps; residue and K commute with coefficient mapping.

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) Identify the two sides with R′×A′ by the normal equivalences and ring base change. (2) The relation d′φ(ε(j))=b′φ(j) and regularity of d′ identify the mapped generator with ε′. (3) Exact monic division for P,Q commutes with coefficient mapping; hence φ(Kr)=K′φ(r). (4) The correction formula proves compatibility with the scalar action of φ(r), and pure tensors specify the natural evaluation comparison.

**Dependencies:** `StableReductionPartII:MC.2/section-ideal-base-change`, `StableReductionPartII:MC.2/section-dual-normal-equivalence`, `StableReductionPartII:MC.2/section-dual-scalar-correction`, `StableReductionPartII:MC.2/section-coordinate-regular`, `mathlib:TensorProduct.lift`.

**Acceptance:** The native canonical dual adapter, tensor action, R′-linearity, identity/composition and actual quotient comparison have declaration-sized signatures. No completed-local or global sheaf conclusion follows.

**Source:** knudsen2012, §3, printed pp.11–12: monic division, κ/λ comparisons and proof of Proposition3.1.

#### Dual ideal of an arbitrary nodal section

`StableReductionPartII:MC.2/dual-section-ideal` — theorem.

For a nodal family C/S over a locally noetherian base and an arbitrary section Δ with ideal J, J is stably reflexive, formation of J∨ and J∨/O_C commutes with arbitrary base change, and Δ*(J∨/O_C) is an invertible sheaf. In the local quadratic model J∨ is generated by1 and ε=(x+s+γt)/(y−t) in the total quotient ring, and J∨/R≅A via the class of ε.

**Hypotheses:** The full range, base and auxiliary data are specified in the statement; none are suppressed by a global stable-pair convention.

**Construction/proof.** (1) Apply the separately named polynomial dual, residue, coefficient-flatness, ring-linear tensor and actual quotient-base-change calculations; these are inputs to the completed-local comparison, not the global conclusion. (2) Use the named flat ambient ideal/Hom/multiplication-quotient and actual module-completion adapters where their hypotheses hold. Separately prove/import Knudsen Appendix Theorem2, Proposition6, the pointed completed-local hull identification, and coefficient-compatible descent; the ambient adapters alone do not discharge these relative S→R requirements. (3) Use the invertible-ideal calculation at smooth points and descend the fibrewise-compatible local identifications.

**Dependencies:** `StableReductionPartII:MC.2/pointed-node-normal-form`, `StableReductionPartII:MC.2/node-factorization-exact`, `SchemeAndStackFoundations:SF.1`, `StableReductionPartII:MC.2/section-dual-residue`, `StableReductionPartII:MC.2/section-dual-base-change`, `StableReductionPartII:MC.2/section-ideal-coefficient-flat`, `StableReductionPartII:MC.2/section-dual-coefficient-flat`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

**Acceptance:** Do not strengthen this to J·J∨=J throughout a smoothing family: that equality holds only on the nodal-section locus.

**Source:** knudsen2012, Proposition3.1,Corollary3.2 and §4,pp.12–13.

**Additional named inputs:** `StableReductionPartII:MC.2/section-ideal-finite-presentation`, `StableReductionPartII:MC.2/section-dual-ambient-equivalence`, `StableReductionPartII:MC.2/section-dual-ambient-quotient-equivalence`, `StableReductionPartII:MC.2/section-dual-completion-equivalence`, `StableReductionPartII:MC.2/section-dual-quotient-completion-equivalence`, `StableReductionPartII:MC.2/section-dual-ambient-faithful-detection`.

#### Expansion at an arbitrary extra section

`StableReductionPartII:MC.2/expansion` — construction.

Given a stable ordered n-pointed family and an arbitrary section Δ, form K=coker(O_C→J_Δ∨⊕O_C(Σsᵢ)), with diagonal inclusion, and C^s=Proj_C Sym K. The two quotient maps at each old section and at Δ define the lifted ordered n+1 sections. This construction commutes with base change and is functorial under pointed isomorphisms. At a smooth new point it changes nothing, at a collision it inserts a marked rational tail, and at a node it inserts a marked rational bridge.

**Construction/proof.** (1) Form the coherent cokernel and the relative symmetric algebra. (2) Use the quotient line bundles along all sections to construct their lifts to relative Proj. (3) Apply the dual-ideal base-change comparison to transport the entire cokernel/Proj construction; stability and flatness are separate conclusions.

**Dependencies:** `StableReductionPartII:MC.0/universal-curve`, `StableReductionPartII:MC.2/dual-section-ideal`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `AlgebraicModuliForArithmeticGeometry:R09.1`.

**API.**

- `PointedExpansion.scheme` (data): The new family is Proj_C Sym K with the specified cokernel K.
- `PointedExpansion.markings` (projection): Lift all old ordered marks and Δ using the specified invertible quotients.
- `PointedExpansion.baseChange` (functoriality): Pullback of the expansion identifies canonically with expansion of the pulled-back family.

**Discriminating tests.**

- `PointedExpansion.newSmoothPoint` (computation): For Δ disjoint from old marks and contained in the smooth locus, C^s≅C.
- `PointedExpansion.collidingPoint` (degenerate): For Δ=s₁, the new fibre has a P¹ tail carrying the two distinct lifts of s₁ and Δ.
- `PointedExpansion.nodalPoint` (compatibility): For Δ at a node, the new fibre has a P¹ bridge with two attachment points and a third point given by the new mark.

**Uses.** StableReductionPartII:MC.2/expansion-flat; StableReductionPartII:MC.2/expansion-stable.

**Acceptance:** An arbitrary extra section is not assumed Cartier.

**Source:** knudsen2012, Introduction,pp.2–3;Theorem5.1,p.13.

#### Flatness of the expanded family

`StableReductionPartII:MC.2/expansion-flat` — theorem.

The expanded C^s/S is flat of finite presentation. At a nodal section its two affine charts are the rings (4),(5) in Knudsen2012 §5; the first has an explicit free A-module monomial basis and the second is flat after inverting δx²−γx+1, and these opens cover.

**Construction/proof.** (1) Use the explicit presentation of Sym J∨ from the matrix factorization. (2) Eliminate one old coordinate in each Proj chart; monic reduction gives the claimed free basis. (3) The remaining open is a localization of A[x]. The cover proves flatness; handle collisions by the marked smooth local chart from KnudsenII Theorem2.4.

**Dependencies:** `StableReductionPartII:MC.2/expansion`, `StableReductionPartII:MC.2/pointed-node-normal-form`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `SchemeAndStackFoundations:SF.0`.

**Acceptance:** A fibrewise description alone does not prove flatness over a nonreduced base.

**Source:** knudsen2012, Theorem5.1 proof,pp.14–16.

#### Stability of the expanded family

`StableReductionPartII:MC.2/expansion-stable` — theorem.

C^s with its n+1 lifted sections is a stable pointed family of the same arithmetic genus g. Its new marking is in the relative smooth locus and is disjoint from every retained mark; in the node case the inserted P¹ has three distinct special flags.

**Construction/proof.** (1) Identify geometric fibres by the Proj charts, including nodal and collision cases. (2) Compute the genus using the parent normalization/dual-graph formula. (3) Check log-canonical degrees on every component using the parent pointed-stability criterion.

**Dependencies:** `StableReductionPartII:MC.2/expansion-flat`, `StableReductionPartII:MC.2/expansion`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

**Acceptance:** At a node neither attaching point is the new marking.

**Source:** knudsen2012, Theorem5.1,pp.13–16;KnudsenII2.4.

#### Forgetting a marking on the moduli stack

`StableReductionPartII:MC.2/forget` — construction.

For 2g−2+n>0 define the morphism π:M̄_{g,n+1}→M̄_{g,n} by the parent’s single-mark contraction after forgetting the last mark. The contraction sends the removed mark to an arbitrary section of the contracted curve, hence lifts π to a morphism c:M̄_{g,n+1}→Z̄_{g,n}. Repeated forgetting is coherent and respects permutations of retained labels.

**Construction/proof.** (1) Apply the already-owned family contraction on every fibre category. (2) Use its uniqueness and base-change cocycle to descend a stack morphism; record the image of the removed section.

**Dependencies:** `StableReductionPartII:key/moduli-curves`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `tauceti:TauCetiRoadmap/StableReduction#layer-9-marked-stabilization-and-stable-pointed-reduction`, `StableReductionPartII:MC.0/pullback-coherence`.

**API.**

- `ForgetMarking.map` (projection): The target family is the parent forget-last contraction.
- `ForgetMarking.extraSection` (data): The removed section descends to an arbitrary section of the contracted family.
- `ForgetMarking.compose` (functoriality): Different coherent orders of forgetting the same set give canonically isomorphic morphisms.

**Discriminating tests.**

- `ForgetMarking.rationalTail` (degenerate): Forgetting one of two markings on a rational tail contracts that tail and carries the remaining mark to its attachment.
- `ForgetMarking.rationalBridge` (degenerate): Forgetting the sole marking on a rational bridge replaces that bridge by a node.
- `ForgetMarking.unstableTargetExcluded` (non-example): The putative map M̄₀,₃→M̄₀,₂ is excluded by the stated target range.

**Uses.** StableReductionPartII:MC.2/expansion-contraction-inverses; StableReductionPartII:MC.3/forget-cotangent-line; StableReductionPartII:MC.5/hodge-forgetting.

**Acceptance:** Forgetting into the unstable range is not part of the morphism.

**Source:** knudsen2, Proposition2.1 and Corollary2.6,pp.174,179.

#### Expansion and contraction are inverse

`StableReductionPartII:MC.2/expansion-contraction-inverses` — theorem.

The expansion morphism s:Z̄_{g,n}→M̄_{g,n+1} and contraction morphism c are quasi-inverse equivalences over M̄_{g,n}. Their unit and counit are natural pointed-family isomorphisms; consequently M̄_{g,n+1} is the universal curve of M̄_{g,n}.

**Construction/proof.** (1) The parent contraction of an expanded tail or bridge recovers the original family with its arbitrary section. (2) The explicit relative Proj comparison and uniqueness of the parent contraction recover a given stable n+1 family. (3) Use flatness and the proper comparison maps in KnudsenII Lemma2.5 to upgrade the geometric checks to scheme isomorphisms, not bare fibrewise equality.

**Dependencies:** `StableReductionPartII:MC.2/expansion-stable`, `StableReductionPartII:MC.2/forget`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`.

**Acceptance:** Collision and nodal cases are included.

**Source:** knudsen2, Lemma2.5,Corollary2.6,pp.178–179.

#### The three-pointed rational moduli scheme

`StableReductionPartII:MC.2/genus-zero-base` — theorem.

M₀,₃=M̄₀,₃≅Spec Z. Every ordered smooth three-pointed rational family is uniquely trivialized as (P¹;0,1,∞); no singular stable genus-zero three-pointed fibre exists.

**Construction/proof.** (1) Use the normalization genus and stable-flag count to exclude reducible stable three-pointed trees. (2) Trivialize the genus-zero family locally and use the unique three-point projectivity; descend the unique trivialization.

**Dependencies:** `StableReductionPartII:MC.0/effective-descent`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `SchemeAndStackFoundations:SF.0`.

**Acceptance:** The automorphism group of the ordered triple is trivial.

**Source:** knudsen2, Introduction and Theorem2.7,p.179.

#### Pointed induction for genus at least two

`StableReductionPartII:MC.2/higher-genus-pointed` — theorem.

For g≥2 and n≥0, M̄_{g,n} is smooth proper Deligne–Mumford over Z of relative dimension3g−3+n with dense smooth locus and relative normal-crossings boundary.

**Construction/proof.** (1) Induct from the unpointed stack using the universal-curve equivalence. (2) In the local universal nodal chart xy=t replace the base parameter t by xy; the total chart remains smooth and the boundary becomes a product of coordinates. (3) Properness and the DM property are preserved by the representable proper universal curve.

**Dependencies:** `StableReductionPartII:MC.2/expansion-contraction-inverses`, `StableReductionPartII:MC.1/proper-moduli`, `StableReductionPartII:MC.1/smooth-dimension`, `StableReductionPartII:MC.1/normal-crossing-boundary`, `AlgebraicModuliForArithmeticGeometry:R09.4`.

**Acceptance:** This induction does not assume the genus-one base.

**Source:** knudsen2, Theorem2.7 proof,p.179.

#### The rigid triangle locus

`StableReductionPartII:MC.2/rigid-triangle-embedding` — theorem.

Attach to a one-pointed genus-one curve the rigid three-component rational triangle carrying the two ordered extra markings of Knudsen’s construction. The resulting genus-two two-pointed family identifies M̄₁,₁ with the specified closed intersection of three boundary branches in M̄₂,₂; the labelled rational subcurve is uniquely recoverable.

**Construction/proof.** (1) Use the parent family gluing and stable-flag criterion for the rigid labelled rational subcurve. (2) Recover the genus-one component and attachment section from the distinguished labelled triangle; check the comparison on families and isomorphisms. (3) The local nodal chart cuts out the three triangle smoothing coordinates. A nodal genus-one component supplies a fourth boundary parameter.

**Dependencies:** `StableReductionPartII:MC.2/higher-genus-pointed`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `StableReductionPartII:MC.2/expansion-contraction-inverses`, `AlgebraicModuliForArithmeticGeometry:R09.4`.

**Acceptance:** This is the specific rigid locus, not a claim that every separating clutching is a closed immersion.

**Source:** knudsen2, Theorem2.7 proof,p.179.

#### The one-pointed genus-one base stack

`StableReductionPartII:MC.2/genus-one-base` — theorem.

M̄₁,₁ is a proper smooth Deligne–Mumford stack over Z of relative dimension1 with relative normal-crossings boundary. Construct it as the rigid triangle-clutching intersection inside M̄₂,₂, as in KnudsenII Theorem2.7; retain the fourth local boundary branch when the elliptic curve is nodal.

**Construction/proof.** (1) First obtain all genus≥2 pointed stacks by universal-curve induction. (2) Attach the rigid labelled rational triangle to the pointed genus-one curve to obtain the specified closed substack of M̄₂,₂. (3) Compute its chart as the intersection of the three specified independent node branches; the nodal elliptic boundary adds one more branch.

**Dependencies:** `StableReductionPartII:MC.2/rigid-triangle-embedding`, `StableReductionPartII:MC.2/higher-genus-pointed`, `AlgebraicModuliForArithmeticGeometry:R09.4`.

**Acceptance:** The genus-one base is not a fine j-line: elliptic stabilizers remain.

**Source:** knudsen2, Theorem2.7 proof,p.179.

#### Deligne–Mumford–Knudsen theorem

`StableReductionPartII:MC.2/pointed-dm-theorem` — theorem.

For every stable pair (g,n), M̄_{g,n} is a smooth proper Deligne–Mumford stack over Z of relative dimension3g−3+n. The smooth substack M_{g,n} is open dense and its complement has relative normal crossings.

**Construction/proof.** (1) Induct on n using the universal-curve equivalence. (2) In a nodal chart replace the old smoothing coordinate t by uv; the total chart is smooth over Z and the boundary equation replaces t by the product uv. (3) Start separately at (0,3),(1,1), and (g,0) for g≥2. Properness and the DM diagonal pass through the representable universal curve.

**Dependencies:** `StableReductionPartII:MC.2/genus-zero-base`, `StableReductionPartII:MC.2/genus-one-base`, `StableReductionPartII:MC.2/expansion-contraction-inverses`, `StableReductionPartII:MC.1/proper-moduli`, `StableReductionPartII:MC.1/smooth-dimension`, `StableReductionPartII:MC.1/normal-crossing-boundary`, `AlgebraicModuliForArithmeticGeometry:R09.4`.

**Acceptance:** The relative dimension is0 at (0,3) and1 at both (0,4) and (1,1).

**Source:** knudsen2, Theorem2.7,p.179.

#### The cross-ratio compactification

`StableReductionPartII:MC.2/cross-ratio` — theorem.

M₀,₄≅P¹_Z minus {0,1,∞} and M̄₀,₄≅P¹_Z. The three boundary points are precisely the three unordered2+2 partitions of the four ordered markings.

**Construction/proof.** (1) The universal curve over M̄₀,₃ is P¹ with its three sections. (2) Use expansion at the fourth section: outside the three sections the fourth coordinate is the cross-ratio; at the three sections it creates the corresponding stable two-component curve.

**Dependencies:** `StableReductionPartII:MC.2/genus-zero-base`, `StableReductionPartII:MC.2/expansion-contraction-inverses`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `SchemeAndStackFoundations:SF.0`.

**Acceptance:** The compactification adds three points, each with a stable rational tail.

**Source:** knudsen2, Theorem2.7 and Corollary2.6,pp.179.

**To close this layer.**

- Appendix has been read in full. Prove/import the exact relative stable-reflexivity Theorem2 and Proposition6 over S→R; Proposition7 is an exercise, not a proved leaf. Finish pointed hull identification, actual sheaf comparison and finite-presentation approximation for arbitrary bases.
- Expand the rigid genus-one embedding and local collision charts into individual lemmas; supply missing Lean family types.


### MC.3. Clutching, boundary strata and cotangent lines

Lift the parent’s gluing operations to separating and nonseparating morphisms of pointed moduli stacks. Prove they are representable finite and unramified, classify boundary divisors by stable one-edge graphs with their automorphism quotients, and compute the conormal node-smoothing line as the tensor product of the two cotangent lines. Construct marking cotangent lines and their forgetful correction. Do not assert that a whole separating clutching map is a closed immersion, or that normal crossings are globally simple.

**Status:** partial.

#### Separating clutching morphism

`StableReductionPartII:MC.3/separating-clutching` — construction.

For ordered complementary marking sets I,J and g₁+g₂=g, with stable source pairs (g₁,|I|+1),(g₂,|J|+1), define ξ_{g₁,I}:M̄_{g₁,I∪{a}}×M̄_{g₂,J∪{b}}→M̄_{g,n} by gluing a and b in the disjoint union. The new node is distinguished in the construction, but is forgotten in the target. The two source components may each already be reducible.

**Construction/proof.** (1) Apply the parent’s external scheme clutching and reindex the remaining markings. (2) Its arbitrary-base-change and isomorphism compatibility define the stack morphism.

**Dependencies:** `StableReductionPartII:key/moduli-curves`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `StableReductionPartII:MC.0/pullback-coherence`.

**API.**

- `SeparatingClutching.map` (constructor): Glue the two distinguished smooth sections over their common base.
- `SeparatingClutching.genus` (characterisation): The target arithmetic genus is g₁+g₂ with the ordered I∪J markings.
- `SeparatingClutching.baseChange` (functoriality): The construction respects pullback and the canonical exchange of the two labelled inputs.

**Discriminating tests.**

- `SeparatingClutching.rationalBoundary` (computation): Gluing two copies of M̄₀,₃ gives a boundary point of M̄₀,₄ indexed by a2+2 partition.
- `SeparatingClutching.equalGenera` (non-example): For n=0 and equal genera, swapping the two source factors induces the same target object; the graph exchange symmetry must be retained.
- `SeparatingClutching.twoEllipticTails` (non-example): Over C let three pairwise nonisomorphic elliptic curves form a stable genus-three one-pointed tree with the mark on the middle component. Choosing either outer elliptic tail gives two nonisomorphic preimages under ξ_{1,∅}:M̄₁,₁×M̄₂,₂→M̄₃,₁.

**Uses.** StableReductionPartII:MC.3/clutching-finite-unramified; StableReductionPartII:MC.3/boundary-types; StableReductionPartII:MC.5/separating-hodge.

**Acceptance:** Do not assume the target distinguishes which node was glued.

**Source:** knudsen2, Definition3.8,p.190.

#### Nonseparating clutching morphism

`StableReductionPartII:MC.3/nonseparating-clutching` — construction.

For g≥1 with stable source pair (g−1,n+2), define ξ_irr:M̄_{g−1,n+2}→M̄_{g,n} by identifying the last two ordered smooth sections. The genus increases by one and both glued labels disappear. Exchanging these two sections gives the same glued target and is part of the graph automorphism quotient, including characteristic two.

**Construction/proof.** (1) Apply the parent’s self-clutching pushout with its base-change isomorphisms. (2) Use the parent graph-genus formula to obtain genus g.

**Dependencies:** `StableReductionPartII:key/moduli-curves`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `StableReductionPartII:MC.0/pullback-coherence`.

**API.**

- `NonseparatingClutching.map` (constructor): Glue the last two sections by the parent pushout.
- `NonseparatingClutching.exchange` (relation): Exchanging the two removed sections yields a canonically isomorphic target.
- `NonseparatingClutching.graph` (compatibility): The graph gains one edge and b₁ increases by one.

**Discriminating tests.**

- `NonseparatingClutching.genusOne` (computation): M̄₀,₃ maps to the rational nodal boundary of M̄₁,₁.
- `NonseparatingClutching.branchExchange` (non-example): The boundary normalization retains the branch-exchange quotient; M̄_{g−1,n+2} alone is not the unlabelled normalization.
- `NonseparatingClutching.genus` (compatibility): Self-gluing two disjoint points on a connected genus-h curve gives arithmetic genus h+1.

**Uses.** StableReductionPartII:MC.3/clutching-finite-unramified; StableReductionPartII:MC.3/boundary-types; StableReductionPartII:MC.5/nonseparating-hodge.

**Acceptance:** An unlabelled nonseparating node does not order its branches.

**Source:** knudsen2, Definition3.8,p.190.

#### Finite unramified clutching

`StableReductionPartII:MC.3/clutching-finite-unramified` — theorem.

Both clutching morphisms are representable finite and unramified. For a fixed target stable curve their geometric fibres are finite choices of a node and, when relevant, an ordering or genus/marking assignment to its branches. These choices can be more than one even for a fixed separating genus and marking partition.

**Construction/proof.** (1) A source automorphism mapping to the identity target is the identity on the partial normalization, proving representability. (2) Pull back along a target family: the choice is a closed subspace of the finite unramified singular-locus/branch data. (3) The source stack is proper, so the representable quasi-finite morphism is finite; the singular-locus description gives unramifiedness.

**Dependencies:** `StableReductionPartII:MC.3/separating-clutching`, `StableReductionPartII:MC.3/nonseparating-clutching`, `StableReductionPartII:MC.2/pointed-dm-theorem`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `AlgebraicModuliForArithmeticGeometry:R09.4`.

**Acceptance:** There can be two distinct separating preimages for two elliptic tails.

**Source:** knudsen2, Corollary3.9(a),p.190.

#### Stable one-edge boundary types

`StableReductionPartII:MC.3/boundary-types` — definition.

A pointed boundary type is a stable connected genus-g graph with n labelled legs and exactly one edge, up to label-preserving graph isomorphism, using the parent’s weighted dual graphs. Its normalization parameter stack is the product of the vertex moduli stacks modulo the finite automorphism group of this graph. For n=0,g≥2 the types are Δ₀ and Δᵢ for1≤i≤⌊g/2⌋, where Δ₀ is the closure of the nonseparating one-node locus, not merely the locus of irreducible nodal curves.

**Construction/proof.** (1) Specialize the parent stable graphs to one edge and keep leg labels. (2) Use the parent normalization data and finite graph automorphisms to form the quotient parameter.

**Dependencies:** `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `StableReductionPartII:MC.3/separating-clutching`, `StableReductionPartII:MC.3/nonseparating-clutching`, `SchemeAndStackFoundations:SF.1`.

**API.**

- `BoundaryType.vertexProduct` (data): Associate the product of the pointed vertex moduli stacks.
- `BoundaryType.automorphisms` (structure): Graph automorphisms preserve genera and every external leg label.
- `BoundaryType.map` (projection): Clutching descends through the graph automorphism action to the target boundary divisor.

**Discriminating tests.**

- `BoundaryType.zeroFour` (computation): There are exactly three one-edge types for(g,n)=(0,4).
- `BoundaryType.genusTwoUnpointed` (computation): The unpointed genus-two types are Δ₀ and Δ₁; Δ₁ has the exchange of its two genus-one vertices.
- `BoundaryType.nonseparatingExchange` (non-example): The one-loop graph has branch-exchange automorphism, even in characteristic two; the quotient is by a constant finite group, not by μ₂.

**Uses.** StableReductionPartII:MC.3/boundary-normalization; StableReductionPartII:MC.3/forget-cotangent-line; StableReductionPartII:MC.5/boundary-divisor.

**Acceptance:** Higher-node curves can lie on several branches of the same global boundary component.

**Source:** knudsen2, Definition3.8,p.190.

#### Normalization of the boundary

`StableReductionPartII:MC.3/boundary-normalization` — theorem.

The normalization of the reduced total boundary of M̄_{g,n} is the disjoint union, over stable one-edge types, of the corresponding vertex-product quotient stacks. Its finite map to the boundary records a distinguished node; it separates branches at curves with several nodes of the same type.

**Construction/proof.** (1) The source products are smooth and hence normal; quotient by the constant finite graph group preserves normality in the stack sense. (2) Every stable nodal geometric curve has a node, whose partial normalization yields a one-edge type. (3) Over the generic one-node locus the quotient gives a unique unlabelled node; finite birational normality identifies each normalization component.

**Dependencies:** `StableReductionPartII:MC.3/boundary-types`, `StableReductionPartII:MC.3/clutching-finite-unramified`, `StableReductionPartII:MC.2/pointed-dm-theorem`, `StableReductionPartII:MC.1/normal-crossing-boundary`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

**Acceptance:** The map is not globally an isomorphism onto a smooth boundary divisor.

**Source:** knudsen2, Definition3.8 and Corollary3.9(a),p.190;local description in Theorem2.7.

#### Cotangent lines at the markings

`StableReductionPartII:MC.3/cotangent-line` — construction.

For the universal stable pointed curve f:C→M̄_{g,n}, define Lᵢ=sᵢ*ω_{C/M̄}. Each is an invertible sheaf because the marking is in the relative smooth locus; it identifies with sᵢ*Ω¹_{C/M̄}. Base change and relabelling preserve this line. The class ψᵢ=c₁(Lᵢ) is an exported input to the consumer’s tautological Chow-ring construction, not a new Chow theory here.

**Construction/proof.** (1) Pull back the parent nodal relative dualizing line along the smooth section. (2) Use its agreement with relative differentials on the smooth locus and its base-change cocycle to descend a line on the stack.

**Dependencies:** `StableReductionPartII:MC.0/universal-curve`, `StableReductionPartII:MC.2/pointed-dm-theorem`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `SchemeAndStackFoundations:SF.1`.

**API.**

- `MarkingCotangentLine.pullback` (functoriality): For a family over S, the pulled-back line is sᵢ*ω_{C/S}.
- `MarkingCotangentLine.differentials` (compatibility): At a smooth marking Lᵢ≅sᵢ*Ω¹_{C/S}.
- `MarkingCotangentLine.relabel` (functoriality): Permuting marking labels permutes the corresponding line bundles.

**Discriminating tests.**

- `MarkingCotangentLine.zeroThree` (computation): On M̄₀,₃≅Spec Z every marking cotangent line is trivial.
- `MarkingCotangentLine.zeroFour` (computation): On M̄₀,₄≅P¹ each Lᵢ has degree1.
- `MarkingCotangentLine.sign` (non-example): The section normal line is Lᵢ∨, so its first Chern class is−ψᵢ, not ψᵢ.

**Uses.** StableReductionPartII:MC.3/forget-cotangent-line; StableReductionPartII:MC.3/node-conormal.

**Acceptance:** The dual line is the normal line to the section.

**Source:** knudsen3, §4 definition(d),p.201.

#### Cotangent-line correction under forgetting

`StableReductionPartII:MC.3/forget-cotangent-line` — theorem.

For π:M̄_{g,n+1}→M̄_{g,n} and retained i, let D_{i,n+1} be the divisor of a rational tail carrying exactly marks i,n+1 and its attachment. Then Lᵢ on the source is π*Lᵢ⊗O(D_{i,n+1}); equivalently π*Lᵢ=Lᵢ⊗O(−D_{i,n+1}).

**Construction/proof.** (1) Apply the local contraction comparison for the section cotangent sheaf. (2) The comparison is an isomorphism away from the collision divisor and has one simple zero there, giving the displayed sign.

**Dependencies:** `StableReductionPartII:MC.3/cotangent-line`, `StableReductionPartII:MC.2/forget`, `StableReductionPartII:MC.3/boundary-types`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Acceptance:** In genus zero the degree difference produces deg Lᵢ=1 on M̄₀,₄.

**Source:** knudsen3, Theorem4.1(c) and proof,pp.202–203.

#### The node-smoothing conormal line

`StableReductionPartII:MC.3/node-conormal` — theorem.

Along the normalized one-edge boundary, the conormal line of its distinguished local branch is L_a⊗L_b. Thus the corresponding normal line is L_a∨⊗L_b∨ and has first Chern class−ψ_a−ψ_b. This concerns a chosen branch on the normalization, not a global assertion that the whole boundary component is embedded smoothly.

**Construction/proof.** (1) In the local smoothing xy=t, coordinate changes x↦ux,y↦vy transform t by uv. (2) The differential lines at the two normalization branches transform by u and v; identify the conormal parameter with their tensor product. (3) Descend the identification through branch exchange and graph automorphisms.

**Dependencies:** `StableReductionPartII:MC.3/cotangent-line`, `StableReductionPartII:MC.3/boundary-normalization`, `StableReductionPartII:MC.1/versal-node-parameters`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

**Acceptance:** Dualizing changes the sign of both ψ classes.

**Source:** knudsen2, Theorem3.5,pp.183–186.

**To close this layer.**

- Verify augmented-clutching restriction using Ile; acquire a modern primary normalization reference.
- Independently review the Corollary3.9(b) counterexample; finish line/graph quotient suppliers and Lean APIs.


### MC.4. Coarse moduli, projectivity and full level

Construct coarse algebraic spaces separately from the stacks. For g≥2 prove projectivity of the unpointed stable coarse space over Z using pluricanonical direct-image nefness and the ampleness lemma. Obtain a finite surjective normal projective scheme cover. Construct smooth-curve symplectic-similitude level N≥3 over Z[1/N], with a fixed pairing component over Z[1/N,ζ_N]; prove representability, regularity, quasi-projectivity, connectedness and dimension 3g−3, and its smooth projective universal curve. Normalize a chosen projective cover for a stable compactification; never declare naive full level on every nodal curve fine.

**Status:** partial.

#### Coarse spaces of pointed curve stacks

`StableReductionPartII:MC.4/coarse-space` — construction.

For each stable pair construct the coarse algebraic spaces q:M̄_{g,n}→M̄^{coarse}_{g,n} and q°:M_{g,n}→M^{coarse}_{g,n}. They are initial for maps to algebraic spaces and induce bijections between geometric points and isomorphism classes. Stable coarse spaces are proper over Z. Existence alone gives neither smoothness of the coarse space nor a universal family on it; base change is used only with the hypotheses of the imported coarse-space theorem.

**Construction/proof.** (1) The finite diagonal gives finite inertia; apply the generic coarse-space existence theorem with its noetherian finite-type hypotheses. (2) Use the proper coarse-space comparison to deduce properness. (3) Restrict the stable coarse space to the saturated smooth open; geometric curve smoothness is invariant under isomorphism.

**Dependencies:** `StableReductionPartII:MC.2/pointed-dm-theorem`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

**API.**

- `CurvesCoarseSpace.geometricPoints` (characterisation): For algebraically closed k, coarse k-points correspond to curve isomorphism classes.
- `CurvesCoarseSpace.initial` (universal-property): A stack morphism to an algebraic space factors uniquely through q.
- `CurvesCoarseSpace.smoothOpen` (compatibility): The smooth coarse space is the saturated open corresponding to smooth curves.

**Discriminating tests.**

- `CurvesCoarseSpace.zeroThree` (computation): For(g,n)=(0,3),q is the isomorphism Spec Z→Spec Z.
- `CurvesCoarseSpace.zeroFour` (computation): The stable coarse space for(0,4) is P¹_Z.
- `CurvesCoarseSpace.ellipticInertia` (non-example): Over a characteristic-zero field (E,0) retains [−1] in the stack although its coarse point has no automorphism data; a coarse class does not make it a fine moduli object.

**Uses.** StableReductionPartII:MC.4/moduli-determinant-ample; StableReductionPartII:MC.4/projective-coarse; StableReductionPartII:MC.4/fine-level-scheme; StableReductionPartII:MC.6/maximal-variation; StableReductionPartII:MC.6/compactified-torelli.

**Acceptance:** Smooth stacks can have singular coarse spaces.

**Source:** clm, Lemma1.3,p.3.

#### Nef pluricanonical direct images

`StableReductionPartII:MC.4/pluricanonical-nef` — theorem.

For a family f:X→B of stable genus-g curves g≥2 over a smooth projective curve B over an algebraically closed field, f_*ω^m is nef for m≥2, in every characteristic. Nefness means nonnegative degree for line quotients after finite maps from smooth projective curves.

**Construction/proof.** (1) If the generic fibre is smooth apply the smooth-generic direct-image theorem. (2) Otherwise split persistent nodes after a finite cover of B and use the normalization residue sequence. (3) Its kernel is the direct sum of component bundles twisted by (m−1)D^ν, nef by the pointed theorem, and its quotient is a direct sum of O_B. Apply preservation of nefness under extensions from the positivity supplier. (4) Descend nefness along the finite cover.

**Dependencies:** `StableReductionPartII:MC.4/smooth-generic-direct-image-nef`, `StableReductionPartII:MC.4/pointed-normalization-nef`, `StableReductionPartII:MC.4/persistent-node-residue-sequence`, `SchemeAndStackFoundations:SF.5`.

**Acceptance:** Characteristic two is included; the exceptional bound≤1 still contradicts H¹≥2.

**Source:** clm, Propositions6.3,6.7,6.9;Theorem6.10,pp.23–29.

#### Finite-degree equations of stable embeddings

`StableReductionPartII:MC.4/finite-degree-equations` — theorem.

For a finite-type family of stable genus-g curves g≥2, after choosing a sufficiently large common d the multiplication Symᵈ(f_*ω³)→f_*ω^{3d} is surjective and its kernel determines each tricanonically embedded geometric fibre. The bound is allowed to depend on the finite-type family; no unproved universal choice d=2 is used.

**Construction/proof.** (1) Apply relative Serre vanishing to the ideal sheaf of the tricanonical embedding over the noetherian family base. (2) Use finite generation of the relative ideal and a sufficiently large degree to recover the saturated ideal; record this generic projective-algebra input as a supplier request. (3) The dimension of the quotient is(6d−1)(g−1).

**Dependencies:** `StableReductionPartII:MC.1/tricanonical-cohomology`, `StableReductionPartII:MC.1/tricanonical-hilbert`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `AlgebraicModuliForArithmeticGeometry:R09.2`.

**Acceptance:** A finite-fibre moduli map alone does not imply its source is noetherian; finite-type/noetherian hypotheses are explicit.

**Source:** clm, Lemma7.1 proof,pp.29–30.

#### Ampleness of a pluricanonical determinant

`StableReductionPartII:MC.4/moduli-determinant-ample` — theorem.

Let S be a proper finite-type algebraic space over an algebraically closed field and f:X→S a stable genus-g family g≥2 whose coarse moduli map has finite geometric fibres. For all sufficiently large d, det f_*ω^{3d} is ample on S.

**Construction/proof.** (1) Use the multiplication quotient Symᵈ(f_*ω³)→f_*ω^{3d}. (2) Its projective-frame classifying map to the Grassmannian quotient has finite fibres because its kernel determines the embedded curve up to projectivity. (3) Use the precise ampleness lemma: for a nef vector bundle E on a proper algebraic space and a locally free quotient SymᵈE→Q with finite-fibre classifying map, det Q is ample. This generic positivity theorem is not silently attributed to SF.5; it is recorded as an unassigned extension gap.

**Dependencies:** `StableReductionPartII:MC.4/pluricanonical-nef`, `StableReductionPartII:MC.4/finite-degree-equations`, `StableReductionPartII:MC.4/coarse-space`, `AlgebraicModuliForArithmeticGeometry:R09.1`, `SchemeAndStackFoundations:SF.5`.

**Acceptance:** The claim concerns the determinant line; it does not state that the entire quotient vector bundle is ample.

**Source:** clm, Proposition5.5,pp.21–22;Lemma7.1,pp.29–30.

#### Projectivity of the stable coarse moduli space

`StableReductionPartII:MC.4/projective-coarse` — theorem.

For g≥2 M̄^{coarse}_g is a projective scheme over Z. There is a positive power of a sufficiently high pluricanonical determinant which descends to an ample line on the coarse algebraic space.

**Construction/proof.** (1) Use the generic finite scheme-cover theorem for a finite-type DM stack, retaining representability. (2) The composite cover→coarse is proper with finite geometric fibres, hence finite; a proper algebraic space with a finite surjective scheme cover can be treated by finite ampleness descent. (3) Use coarse descent of sufficiently divisible powers of line bundles; no injectivity of equivariant Picard into ordinary Picard is asserted. (4) For each residue characteristic apply the determinant-ampleness result to the proper scheme cover. Openness of relative ampleness and quasi-compactness of Spec Z give one common exponent. (5) An ample line on the proper coarse algebraic space makes it a projective scheme.

**Dependencies:** `StableReductionPartII:MC.4/coarse-space`, `StableReductionPartII:MC.4/moduli-determinant-ample`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `SchemeAndStackFoundations:SF.0`.

**Acceptance:** The coarse space is not claimed smooth over Z.

**Source:** clm, Theorem7.2,pp.30–31.

#### A finite projective scheme cover of stable moduli

`StableReductionPartII:MC.4/finite-projective-cover` — construction.

For g≥2 choose a representable finite surjective morphism V→M̄_g with V a normal integral scheme projective over Z. Pull back the universal stable curve to V. This is a chosen cover with a stable family, not a new fine moduli interpretation of V.

**Construction/proof.** (1) Choose a finite surjective scheme cover of the finite-type DM stack. (2) The composite to the projective coarse scheme is proper quasi-finite and hence finite; this makes the cover projective. (3) Choose a component dominating the integral target and normalize it; normalization is finite over the excellent base. Its finite closed image contains the generic point, hence the entire target.

**Dependencies:** `StableReductionPartII:MC.4/projective-coarse`, `StableReductionPartII:MC.0/universal-curve`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `SchemeAndStackFoundations:SF.0`, `StableReductionPartII:MC.4/irreducible-geometric-fibres`.

**API.**

- `StableModuliCover.map` (projection): The chosen cover V→M̄_g is representable finite surjective.
- `StableModuliCover.family` (data): The family on V is the pullback of the universal stable curve.
- `StableModuliCover.pullback` (functoriality): A family C/S yields the finite cover S×_{M̄_g}V→S and its pulled-back family.

**Discriminating tests.**

- `StableModuliCover.smoothPullback` (compatibility): The family restricted to the inverse image of M_g is smooth.
- `StableModuliCover.boundaryRamification` (non-example): No étaleness or smoothness of the cover is imposed at a nodal boundary point.
- `StableModuliCover.coverOfBase` (characterisation): Pulling V back along any genus-g stable family yields a finite surjective scheme cover of its base.

**Uses.** StableReductionPartII:MC.6/graph-closure.

**Acceptance:** The finite map is not assumed étale at the boundary.

**Source:** yuan-author-http, §3.1.4,p.45.

#### Full symplectic level on smooth curves

`StableReductionPartII:MC.4/full-level` — definition.

Fix g≥2 and N≥3 invertible on the base. A full Jacobi level structure on a smooth genus-g curve is an isomorphism α:(Z/N)^{2g}→J(C)[N] carrying the standard alternating form to the Weil pairing through a chosen trivialization of μ_N, or equivalently a homogeneous symplectic-similitude identification without choosing that trivialization. Use the fixed symplectic flavour over Z[1/N,ζ_N], and the similitude flavour over Z[1/N]. Their components and universal families are not identified without this choice.

**Construction/proof.** (1) Use the relative Jacobian of the smooth curve family, its principal polarization and prime-to-characteristic torsion pairing; the curve-relative representability input is a recorded extension gap. (2) Define the isomorphism functor with its exact pairing condition and marking-preserving curve isomorphisms.

**Dependencies:** `StableReductionPartII:key/moduli-curves`, `AbelianSchemesAndArithmeticModuli:A3`, `PELModuli:M6`, `SchemeAndStackFoundations:SF.3`.

**API.**

- `CurveFullLevel.pairing` (characterisation): The Weil pairing is the standard form through the chosen ζ_N in the fixed-component flavour.
- `CurveFullLevel.pullback` (functoriality): Base change pulls back the Jacobian torsion and the pairing identification.
- `CurveFullLevel.similitude` (compatibility): Forgetting the chosen μ_N trivialization gives the homogeneous symplectic-similitude object, with its multiplier component.

**Discriminating tests.**

- `CurveFullLevel.component` (non-example): The full similitude-level space over Q can have several geometric components; the DGH space selects one viaζ_N.
- `CurveFullLevel.minusOne` (non-example): For N=2 the automorphism[−1] acts trivially on N-torsion, so this level does not remove the hyperelliptic curve stabilizer.
- `CurveFullLevel.badCharacteristic` (non-example): If char(k) divides N, J[N] need not be constant étale of rank N^{2g}; the stated definition of full étale level does not apply.

**Uses.** StableReductionPartII:MC.4/level-rigidity; StableReductionPartII:MC.4/fine-level-scheme; StableReductionPartII:MC.6/smooth-torelli.

**Acceptance:** N is invertible; level at the characteristic is a different problem.

**Source:** dm, Definitions5.3–5.4 and §5.14,pp.105,108.

#### Rigidity of full curve level

`StableReductionPartII:MC.4/level-rigidity` — theorem.

For a smooth genus-g curve g≥2 over an algebraically closed field with N≥3 prime to the characteristic, an automorphism acting trivially on full N-torsion of its Jacobian is the identity. Consequently the curve full-level stack has trivial inertia.

**Construction/proof.** (1) Use faithfulness of Aut(C)→Aut(J(C),λ), separately from finite curve automorphism groups. (2) Use Serre’s full-level rigidity for finite-order abelian automorphisms: choose an odd prime dividing N or the level-four2-adic case. (3) The exact Serre theorem and its prime-to-characteristic proof are a source-acquisition gap, not supplied merely by the existence of full-level moduli.

**Dependencies:** `StableReductionPartII:MC.4/full-level`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `PELModuli:M6`.

**Acceptance:** N=2 fails because of hyperelliptic[−1].

**Source:** dm, §5.14,p.108.

#### The fine smooth full-level curve scheme

`StableReductionPartII:MC.4/fine-level-scheme` — theorem.

The fixed symplectic component M_g[N] over Z[1/N,ζ_N] is a smooth quasi-projective scheme of relative dimension3g−3, carrying a smooth projective universal curve of genus g. Forgetting level to M_g is representable finite étale. It is regular; geometric irreducibility is the separate connectedness theorem.

**Construction/proof.** (1) The torsion-frame functor is finite étale; pulling back the smooth-curve stack gives the level stack. (2) Trivial inertia makes it an algebraic space; identify its finite coarse map to the smooth coarse space to deduce quasi-projectivity and therefore schemeness. (3) Use the tricanonical universal embedding for projectivity of its curve. (4) Geometric irreducibility requires the distinct connectedness argument below.

**Dependencies:** `StableReductionPartII:MC.4/full-level`, `StableReductionPartII:MC.4/level-rigidity`, `StableReductionPartII:MC.1/smooth-dimension`, `StableReductionPartII:MC.4/coarse-space`, `StableReductionPartII:MC.4/projective-coarse`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `AlgebraicModuliForArithmeticGeometry:R09.2`.

**Acceptance:** This concerns smooth curves; it is not naive full-level representability on all nodal curves.

**Source:** dm, §5.14–5.15,pp.108–109;DGH§6.1,p.23.

#### Connectedness of a pairing component

`StableReductionPartII:MC.4/level-connectedness` — theorem.

Every geometric fibre of the full Jacobi-level scheme over Spec Z[1/N,ζ_N] is connected, hence irreducible by smoothness. The homogeneous-similitude scheme over Z[1/N] is not asserted geometrically connected without fixing the multiplier.

**Construction/proof.** (1) Normalize stable moduli in the finite level cover and apply tame local Kummer normal forms along the normal-crossings boundary to compare component counts in characteristic zero and positive characteristic. (2) Over C use connected Teichmüller space and surjectivity of mapping-class monodromy to Sp_{2g}(Z/N). (3) The Dehn-twist and Teichmüller inputs have no identified owner and are recorded as gaps.

**Dependencies:** `StableReductionPartII:MC.4/fine-level-scheme`, `StableReductionPartII:MC.1/proper-moduli`, `StableReductionPartII:MC.1/normal-crossing-boundary`, `AbelianSchemesAndArithmeticModuli:A3`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

**Acceptance:** The primitive rootζ_N is fixed for the DGH component.

**Source:** dm, Theorems5.9,5.13,5.15;Lemma5.16,pp.106–109.

#### Geometric irreducibility of stable moduli

`StableReductionPartII:MC.4/irreducible-geometric-fibres` — theorem.

For g≥2 every geometric fibre of M̄_g over Spec Z is irreducible and its dense smooth open M_g is geometrically irreducible.

**Construction/proof.** (1) For a residue characteristic p choose level N≥3 prime to p, choosing N=3 except at p=3 where N=4 suffices. (2) The fixed pairing-component fine-level cover is connected and smooth, hence irreducible, and surjects onto smooth moduli. (3) Density of smooth curves in all versal charts gives irreducibility of its stable closure.

**Dependencies:** `StableReductionPartII:MC.4/level-connectedness`, `StableReductionPartII:MC.1/smooth-dimension`, `StableReductionPartII:MC.1/proper-moduli`, `StableReductionPartII:MC.1/normal-crossing-boundary`.

**Acceptance:** One fixed level cannot be used at the primes dividing it.

**Source:** dm, Theorems5.9,5.15 and concluding argument,p.109.

#### Nefness with smooth generic fibre

`StableReductionPartII:MC.4/smooth-generic-direct-image-nef` — theorem.

Let f:X→B be a family of nodal curves of genus g≥2 over a smooth projective curve over an algebraically closed field, with smooth generic fibre. For m≥2, f_*ω^m is nef.

**Construction/proof.** (1) Resolve the isolated rational double points and preserve pluricanonical pushforwards. (2) On a minimal smooth surface over a base of genus≥2, a negative quotient after Frobenius and Serre duality forces H¹ of a negative pluricanonical twist to have dimension≥2. (3) Apply the Mumford–Ekedahl surface vanishing bound: zero except possibly characteristic2,m=2, where it is≤1. (4) Use finite base covers and spreading out to remove the base-genus and characteristic-zero restrictions. All these nonroutine surface inputs are the positivity-extension gap.

**Dependencies:** `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`, `SchemeAndStackFoundations:SF.5`.

**Acceptance:** The exceptional surface bound is sufficient; it is not claimed to be zero.

**Source:** clm, Proposition6.3 and Lemmas6.4–6.5,pp.23–26.

#### Nonnegative dualizing degree along a section

`StableReductionPartII:MC.4/dualizing-section-degree` — theorem.

Under the smooth-generic nef theorem, for any smooth-locus section s:B→X, deg s*ω_{X/B}≥0.

**Construction/proof.** (1) For sufficiently large m the sequence restricting ω^m to s has zero R¹ for ω^m(−s). (2) Thus s*ω^m is a line quotient of f_*ω^m, of nonnegative degree. Divide its degree by m.

**Dependencies:** `StableReductionPartII:MC.4/smooth-generic-direct-image-nef`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Acceptance:** The section must be in the relative smooth locus.

**Source:** clm, Corollary6.6,p.26.

#### Nefness on pointed normalization components

`StableReductionPartII:MC.4/pointed-normalization-nef` — theorem.

Let f:X→B be a nodal family over a smooth projective algebraically closed field curve with smooth connected generic fibre, and s_i disjoint smooth-locus sections. For integers m≥2 and 0≤a_i≤m, f_*ω^m(Σa_i s_i) is nef, including a zero direct image in the negative-degree genus-zero cases.

**Construction/proof.** (1) For genus≥2 add section coefficients inductively; adjunction and nonnegative dualizing section degree make the line quotient nonnegative. (2) For genus0, a negative quotient would produce a divisor contradicting the surface Hodge-index calculation with the disjoint sections. (3) For genus1 use the elliptic-fibration canonical-bundle formula and nonnegative χ from Euler/Noether. These genus0/1 surface inputs are explicit gaps and need a generic owner extension.

**Dependencies:** `StableReductionPartII:MC.4/smooth-generic-direct-image-nef`, `StableReductionPartII:MC.4/dualizing-section-degree`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `SchemeAndStackFoundations:SF.5`.

**Acceptance:** This is a positivity statement for vector bundles, not just numerical degree of their determinants.

**Source:** clm, Proposition6.7,pp.26–28.

#### Direct-image sequence at persistent nodes

`StableReductionPartII:MC.4/persistent-node-residue-sequence` — theorem.

After a finite base change splitting the horizontal nodes of a stable family X/B, normalize along them, ν:X^ν→X, and let D^ν be the two branch divisors. Then ν*ω_{X/B}≅ω_{X^ν/B}(D^ν). For m≥2 there is an exact sequence 0→(fν)_*ω_{X^ν/B}^m((m−1)D^ν)→f_*ω_{X/B}^m→f_*O_D→0, with f_*O_D a direct sum of copies of O_B.

**Construction/proof.** (1) Use the parent conductor/dualizing comparison and the antidiagonal gluing condition on the two branch values. Adjunction gives ω_{X^ν/B}(D^ν)|_{D^ν}≅O_{D^ν}. (2) The componentwise pointed vanishing gives the direct-image exact sequence and its base-change ranks. (3) Descend the two branch quotients to the one O_D quotient using the antidiagonal condition; retain the signs in the m-th tensor power.

**Dependencies:** `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `StableReductionPartII:MC.4/pointed-normalization-nef`, `SchemeAndStackFoundations:SF.1`.

**Acceptance:** The residue sequence concerns a persistently nodal generic fibre; isolated special-fibre nodes use the smooth-generic theorem.

**Source:** clm, Propositions6.8–6.9,pp.28–29.

**To close this layer.**

- Read DM component/tame-cover proof and Serre rigidity sources.
- Read generic CLM positivity background and acquire/decompose the surface inputs; resolve owner extensions and all coarse-cover prerequisites.


### MC.5. Hodge determinant and integral Noether comparison

Construct the rank-g Hodge bundle and its determinant line on the stable stacks and prove pullback, forgetting and clutching comparisons. For g≥2 construct the integral line isomorphism λ¹²≅⟨ω,ω⟩⊗O(Δ), its base-change compatibility and uniqueness up to the global units ±1 on the universal integral stack. For a generically smooth stable family over an integral noetherian base compute the boundary pullback at a trait as the sum of node thicknesses. An equality in rational Chow groups does not substitute for this integral Picard-group identity.

**Status:** partial.

#### The Hodge bundle of stable pointed curves

`StableReductionPartII:MC.5/hodge-bundle` — construction.

For the universal stable pointed family f:C→M̄_{g,n}, define E_{g,n}=f_*ω_{C/M̄}. It is locally free of rank g, including rank zero for g=0, and formation commutes with arbitrary base change with its canonical cocycle. The relative dualizing sheaf is untwisted by the markings.

**Construction/proof.** (1) Relative duality identifies f_*ω with the dual of R¹f_*O_C, whose locally free genus-g and base-change API is supplied by the parent. (2) Descend the sheaf along the atlas using its pullback cocycle.

**Dependencies:** `StableReductionPartII:MC.0/universal-curve`, `StableReductionPartII:MC.2/pointed-dm-theorem`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `SchemeAndStackFoundations:SF.1`.

**API.**

- `CurveHodgeBundle.fiber` (characterisation): At a geometric curve the fibre is H⁰(C,ω_C), of dimension g.
- `CurveHodgeBundle.baseChange` (functoriality): For a classifying family C/S the pullback is f_*ω_{C/S}.
- `CurveHodgeBundle.duality` (compatibility): E_{g,n}≅(R¹f_*O_C)∨, with the parent’s Serre-duality convention.

**Discriminating tests.**

- `CurveHodgeBundle.genusZero` (computation): E₀,ₙ has rank zero on the stable genus-zero range.
- `CurveHodgeBundle.genusTwo` (computation): E₂,ₙ has rank2; it is not an invertible sheaf.
- `CurveHodgeBundle.nonseparatingNode` (compatibility): For the nodal rational genus-one boundary, the Hodge fibre is one-dimensional, generated by the differential with opposite residues at the two normalization branches.

**Uses.** StableReductionPartII:MC.5/hodge-determinant; StableReductionPartII:MC.5/hodge-forgetting; StableReductionPartII:MC.5/separating-hodge; StableReductionPartII:MC.5/nonseparating-hodge; StableReductionPartII:MC.6/jacobian-hodge-comparison.

**Acceptance:** Adding markings does not change the fibre Hodge rank.

**Source:** knudsen3, §4(b),p.201;Yuan§3.1.1,p.41.

#### The Hodge determinant line

`StableReductionPartII:MC.5/hodge-determinant` — construction.

Define λ_{g,n}=det E_{g,n}=∧^g E_{g,n}, using det of the rank-zero sheaf as the trivial line. It is an invertible sheaf on the stable stack with the induced base-change cocycle. In the Yuan interfaces λ always means this line; E is the rank-g vector bundle.

**Construction/proof.** (1) Apply the generic determinant functor to the finite locally free Hodge bundle. (2) Use its naturality and tensor/determinant identities for descent.

**Dependencies:** `StableReductionPartII:MC.5/hodge-bundle`, `SchemeAndStackFoundations:SF.5`.

**API.**

- `CurveHodgeLine.definition` (characterisation): λ=∧^g f_*ω.
- `CurveHodgeLine.baseChange` (functoriality): A classifying family pulls λ back to det f_*ω_{C/S}.
- `CurveHodgeLine.rankZero` (simp): The determinant of the genus-zero rank-zero Hodge bundle is O.

**Discriminating tests.**

- `CurveHodgeLine.genusZero` (computation): λ₀,ₙ≅O on every stable genus-zero pointed stack.
- `CurveHodgeLine.genusOne` (compatibility): In genus one λ=E is the invariant-differential line.
- `CurveHodgeLine.genusTwoRank` (non-example): In genus two λ has rank1 and E has rank2; identifying them is a type error.

**Uses.** StableReductionPartII:MC.5/hodge-forgetting; StableReductionPartII:MC.5/separating-hodge; StableReductionPartII:MC.5/nonseparating-hodge; StableReductionPartII:MC.5/rational-noether; StableReductionPartII:MC.5/integral-noether; StableReductionPartII:MC.6/jacobian-hodge-comparison; StableReductionPartII:MC.6/compactified-torelli; StableReductionPartII:MC.6/maximal-variation-hodge.

**Acceptance:** The line and the vector bundle are different for g≥2.

**Source:** yuan-author-http, §3.1.1,p.41.

#### Hodge pullback under forgetting

`StableReductionPartII:MC.5/hodge-forgetting` — theorem.

For π:M̄_{g,n+1}→M̄_{g,n}, π*E_{g,n}≅E_{g,n+1} and therefore π*λ_{g,n}≅λ_{g,n+1}, canonically with coherent repeated forgetting.

**Construction/proof.** (1) Use the parent’s universally trivial O-pushforward and zero R¹ along the rational contraction. (2) Compare R¹O on the two families by Leray, dualize and take determinants.

**Dependencies:** `StableReductionPartII:MC.5/hodge-bundle`, `StableReductionPartII:MC.5/hodge-determinant`, `StableReductionPartII:MC.2/forget`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Acceptance:** There is no cotangent-tail correction in the Hodge pullback.

**Source:** knudsen3, Theorem4.1(a),p.202.

#### Hodge determinant under separating clutching

`StableReductionPartII:MC.5/separating-hodge` — theorem.

Under separating clutching, ξ*E_g≅pr₁*E_{g₁}⊕pr₂*E_{g₂}, hence ξ*λ_g≅pr₁*λ_{g₁}⊗pr₂*λ_{g₂}. The isomorphism is equivariant for permitted graph exchanges using the determinant convention.

**Construction/proof.** (1) The normalization exact sequence for O has no new graph-cycle H¹ in the separating case. (2) Dualize the cohomology decomposition and take the determinant.

**Dependencies:** `StableReductionPartII:MC.5/hodge-bundle`, `StableReductionPartII:MC.5/hodge-determinant`, `StableReductionPartII:MC.3/separating-clutching`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Acceptance:** The ranks add as g=g₁+g₂.

**Source:** knudsen3, Theorem4.2(a),p.203.

#### Hodge determinant under self-clutching

`StableReductionPartII:MC.5/nonseparating-hodge` — theorem.

For ξ_irr there is an exact sequence0→E_{g−1,n+2}→ξ_irr*E_{g,n}→O→0 with the last map the residue at an ordered branch. It gives ξ_irr*λ_g≅λ_{g−1,n+2}. Exchanging the two branches negates the residue; the induced equivariant determinant data must retain this sign when descending to the unlabelled graph quotient.

**Construction/proof.** (1) Use the parent residue description of nodal dualizing forms; opposite residues give one additional one-dimensional quotient. (2) Use determinant exact-sequence multiplicativity; record the effect of branch exchange on the chosen residue trivialization.

**Dependencies:** `StableReductionPartII:MC.5/hodge-bundle`, `StableReductionPartII:MC.5/hodge-determinant`, `StableReductionPartII:MC.3/nonseparating-clutching`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Acceptance:** The determinant identity does not identify the two Hodge vector bundles, whose ranks differ by one.

**Source:** knudsen3, Theorem4.2(a),p.203.

#### The universal boundary Cartier divisor

`StableReductionPartII:MC.5/boundary-divisor` — construction.

For g≥2 let Δ be the effective Cartier divisor M̄_g minus M_g, with coefficient1 on each reduced local node branch. Its global decomposition is Δ=Σ_{i=0}^{⌊g/2⌋}Δᵢ according to the one-edge unpointed types. For a generically smooth stable family over an integral noetherian S, its pullback is an effective Cartier divisor Δ_S; arbitrary families mapping entirely into Δ do not have this effective-Cartier pullback.

**Construction/proof.** (1) Use the local product of the independent node parameters. (2) Collect branches into their global genus types while preserving multiplicity one. (3) For an integral generically smooth base the pulled-back local equation is nonzero, hence a non-zero-divisor.

**Dependencies:** `StableReductionPartII:MC.1/normal-crossing-boundary`, `StableReductionPartII:MC.3/boundary-types`, `StableReductionPartII:MC.2/pointed-dm-theorem`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**API.**

- `CurveBoundary.localEquation` (characterisation): Étale locally Δ has equation∏tᵢ.
- `CurveBoundary.types` (data): The unpointed components are Δ₀ and the separating Δᵢ up to genus exchange.
- `CurveBoundary.familyPullback` (functoriality): Pullback to an integral generically smooth stable family is the corresponding effective Cartier divisor.

**Discriminating tests.**

- `CurveBoundary.smoothFamily` (computation): For an everywhere smooth family Δ_S=0.
- `CurveBoundary.constantNodalFamily` (non-example): For a constant nodal family the pullback equation is zero; there is no effective Cartier divisor on the base defined by that equation.
- `CurveBoundary.twoNodes` (computation): For a versal curve with two nodes the local boundary equation is t₁t₂, including when both nodes belong to Δ₀.

**Uses.** StableReductionPartII:MC.5/rational-noether; StableReductionPartII:MC.5/integral-noether; StableReductionPartII:MC.5/semi-canonical-noether; StableReductionPartII:MC.5/boundary-thickness.

**Acceptance:** Generically smooth is required for the family divisor.

**Source:** yuan-author-http, §3.1.1–3.1.2,pp.41–43.

#### Rational Noether identity

`StableReductionPartII:MC.5/rational-noether` — theorem.

For the universal stable genus-g family g≥2,12c₁(λ)=f_*(c₁(ω)²)+[Δ] in codimension-one Chow groups with rational coefficients. The node correction is coefficient1 per universal smoothing branch.

**Construction/proof.** (1) Use the lci relative cotangent complex, not an unjustified smooth-morphism GRR hypothesis. (2) In the universal local chart xy=t, the natural map Ω¹→ω has cokernel supported on the singular locus with the node contribution to its second Chern class. (3) Apply source-scoped GRR and extract degree one; R¹f_*ω≅O gives no determinant correction.

**Dependencies:** `StableReductionPartII:MC.5/hodge-determinant`, `StableReductionPartII:MC.5/boundary-divisor`, `StableReductionPartII:MC.1/versal-node-parameters`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `SchemeAndStackFoundations:SF.5`.

**Acceptance:** A rational Chow identity alone is not the integral Picard identity.

**Source:** mumford1977, Theorem5.10 calculation,pp.100–102.

#### Torsion freeness of the stable-stack Picard group

`StableReductionPartII:MC.5/complex-picard-torsion-free` — theorem.

For g≥2 Pic(M̄_{g,C}) is torsion free. A torsion line gives a finite cyclic cover of the stack. Over Teichmüller space this cover splits; its character factors through the mapping-class group, and extending over every boundary kills each Dehn-twist generator, so the cover and line are trivial.

**Construction/proof.** (1) The proof uses connected simply connected Teichmüller space, the analytic presentation of the smooth stack and generation by Dehn twists. These general analytic inputs have no verified atlas supplier and are recorded as gaps. (2) Use the one-node smoothing monodromy to identify the boundary loop with the corresponding Dehn twist. (3) Since the cover extends over that divisor, its cyclic monodromy on the loop vanishes; all generators vanish.

**Dependencies:** `StableReductionPartII:MC.1/finite-unramified-diagonal`, `StableReductionPartII:MC.1/normal-crossing-boundary`, `AlgebraicModuliForArithmeticGeometry:R09.4`.

**Acceptance:** Retain stack stabilizers; passing first to the coarse space is not this proof.

**Source:** mumford1977, Lemma5.14 proof,pp.103–105.

#### Integral-to-complex Picard injection

`StableReductionPartII:MC.5/integral-picard-injection` — theorem.

For g≥2 restriction Pic(M̄_{g,Z})→Pic(M̄_{g,C}) is injective. A line trivial over C is generically trivial; on the smooth integral stack with geometrically irreducible fibres its vertical divisor is a sum of whole prime fibres, hence principal on Spec Z.

**Construction/proof.** (1) Use coherent proper base change to descend a nonzero trivializing section to the rational generic fibre. (2) Extend it as a rational section; its zero and pole divisors are vertical. (3) Every codimension-one vertical component is a whole prime fibre, and an integer rational function removes their multiplicities. (4) This uses geometric irreducibility of stable moduli; the source’s §3/§5 component argument is not replaced by mere smoothness.

**Dependencies:** `StableReductionPartII:MC.1/proper-moduli`, `StableReductionPartII:MC.1/smooth-dimension`, `StableReductionPartII:MC.4/irreducible-geometric-fibres`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `SchemeAndStackFoundations:SF.5`.

**Acceptance:** Global units after the resulting trivialization are±1.

**Source:** mumford1977, paragraph after Lemma5.14,pp.102–103.

#### Integral universal Noether formula

`StableReductionPartII:MC.5/integral-noether` — theorem.

For g≥2 there is an isomorphism of invertible sheaves on M̄_{g,Z}:λ^{⊗12}≅⟨ω,ω⟩⊗O(Δ). The relative Deligne pairing is a line on the base; its first Chern class is f_*(c₁ω·c₁ω). This is an integral Picard-group identity, natural under classifying pullback.

**Construction/proof.** (1) Use the generic Deligne-pairing construction and its c₁ comparison; this generic line-valued input requires an owner extension and is explicitly a gap. (2) The rational GRR identity makes the difference line torsion. (3) Torsion freeness over C and the integral Picard injection remove the ambiguity, yielding a global line isomorphism. (4) Pull back the universal isomorphism to a family; this step is not a fresh application of rational GRR on that family.

**Dependencies:** `StableReductionPartII:MC.5/rational-noether`, `StableReductionPartII:MC.5/complex-picard-torsion-free`, `StableReductionPartII:MC.5/integral-picard-injection`, `StableReductionPartII:MC.5/hodge-determinant`, `StableReductionPartII:MC.5/boundary-divisor`, `SchemeAndStackFoundations:SF.5`.

**Acceptance:** The coefficient of Δ is+1 and the power on λ is12.

**Source:** yuan-author-http, Theorem3.3 and §3.1.2,p.42.

#### Global units on integral stable moduli

`StableReductionPartII:MC.5/universal-units` — theorem.

For g≥2, Γ(M̄_{g,Z},O)=Z and Γ(M̄_{g,Z},O×)={±1}. This follows from properness, smoothness and geometrically connected fibres with cohomology/base change.

**Construction/proof.** (1) Use the universally connected proper-fibre O-pushforward comparison and the base Spec Z. (2) Take units of Z; do not replace the integral base by an arbitrary field, where more units exist.

**Dependencies:** `StableReductionPartII:MC.1/proper-moduli`, `StableReductionPartII:MC.1/smooth-dimension`, `StableReductionPartII:MC.4/irreducible-geometric-fibres`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `AlgebraicModuliForArithmeticGeometry:R09.4`.

**Acceptance:** Over C the global units include all of C×.

**Source:** yuan-author-http, §3.1.2,p.42.

#### Semi-canonical Noether comparison

`StableReductionPartII:MC.5/semi-canonical-noether` — definition.

For a stable genus-g family g≥2 over an integral noetherian S, generically smooth, call a Noether line isomorphism semi-canonical when it is the pullback of a chosen universal integral isomorphism on M̄_{g,Z}. All such isomorphisms differ by multiplication by±1. This compares choices of universal isomorphism; arbitrary line isomorphisms on S may differ by other units.

**Construction/proof.** (1) Specify the universal source of the chosen line isomorphism and pull it back along the classifying morphism. (2) Use the universal-unit theorem to compare choices.

**Dependencies:** `StableReductionPartII:MC.5/integral-noether`, `StableReductionPartII:MC.5/universal-units`, `StableReductionPartII:MC.5/boundary-divisor`.

**API.**

- `SemiCanonicalNoether.pullback` (functoriality): A compatible base change pulls back the chosen universal Noether isomorphism.
- `SemiCanonicalNoether.sign` (characterisation): Two choices from the universal integral stack differ by±1.
- `SemiCanonicalNoether.line` (compatibility): Its underlying line equality isλ_S¹²≅⟨ω_{C/S},ω_{C/S}⟩⊗O(Δ_S).

**Discriminating tests.**

- `SemiCanonicalNoether.smoothFamily` (degenerate): For a smooth family the comparison has no boundary line factor.
- `SemiCanonicalNoether.extraUnits` (non-example): Over S=Spec C multiplying the line isomorphism by2 yields another isomorphism but not a second universal integral choice.
- `SemiCanonicalNoether.signAmbiguity` (characterisation): Negating the chosen universal isomorphism gives exactly the other sign choice.

**Uses.** PAPER-YUAN-26 routed moduli requirements.

**Acceptance:** Do not infer Γ(S,O×)={±1}.

**Source:** yuan-author-http, §3.1.2,pp.42–43.

#### Boundary multiplicity equals node thickness

`StableReductionPartII:MC.5/boundary-thickness` — theorem.

Let S be normal integral noetherian and a stable genus-g family g≥2 be generically smooth. At a codimension-one point v, after a finite unramified extension splitting the special-fibre nodes, write xy=π^{m(x)} up to a unit at each node. Then ord_v Δᵢ=Σ_{i(x)=i}m(x), and ord_v Δ=Σ_x m(x). Before splitting, descend this formula with the residue-degree multiplicities of the closed node points.

**Construction/proof.** (1) Pull the product of the universal node smoothing parameters back to the trait. (2) The local valuation of each factor is its thickness; sum the factors of the same genus type. (3) Use unramified invariance and descent of Cartier-divisor multiplicities.

**Dependencies:** `StableReductionPartII:MC.5/boundary-divisor`, `StableReductionPartII:MC.1/versal-node-parameters`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`, `SchemeAndStackFoundations:SF.5`.

**Acceptance:** A node of thickness m contributes m, not1.

**Source:** yuan-author-http, §3.1.2,p.43.

**To close this layer.**

- Acquire generic integral Deligne-pairing/determinant constructions and comparison source.
- Resolve topology/Picard injection inputs and supply stack-valued line signatures; retain the rational-versus-integral distinction.


### MC.6. Stable compactifications and Torelli

For an integral quasi-projective S over Z or a field with a stable genus-g family (g≥2), produce a dominant finite cover S′→S and a projective integral compactification carrying a stable extension, by retaining the base in a graph closure. Construct the smooth full-level Torelli map and its Cartesian universal-Jacobian comparison, finite fibres with the ±level ambiguity and the genus-two exception. Construct the compactified Torelli map to the minimal Siegel compactification and its Hodge pullback. For maximal variation deduce nefness and bigness of the pulled-back Hodge line, using generic finiteness rather than a globally finite smooth Torelli morphism.

**Status:** partial.

#### Maximal variation of a curve family

`StableReductionPartII:MC.6/maximal-variation` — definition.

For an integral finite-type base S over a field and a smooth genus-g family, g≥2, maximal variation means that the coarse classifying map S→M_g^{coarse} is generically quasi-finite onto its image. The definition uses geometric curve isomorphism classes, not choices of frames or markings.

**Construction/proof.** (1) Take the coarse classifying map and require dimension of its geometric generic fibre over its image to be zero.

**Dependencies:** `StableReductionPartII:key/moduli-curves`, `StableReductionPartII:MC.4/coarse-space`.

**API.**

- `CurveMaximalVariation.dimension` (characterisation): The image dimension equals dim S.
- `CurveMaximalVariation.finiteCover` (compatibility): A finite dominant change of integral base preserves maximal variation.
- `CurveMaximalVariation.coarse` (projection): The condition is checked on the coarse classifying map.

**Discriminating tests.**

- `CurveMaximalVariation.constant` (non-example): A constant family on a positive-dimensional integral base fails maximal variation.
- `CurveMaximalVariation.point` (degenerate): A family on an integral zero-dimensional field base has maximal variation.
- `CurveMaximalVariation.frameTorsor` (non-example): The positive-dimensional projective-frame torsor of one fixed curve is not maximal variation.

**Uses.** StableReductionPartII:MC.6/maximal-variation-hodge.

**Acceptance:** An isotrivial family over a positive-dimensional base does not have maximal variation.

**Source:** yuan-author-http, Introduction,p.2;§3.4,p.56.

#### Stable compactification of a smooth family

`StableReductionPartII:MC.6/stable-compactification` — definition.

For k a field or Z, an integral quasi-projective k-scheme S and a smooth genus-g family X/S, g≥2, a stable compactification consists of a projective integral k-scheme S̄ containing S as a dense open, a stable family X̄/S̄, and a Cartesian comparison X≅X̄×_{S̄}S. The open immersion on total spaces is the one induced by this comparison.

**Construction/proof.** (1) Specify a projective compactification of the base and a stable extension restricting to the given family, including its classifying isomorphism.

**Dependencies:** `StableReductionPartII:key/moduli-curves`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`, `SchemeAndStackFoundations:SF.0`.

**API.**

- `StableCurveCompactification.base` (data): S̄ is projective integral and S→S̄ is a dense open immersion.
- `StableCurveCompactification.restrict` (compatibility): The square of families over S→S̄ is Cartesian.
- `StableCurveCompactification.hodge` (functoriality): The extended Hodge line restricts to the Hodge line of the original family.

**Discriminating tests.**

- `StableCurveCompactification.alreadyProjective` (degenerate): A smooth family over a projective integral base admits the identity compactification.
- `StableCurveCompactification.trait` (compatibility): Over a discrete valuation test base, stable reduction supplies the stable extension after the allowed finite field extension.
- `StableCurveCompactification.constantBase` (non-example): Closing the constant classifying image in a moduli cover cannot compactify a positive-dimensional base.

**Uses.** StableReductionPartII:MC.6/graph-closure; StableReductionPartII:MC.6/stable-compactification-exists.

**Acceptance:** The base compactification is part of the data.

**Source:** yuan-author-http, §3.1.4,p.45.

#### Graph-closure compactification after a finite cover

`StableReductionPartII:MC.6/graph-closure` — construction.

Choose a projective compactification S̄₀ of S and the normal projective finite scheme cover V→M̄_g. Let W=S×_{M̄_g}V, choose a reduced irreducible component W₀ dominating S, and normalize it to S′. In S̄₀×V close the finite image of W₀, then normalize that integral closure in the finite function-field extension K(W₀) to obtain S̄′. The resulting S′ is the inverse image of S under S̄′→S̄₀, and the family pulled back from V extends X×_S S′.

**Construction/proof.** (1) W is finite surjective over S because the cover map is representable finite. A component dominates the generic point of integral S. (2) The map W→S×V is finite, as the pullback of the finite diagonal of M̄_g. It need not be a monomorphism: the chosen isomorphism of the two curve families is part of W. (3) Close its finite image in the projective product, preserving the S̄₀-coordinate and then its function field K(W₀); normalization in a finite extension is finite over the excellent finite-type base. (4) Because W₀ is finite over its image, normalization over the open S in K(W₀) is the normalization of W₀; the extension family is obtained from the second projection to V.

**Dependencies:** `StableReductionPartII:MC.6/stable-compactification`, `StableReductionPartII:MC.4/finite-projective-cover`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `SchemeAndStackFoundations:SF.0`.

**API.**

- `CurveGraphClosure.finiteCover` (projection): S′→S is finite dominant and surjective.
- `CurveGraphClosure.projective` (characterisation): S̄′ is normal integral projective over k.
- `CurveGraphClosure.family` (compatibility): The stable family on S̄′ restricts to X×_S S′.

**Discriminating tests.**

- `CurveGraphClosure.constant` (non-example): For a constant family on A¹, S̄₀×V retains the A¹ direction; closing only in V loses it.
- `CurveGraphClosure.integralComponent` (degenerate): If W is reducible, take a component dominating S rather than assert that all of W is integral.
- `CurveGraphClosure.openNormalization` (compatibility): Normalization commutes with restriction to the open inverse image of S.

**Uses.** StableReductionPartII:MC.6/stable-compactification-exists.

**Acceptance:** The graph retains the base coordinate even for a constant family.

**Source:** yuan-author-http, §3.1.4,p.45, final paragraph (corrected graph closure).

#### Existence after a finite dominant base change

`StableReductionPartII:MC.6/stable-compactification-exists` — theorem.

Every smooth genus-g family g≥2 over an integral quasi-projective scheme over a field or Z admits a stable compactification after a finite surjective morphism S′→S with S′ normal integral.

**Construction/proof.** (1) Use the graph construction and its stable pullback family. (2) The closed finite image of the dominating component contains the generic point of S and hence all of S.

**Dependencies:** `StableReductionPartII:MC.6/graph-closure`, `StableReductionPartII:MC.6/stable-compactification`.

**Acceptance:** No maximal-variation hypothesis is needed.

**Source:** yuan-author-http, §3.1.4,pp.45–46.

#### A stable compactification for the fine level family

`StableReductionPartII:MC.6/level-stable-compactification` — theorem.

The universal smooth family over a fixed full-level component M_g[N] has a stable compactification after a finite dominant cover. Choose a projective coarse compactification, close the graph into a stable moduli scheme cover and normalize as above. Do not assert that the boundary represents naive full torsion frames of every stable Jacobian.

**Construction/proof.** (1) Apply the general graph-closure theorem to the quasi-projective integral fine-level component, after geometric component choice as required. (2) Keep the stable extension and the dense-open level interpretation distinct.

**Dependencies:** `StableReductionPartII:MC.4/fine-level-scheme`, `StableReductionPartII:MC.6/stable-compactification-exists`.

**Acceptance:** N remains invertible on the original level base.

**Source:** yuan-author-http, §3.1.4,p.46.

#### The smooth full-level Torelli morphism

`StableReductionPartII:MC.6/smooth-torelli` — construction.

Over the fixed pairing base and for g≥2, form τ:M_g[N]→A_g[N] by the relative Jacobian with its canonical principal polarization and induced full level. The pullback of the universal abelian scheme is canonically Jac(C_g/M_g[N]); in particular the square of abelian schemes is Cartesian.

**Construction/proof.** (1) Use the relative smooth-curve Jacobian, canonical principal polarization and arbitrary-base-change comparisons. Their family representability belongs to a proposed JacobianChallenge Part II, not to a field-only Picard theorem. (2) The fine ppav universal property yields τ and the Cartesian family isomorphism.

**Dependencies:** `StableReductionPartII:MC.4/fine-level-scheme`, `StableReductionPartII:MC.4/full-level`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `SchemeAndStackFoundations:SF.3`, `PELModuli:M5`, `PELModuli:M6`.

**API.**

- `CurveTorelli.map` (projection): τ sends (C,α) to (J(C),λ_C,α).
- `CurveTorelli.cartesian` (compatibility): τ* of the universal ppav is the relative Jacobian of the universal curve.
- `CurveTorelli.hodge` (compatibility): τ* of the ppav Hodge determinant is det f_*ω of the curve family.

**Discriminating tests.**

- `CurveTorelli.dimension` (computation): In genus2 both smooth moduli and ppav moduli have dimension3.
- `CurveTorelli.minusLevel` (non-example): For nonhyperelliptic genus≥3, (C,α) and (C,−α) can be distinct curve-level objects although their ppav-level images are isomorphic.
- `CurveTorelli.hyperelliptic` (compatibility): The hyperelliptic involution realizes sign change of level on the curve.

**Uses.** StableReductionPartII:MC.6/torelli-finite-fibres; StableReductionPartII:MC.6/jacobian-hodge-comparison.

**Acceptance:** The curve-to-Jacobian construction is not AbelianSchemes duality.

**Source:** dgh, §6.1,pp.23–24.

#### Finite Torelli fibres and the sign ambiguity

`StableReductionPartII:MC.6/torelli-finite-fibres` — theorem.

On geometric points the smooth full-level Torelli morphism has fibres of size at most2. On nonhyperelliptic curves the two objects (C,α) and (C,−α) are distinct for N≥3; for hyperelliptic curves they are isomorphic. Since every smooth genus-two curve is hyperelliptic, the genus-two map is injective on geometric points. Finite fibres do not imply the smooth Torelli map is a finite morphism.

**Construction/proof.** (1) Import strong classical Torelli: a ppav isomorphism of Jacobians equals ± the Jacobian of a curve isomorphism, with the hyperelliptic qualification. (2) Apply the pairing-level compatibility; on a nonhyperelliptic curve there is no curve automorphism inducing −1. (3) For genus2 use the hyperelliptic double cover. All named classical curve/Jacobian facts require the proposed owner extension.

**Dependencies:** `StableReductionPartII:MC.6/smooth-torelli`, `StableReductionPartII:MC.4/level-rigidity`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`.

**Acceptance:** The blanket claim of noninjectivity for every g≥2 is excluded.

**Source:** milne, Theorem12.1 and proof §§12–13,pp.37–45;DGH§6.1,p.24.

#### Curve Hodge and Jacobian invariant differentials

`StableReductionPartII:MC.6/jacobian-hodge-comparison` — theorem.

For a smooth proper genus-g family f:C→S whose relative Jacobian J/S exists with base change, the canonical Lie comparison Lie(J/S)≅R¹f_*O_C dualizes to f_*ω_{C/S}≅e*Ω¹_{J/S}. Taking determinants identifies the curve Hodge line with the ppav Hodge line.

**Construction/proof.** (1) Identify the tangent functor of relative Pic⁰ with H¹(O) using first-order units; import the family version from the Jacobian extension. (2) Use curve Serre duality and invariant differentials on the abelian scheme.

**Dependencies:** `StableReductionPartII:MC.5/hodge-bundle`, `StableReductionPartII:MC.5/hodge-determinant`, `StableReductionPartII:MC.6/smooth-torelli`, `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `AbelianSchemesAndArithmeticModuli:A1`.

**Acceptance:** This is a canonical algebraic line comparison; metric equality is supplied by the Arakelov owner.

**Source:** yuan-author-http, Lemma3.4 and proof,pp.43–44.

#### The compactified Torelli and Hodge comparison

`StableReductionPartII:MC.6/compactified-torelli` — theorem.

Over an algebraically closed field k, the coarse stable curve moduli admits a morphism t̄:M̄_g^{coarse}→A_g^{min} extending smooth Torelli. On a stable curve it uses the abelian part of the generalized Jacobian and maps to the corresponding minimal-compactification stratum. The descended rational Hodge line satisfies λ_coarse=t̄*ω_min, with ω_min ample.

**Construction/proof.** (1) Use the stable-family generalized Jacobian as a semiabelian scheme and its degeneration data; reducible-curve relative Pic⁰ is a Jacobian-owner extension gap. (2) Use the minimal Siegel extension theorem and descended rational automorphic Hodge line; the all-characteristic unlevel statement needs a scoped supplier extension, not an unsupported assertion from good-prime level moduli. (3) Check the extension and line comparison on the boundary with the source’s abelian-part interpretation and descent.

**Dependencies:** `StableReductionPartII:MC.4/coarse-space`, `StableReductionPartII:MC.5/hodge-determinant`, `StableReductionPartII:MC.6/jacobian-hodge-comparison`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `ShimuraCompactifications:C4`, `ShimuraCompactifications:C5`.

**Acceptance:** The entire semiabelian Jacobian is not an abelian scheme at a non-compact-type node.

**Source:** knudsen3, §6,p.211;Yuan§3.4,p.56.

#### Nef and big Hodge line for maximal variation

`StableReductionPartII:MC.6/maximal-variation-hodge` — theorem.

Let k be a field, S̄ normal integral projective over k, and f:X̄→S̄ a stable genus-g family g≥2 with smooth restriction over a dense open S. If that smooth family has maximal variation, λ_{S̄}=det f_*ω is nef and big. No maximal-variation conclusion is asserted for an isotrivial positive-dimensional family.

**Construction/proof.** (1) After a finite field or level-cover change use the compactified Torelli and ample rational Hodge line on the minimal Siegel compactification. (2) The composite classifying map is generically finite onto its image by maximal variation and finite Torelli fibres. (3) The pullback of an ample line along a projective generically finite map is nef and big; descend nefness/bigness through the finite cover.

**Dependencies:** `StableReductionPartII:MC.6/maximal-variation`, `StableReductionPartII:MC.6/compactified-torelli`, `StableReductionPartII:MC.6/torelli-finite-fibres`, `StableReductionPartII:MC.5/hodge-determinant`, `SchemeAndStackFoundations:SF.5`.

**Acceptance:** Only finite fibres on the smooth locus are used.

**Source:** yuan-author-http, §3.4,pp.55–56.

**To close this layer.**

- Resolve relative Jacobian, strong Torelli, all-characteristic minimal ppav compactification and Hodge supplier extensions.
- Complete formal signatures and generic finite-pullback nef/big dependencies; graph closure is specified with both the base and K(W₀).


### MC.7. Level Picard parameters and consumer interfaces

For a fixed genus g≥2, level N≥3 invertible and degree d∈Z define the level-Picard parameter functor and compare it with relative Picᵈ of the universal smooth curve. Keep the fppf-sheafified Picard functor distinct from globally existing line bundles; identify triples only over algebraically closed fields or under the explicit Brauer-obstruction vanishing condition. Export the moduli and family interfaces to the six key-definition consumers, without rebuilding their Hurwitz stacks, mapping-class groups or tautological Chow rings.

**Status:** partial.

#### The degree-d level Picard parameter functor

`StableReductionPartII:MC.7/level-picard-parameter` — definition.

For g≥2, N≥3 invertible with a fixed pairing component, and d∈Z, define the parameter sheaf P_g,N^d=Pic^d_{C_g/M_g[N]} on the fppf site. It parametrizes sheafified relative degree-d line classes on the universal smooth curve. An algebraically closed field point corresponds to a triple (C,α,L) up to curve-level isomorphism and line-bundle isomorphism. Over a general base T the sheaf class can have a Brauer obstruction to a globally existing line bundle; the triple groupoid and this sheaf are distinct.

**Construction/proof.** (1) Pull back the relative Picard sheaf of the universal curve, including the degree decomposition and arbitrary-base-change comparison. (2) The Jacobian extension must supply representability of Picᵈ as a torsor under Pic⁰; it does not assert a universal line without rigidification. (3) Over an algebraically closed field the Brauer obstruction vanishes, giving the stated triples.

**Dependencies:** `StableReductionPartII:MC.4/fine-level-scheme`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `SchemeAndStackFoundations:SF.3`.

**API.**

- `LevelPicardParameter.fiber` (characterisation): The fibre over a smooth curve-level point is its degree-d Picard scheme.
- `LevelPicardParameter.torsor` (structure): Picᵈ is a torsor under the relative Jacobian; there need not be a canonical origin.
- `LevelPicardParameter.obstruction` (compatibility): A sheaf point is represented by an actual line bundle exactly when its Brauer obstruction vanishes.

**Discriminating tests.**

- `LevelPicardParameter.degreeZero` (computation): For d=0 the relative Picard component is the Jacobian with its canonical origin.
- `LevelPicardParameter.sectionRigidification` (compatibility): A chosen section permits rigidification and a Poincaré line; the unpointed universal family is not assumed to have that section.
- `LevelPicardParameter.scalarInertia` (non-example): The groupoid of triples has G_m scalar automorphisms of L; it cannot be identified with the represented Picard sheaf as a groupoid.

**Uses.** StableReductionPartII:MC.7/picard-triples-comparison.

**Acceptance:** The Picard parameter is a sheaf of classes, not the automorphism groupoid of line bundles.

**Source:** yuan-author-http, §4.5,pp.73–75.

#### Geometric triples and the Picard sheaf

`StableReductionPartII:MC.7/picard-triples-comparison` — theorem.

For an algebraically closed field k in which N is invertible, geometric points of P_g,N^d identify with isomorphism classes of curve-level-line triples. For general bases retain the fppf sheafification and the obstruction/rigidification distinction; the existence of the parameter scheme does not produce a tautological line on every pulled-back curve.

**Construction/proof.** (1) Use relative Picard representability and its line-lifting obstruction sequence. (2) Use Br(k)=0 for algebraically closed k and full-level rigidity.

**Dependencies:** `StableReductionPartII:MC.7/level-picard-parameter`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `SchemeAndStackFoundations:SF.1`.

**Acceptance:** Scalar automorphisms disappear only after passage to classes.

**Source:** yuan-author-http, §4.5,pp.73–75.

**To close this layer.**

- Resolve relative Picᵈ representability and the Brauer obstruction API in the Jacobian owner extension.
- Supply actual sheaf/groupoid Lean signatures and verify each routed Yuan/DGH and key-definition consumer export.

## Routed consumer coverage

| Item | Planned nodes | Qualification |
|---|---|---|
| PAPER-YUAN-26/2 | `StableReductionPartII:MC.6/maximal-variation` | The stated target is planned; the exact unresolved dependencies are in gaps and stage remaining lists. |
| PAPER-YUAN-26/69 | `StableReductionPartII:key/moduli-curves`; `StableReductionPartII:MC.0/universal-curve` | The stated target is planned; the exact unresolved dependencies are in gaps and stage remaining lists. |
| PAPER-YUAN-26/70 | `StableReductionPartII:MC.1/smooth-dimension` | The stated target is planned; the exact unresolved dependencies are in gaps and stage remaining lists. |
| PAPER-YUAN-26/71 | `StableReductionPartII:MC.5/hodge-bundle`; `StableReductionPartII:MC.5/hodge-determinant` | The stated target is planned; the exact unresolved dependencies are in gaps and stage remaining lists. |
| PAPER-YUAN-26/72 | `StableReductionPartII:MC.3/boundary-types`; `StableReductionPartII:MC.5/boundary-divisor` | The stated target is planned; the exact unresolved dependencies are in gaps and stage remaining lists. |
| PAPER-YUAN-26/73 | `StableReductionPartII:MC.5/integral-noether` | The stated target is planned; the exact unresolved dependencies are in gaps and stage remaining lists. |
| PAPER-YUAN-26/74 | `StableReductionPartII:MC.5/semi-canonical-noether` | The stated target is planned; the exact unresolved dependencies are in gaps and stage remaining lists. |
| PAPER-YUAN-26/75 | `StableReductionPartII:MC.5/boundary-thickness` | The stated target is planned; the exact unresolved dependencies are in gaps and stage remaining lists. |
| PAPER-YUAN-26/82 | `StableReductionPartII:MC.6/stable-compactification` | The stated target is planned; the exact unresolved dependencies are in gaps and stage remaining lists. |
| PAPER-YUAN-26/83 | `StableReductionPartII:MC.6/graph-closure`; `StableReductionPartII:MC.6/stable-compactification-exists` | The stated target is planned; the exact unresolved dependencies are in gaps and stage remaining lists. |
| PAPER-YUAN-26/84 | `StableReductionPartII:MC.4/finite-projective-cover` | The stated target is planned; the exact unresolved dependencies are in gaps and stage remaining lists. |
| PAPER-YUAN-26/85 | `StableReductionPartII:MC.4/fine-level-scheme`; `StableReductionPartII:MC.6/level-stable-compactification` | The stated target is planned; the exact unresolved dependencies are in gaps and stage remaining lists. |
| PAPER-YUAN-26/107 | `StableReductionPartII:MC.6/maximal-variation-hodge` | The stated target is planned; the exact unresolved dependencies are in gaps and stage remaining lists. |
| PAPER-YUAN-26/134 | `StableReductionPartII:MC.4/full-level`; `StableReductionPartII:MC.7/level-picard-parameter` | The stated target is planned; the exact unresolved dependencies are in gaps and stage remaining lists. |
| PAPER-YUAN-26/137 | `StableReductionPartII:MC.7/level-picard-parameter`; `StableReductionPartII:MC.7/picard-triples-comparison` | The stated target is planned; the exact unresolved dependencies are in gaps and stage remaining lists. |
| PAPER-YUAN-26/250 | `StableReductionPartII:MC.1/smooth-dimension` | The stated target is planned; the exact unresolved dependencies are in gaps and stage remaining lists. |
| PAPER-YUAN-26/251 | `StableReductionPartII:MC.1/proper-moduli` | The stated target is planned; the exact unresolved dependencies are in gaps and stage remaining lists. |
| PAPER-YUAN-26/252 | `StableReductionPartII:MC.1/normal-crossing-boundary` | The stated target is planned; the exact unresolved dependencies are in gaps and stage remaining lists. |
| PAPER-YUAN-26/258 | `StableReductionPartII:MC.6/compactified-torelli` | The stated target is planned; the exact unresolved dependencies are in gaps and stage remaining lists. |
| PAPER-DIMITROV-GAO-HABEGGER-21/10 | `StableReductionPartII:MC.4/full-level`; `StableReductionPartII:MC.4/fine-level-scheme`; `StableReductionPartII:MC.4/level-connectedness`; `StableReductionPartII:MC.0/universal-curve` | Single pairing component with chosen ζ_N; geometric irreducibility requires component/topology inputs. |
| PAPER-DIMITROV-GAO-HABEGGER-21/12 | `StableReductionPartII:MC.6/smooth-torelli`; `StableReductionPartII:MC.6/torelli-finite-fibres`; `StableReductionPartII:MC.6/jacobian-hodge-comparison` | Finite geometric fibres, ±level ambiguity, genus-two injectivity and Cartesian universal-Jacobian square; no globally finite smooth Torelli claim. |

The reserved key node is `StableReductionPartII:key/moduli-curves`. Its smooth/stable flavours, automorphism groupoids, universal curve, forgetful stabilization, clutching, coarse and full-level distinctions serve the six cited key-definition papers. The packet’s keyDefinitionCoverage lists the exact exports.

## Source versions and issues

### mumford1977

David Mumford, *Stability of projective varieties*, L’Enseignement Mathématique 23 (1977),39–110. [Public source](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1977a--StabilityLecturesIHES-Swiss.pdf). Read 2026-10-02; SHA-256 `558c5e1a56a522c7d6815b4def3e6410690e8e8d28642f49df6887b57905bd80`.

Read scope: PDF63–68, printed pp.100–105: GRR calculation and Picard torsion arguments.

### milne

J. S. Milne, *Jacobian Varieties*, Corrected author notes,12 June2021. [Public source](https://www.jmilne.org/math/xnotes/JVs.pdf). Read 2026-10-02; SHA-256 `36c3f09c7462dbbd4ae1f8b81a02bd9ff84f03c5a346351d7d5d78fc3f173486`.

Read scope: PDF27–30 (§8, relative integral-fibre Jacobians);PDF37–45 (§§12–13, Torelli statement and proof).

### dm

Pierre Deligne; David Mumford, *The irreducibility of the space of curves of given genus*, IHÉS 36 (1969), 75–109. [Public source](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1969c--IrredModCurves-Deligne-Numdam.pdf). Read 2026-10-02; SHA-256 `d779973708ecef9a098db863df766f173740d75302f15655e4bbc9dd7df739e7`.

Read scope: PDF1–14 and31–36, printed pp.75–87 and104–109;§§2–4 not read in full.

### knudsen2

Finn Faye Knudsen, *The projectivity of the moduli space of stable curves, II: The stacks M_{g,n}*, Math. Scand.52 (1983),161–199. [Public source](https://journals.msp.org/mscand/article/download/1622/1621/1653). Read 2026-10-02; SHA-256 `18e04bbf5c24a460ff10e965ebf665ea0229378c6a9521bd279909476012e230`.

Read scope: §§1–3, printed pp.161–191 (PDF1–31), rendered scan.

### knudsen2012

Finn Faye Knudsen, *A closer look at the stacks of stable pointed curves*, arXiv:1106.1588v2, 3 April 2012. [Public source](https://arxiv.org/pdf/1106.1588v2). Read 2026-10-02; SHA-256 `de9f73f25a4fbe03dbe2865ebc5932412b5bf3aa7f02734c04de05013da44d36`.

Read scope: Entire paper, PDF1–17; internal generated header dated 2018 is not a new arXiv version.

### knudsen3

Finn Faye Knudsen, *The projectivity of the moduli space of stable curves, III: The line bundles on M_{g,n}, and a proof of the projectivity of M̄_{g,n} in characteristic 0*, Math.Scand.52 (1983),200–212. [Public source](https://journals.msp.org/mscand/article/download/1623/1622/1654). Read 2026-10-02; SHA-256 `97c2d29246b5aeff4820b4f7e74aaf8ad2e32eb72c25d05acfb7b2cbd8f017f2`.

Read scope: Entire paper, PDF1–13, rendered scan; projectivity argument is characteristic zero.

### ile

Runar Ile, *Stably reflexive modules and a lemma of Knudsen*, arXiv:1110.3909 author preprint. [Public source](https://arxiv.org/pdf/1110.3909). Read 2026-10-02; SHA-256 `41e6a87de44074fdc24770e0f842c6e8846347c3b77483d17371d40c97793743`.

Read scope: Remark6.4 and Example6.5, PDF20–21; remaining proof not yet read.

### clm

Raymond Cheng; Carl Lian; Takumi Murayama; in collaboration with Yordanka Kovacheva and Monica Marinescu, *Projectivity of the moduli of curves*, Author manuscript, 1 July 2021. [Public source](https://chngr.github.io/assets/mgbar.pdf). Read 2026-10-02; SHA-256 `5314dd91d8957fc775ea40e30d9a9cc12159fd5b61a5f0d2640c41b18f19a829`.

Read scope: PDF1–5,18–33;PDF6–17 generic positivity background not yet read.

### yuan-author-http

Xinyi Yuan, *Arithmetic bigness and a uniform Bogomolov-type result*, Author manuscript,21 August2024; published Ann.Math.203 (2026) is not collated here. [Public source](http://faculty.bicmr.pku.edu.cn/~yxy/preprints/bigness_and_bogomolov.pdf). Read 2026-10-02; SHA-256 `b36f4860cc0f098ef062523e8a5147e8172d1e4e357fc76a63cd7c0d782a813e`.

Read scope: PDF16,41–46,55–57,73–75; only passages routed to this roadmap.

### dgh

Vesselin Dimitrov; Ziyang Gao; Philipp Habegger, *Uniformity in Mordell–Lang for curves*, arXiv:2001.10276v3. [Public source](https://arxiv.org/pdf/2001.10276v3). Read 2026-10-02; SHA-256 `5fc8e86f53ee43e9d18e8239a8db986bff74115ddb947abef4902a72dde338a4`.

Read scope: PDF6,23–24,§§1.2,6.1; only the two routed moduli items.

The later CLM NSF copy was collated at PDF1–6,33,38–41; its hash and URL are in sourceVersions. Yuan’s publisher page was read but its PDF was not acquired. A source error scoped to an author manuscript is not an accusation about an unread published version. All ten findings remain without an independent-review verdict.

### StableReductionPartII/E1: gap

knudsen2, Main Lemma2.2 and its application,pp.175–178, published1983 scan.

Printed: “Main Lemma”

Correction: The pointed-node versality needed by the dual ideal calculation must be proved; use Knudsen2012 Proposition2.1 and §§2–4.

Reason: Knudsen2012 explicitly identifies the earlier unproved versality assumption and supplies the small-extension and matrix calculations.

Reach: the proof. Known status: Knudsen, A closer look at the stacks of stable pointed curves, arXiv:1106.1588v2,2012. Searches: Read the full2012 repair and its introduction; compared with1983 Main Lemma.

### StableReductionPartII/E2: error

knudsen2, Proof of Theorem3.7,pp.187–189; Ile Remark6.4/Example6.5 PDF20–21.

Printed: “JJ∨ = J”

Correction: Restrict the claimed nodal ideal relations to the nodal-section locus before the rank-two calculation.

Reason: For R=S[x,y]/(xy−bc) and I=(x−b,y−c), Ile computes R/(I I∨)≅S/(b,c) and I∨⊗S≅S⊕S/(b,c). The quotient is not rank2 on the whole smoothing base.

Reach: the proof. Known status: Runar Ile, Stably reflexive modules and a lemma of Knudsen, Remark6.4 and Example6.5 (arXiv:1110.3909). Searches: Read Ile Remark6.4 and Example6.5 in full; checked Knudsen2012 repair as distinct from this clutching-proof restriction.

### StableReductionPartII/E3: error

knudsen2, Corollary3.9(b),printedp.190 (PDF30), published1983 scan.

Printed: “When g₁ ≠ g₂ or n ≠ 0, β_{g₁,g₂,H,K} is a closed immersion.”

Correction: Use finite unramified clutching and boundary normalization by distinguished-node choices. A global separating clutching map need not be a closed immersion even for unequal genera and n>0.

Reason: Over C glue three pairwise nonisomorphic elliptic curves in a chain and put the sole mark on the central curve. The genus3 target has two distinct nodes of type (1,empty)|(2,{1}). Choosing the left or right elliptic tail gives nonisomorphic geometric preimages in M̄₁,₁×M̄₂,₂, since the first elliptic factors are nonisomorphic. A closed immersion is injective on geometric points. This is a statement counterexample, distinct from Ile’s correction to the proof of3.7.

Reach: a stated result. Known status: new. Searches: 2026-10-02: journal original PDF and Corollary3.9 page rendered at high resolution.; Bounded searches for Knudsen Corollary3.9 closed-immersion correction/erratum found no exact published correction; later repetitions are not verification.; Ile1110.3909 Remarks6.4/6.5 correct3.7 proof, not this3.9(b) statement. Novelty and the counterexample require independent review.

### StableReductionPartII/E4: gap

yuan-author-http, §3.1.4,p.45,21August2024 author manuscript.

Printed: “a stable compactification is given by the Zariski closure of S′ in M′g”

Correction: Close the finite image in S̄₀×V and normalize in K(W₀), retaining both the base coordinate and the finite cover’s isomorphism data.

Reason: For a constant curve family on A¹, the image in V is zero-dimensional while a compactification of the base has dimension1. Moreover the stack fibre product remembers an isomorphism and can map finitely, not injectively, to S×V.

Reach: the proof. Known status: new; the graph-closure problem was already flagged in routed extraction item83, without a published correction. Searches: Read author manuscript p.45 and the routed item83.; Annals article page checked; candidate publisher PDF404 and Euclid returned non-PDF, so no published-text collation is claimed.; ArXiv v4 predates the21August2024 manuscript; no later author version verified.

### StableReductionPartII/E5: misprint

yuan-author-http, §1.6,p.16,21August2024 author manuscript.

Printed: “any rational irreducible component of C_k̄ intersects other irreducible components at three or more points”

Correction: Count the two normalization branches of every self-node; the three-intersection condition applies to nonsingular rational components.

Reason: A nodal rational component attached to an elliptic component has three normalization flags and is stable of total genus2 although it meets the other component only once. The parent and DM definitions count normalization flags.

Reach: nothing. Known status: Previously recorded and independently confirmed in PAPER-YUAN-26/E7 and ERRATA-PAPER-YUAN-26/E4; no published correction verified. Searches: Read data/source-issues.json entries for the exact owner PAPER-YUAN-26 and the paper extraction; publisher acquisition failed as stated in sourceVersions.

### StableReductionPartII/E6: error

clm, Introduction,p.1,1July2021 author manuscript.

Printed: “irreducible smooth projective scheme over Z”

Correction: Delete smooth for the coarse scheme; the stable stack is smooth.

Reason: Smoothness of an algebraic stack does not establish smoothness of its coarse quotient. The later NSF-deposited copy p.1 explicitly removes the word smooth.

Reach: a stated result. Known status: Corrected in the later NSF-deposited author copy,PDF1,https://par.nsf.gov/servlets/purl/10585475. Searches: Compared full introductions in2021 author copy and43-page NSF copy; the latter is not asserted to be the publisher’s version of record.

### StableReductionPartII/E7: error

clm, Lemma1.5 proof,p.4,1July2021 author manuscript.

Printed: “Pic(X) is a subgroup of Pic(U)”

Correction: Use the groupoid-equivariant descent datum and norm construction; forgetting equivariance need not be injective.

Reason: For Bμ_N over an algebraically closed field of characteristic prime to N, distinct character line bundles become the same trivial line on the atlas Spec k. The later NSF copy pp.4–6 replaces the argument by descent and norms.

Reach: the proof. Known status: Corrected in the later NSF-deposited author copy,Lemma1.5 proof,PDF4–6. Searches: Read2021 pp.4–5 and NSF pp.4–5;PDF6 was subsequently read in full, including the cocycle/norm compatibility.

### StableReductionPartII/E8: gap

clm, Lemma7.1 proof,p.29,1July2021 author manuscript.

Printed: “S is Noetherian since it maps finitely to M_g”

Correction: Require finite type/noetherian source explicitly before applying relative Serre vanishing.

Reason: The assumption is finite fibres of the classifying map; finite fibres alone do not imply a finite morphism or a noetherian source. The later NSF copy p.39 supplies finite type instead.

Reach: the proof. Known status: Corrected in the later NSF-deposited author copy,Lemma1.44 proof,PDF39. Searches: Compared2021 Lemma7.1 proof and NSF Lemma1.44 proof. The node in this packet assumes proper finite-type S.

### StableReductionPartII/E9: misprint

clm, Proposition6.3 proof,p.25,2021 author copy; same line in NSF copyPDF33.

Printed: “Since b∗ωS′ ∼= ωS”

Correction: For the contraction b:S→S′ use b_*ω_S^{⊗m}≅ω_{S′}^{⊗m}, hence the equality of relative pluricanonical direct images.

Reason: The rendered NSF line puts the star below b and its argument on S′, reversing the domain of pushforward. If read instead as pullback, the identity also misses the exceptional divisor: for a blowup ω_S≅b*ω_{S′}⊗O(E). The intended pluricanonical pushforward equality is valid, but requires its own argument.

Reach: the proof. Known status: new. Searches: Compared2021 p.25 with the later NSF p.33, rendered to check the star position.; Bounded search for Cheng–Lian–Murayama projectivity erratum on2026-10-02 found no exact correction. Publisher version not identified; finding scoped to these author copies.

### StableReductionPartII/E10: misprint

clm, Lemma7.1 final proof line,p.30,2021 author copy; NSF Lemma1.44 proofPDF40.

Printed: “f_*ω^{⊗3d}_{X/S} is ample”

Correction: The conclusion supplied by the ampleness lemma is det(f_*ω^{⊗3d}_{X/S}) ample.

Reason: The lemma statement concerns λ_{3d}=det f_*ω^{3d}, and Proposition5.5/NSF1.33 concludes ampleness of det Q. Its invocation does not by itself conclude ampleness of Q.

Reach: nothing. Known status: new. Searches: Compared both author-copy proof endings and their correctly stated determinant-ample lemma.; Bounded projectivity erratum search2026-10-02 found no exact correction; no assertion about an unread publisher text.

## Supplier extensions and remaining work

### Parent and foundational stage imports remain open

Every such use has a precise request naming the real supplier stage and consuming proof. Stage descriptions are specifications, not built declarations. Closure requires verified supplier nodes or pinned declarations; the parent roadmap is not replanned here.

### Curve-family Jacobians and Picard components

JacobianChallenge layer D is over a field. Milne §8 supplies a sketch for integral-fibre projective flat families, not reducible stable families. A JacobianChallenge Part II must develop fppf relative Picᵈ, smooth relative ppav Jacobians, stable semiabelian Pic⁰, base change, canonical polarizations, Lie comparisons, and the line-lifting obstruction. Read Grothendieck FGA §232 and BLR §§8.4,9.4 at exact locators; they were not acquired here.

### Strong Torelli owner extension

Milne §§12–13 were read in full at the scoped pages, including the theta/symmetric-power reconstruction proof. Strong Torelli, hyperelliptic sign realization, nonhyperelliptic sign exclusion and the genus-two hyperelliptic theorem need declaration-level planning in JacobianChallenge Part II. Do not duplicate those foundational proofs inside the curve-moduli owner.

### Full-level rigidity source

Acquire and decompose Serre, Séminaire Cartan 1960/61, exposé17 Appendix, including odd-prime and level-four cases in prime-to-characteristic geometry. DM §5.14 is a citation of this result, not its proof. Oort–Steenbrink Theorem1.8/Lemma1.11 remain unacquired.

### Teichmüller and mapping-class inputs

DM §§5.13–5.16 and Mumford1977 Lemma5.14 require connected/simply connected Teichmüller space, the analytic moduli presentation, generation by Dehn twists, boundary-loop monodromy and Sp(Z/N) surjectivity. No verified atlas owner was found. Propose an owner extension before creating these generic nodes; do not attribute them to scheme deformation theory.

### Tame normalized-level component comparison

Read DM §§2–4 in full, especially Theorem4.19 and all normalization/tame-cover arguments used by5.9/5.13. Only §§1,5 and the stated pages were fully read. These dependencies prevent source_decomposed coverage of MC.4.

### Generic positivity and ampleness supplier extension

SF.5 currently plans intersection/GRR and surface Riemann–Roch, not nef vector bundles. Propose SchemeAndStackFoundations Part II: curve-test nefness of locally free sheaves, quotients/extensions/symmetric powers, finite pullback/descent, classifying Grassmannian/frame maps and the precise Kollár ampleness lemma. CLM author §§2–4 (PDF6–17) remain unread; the §5 proof was read.

### Surface positivity inputs

Acquire Mumford/Ekedahl vanishing with the characteristic-two,m=2 bound≤1, Frobenius negative-quotient contradiction, rational-double-point resolutions and pluricanonical pushforward invariance, elliptic canonical bundle formula (Bombieri–Mumford1977), and Lang1980 Euler bound. Assign generic surface facts to an owner extension; do not put them in parent StableReduction without verifying its exact scope.

### Line-valued determinants and Deligne pairing

A generic determinant-of-cohomology/Deligne-pairing construction on proper flat nodal curves, pullback and its c₁ pushforward identity are required in addition to SF.5 rational Chow GRR. Deligne’s determinant paper and Moret-Bailly Noether1989 were not acquired. Propose a foundational/Arakelov Part II with an unmetrized algebraic core, retaining exact integral tensor powers.

### All-characteristic compactified Torelli

KnudsenIII §6 is a characteristic-zero proof. Yuan p.56 cites an all-field minimal ppav/Hodge result. The existing C5 good-prime level scope does not alone prove the unlevel all-characteristic statement. Read Faltings–Chai V Theorem2.3 or a public primary replacement and prove compatible prime-to-characteristic level descent and boundary extension.

### Pointed noetherian-to-arbitrary-base passage

Fresh KnudsenII Appendix PDF31–39/printed191–199 supplies the exact relative stable-reflexivity conditions for a flat noetherian S→R: arbitrary S-module Hom comparison and higher Ext vanishing for both M and M∨, equivalently a universally acyclic finite-locally-free bi-infinite complex with universally acyclic dual. Proposition6 compares M with its R-maximal-ideal completion as S-stably and Ŝ-stably reflexive, but cites Bourbaki III5.4.4 without a proof; Proposition7 is left as an exercise. The new actual-ideal/Hom/quotient completion adapters only treat flat ambient change R→B. They do not prove universal S-coefficient change, compatibility of the different base/source completions, a pointed completed-local hull, sheaf globalization or noetherian approximation for arbitrary bases. Require those exact inputs before closing dual-section-ideal. Generic relative stable-reflexivity ownership remains a proposed extension, not an imported closed result.

### Rigid genus-one locus and boundary normalization details

Expand the special labelled triangle recovery into individual family lemmas and reconcile the augmented clutching proof with Ile’s nodal-locus correction. Obtain a primary modern boundary normalization statement, e.g. the consumer CLP §2.1, rather than treating Knudsen Corollary3.9(b) as a global closed immersion.

### Suggested Lean type interfaces

The pinned libraries lack the stable pointed-family, algebraic-stack, relative Picard and sheaf interfaces of the strength required here. All 207 inherited geometric omissions remain. Native AdjoinRoot, Ideal, LinearMap, tensor-algebra, specified tensor-module action and actual dual-quotient signatures elaborate, including R′-linearity and dual tensor identity/composition on pure tensors. Whole-file elaboration checks the remaining signatures only; the fifteen elementary bodies listed above have a separate proof and axiom audit. No proved completed-local or general-family comparison is supplied.

### Source-locator and published-version collation

Before full submission verify every short excerpt literally at its cited printed/PDF page, refine combined locators to individual statements, and collate the published Yuan/DGH texts. Yuan publisher PDF could not be acquired: Annals candidate404 and Euclid non-PDF response; author hash/version scope is explicit. CLM’s NSF copy repairs several older manuscript errors, but publisher identification still needs checking.

**rescope — tauceti:TauCetiRoadmap/JacobianChallenge, StableReductionPartII.** Field-only layer D is insufficient for family Picᵈ/Jacobians and strong Torelli. Existing relative abelian duality is not curve Picard representability. Create JacobianChallenge,Part II with relative curve Picard/Jacobian and strong Torelli stages. This packet keeps moduli-specific level and Torelli maps, importing those generic constructions after approval; no upstream edits.

**rescope — SchemeAndStackFoundations, StableReductionPartII.** SF.5 intersection/GRR does not plan generic vector-bundle positivity or line-valued determinant/pairing constructions. Create SchemeAndStackFoundations,Part II: vector-bundle nefness/ampleness and determinant/Deligne-pairing core; use an Arakelov Part II for metric refinements. Assign surface vanishing and elliptic positivity to a verified surface owner extension.

**rescope — ShimuraCompactifications, StableReductionPartII.** C5 currently states good-prime level compactification while the curve Hodge target is an all-characteristic unlevel statement. Add a ShimuraCompactifications,Part II supplier for minimal Siegel unlevel descent across every characteristic, preserving automorphic Hodge powers. Verify a prime-to-characteristic level argument instead of claiming the good-prime scope automatically covers it.

**split — StableReductionPartII.** MC.4 combines coarse projectivity, generic positivity applications and full-level component topology. Split MC.4 into coarse-space/projective-cover and fine-level/component sublayers once the generic positivity supplier extension is assigned; current node stage IDs are kept for this checkpoint.

## Validation and suggested file

The standard packet checker is run against the pinned declaration index, and
the issue deliverable intake and whitespace checks are required before submission.
The 58 upstream stage references appear in canonical prerequisites. The pinned
checker recognizes known Tau Ceti roadmap stages before baseline-name dispatch;
no compatibility side field or in-memory restoration is needed. No checker code, atlas data or other packet is edited. Exact current
check counts and source/build hashes are recorded in the handoff.

The complete suggested file elaborates with only admitted-proof warnings in
an existing Mathlib build at the pinned commit. It imports individual Mathlib
modules and uses native AdjoinRoot, Ideal, LinearMap, Matrix and tensor types.
The packet's expressed-node/API/test ledgers now include the polynomial model;
all geometric omissions remain explicit. The coefficient comparisons include a native algebra equivalence, a specified
tensor-ring module action, an R′-linear dual comparison, pure-tensor identity and
composition, and transport of the actual quotient by multiplication maps. No stage or shared key definition is closed.

## Canonical polynomial tensor and residue-quotient interfaces

The following declarations specialize the existing tensor and quotient APIs to
the explicit monic model. They are needed to retain the actual module action
and the actual multiplication-range quotient when using the natural coefficient
comparisons. They do not replan general tensor algebra or matrix-factorization
theory. No flatness of the coefficient map is used. All proofs are plans and
all implementation statuses are unchecked.

The tensor-ring action is specified before R′-scalar restriction through E_R⁻¹.
It is not obtained by conjugating the desired dual equivalence. In particular
K is retained in normal coordinates: d·ε=m(b), so discarding the correction
term changes the action even though the residue is still annihilated by d.

### Naturality of section evaluation

`StableReductionPartII:MC.2/section-evaluation-coefficient-naturality` · lemma

Let A be any commutative ring, γ,δ,s,t∈A, q=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), m(r)(j)=rj, ev:R→A the section evaluation and ε the unique dual generator dε(j)=bj. For f:A→A′, primes denote the same construction with mapped parameters and φ:R→R′ the coefficient map. ev′(φ(r))=f(ev(r)) for every r∈R.

**Hypotheses**

- All coefficient rings are commutative and may have zero divisors or be the zero ring. No noetherianity, unit discriminant, injectivity or flatness of f is required. Statements concern the explicit polynomial model, not arbitrary nodal families.

**Prerequisites**

- StableReductionPartII:MC.2/section-coefficient-map
- StableReductionPartII:MC.2/polynomial-normal-form
- StableReductionPartII:MC.2/section-evaluation-kernel

**Proof**

- Both sides are ring maps R→A′; evaluate them on u, v and every coefficient ιz.
- Use the unique expression p(v)+u q₁(v) to reduce the equality to coefficientwise polynomial evaluation.

**Acceptance**

- The equation holds also when f kills a nonzero coefficient; it is not cancellation through f.

**Source:** Knudsen2012, §3, printed pp.11–12, monic division and the dual residue calculation preceding Proposition3.1. These are authored polynomial-model adapters derived from that calculation and the pinned generic APIs; the printed stable-reflexivity proposition has stronger hypotheses.

### Algebraic tensor comparison for a pointed node

`StableReductionPartII:MC.2/section-ring-tensor-equivalence` · construction

Let A be any commutative ring, γ,δ,s,t∈A, q=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), m(r)(j)=rj, ev:R→A the section evaluation and ε the unique dual generator dε(j)=bj. For f:A→A′, primes denote the same construction with mapped parameters and φ:R→R′ the coefficient map. Construct the unique A′-algebra equivalence E_R:A′⊗_A R≃R′ with E_R(a′⊗r)=ι′a′·φ(r). The tensor algebra multiplication is (a′⊗r)(b′⊗z)=a′b′⊗rz.

**Hypotheses**

- All coefficient rings are commutative and may have zero divisors or be the zero ring. No noetherianity, unit discriminant, injectivity or flatness of f is required. Statements concern the explicit polynomial model, not arbitrary nodal families.

**Prerequisites**

- StableReductionPartII:MC.2/section-ring-base-change
- StableReductionPartII:MC.2/section-coefficient-map
- mathlib:AlgHom.liftEquiv

**Proof**

- The coefficient map is an A-algebra map after restricting the target through f; its scalar equation follows on coefficients.
- Use the baseline algebra base-change universal property to obtain the A′-algebra map with the specified pure-tensor formula.
- The existing linear tensor comparison has the same formula, hence the same underlying map by tensor induction. Transfer its inverse/bijectivity, not an unproved algebra isomorphism.
- Uniqueness follows by equality on pure tensors.

**Acceptance**

- Multiplication preservation is required; an unrelated A′-linear normal-coordinate identification does not suffice.

**API**

- `NodeSectionFactorization.PolynomialModel.ringTensorEquivTmul` (simp): E_R(a′⊗r)=ι′a′φ(r).
- `NodeSectionFactorization.PolynomialModel.ringTensorEquivUnique` (extensionality): Every A′-algebra equivalence with this pure-tensor formula equals E_R.

**Unit tests**

- `NodeSectionFactorization.PolynomialModel.ringTensorIdentity` (compatibility): For f=id_A, E_R(a⊗r)=ιa·r.
- `NodeSectionFactorization.PolynomialModel.ringTensorMultiplication` (characterisation): E_R(xy)=E_R(x)E_R(y) for every two tensor-algebra elements x,y.
- `NodeSectionFactorization.PolynomialModel.ringTensorZero` (degenerate): For the zero coefficient ring A, A⊗_A R has one element.

**Uses**

- `StableReductionPartII:MC.2/section-dual-tensor-scalar`: Supplies the inverse ring map used to transport the canonical tensor-ring module action to R′.

**Source:** Knudsen2012, §3, printed pp.11–12, monic division and the dual residue calculation preceding Proposition3.1. These are authored polynomial-model adapters derived from that calculation and the pinned generic APIs; the printed stable-reflexivity proposition has stronger hypotheses.

### Canonical tensor comparison for the section dual

`StableReductionPartII:MC.2/section-dual-tensor-equivalence` · construction

Let A be any commutative ring, γ,δ,s,t∈A, q=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), m(r)(j)=rj, ev:R→A the section evaluation and ε the unique dual generator dε(j)=bj. For f:A→A′, primes denote the same construction with mapped parameters and φ:R→R′ the coefficient map. Construct the canonical A′-linear equivalence E_D:A′⊗_A D≃D′ characterized by E_D(a′⊗h)(φ(j))=ι′a′φ(h(j)). It is identity-compatible and composition-compatible under the canonical heterobasic base-change cancellation a″⊗(a′⊗h)↦a″g(a′)⊗h: for g:A′→A″, E_{D,g}(a″⊗E_{D,f}(a′⊗h))=E_{D,gf}(a″g(a′)⊗h).

**Hypotheses**

- All coefficient rings are commutative and may have zero divisors or be the zero ring. No noetherianity, unit discriminant, injectivity or flatness of f is required. Statements concern the explicit polynomial model, not arbitrary nodal families.

**Prerequisites**

- StableReductionPartII:MC.2/section-dual-base-change
- StableReductionPartII:MC.2/section-coefficient-map
- StableReductionPartII:MC.2/section-ideal-base-change
- StableReductionPartII:MC.2/section-coordinate-regular

**Proof**

- Identify the mapped-polynomial quotient in the existing tensor theorem with R′ by coefficientwise mapping of the explicit polynomial; transport the ideal and dual through that equality.
- Pure-tensor evaluation determines the dual map because φ(c),φ(d) generate J′ as an R′-ideal; do not assume φ(J) is all of J′ as a set.
- For the identity, compare evaluations on c,d. For composition, evaluate the two nested maps on φ_gφ_f(c),φ_gφ_f(d), and use coefficient-map composition.
- Use the baseline heterobasic base-change cancellation A″⊗_{A′}(A′⊗_A D)≃A″⊗_A D, sending a″⊗(a′⊗h) to a″g(a′)⊗h. Tensor generation extends the displayed formula to the full comparison square.

**Acceptance**

- For f:ℤ→F₂ and γ=1,δ=s=t=0 the equivalence exists although F₂ is not flat over ℤ.

**API**

- `NodeSectionFactorization.PolynomialModel.dualTensorEquivEvaluation` (characterisation): E_D(a′⊗h)(φ(j))=ι′a′φ(h(j)).
- `NodeSectionFactorization.PolynomialModel.dualTensorEquivIdentity` (compatibility): E_{D,id}(a⊗h)=a·h.
- `NodeSectionFactorization.PolynomialModel.dualTensorEquivComposition` (functoriality): E_{D,g}(a″⊗E_{D,f}(a′⊗h))=E_{D,gf}(a″g(a′)⊗h) under the canonical heterobasic base-change cancellation.
- `NodeSectionFactorization.PolynomialModel.dualTensorEquivScalar` (compatibility): E_D(a′⊗(r·h))=φ(r)·E_D(a′⊗h). This is the pure-tensor consequence of section-dual-tensor-scalar.

**Unit tests**

- `NodeSectionFactorization.PolynomialModel.dualTensorIdentity` (compatibility): For identity coefficients, E_D(a⊗h)=a·h.
- `NodeSectionFactorization.PolynomialModel.dualTensorComposition` (compatibility): E_{D,g}(1⊗E_{D,f}(1⊗h))=E_{D,gf}(1⊗h).
- `NodeSectionFactorization.PolynomialModel.dualTensorNonflat` (non-example): For γ=1,δ=s=t=0, F₂ is not ℤ-flat but F₂⊗_ℤ D_ℤ≃D_F₂.

**Uses**

- `StableReductionPartII:MC.2/section-dual-tensor-scalar`: The evaluation-characterized map must respect the full transported R′-module action.
- `StableReductionPartII:MC.2/section-dual-quotient-tensor-equivalence`: The natural quotient comparison must be induced by this actual dual map.

**Source:** Knudsen2012, §3, printed pp.11–12, monic division and the dual residue calculation preceding Proposition3.1. These are authored polynomial-model adapters derived from that calculation and the pinned generic APIs; the printed stable-reflexivity proposition has stronger hypotheses.

### Coefficient naturality of dual scalar correction

`StableReductionPartII:MC.2/section-correction-coefficient-naturality` · lemma

Let A be any commutative ring, γ,δ,s,t∈A, q=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), m(r)(j)=rj, ev:R→A the section evaluation and ε the unique dual generator dε(j)=bj. For f:A→A′, primes denote the same construction with mapped parameters and φ:R→R′ the coefficient map. If K:R→R and K′:R′→R′ are the coefficient-linear corrections dK(r)=b(r−ιev(r)) and d′K′(r′)=b′(r′−ι′ev′(r′)), then φ(K(r))=K′(φ(r)) for every r.

**Hypotheses**

- All coefficient rings are commutative and may have zero divisors or be the zero ring. No noetherianity, unit discriminant, injectivity or flatness of f is required. Statements concern the explicit polynomial model, not arbitrary nodal families.

**Prerequisites**

- StableReductionPartII:MC.2/section-dual-scalar-correction
- StableReductionPartII:MC.2/section-coordinate-regular
- StableReductionPartII:MC.2/section-coefficient-map
- StableReductionPartII:MC.2/section-evaluation-coefficient-naturality

**Proof**

- Apply φ to the defining correction equation; naturality of evaluation changes its right side into the primed correction right side.
- Subtract the primed equation at φ(r); regularity of d′ forces equality. No injectivity of φ or flatness of f is used.

**Acceptance**

- Taking r=d gives φ(b)=b′; taking r=c gives φ(−a)=−a′.

**Source:** Knudsen2012, §3, printed pp.11–12, monic division and the dual residue calculation preceding Proposition3.1. These are authored polynomial-model adapters derived from that calculation and the pinned generic APIs; the printed stable-reflexivity proposition has stronger hypotheses.

### Tensor-ring action on the section dual

`StableReductionPartII:MC.2/section-dual-tensor-action` · construction

Let A be any commutative ring, γ,δ,s,t∈A, q=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), m(r)(j)=rj, ev:R→A the section evaluation and ε the unique dual generator dε(j)=bj. For f:A→A′, primes denote the same construction with mapped parameters and φ:R→R′ the coefficient map. Equip A′⊗_A D with the canonical module structure over the actual tensor algebra T=A′⊗_A R, uniquely characterized by (a′⊗r)·(b′⊗h)=a′b′⊗(r·h). This specializes the existing module/tensor universal properties, and introduces no new abstract theory of tensor representations.

**Hypotheses**

- All coefficient rings are commutative and may have zero divisors or be the zero ring. No noetherianity, unit discriminant, injectivity or flatness of f is required. Statements concern the explicit polynomial model, not arbitrary nodal families.

**Prerequisites**

- StableReductionPartII:MC.2/section-dual-scalar-action
- StableReductionPartII:MC.2/section-ring-tensor-equivalence
- mathlib:TensorProduct.lift

**Proof**

- The displayed product is additive and A-balanced separately in both pairs, using the coefficient scalar tower on D; extend it by the tensor universal property.
- Check unit, associativity and both distributivities on pure tensors and extend by tensor induction.
- In the normal coordinates of D, use r·(z,α)=(rz+ιαK(r),ev(r)α). This checks that the tensor action is not the componentwise action on R⊕A.

**Acceptance**

- For r=d, d·ε=m(b), not zero. On a nonzero base monic normal form gives b≠0 and injectivity of m, so a componentwise action gives the wrong answer.

**API**

- `NodeSectionFactorization.PolynomialModel.dualTensorActionTmul` (characterisation): (a′⊗r)·(b′⊗h)=a′b′⊗(r·h).

**Unit tests**

- `NodeSectionFactorization.PolynomialModel.tensorActionProduct` (characterisation): The action on two pure tensors is (a′b′)⊗(r·h).
- `NodeSectionFactorization.PolynomialModel.tensorActionCorrection` (computation): For f=id_A, (1⊗d)·(1⊗ε)=1⊗m(b).
- `NodeSectionFactorization.PolynomialModel.tensorActionZero` (degenerate): For the zero ring A, A⊗_A D has one element.

**Uses**

- `StableReductionPartII:MC.2/section-dual-tensor-scalar`: Supplies the concrete source action before scalar transport through E_R.

**Source:** Knudsen2012, §3, printed pp.11–12, monic division and the dual residue calculation preceding Proposition3.1. These are authored polynomial-model adapters derived from that calculation and the pinned generic APIs; the printed stable-reflexivity proposition has stronger hypotheses.

### Ring-linear tensor comparison for the section dual

`StableReductionPartII:MC.2/section-dual-tensor-scalar` · theorem

Let A be any commutative ring, γ,δ,s,t∈A, q=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), m(r)(j)=rj, ev:R→A the section evaluation and ε the unique dual generator dε(j)=bj. For f:A→A′, primes denote the same construction with mapped parameters and φ:R→R′ the coefficient map. Transport the preceding T-module structure along E_R⁻¹:R′→T. Then E_D is an R′-linear equivalence for this action and the usual action on Hom_{R′}(J′,R′). In particular E_D(a′⊗(r·h))=φ(r)·E_D(a′⊗h).

**Hypotheses**

- All coefficient rings are commutative and may have zero divisors or be the zero ring. No noetherianity, unit discriminant, injectivity or flatness of f is required. Statements concern the explicit polynomial model, not arbitrary nodal families.

**Prerequisites**

- StableReductionPartII:MC.2/section-ring-tensor-equivalence
- StableReductionPartII:MC.2/section-dual-tensor-equivalence
- StableReductionPartII:MC.2/section-dual-tensor-action
- StableReductionPartII:MC.2/section-correction-coefficient-naturality
- mathlib:Module.compHom

**Proof**

- For pure scalars a′⊗r and pure vectors b′⊗h, compare evaluations on φ(c),φ(d); the natural formula gives ι′a′φ(r)·E_D(b′⊗h).
- Use tensor induction in scalar and vector to establish T-linearity. Equivalently the normal-coordinate calculation uses φK=K′φ and the non-diagonal correction term.
- Restrict the canonical T action through E_R⁻¹ using the baseline scalar restriction; the bijective map E_D is then R′-linear.

**Acceptance**

- The R′ action is transported from the specified tensor-ring action, not defined by conjugating the desired E_D; linearity is a theorem rather than tautological by design.

**Source:** Knudsen2012, §3, printed pp.11–12, monic division and the dual residue calculation preceding Proposition3.1. These are authored polynomial-model adapters derived from that calculation and the pinned generic APIs; the printed stable-reflexivity proposition has stronger hypotheses.

### Residue equivalence for the actual dual quotient

`StableReductionPartII:MC.2/section-dual-quotient-equivalence` · construction

Let A be any commutative ring, γ,δ,s,t∈A, q=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), m(r)(j)=rj, ev:R→A the section evaluation and ε the unique dual generator dε(j)=bj. For f:A→A′, primes denote the same construction with mapped parameters and φ:R→R′ the coefficient map. Form Q=D/im(m), using the image of the actual injective R-linear multiplication map m:R→D. Construct the canonical A-linear equivalence E_Q:Q≃A induced by ρ, normalized by E_Q([ε])=1. The inherited R action satisfies E_Q(r·z)=ev(r)E_Q(z).

**Hypotheses**

- All coefficient rings are commutative and may have zero divisors or be the zero ring. No noetherianity, unit discriminant, injectivity or flatness of f is required. Statements concern the explicit polynomial model, not arbitrary nodal families.

**Prerequisites**

- StableReductionPartII:MC.2/section-dual-residue
- StableReductionPartII:MC.2/section-dual-normal-equivalence
- StableReductionPartII:MC.2/section-coordinate-regular
- mathlib:Submodule.liftQ

**Proof**

- The characterized residue kills precisely im(m), so descend it through the native quotient universal property.
- The inverse sends α to [ιαε]; the unique dual normal form proves both inverse identities.
- Transport the residue scalar equation to quotient representatives; every quotient element has a representative.

**Acceptance**

- Q is the quotient by multiplication maps, not an arbitrary kernel or a second copy of A inserted by fiat. d kills Q although d acts injectively on D.

**API**

- `NodeSectionFactorization.PolynomialModel.dualQuotientEquiv` (equivalence): E_Q is the residue-induced equivalence Q≃A for Q=D/im(m).
- `NodeSectionFactorization.PolynomialModel.dualQuotientEquivGenerator` (simp): E_Q([ε])=1.
- `NodeSectionFactorization.PolynomialModel.dualQuotientEquivScalar` (compatibility): E_Q(r·z)=ev(r)E_Q(z).

**Unit tests**

- `NodeSectionFactorization.PolynomialModel.quotientGenerator` (computation): E_Q([ε])=1.
- `NodeSectionFactorization.PolynomialModel.quotientMultiplication` (compatibility): [m(r)]=0 in Q for every r∈R.
- `NodeSectionFactorization.PolynomialModel.quotientCoordinateKills` (non-example): d·z=0 for every z∈Q, whereas multiplication by d is injective on D.

**Uses**

- `StableReductionPartII:MC.2/section-dual-quotient-tensor-equivalence`: Supplies a concrete coefficient-linear quotient and residue normalization for tensor transport.

**Source:** Knudsen2012, §3, printed pp.11–12, monic division and the dual residue calculation preceding Proposition3.1. These are authored polynomial-model adapters derived from that calculation and the pinned generic APIs; the printed stable-reflexivity proposition has stronger hypotheses.

### Coefficient base change of the actual dual quotient

`StableReductionPartII:MC.2/section-dual-quotient-tensor-equivalence` · construction

Let A be any commutative ring, γ,δ,s,t∈A, q=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), m(r)(j)=rj, ev:R→A the section evaluation and ε the unique dual generator dε(j)=bj. For f:A→A′, primes denote the same construction with mapped parameters and φ:R→R′ the coefficient map. Construct the canonical A′-linear equivalence E_{Q,f}:A′⊗_A Q≃Q′ satisfying E_{Q,f}(a′⊗[h])=[E_D(a′⊗h)] and E_Q′(E_{Q,f}(a′⊗z))=a′f(E_Q(z)). This is the base change of D/im(m), not an identification of chosen unrelated copies of A.

**Hypotheses**

- All coefficient rings are commutative and may have zero divisors or be the zero ring. No noetherianity, unit discriminant, injectivity or flatness of f is required. Statements concern the explicit polynomial model, not arbitrary nodal families.

**Prerequisites**

- StableReductionPartII:MC.2/section-dual-quotient-equivalence
- StableReductionPartII:MC.2/section-dual-tensor-equivalence
- StableReductionPartII:MC.2/section-ring-tensor-equivalence
- StableReductionPartII:MC.2/section-dual-tensor-scalar
- mathlib:TensorProduct.lid
- mathlib:Submodule.liftQ

**Proof**

- Compose the tensor of E_Q with the canonical A′⊗_A A≃A′ and E_Q′⁻¹ to construct a bijective coefficient-linear map.
- The evaluation formula and generation of J′ show E_D(a′⊗m(r))=m′(ι′a′φ(r)); hence passing from h to its quotient class is well-defined.
- Evaluate E_D in normal coordinates: it takes r incl+ιαε to the corresponding primed expression, sends ε to ε′, and its residue is a′f(ρh). This proves the quotient-representative formula agrees with the constructed equivalence.
- Identity and composition follow from the residue formula and injectivity of E_Q′; no tensor left-exactness or flatness of f is assumed.

**Acceptance**

- Nonflat specialization ℤ→F₂ with γ=1,δ=s=t=0 preserves the actual quotient and sends its residue generator to residue 1.

**API**

- `NodeSectionFactorization.PolynomialModel.dualQuotientTensorEquiv` (equivalence): E_{Q,f}:A′⊗_A Q≃Q′ is the natural dual-quotient comparison.
- `NodeSectionFactorization.PolynomialModel.dualQuotientTensorEquivTmul` (simp): E_{Q,f}(a′⊗[h])=[E_D(a′⊗h)].
- `NodeSectionFactorization.PolynomialModel.dualQuotientTensorEquivResidue` (compatibility): E_Q′(E_{Q,f}(a′⊗z))=a′f(E_Q(z)).

**Unit tests**

- `NodeSectionFactorization.PolynomialModel.quotientTensorResidue` (characterisation): For every a′,z, the residue of the tensor comparison is a′f(E_Q(z)).
- `NodeSectionFactorization.PolynomialModel.quotientTensorIdentity` (compatibility): E_{Q,id}(a⊗z)=a·z.
- `NodeSectionFactorization.PolynomialModel.quotientTensorNonflat` (non-example): For f:ℤ→F₂ and γ=1,δ=s=t=0, F₂ is not ℤ-flat and E_Q′(E_{Q,f}(1⊗z))=f(E_Q(z)) for every z∈Q.

**Uses**

- `StableReductionPartII:MC.2/dual-section-ideal`: Provides the explicit polynomial quotient comparison required before the separately open completion and sheaf-descent steps.

**Source:** Knudsen2012, §3, printed pp.11–12, monic division and the dual residue calculation preceding Proposition3.1. These are authored polynomial-model adapters derived from that calculation and the pinned generic APIs; the printed stable-reflexivity proposition has stronger hypotheses.

The residue construction additionally exports `NodeSectionFactorization.PolynomialModel.dualMultiplication`, the R-linear map m:R→D given by r↦(j↦rj), and `NodeSectionFactorization.PolynomialModel.dualMultiplicationApply`, the equation m(r)(j)=rj. Q is the native quotient by this map’s actual range. The global dual-section node imports the ring-linear and quotient comparisons before its still-open completion/descent step.

The additional baseline inputs are `mathlib:AlgHom.liftEquiv`, `mathlib:Module.compHom`, `mathlib:Submodule.liftQ` and `mathlib:TensorProduct.lid`. Their actual pinned statements were read; none supplies the pointed dual or the global geometric theorem by itself. The fresh source receipt is scoped to Knudsen2012 §3, Corollary3.2 and §4, with PDF SHA-256 `de9f73f25a4fbe03dbe2865ebc5932412b5bf3aa7f02734c04de05013da44d36`. Other inherited source receipts retain their historical authorship.

The ring tensor interface additionally exports `NodeSectionFactorization.PolynomialModel.ringTensorEquiv`: construct E_R as the natural A′-algebra equivalence A′⊗_A R≃R′. The action interface exports `NodeSectionFactorization.PolynomialModel.dualTensorAction`: the native module structure on A′⊗_A D has scalar ring A′⊗_A R and the specified pure-tensor action. Its extensionality API `NodeSectionFactorization.PolynomialModel.dualTensorActionUnique` states that a module structure with the specified action on every pair of pure tensors equals the canonical tensor-ring action.

The two-step coefficient comparison uses `mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange` from the pinned Tower module. Its map A″⊗_{A′}(A′⊗_A D)→A″⊗_A D is a″⊗(a′⊗h)↦a″g(a′)⊗h. This is a heterobasic cancellation equivalence, not ordinary same-ring tensor associativity.

Additional prerequisite of the canonical dual comparison: mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange.

## Flat ambient extension and actual module completion

This continuation fixes a distinction in the local-to-family chain. The
coefficient comparison changes A to A′ and forms the same pointed polynomial
model; its special normal-form proof permits nonflat coefficient maps. The
ambient comparison instead changes the node ring R to an arbitrary R-algebra B
and forms the actual ideal J·B. The latter comparison requires R-flatness.
It includes localization and, when R is noetherian, I-adic ring completion.
Neither operation by itself supplies a pointed local chart of an arbitrary family.

Write φ:R→B, D=Hom_R(J,R), m(r)(j)=rj and Q=D/im(m). The receiving objects
are J_B=J·B, D_B=Hom_B(J_B,B), m_B(b)(j)=bj, Q_B=D_B/im(m_B). The three
comparisons retain these objects and all their maps. Tensoring the subtype of J
and using the unit equivalence gives the ideal comparison; finite presentation
of J gives the canonical Hom comparison; the multiplication square gives the
actual quotient comparison. No residue coordinate defines the receiving
module action. If φ(d) is a unit, J_B=B and Q_B=0. This is an essential
non-example for a constant nonzero residue module under ambient localization.

For noetherian R, D and Q are finite. The pinned module-completion equivalence
identifies their I-adic completions with their tensors by C=AdicCompletion I R.
The new completed comparisons compose its inverse with the specified ambient
maps. Every ideal I is permitted for those equivalences. Detecting a map before
completion additionally requires faithful flatness. In a noetherian local ring,
maximal-ideal completion is faithful; an arbitrary completion or localization
is not asserted faithful. Completion of R at its maximal ideal is also not
automatically completion with respect to an ideal extended from the base S.

### What the Appendix supplies and what remains open

Fresh visual reading covers KnudsenII Appendix, printed191–199/PDF31–39.
Definition1/Theorem2 concern noetherian S,R with R flat over S and finite R-module
M. They require higher Ext_R(M,R⊗_S N) to vanish for every S-module N, and
M∨⊗_S N→Hom_R(M,R⊗_S N) to be an isomorphism; the same conditions hold for
M∨, with the bidual comparison M⊗_S N→Hom_R(M∨,R⊗_S N). The equivalent
complete complex consists of finite locally free R-modules, is acyclic after
tensoring with every N, and its dual has the same universal acyclicity. The
source proof passes between that complex and the Hom/Ext conditions; its
short-exact-sequence lemma and Corollary3 are separate algebra inputs.

Proposition4 preserves stable reflexivity and the dual under coefficient base
change in the source's stated range; Proposition5 localizes the criterion.
Proposition6 uses local flat S→R and compares M with its R-maximal-ideal
completion, both relative to S and to the completed base. Its entire printed
proof is a reference to Bourbaki III5.4.4, which has not been acquired.
Proposition7's comparison with all S/𝔞ᵏ reductions is left as an exercise.
Reading those statements does not discharge their proofs. The new adapters
compare ordinary finite-module Hom and quotient under ambient flat change;
they do not establish these universally quantified relative Ext conditions.

The split-node example on printed195–198 supplies explicit alternating
matrices for S[x,y]/(xy−bc), an S-linear contracting homotopy, and the ideal
(x−b,y−c) with its fractional dual/residue calculation. Its monomial argument
is specific to that split model. The source's example does not identify every
pointed quadratic completed local family with that model. Geometric node
normal forms still require the unit-discriminant condition recorded in the
existing hull node, followed by a comparison with the actual local family.

The generic relative stable-reflexivity predicate and Theorem2/Propositions4–6
require an owner extension. The packet proposes StablePeriodicCurved, Part II,
subject to foundational Ext ownership and compatibility with the existing
complete-resolution theory. Existing layer7 does not already promise this
relative criterion; bounded-perfect-complex P7 and descent SF.1 do not replace
it. No new generic definition is silently owned by the curve-moduli packet.
The pointed hull, actual sheaf comparison, coefficient-compatible faithful
descent and finite-presentation approximation remain precise gaps.

### Fresh source receipts

The KnudsenII scan has SHA-256
`18e04bbf5c24a460ff10e965ebf665ea0229378c6a9521bd279909476012e230`.
The packet records a new authored Appendix receipt; earlier §§1–3 receipts
are historical. Public primary replacements read here are
[Stacks087Q](https://stacks.math.columbia.edu/tag/087Q) and
[087R](https://stacks.math.columbia.edu/tag/087R), their full statements and
proofs; [completion §10.97](https://stacks.math.columbia.edu/tag/0BNH),
Lemmas1–3 and the source/target completion distinction following Lemma6;
and [flat modules §10.39](https://stacks.math.columbia.edu/tag/00H9),
Definition1, Lemma5 and Lemma14 with proofs. Transitive resolution/Ext,
Artin–Rees and inverse-limit inputs are not freshly certified. The HTML hashes
and selected scopes are in sourceReadReceipts. The native forms specialize
these generic facts from the pinned library rather than re-plan them.

### Finite presentation of the polynomial section ideal

`StableReductionPartII:MC.2/section-ideal-finite-presentation` · lemma · MC.2.

A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). J is finitely presented as an R-module, even if A is nonnoetherian.

**Proof or construction:**

1. The inherited eJ identifies J with the cokernel of the two-by-two matrix Ψ.
2. The image of R²→R² is finitely generated by the images of two basis vectors.
3. Apply the pinned finite-presentation quotient theorem to the surjection R²→J; no coherence assumption on A is used.

**Dependencies:** `StableReductionPartII:MC.2/section-ideal-cokernel`, `mathlib:Module.finitePresentation_of_surjective`, `mathlib:Submodule.fg_range`.

**Acceptance:** Finite generation of an ideal alone would not imply finite presentation over an arbitrary ring. This node uses the inherited exact presentation.

**Source:** stacks-hom-flat, Stacks tag087R, Lemma15.67.4(1), together with the proof at087Q. Specialize the canonical finite-presentation Hom comparison to J and R; transport its domain along the actual ideal equivalence. Generic Hom base change is pinned library input, not new theory owned here.

**Source:** knudsen2, Appendix Definition1, Theorem2, Propositions4–7, printed191–195 (PDF31–35). Motivates completed-local passage; Proposition6 cites Bourbaki without a proof and Proposition7 is an exercise. These ambient algebra adapters do not claim either proposition or relative stable reflexivity.

### Section ideal under flat ambient extension

`StableReductionPartII:MC.2/section-ideal-ambient-equivalence` · construction · MC.2.

A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). B is a commutative R-algebra flat as an R-module; J_B=J·B is the actual mapped ideal, D_B=Hom_B(J_B,B), m_B(b)(j)=bj and Q_B=D_B/im(m_B). Construct E_J:B⊗_R J≃_B J_B by E_J(b⊗j)=b·φ(j), where φ:R→B is the algebra map.

**Proof or construction:**

1. Tensor the injective subtype J→R by the flat R-module B.
2. Compose B⊗J→B⊗R with the pinned tensor unit equivalence; its image is exactly the B-span of φ(c),φ(d), hence J_B.
3. Corestrict to that actual ideal. Tensor generation determines E_J uniquely.

**Dependencies:** `StableReductionPartII:MC.2/polynomial-node-model`, `mathlib:Module.Flat.lTensor_preserves_injective_linearMap`, `mathlib:TensorProduct.AlgebraTensorModule.rid`, `mathlib:Ideal.map_span`.

**API:**

- `NodeSectionFactorization.PolynomialModel.ambientIdealEquiv`: E_J with the stated B-linear source, target and formula.
- `NodeSectionFactorization.PolynomialModel.ambientIdealEquivTmul`: The underlying B-value of E_J(b⊗j) is bφ(j).
- `NodeSectionFactorization.PolynomialModel.ambientIdealEquivUnique`: Any B-linear equivalence with these pure-tensor values equals E_J.

**Unit tests:**

- `NodeSectionFactorization.PolynomialModel.ambientIdealGenerator`: E_J(1⊗j) has underlying value φ(j).
- `NodeSectionFactorization.PolynomialModel.ambientIdealIdentity`: For B=R, E_J(r⊗j)=rj, agreeing with the tensor unit and subtype.
- `NodeSectionFactorization.PolynomialModel.ambientIdealZero`: When B is the zero ring, J_B is subsingleton.

**Acceptance:** The extension is over R, not over A. Nonflat ambient maps are not permitted by this result.

**Source:** stacks-hom-flat, Stacks tag087R, Lemma15.67.4(1), together with the proof at087Q. Specialize the canonical finite-presentation Hom comparison to J and R; transport its domain along the actual ideal equivalence. Generic Hom base change is pinned library input, not new theory owned here.

**Source:** knudsen2, Appendix Definition1, Theorem2, Propositions4–7, printed191–195 (PDF31–35). Motivates completed-local passage; Proposition6 cites Bourbaki without a proof and Proposition7 is an exercise. These ambient algebra adapters do not claim either proposition or relative stable reflexivity.

### Dual of the extended section ideal

`StableReductionPartII:MC.2/section-dual-ambient-equivalence` · construction · MC.2.

A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). B is a commutative R-algebra flat as an R-module; J_B=J·B is the actual mapped ideal, D_B=Hom_B(J_B,B), m_B(b)(j)=bj and Q_B=D_B/im(m_B). Construct E_D:B⊗_R D≃_B D_B, canonically characterized by E_D(b⊗h)(E_J(b′⊗j))=bb′φ(h(j)). Also expose the actual B-linear multiplication map m_B:B→D_B.

**Proof or construction:**

1. Use finite presentation of J and B-flatness in Module.FinitePresentation.isBaseChange_map to identify B⊗Hom_R(J,R) with Hom_B(B⊗J,B⊗R).
2. Transport the domain along E_J⁻¹ and the codomain along the pinned tensor unit equivalence.
3. Evaluate on pure tensors; the images of c,d generate J_B, giving uniqueness. Define m_B by multiplication, independently of E_D.

**Dependencies:** `StableReductionPartII:MC.2/section-ideal-finite-presentation`, `StableReductionPartII:MC.2/section-ideal-ambient-equivalence`, `mathlib:Module.FinitePresentation.isBaseChange_map`, `mathlib:IsBaseChange.equiv`, `mathlib:IsBaseChange.equiv_tmul`, `mathlib:LinearMap.baseChangeHom`, `mathlib:TensorProduct.AlgebraTensorModule.rid`.

**API:**

- `NodeSectionFactorization.PolynomialModel.ambientDualEquiv`: The specified B-linear E_D.
- `NodeSectionFactorization.PolynomialModel.ambientDualEquivEvaluation`: E_D(b⊗h)(E_J(b′⊗j))=bb′φ(h(j)).
- `NodeSectionFactorization.PolynomialModel.ambientDualEquivUnique`: The displayed evaluations uniquely determine E_D.
- `NodeSectionFactorization.PolynomialModel.ambientMultiplication`: m_B:B→_B Hom_B(J_B,B) is the actual multiplication map.
- `NodeSectionFactorization.PolynomialModel.ambientMultiplicationApply`: m_B(b)(j)=bj.

**Unit tests:**

- `NodeSectionFactorization.PolynomialModel.ambientDualEvaluation`: E_D(1⊗h)(E_J(1⊗j))=φ(h(j)).
- `NodeSectionFactorization.PolynomialModel.ambientDualIdentity`: For B=R the last evaluation is h(j).
- `NodeSectionFactorization.PolynomialModel.ambientDualZero`: When B is the zero ring, Hom_B(J_B,B) is subsingleton.

**Acceptance:** The target is Hom_B of the mapped ideal. No free-pair coordinate model replaces that Hom.

**Source:** stacks-hom-flat, Stacks tag087R, Lemma15.67.4(1), together with the proof at087Q. Specialize the canonical finite-presentation Hom comparison to J and R; transport its domain along the actual ideal equivalence. Generic Hom base change is pinned library input, not new theory owned here.

**Source:** knudsen2, Appendix Definition1, Theorem2, Propositions4–7, printed191–195 (PDF31–35). Motivates completed-local passage; Proposition6 cites Bourbaki without a proof and Proposition7 is an exercise. These ambient algebra adapters do not claim either proposition or relative stable reflexivity.

### Multiplication maps under ambient transport

`StableReductionPartII:MC.2/section-dual-ambient-multiplication` · lemma · MC.2.

A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). B is a commutative R-algebra flat as an R-module; J_B=J·B is the actual mapped ideal, D_B=Hom_B(J_B,B), m_B(b)(j)=bj and Q_B=D_B/im(m_B). E_D(b⊗m(r))=m_B(bφ(r)). Consequently E_D carries the image of B⊗m onto im(m_B).

**Proof or construction:**

1. Evaluate both sides on E_J(b′⊗j), using E_D evaluation and m(r)(j)=rj.
2. B-linearity and the pure-tensor spanning property give equality.
3. Use the tensor unit B⊗R≃B to identify the full image, not only individual multiplication maps.

**Dependencies:** `StableReductionPartII:MC.2/section-dual-ambient-equivalence`, `StableReductionPartII:MC.2/section-dual-residue`.

**Acceptance:** The quotient comparison uses this range equality; an abstract isomorphism D_B≃B⊕(B⊗A) is insufficient.

**Source:** stacks-hom-flat, Stacks tag087R, Lemma15.67.4(1), together with the proof at087Q. Specialize the canonical finite-presentation Hom comparison to J and R; transport its domain along the actual ideal equivalence. Generic Hom base change is pinned library input, not new theory owned here.

**Source:** knudsen2, Appendix Definition1, Theorem2, Propositions4–7, printed191–195 (PDF31–35). Motivates completed-local passage; Proposition6 cites Bourbaki without a proof and Proposition7 is an exercise. These ambient algebra adapters do not claim either proposition or relative stable reflexivity.

### Residue quotient under ambient extension

`StableReductionPartII:MC.2/section-dual-ambient-quotient-equivalence` · construction · MC.2.

A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). B is a commutative R-algebra flat as an R-module; J_B=J·B is the actual mapped ideal, D_B=Hom_B(J_B,B), m_B(b)(j)=bj and Q_B=D_B/im(m_B). Construct E_Q:B⊗_R Q≃_B Q_B with E_Q(b⊗[h])=[E_D(b⊗h)].

**Proof or construction:**

1. Use the pinned tensor-quotient equivalence to quotient B⊗D by the image of B⊗im(m).
2. The multiplication range equality identifies this image under E_D with im(m_B).
3. Descend the specified map and its inverse; use pure tensors of quotient classes for uniqueness. Right exactness supplies the quotient step; no extra left-exactness of an arbitrary coefficient change is inserted.

**Dependencies:** `StableReductionPartII:MC.2/section-dual-ambient-multiplication`, `mathlib:TensorProduct.AlgebraTensorModule.tensorQuotientEquiv`, `mathlib:TensorProduct.AlgebraTensorModule.tensorQuotientEquiv_apply_tmul`.

**API:**

- `NodeSectionFactorization.PolynomialModel.ambientQuotientEquiv`: The B-linear E_Q on the actual multiplication quotient.
- `NodeSectionFactorization.PolynomialModel.ambientQuotientEquivTmul`: E_Q(b⊗[h])=[E_D(b⊗h)].
- `NodeSectionFactorization.PolynomialModel.ambientQuotientEquivUnique`: The stated pure-tensor quotient formula uniquely determines E_Q.

**Unit tests:**

- `NodeSectionFactorization.PolynomialModel.ambientQuotientMultiplication`: E_Q(b⊗[m(r)])=0.
- `NodeSectionFactorization.PolynomialModel.ambientQuotientIdentity`: For B=R, E_Q(1⊗[h])=[E_D(1⊗h)].
- `NodeSectionFactorization.PolynomialModel.ambientQuotientAwayFromSection`: If φ(d) is a unit then Q_B is subsingleton; a constant nonzero residue module over B would fail.

**Acceptance:** If φ(d) is a unit, J_B=B, m_B is an isomorphism and Q_B=0. This prevents confusing ambient localization with a new pointed coefficient model whose residue always looks like A.

**Source:** stacks-hom-flat, Stacks tag087R, Lemma15.67.4(1), together with the proof at087Q. Specialize the canonical finite-presentation Hom comparison to J and R; transport its domain along the actual ideal equivalence. Generic Hom base change is pinned library input, not new theory owned here.

**Source:** knudsen2, Appendix Definition1, Theorem2, Propositions4–7, printed191–195 (PDF31–35). Motivates completed-local passage; Proposition6 cites Bourbaki without a proof and Proposition7 is an exercise. These ambient algebra adapters do not claim either proposition or relative stable reflexivity.

### Completion of the polynomial section dual

`StableReductionPartII:MC.2/section-dual-completion-equivalence` · construction · MC.2.

A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). R is noetherian, I is any ideal of R, C=AdicCompletion I R. Completion of an R-module uses I, not an ideal of the coefficient ring A. Construct Ê_D:AdicCompletion I D≃_C Hom_C(J·C,C), characterized by Ê_D(b·of(h))=E_D(b⊗h).

**Proof or construction:**

1. J is a finite R-module. For noetherian R, the pinned isNoetherian_linearMap theorem makes D=Hom_R(J,R) noetherian. Apply Module.Finite.of_injective to its identity map to obtain finiteness.
2. Use the actual module-completion equivalence C⊗D≃AdicCompletion I D, and its inverse.
3. Compose that inverse with E_D at B=C; the pinned completion-flatness instance supplies the ambient hypothesis. Check the canonical map of(h) and C-multiples thereof.

**Dependencies:** `StableReductionPartII:MC.2/section-dual-ambient-equivalence`, `mathlib:AdicCompletion.flat_of_isNoetherian`, `mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`, `mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian_apply`, `mathlib:isNoetherian_linearMap`, `mathlib:Module.Finite.of_injective`.

**API:**

- `NodeSectionFactorization.PolynomialModel.completedDualEquiv`: Ê_D on actual AdicCompletion I D and actual Hom_C(J·C,C).
- `NodeSectionFactorization.PolynomialModel.completedDualEquivOf`: Ê_D(of(h))=E_D(1⊗h).
- `NodeSectionFactorization.PolynomialModel.completedDualEquivTensor`: Ê_D(b·of(h))=E_D(b⊗h).

**Unit tests:**

- `NodeSectionFactorization.PolynomialModel.completedDualMultiplication`: Ê_D(of(m(r)))=m_C(φ(r)), retaining the multiplication map.
- `NodeSectionFactorization.PolynomialModel.completedDualZero`: Ê_D(0)=0.
- `NodeSectionFactorization.PolynomialModel.completedDualEvaluation`: Ê_D(of(h))(E_J(1⊗j))=φ(h(j)).

**Acceptance:** Noetherianity is required here; the earlier polynomial calculations did not require it. I need not lie in the Jacobson radical for this equivalence. This is not Knudsen Proposition6.

**Source:** stacks-completion, Stacks §10.97, Lemmas10.97.1(3),10.97.2(1),10.97.3. Specialize finite-module completion and flatness to D and its actual multiplication quotient. Faithfulness requires I contained in the Jacobson radical; this node does not impose or claim faithfulness.

**Source:** stacks-hom-flat, Stacks tag087R, Lemma15.67.4(1), together with the proof at087Q. Specialize the canonical finite-presentation Hom comparison to J and R; transport its domain along the actual ideal equivalence. Generic Hom base change is pinned library input, not new theory owned here.

**Source:** knudsen2, Appendix Definition1, Theorem2, Propositions4–7, printed191–195 (PDF31–35). Motivates completed-local passage; Proposition6 cites Bourbaki without a proof and Proposition7 is an exercise. These ambient algebra adapters do not claim either proposition or relative stable reflexivity.

### Completion of the actual residue quotient

`StableReductionPartII:MC.2/section-dual-quotient-completion-equivalence` · construction · MC.2.

A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). R is noetherian, I is any ideal of R, C=AdicCompletion I R. Completion of an R-module uses I, not an ideal of the coefficient ring A. Construct Ê_Q:AdicCompletion I Q≃_C Q_C, characterized by Ê_Q(b·of([h]))=[E_D(b⊗h)].

**Proof or construction:**

1. Q is a quotient of the finite R-module D, hence finite.
2. Compose the inverse of C⊗Q≃AdicCompletion I Q with E_Q at B=C.
3. The two canonical equations show that completion of the quotient agrees with quotient of the completed dual by multiplication maps.

**Dependencies:** `StableReductionPartII:MC.2/section-dual-completion-equivalence`, `StableReductionPartII:MC.2/section-dual-ambient-quotient-equivalence`, `mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`, `mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian_apply`.

**API:**

- `NodeSectionFactorization.PolynomialModel.completedQuotientEquiv`: Ê_Q on actual module completion and actual C-multiplication quotient.
- `NodeSectionFactorization.PolynomialModel.completedQuotientEquivOf`: Ê_Q(of([h]))=[Ê_D(of(h))].
- `NodeSectionFactorization.PolynomialModel.completedQuotientEquivTensor`: Ê_Q(b·of([h]))=[E_D(b⊗h)].

**Unit tests:**

- `NodeSectionFactorization.PolynomialModel.completedQuotientMultiplication`: Ê_Q(of([m(r)]))=0.
- `NodeSectionFactorization.PolynomialModel.completedQuotientZero`: Ê_Q(0)=0.
- `NodeSectionFactorization.PolynomialModel.completedQuotientAwayFromSection`: If φ(d) is a unit in C then Q_C is subsingleton.

**Acceptance:** The completed quotient is Q_C=Hom_C(J·C,C)/im(C→Hom_C(J·C,C)), not a guessed coefficient completion.

**Source:** stacks-completion, Stacks §10.97, Lemmas10.97.1(3),10.97.2(1),10.97.3. Specialize finite-module completion and flatness to D and its actual multiplication quotient. Faithfulness requires I contained in the Jacobson radical; this node does not impose or claim faithfulness.

**Source:** stacks-hom-flat, Stacks tag087R, Lemma15.67.4(1), together with the proof at087Q. Specialize the canonical finite-presentation Hom comparison to J and R; transport its domain along the actual ideal equivalence. Generic Hom base change is pinned library input, not new theory owned here.

**Source:** knudsen2, Appendix Definition1, Theorem2, Propositions4–7, printed191–195 (PDF31–35). Motivates completed-local passage; Proposition6 cites Bourbaki without a proof and Proposition7 is an exercise. These ambient algebra adapters do not claim either proposition or relative stable reflexivity.

### Faithful detection for the residue quotient

`StableReductionPartII:MC.2/section-dual-ambient-faithful-detection` · lemma · MC.2.

A is any commutative ring; γ,δ,s,t∈A. R=A[Y][X]/(X²+γYX+δY²−q(s,t)), c=u−s,d=v−t, J=(c,d), D=Hom_R(J,R), m:R→D, m(r)(j)=rj, Q=D/im(m). If B is a faithfully flat R-algebra and f:Q→_R Q, then 1_B⊗f is bijective if and only if f is bijective.

**Proof or construction:**

1. Apply the pinned faithful-flat bijectivity theorem to the actual R-module Q.
2. Transport along E_Q when working with Q_B. Faithfulness is separately required; a flat localization away from the section kills Q.

**Dependencies:** `StableReductionPartII:MC.2/section-dual-ambient-quotient-equivalence`, `mathlib:Module.FaithfullyFlat.lTensor_bijective_iff_bijective`.

**Acceptance:** Identity maps provide the basic case. Nonfaithful flat extension does not reflect a zero endomorphism of a nonzero residue quotient. For completion, first prove I⊂Jac(R), or work at a noetherian local ring with its maximal-ideal completion.

**Source:** stacks-faithful, Stacks §10.39 Definition10.39.1 and Lemma10.39.14, statements and proof. Specialize exactness reflection to the kernel and cokernel of f on the residue module; the generic statement is already in Mathlib.

**Source:** stacks-completion, Stacks §10.97, Lemmas10.97.1(3),10.97.2(1),10.97.3. Specialize finite-module completion and flatness to D and its actual multiplication quotient. Faithfulness requires I contained in the Jacobson radical; this node does not impose or claim faithfulness.

**Source:** knudsen2, Appendix Definition1, Theorem2, Propositions4–7, printed191–195 (PDF31–35). Motivates completed-local passage; Proposition6 cites Bourbaki without a proof and Proposition7 is an exercise. These ambient algebra adapters do not claim either proposition or relative stable reflexivity.


## Historical native-generator verification receipts

The following numerical receipts describe the earlier generator checkpoint and are superseded by the current handoff.

The complete current Mathlib-only suggested sketch elaborates with zero errors,
187 admitted-proof warnings only and 78 examples. The separate 539-line canonical
proof archive has 34 axiom audits and 16 proved examples, zero errors/warnings,
and no admitted axiom dependency. Its 34 declaration signatures match the
submitted sketch after whitespace, lemma/theorem keyword and local-notation
normalization; all four new example statements match exactly after whitespace.
The archive contains actual proofs; the submitted bodies are admitted under
PROTOCOL§13. The earlier splitting checkpoint's receipts remain historical in
the packet and at its immutable revision.

The actual read-only atlas assembler produces acyclic graphs: stages
3,050 vertices/8,750 edges; own declarations133/303; stages plus declarations
and supplier requests3,148/9,300. All81 computed stage prerequisite pairs are
reachable. Stage edges and unrelated skipped links agree with the original
packet overlay; no own links are skipped. This scoped check does not certify
all unrelated atlas declarations. Exact hashes, archive extraction and the
full reproduction script are in the handoff.

All125 inherited mathematical statements, hypotheses, API/test contracts,
acceptance criteria, sources and uses survive. Of their full node objects,
119 are unchanged; six receive dependencies, proof routes, canonical names,
API or test additions. The reserved moduli-curves key, binding Yuan/DGH routes,
135 requests, fourteen gaps, ownership proposal and eight partial stages
remain unchanged. The roadmap definition is byte-for-byte unchanged.

## Added declaration interfaces

### StableReductionPartII:MC.2/section-polynomial-monic

For the inherited polynomial F=X²+C(γY)X+C(δY²−q(s,t)) in A[Y][X], F is monic in X.

Hypotheses: A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

Prerequisites: `StableReductionPartII:MC.2/polynomial-node-model`.

Proposed declaration: `NodeSectionFactorization.PolynomialModel.polynomialMonic`.

Proof: The leading X² coefficient is one; both other summands have smaller X degree. No nontriviality or discriminant condition is required.

### StableReductionPartII:MC.2/section-polynomial-freeness

The native quotient R=AdjoinRoot(F) is a free A[Y]-module, for the existing AdjoinRoot algebra structure.

Hypotheses: A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

Prerequisites: `StableReductionPartII:MC.2/section-polynomial-monic`, `mathlib:Polynomial.Monic.free_adjoinRoot`.

Proposed declaration: `NodeSectionFactorization.PolynomialModel.sectionPolynomialFree`.

Proof: Apply the pinned monic AdjoinRoot freeness theorem directly. This short freeness interface does not assume or replace the full two-coefficient normal-form theorem.

### StableReductionPartII:MC.2/section-polynomial-relation

With the inherited coordinates c,d,a,b in R, cb+da=0.

Hypotheses: A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

Prerequisites: `StableReductionPartII:MC.2/polynomial-node-model`, `StableReductionPartII:MC.2/binary-node-form`, `mathlib:AdjoinRoot.mk_self`.

Proposed declaration: `NodeSectionFactorization.PolynomialModel.sectionRelation`.

Proof: The actual quotient map sends F to zero. Expand q(s,t) and the definitions of c,d,a,b; commutative ring normalization identifies cb+da with the quotient relation.

### StableReductionPartII:MC.2/section-dual-divisibility

For every actual j∈J=(c,d), there exists z∈R with dz=bj.

Hypotheses: A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

Prerequisites: `StableReductionPartII:MC.2/section-polynomial-relation`, `mathlib:Ideal.mem_span_pair`.

Proposed declaration: `NodeSectionFactorization.PolynomialModel.dualGenerator_divisibility`.

Proof: Native binary ideal membership gives j=xc+yd. Choose z=−ax+by and use cb+da=0. No ideal-generation assumption, localization or inverse of d is introduced.

### StableReductionPartII:MC.2/section-dual-generator-formula

For every j∈J, d ε(j)=bj for the named canonical R-linear dualGenerator.

Hypotheses: A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

Prerequisites: `StableReductionPartII:MC.2/section-dual-generator`, `StableReductionPartII:MC.2/section-dual-divisibility`.

Proposed declaration: `NodeSectionFactorization.PolynomialModel.dualGenerator_spec`.

Proof: Apply the chosen witness specification in the canonical map. The map linearity was proved by cancelling the regular coordinate d.

### StableReductionPartII:MC.2/section-dual-generator-values

For every R-linear ε:J→R satisfying dε(j)=bj, ε(c)=−a and ε(d)=b, using actual proved membership of both generators.

Hypotheses: A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

Prerequisites: `StableReductionPartII:MC.2/section-dual-generator`, `StableReductionPartII:MC.2/section-coordinate-regular`, `StableReductionPartII:MC.2/section-polynomial-relation`.

Proposed declaration: `NodeSectionFactorization.PolynomialModel.dualGeneratorValues`.

Proof: Substitute c and d into the characterization. Use cb+da=0 for c and commutativity for d; cancel regular d.

### StableReductionPartII:MC.2/section-dual-correction-formula

For every r∈R, d K(r)=b(r−ι(ev(r))) for K=ε∘p.

Hypotheses: A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

Prerequisites: `StableReductionPartII:MC.2/section-dual-scalar-correction`, `StableReductionPartII:MC.2/section-dual-generator-formula`, `StableReductionPartII:MC.2/section-projection-formula`.

Proposed declaration: `NodeSectionFactorization.PolynomialModel.dualCorrectionMap_spec`.

Proof: Apply the canonical dual-generator identity to the actual ideal element p(r). Use the inherited projection formula p(r)=r−ι(ev(r)).

### StableReductionPartII:MC.2/section-dual-correction-product

For all r,z∈R, K(rz)=rK(z)+ι(ev(z))K(r).

Hypotheses: A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

Prerequisites: `StableReductionPartII:MC.2/section-dual-correction-formula`, `StableReductionPartII:MC.2/section-coordinate-regular`, `StableReductionPartII:MC.2/section-evaluation-kernel`.

Proposed declaration: `NodeSectionFactorization.PolynomialModel.dualCorrectionMap_product`.

Proof: Multiply both sides by d and use the correction identity at rz,z,r. The two native ring maps ev and ι preserve products. Ring normalization and cancellation of d prove the displayed orientation.

## Coefficient-change continuation — Codex codex-a71f92

This partial checkpoint uses the actual untruncated polynomial quotient and native section ideal. The coefficient change can be nonflat or noninjective, and coefficient rings can be zero or nonreduced. No family, completed-local or whole-dual tensor equivalence follows from these pointwise maps. Fresh selected reading of [Knudsen’s Introduction and full §3 Key Example](https://arxiv.org/html/1106.1588v2) supplies the motivating base-change requirement and regular target coordinate; the arbitrary-ring naturality arguments here are authored deductions, not a stronger printed geometric theorem.

### Semilinear coefficient map on the section ideal

StableReductionPartII:MC.2/section-ideal-coefficient-map; NodeSectionFactorization.PolynomialModel.idealCoefficientMap.

Retain R=AdjoinRoot(X²+C(γY)X+C(δY²−q(s,t))), ι:A→R, u=[X], v=[Y], c=u−ιs,d=v−ιt,b=u+ιs+ιγ·ιt, J=(c,d)=ker(ev), and the existing canonical projection p(r)=r−ιev(r) and dual generator ε:J→R with dε(j)=bj. Let R′,J′,p′,ε′ denote the same native objects with mapped coefficients, and φ:R→R′ the existing coefficient map induced by AdjoinRoot.map. Construct the actual φ-semilinear restriction ψ:J→J′, whose underlying ring value is ψ(j)=φ(j). It sends the two ordered ideal generators to their corresponding primed generators, satisfies ψ(rj)=φ(r)ψ(j), and obeys identity and composition on actual ideal elements. This restriction is not asserted injective or an equivalence; the tensor equivalence is a separate existing obligation.

Hypotheses: A and A′ are arbitrary commutative rings, including the zero ring; γ,δ,s,t∈A and f:A→A′ is any unital ring homomorphism. No flatness, injectivity, noetherianity or unit-discriminant hypothesis is imposed. Statements concern the untruncated explicit polynomial model, not arbitrary nodal families.

Dependencies: StableReductionPartII:MC.2/section-coefficient-map; StableReductionPartII:MC.2/section-evaluation-coefficient-naturality; StableReductionPartII:MC.2/section-evaluation-kernel; mathlib:LinearMap.map_smulₛₗ.

Proof: Naturality of ev sends every j∈ker(ev) into ker(ev′), hence into the native J′. Restrict the native ring homomorphism to the two native ideal subtypes; use its additive and multiplicative equations for the built semilinear LinearMap structure. The existing coefficient projection formulas give the two generator values. The native ring-map identity and composition prove the pointwise identities by subtype extensionality. A nonflat coefficient map can annihilate a nonzero ideal element; do not infer a pure-map inverse from a later tensor comparison.

Acceptance: Underlying carrier is the native Ideal.span subtype, not a new quotient or tensor carrier. Semilinearity uses φ on R-scalars; f-linearity without scalar transport would be ill-typed.

API:

- NodeSectionFactorization.PolynomialModel.idealCoefficientMap: The coefficient map restricts to an actual φ-semilinear map ψ:J→J′.
- NodeSectionFactorization.PolynomialModel.idealCoefficientMap_coe: For every j∈J, the underlying ring element of ψ(j) is φ(j).
- NodeSectionFactorization.PolynomialModel.idealCoefficientMap_first: ψ sends the native generator c with its actual membership proof to c′.
- NodeSectionFactorization.PolynomialModel.idealCoefficientMap_second: ψ sends the native generator d with its actual membership proof to d′.
- NodeSectionFactorization.PolynomialModel.idealCoefficientMap_identity: For the identity coefficient homomorphism, ψ(j)=j for every actual j∈J.
- NodeSectionFactorization.PolynomialModel.idealCoefficientMap_comp: For A→A′→A″, ψ_g(ψ_f(j))=ψ_{g∘f}(j), with all four parameters mapped.
- NodeSectionFactorization.PolynomialModel.idealCoefficientMap_smul: For every r∈R and j∈J, ψ(r•j)=φ(r)•ψ(j), using the existing ideal scalar actions.

Tests:

- NodeSectionFactorization.PolynomialModel.idealCoefficientMap.identity: For every coefficient ring and every actual ideal element j, the identity coefficient map fixes j.
- NodeSectionFactorization.PolynomialModel.idealCoefficientMap.generators: For every coefficient map, the ordered native section-ideal generators c and d map to c′ and d′; this excludes swapping the two coordinates or keeping unmapped parameters.
- NodeSectionFactorization.PolynomialModel.idealCoefficientMap.nonflat: For A=ℤ, γ=1,δ=s=t=0 and f:ℤ→ℤ/2, the actual ideal element j=2d is nonzero in the untruncated polynomial model, but ψ(j)=0. Thus arbitrary coefficient restriction is not injective and need not be flat.

Consumers:

- StableReductionPartII:MC.2/section-projection-coefficient-naturality: Provides the actual ideal-valued comparison rather than only equality after forgetting ideal membership.
- StableReductionPartII:MC.2/section-dual-generator-coefficient-naturality: Specifies the genuine input to ε′ when mapping j.
- StableReductionPartII:MC.2/section-ideal-base-change: The planned tensor comparison evaluates a′⊗j as ι′a′ times this underlying coefficient restriction; its bijectivity remains separate.

### Coefficient naturality of the ideal projection

StableReductionPartII:MC.2/section-projection-coefficient-naturality; NodeSectionFactorization.PolynomialModel.sectionProjection_coefficient_naturality.

Retain R=AdjoinRoot(X²+C(γY)X+C(δY²−q(s,t))), ι:A→R, u=[X], v=[Y], c=u−ιs,d=v−ιt,b=u+ιs+ιγ·ιt, J=(c,d)=ker(ev), and the existing canonical projection p(r)=r−ιev(r) and dual generator ε:J→R with dε(j)=bj. Let R′,J′,p′,ε′ denote the same native objects with mapped coefficients, and φ:R→R′ the existing coefficient map induced by AdjoinRoot.map. For every r∈R, ψ(p(r))=p′(φ(r)) as actual elements of J′.

Hypotheses: A and A′ are arbitrary commutative rings, including the zero ring; γ,δ,s,t∈A and f:A→A′ is any unital ring homomorphism. No flatness, injectivity, noetherianity or unit-discriminant hypothesis is imposed. Statements concern the untruncated explicit polynomial model, not arbitrary nodal families.

Dependencies: StableReductionPartII:MC.2/section-ideal-coefficient-map; StableReductionPartII:MC.2/section-evaluation-projection; StableReductionPartII:MC.2/section-projection-formula; StableReductionPartII:MC.2/section-evaluation-coefficient-naturality.

Proof: Apply native subtype extensionality. The left underlying value is φ(r−ιev(r))=φ(r)−ι′f(ev(r)). Naturality of evaluation identifies the last coefficient with ev′(φ(r)), exactly the right projection formula.

Acceptance: Equality is in the native target ideal, not merely in an unspecified ambient carrier.

Consumers:

- StableReductionPartII:MC.2/section-correction-coefficient-naturality: Together with generator naturality gives the canonical K=ε∘p specialization.

### Coefficient naturality of the canonical dual generator

StableReductionPartII:MC.2/section-dual-generator-coefficient-naturality; NodeSectionFactorization.PolynomialModel.dualGenerator_coefficient_naturality.

Retain R=AdjoinRoot(X²+C(γY)X+C(δY²−q(s,t))), ι:A→R, u=[X], v=[Y], c=u−ιs,d=v−ιt,b=u+ιs+ιγ·ιt, J=(c,d)=ker(ev), and the existing canonical projection p(r)=r−ιev(r) and dual generator ε:J→R with dε(j)=bj. Let R′,J′,p′,ε′ denote the same native objects with mapped coefficients, and φ:R→R′ the existing coefficient map induced by AdjoinRoot.map. For every actual j∈J, φ(ε(j))=ε′(ψ(j)). This is pointwise naturality of the existing canonical generators, not an isomorphism between the entire dual modules.

Hypotheses: A and A′ are arbitrary commutative rings, including the zero ring; γ,δ,s,t∈A and f:A→A′ is any unital ring homomorphism. No flatness, injectivity, noetherianity or unit-discriminant hypothesis is imposed. Statements concern the untruncated explicit polynomial model, not arbitrary nodal families.

Dependencies: StableReductionPartII:MC.2/section-ideal-coefficient-map; StableReductionPartII:MC.2/section-dual-generator; StableReductionPartII:MC.2/section-dual-generator-formula; StableReductionPartII:MC.2/section-coordinate-regular; StableReductionPartII:MC.2/section-coefficient-map.

Proof: Multiply both candidate values by the target regular element d′. Mapping dε(j)=bj and using φ(d)=d′ and φ(b)=b′ gives d′φ(ε(j))=b′φ(j). The primed generator formula at the actual ideal element ψ(j) gives the same value. Cancel multiplication by d′ in R′. No cancellation through φ or flat coefficient Hom-exchange theorem is used.

Acceptance: Only native target-coordinate regularity is used; injectivity of f or φ is not assumed.

Consumers:

- StableReductionPartII:MC.2/section-dual-base-change: Gives the exact pointwise ε formula consumed by the separately required canonical tensor-dual comparison.
- StableReductionPartII:MC.2/section-correction-coefficient-naturality: Combined with projection naturality proves canonical correction naturality.

### Additional API of Coefficient map of pointed node rings

NodeSectionFactorization.PolynomialModel.coefficientMapCoordinates: The existing φ sends all four section coordinates c,d,a,b to c′,d′,a′,b′, with mapped coefficients and the same order.


### Additional API of Scalar correction in dual coordinates

NodeSectionFactorization.PolynomialModel.dualCorrectionMap_coefficient_naturality: For the named canonical K=ε∘p, φ(K(r))=K′(φ(r)) for every coefficient map, without flatness.

NodeSectionFactorization.PolynomialModel.dualCorrectionMap.coefficientIdentity: The identity coefficient map fixes the named canonical correction K(r) for every r.

NodeSectionFactorization.PolynomialModel.dualCorrectionMap.coefficientProjection: For every actual j∈J and every coefficient map, φ(K(j))=ε′(ψ(j)); the ideal projection fixes j, so no artificial correction term remains.

NodeSectionFactorization.PolynomialModel.dualCorrectionMap.nonflatCharacteristicTwo: For the actual ℤ model with γ=1,δ=s=t=0 and f:ℤ→ℤ/2, φ(K(u))=u′. The source value is −u and its negative becomes equal to u′ only in characteristic two; nonflat change is allowed.

The existing generic correctionCoefficientNaturality signature is checked with actual proof bodies as well. Apply φ to the characterized equation, identify φ(d)=d′, φ(b)=b′ and the natural section evaluation, then cancel d′ in the receiving ring. This proof never cancels through φ. The named K specialization follows from projection and generator naturality. The nonflat ℤ→ℤ/2 fixture proves 2d≠0 by native regularity and the split coefficient evaluation, but ψ(2d)=0; it does not replace the polynomial ring by a finite truncation.

All eight moduli stages and the reserved moduli-curves key remain partial. Canonical tensor-dual and quotient equivalences, Hom/Ext exchange for arbitrary coefficient modules, the two-base completion comparison, relative stable reflexivity, pointed hulls, sheaf descent, arbitrary-base approximation, and every geometric/source supplier gap remain required. Matrix-factorization/MCM ownership and all existing requests remain unchanged.

### Historical coefficient-change checkpoint verification

Codex — codex-a71f92, 2026-10-02: indexed checker zero errors/warnings;
136 nodes,159 API items,145 definition/construction tests plus2 inherited
exactness tests,35 planets,78 baseline references,135 requests and14 gaps.
All133 inherited statements and130 whole node objects are preserved.
All eight stages and the reserved geometric moduli-curves key remain partial.
The exact complete suggested file elaborates with zero errors and204
admitted-proof warnings only,84 examples; its source SHA-256 is
b0e65a36e73f3882a9f6eb257a48f3269361ccc297dbe7a46f31fe4e8aa097c7.
The separately checked native coefficient-change archive elaborates without
errors or warnings,22 examples and51 kernel axiom audits, no admitted-proof
dependency; native source SHA-256
dbf4374d619b337b19727079fa52f712582a2e8dc921d0dd027b820f3c0a9ff8.
The eleven new signatures and six example statements match that native source.
These receipts certify only the explicit polynomial/ideal prototypes, not a
completed geometric roadmap or entire-dual tensor/Ext/completion theorem.
Proof recovery and exact verification recipes are in the current handoff and
[immutable allowed-file archive](https://github.com/CBirkbeck/tauceti-explorer/blob/29e68bdcb7165310e94bcdb11882d057685efa13/research/blueprint/suggested/StableReductionPartII.lean).
The actual atlas assembly has unchanged stage edges, acyclic scoped graphs
and all81 required supplier-stage paths reachable. Historical receipts above
retain their original worker attribution; these are the current checks.

## MC.2 continuation: ordered polynomial coordinates

This continuation fixes the coordinate and basis maps in the existing quotient. For every commutative A, set F=X²+C(γY)X+C(δY²−q(s,t)), R=AdjoinRoot(F), u=root(F), v=of(Y). No noetherianity, nonzero-discriminant, reducedness or domain assumption is used. The polynomial quotient is untruncated in Y. The reserved moduli-curves definition and all geometric stages remain partial.

The native A[Y]-linear equivalence E has inverse (p,q₁)↦of(p)+u·of(q₁). Over nontrivial A it specializes Mathlib’s monic power basis, reindexed by Fin 2, and its finite coordinate equivalence. Over subsingleton A the existing quotient and coefficient modules are subsingleton. This separate branch preserves the arbitrary-ring statement: natural degree two is asserted only in the nontrivial branch.

The native basis B has B(0)=1, B(1)=u. Composing it with Mathlib’s polynomial monomial basis through the actual scalar tower gives an A-basis indexed by N×Fin 2, with vector vⁿuⁱ at (n,i). Its representation takes the n-th polynomial coefficient of the i-th B-coordinate. This supplies the existing polynomial-normal-form endpoint and both freeness statements; the following continuation supplies the separate dual calculation.

### Degree of the node polynomial

`NodeSectionFactorization.PolynomialModel.polynomialNatDegree`: In the inherited native node ring R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), let u be its root and of:A[Y]→R its native coefficient map. If A is nontrivial, the outer natural degree of F is two. The zero ring is excluded only from this degree assertion.

Dependencies: `StableReductionPartII:MC.2/polynomial-node-model`, `mathlib:Polynomial.natDegree_quadratic`.

### Ordered polynomial coordinates

`NodeSectionFactorization.PolynomialModel.polynomialCoordinates`: In the inherited native node ring R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), let u be its root and of:A[Y]→R its native coefficient map. Construct the A[Y]-linear equivalence E:R≃A[Y]×A[Y] with E⁻¹(p,q₁)=of(p)+u·of(q₁), including the zero ring.

Dependencies: `StableReductionPartII:MC.2/section-polynomial-monic`, `StableReductionPartII:MC.2/polynomial-degree-two`, `mathlib:AdjoinRoot.powerBasis'`, `mathlib:Module.Basis.reindex`, `mathlib:Module.Basis.equivFun`, `mathlib:LinearEquiv.finTwoArrow`, `mathlib:LinearEquiv.ofSubsingleton`, `mathlib:Module.subsingleton`.

- `NodeSectionFactorization.PolynomialModel.polynomialCoordinates_of`: E(of(p))=(p,0).
- `NodeSectionFactorization.PolynomialModel.polynomialCoordinates_root`: E(u)=(0,1).
- `NodeSectionFactorization.PolynomialModel.polynomialCoordinates_symm`: E⁻¹(p,q₁)=of(p)+u·of(q₁).
- `NodeSectionFactorization.PolynomialModel.polynomialCoordinates_reconstruction`: of(E(r)₀)+u·of(E(r)₁)=r.
- `NodeSectionFactorization.PolynomialModel.polynomialCoordinates_unique`: There is a unique ordered coefficient pair representing r.

- Test `NodeSectionFactorization.PolynomialModel.coordinatesZeroRing` (degenerate): Over Z/1Z, E(r)=(0,0) for every native quotient element r.
- Test `NodeSectionFactorization.PolynomialModel.coordinatesCharacteristicTwoRoot` (computation): Over Z/2Z with γ=1,δ=s=t=0, E(u)=(0,1), in that order.
- Test `NodeSectionFactorization.PolynomialModel.coordinatesNonreducedPolynomial` (computation): Over Z/4Z with all parameters zero, E(of(2Y⁹))=(2Y⁹,0).

### Coordinate reconstruction map

`NodeSectionFactorization.PolynomialModel.polynomialCoordinates_symm`: In the inherited native node ring R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), let u be its root and of:A[Y]→R its native coefficient map. For all p,q₁∈A[Y], E⁻¹(p,q₁)=of(p)+u·of(q₁).

Dependencies: `StableReductionPartII:MC.2/polynomial-coordinate-equivalence`.

### Reconstruction from ordered coordinates

`NodeSectionFactorization.PolynomialModel.polynomialCoordinates_reconstruction`: In the inherited native node ring R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), let u be its root and of:A[Y]→R its native coefficient map. For every r, of(E(r)₀)+u·of(E(r)₁)=r.

Dependencies: `StableReductionPartII:MC.2/polynomial-coordinate-inverse`.

### Unique ordered coefficient pair

`NodeSectionFactorization.PolynomialModel.polynomialCoordinates_unique`: In the inherited native node ring R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), let u be its root and of:A[Y]→R its native coefficient map. For every r there exists a unique ordered pair (p,q₁) with of(p)+u·of(q₁)=r.

Dependencies: `StableReductionPartII:MC.2/polynomial-coordinate-reconstruction`, `StableReductionPartII:MC.2/polynomial-coordinate-inverse`.

### The ordered basis one and root

`NodeSectionFactorization.PolynomialModel.polynomialBasis`: In the inherited native node ring R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), let u be its root and of:A[Y]→R its native coefficient map. Construct a native A[Y]-basis B indexed by Fin 2 with B(0)=1 and B(1)=u, including subsingleton A.

Dependencies: `StableReductionPartII:MC.2/polynomial-coordinate-equivalence`, `mathlib:Module.Basis.ofEquivFun`, `mathlib:LinearEquiv.finTwoArrow`.

- `NodeSectionFactorization.PolynomialModel.polynomialBasis_apply`: For every i∈Fin 2, B(i)=uⁱ.
- `NodeSectionFactorization.PolynomialModel.polynomialBasis_zero`: B(0)=1.
- `NodeSectionFactorization.PolynomialModel.polynomialBasis_one`: B(1)=u.

- Test `NodeSectionFactorization.PolynomialModel.basisConstant` (characterisation): For every commutative A and every parameter tuple B(0)=1.
- Test `NodeSectionFactorization.PolynomialModel.basisRoot` (characterisation): For every commutative A and every parameter tuple B(1)=u.
- Test `NodeSectionFactorization.PolynomialModel.basisZeroRing` (degenerate): Over Z/1Z with zero parameters B(1)=0.

### Values of the two-term basis

`NodeSectionFactorization.PolynomialModel.polynomialBasis_apply`: In the inherited native node ring R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), let u be its root and of:A[Y]→R its native coefficient map. For every i∈Fin 2, B(i)=uⁱ.

Dependencies: `StableReductionPartII:MC.2/polynomial-two-term-basis`, `StableReductionPartII:MC.2/polynomial-coordinate-inverse`.

### Untruncated node monomial basis

`NodeSectionFactorization.PolynomialModel.polynomialMonomialBasis`: In the inherited native node ring R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), let u be its root and of:A[Y]→R its native coefficient map. Construct a native A-basis indexed by N×Fin 2; its vector at (n,i) is vⁿuⁱ, with no bound on n. The A-action is the inherited polynomial/AdjoinRoot scalar tower.

Dependencies: `StableReductionPartII:MC.2/polynomial-two-term-basis`, `mathlib:Polynomial.basisMonomials`, `mathlib:Module.Basis.smulTower`, `mathlib:Module.Basis.smulTower_repr`.

- `NodeSectionFactorization.PolynomialModel.polynomialMonomialBasis_apply`: The (n,i)-vector is vⁿuⁱ.
- `NodeSectionFactorization.PolynomialModel.polynomialMonomialBasis_tower`: This basis equals the pinned scalar-tower composition of the native polynomial monomial basis with B.
- `NodeSectionFactorization.PolynomialModel.polynomialMonomialBasis_repr`: The coefficient at (n,i) is the n-th polynomial basis coordinate of the i-th B-coordinate of r.

- Test `NodeSectionFactorization.PolynomialModel.monomialBasisUntruncated` (computation): Over Z/2Z, γ=1 and remaining parameters zero, the (37,0)-vector is v³⁷.
- Test `NodeSectionFactorization.PolynomialModel.monomialBasisNonreduced` (computation): Over Z/4Z with zero parameters, the (3,1)-vector is v³u.
- Test `NodeSectionFactorization.PolynomialModel.monomialBasisZeroRing` (degenerate): Over Z/1Z with zero parameters, the (37,1)-vector is zero.

### Values of the node monomial basis

`NodeSectionFactorization.PolynomialModel.polynomialMonomialBasis_apply`: In the inherited native node ring R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), let u be its root and of:A[Y]→R its native coefficient map. For every n∈N and i∈Fin 2 the A-basis vector at (n,i) equals vⁿuⁱ.

Dependencies: `StableReductionPartII:MC.2/polynomial-monomial-basis`, `StableReductionPartII:MC.2/polynomial-two-term-basis-values`, `mathlib:Module.Basis.smulTower_apply`, `mathlib:Polynomial.coe_basisMonomials`.

The existing `normalForm` keeps its statement and reverses the unique-coordinate equality to its prescribed orientation; `normalFormFree` uses the two specified bases. Acceptance requires coordinate order, compatibility with native monic division and the existing coefficient action, the zero ring, nonreduced coefficients and arbitrarily high Y powers.

Source: Knudsen, [arXiv:1106.1588v2 §3](https://arxiv.org/html/1106.1588v2#S3), the monic-division step preceding Proposition 3.1. The published setup is noetherian with unit discriminant. The stronger arbitrary-ring polynomial calculation here is justified by the checked specialization of pinned Mathlib, and does not strengthen the paper’s stable-reflexivity or completion conclusions. Full §3 setup and Proposition 3.1/Corollary 3.2 proofs were freshly reread; historical full-paper and Appendix readings retain their predecessor attribution.

The following continuation establishes the stated complete dual normal form and residue. Remaining algebraic obligations are the two prescribed cokernel maps with transpose/sign conventions, arbitrary coefficient-module Hom and Ext exchange, and canonical tensor-dual equivalences. Completed-local hulls, relative stable reflexivity, sheaf globalization, arbitrary-base approximation and MC.0–MC.7 moduli/positivity/Picard targets remain as recorded in the inherited gap and request ledgers.

## MC.2 continuation: complete native section-dual coordinates

This continuation proves the stated polynomial section-dual normal form over
any commutative A, including zero and nonreduced rings. It uses the existing
ordered A[Y]-coordinates E and the previously characterized canonical ε.
Neither the dual coordinates nor the residue are assumptions on the native
ideal. The published §3 proposition uses noetherian A and unit discriminant;
the broader coefficient-ring range here is an authored monic-polynomial
calculation checked separately in Lean. It supplies no completion or family
strengthening of Knudsen’s relative stable-reflexivity theorem.

For h∈D write E(h(d))=(p,q₁). R-linearity gives ch(d)=dh(c).
The second coordinate of cr is E(r)₀−(s+γY)E(r)₁, while multiplying
by d multiplies both coordinates by Y−t. Evaluating the commutation
relation at Y=t therefore gives p(t)=(s+γt)q₁(t). Put α=q₁(t).
The pinned arbitrary-ring monic division theorem gives polynomials p₀,q₀
with p−C(p(t))=(Y−t)p₀ and q₁−C(α)=(Y−t)q₀.
For r=E⁻¹(p₀,q₀), the ordered coordinates of b are (C(s+γt),1),
so h(d)=dr+ιαb. For every actual j∈J, commutation and dε(j)=bj
give d(h(j)−rj−ιαε(j))=0. Regularity of d proves existence.

For uniqueness, an equality dr+ιαb=dr′+ια′b has equal second
coordinates. Evaluation at t kills the d terms and gives α=α′.
Regularity of d then gives r=r′. This avoids a quotient-annihilator
argument with an unproved cancellation step. The second normal coordinate
belongs to A, and the first belongs to the actual untruncated ring R.

The native multiplication map m:R→D is R-linear and injective: evaluate
m(r)=m(z) at d and cancel d. The map (r,α)↦m(r)+αε is A-linear
for the inherited scalar tower, and normal-form existence and uniqueness
make it bijective. The pinned native linear-equivalence constructor supplies
the equivalence with exactly this inverse. The inclusion has pair (1,0),
and the actual canonical ε has pair (0,1), also over Z/4Z.

The already characterized correction K gives
(z−ιev(z))ε(j)=K(z)j after multiplication and cancellation by d.
Thus if h has pair (r,α), zh has pair (zr+ιαK(z),ev(z)α).
This is proved before the residue construction, so the two results do not
depend circularly on each other. The residue is the second linear projection
of these coordinates. It is surjective, sends ε to 1, and has kernel exactly
the image of the actual m. Its ring action is ρ(zh)=ev(z)ρ(h).
The induced quotient identification remains the separate canonical quotient
adapter in the plan; that entire adapter has not been proof-checked here.

Over nonzero A, a ring-linear section σ would satisfy
dσ(1)=σ(ev(d))=σ(0)=0. Pointwise regularity of d makes σ(1)=0,
contradicting ρσ(1)=1. The native non-example is checked for every nonzero
coefficient ring, rather than only for a field. The A-linear coefficient
section supplied by ε remains valid. The eight new canonical tests also
exercise the actual equivalence/inverse and surjective residue, and m(0),
m(1) and m(r)=0 exactly when r=0.

The twelve consumed declaration interfaces follow. General polynomial
quotient, linear-map and module theory are imported from the pinned library.
Every inherited statement, hypothesis, acceptance criterion and source contract
is preserved. Current check counts, exact hashes and durable proof/atlas
reconstruction recipes are in the [handoff](../handoff/DESIGN-StableReductionPartII.md).

### Coefficient multiplication in node coordinates

`StableReductionPartII:MC.2/polynomial-coordinate-coefficient-multiplication` — lemma.

For any commutative A and γ,δ,s,t∈A, retain the actual R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, J=(c,d), D=Hom_R(J,R), and the ordered native equivalence E:R≃A[Y]×A[Y]. For p∈A[Y], r∈R, E(of(p)r)=(pE(r)₀,pE(r)₁).

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) Apply the existing A[Y]-linearity of E and identify the native algebra map with of.

**Dependencies:** `StableReductionPartII:MC.2/polynomial-coordinate-equivalence`, `mathlib:AdjoinRoot.algebraMap_eq`.

**Declaration:** `NodeSectionFactorization.PolynomialModel.polynomialCoordinates_coefficient_mul`.

**Acceptance:** Keep the native quotient and ideal, ordered polynomial coordinates and the zero/nonreduced base cases; do not assume a dual normal form.

**Source:** knudsen2012, arXiv:1106.1588v2 §3 Key Example and complete proofs of Proposition 3.1 and Corollary 3.2.

### Multiplication by the second section coordinate

`StableReductionPartII:MC.2/polynomial-coordinate-section-multiplication` — lemma.

For any commutative A and γ,δ,s,t∈A, retain the actual R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, J=(c,d), D=Hom_R(J,R), and the ordered native equivalence E:R≃A[Y]×A[Y]. E(dr)=((Y−t)E(r)₀,(Y−t)E(r)₁).

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) Identify d=of(Y−t) in the actual quotient and apply coefficient multiplication.

**Dependencies:** `StableReductionPartII:MC.2/polynomial-coordinate-coefficient-multiplication`, `StableReductionPartII:MC.2/polynomial-node-model`.

**Declaration:** `NodeSectionFactorization.PolynomialModel.polynomialCoordinates_second_mul`.

**Acceptance:** Keep the native quotient and ideal, ordered polynomial coordinates and the zero/nonreduced base cases; do not assume a dual normal form.

**Source:** knudsen2012, arXiv:1106.1588v2 §3 Key Example and complete proofs of Proposition 3.1 and Corollary 3.2.

### Multiplication by the node root

`StableReductionPartII:MC.2/polynomial-coordinate-root-multiplication` — lemma.

For any commutative A and γ,δ,s,t∈A, retain the actual R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, J=(c,d), D=Hom_R(J,R), and the ordered native equivalence E:R≃A[Y]×A[Y]. E(ur)=((q(s,t)−δY²)E(r)₁,E(r)₀−γYE(r)₁).

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) The actual defining quotient relation gives u²=of(q(s,t)−δY²)−u·of(γY). (2) Reconstruct r in its ordered coordinates; expand ur and use the injective inverse E⁻¹ to identify both entries.

**Dependencies:** `StableReductionPartII:MC.2/polynomial-coordinate-equivalence`, `StableReductionPartII:MC.2/polynomial-coordinate-inverse`, `StableReductionPartII:MC.2/polynomial-coordinate-reconstruction`, `mathlib:AdjoinRoot.mk_self`.

**Declaration:** `NodeSectionFactorization.PolynomialModel.polynomialCoordinates_root_mul`.

**Acceptance:** Keep the native quotient and ideal, ordered polynomial coordinates and the zero/nonreduced base cases; do not assume a dual normal form.

**Source:** knudsen2012, arXiv:1106.1588v2 §3 Key Example and complete proofs of Proposition 3.1 and Corollary 3.2.

### Second coefficient of first-coordinate multiplication

`StableReductionPartII:MC.2/polynomial-coordinate-first-multiplication` — lemma.

For any commutative A and γ,δ,s,t∈A, retain the actual R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, J=(c,d), D=Hom_R(J,R), and the ordered native equivalence E:R≃A[Y]×A[Y]. E(cr)₁=E(r)₀−(s+γY)E(r)₁.

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) Expand (u−ιs)r and subtract the coefficient-multiplication formula from the root formula.

**Dependencies:** `StableReductionPartII:MC.2/polynomial-coordinate-root-multiplication`, `StableReductionPartII:MC.2/polynomial-coordinate-coefficient-multiplication`.

**Declaration:** `NodeSectionFactorization.PolynomialModel.polynomialCoordinates_first_mul`.

**Acceptance:** Keep the native quotient and ideal, ordered polynomial coordinates and the zero/nonreduced base cases; do not assume a dual normal form.

**Source:** knudsen2012, arXiv:1106.1588v2 §3 Key Example and complete proofs of Proposition 3.1 and Corollary 3.2.

### Commutation of ideal values in the dual

`StableReductionPartII:MC.2/section-dual-value-commutation` — lemma.

For any commutative A and γ,δ,s,t∈A, retain the actual R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, J=(c,d), D=Hom_R(J,R), and the ordered native equivalence E:R≃A[Y]×A[Y]. For h∈D and j,k∈J, jh(k)=kh(j).

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) The actual ideal scalar products jk and kj agree as subtype elements; apply the R-linear map h.

**Dependencies:** `StableReductionPartII:MC.2/polynomial-node-model`.

**Declaration:** `NodeSectionFactorization.PolynomialModel.dualValue_commutes`.

**Acceptance:** Keep the native quotient and ideal, ordered polynomial coordinates and the zero/nonreduced base cases; do not assume a dual normal form.

**Source:** knudsen2012, arXiv:1106.1588v2 §3 Key Example and complete proofs of Proposition 3.1 and Corollary 3.2.

### Section evaluation of a dual value

`StableReductionPartII:MC.2/section-dual-value-section-relation` — lemma.

For any commutative A and γ,δ,s,t∈A, retain the actual R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, J=(c,d), D=Hom_R(J,R), and the ordered native equivalence E:R≃A[Y]×A[Y]. For j_d=⟨d⟩∈J, evaluating at Y=t gives E(h(j_d))₀(t)=(s+γt)E(h(j_d))₁(t).

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) Apply commutation at the two actual ideal generators c,d. (2) Take the second polynomial coordinate, evaluate at t, and use Y−t=0; no reducedness of A is used.

**Dependencies:** `StableReductionPartII:MC.2/section-dual-value-commutation`, `StableReductionPartII:MC.2/polynomial-coordinate-first-multiplication`, `StableReductionPartII:MC.2/polynomial-coordinate-section-multiplication`, `StableReductionPartII:MC.2/section-dual-generator`.

**Declaration:** `NodeSectionFactorization.PolynomialModel.dualValue_at_second`.

**Acceptance:** Keep the native quotient and ideal, ordered polynomial coordinates and the zero/nonreduced base cases; do not assume a dual normal form.

**Source:** knudsen2012, arXiv:1106.1588v2 §3 Key Example and complete proofs of Proposition 3.1 and Corollary 3.2.

### Coordinates of the dual numerator

`StableReductionPartII:MC.2/polynomial-coordinate-dual-numerator` — lemma.

For any commutative A and γ,δ,s,t∈A, retain the actual R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, J=(c,d), D=Hom_R(J,R), and the ordered native equivalence E:R≃A[Y]×A[Y]. E(b)=(C(s+γt),1).

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) Write b=u+of(C(s+γt)); use the ordered root and coefficient values of E.

**Dependencies:** `StableReductionPartII:MC.2/polynomial-coordinate-equivalence`, `StableReductionPartII:MC.2/polynomial-node-model`.

**Declaration:** `NodeSectionFactorization.PolynomialModel.polynomialCoordinates_dualNumerator`.

**Acceptance:** Keep the native quotient and ideal, ordered polynomial coordinates and the zero/nonreduced base cases; do not assume a dual normal form.

**Source:** knudsen2012, arXiv:1106.1588v2 §3 Key Example and complete proofs of Proposition 3.1 and Corollary 3.2.

### Polynomial decomposition of the second dual value

`StableReductionPartII:MC.2/section-dual-value-decomposition` — lemma.

For any commutative A and γ,δ,s,t∈A, retain the actual R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, J=(c,d), D=Hom_R(J,R), and the ordered native equivalence E:R≃A[Y]×A[Y]. For every h∈D there exists (r,α)∈R×A such that h(⟨d⟩)=dr+ιαb.

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) Put (p,q₁)=E(h(⟨d⟩)) and α=q₁(t). The preceding relation identifies p(t)=(s+γt)α. (2) Divide p−C(p(t)) and q₁−C(α) by the monic Y−t using the existing arbitrary-ring divisibility theorem. (3) For the resulting quotient polynomials p₀,q₀, set r=E⁻¹(p₀,q₀). The two coordinate multiplication formulas give the stated equality by injectivity of E.

**Dependencies:** `StableReductionPartII:MC.2/section-dual-value-section-relation`, `StableReductionPartII:MC.2/polynomial-coordinate-equivalence`, `StableReductionPartII:MC.2/polynomial-coordinate-inverse`, `StableReductionPartII:MC.2/polynomial-coordinate-section-multiplication`, `StableReductionPartII:MC.2/polynomial-coordinate-coefficient-multiplication`, `StableReductionPartII:MC.2/polynomial-coordinate-dual-numerator`, `mathlib:Polynomial.X_sub_C_dvd_sub_C_eval`.

**Declaration:** `NodeSectionFactorization.PolynomialModel.dualValue_decomposition`.

**Acceptance:** Keep the native quotient and ideal, ordered polynomial coordinates and the zero/nonreduced base cases; do not assume a dual normal form.

**Source:** knudsen2012, arXiv:1106.1588v2 §3 Key Example and complete proofs of Proposition 3.1 and Corollary 3.2.

### Existence of section-dual normal coordinates

`StableReductionPartII:MC.2/section-dual-normal-existence` — lemma.

For any commutative A and γ,δ,s,t∈A, retain the actual R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, J=(c,d), D=Hom_R(J,R), and the ordered native equivalence E:R≃A[Y]×A[Y]. Given ε∈D with dε(j)=bj, every h∈D admits (r,α)∈R×A with h(j)=rj+ιαε(j) for all j∈J.

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) Choose the pair from h(⟨d⟩). Multiply the desired equality on any j by d. (2) Use jh(⟨d⟩)=dh(j) and dε(j)=bj; cancel the already proved regular d.

**Dependencies:** `StableReductionPartII:MC.2/section-dual-value-decomposition`, `StableReductionPartII:MC.2/section-dual-value-commutation`, `StableReductionPartII:MC.2/section-coordinate-regular`, `StableReductionPartII:MC.2/section-dual-generator`.

**Declaration:** `NodeSectionFactorization.PolynomialModel.dualNormalForm_exists`.

**Acceptance:** Keep the native quotient and ideal, ordered polynomial coordinates and the zero/nonreduced base cases; do not assume a dual normal form.

**Source:** knudsen2012, arXiv:1106.1588v2 §3 Key Example and complete proofs of Proposition 3.1 and Corollary 3.2.

### Uniqueness from the second ideal generator

`StableReductionPartII:MC.2/section-dual-coordinate-uniqueness` — lemma.

For any commutative A and γ,δ,s,t∈A, retain the actual R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, J=(c,d), D=Hom_R(J,R), and the ordered native equivalence E:R≃A[Y]×A[Y]. If dr+ιαb=dr′+ια′b for pairs in R×A, then (r,α)=(r′,α′).

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) Take the second E-coordinate and evaluate at t. The d term vanishes and the b term evaluates to α, so α=α′. (2) Subtract the equal numerator terms, then cancel regular d to obtain r=r′.

**Dependencies:** `StableReductionPartII:MC.2/polynomial-coordinate-section-multiplication`, `StableReductionPartII:MC.2/polynomial-coordinate-coefficient-multiplication`, `StableReductionPartII:MC.2/polynomial-coordinate-dual-numerator`, `StableReductionPartII:MC.2/section-coordinate-regular`.

**Declaration:** `NodeSectionFactorization.PolynomialModel.dualValue_coordinates_unique`.

**Acceptance:** Keep the native quotient and ideal, ordered polynomial coordinates and the zero/nonreduced base cases; do not assume a dual normal form.

**Source:** knudsen2012, arXiv:1106.1588v2 §3 Key Example and complete proofs of Proposition 3.1 and Corollary 3.2.

### Multiplication into the actual section dual

`StableReductionPartII:MC.2/section-dual-multiplication` — construction.

For any commutative A and γ,δ,s,t∈A, retain the actual R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, J=(c,d), D=Hom_R(J,R), and the ordered native equivalence E:R≃A[Y]×A[Y]. Construct m:R→D, m(r)(j)=rj, as an R-linear map. It is injective and uses the existing ideal inclusion.

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) The formula is R-linear in both its argument and its ideal input by commutativity. (2) If m(r)=m(z), evaluate at the actual generator d and cancel regular d.

**Dependencies:** `StableReductionPartII:MC.2/polynomial-node-model`, `StableReductionPartII:MC.2/section-coordinate-regular`.

**Declaration:** `NodeSectionFactorization.PolynomialModel.dualMultiplication`.

**API.**

- `NodeSectionFactorization.PolynomialModel.dualMultiplication` (constructor): m(r) is the R-linear map j↦rj.
- `NodeSectionFactorization.PolynomialModel.dualMultiplicationApply` (simp): m(r)(j)=rj on each actual ideal element.
- `NodeSectionFactorization.PolynomialModel.dualMultiplicationInjective` (characterisation): The actual map m is injective, including for the zero coefficient ring.

**Discriminating tests.**

- `NodeSectionFactorization.PolynomialModel.multiplicationZero` (degenerate): m(0)=0 in the actual native dual.
- `NodeSectionFactorization.PolynomialModel.multiplicationOne` (compatibility): m(1)(j)=j for every actual ideal element j.
- `NodeSectionFactorization.PolynomialModel.multiplicationFaithful` (characterisation): m(r)=0 if and only if r=0; multiplication does not lose nonzero quotient elements.

**Uses.** StableReductionPartII:MC.2/section-dual-normal-equivalence: The first coordinate of the inverse is the actual multiplication map, restricted to A scalars.; StableReductionPartII:MC.2/section-dual-residue: Its actual injective image is the residue kernel.; StableReductionPartII:MC.2/section-dual-quotient-equivalence: The quotient is by the native range of this map; an arbitrary unidentified submodule is not sufficient.

**Acceptance:** Keep the native quotient and ideal, ordered polynomial coordinates and the zero/nonreduced base cases; do not assume a dual normal form.

**Source:** knudsen2012, arXiv:1106.1588v2 §3 Key Example and complete proofs of Proposition 3.1 and Corollary 3.2.

### Correction of the ring action on the dual generator

`StableReductionPartII:MC.2/section-dual-generator-action` — lemma.

For any commutative A and γ,δ,s,t∈A, retain the actual R=AdjoinRoot(F), F=X²+C(γY)X+C(δY²−q(s,t)), u=[X], v=[Y], ι:A→R, c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, J=(c,d), D=Hom_R(J,R), and the ordered native equivalence E:R≃A[Y]×A[Y]. If dε(j)=bj and dK(z)=b(z−ιev(z)), then (z−ιev(z))ε(j)=K(z)j.

**Hypotheses:** A is any commutative ring, including the zero ring; γ,δ,s,t∈A. No noetherianity, regularity of A or unit discriminant is assumed for this polynomial-model statement.

**Construction/proof.** (1) Multiply both sides by d; the two given formulas make them equal by commutativity. (2) Cancel the already proved regular d.

**Dependencies:** `StableReductionPartII:MC.2/section-dual-generator`, `StableReductionPartII:MC.2/section-dual-correction-formula`, `StableReductionPartII:MC.2/section-coordinate-regular`.

**Declaration:** `NodeSectionFactorization.PolynomialModel.dualGenerator_action`.

**Acceptance:** Keep the native quotient and ideal, ordered polynomial coordinates and the zero/nonreduced base cases; do not assume a dual normal form.

**Source:** knudsen2012, arXiv:1106.1588v2 §3 Key Example and complete proofs of Proposition 3.1 and Corollary 3.2.

The specified ideal and dual matrix cokernels, including the negative second
generator and transpose complexes, arbitrary coefficient-module Hom exchange,
canonical bidual evaluation, higher Ext vanishings, and natural tensor-dual
comparisons remain required. Two-base completion, the relative
stable-reflexivity criterion, the pointed completed-local hull, actual sheaf
comparison and arbitrary-base approximation remain separate obligations.
All MC.0–MC.7 geometric targets, the reserved key and six consumers, fourteen
gaps and 135 supplier requests retain their existing ownership and scope.


## MC.2: coefficient-universal matrix complexes and tensor cokernels

For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products.

The two actual surjections P_J and P_D have A-flat codomains. Pinned right exactness supplies each tensorized presentation; the flat-cokernel injection theorem supplies injectivity of each tensorized matrix-image inclusion. Factor each matrix through its image to deduce exactness for arbitrary M. This argument treats the nonflat module Z/2 over Z. The displayed symplectic rotation intertwines Ψ with Φᵀ and Φ with Ψᵀ. Its native tensor equivalence transports the two ordinary exact pairs to both transpose pairs.

The two cokernel equivalences are the existing right-exact tensor quotient construction specialized to the actual presentations. Their representative formulas fix every tensor, not only chosen bases. The second basis class maps to −d for J and −ε for D. This local calculation supplies universal acyclicity of the matrix pairs as coefficient modules. The actual module-valued Hom comparisons, bidual maps, Ext interpretation, relative stable-reflexivity interface and completion/sheaf comparisons remain required.

### Tensor inclusion of the left matrix image

NodeSectionFactorization.PolynomialModel.leftImage_lTensor_injective — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. T_M(im(Φ)↪R²) is injective; M need not be flat.

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: The actual surjection P_D has kernel im Φ and A-flat codomain D. Apply the pinned short-exact-sequence tensor-injection theorem with this cokernel.

Dependencies: StableReductionPartII:MC.2/section-dual-coefficient-flat, StableReductionPartII:MC.2/section-dual-presentation-surjective, StableReductionPartII:MC.2/section-dual-presentation-kernel, mathlib:LinearMap.lTensor_injective_of_exact_of_flat.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Tensor inclusion of the right matrix image

NodeSectionFactorization.PolynomialModel.rightImage_lTensor_injective — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. T_M(im(Ψ)↪R²) is injective; M need not be flat.

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: The actual surjection P_J has kernel im Ψ and A-flat codomain J. Apply the pinned short-exact-sequence tensor-injection theorem with this cokernel.

Dependencies: StableReductionPartII:MC.2/section-ideal-coefficient-flat, StableReductionPartII:MC.2/section-ideal-presentation-surjective, StableReductionPartII:MC.2/section-ideal-presentation-kernel, mathlib:LinearMap.lTensor_injective_of_exact_of_flat.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Coefficient universal exactness at Φ

NodeSectionFactorization.PolynomialModel.quotientLeft_lTensor_exact — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. ker T_M(Φ)=im T_M(Ψ).

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: Factor Φ through its actual image. The restricted corestriction is surjective and its preceding pair is exact. Pinned right exactness preserves that pair for arbitrary M. Postcompose with the proved tensor-image injection and use the native tensor composition law to recover T_M(Φ).

Dependencies: StableReductionPartII:MC.2/section-complex-left-exact, StableReductionPartII:MC.2/section-left-image-tensor-injective, mathlib:lTensor_exact, mathlib:LinearMap.rangeRestrict, mathlib:LinearMap.ker_rangeRestrict, mathlib:LinearMap.surjective_rangeRestrict, mathlib:LinearMap.subtype_comp_rangeRestrict, mathlib:LinearMap.lTensor_comp, mathlib:Function.Injective.comp_exact_iff_exact.

Test NodeSectionFactorization.PolynomialModel.tensorTorsionLeftExact (compatibility): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. For A=Z, γ=s=1, δ=t=0 and the torsion M=Z/2, the actual left alternating tensor pair is exact.

Test NodeSectionFactorization.PolynomialModel.tensorZeroRingLeftExact (degenerate): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. For A=Z/1 with zero parameters and M=Z/1, the actual left alternating tensor pair is exact.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Coefficient universal exactness at Ψ

NodeSectionFactorization.PolynomialModel.quotientRight_lTensor_exact — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. ker T_M(Ψ)=im T_M(Φ).

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: Factor Ψ through its actual image. The restricted corestriction is surjective and its preceding pair is exact. Pinned right exactness preserves that pair for arbitrary M. Postcompose with the proved tensor-image injection and use the native tensor composition law to recover T_M(Ψ).

Dependencies: StableReductionPartII:MC.2/section-complex-right-exact, StableReductionPartII:MC.2/section-right-image-tensor-injective, mathlib:lTensor_exact, mathlib:LinearMap.rangeRestrict, mathlib:LinearMap.ker_rangeRestrict, mathlib:LinearMap.surjective_rangeRestrict, mathlib:LinearMap.subtype_comp_rangeRestrict, mathlib:LinearMap.lTensor_comp, mathlib:Function.Injective.comp_exact_iff_exact.

Test NodeSectionFactorization.PolynomialModel.tensorTorsionRightExact (compatibility): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. For A=Z, γ=s=1, δ=t=0 and the torsion M=Z/2, the actual right alternating tensor pair is exact.

Test NodeSectionFactorization.PolynomialModel.tensorZeroRingRightExact (degenerate): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. For A=Z/1 with zero parameters and M=Z/1, the actual right alternating tensor pair is exact.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### The symplectic rotation of section coordinates

NodeSectionFactorization.PolynomialModel.sectionRotation — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. Construct the R-linear equivalence p:R²≃R² with p(z₀,z₁)=(−z₁,z₀) and inverse p⁻¹(z₀,z₁)=(z₁,−z₀).

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: Define both ordered coordinate functions; verify both inverse laws and R-linearity coordinatewise.

Dependencies: StableReductionPartII:MC.2/polynomial-node-model.

API NodeSectionFactorization.PolynomialModel.sectionRotation_apply (simp): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. p(z₀,z₁)=(−z₁,z₀).

API NodeSectionFactorization.PolynomialModel.sectionRotation_symm_apply (simp): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. p⁻¹(z₀,z₁)=(z₁,−z₀).

API NodeSectionFactorization.PolynomialModel.sectionRotation_square (compatibility): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. p(p(z))=−z.

Test NodeSectionFactorization.PolynomialModel.rotationFirstBasis (computation): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. p(1,0)=(0,1).

Test NodeSectionFactorization.PolynomialModel.rotationNonreducedSquare (computation): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. For A=Z/4, γ=s=1 and δ=t=0, p(p(z))=−z on the actual node coordinates.

Test NodeSectionFactorization.PolynomialModel.rotationZeroRing (degenerate): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. For A=Z/1 and zero parameters, the constructed rotation inverse fixes p(z).

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Evaluation of the section rotation

NodeSectionFactorization.PolynomialModel.sectionRotation_apply — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. p(z₀,z₁)=(−z₁,z₀).

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: Unfold the actual constructed equivalence.

Dependencies: StableReductionPartII:MC.2/section-matrix-rotation.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Inverse of the section rotation

NodeSectionFactorization.PolynomialModel.sectionRotation_symm_apply — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. p⁻¹(z₀,z₁)=(z₁,−z₀).

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: Unfold the inverse of the actual constructed equivalence.

Dependencies: StableReductionPartII:MC.2/section-matrix-rotation.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Square of the section rotation

NodeSectionFactorization.PolynomialModel.sectionRotation_square — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. p(p(z))=−z.

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: Apply the coordinate formula twice and double-negation in each coordinate.

Dependencies: StableReductionPartII:MC.2/section-matrix-rotation-formula.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Rotation intertwines Φ transpose

NodeSectionFactorization.PolynomialModel.transposeLeft_rotation — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. Φᵀ∘p=p∘Ψ.

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: Evaluate the existing native matrix action and the actual rotation on each of the two coordinates; retain the minus signs.

Dependencies: StableReductionPartII:MC.2/section-matrix-rotation-formula, StableReductionPartII:MC.2/section-matrix-transpose-left-action, StableReductionPartII:MC.2/section-matrix-right-action.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Rotation intertwines Ψ transpose

NodeSectionFactorization.PolynomialModel.transposeRight_rotation — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. Ψᵀ∘p=p∘Φ.

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: Evaluate the existing native matrix action and the actual rotation on each of the two coordinates; retain the minus signs.

Dependencies: StableReductionPartII:MC.2/section-matrix-rotation-formula, StableReductionPartII:MC.2/section-matrix-transpose-right-action, StableReductionPartII:MC.2/section-matrix-left-action.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Tensor rotation intertwines Φ transpose

NodeSectionFactorization.PolynomialModel.transposeLeft_lTensor_rotation — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. T_M(Φᵀ)∘T_M(p)=T_M(p)∘T_M(Ψ), where T_M(p) is the pinned tensor of the coefficient-restricted equivalence.

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: Restrict the actual R-linear intertwining identity to A. Tensor its two compositions using the pinned composition law and equivalence coercion formula.

Dependencies: StableReductionPartII:MC.2/section-transpose-left-rotation, mathlib:LinearEquiv.restrictScalars, mathlib:LinearEquiv.lTensor, mathlib:LinearEquiv.coe_lTensor, mathlib:LinearMap.lTensor_comp.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Tensor rotation intertwines Ψ transpose

NodeSectionFactorization.PolynomialModel.transposeRight_lTensor_rotation — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. T_M(Ψᵀ)∘T_M(p)=T_M(p)∘T_M(Φ), where T_M(p) is the pinned tensor of the coefficient-restricted equivalence.

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: Restrict the actual R-linear intertwining identity to A. Tensor its two compositions using the pinned composition law and equivalence coercion formula.

Dependencies: StableReductionPartII:MC.2/section-transpose-right-rotation, mathlib:LinearEquiv.restrictScalars, mathlib:LinearEquiv.lTensor, mathlib:LinearEquiv.coe_lTensor, mathlib:LinearMap.lTensor_comp.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Coefficient universal exactness at Φᵀ

NodeSectionFactorization.PolynomialModel.quotientTransposeLeft_lTensor_exact — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. ker T_M(Φᵀ)=im T_M(Ψᵀ).

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: Use T_M(p) in all three columns of the commuting ladder. The pinned exactness transport along linear equivalences gives this transposed pair from the opposite ordinary pair.

Dependencies: StableReductionPartII:MC.2/section-transpose-left-tensor-rotation, StableReductionPartII:MC.2/section-transpose-right-tensor-rotation, StableReductionPartII:MC.2/section-complex-right-tensor-exact, mathlib:Function.Exact.of_ladder_linearEquiv_of_exact.

Test NodeSectionFactorization.PolynomialModel.tensorTorsionTransposeLeftExact (compatibility): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. For A=Z, γ=s=1, δ=t=0 and the torsion M=Z/2, the actual transposed left alternating tensor pair is exact.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Coefficient universal exactness at Ψᵀ

NodeSectionFactorization.PolynomialModel.quotientTransposeRight_lTensor_exact — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. ker T_M(Ψᵀ)=im T_M(Φᵀ).

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: Use T_M(p) in all three columns of the commuting ladder. The pinned exactness transport along linear equivalences gives this transposed pair from the opposite ordinary pair.

Dependencies: StableReductionPartII:MC.2/section-transpose-left-tensor-rotation, StableReductionPartII:MC.2/section-transpose-right-tensor-rotation, StableReductionPartII:MC.2/section-complex-left-tensor-exact, mathlib:Function.Exact.of_ladder_linearEquiv_of_exact.

Test NodeSectionFactorization.PolynomialModel.tensorTorsionTransposeRightExact (compatibility): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. For A=Z, γ=s=1, δ=t=0 and the torsion M=Z/2, the actual transposed right alternating tensor pair is exact.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Tensor exactness of the ideal presentation

NodeSectionFactorization.PolynomialModel.idealPresentation_lTensor_exact — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. ker T_M(P_J)=im T_M(Ψ).

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: The actual native presentation is surjective with the stated matrix kernel. Apply pinned tensor right exactness without assuming M flat.

Dependencies: StableReductionPartII:MC.2/section-ideal-presentation-kernel, StableReductionPartII:MC.2/section-ideal-presentation-surjective, mathlib:LinearMap.exact_iff, mathlib:lTensor_exact.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Tensor exactness of the dual presentation

NodeSectionFactorization.PolynomialModel.dualPresentation_lTensor_exact — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. ker T_M(P_D)=im T_M(Φ).

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: The actual native presentation is surjective with the stated matrix kernel. Apply pinned tensor right exactness without assuming M flat.

Dependencies: StableReductionPartII:MC.2/section-dual-presentation-kernel, StableReductionPartII:MC.2/section-dual-presentation-surjective, mathlib:LinearMap.exact_iff, mathlib:lTensor_exact.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### The tensorized ideal cokernel

NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. Construct the A-linear equivalence E_J:coker T_M(Ψ)≃M⊗_A J characterized by E_J([z])=T_M(P_J)(z).

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: Apply the pinned right-exact tensor quotient equivalence to the actual ordered presentation and its verified kernel. The domain is the actual quotient by the image of the tensorized matrix and the codomain is the actual tensor of J, with their inherited coefficient structures.

Dependencies: StableReductionPartII:MC.2/section-ideal-presentation-kernel, StableReductionPartII:MC.2/section-ideal-presentation-surjective, mathlib:LinearMap.exact_iff, mathlib:lTensor.equiv.

API NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal_mk (simp): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. E_J([z])=T_M(P_J)(z) for every tensor z, including sums of pure tensors.

API NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal_tmul (simp): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. E_J([m⊗z])=m⊗P_J(z).

API NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal_inverse (compatibility): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. E_J⁻¹(T_M(P_J)(z))=[z].

API NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal_unique (extensionality): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. Any A-linear equivalence e:coker T_M(Ψ)≃M⊗_A J with e([z])=T_M(P_J)(z) for every tensor z equals E_J.

Test NodeSectionFactorization.PolynomialModel.tensorIdealZero (degenerate): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. For every M, the actual E_J sends zero to zero.

Test NodeSectionFactorization.PolynomialModel.tensorIdealPureTensor (compatibility): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. For every M,m,z, E_J([m⊗z])=m⊗P_J(z), with the actual ordered presentation.

Test NodeSectionFactorization.PolynomialModel.tensorIdealRepresentativeRoundTrip (characterisation): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. For every M and tensor z, E_J⁻¹(T_M(P_J)(z))=[z].

Test NodeSectionFactorization.PolynomialModel.tensorIdealTorsionNegativeGenerator (computation): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. For A=Z, γ=s=1, δ=t=0 and M=Z/2, E_J([1⊗(0,1)])=1⊗(-d) in the actual section ideal.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Evaluation on a ideal quotient representative

NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal_mk — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. E_J([z])=T_M(P_J)(z) for every tensor z, including sums of pure tensors.

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: The pinned tensor-quotient lift evaluates on its actual representative.

Dependencies: StableReductionPartII:MC.2/section-ideal-tensor-cokernel.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Evaluation on a pure ideal tensor

NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal_tmul — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. E_J([m⊗z])=m⊗P_J(z).

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: Apply the representative formula and native tensor-map evaluation on pure tensors.

Dependencies: StableReductionPartII:MC.2/section-ideal-tensor-cokernel-representative, mathlib:LinearMap.lTensor_tmul.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Inverse on a ideal presentation image

NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal_inverse — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. E_J⁻¹(T_M(P_J)(z))=[z].

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: Rewrite by the representative formula and use the constructed native equivalence inverse law.

Dependencies: StableReductionPartII:MC.2/section-ideal-tensor-cokernel-representative.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Uniqueness of the ideal tensor comparison

NodeSectionFactorization.PolynomialModel.tensorCokernelIdeal_unique — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. Any A-linear equivalence e:coker T_M(Ψ)≃M⊗_A J with e([z])=T_M(P_J)(z) for every tensor z equals E_J.

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: Prove equality on every quotient representative by native quotient induction.

Dependencies: StableReductionPartII:MC.2/section-ideal-tensor-cokernel-representative, mathlib:Submodule.Quotient.induction_on.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### The tensorized dual cokernel

NodeSectionFactorization.PolynomialModel.tensorCokernelDual — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. Construct the A-linear equivalence E_D:coker T_M(Φ)≃M⊗_A D characterized by E_D([z])=T_M(P_D)(z).

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: Apply the pinned right-exact tensor quotient equivalence to the actual ordered presentation and its verified kernel. The domain is the actual quotient by the image of the tensorized matrix and the codomain is the actual tensor of D, with their inherited coefficient structures.

Dependencies: StableReductionPartII:MC.2/section-dual-presentation-kernel, StableReductionPartII:MC.2/section-dual-presentation-surjective, mathlib:LinearMap.exact_iff, mathlib:lTensor.equiv.

API NodeSectionFactorization.PolynomialModel.tensorCokernelDual_mk (simp): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. E_D([z])=T_M(P_D)(z) for every tensor z, including sums of pure tensors.

API NodeSectionFactorization.PolynomialModel.tensorCokernelDual_tmul (simp): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. E_D([m⊗z])=m⊗P_D(z).

API NodeSectionFactorization.PolynomialModel.tensorCokernelDual_inverse (compatibility): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. E_D⁻¹(T_M(P_D)(z))=[z].

API NodeSectionFactorization.PolynomialModel.tensorCokernelDual_unique (extensionality): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. Any A-linear equivalence e:coker T_M(Φ)≃M⊗_A D with e([z])=T_M(P_D)(z) for every tensor z equals E_D.

Test NodeSectionFactorization.PolynomialModel.tensorDualZero (degenerate): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. For every M, the actual E_D sends zero to zero.

Test NodeSectionFactorization.PolynomialModel.tensorDualPureTensor (compatibility): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. For every M,m,z, E_D([m⊗z])=m⊗P_D(z), with the actual ordered presentation.

Test NodeSectionFactorization.PolynomialModel.tensorDualRepresentativeRoundTrip (characterisation): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. For every M and tensor z, E_D⁻¹(T_M(P_D)(z))=[z].

Test NodeSectionFactorization.PolynomialModel.tensorDualTorsionNegativeGenerator (computation): For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. For A=Z, γ=s=1, δ=t=0 and M=Z/2, E_D([1⊗(0,1)])=1⊗(-ε) in the actual R-linear dual.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Evaluation on a dual quotient representative

NodeSectionFactorization.PolynomialModel.tensorCokernelDual_mk — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. E_D([z])=T_M(P_D)(z) for every tensor z, including sums of pure tensors.

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: The pinned tensor-quotient lift evaluates on its actual representative.

Dependencies: StableReductionPartII:MC.2/section-dual-tensor-cokernel.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Evaluation on a pure dual tensor

NodeSectionFactorization.PolynomialModel.tensorCokernelDual_tmul — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. E_D([m⊗z])=m⊗P_D(z).

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: Apply the representative formula and native tensor-map evaluation on pure tensors.

Dependencies: StableReductionPartII:MC.2/section-dual-tensor-cokernel-representative, mathlib:LinearMap.lTensor_tmul.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Inverse on a dual presentation image

NodeSectionFactorization.PolynomialModel.tensorCokernelDual_inverse — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. E_D⁻¹(T_M(P_D)(z))=[z].

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: Rewrite by the representative formula and use the constructed native equivalence inverse law.

Dependencies: StableReductionPartII:MC.2/section-dual-tensor-cokernel-representative.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

### Uniqueness of the dual tensor comparison

NodeSectionFactorization.PolynomialModel.tensorCokernelDual_unique — For any commutative ring A and γ,δ,s,t∈A, put q(x,y)=x²+γxy+δy², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀·incl−z₁·ε, where dε(j)=bj. Restrict these maps to A. For every A-module M write T_M(f)=id_M⊗_A f, on the actual native tensor products. Any A-linear equivalence e:coker T_M(Φ)≃M⊗_A D with e([z])=T_M(P_D)(z) for every tensor z equals E_D.

Hypotheses: A and M may be zero or have torsion. No noetherianity, unit discriminant or flatness of M is required. Tensoring is over A, not over R.

Proof route: Prove equality on every quotient representative by native quotient induction.

Dependencies: StableReductionPartII:MC.2/section-dual-tensor-cokernel-representative, mathlib:Submodule.Quotient.induction_on.

Acceptance: Use the actual node ring, section ideal, R-linear dual and ordered native matrix maps. All coefficient restrictions and quotient carriers are specified. These local tensor statements do not assert arbitrary coefficient-module Hom exchange, biduality, higher Ext vanishing, completed-local comparison or the geometric stable-reflexivity theorem.

Source: Knudsen, arXiv:1106.1588v2 §3, printed pp.11–12; the rotation identities are printed, and the universal tensor conclusions are the authored deduction described above.

## Coefficient-module tensor–Hom comparisons

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m.

The R-action on N_M and on both source tensors acts on their first factors. On Hom it acts on the codomain. The coefficient action is the actual A→R algebra action; it is not transported through a chosen vector-space basis or a completed ring. All maps below use native tensor products, native ideals and native R-linear maps.

The native finite-product tensor comparison and finite-free Hom coordinate equivalence supply E_M. They are baseline inputs, not new definitions in this roadmap. The two suggested bridge abbreviations retain those native objects and their pure-tensor formula. The non-routine coefficient-Hom transpose compatibility is a separate lemma.

The canonical comparisons are θ_D,M(h⊗m)(j)=h(j)⊗m and θ_J,M(j⊗m)(h)=h(j)⊗m. Native heterobasic tensor lifting supplies their inherited R-linearity. The missing content is their bijectivity for every A-module M, even when M is not flat over A. Finite projectivity of J over R is not an assumption: the known projectivity of J over A is a different assertion. Pinned same-ring finite-projective tensor–Hom equivalences and flat ambient R-algebra Hom change do not supply this two-ring coefficient statement.

### Signed coordinate argument

C_J,M(h)=E_M⁻¹(h∘P_J) and C_D,M(h)=E_M⁻¹(h∘P_D) are A-linear. Their ordinary pair coordinates are respectively (h(c),−h(d)) and (h(incl),−h(ε)). Surjectivity of the two actual presentations makes these coordinate maps injective. The transpose bridge implies U_M(Ψᵀ)C_J,M(h)=0 and U_M(Φᵀ)C_D,M(h)=0.

The two decisive identities are

- C_J,M θ_D,M U_M(P_D)=−U_M(p)U_M(Ψ);
- C_D,M θ_J,M U_M(P_J)=U_M(p)U_M(Φ).

They follow by expanding P_J(z)=z₀c−z₁d in the actual ideal subtype, evaluating P_D against it, and substituting ε(c)=−a and ε(d)=b. A minus sign occurs in the first identity but not the second. Tensor induction extends the formulas from pure tensors to arbitrary sums.

For injectivity of θ_D,M, lift a difference tensor through U_M(P_D). The first identity reduces vanishing to U_M(Ψ)z=0. Universal exactness gives z in im U_M(Φ), and the tensorized P_D presentation kills that image. For surjectivity, C_J,M(h) lies in ker U_M(Ψᵀ), hence equals U_M(Φᵀ)w. The rotation identity gives the explicit preimage U_M(P_D)(−U_M(p)⁻¹w). The proof for θ_J,M uses the second identity, ker U_M(Φ)=im U_M(Ψ), and the preimage U_M(P_J)(U_M(p)⁻¹w). Every exactness input is an existing coefficient-universal matrix or presentation node; flatness is not silently transferred to M.

### Canonicality, actions and unit specialization

The two R-linear equivalences retain θ_D,M and θ_J,M as their actual forward maps. Their inverse-on-pure-image formulas and uniqueness follow from native equivalence laws and heterobasic tensor extensionality. For every A-linear f:M→M′, the square formed by θ and id⊗f commutes on arbitrary tensors. Identity and composition follow from the existing native tensor-map functor laws, not a new private coefficient category.

For M=A, postcompose θ_D,A by the native R-linear right-unit equivalence R⊗_A A≃R. This is the native right-unit map D⊗_A A≃D. The analogous specialization of θ_J,A is exactly Module.Dual.eval R J after J⊗_A A≃J. Thus the coefficient-valued calculation agrees with the preceding ordinary bidual result. It does not assert that Hom commutes with a different base/source completion or with arbitrary sheaf descent.

The torsion fixtures take A=Z and M=Z/3, with zero parameters; they test both canonical maps without a flat coefficient assumption. Nonreduced and zero coefficient rings are also covered. The signed-generator fixtures deliberately use −ε and −d, distinguishing the actual ordered presentation from a sign-erased variant.

### Declaration specifications and APIs


#### The actual dual coefficient-Hom map

Identifier: StableReductionPartII:MC.2/section-dual-coefficient-hom-map. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom. Kind: construction.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Construct the R-linear map θ_D,M:D⊗_A M→Hom_R(J,N_M), characterized on pure tensors by θ_D,M(h⊗m)(j)=h(j)⊗m.

Prerequisites: StableReductionPartII:MC.2/section-dual-multiplication; StableReductionPartII:MC.2/coefficient-inclusion-action; mathlib:TensorProduct.AlgebraTensorModule.lift.

Construction or proof:

- Apply the pinned heterobasic tensor lift to (h,m)↦(j↦h(j)⊗m). Verify R-linearity in h and j and A-balancing in m using the inherited scalar tower.
- The source is the actual R-linear dual D; the target has the inherited left R-action on R⊗_A M.

API:

- NodeSectionFactorization.PolynomialModel.sectionDualTensorHom_tmul (simp): For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. For h∈D,m∈M,j∈J, θ_D,M(h⊗m)(j)=h(j)⊗m.
- NodeSectionFactorization.PolynomialModel.sectionDualTensorHom_natural (functoriality): For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. For any A-linear f:M→M′, tensor x∈D⊗_A M and j∈J, θ_D,M′((id_D⊗f)x)(j)=(id_R⊗f)(θ_D,M(x)(j)). All tensor maps are the native R-linear heterobasic maps.
- NodeSectionFactorization.PolynomialModel.sectionDualTensorHom_unit (compatibility): For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. For M=A and every x∈D⊗_A A, postcompose θ_D,A(x) with the native R-linear unit R⊗_A A≃R. The result equals the native unit D⊗_A A≃D applied to x.

Unit tests:

- NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_zero (degenerate): The actual canonical map θ_D,M sends the zero tensor to the zero R-linear homomorphism.
- NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_inclusion (computation): For every j∈J and m∈M, θ_D,M(incl⊗m)(j)=j⊗m in the actual R⊗_A M.
- NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_negative_epsilon (computation): For every m∈M, θ_D,M(−ε⊗m)(c)=a⊗m; the ordered negative second generator is not silently replaced by ε.

Uses:

- Knudsen arXiv:1106.1588v2 §3 Proposition3.1, Corollary3.2; the MC.2 arbitrary-section expansion: Supplies the actual module-valued Hom exchange calculation needed before relative stable-reflexivity and completed-local/sheaf descent.
- StableReductionPartII:MC.2/dual-section-ideal: Use the separately identified canonical map, signed coordinates and coefficient-module naturality, without inferring higher Ext or geometry.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### Pure tensors in the dual Hom comparison

Identifier: StableReductionPartII:MC.2/section-dual-coefficient-hom-pure. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom_tmul. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. For h∈D,m∈M,j∈J, θ_D,M(h⊗m)(j)=h(j)⊗m.

Prerequisites: StableReductionPartII:MC.2/section-dual-coefficient-hom-map.

Construction or proof:

- Evaluate the native lift on a pure tensor.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### Coefficient Hom and matrix transpose

Identifier: StableReductionPartII:MC.2/section-free-coefficient-hom-transpose. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionFreeTensorHom_matrix. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. For every 2×2 matrix W over R and every tensor z∈R²⊗_A M, E_M(U_M(Wᵀ)z)=E_M(z)∘W, where W is its native matrix-to-linear map.

Prerequisites: mathlib:TensorProduct.piLeft; mathlib:LinearEquiv.piRing; mathlib:LinearEquiv.piRing_symm_apply.

Construction or proof:

- Use tensor induction. The pure-tensor case evaluates E_M via the native finite-free Hom formula, expands the two finite sums and rearranges ring multiplication; addition and zero follow from linearity.

Source: mathlib-a71f92-finite-free-coordinates, Pinned Mathlib: TensorProduct/Pi.lean lines50–116 and LinearAlgebra/Pi.lean lines538–559; actual section presentations as listed prerequisites. Reuse the native finite-product tensor and finite-free Hom coordinates. The listed model-specific presentation and transpose calculation is the authored deduction; no generic tensor/product or Hom construction is replanned.

#### Ideal Hom coordinates with coefficients

Identifier: StableReductionPartII:MC.2/section-ideal-coefficient-hom-coordinates. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates. Kind: construction.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Construct the A-linear map C_J,M:Hom_R(J,N_M)→R²⊗_A M as C_J,M(h)=E_M⁻¹(h∘P_J). In ordinary pair coordinates this uses (h(c),−h(d)).

Prerequisites: StableReductionPartII:MC.2/section-ideal-presentation; mathlib:LinearMap.lcomp; mathlib:TensorProduct.piLeft; mathlib:LinearEquiv.piRing.

Construction or proof:

- Compose the pinned Hom precomposition map for P_J with E_M⁻¹.
- Use the ordered negative second generator of the actual ideal presentation.

API:

- NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates_injective (extensionality): For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. The map C_J,M is injective.
- NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates_relation (relation): For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. U_M(Ψᵀ) C_J,M(h)=0 for every h:J→N_M.
- NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates_presentation (projection): For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. C_J,M(θ_D,M(U_M(P_D)z))=−U_M(p)U_M(Ψ)z for every tensor z∈R²⊗_A M.

Unit tests:

- NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates.test_zero (degenerate): The ideal-Hom coordinate map C_J sends zero to the zero tensor in R²⊗_A M.
- NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates.test_negative_second (computation): Under the native finite-free coordinate equivalence E_M, C_J(h) evaluated at the second standard basis vector equals −h(d), not h(d).
- NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates.test_faithful (characterisation): Equality of the actual ideal-Hom coordinates implies equality of the R-linear maps, for every coefficient module M.

Uses:

- Knudsen arXiv:1106.1588v2 §3 Proposition3.1, Corollary3.2; the MC.2 arbitrary-section expansion: Supplies the actual module-valued Hom exchange calculation needed before relative stable-reflexivity and completed-local/sheaf descent.
- StableReductionPartII:MC.2/dual-section-ideal: Use the separately identified canonical map, signed coordinates and coefficient-module naturality, without inferring higher Ext or geometry.

Source: mathlib-a71f92-finite-free-coordinates, Pinned Mathlib: TensorProduct/Pi.lean lines50–116 and LinearAlgebra/Pi.lean lines538–559; actual section presentations as listed prerequisites. Reuse the native finite-product tensor and finite-free Hom coordinates. The listed model-specific presentation and transpose calculation is the authored deduction; no generic tensor/product or Hom construction is replanned.

#### Faithful ideal Hom coordinates

Identifier: StableReductionPartII:MC.2/section-ideal-coefficient-hom-coordinates-injective. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates_injective. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. The map C_J,M is injective.

Prerequisites: StableReductionPartII:MC.2/section-ideal-coefficient-hom-coordinates; StableReductionPartII:MC.2/section-ideal-presentation-surjective; mathlib:LinearMap.lcomp_injective_of_surjective.

Construction or proof:

- Cancel E_M⁻¹ and use the listed surjectivity of P_J to compare homomorphisms on every element of J.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### Ideal Hom relations after coefficient tensoring

Identifier: StableReductionPartII:MC.2/section-ideal-coefficient-hom-relations. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates_relation. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. U_M(Ψᵀ) C_J,M(h)=0 for every h:J→N_M.

Prerequisites: StableReductionPartII:MC.2/section-ideal-coefficient-hom-coordinates; StableReductionPartII:MC.2/section-free-coefficient-hom-transpose; StableReductionPartII:MC.2/section-ideal-presentation-kernel; mathlib:LinearMap.exact_iff.

Construction or proof:

- Use the coefficient-Hom transpose bridge to identify the image under E_M with h∘P_J∘Ψ.
- The listed ideal presentation kernel implies P_J∘Ψ=0; apply h to this actual zero relation.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### The signed section-ideal generators

Identifier: StableReductionPartII:MC.2/section-ideal-presentation-generators. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionIdealPresentation_generators. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. P_J(z)=z₀·c−z₁·d as an equality in the actual ideal subtype J, not only after inclusion into R.

Prerequisites: StableReductionPartII:MC.2/section-ideal-presentation-formula; StableReductionPartII:MC.2/section-dual-generator-values.

Construction or proof:

- Use the actual P_J formula, ideal subtype extensionality and commutativity of ring multiplication.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### Dual-Hom coordinates on its tensor presentation

Identifier: StableReductionPartII:MC.2/section-ideal-coefficient-hom-presentation. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionIdealHomCoordinates_presentation. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. C_J,M(θ_D,M(U_M(P_D)z))=−U_M(p)U_M(Ψ)z for every tensor z∈R²⊗_A M.

Prerequisites: StableReductionPartII:MC.2/section-ideal-coefficient-hom-coordinates; StableReductionPartII:MC.2/section-dual-coefficient-hom-pure; StableReductionPartII:MC.2/section-ideal-presentation-generators; StableReductionPartII:MC.2/section-dual-presentation-formula; StableReductionPartII:MC.2/section-dual-generator-values; StableReductionPartII:MC.2/section-matrix-right-action; StableReductionPartII:MC.2/section-matrix-rotation-formula; mathlib:LinearEquiv.rTensor_tmul.

Construction or proof:

- Cancel E_M and use tensor induction.
- For a pure tensor evaluate the actual P_D on the signed P_J expansion; use ε(c)=−a and ε(d)=b, then the explicit Ψ and p formulas.
- The equality holds on arbitrary tensors by linearity; the minus sign is essential.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### Right-tensor rotation of the first transpose

Identifier: StableReductionPartII:MC.2/section-transpose-left-right-tensor-rotation. Suggested declaration: NodeSectionFactorization.PolynomialModel.transposeLeft_rTensor_rotation. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. U_M(Φᵀ)∘U_M(p)=U_M(p)∘U_M(Ψ), using the native tensor of the coefficient-restricted rotation equivalence.

Prerequisites: StableReductionPartII:MC.2/section-transpose-left-rotation; mathlib:LinearMap.rTensor_comp; mathlib:LinearEquiv.coe_rTensor.

Construction or proof:

- Apply the native right-tensor map to Φᵀ∘p=p∘Ψ and the pinned composition/coercion formulas.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### Injectivity of the dual coefficient-Hom map

Identifier: StableReductionPartII:MC.2/section-dual-coefficient-hom-injective. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom_injective. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. The actual R-linear map θ_D,M is injective for every coefficient module M.

Prerequisites: StableReductionPartII:MC.2/section-dual-coefficient-hom-presentation; StableReductionPartII:MC.2/section-dual-presentation-surjective; StableReductionPartII:MC.2/section-complex-right-tensor-exact; StableReductionPartII:MC.2/section-dual-presentation-tensor-exact; mathlib:LinearMap.rTensor_surjective; mathlib:LinearMap.rTensor_exact_iff_lTensor_exact.

Construction or proof:

- By tensor surjectivity of P_D, write a difference tensor as U_M(P_D)z.
- If its θ_D image vanishes, the coordinate-presentation formula and invertibility of U_M(p) give U_M(Ψ)z=0.
- Use the listed coefficient-universal exactness, transported through native tensor commutation, to write z in im U_M(Φ). The tensor presentation exactness then gives U_M(P_D)z=0.

Unit tests:

- NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv.test_nonreduced (compatibility): Both comparisons apply over the nonreduced coefficient ring Z/4; for the dual take M=Z/4 and all parameters zero.

Source: mathlib-a71f92-right-tensor-exactness, Pinned TensorProduct/RightExactness.lean lines148–179; actual section presentation/universal exactness inputs listed as prerequisites. Reuses native tensor surjectivity and equivalence of left/right tensor exactness. The actual canonical coefficient-Hom bijectivity is the authored signed-presentation deduction, not a consequence of coefficient flatness alone.

#### Surjectivity of the dual coefficient-Hom map

Identifier: StableReductionPartII:MC.2/section-dual-coefficient-hom-surjective. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom_surjective. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. The actual R-linear map θ_D,M is surjective for every coefficient module M.

Prerequisites: StableReductionPartII:MC.2/section-ideal-coefficient-hom-relations; StableReductionPartII:MC.2/section-ideal-coefficient-hom-coordinates-injective; StableReductionPartII:MC.2/section-ideal-coefficient-hom-presentation; StableReductionPartII:MC.2/section-transpose-left-right-tensor-rotation; StableReductionPartII:MC.2/section-complex-transpose-right-tensor-exact; mathlib:LinearMap.rTensor_exact_iff_lTensor_exact.

Construction or proof:

- For h:J→N_M, its coordinates y=C_J,M(h) lie in ker U_M(Ψᵀ). Universal transpose exactness supplies w with U_M(Φᵀ)w=y.
- The right-tensor rotation identity and coordinate-presentation formula show that U_M(P_D)(−U_M(p)⁻¹w) maps to h; cancel the injective C_J,M.

Source: mathlib-a71f92-right-tensor-exactness, Pinned TensorProduct/RightExactness.lean lines148–179; actual section presentation/universal exactness inputs listed as prerequisites. Reuses native tensor surjectivity and equivalence of left/right tensor exactness. The actual canonical coefficient-Hom bijectivity is the authored signed-presentation deduction, not a consequence of coefficient flatness alone.

#### Coefficient tensor–Hom equivalence for the dual

Identifier: StableReductionPartII:MC.2/section-dual-coefficient-hom-equivalence. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv. Kind: construction.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Construct the R-linear equivalence Θ_D,M:D⊗_A M≃Hom_R(J,N_M) whose forward map is θ_D,M. It holds for every M, including nonflat torsion modules.

Prerequisites: StableReductionPartII:MC.2/section-dual-coefficient-hom-map; StableReductionPartII:MC.2/section-dual-coefficient-hom-injective; StableReductionPartII:MC.2/section-dual-coefficient-hom-surjective; mathlib:LinearEquiv.ofBijective.

Construction or proof:

- Use the separately proved injectivity and surjectivity of the actual canonical θ_D,M and the native bijective-linear-map equivalence.
- Do not use finite-projectivity over R or impose flatness on M.

API:

- NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv_tmul (simp): For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Θ_D,M(h⊗m)(j)=h(j)⊗m.
- NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv_inverse (equivalence): For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Θ_D,M⁻¹(θ_D,M(h⊗m))=h⊗m.
- NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv_unique (characterisation): For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Any R-linear equivalence e:D⊗_A M≃Hom_R(J,N_M) satisfying e(h⊗m)(j)=h(j)⊗m for all h,m,j equals Θ_D,M.

Unit tests:

- NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv.test_inverse (characterisation): The inverse of the actual dual tensor–Hom equivalence sends θ_D,M(h⊗m) to h⊗m.
- NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv.test_ring_action (compatibility): For actual r∈R, x∈D⊗_A M and j∈J, θ_D,M(rx)(j)=rθ_D,M(x)(j) for the inherited left R-action on both tensors.
- NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv.test_torsion (compatibility): For A=Z, γ=δ=s=t=0 and M=Z/3, the canonical dual tensor–Hom map is bijective; no flatness of the coefficient module is required.

Uses:

- Knudsen arXiv:1106.1588v2 §3 Proposition3.1, Corollary3.2; the MC.2 arbitrary-section expansion: Supplies the actual module-valued Hom exchange calculation needed before relative stable-reflexivity and completed-local/sheaf descent.
- StableReductionPartII:MC.2/dual-section-ideal: Use the separately identified canonical map, signed coordinates and coefficient-module naturality, without inferring higher Ext or geometry.

Source: knudsen2012, §3 Proposition3.1 and Corollary3.2, with §4 Main Lemma proof; arXiv:1106.1588v2. Motivates the polynomial dual and coefficient-universal complexes. The displayed module-valued Hom comparison in this arbitrary-ring range is an authored deduction through the separately listed coordinate and exactness lemmas; it does not assert the printed relative stable-reflexivity conclusion.

#### The dual Hom equivalence on generators

Identifier: StableReductionPartII:MC.2/section-dual-coefficient-hom-equivalence-pure. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv_tmul. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Θ_D,M(h⊗m)(j)=h(j)⊗m.

Prerequisites: StableReductionPartII:MC.2/section-dual-coefficient-hom-equivalence; StableReductionPartII:MC.2/section-dual-coefficient-hom-pure.

Construction or proof:

- The native equivalence retains θ_D,M as its actual forward map.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### Coefficient-module naturality of the dual comparison

Identifier: StableReductionPartII:MC.2/section-dual-coefficient-hom-naturality. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom_natural. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. For any A-linear f:M→M′, tensor x∈D⊗_A M and j∈J, θ_D,M′((id_D⊗f)x)(j)=(id_R⊗f)(θ_D,M(x)(j)). All tensor maps are the native R-linear heterobasic maps.

Prerequisites: StableReductionPartII:MC.2/section-dual-coefficient-hom-pure; mathlib:TensorProduct.AlgebraTensorModule.map; mathlib:TensorProduct.AlgebraTensorModule.map_tmul.

Construction or proof:

- Use tensor induction; on h⊗m both sides equal h(j)⊗f(m), then use additivity and zero.
- Naturality is for arbitrary coefficient modules and A-linear maps, not just scalar-algebra extensions.

Unit tests:

- NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_naturality (compatibility): Postcomposing the coefficient module by any A-linear f:M→M′ commutes with θ_D on arbitrary tensors, not only pure tensors.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### The coefficient-valued bidual evaluation map

Identifier: StableReductionPartII:MC.2/section-ideal-coefficient-hom-map. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom. Kind: construction.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Construct the R-linear map θ_J,M:J⊗_A M→Hom_R(D,N_M), θ_J,M(j⊗m)(h)=h(j)⊗m.

Prerequisites: StableReductionPartII:MC.2/section-dual-multiplication; StableReductionPartII:MC.2/coefficient-inclusion-action; mathlib:TensorProduct.AlgebraTensorModule.lift; mathlib:Module.Dual.eval.

Construction or proof:

- Use the pinned heterobasic lift of the actual evaluation pairing, checking R-linearity in j and h and A-balancing in m.
- No substitute dual carrier, completed ring or chosen tensor action is introduced.

API:

- NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom_tmul (simp): For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. θ_J,M(j⊗m)(h)=h(j)⊗m.
- NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom_natural (functoriality): For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. For any A-linear f:M→M′, x∈J⊗_A M and h∈D, θ_J,M′((id_J⊗f)x)(h)=(id_R⊗f)(θ_J,M(x)(h)).
- NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom_unit (compatibility): For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. For M=A and x∈J⊗_A A, postcomposing θ_J,A(x) by the native unit R⊗_A A≃R equals Module.Dual.eval R J applied to the native unit J⊗_A A≃J of x.

Unit tests:

- NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_zero (degenerate): The actual canonical evaluation map θ_J,M sends the zero tensor to zero.
- NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_inclusion (computation): For every j∈J and m∈M, θ_J,M(j⊗m)(incl)=j⊗m.
- NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_negative_second (computation): For every m∈M, θ_J,M(−d⊗m)(ε)=−b⊗m in R⊗_A M.

Uses:

- Knudsen arXiv:1106.1588v2 §3 Proposition3.1, Corollary3.2; the MC.2 arbitrary-section expansion: Supplies the actual module-valued Hom exchange calculation needed before relative stable-reflexivity and completed-local/sheaf descent.
- StableReductionPartII:MC.2/dual-section-ideal: Use the separately identified canonical map, signed coordinates and coefficient-module naturality, without inferring higher Ext or geometry.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### Pure coefficient-valued bidual evaluations

Identifier: StableReductionPartII:MC.2/section-ideal-coefficient-hom-pure. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom_tmul. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. θ_J,M(j⊗m)(h)=h(j)⊗m.

Prerequisites: StableReductionPartII:MC.2/section-ideal-coefficient-hom-map.

Construction or proof:

- Evaluate the native lift on pure tensors.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### Dual Hom coordinates with coefficients

Identifier: StableReductionPartII:MC.2/section-dual-coefficient-hom-coordinates. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates. Kind: construction.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Construct the A-linear map C_D,M:Hom_R(D,N_M)→R²⊗_A M by C_D,M(h)=E_M⁻¹(h∘P_D). Its pair coordinates are (h(incl),−h(ε)).

Prerequisites: StableReductionPartII:MC.2/section-dual-presentation; mathlib:LinearMap.lcomp; mathlib:TensorProduct.piLeft; mathlib:LinearEquiv.piRing.

Construction or proof:

- Compose native precomposition by the actual signed P_D with E_M⁻¹.

API:

- NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates_injective (extensionality): For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. C_D,M is injective.
- NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates_relation (relation): For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. U_M(Φᵀ) C_D,M(h)=0 for every h:D→N_M.
- NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates_presentation (projection): For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. For every tensor z∈R²⊗_A M, C_D,M(θ_J,M(U_M(P_J)z))=U_M(p)U_M(Φ)z.

Unit tests:

- NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates.test_zero (degenerate): The dual-Hom coordinate map C_D sends zero to zero.
- NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates.test_negative_epsilon (computation): Under E_M, C_D(h) at the second standard basis vector equals −h(ε), not h(ε).
- NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates.test_faithful (characterisation): Equality of C_D coordinates implies equality of homomorphisms from the actual R-dual D.

Uses:

- Knudsen arXiv:1106.1588v2 §3 Proposition3.1, Corollary3.2; the MC.2 arbitrary-section expansion: Supplies the actual module-valued Hom exchange calculation needed before relative stable-reflexivity and completed-local/sheaf descent.
- StableReductionPartII:MC.2/dual-section-ideal: Use the separately identified canonical map, signed coordinates and coefficient-module naturality, without inferring higher Ext or geometry.

Source: mathlib-a71f92-finite-free-coordinates, Pinned Mathlib: TensorProduct/Pi.lean lines50–116 and LinearAlgebra/Pi.lean lines538–559; actual section presentations as listed prerequisites. Reuse the native finite-product tensor and finite-free Hom coordinates. The listed model-specific presentation and transpose calculation is the authored deduction; no generic tensor/product or Hom construction is replanned.

#### Faithful coefficient-valued dual Hom coordinates

Identifier: StableReductionPartII:MC.2/section-dual-coefficient-hom-coordinates-injective. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates_injective. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. C_D,M is injective.

Prerequisites: StableReductionPartII:MC.2/section-dual-coefficient-hom-coordinates; StableReductionPartII:MC.2/section-dual-presentation-surjective; mathlib:LinearMap.lcomp_injective_of_surjective.

Construction or proof:

- Cancel E_M⁻¹ and use the separately listed surjectivity of P_D.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### Dual Hom relations after coefficient tensoring

Identifier: StableReductionPartII:MC.2/section-dual-coefficient-hom-relations. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates_relation. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. U_M(Φᵀ) C_D,M(h)=0 for every h:D→N_M.

Prerequisites: StableReductionPartII:MC.2/section-dual-coefficient-hom-coordinates; StableReductionPartII:MC.2/section-free-coefficient-hom-transpose; StableReductionPartII:MC.2/section-dual-presentation-kernel; mathlib:LinearMap.exact_iff.

Construction or proof:

- Under E_M the coefficient-Hom transpose bridge gives h∘P_D∘Φ.
- The actual dual presentation kernel gives P_D∘Φ=0.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### Bidual-Hom coordinates on the ideal tensor presentation

Identifier: StableReductionPartII:MC.2/section-dual-coefficient-hom-presentation. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionDualHomCoordinates_presentation. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. For every tensor z∈R²⊗_A M, C_D,M(θ_J,M(U_M(P_J)z))=U_M(p)U_M(Φ)z.

Prerequisites: StableReductionPartII:MC.2/section-dual-coefficient-hom-coordinates; StableReductionPartII:MC.2/section-ideal-coefficient-hom-pure; StableReductionPartII:MC.2/section-ideal-presentation-generators; StableReductionPartII:MC.2/section-dual-presentation-formula; StableReductionPartII:MC.2/section-dual-generator-values; StableReductionPartII:MC.2/section-matrix-left-action; StableReductionPartII:MC.2/section-matrix-rotation-formula; mathlib:LinearEquiv.rTensor_tmul.

Construction or proof:

- Cancel E_M and use tensor induction.
- Evaluate the actual P_D on the signed P_J expansion, substitute ε(c)=−a and ε(d)=b, and compare with pΦ.
- Unlike the dual-Hom coordinate formula, this formula has no leading minus sign.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### Right-tensor rotation of the second transpose

Identifier: StableReductionPartII:MC.2/section-transpose-right-right-tensor-rotation. Suggested declaration: NodeSectionFactorization.PolynomialModel.transposeRight_rTensor_rotation. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. U_M(Ψᵀ)∘U_M(p)=U_M(p)∘U_M(Φ).

Prerequisites: StableReductionPartII:MC.2/section-transpose-right-rotation; mathlib:LinearMap.rTensor_comp; mathlib:LinearEquiv.coe_rTensor.

Construction or proof:

- Apply the native right tensor to the listed Ψᵀ∘p=p∘Φ relation; use the pinned composition/coercion formulas.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### Injectivity of coefficient-valued bidual evaluation

Identifier: StableReductionPartII:MC.2/section-ideal-coefficient-hom-injective. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom_injective. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. θ_J,M is injective for every A-module M.

Prerequisites: StableReductionPartII:MC.2/section-dual-coefficient-hom-presentation; StableReductionPartII:MC.2/section-ideal-presentation-surjective; StableReductionPartII:MC.2/section-complex-left-tensor-exact; StableReductionPartII:MC.2/section-ideal-presentation-tensor-exact; mathlib:LinearMap.rTensor_surjective; mathlib:LinearMap.rTensor_exact_iff_lTensor_exact.

Construction or proof:

- Lift a difference tensor through the tensor-surjective P_J.
- The coordinate-presentation formula and invertible U_M(p) reduce vanishing to U_M(Φ)z=0.
- Universal exactness gives z∈im U_M(Ψ), and tensor presentation exactness gives U_M(P_J)z=0.

Unit tests:

- NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv.test_zero_ring (degenerate): The ideal tensor–Hom comparison also holds over the zero coefficient ring Z/1 with its actual native carriers.

Source: mathlib-a71f92-right-tensor-exactness, Pinned TensorProduct/RightExactness.lean lines148–179; actual section presentation/universal exactness inputs listed as prerequisites. Reuses native tensor surjectivity and equivalence of left/right tensor exactness. The actual canonical coefficient-Hom bijectivity is the authored signed-presentation deduction, not a consequence of coefficient flatness alone.

#### Surjectivity of coefficient-valued bidual evaluation

Identifier: StableReductionPartII:MC.2/section-ideal-coefficient-hom-surjective. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom_surjective. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. θ_J,M is surjective for every A-module M.

Prerequisites: StableReductionPartII:MC.2/section-dual-coefficient-hom-relations; StableReductionPartII:MC.2/section-dual-coefficient-hom-coordinates-injective; StableReductionPartII:MC.2/section-dual-coefficient-hom-presentation; StableReductionPartII:MC.2/section-transpose-right-right-tensor-rotation; StableReductionPartII:MC.2/section-complex-transpose-left-tensor-exact; mathlib:LinearMap.rTensor_exact_iff_lTensor_exact.

Construction or proof:

- Coordinates y=C_D,M(h) lie in ker U_M(Φᵀ); universal transpose exactness supplies w with U_M(Ψᵀ)w=y.
- Use the right-tensor rotation identity and coordinate-presentation formula to obtain θ_J,M(U_M(P_J)(U_M(p)⁻¹w))=h, then cancel C_D,M.

Source: mathlib-a71f92-right-tensor-exactness, Pinned TensorProduct/RightExactness.lean lines148–179; actual section presentation/universal exactness inputs listed as prerequisites. Reuses native tensor surjectivity and equivalence of left/right tensor exactness. The actual canonical coefficient-Hom bijectivity is the authored signed-presentation deduction, not a consequence of coefficient flatness alone.

#### Coefficient-valued bidual equivalence

Identifier: StableReductionPartII:MC.2/section-ideal-coefficient-hom-equivalence. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv. Kind: construction.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Construct the R-linear equivalence Θ_J,M:J⊗_A M≃Hom_R(D,N_M) with forward map θ_J,M, for every A-module M.

Prerequisites: StableReductionPartII:MC.2/section-ideal-coefficient-hom-map; StableReductionPartII:MC.2/section-ideal-coefficient-hom-injective; StableReductionPartII:MC.2/section-ideal-coefficient-hom-surjective; mathlib:LinearEquiv.ofBijective.

Construction or proof:

- Use the proved injectivity and surjectivity and the native equivalence of a bijective linear map.
- This is the explicit coefficient-valued evaluation comparison; it does not assert relative stable reflexivity or higher Ext.

API:

- NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv_tmul (simp): For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Θ_J,M(j⊗m)(h)=h(j)⊗m.
- NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv_inverse (equivalence): For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Θ_J,M⁻¹(θ_J,M(j⊗m))=j⊗m.
- NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv_unique (characterisation): For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Any R-linear equivalence e:J⊗_A M≃Hom_R(D,N_M) with e(j⊗m)(h)=h(j)⊗m for all j,m,h equals Θ_J,M.

Unit tests:

- NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv.test_inverse (characterisation): The inverse of θ_J,M sends the pure evaluation homomorphism h↦h(j)⊗m to j⊗m.
- NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv.test_ring_action (compatibility): For r∈R, x∈J⊗_A M and h∈D, θ_J,M(rx)(h)=rθ_J,M(x)(h), with no auxiliary action chosen.
- NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv.test_torsion (compatibility): For A=Z, M=Z/3 and zero parameters in the degenerate quadratic polynomial model, the actual J tensor–Hom map is bijective without a nondegeneracy assumption.

Uses:

- Knudsen arXiv:1106.1588v2 §3 Proposition3.1, Corollary3.2; the MC.2 arbitrary-section expansion: Supplies the actual module-valued Hom exchange calculation needed before relative stable-reflexivity and completed-local/sheaf descent.
- StableReductionPartII:MC.2/dual-section-ideal: Use the separately identified canonical map, signed coordinates and coefficient-module naturality, without inferring higher Ext or geometry.

Source: knudsen2012, §3 Proposition3.1 and Corollary3.2, with §4 Main Lemma proof; arXiv:1106.1588v2. Motivates the polynomial dual and coefficient-universal complexes. The displayed module-valued Hom comparison in this arbitrary-ring range is an authored deduction through the separately listed coordinate and exactness lemmas; it does not assert the printed relative stable-reflexivity conclusion.

#### Coefficient-valued bidual equivalence on pure tensors

Identifier: StableReductionPartII:MC.2/section-ideal-coefficient-hom-equivalence-pure. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv_tmul. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Θ_J,M(j⊗m)(h)=h(j)⊗m.

Prerequisites: StableReductionPartII:MC.2/section-ideal-coefficient-hom-equivalence; StableReductionPartII:MC.2/section-ideal-coefficient-hom-pure.

Construction or proof:

- The native equivalence keeps the actual evaluation map as its forward map.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### Coefficient-module naturality of bidual evaluation

Identifier: StableReductionPartII:MC.2/section-ideal-coefficient-hom-naturality. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom_natural. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. For any A-linear f:M→M′, x∈J⊗_A M and h∈D, θ_J,M′((id_J⊗f)x)(h)=(id_R⊗f)(θ_J,M(x)(h)).

Prerequisites: StableReductionPartII:MC.2/section-ideal-coefficient-hom-pure; mathlib:TensorProduct.AlgebraTensorModule.map; mathlib:TensorProduct.AlgebraTensorModule.map_tmul.

Construction or proof:

- Tensor induction reduces the square to h(j)⊗f(m), then additivity handles arbitrary tensors.

Unit tests:

- NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_naturality (compatibility): Coefficient-module naturality of θ_J holds for every A-linear f on arbitrary tensors.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### Inverse dual Hom comparison on pure tensors

Identifier: StableReductionPartII:MC.2/section-dual-coefficient-hom-equivalence-inverse. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv_inverse. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Θ_D,M⁻¹(θ_D,M(h⊗m))=h⊗m.

Prerequisites: StableReductionPartII:MC.2/section-dual-coefficient-hom-equivalence.

Construction or proof:

- Use the native equivalence inverse identity, with its actual forward map.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### Inverse coefficient-valued bidual on pure tensors

Identifier: StableReductionPartII:MC.2/section-ideal-coefficient-hom-equivalence-inverse. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv_inverse. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Θ_J,M⁻¹(θ_J,M(j⊗m))=j⊗m.

Prerequisites: StableReductionPartII:MC.2/section-ideal-coefficient-hom-equivalence.

Construction or proof:

- Use the native inverse identity.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### Uniqueness of the canonical dual Hom equivalence

Identifier: StableReductionPartII:MC.2/section-dual-coefficient-hom-equivalence-unique. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionDualTensorHomEquiv_unique. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Any R-linear equivalence e:D⊗_A M≃Hom_R(J,N_M) satisfying e(h⊗m)(j)=h(j)⊗m for all h,m,j equals Θ_D,M.

Prerequisites: StableReductionPartII:MC.2/section-dual-coefficient-hom-equivalence-pure; mathlib:TensorProduct.AlgebraTensorModule.ext.

Construction or proof:

- Use native heterobasic tensor extensionality, then Hom extensionality; the pure formula fixes the actual forward map.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### Uniqueness of coefficient-valued bidual evaluation

Identifier: StableReductionPartII:MC.2/section-ideal-coefficient-hom-equivalence-unique. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHomEquiv_unique. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. Any R-linear equivalence e:J⊗_A M≃Hom_R(D,N_M) with e(j⊗m)(h)=h(j)⊗m for all j,m,h equals Θ_J,M.

Prerequisites: StableReductionPartII:MC.2/section-ideal-coefficient-hom-equivalence-pure; mathlib:TensorProduct.AlgebraTensorModule.ext.

Construction or proof:

- Apply native heterobasic tensor extensionality and then Hom extensionality.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### The coefficient-unit dual Hom comparison

Identifier: StableReductionPartII:MC.2/section-dual-coefficient-hom-unit. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionDualTensorHom_unit. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. For M=A and every x∈D⊗_A A, postcompose θ_D,A(x) with the native R-linear unit R⊗_A A≃R. The result equals the native unit D⊗_A A≃D applied to x.

Prerequisites: StableReductionPartII:MC.2/section-dual-coefficient-hom-pure; mathlib:TensorProduct.AlgebraTensorModule.rid; mathlib:TensorProduct.AlgebraTensorModule.rid_tmul.

Construction or proof:

- Use tensor induction and the native heterobasic right-unit formula; at h⊗a both sides evaluate to a·h(j).

Unit tests:

- NodeSectionFactorization.PolynomialModel.sectionDualTensorHom.test_unit (compatibility): For M=A, both native right-unit equivalences identify θ_D with the actual identity of D.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

#### The coefficient-unit native bidual evaluation

Identifier: StableReductionPartII:MC.2/section-ideal-coefficient-hom-unit. Suggested declaration: NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom_unit. Kind: lemma.

For any commutative ring A and γ,δ,s,t∈A, let q(X,Y)=X²+γXY+δY², R=A[Y][X]/(q(X,Y)−q(s,t)), ι:A→R the actual coefficient algebra map, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδv+ιδ·ιt+ιγu, J=(c,d), D=Hom_R(J,R), incl:J→R and ε∈D with dε(j)=bj. Put Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε and p(z)=(-z₁,z₀). For any A-module M, set N_M=R⊗_A M with the inherited left R-action, and U_M(f)=f⊗_A id_M on the actual native tensors. Use the already-built finite-product tensor and finite-free Hom coordinates E_M:R²⊗_A M≃ₗ[A]Hom_R(R²,N_M), E_M(z⊗m)(w)=(w₀z₀+w₁z₁)⊗m. For M=A and x∈J⊗_A A, postcomposing θ_J,A(x) by the native unit R⊗_A A≃R equals Module.Dual.eval R J applied to the native unit J⊗_A A≃J of x.

Prerequisites: StableReductionPartII:MC.2/section-ideal-coefficient-hom-pure; mathlib:TensorProduct.AlgebraTensorModule.rid; mathlib:TensorProduct.AlgebraTensorModule.rid_tmul; mathlib:Module.Dual.eval; mathlib:LinearMap.restrictScalars.

Construction or proof:

- Tensor induction reduces to h(a·j)=a·h(j), using the actual restriction of the R-linear h to A.
- The resulting map is the native bidual evaluation, not a separately chosen abstract isomorphism.

Unit tests:

- NodeSectionFactorization.PolynomialModel.sectionIdealTensorHom.test_bidual (compatibility): For M=A, the unit identifications turn θ_J into the native Module.Dual.eval R J, not a chosen abstract bidual isomorphism.

Source: mathlib-a71f92-heterobasic-tensor, Pinned TensorProduct/Tower.lean lines79–123,183–202,312–319,356–373, together with the exactness and matrix prerequisites named below. Native heterobasic tensor lift, maps, extensionality and unit structures are reused. The stated actual-section comparison is a specialized construction or authored deduction on the existing native carriers, not a new generic tensor–Hom theory.

### Coverage boundary

The mathematical scope is the untruncated explicit polynomial quotient over arbitrary commutative coefficient rings. Knudsen’s printed geometric and relative stable-reflexivity statements retain their noetherian and nondegeneracy hypotheses. The tensor–Hom calculations here are explicit algebra deductions from the named native presentations and coefficient-universal exactness, not a weakening of those geometric statements.

All eight stages retain partial coverage. The relative Ext/resolution comparison, the exact Knudsen Appendix/Ile stable-reflexivity input, Proposition6’s two-base completion comparison, Proposition7’s exercise, the pointed completed-local hull, family/sheaf descent and finite-presentation approximation remain requirements. The entire moduli groupoid/key-definition, all six paper consumers, all 21 routed Yuan/DGH items and the inherited geometric targets retain their contracts. No completion, clutching, stack, coarse-space or Torelli conclusion follows solely from these polynomial tensor–Hom isomorphisms.


## MC.2: native section Hom cochains

The following continuation uses the actual R-linear Hom space into R⊗_A M and Mathlib’s native nonnegative cochain complex in ModuleCat R. The signed ideal presentation has kernel im Ψ, so its Hom differential starts with precomposition by Ψ; the signed dual presentation has kernel im Φ and starts with precomposition by Φ. Each phase alternates with period two. Positive native cohomology vanishes for every A-module, including torsion modules. Degree zero still consists of maps from the actual ideal or dual. An identification with native Ext requires the augmented projective resolutions and the Hom/Ext comparison; neither that identification nor relative stable reflexivity, completion or geometric descent follows merely from the cochain calculation.

### The polynomial section Hom differential

Declaration NodeSectionFactorization.PolynomialModel.sectionHomDifferential; node StableReductionPartII:MC.2/section-hom-differential.

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. Define d(e,n):H→H for e∈{false,true} and n≥0: choose L_Φ if (n mod 2=0) has the same truth value as e=true, and L_Ψ otherwise. The false phase is the section-ideal Hom sequence; the true phase is the dual Hom sequence.

Hypotheses: A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

Dependencies: StableReductionPartII:MC.2/section-free-coefficient-hom-transpose, mathlib:LinearMap.lcomp.

Proof: Use the actual native precomposition, parity or cochain constructor specified above; evaluate using its named prerequisites.

Acceptance: Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

- Knudsen2012 §3 and StableReductionPartII:MC.2/dual-section-ideal: Retain the two actual alternating resolutions in Hom coordinates, as the next input to native projective-resolution and Ext comparison.

- The native coefficient-module Hom comparison nodes in MC.2: Fix the actual degree-zero phase and the signed augmentation, keeping degree-zero Hom distinct from positive-degree vanishing.

- NodeSectionFactorization.PolynomialModel.sectionHomDifferential_ideal_zero: The actual degree-zero differential d(false,0) equals L_Ψ, as required by ker(P_J)=im(Ψ).

- NodeSectionFactorization.PolynomialModel.sectionHomDifferential_dual_zero: The actual degree-zero differential d(true,0) equals L_Φ, as required by ker(P_D)=im(Φ).

- NodeSectionFactorization.PolynomialModel.sectionHomDifferential_periodic: For either phase e and every n≥0, d(e,n+2)=d(e,n) as an R-linear map.

- NodeSectionFactorization.PolynomialModel.sectionHomDifferential_exact: For either phase e and every n≥0, d(e,n) then d(e,n+1) form an exact pair.

- NodeSectionFactorization.PolynomialModel.sectionHomDifferential_sq: For either phase e and every n≥0, d(e,n+1)∘d(e,n)=0 as an actual R-linear map H→H.

- NodeSectionFactorization.PolynomialModel.sectionHomDifferential.test_ideal_signed_column: With γ=δ=s=t=0, every A and every m∈M, d(false,0)(E((0,1)⊗m))(1,0)=u⊗m; this fixes the Ψ starting phase.

- NodeSectionFactorization.PolynomialModel.sectionHomDifferential.test_dual_negative_column: With γ=δ=s=t=0, every A and every m∈M, d(true,0)(E((0,1)⊗m))(1,0)=−u⊗m; this fixes the Φ starting phase and its negative entry.

- NodeSectionFactorization.PolynomialModel.sectionHomDifferential.test_two_period: For either phase and every coefficient module, d(e,n+2)=d(e,n) as native R-linear maps.

Source: Knudsen2012 §3 Key Example and Proposition3.1, with §4’s separate completed-local comparison; the general-ring native cochain result is an authored deduction on the preceding local model. Native machinery is cited at the selected pinned statements, without replanning generic homological algebra.

### Exactness of left then right Hom precomposition

Declaration NodeSectionFactorization.PolynomialModel.sectionHomLeftRight_exact; node StableReductionPartII:MC.2/section-hom-left-right-exact.

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. The native R-linear maps L_Φ then L_Ψ form an exact pair for every coefficient module M.

Hypotheses: A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

Dependencies: StableReductionPartII:MC.2/section-free-coefficient-hom-transpose, StableReductionPartII:MC.2/section-complex-transpose-right-tensor-exact, mathlib:LinearMap.rTensor_exact_iff_lTensor_exact, mathlib:Function.Exact.of_ladder_linearEquiv_of_exact, mathlib:LinearMap.restrictScalars.

Proof: Reuse coefficient-universal exactness of Φ-transpose then Ψ-transpose. Commute left and right tensor factors with the existing native tensor-exactness equivalence. Restrict the R-linear Hom maps to A only for the coordinate ladder. The actual E conjugates tensor-transpose maps to precomposition, so native exactness transports back to the R-linear Hom maps.

Acceptance: Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

Source: Knudsen2012 §3 Key Example and Proposition3.1, with §4’s separate completed-local comparison; the general-ring native cochain result is an authored deduction on the preceding local model. Native machinery is cited at the selected pinned statements, without replanning generic homological algebra.

### Exactness of right then left Hom precomposition

Declaration NodeSectionFactorization.PolynomialModel.sectionHomRightLeft_exact; node StableReductionPartII:MC.2/section-hom-right-left-exact.

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. The native R-linear maps L_Ψ then L_Φ form an exact pair for every coefficient module M.

Hypotheses: A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

Dependencies: StableReductionPartII:MC.2/section-free-coefficient-hom-transpose, StableReductionPartII:MC.2/section-complex-transpose-left-tensor-exact, mathlib:LinearMap.rTensor_exact_iff_lTensor_exact, mathlib:Function.Exact.of_ladder_linearEquiv_of_exact, mathlib:LinearMap.restrictScalars.

Proof: Reuse coefficient-universal exactness of Ψ-transpose then Φ-transpose. Use right-tensor exactness and the same actual E coordinate ladder in the reversed order.

Acceptance: Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

Source: Knudsen2012 §3 Key Example and Proposition3.1, with §4’s separate completed-local comparison; the general-ring native cochain result is an authored deduction on the preceding local model. Native machinery is cited at the selected pinned statements, without replanning generic homological algebra.

### Every adjacent section Hom pair is exact

Declaration NodeSectionFactorization.PolynomialModel.sectionHomDifferential_exact; node StableReductionPartII:MC.2/section-hom-differential-exact.

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. For either phase e and every n≥0, d(e,n) then d(e,n+1) form an exact pair.

Hypotheses: A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

Dependencies: StableReductionPartII:MC.2/section-hom-differential, StableReductionPartII:MC.2/section-hom-left-right-exact, StableReductionPartII:MC.2/section-hom-right-left-exact.

Proof: Split the two phases and the two possible parity residues; apply the matching native Hom exact pair.

Acceptance: Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

Source: Knudsen2012 §3 Key Example and Proposition3.1, with §4’s separate completed-local comparison; the general-ring native cochain result is an authored deduction on the preceding local model. Native machinery is cited at the selected pinned statements, without replanning generic homological algebra.

### The section Hom differential squares to zero

Declaration NodeSectionFactorization.PolynomialModel.sectionHomDifferential_sq; node StableReductionPartII:MC.2/section-hom-differential-square.

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. For either phase e and every n≥0, d(e,n+1)∘d(e,n)=0 as an actual R-linear map H→H.

Hypotheses: A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

Dependencies: StableReductionPartII:MC.2/section-hom-differential-exact, mathlib:Function.Exact.linearMap_comp_eq_zero.

Proof: Use the actual native precomposition, parity or cochain constructor specified above; evaluate using its named prerequisites.

Acceptance: Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

Source: Knudsen2012 §3 Key Example and Proposition3.1, with §4’s separate completed-local comparison; the general-ring native cochain result is an authored deduction on the preceding local model. Native machinery is cited at the selected pinned statements, without replanning generic homological algebra.

### The native polynomial section Hom cochain complex

Declaration NodeSectionFactorization.PolynomialModel.sectionHomCochain; node StableReductionPartII:MC.2/section-hom-cochain.

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. Construct C_e as a native nonnegative cochain complex in ModuleCat R, with object H in each degree and successive differential d(e,n). Use the existing CochainComplex.of constructor and the actual square-zero proof.

Hypotheses: A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

Dependencies: StableReductionPartII:MC.2/section-hom-differential, StableReductionPartII:MC.2/section-hom-differential-square, mathlib:CochainComplex.of, mathlib:ModuleCat.of, mathlib:ModuleCat.ofHom, mathlib:ModuleCat.hom_ext.

Proof: Use the actual native precomposition, parity or cochain constructor specified above; evaluate using its named prerequisites.

Acceptance: Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

- Knudsen2012 §3 and StableReductionPartII:MC.2/dual-section-ideal: Retain the two actual alternating resolutions in Hom coordinates, as the next input to native projective-resolution and Ext comparison.

- The native coefficient-module Hom comparison nodes in MC.2: Fix the actual degree-zero phase and the signed augmentation, keeping degree-zero Hom distinct from positive-degree vanishing.

- NodeSectionFactorization.PolynomialModel.sectionHomCochain_X: For either phase e and every n≥0, C_e.X(n)=ModuleCat.of R H, with the actual native R-module structure on the Hom space.

- NodeSectionFactorization.PolynomialModel.sectionHomCochain_d: For either phase e and every n≥0, the native morphism C_e.d(n,n+1) is ModuleCat.ofHom(d(e,n)). The morphism comparison is stated with the source and target object identifications; the admitted signature uses heterogeneous equality to avoid unfolding an opaque construction.

- NodeSectionFactorization.PolynomialModel.sectionHomCochain_shape: For either phase e and i,j≥0 with i+1≠j, C_e.d(i,j)=0.

- NodeSectionFactorization.PolynomialModel.sectionHomCochain_exactAt: For either phase e and every n≥0, the native C_e satisfies HomologicalComplex.ExactAt at n+1. This is categorical exactness of its actual R-module short complex.

- NodeSectionFactorization.PolynomialModel.sectionHomCochain_isZero_homology: For either phase e and every n≥0, the native homology object C_e.homology(n+1) is a zero object in ModuleCat R. No assertion of higher Ext is made until these complexes are identified with native Hom applied to the augmented projective resolutions.

- NodeSectionFactorization.PolynomialModel.sectionHomIdeal_augmentation_exact: Precomposition by the actual P_J: R²→J followed by d(false,0) is an exact pair. Thus the zero-degree cycles are exactly f∘P_J for R-linear f:J→N; precomposition is injective because P_J is surjective.

- NodeSectionFactorization.PolynomialModel.sectionHomDual_augmentation_exact: Precomposition by the actual P_D: R²→D followed by d(true,0) is an exact pair. Thus the zero-degree cycles are exactly f∘P_D for R-linear f:D→N; precomposition is injective because P_D is surjective.

- NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_torsion_coefficient: For A=ℤ, γ=1,δ=0,s=1,t=0 and M=ℤ/2, the ideal-phase native cohomology object in degree three is zero; the coefficient module is not flat over ℤ.

- NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_nonreduced_base: For A=ℤ/4, γ=δ=0,s=1,t=0 and M=ℤ/4, the dual-phase native cohomology object in degree two is zero; neither reducedness nor a unit discriminant is required by this algebra calculation.

- NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_zero_ring: For A=M=ℤ/1 and all parameters zero, the ideal-phase native cohomology object in degree one is zero.

- NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_actual_differential: For every n, the ideal-phase successor differential is the actual ModuleCat morphism of d(false,n), not a chosen zero differential.

- NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_degree_zero_ideal: An element h∈H is killed by d(false,0) exactly when h=f∘P_J for an actual R-linear map f:J→N.

- NodeSectionFactorization.PolynomialModel.sectionHomCochain.test_degree_zero_dual: An element h∈H is killed by d(true,0) exactly when h=f∘P_D for an actual R-linear map f:D→N.

Source: Knudsen2012 §3 Key Example and Proposition3.1, with §4’s separate completed-local comparison; the general-ring native cochain result is an authored deduction on the preceding local model. Native machinery is cited at the selected pinned statements, without replanning generic homological algebra.

### The native successor differential

Declaration NodeSectionFactorization.PolynomialModel.sectionHomCochain_d; node StableReductionPartII:MC.2/section-hom-cochain-differential.

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. For either phase e and every n≥0, the native morphism C_e.d(n,n+1) is ModuleCat.ofHom(d(e,n)). The comparison uses the native Hom object identifications, so it remains well-typed when the construction body is admitted. The morphism comparison is stated with the source and target object identifications; the admitted signature uses heterogeneous equality to avoid unfolding an opaque construction.

Hypotheses: A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

Dependencies: StableReductionPartII:MC.2/section-hom-cochain, mathlib:CochainComplex.of_d.

Proof: Use the actual native precomposition, parity or cochain constructor specified above; evaluate using its named prerequisites.

Acceptance: Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

Source: Knudsen2012 §3 Key Example and Proposition3.1, with §4’s separate completed-local comparison; the general-ring native cochain result is an authored deduction on the preceding local model. Native machinery is cited at the selected pinned statements, without replanning generic homological algebra.

### Positive-degree exactness of the native Hom complex

Declaration NodeSectionFactorization.PolynomialModel.sectionHomCochain_exactAt; node StableReductionPartII:MC.2/section-hom-cochain-exact.

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. For either phase e and every n≥0, the native C_e satisfies HomologicalComplex.ExactAt at n+1. This is categorical exactness of its actual R-module short complex.

Hypotheses: A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

Dependencies: StableReductionPartII:MC.2/section-hom-cochain, StableReductionPartII:MC.2/section-hom-cochain-differential, StableReductionPartII:MC.2/section-hom-differential-exact, mathlib:HomologicalComplex.ExactAt, mathlib:HomologicalComplex.exactAt_iff', mathlib:CategoryTheory.ShortComplex.moduleCat_exact_iff.

Proof: Use the native successor differential formula at n and n+1. Apply native exactAt_iff with the actual predecessor n and successor n+2. Use moduleCat_exact_iff to transport the actual kernel/image witnesses, without replacing the complex or its modules.

Acceptance: Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

Source: Knudsen2012 §3 Key Example and Proposition3.1, with §4’s separate completed-local comparison; the general-ring native cochain result is an authored deduction on the preceding local model. Native machinery is cited at the selected pinned statements, without replanning generic homological algebra.

### Vanishing positive cohomology of the native Hom complex

Declaration NodeSectionFactorization.PolynomialModel.sectionHomCochain_isZero_homology; node StableReductionPartII:MC.2/section-hom-cochain-positive-homology.

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. For either phase e and every n≥0, the native homology object C_e.homology(n+1) is a zero object in ModuleCat R. No assertion of higher Ext is made until these complexes are identified with native Hom applied to the augmented projective resolutions.

Hypotheses: A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

Dependencies: StableReductionPartII:MC.2/section-hom-cochain-exact, mathlib:HomologicalComplex.ExactAt.isZero_homology.

Proof: Apply native ExactAt.isZero_homology in the abelian category of R-modules.

Acceptance: Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

Source: Knudsen2012 §3 Key Example and Proposition3.1, with §4’s separate completed-local comparison; the general-ring native cochain result is an authored deduction on the preceding local model. Native machinery is cited at the selected pinned statements, without replanning generic homological algebra.

### The section ideal starts with right precomposition

Declaration NodeSectionFactorization.PolynomialModel.sectionHomDifferential_ideal_zero; node StableReductionPartII:MC.2/section-hom-ideal-start.

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. The actual degree-zero differential d(false,0) equals L_Ψ, as required by ker(P_J)=im(Ψ).

Hypotheses: A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

Dependencies: StableReductionPartII:MC.2/section-hom-differential.

Proof: Use the actual native precomposition, parity or cochain constructor specified above; evaluate using its named prerequisites.

Acceptance: Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

Source: Knudsen2012 §3 Key Example and Proposition3.1, with §4’s separate completed-local comparison; the general-ring native cochain result is an authored deduction on the preceding local model. Native machinery is cited at the selected pinned statements, without replanning generic homological algebra.

### The dual starts with left precomposition

Declaration NodeSectionFactorization.PolynomialModel.sectionHomDifferential_dual_zero; node StableReductionPartII:MC.2/section-hom-dual-start.

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. The actual degree-zero differential d(true,0) equals L_Φ, as required by ker(P_D)=im(Φ).

Hypotheses: A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

Dependencies: StableReductionPartII:MC.2/section-hom-differential.

Proof: Use the actual native precomposition, parity or cochain constructor specified above; evaluate using its named prerequisites.

Acceptance: Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

Source: Knudsen2012 §3 Key Example and Proposition3.1, with §4’s separate completed-local comparison; the general-ring native cochain result is an authored deduction on the preceding local model. Native machinery is cited at the selected pinned statements, without replanning generic homological algebra.

### Two-periodicity of section Hom differentials

Declaration NodeSectionFactorization.PolynomialModel.sectionHomDifferential_periodic; node StableReductionPartII:MC.2/section-hom-differential-periodic.

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. For either phase e and every n≥0, d(e,n+2)=d(e,n) as an R-linear map.

Hypotheses: A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

Dependencies: StableReductionPartII:MC.2/section-hom-differential.

Proof: Use the actual native precomposition, parity or cochain constructor specified above; evaluate using its named prerequisites.

Acceptance: Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

Source: Knudsen2012 §3 Key Example and Proposition3.1, with §4’s separate completed-local comparison; the general-ring native cochain result is an authored deduction on the preceding local model. Native machinery is cited at the selected pinned statements, without replanning generic homological algebra.

### Actual Hom modules in every degree

Declaration NodeSectionFactorization.PolynomialModel.sectionHomCochain_X; node StableReductionPartII:MC.2/section-hom-cochain-objects.

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. For either phase e and every n≥0, C_e.X(n)=ModuleCat.of R H, with the actual native R-module structure on the Hom space.

Hypotheses: A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

Dependencies: StableReductionPartII:MC.2/section-hom-cochain, mathlib:ModuleCat.of.

Proof: Use the actual native precomposition, parity or cochain constructor specified above; evaluate using its named prerequisites.

Acceptance: Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

Source: Knudsen2012 §3 Key Example and Proposition3.1, with §4’s separate completed-local comparison; the general-ring native cochain result is an authored deduction on the preceding local model. Native machinery is cited at the selected pinned statements, without replanning generic homological algebra.

### The section Hom cochain shape

Declaration NodeSectionFactorization.PolynomialModel.sectionHomCochain_shape; node StableReductionPartII:MC.2/section-hom-cochain-shape.

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. For either phase e and i,j≥0 with i+1≠j, C_e.d(i,j)=0.

Hypotheses: A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

Dependencies: StableReductionPartII:MC.2/section-hom-cochain, mathlib:HomologicalComplex.

Proof: Use the actual native precomposition, parity or cochain constructor specified above; evaluate using its named prerequisites.

Acceptance: Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

Source: Knudsen2012 §3 Key Example and Proposition3.1, with §4’s separate completed-local comparison; the general-ring native cochain result is an authored deduction on the preceding local model. Native machinery is cited at the selected pinned statements, without replanning generic homological algebra.

### Degree-zero cycles factor through the section ideal

Declaration NodeSectionFactorization.PolynomialModel.sectionHomIdeal_augmentation_exact; node StableReductionPartII:MC.2/section-hom-ideal-augmentation-exact.

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. Precomposition by the actual P_J: R²→J followed by d(false,0) is an exact pair. Thus the zero-degree cycles are exactly f∘P_J for R-linear f:J→N; precomposition is injective because P_J is surjective.

Hypotheses: A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

Dependencies: StableReductionPartII:MC.2/section-hom-ideal-start, StableReductionPartII:MC.2/section-ideal-presentation-kernel, StableReductionPartII:MC.2/section-ideal-presentation-surjective, mathlib:LinearMap.exact_lcomp_of_exact_of_surjective, mathlib:LinearMap.exact_iff, mathlib:LinearMap.lcomp_injective_of_surjective.

Proof: Reuse the existing exact presentation Ψ→R²→J and its actual surjectivity. Apply native left exactness of R-linear Hom into N; no coefficient flatness is needed.

Acceptance: Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

Source: Knudsen2012 §3 Key Example and Proposition3.1, with §4’s separate completed-local comparison; the general-ring native cochain result is an authored deduction on the preceding local model. Native machinery is cited at the selected pinned statements, without replanning generic homological algebra.

### Degree-zero cycles factor through the section dual

Declaration NodeSectionFactorization.PolynomialModel.sectionHomDual_augmentation_exact; node StableReductionPartII:MC.2/section-hom-dual-augmentation-exact.

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε. For any A-module M put N=R⊗_A M with its native left R-action and H=Hom_R(R²,N). Write L_W(h)=h∘W for native R-linear precomposition and E:R²⊗_A M≃Hom_R(R²,N) for the previously specified finite-free tensor coordinates. Precomposition by the actual P_D: R²→D followed by d(true,0) is an exact pair. Thus the zero-degree cycles are exactly f∘P_D for R-linear f:D→N; precomposition is injective because P_D is surjective.

Hypotheses: A is any commutative ring and M is any A-module; no flatness of M, noetherianity, nontriviality or unit-discriminant hypothesis is imposed for this polynomial calculation.

Dependencies: StableReductionPartII:MC.2/section-hom-dual-start, StableReductionPartII:MC.2/section-dual-presentation-kernel, StableReductionPartII:MC.2/section-dual-presentation-surjective, mathlib:LinearMap.exact_lcomp_of_exact_of_surjective, mathlib:LinearMap.exact_iff, mathlib:LinearMap.lcomp_injective_of_surjective.

Proof: Reuse the existing exact presentation Φ→R²→D and its actual surjectivity. Apply native left exactness of R-linear Hom into N; no coefficient flatness is needed.

Acceptance: Use actual R-linear Hom maps, the signed P_J/P_D presentations and native ModuleCat homology. Do not infer Ext vanishing, relative stable reflexivity, completed-local comparisons or family/sheaf descent from this cochain result alone.

Source: Knudsen2012 §3 Key Example and Proposition3.1, with §4’s separate completed-local comparison; the general-ring native cochain result is an authored deduction on the preceding local model. Native machinery is cited at the selected pinned statements, without replanning generic homological algebra.


## Actual polynomial section projective resolutions

Codex — codex-5ebb6f; 2026-10-03. This partial continuation packages the actual matrices into native projective resolutions. It preserves the general reserved moduli-stack definition, six key consumers, all routed paper requirements and inherited geometric gaps.

The actual augmented finite-free R-projective resolutions of J and D are now specified and separately checked with native QuasiIso. Their Hom precomposition differentials equal the existing arbitrary-coefficient cochain maps. Next identify the categorical Hom complex and native higher Ext; then apply the exact Appendix/Ile relative stable-reflexivity and two-base completion theorems, pointed completed-local hull, family/sheaf descent and arbitrary-base approximation. The differential equality alone is not an Ext comparison.

### The polynomial section chain differential

`StableReductionPartII:MC.2/section-chain-differential` · `NodeSectionFactorization.PolynomialModel.sectionChainDifferential` · construction

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. Define B(e,n) as the actual R-linear matrix map F→F; false starts with Ψ and true with Φ.

Proof: Select the actual matrix by parity; retain its signs and source/target order.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

API `NodeSectionFactorization.PolynomialModel.sectionChainDifferential_ideal_zero`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. B(false,0)=Ψ as an actual R-linear map.

API `NodeSectionFactorization.PolynomialModel.sectionChainDifferential_dual_zero`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. B(true,0)=Φ as an actual R-linear map.

API `NodeSectionFactorization.PolynomialModel.sectionChainDifferential_periodic`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. B(e,n+2)=B(e,n) for every e,n as actual R-linear maps.

API `NodeSectionFactorization.PolynomialModel.sectionChainDifferential_exact`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. For every e and n≥0, B(e,n+1) followed by B(e,n) is exact.

API `NodeSectionFactorization.PolynomialModel.sectionChainDifferential_sq`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. For every e and n≥0, B(e,n)∘B(e,n+1)=0 as R-linear maps.

Test `NodeSectionFactorization.PolynomialModel.sectionChainDifferential.test_ideal_signed_column` (computation): For γ=δ=s=t=0 over every A, B(false,0)(1,0) has second coordinate u.

Test `NodeSectionFactorization.PolynomialModel.sectionChainDifferential.test_dual_negative_column` (computation): For γ=δ=s=t=0 over every A, B(true,0)(1,0) has second coordinate −u.

Test `NodeSectionFactorization.PolynomialModel.sectionChainDifferential.test_two_period` (compatibility): For every phase and n, B(e,n+2)=B(e,n).

### Exactness of consecutive section chain maps

`StableReductionPartII:MC.2/section-chain-differential-exact` · `NodeSectionFactorization.PolynomialModel.sectionChainDifferential_exact` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. For every e and n≥0, B(e,n+1) followed by B(e,n) is exact.

Proof: Separate the two parity values and phases. Apply ker Φ=im Ψ or ker Ψ=im Φ in the indicated order.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### The section chain differential squares to zero

`StableReductionPartII:MC.2/section-chain-differential-square` · `NodeSectionFactorization.PolynomialModel.sectionChainDifferential_sq` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. For every e and n≥0, B(e,n)∘B(e,n+1)=0 as R-linear maps.

Proof: Apply the native zero-composite theorem to the exact pair.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### The native polynomial section chain complex

`StableReductionPartII:MC.2/section-chain` · `NodeSectionFactorization.PolynomialModel.sectionChain` · construction

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. Construct C(e) as a native ℕ-indexed ChainComplex of ModuleCat R with its actual successor maps.

Proof: Bundle F and each actual B(e,n); supply the proven square-zero equation.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

API `NodeSectionFactorization.PolynomialModel.sectionChain_X`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. For every e,n, C(e).X n is the native object ModuleCat.of R F.

API `NodeSectionFactorization.PolynomialModel.sectionChain_d`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. For every e,n, C(e).d(n+1,n)=ModuleCat.ofHom(B(e,n)).

API `NodeSectionFactorization.PolynomialModel.sectionChain_shape`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. C(e).d(i,j)=0 whenever j+1≠i; there is no upward differential or negative degree.

API `NodeSectionFactorization.PolynomialModel.sectionChain_exactAt`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. C(e) is natively ExactAt(n+1) for every e and n≥0.

API `NodeSectionFactorization.PolynomialModel.sectionChain_projective`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. Every C(e).X n is a projective object of ModuleCat R.

API `NodeSectionFactorization.PolynomialModel.sectionChain_finiteFree`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. For every e,n, the native module underlying C(e).X n has both Module.Free R and Module.Finite R instances; it is the actual F=Fin 2→R.

API `NodeSectionFactorization.PolynomialModel.sectionResolutionHom_d`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. For every A-module M, every phase e and n≥0, native R-linear precomposition by the underlying C(e).d(n+1,n) equals exactly the existing sectionHomDifferential(A,γ,δ,s,t,M,e,n) on Hom_R(F,R⊗_A M). This fixes the actual coefficient cochain differential, without yet constructing a categorical Hom-complex isomorphism or native Ext comparison.

Test `NodeSectionFactorization.PolynomialModel.sectionChain.test_nonreduced_exact` (degenerate): For A=Z/4 and γ=δ=t=0,s=1, C(false) is ExactAt 2.

Test `NodeSectionFactorization.PolynomialModel.sectionChain.test_finite_projective` (compatibility): Every chain term is simultaneously a native projective ModuleCat object and a finite R-module.

Test `NodeSectionFactorization.PolynomialModel.sectionChain.test_hom_coefficient_differential` (compatibility): For every A-module M, native Hom precomposition by C(e).d(n+1,n) is the specified sectionHomDifferential.

### The native section chain successor map

`StableReductionPartII:MC.2/section-chain-successor-map` · `NodeSectionFactorization.PolynomialModel.sectionChain_d` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. For every e,n, C(e).d(n+1,n)=ModuleCat.ofHom(B(e,n)).

Proof: Use the native constructor evaluation theorem.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### Positive-degree exactness of the section chain

`StableReductionPartII:MC.2/section-chain-positive-exact` · `NodeSectionFactorization.PolynomialModel.sectionChain_exactAt` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. C(e) is natively ExactAt(n+1) for every e and n≥0.

Proof: Identify the actual associated short complex with B(e,n+1), B(e,n). Use the proven kernel/image exactness and native module exactness criterion.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### Degreewise native projectivity of the section chain

`StableReductionPartII:MC.2/section-chain-projective` · `NodeSectionFactorization.PolynomialModel.sectionChain_projective` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. Every C(e).X n is a projective object of ModuleCat R.

Proof: F is the finite product of two free rank-one R-modules. Reuse native free-module projectivity and its categorical wrapper.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### The section-ideal augmentation kills the first chain map

`StableReductionPartII:MC.2/section-chain-ideal-augmentation-zero` · `NodeSectionFactorization.PolynomialModel.sectionChainIdeal_augmentation_zero` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. P_J∘B(false,0)=P_J∘Ψ=0.

Proof: The actual signed presentation has kernel im Ψ; apply its exact-pair composite.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### The dual augmentation kills the first chain map

`StableReductionPartII:MC.2/section-chain-dual-augmentation-zero` · `NodeSectionFactorization.PolynomialModel.sectionChainDual_augmentation_zero` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. P_D∘B(true,0)=P_D∘Φ=0.

Proof: The actual signed dual presentation has kernel im Φ; apply its exact-pair composite.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### The native augmentation to the actual section ideal

`StableReductionPartII:MC.2/section-ideal-augmentation` · `NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation` · construction

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. Construct π_J:C(false)→single₀(J) as the native chain map whose degree-zero component is P_J.

Proof: Use the native chain-map equivalence with a map in degree zero annihilating d(1,0).

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

API `NodeSectionFactorization.PolynomialModel.sectionChainIdeal_augmentation_zero`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. P_J∘B(false,0)=P_J∘Ψ=0.

API `NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation_zero`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. π_J.f 0=ModuleCat.ofHom(P_J), including the prescribed negative second generator.

API `NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation_quasiIso`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. π_J is a QuasiIso: its map on native homology is an isomorphism in every degree.

Test `NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation.test_first_generator` (computation): π_J.f 0 sends (1,0) to the actual ideal generator c=u−ιs.

Test `NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation.test_second_signed_generator` (computation): π_J.f 0 sends (0,1) to −d=−(v−ιt), retaining the signed presentation.

Test `NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation.test_positive_component_zero` (degenerate): Every positive component π_J.f(n+1) is the zero morphism.

### The native augmentation to the actual dual

`StableReductionPartII:MC.2/section-dual-augmentation` · `NodeSectionFactorization.PolynomialModel.sectionDualAugmentation` · construction

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. Construct π_D:C(true)→single₀(D) as the native chain map whose degree-zero component is P_D.

Proof: Use the native chain-map equivalence with a map in degree zero annihilating d(1,0).

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

API `NodeSectionFactorization.PolynomialModel.sectionChainDual_augmentation_zero`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. P_D∘B(true,0)=P_D∘Φ=0.

API `NodeSectionFactorization.PolynomialModel.sectionDualAugmentation_zero`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. π_D.f 0=ModuleCat.ofHom(P_D), including the prescribed negative ε generator.

API `NodeSectionFactorization.PolynomialModel.sectionDualAugmentation_quasiIso`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. π_D is a QuasiIso: its map on native homology is an isomorphism in every degree.

Test `NodeSectionFactorization.PolynomialModel.sectionDualAugmentation.test_first_generator` (computation): π_D.f 0 sends (1,0) to the inclusion J→R.

Test `NodeSectionFactorization.PolynomialModel.sectionDualAugmentation.test_second_signed_generator` (computation): π_D.f 0 sends (0,1) to −ε, evaluated on each actual j∈J.

Test `NodeSectionFactorization.PolynomialModel.sectionDualAugmentation.test_positive_component_zero` (degenerate): Every positive component π_D.f(n+1) is the zero morphism.

### Degree zero of the section-ideal augmentation

`StableReductionPartII:MC.2/section-ideal-augmentation-degree-zero` · `NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation_zero` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. π_J.f 0=ModuleCat.ofHom(P_J), including the prescribed negative second generator.

Proof: Evaluate the native chain-map equivalence at degree zero.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### Degree zero of the dual augmentation

`StableReductionPartII:MC.2/section-dual-augmentation-degree-zero` · `NodeSectionFactorization.PolynomialModel.sectionDualAugmentation_zero` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. π_D.f 0=ModuleCat.ofHom(P_D), including the prescribed negative ε generator.

Proof: Evaluate the native chain-map equivalence at degree zero.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### The section-ideal augmentation is a native quasi-isomorphism

`StableReductionPartII:MC.2/section-ideal-augmentation-quasi-isomorphism` · `NodeSectionFactorization.PolynomialModel.sectionIdealAugmentation_quasiIso` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. π_J is a QuasiIso: its map on native homology is an isomorphism in every degree.

Proof: In degree zero use the actual augmented short complex; ker P_J=im Ψ and surjectivity give exactness and epi. Identify that short complex through a native isomorphism and apply the degree-zero quasi-isomorphism criterion. At n+1 both complexes are exact, so the native criterion gives QuasiIsoAt.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### The dual augmentation is a native quasi-isomorphism

`StableReductionPartII:MC.2/section-dual-augmentation-quasi-isomorphism` · `NodeSectionFactorization.PolynomialModel.sectionDualAugmentation_quasiIso` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. π_D is a QuasiIso: its map on native homology is an isomorphism in every degree.

Proof: In degree zero use the actual augmented short complex; ker P_D=im Φ and surjectivity give exactness and epi. Identify that short complex through a native isomorphism and apply the degree-zero quasi-isomorphism criterion. At n+1 both complexes are exact, so the native criterion gives QuasiIsoAt.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### The actual section-ideal projective resolution

`StableReductionPartII:MC.2/section-ideal-projective-resolution` · `NodeSectionFactorization.PolynomialModel.sectionIdealResolution` · construction

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. Bundle C(false), its degreewise projectivity and π_J into the native ProjectiveResolution of J. This is the actual signed two-periodic resolution, not an arbitrarily chosen generic resolution.

Proof: Supply the actual complex, augmentation, projectivity and QuasiIso to the existing native structure.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

API `NodeSectionFactorization.PolynomialModel.sectionIdealResolution_complex`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. The native sectionIdealResolution.complex is exactly C(false).

API `NodeSectionFactorization.PolynomialModel.sectionIdealResolution_augmentation`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. The native sectionIdealResolution.π is exactly π_J.

API `NodeSectionFactorization.PolynomialModel.sectionIdealResolution_quasiIso`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. The actual bundled sectionIdealResolution.π is a native QuasiIso in every degree.

Test `NodeSectionFactorization.PolynomialModel.sectionIdealResolution.test_starting_psi` (compatibility): The native section-ideal resolution differential d(1,0) is exactly Ψ.

Test `NodeSectionFactorization.PolynomialModel.sectionIdealResolution.test_next_phi` (compatibility): Its next native differential d(2,1) is exactly Φ.

Test `NodeSectionFactorization.PolynomialModel.sectionIdealResolution.test_zero_ring_quasiIso` (degenerate): Over the zero ring Z/1 with all parameters zero, the actual ideal-resolution augmentation is a native QuasiIso.

### The actual dual projective resolution

`StableReductionPartII:MC.2/section-dual-projective-resolution` · `NodeSectionFactorization.PolynomialModel.sectionDualResolution` · construction

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. Bundle C(true), its degreewise projectivity and π_D into the native ProjectiveResolution of D. This is the actual signed two-periodic resolution, not an arbitrarily chosen generic resolution.

Proof: Supply the actual complex, augmentation, projectivity and QuasiIso to the existing native structure.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

API `NodeSectionFactorization.PolynomialModel.sectionDualResolution_complex`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. The native sectionDualResolution.complex is exactly C(true).

API `NodeSectionFactorization.PolynomialModel.sectionDualResolution_augmentation`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. The native sectionDualResolution.π is exactly π_D.

API `NodeSectionFactorization.PolynomialModel.sectionDualResolution_quasiIso`: For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. The actual bundled sectionDualResolution.π is a native QuasiIso in every degree.

Test `NodeSectionFactorization.PolynomialModel.sectionDualResolution.test_starting_phi` (compatibility): The native dual-resolution differential d(1,0) is exactly Φ.

Test `NodeSectionFactorization.PolynomialModel.sectionDualResolution.test_next_psi` (compatibility): Its next native differential d(2,1) is exactly Ψ.

Test `NodeSectionFactorization.PolynomialModel.sectionDualResolution.test_nonreduced_quasiIso` (degenerate): Over Z/4 with γ=δ=t=0,s=1, the actual dual-resolution augmentation is a native QuasiIso.

### The section-ideal resolution starts with Ψ

`StableReductionPartII:MC.2/section-chain-ideal-start` · `NodeSectionFactorization.PolynomialModel.sectionChainDifferential_ideal_zero` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. B(false,0)=Ψ as an actual R-linear map.

Proof: Evaluate the false phase at zero.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### The dual resolution starts with Φ

`StableReductionPartII:MC.2/section-chain-dual-start` · `NodeSectionFactorization.PolynomialModel.sectionChainDifferential_dual_zero` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. B(true,0)=Φ as an actual R-linear map.

Proof: Evaluate the true phase at zero.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### Two-periodicity of the section chain maps

`StableReductionPartII:MC.2/section-chain-differential-periodic` · `NodeSectionFactorization.PolynomialModel.sectionChainDifferential_periodic` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. B(e,n+2)=B(e,n) for every e,n as actual R-linear maps.

Proof: Use the native modulo-two calculation.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### The actual section chain objects

`StableReductionPartII:MC.2/section-chain-objects` · `NodeSectionFactorization.PolynomialModel.sectionChain_X` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. For every e,n, C(e).X n is the native object ModuleCat.of R F.

Proof: Evaluate the native chain constructor.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### The section chain terms are finite free

`StableReductionPartII:MC.2/section-chain-finite-free` · `NodeSectionFactorization.PolynomialModel.sectionChain_finiteFree` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. For every e,n, the native module underlying C(e).X n has both Module.Free R and Module.Finite R instances; it is the actual F=Fin 2→R.

Proof: Use the existing finite-product free and finite-module instances, including for the zero ring.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### The downward section chain shape

`StableReductionPartII:MC.2/section-chain-shape` · `NodeSectionFactorization.PolynomialModel.sectionChain_shape` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. C(e).d(i,j)=0 whenever j+1≠i; there is no upward differential or negative degree.

Proof: Apply the native complex shape field.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### Native Hom precomposition by the section resolution differential

`StableReductionPartII:MC.2/section-resolution-hom-differential` · `NodeSectionFactorization.PolynomialModel.sectionResolutionHom_d` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. For every A-module M, every phase e and n≥0, native R-linear precomposition by the underlying C(e).d(n+1,n) equals exactly the existing sectionHomDifferential(A,γ,δ,s,t,M,e,n) on Hom_R(F,R⊗_A M). This fixes the actual coefficient cochain differential, without yet constructing a categorical Hom-complex isomorphism or native Ext comparison.

Proof: Evaluate the native chain differential. Resolve the two parity values and phases; precomposition is exactly the existing Hom differential.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### Underlying complex of the section-ideal resolution

`StableReductionPartII:MC.2/section-ideal-resolution-complex` · `NodeSectionFactorization.PolynomialModel.sectionIdealResolution_complex` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. The native sectionIdealResolution.complex is exactly C(false).

Proof: Evaluate the specified native resolution data.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### Augmentation of the section-ideal resolution

`StableReductionPartII:MC.2/section-ideal-resolution-augmentation` · `NodeSectionFactorization.PolynomialModel.sectionIdealResolution_augmentation` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. The native sectionIdealResolution.π is exactly π_J.

Proof: Evaluate the specified native resolution data.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### Underlying complex of the dual resolution

`StableReductionPartII:MC.2/section-dual-resolution-complex` · `NodeSectionFactorization.PolynomialModel.sectionDualResolution_complex` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. The native sectionDualResolution.complex is exactly C(true).

Proof: Evaluate the specified native resolution data.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### Augmentation of the dual resolution

`StableReductionPartII:MC.2/section-dual-resolution-augmentation` · `NodeSectionFactorization.PolynomialModel.sectionDualResolution_augmentation` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. The native sectionDualResolution.π is exactly π_D.

Proof: Evaluate the specified native resolution data.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### The bundled section-ideal resolution is augmented by a quasi-isomorphism

`StableReductionPartII:MC.2/section-ideal-resolution-quasi-isomorphism` · `NodeSectionFactorization.PolynomialModel.sectionIdealResolution_quasiIso` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. The actual bundled sectionIdealResolution.π is a native QuasiIso in every degree.

Proof: Use the native certified quasi-isomorphism field of this actual resolution.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

### The bundled dual resolution is augmented by a quasi-isomorphism

`StableReductionPartII:MC.2/section-dual-resolution-quasi-isomorphism` · `NodeSectionFactorization.PolynomialModel.sectionDualResolution_quasiIso` · lemma

For any commutative ring A and γ,δ,s,t∈A, use the actual polynomial ring R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), its coefficient map ι:A→R, u=[X], v=[Y], c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt and a=ιδ·v+ιδ·ιt+ιγ·u. Set J=(c,d), D=Hom_R(J,R), Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)), and the signed presentations P_J(z)=cz₀−dz₁, P_D(z)=z₀incl−z₁ε.  Put F=R² with its native R-module structure. For e∈{false,true} write B(e,n)=Φ if (n mod 2=0) has the same truth value as e=true, and Ψ otherwise. C(e) has F in every degree n≥0, differential C(e)_{n+1}→C(e)_n given by B(e,n), and zero off that shape. The actual bundled sectionDualResolution.π is a native QuasiIso in every degree.

Proof: Use the native certified quasi-isomorphism field of this actual resolution.

Sources: Knudsen, [§3 Key Example and §4](https://arxiv.org/html/1106.1588v2); native Mathlib declarations at the packet baseline. These general-ring native adapters are authored deductions, not a new printed geometric theorem.

The native Lean comparison signatures use HEq when the §13 admitted constructor bodies leave chain objects opaque. The checked native constructors identify those objects with the actual F=Fin2→R, and the comparisons preserve the same maps and signs.


## Actual categorical Hom and higher polynomial Ext checkpoint

The actual categorical Hom-complex comparison is now checked, coefficient-natural in every degree and linked to both native Mathlib positive Ext interfaces. Ext_R^{n+1}(J,R⊗_A M)=Ext_R^{n+1}(D,R⊗_A M)=0 for every M without flatness. The next frontier is the exact Appendix/Ile relative stable-reflexivity and two-base completion theorem, then the pointed completed-local hull, family/sheaf descent and arbitrary-base approximation. All MC.0–MC.7 geometric obligations remain.

The localization-defined CategoryTheory.Abelian.Ext and the left-derived linear Yoneda _root_.Ext are different pinned Mathlib interfaces. The former vanishing is proved directly with extMk_surjective/extMk_eq_zero_iff; the latter has a native R-module isomorphism with the actual Hom cochain homology. This is not a proof identifying the two general Ext definitions. Degree-zero isomorphisms are retained and no degree-zero vanishing is asserted. HEq protects only inherited opaque constructor signatures in the admitted sketch, not mathematical weakening.

### Categorical Hom cochains of the section resolutions

StableReductionPartII:MC.2/section-resolution-hom-isomorphism — NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). Construct the actual native ModuleCat R isomorphism C(e).linearYonedaObj R (R⊗_A M) ≅ H(e,M). In every degree it sends a categorical morphism h:F→R⊗_A M to its underlying R-linear map h.hom; its inverse is ModuleCat.ofHom. The differential squares commute with precomposition by B(e,n), including degree zero.

Hypotheses: A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

Prerequisites: StableReductionPartII:MC.2/section-chain, StableReductionPartII:MC.2/section-hom-cochain, StableReductionPartII:MC.2/section-hom-cochain-differential, StableReductionPartII:MC.2/section-resolution-hom-differential, mathlib:ChainComplex.linearYonedaObj, mathlib:HomologicalComplex.Hom.isoOfComponents, mathlib:ModuleCat.homLinearEquiv, mathlib:LinearEquiv.toModuleIso.

Proof: Use exactly the stated native comparison maps and native functor composition. Use the separately named actual differential comparison for the Hom squares; for Ext apply native isoExt and homologyFunctor.mapIso, not a new theory of Ext.

Sources: knudsen2012; arXiv:1106.1588v2 §3 Key Example, Proposition3.1 and Corollary3.2; §4 separates completed-local descent.; The printed matrix sequence motivates this specialized polynomial Ext calculation. The arbitrary-ring/coefficient statement and its native categorical proof are authored deductions from the inherited checked resolutions; no printed relative stable-reflexivity or completion theorem is inferred. mathlib-codex-a71f92-section-ext; Pinned Abelian/Ext.lean lines43–74; Abelian/Projective/Ext.lean lines137–225; ModuleCat/Basic.lean lines269–277,389–406; HomologicalComplex.lean lines505–537; ShortComplex/HomologicalComplex.lean lines486–493.; Reuse the native Hom and two Ext interfaces, not re-plan their generic theories. Exact statements and surrounding hypotheses were read at the pinned commit.

API:

- NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso_apply: In every degree n, the forward component of sectionResolutionHomIso sends h:C(e)_n→R⊗_A M to the actual linear map h.hom. Its public HEq statement protects the inherited opaque constructors in the admitted sketch; in the native model this is an equality.
- NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso_inv_apply: In every degree n the inverse component is exactly ModuleCat.ofHom composed with ModuleCat.homLinearEquiv.symm, as a native categorical map from the R-linear Hom module. The public HEq signature retains the same actual map while not unfolding admitted complex data.
- NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso_natural: For every A-linear coefficient map f:M→M′, every e,n and actual categorical h:C(e)_n→R⊗_A M, the forward Hom-comparison component applied to h followed by id_R⊗f is exactly the underlying map (id_R⊗f)∘h.hom. These are all degreewise naturality squares of the actual Hom-complex comparison. No naturality assertion for an unconstructed geometric or completed-family Ext comparison is inferred.

Tests:

- NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso.test_actual_components: The forward comparison in every degree sends an actual categorical morphism to its R-linear map, by HEq, including degree zero.
- NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso.test_inverse: The inverse followed by the forward comparison has the identity component in every degree of the actual Hom cochain.
- NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso.test_naturality: Every A-linear coefficient map gives the stated Hom-comparison naturality square in every degree.

### Components of the categorical Hom comparison

StableReductionPartII:MC.2/section-resolution-hom-isomorphism-apply — NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso_apply

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). In every degree n, the forward component of sectionResolutionHomIso sends h:C(e)_n→R⊗_A M to the actual linear map h.hom. Its public HEq statement protects the inherited opaque constructors in the admitted sketch; in the native model this is an equality.

Hypotheses: A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

Prerequisites: StableReductionPartII:MC.2/section-resolution-hom-isomorphism.

Proof: Evaluate the stated actual native comparison or transport through its named native isomorphism; use only the listed earlier facts and routine categorical/linear-map laws.

Sources: knudsen2012; arXiv:1106.1588v2 §3 Key Example, Proposition3.1 and Corollary3.2; §4 separates completed-local descent.; The printed matrix sequence motivates this specialized polynomial Ext calculation. The arbitrary-ring/coefficient statement and its native categorical proof are authored deductions from the inherited checked resolutions; no printed relative stable-reflexivity or completion theorem is inferred. mathlib-codex-a71f92-section-ext; Pinned Abelian/Ext.lean lines43–74; Abelian/Projective/Ext.lean lines137–225; ModuleCat/Basic.lean lines269–277,389–406; HomologicalComplex.lean lines505–537; ShortComplex/HomologicalComplex.lean lines486–493.; Reuse the native Hom and two Ext interfaces, not re-plan their generic theories. Exact statements and surrounding hypotheses were read at the pinned commit.

### Inverse components of the categorical Hom comparison

StableReductionPartII:MC.2/section-resolution-hom-isomorphism-inverse — NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso_inv_apply

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). In every degree n the inverse component is exactly ModuleCat.ofHom composed with ModuleCat.homLinearEquiv.symm, as a native categorical map from the R-linear Hom module. The public HEq signature retains the same actual map while not unfolding admitted complex data.

Hypotheses: A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

Prerequisites: StableReductionPartII:MC.2/section-resolution-hom-isomorphism.

Proof: Evaluate the stated actual native comparison or transport through its named native isomorphism; use only the listed earlier facts and routine categorical/linear-map laws.

Sources: knudsen2012; arXiv:1106.1588v2 §3 Key Example, Proposition3.1 and Corollary3.2; §4 separates completed-local descent.; The printed matrix sequence motivates this specialized polynomial Ext calculation. The arbitrary-ring/coefficient statement and its native categorical proof are authored deductions from the inherited checked resolutions; no printed relative stable-reflexivity or completion theorem is inferred. mathlib-codex-a71f92-section-ext; Pinned Abelian/Ext.lean lines43–74; Abelian/Projective/Ext.lean lines137–225; ModuleCat/Basic.lean lines269–277,389–406; HomologicalComplex.lean lines505–537; ShortComplex/HomologicalComplex.lean lines486–493.; Reuse the native Hom and two Ext interfaces, not re-plan their generic theories. Exact statements and surrounding hypotheses were read at the pinned commit.

### Positive exactness of actual categorical Hom precomposition

StableReductionPartII:MC.2/section-resolution-categorical-hom-exact — NodeSectionFactorization.PolynomialModel.sectionResolutionHom_exact

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). For e=false and e=true and every n≥0, the actual maps Hom_R(C(e)_n,N)→Hom_R(C(e)_(n+1),N)→Hom_R(C(e)_(n+2),N), by precomposition with the resolution differentials, are Function.Exact. A cocycle is the precomposition of an actual predecessor morphism; no coefficient flatness is assumed.

Hypotheses: A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

Prerequisites: StableReductionPartII:MC.2/section-hom-differential-exact, StableReductionPartII:MC.2/section-resolution-hom-differential, mathlib:HomologicalComplex.d_comp_d.

Proof: Evaluate the stated actual native comparison or transport through its named native isomorphism; use only the listed earlier facts and routine categorical/linear-map laws.

Sources: knudsen2012; arXiv:1106.1588v2 §3 Key Example, Proposition3.1 and Corollary3.2; §4 separates completed-local descent.; The printed matrix sequence motivates this specialized polynomial Ext calculation. The arbitrary-ring/coefficient statement and its native categorical proof are authored deductions from the inherited checked resolutions; no printed relative stable-reflexivity or completion theorem is inferred. mathlib-codex-a71f92-section-ext; Pinned Abelian/Ext.lean lines43–74; Abelian/Projective/Ext.lean lines137–225; ModuleCat/Basic.lean lines269–277,389–406; HomologicalComplex.lean lines505–537; ShortComplex/HomologicalComplex.lean lines486–493.; Reuse the native Hom and two Ext interfaces, not re-plan their generic theories. Exact statements and surrounding hypotheses were read at the pinned commit.

### Derived-functor Ext of the actual section ideal

StableReductionPartII:MC.2/section-ideal-derived-ext-isomorphism — NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). For every n≥0 construct a native R-module isomorphism ((_root_.Ext R (ModuleCat R) n).obj (op J)).obj N ≅ H(false,M).homology n, by the native sectionIdealResolution.isoExt followed by homology of sectionResolutionHomIso. Here _root_.Ext is Mathlib's left-derived linear Yoneda bifunctor, not a new carrier or the localization-defined Abelian.Ext.

Hypotheses: A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

Prerequisites: StableReductionPartII:MC.2/section-ideal-projective-resolution, StableReductionPartII:MC.2/section-resolution-hom-isomorphism, mathlib:CategoryTheory.ProjectiveResolution.isoExt, mathlib:HomologicalComplex.homologyFunctor, mathlib:Ext.

Proof: Use exactly the stated native comparison maps and native functor composition. Use the separately named actual differential comparison for the Hom squares; for Ext apply native isoExt and homologyFunctor.mapIso, not a new theory of Ext.

Sources: knudsen2012; arXiv:1106.1588v2 §3 Key Example, Proposition3.1 and Corollary3.2; §4 separates completed-local descent.; The printed matrix sequence motivates this specialized polynomial Ext calculation. The arbitrary-ring/coefficient statement and its native categorical proof are authored deductions from the inherited checked resolutions; no printed relative stable-reflexivity or completion theorem is inferred. mathlib-codex-a71f92-section-ext; Pinned Abelian/Ext.lean lines43–74; Abelian/Projective/Ext.lean lines137–225; ModuleCat/Basic.lean lines269–277,389–406; HomologicalComplex.lean lines505–537; ShortComplex/HomologicalComplex.lean lines486–493.; Reuse the native Hom and two Ext interfaces, not re-plan their generic theories. Exact statements and surrounding hypotheses were read at the pinned commit.

API:

- NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso_inverse: The forward and inverse maps of sectionIdealDerivedExtIso compose to the identity of the actual derived-functor Ext module, in every degree including degree zero.
- NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExt_isZero: For every n≥0 the actual R-module ((_root_.Ext R (ModuleCat R) (n+1)).obj (op J)).obj (R⊗_A M) is native Limits.IsZero. Transport the already checked zero positive cohomology through the actual section-ideal Ext isomorphism.

Tests:

- NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso.test_degree_zero: The ideal Ext comparison round-trips an arbitrary actual degree-zero Ext element; positive vanishing is not falsely extended to degree zero.
- NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso.test_nonflat: For A=Z, γ=1,δ=0,s=1,t=0 and the non-flat coefficient module M=Z/2, the actual derived-functor Ext^3(J,R⊗_Z M) module is zero.
- NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso.test_zero_ring: For the zero coefficient ring A=Z/1 and M=A, the actual ideal derived-functor Ext^1 module is zero; no Nontrivial hypothesis is introduced.

### Derived-functor Ext of the actual section dual

StableReductionPartII:MC.2/section-dual-derived-ext-isomorphism — NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). For every n≥0 construct a native R-module isomorphism ((_root_.Ext R (ModuleCat R) n).obj (op D)).obj N ≅ H(true,M).homology n, by the native sectionDualResolution.isoExt followed by homology of sectionResolutionHomIso. Its alternating phase is the actual dual resolution, not the ideal phase.

Hypotheses: A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

Prerequisites: StableReductionPartII:MC.2/section-dual-projective-resolution, StableReductionPartII:MC.2/section-resolution-hom-isomorphism, mathlib:CategoryTheory.ProjectiveResolution.isoExt, mathlib:HomologicalComplex.homologyFunctor, mathlib:Ext.

Proof: Use exactly the stated native comparison maps and native functor composition. Use the separately named actual differential comparison for the Hom squares; for Ext apply native isoExt and homologyFunctor.mapIso, not a new theory of Ext.

Sources: knudsen2012; arXiv:1106.1588v2 §3 Key Example, Proposition3.1 and Corollary3.2; §4 separates completed-local descent.; The printed matrix sequence motivates this specialized polynomial Ext calculation. The arbitrary-ring/coefficient statement and its native categorical proof are authored deductions from the inherited checked resolutions; no printed relative stable-reflexivity or completion theorem is inferred. mathlib-codex-a71f92-section-ext; Pinned Abelian/Ext.lean lines43–74; Abelian/Projective/Ext.lean lines137–225; ModuleCat/Basic.lean lines269–277,389–406; HomologicalComplex.lean lines505–537; ShortComplex/HomologicalComplex.lean lines486–493.; Reuse the native Hom and two Ext interfaces, not re-plan their generic theories. Exact statements and surrounding hypotheses were read at the pinned commit.

API:

- NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso_inverse: The forward and inverse maps of sectionDualDerivedExtIso compose to the identity of the actual derived-functor Ext module, in every degree including degree zero.
- NodeSectionFactorization.PolynomialModel.sectionDualDerivedExt_isZero: For every n≥0 the actual R-module ((_root_.Ext R (ModuleCat R) (n+1)).obj (op D)).obj (R⊗_A M) is native Limits.IsZero. Use the dual resolution and the corresponding actual Hom phase.

Tests:

- NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso.test_degree_zero: The dual Ext comparison round-trips every actual degree-zero Ext element.
- NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso.test_nonreduced: For the nonreduced base A=Z/4, γ=δ=t=0,s=1 and M=A, the actual dual derived-functor Ext^2 module is zero.
- NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso.test_nonflat: For A=Z, γ=1,δ=0,s=1,t=0 and M=Z/2 without flatness, the actual dual derived-functor Ext^1 module is zero.

### Inverse law for the ideal Ext comparison

StableReductionPartII:MC.2/section-ideal-derived-ext-isomorphism-inverse — NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso_inverse

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). The forward and inverse maps of sectionIdealDerivedExtIso compose to the identity of the actual derived-functor Ext module, in every degree including degree zero.

Hypotheses: A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

Prerequisites: StableReductionPartII:MC.2/section-ideal-derived-ext-isomorphism.

Proof: Evaluate the stated actual native comparison or transport through its named native isomorphism; use only the listed earlier facts and routine categorical/linear-map laws.

Sources: knudsen2012; arXiv:1106.1588v2 §3 Key Example, Proposition3.1 and Corollary3.2; §4 separates completed-local descent.; The printed matrix sequence motivates this specialized polynomial Ext calculation. The arbitrary-ring/coefficient statement and its native categorical proof are authored deductions from the inherited checked resolutions; no printed relative stable-reflexivity or completion theorem is inferred. mathlib-codex-a71f92-section-ext; Pinned Abelian/Ext.lean lines43–74; Abelian/Projective/Ext.lean lines137–225; ModuleCat/Basic.lean lines269–277,389–406; HomologicalComplex.lean lines505–537; ShortComplex/HomologicalComplex.lean lines486–493.; Reuse the native Hom and two Ext interfaces, not re-plan their generic theories. Exact statements and surrounding hypotheses were read at the pinned commit.

### Inverse law for the dual Ext comparison

StableReductionPartII:MC.2/section-dual-derived-ext-isomorphism-inverse — NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso_inverse

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). The forward and inverse maps of sectionDualDerivedExtIso compose to the identity of the actual derived-functor Ext module, in every degree including degree zero.

Hypotheses: A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

Prerequisites: StableReductionPartII:MC.2/section-dual-derived-ext-isomorphism.

Proof: Evaluate the stated actual native comparison or transport through its named native isomorphism; use only the listed earlier facts and routine categorical/linear-map laws.

Sources: knudsen2012; arXiv:1106.1588v2 §3 Key Example, Proposition3.1 and Corollary3.2; §4 separates completed-local descent.; The printed matrix sequence motivates this specialized polynomial Ext calculation. The arbitrary-ring/coefficient statement and its native categorical proof are authored deductions from the inherited checked resolutions; no printed relative stable-reflexivity or completion theorem is inferred. mathlib-codex-a71f92-section-ext; Pinned Abelian/Ext.lean lines43–74; Abelian/Projective/Ext.lean lines137–225; ModuleCat/Basic.lean lines269–277,389–406; HomologicalComplex.lean lines505–537; ShortComplex/HomologicalComplex.lean lines486–493.; Reuse the native Hom and two Ext interfaces, not re-plan their generic theories. Exact statements and surrounding hypotheses were read at the pinned commit.

### Positive derived-functor Ext vanishing for the section ideal

StableReductionPartII:MC.2/section-ideal-derived-ext-vanishing — NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExt_isZero

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). For every n≥0 the actual R-module ((_root_.Ext R (ModuleCat R) (n+1)).obj (op J)).obj (R⊗_A M) is native Limits.IsZero. Transport the already checked zero positive cohomology through the actual section-ideal Ext isomorphism.

Hypotheses: A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

Prerequisites: StableReductionPartII:MC.2/section-ideal-derived-ext-isomorphism, StableReductionPartII:MC.2/section-hom-cochain-positive-homology, mathlib:CategoryTheory.Limits.IsZero.of_iso.

Proof: Evaluate the stated actual native comparison or transport through its named native isomorphism; use only the listed earlier facts and routine categorical/linear-map laws.

Sources: knudsen2012; arXiv:1106.1588v2 §3 Key Example, Proposition3.1 and Corollary3.2; §4 separates completed-local descent.; The printed matrix sequence motivates this specialized polynomial Ext calculation. The arbitrary-ring/coefficient statement and its native categorical proof are authored deductions from the inherited checked resolutions; no printed relative stable-reflexivity or completion theorem is inferred. mathlib-codex-a71f92-section-ext; Pinned Abelian/Ext.lean lines43–74; Abelian/Projective/Ext.lean lines137–225; ModuleCat/Basic.lean lines269–277,389–406; HomologicalComplex.lean lines505–537; ShortComplex/HomologicalComplex.lean lines486–493.; Reuse the native Hom and two Ext interfaces, not re-plan their generic theories. Exact statements and surrounding hypotheses were read at the pinned commit.

### Positive derived-functor Ext vanishing for the section dual

StableReductionPartII:MC.2/section-dual-derived-ext-vanishing — NodeSectionFactorization.PolynomialModel.sectionDualDerivedExt_isZero

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). For every n≥0 the actual R-module ((_root_.Ext R (ModuleCat R) (n+1)).obj (op D)).obj (R⊗_A M) is native Limits.IsZero. Use the dual resolution and the corresponding actual Hom phase.

Hypotheses: A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

Prerequisites: StableReductionPartII:MC.2/section-dual-derived-ext-isomorphism, StableReductionPartII:MC.2/section-hom-cochain-positive-homology, mathlib:CategoryTheory.Limits.IsZero.of_iso.

Proof: Evaluate the stated actual native comparison or transport through its named native isomorphism; use only the listed earlier facts and routine categorical/linear-map laws.

Sources: knudsen2012; arXiv:1106.1588v2 §3 Key Example, Proposition3.1 and Corollary3.2; §4 separates completed-local descent.; The printed matrix sequence motivates this specialized polynomial Ext calculation. The arbitrary-ring/coefficient statement and its native categorical proof are authored deductions from the inherited checked resolutions; no printed relative stable-reflexivity or completion theorem is inferred. mathlib-codex-a71f92-section-ext; Pinned Abelian/Ext.lean lines43–74; Abelian/Projective/Ext.lean lines137–225; ModuleCat/Basic.lean lines269–277,389–406; HomologicalComplex.lean lines505–537; ShortComplex/HomologicalComplex.lean lines486–493.; Reuse the native Hom and two Ext interfaces, not re-plan their generic theories. Exact statements and surrounding hypotheses were read at the pinned commit.

### Positive native localization Ext vanishing for the section ideal

StableReductionPartII:MC.2/section-ideal-localization-ext-vanishing — NodeSectionFactorization.PolynomialModel.sectionIdealExt_eq_zero

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). For every n≥0 and α:CategoryTheory.Abelian.Ext J (R⊗_A M) (n+1), α=0. Use the actual sectionIdealResolution and Mathlib extMk_surjective to represent α by a categorical cocycle; exact precomposition supplies a predecessor, and extMk_eq_zero_iff kills the class. This separately proves the localization-defined native Ext statement without assuming an isomorphism between the two Mathlib Ext definitions.

Hypotheses: A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

Prerequisites: StableReductionPartII:MC.2/section-ideal-projective-resolution, StableReductionPartII:MC.2/section-resolution-categorical-hom-exact, mathlib:CategoryTheory.Abelian.Ext, mathlib:CategoryTheory.ProjectiveResolution.extMk_surjective, mathlib:CategoryTheory.ProjectiveResolution.extMk_eq_zero_iff, mathlib:CategoryTheory.hasExt_of_enoughProjectives.

Proof: Apply the native extMk_surjective to the specified actual projective resolution. Use sectionResolutionHom_exact for the cocycle and obtain an actual categorical boundary. Apply native extMk_eq_zero_iff; no identification of the two Ext carriers is assumed.

Sources: knudsen2012; arXiv:1106.1588v2 §3 Key Example, Proposition3.1 and Corollary3.2; §4 separates completed-local descent.; The printed matrix sequence motivates this specialized polynomial Ext calculation. The arbitrary-ring/coefficient statement and its native categorical proof are authored deductions from the inherited checked resolutions; no printed relative stable-reflexivity or completion theorem is inferred. mathlib-codex-a71f92-section-ext; Pinned Abelian/Ext.lean lines43–74; Abelian/Projective/Ext.lean lines137–225; ModuleCat/Basic.lean lines269–277,389–406; HomologicalComplex.lean lines505–537; ShortComplex/HomologicalComplex.lean lines486–493.; Reuse the native Hom and two Ext interfaces, not re-plan their generic theories. Exact statements and surrounding hypotheses were read at the pinned commit.

Tests:

- NodeSectionFactorization.PolynomialModel.sectionIdealExt.test_nonflat: For A=Z, γ=1,δ=0,s=1,t=0 and M=Z/2, every element of native localization Abelian.Ext^4(J,R⊗M) is zero.
- NodeSectionFactorization.PolynomialModel.sectionIdealExt.test_zero_ring: For A=Z/1 and M=A, every native localization Abelian.Ext^1(J,R⊗M) class is zero.

### Positive native localization Ext vanishing for the section dual

StableReductionPartII:MC.2/section-dual-localization-ext-vanishing — NodeSectionFactorization.PolynomialModel.sectionDualExt_eq_zero

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). For every n≥0 and α:CategoryTheory.Abelian.Ext D (R⊗_A M) (n+1), α=0. Use the actual sectionDualResolution, extMk_surjective, the true alternating dual precomposition and extMk_eq_zero_iff. No dual coefficient flatness or identification with a made-up Ext carrier is assumed.

Hypotheses: A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

Prerequisites: StableReductionPartII:MC.2/section-dual-projective-resolution, StableReductionPartII:MC.2/section-resolution-categorical-hom-exact, mathlib:CategoryTheory.Abelian.Ext, mathlib:CategoryTheory.ProjectiveResolution.extMk_surjective, mathlib:CategoryTheory.ProjectiveResolution.extMk_eq_zero_iff, mathlib:CategoryTheory.hasExt_of_enoughProjectives.

Proof: Apply the native extMk_surjective to the specified actual projective resolution. Use sectionResolutionHom_exact for the cocycle and obtain an actual categorical boundary. Apply native extMk_eq_zero_iff; no identification of the two Ext carriers is assumed.

Sources: knudsen2012; arXiv:1106.1588v2 §3 Key Example, Proposition3.1 and Corollary3.2; §4 separates completed-local descent.; The printed matrix sequence motivates this specialized polynomial Ext calculation. The arbitrary-ring/coefficient statement and its native categorical proof are authored deductions from the inherited checked resolutions; no printed relative stable-reflexivity or completion theorem is inferred. mathlib-codex-a71f92-section-ext; Pinned Abelian/Ext.lean lines43–74; Abelian/Projective/Ext.lean lines137–225; ModuleCat/Basic.lean lines269–277,389–406; HomologicalComplex.lean lines505–537; ShortComplex/HomologicalComplex.lean lines486–493.; Reuse the native Hom and two Ext interfaces, not re-plan their generic theories. Exact statements and surrounding hypotheses were read at the pinned commit.

Tests:

- NodeSectionFactorization.PolynomialModel.sectionDualExt.test_nonreduced: For A=Z/4, γ=δ=t=0,s=1 and M=A, every native localization Abelian.Ext^2(D,R⊗M) class is zero.

### Coefficient naturality of the categorical Hom comparison

StableReductionPartII:MC.2/section-resolution-hom-isomorphism-naturality — NodeSectionFactorization.PolynomialModel.sectionResolutionHomIso_natural

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). For every A-linear coefficient map f:M→M′, every e,n and actual categorical h:C(e)_n→R⊗_A M, the forward Hom-comparison component applied to h followed by id_R⊗f is exactly the underlying map (id_R⊗f)∘h.hom. These are all degreewise naturality squares of the actual Hom-complex comparison. No naturality assertion for an unconstructed geometric or completed-family Ext comparison is inferred.

Hypotheses: A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

Prerequisites: StableReductionPartII:MC.2/section-resolution-hom-isomorphism, mathlib:TensorProduct.AlgebraTensorModule.map.

Proof: Evaluate the stated actual native comparison or transport through its named native isomorphism; use only the listed earlier facts and routine categorical/linear-map laws.

Sources: knudsen2012; arXiv:1106.1588v2 §3 Key Example, Proposition3.1 and Corollary3.2; §4 separates completed-local descent.; The printed matrix sequence motivates this specialized polynomial Ext calculation. The arbitrary-ring/coefficient statement and its native categorical proof are authored deductions from the inherited checked resolutions; no printed relative stable-reflexivity or completion theorem is inferred. mathlib-codex-a71f92-section-ext; Pinned Abelian/Ext.lean lines43–74; Abelian/Projective/Ext.lean lines137–225; ModuleCat/Basic.lean lines269–277,389–406; HomologicalComplex.lean lines505–537; ShortComplex/HomologicalComplex.lean lines486–493.; Reuse the native Hom and two Ext interfaces, not re-plan their generic theories. Exact statements and surrounding hypotheses were read at the pinned commit.

### Zero preservation for the ideal Ext comparison

StableReductionPartII:MC.2/section-ideal-derived-ext-isomorphism-zero — NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso_zero

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). The forward native R-linear map of sectionIdealDerivedExtIso sends zero to zero in every degree.

Hypotheses: A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

Prerequisites: StableReductionPartII:MC.2/section-ideal-derived-ext-isomorphism.

Proof: Use map_zero for the actual R-linear hom map of the native module isomorphism.

Sources: knudsen2012; arXiv:1106.1588v2 §3 Key Example, Proposition3.1 and Corollary3.2; §4 separates completed-local descent.; The printed matrix sequence motivates this specialized polynomial Ext calculation. The arbitrary-ring/coefficient statement and its native categorical proof are authored deductions from the inherited checked resolutions; no printed relative stable-reflexivity or completion theorem is inferred. mathlib-codex-a71f92-section-ext; Pinned Abelian/Ext.lean lines43–74; Abelian/Projective/Ext.lean lines137–225; ModuleCat/Basic.lean lines269–277,389–406; HomologicalComplex.lean lines505–537; ShortComplex/HomologicalComplex.lean lines486–493.; Reuse the native Hom and two Ext interfaces, not re-plan their generic theories. Exact statements and surrounding hypotheses were read at the pinned commit.

### Zero preservation for the dual Ext comparison

StableReductionPartII:MC.2/section-dual-derived-ext-isomorphism-zero — NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso_zero

For every commutative ring A and γ,δ,s,t∈A, use the actual R=A[Y][X]/(X²+γXY+δY²−(s²+γst+δt²)), u=[X], v=[Y], coefficient map ι, J=(u−ιs,v−ιt), D=Hom_R(J,R) and N=R⊗_A M for an arbitrary A-module M. Write c=u−ιs, d=v−ιt, b=u+ιs+ιγ·ιt, a=ιδ·v+ιδ·ιt+ιγ·u; Φ=((a,b),(−c,d)), Ψ=((d,−b),(c,a)). The actual finite-free resolutions C(false), C(true) have R² in every degree and differential B(e,n)=Φ if (n mod2=0)⇔e=true, otherwise Ψ, with signed augmentations P_J(z)=cz₀−dz₁ and P_D(z)=z₀incl−z₁ε. H(e,M) denotes the inherited actual R-linear Hom cochain with differential h↦h∘B(e,n). The forward native R-linear map of sectionDualDerivedExtIso sends zero to zero in every degree.

Hypotheses: A is any commutative ring and M any A-module. No noetherianity, coefficient flatness, nontriviality or unit-discriminant hypothesis is imposed on this polynomial calculation. Native ModuleCat objects are in a common universe. Relative stable reflexivity, two-base completion, pointed hulls and scheme/sheaf descent are separate geometric obligations.

Prerequisites: StableReductionPartII:MC.2/section-dual-derived-ext-isomorphism.

Proof: Use map_zero for the actual R-linear hom map of the native module isomorphism.

Sources: knudsen2012; arXiv:1106.1588v2 §3 Key Example, Proposition3.1 and Corollary3.2; §4 separates completed-local descent.; The printed matrix sequence motivates this specialized polynomial Ext calculation. The arbitrary-ring/coefficient statement and its native categorical proof are authored deductions from the inherited checked resolutions; no printed relative stable-reflexivity or completion theorem is inferred. mathlib-codex-a71f92-section-ext; Pinned Abelian/Ext.lean lines43–74; Abelian/Projective/Ext.lean lines137–225; ModuleCat/Basic.lean lines269–277,389–406; HomologicalComplex.lean lines505–537; ShortComplex/HomologicalComplex.lean lines486–493.; Reuse the native Hom and two Ext interfaces, not re-plan their generic theories. Exact statements and surrounding hypotheses were read at the pinned commit.

Additional API:

- NodeSectionFactorization.PolynomialModel.sectionIdealDerivedExtIso_zero: The forward comparison sends the zero native Ext element to zero cohomology in every degree.
- NodeSectionFactorization.PolynomialModel.sectionDualDerivedExtIso_zero: The forward comparison sends the zero native Ext element to zero cohomology in every degree.
