# Integral Hecke actions, determinants and interpolation

## Scope and dependencies

Build the reusable algebra that connects integral Hecke actions to continuous Galois determinants, including nonreduced and torsion coefficient rings. SmoothRepresentationsOfLocalGroups owns the abstract/local Hecke algebra; ArithmeticLocallySymmetricSpaces and automorphic geometry supply actual actions. ArithmeticGaloisRepresentations owns genuine representations and Weil–Deligne objects; this roadmap owns polynomial laws, determinants and their reconstruction hypotheses. Local and global deformation rings are owned by their dedicated roadmaps.

Use arbitrary commutative rings for polynomial laws and determinants. For p-adic interpolation use complete Noetherian local O-algebras and their specified adic topology, with finite residue field when required. Do not replace a degree-n determinant by its trace when n! is not invertible. Distinguish a Hecke algebra defined abstractly from its images in chain endomorphisms, derived endomorphisms and cohomology endomorphisms.

## Milestones

### IHG.0. Polynomial laws and determinants

Construct homogeneous polynomial laws of degree n natural in commutative coefficient algebras, representing divided powers and their tensor/base-change maps. Define a determinant as a multiplicative degree-n law D:A[G]→A with D(1)=1. Prove characteristic-polynomial identities, direct sum/product, duality, scalar extension, restriction to subgroups and continuity criteria. Prove agreement with matrix determinants for actual rank-n finite projective representations and the trace comparison only in its valid coefficient range.

### IHG.1. Cayley–Hamilton algebras and reconstruction

Construct the characteristic-polynomial ideal and Cayley–Hamilton quotient, faithful determinant descent and generalized matrix algebra decompositions under residually multiplicity-free hypotheses. Prove reconstruction over algebraically closed fields up to semisimplification and over complete local rings when residual absolute irreducibility supplies an actual representation. State residual reducibility and lifting obstructions rather than inferring a representation from every determinant. Develop reducibility ideals, extension modules and the lattice constructions used by congruence arguments.

### IHG.2. Hecke algebras acting on complexes

For a Hecke action on a bounded perfect complex define its finite image algebras and compare chain, homotopy/derived and cohomology actions. Prove localization decompositions over complete coefficient rings, support and annihilator lemmas and finite generation. Establish the nilpotence bound for the ideal of degree-zero derived endomorphisms acting trivially on all cohomology of a bounded-amplitude object, using the t-structure filtration and composition; transport to Hecke images. Preserve the dependence on amplitude. A quotient by this nilpotent ideal is not identified with the full algebra.

### IHG.3. Integral spherical normalization

At an unramified GL_n place v∤p outside S, let T_{v,i} be the characteristic function of K diag(uniformizer repeated i times,1 repeated n−i times) K, with vol(K)=1. With arithmetic Frobenius and the corresponding cohomological convention, use the Hecke polynomial

    P_v(X)=Σ_{i=0}^n (−1)^i q_v^{i(i−1)/2} T_{v,i} X^{n−i},  T_{v,0}=1.

Prove its relation to the chosen normalized Satake transform, determinant character and Tate twist. Every other convention is connected by an explicit conversion theorem, including geometric Frobenius/inverse roots. Do not assert this GL_n polynomial for a general reductive group without choosing a representation of its L-group. Verify n=1 and n=2 against class field theory and the classical modular-form polynomial.

### IHG.4. Interpolation through finite quotients

Construct compatible determinants over finite coefficient quotients from a dense family of classical Hecke systems where the coefficients admit the necessary uniform congruence bounds. Prove uniqueness from Frobenius density using Chebotarev and continuity, then existence by polynomial-law identities on the completed group algebra. Retain the finite ramification set and all continuity hypotheses. Prove change-of-level, change-of-coefficients and passage to inverse limits. Density of characteristic-zero points alone does not establish integrality over a nonreduced ring.

### IHG.5. Nilpotent descent and specialization

Provide theorem schemas which take an actual geometric Hecke comparison with a quantified nilpotent error ideal and produce the determinant in the appropriate quotient. Prove functoriality, nilpotence bounds under products/extensions and specialization to residual semisimple representations. The geometric comparison itself is built by TorsionCohomologyInfrastructure, not assumed to hold for all arithmetic spaces. For congruence applications identify the precise local conditions of extension classes and compare lattice choices; AutomorphicCongruences proves the automorphic lower bounds.

### IHG.6. Integral Ribet theory without residual distinctness

Prove the reusable GL₂ extension theorem of Dasgupta–Kakde–Silliman–Wang,
[the 21 September 2023 source](https://math.iisc.ac.in/~maheshkakde/rl.pdf),
Theorems 1.1 and 2.1. This is an additional branch, not a consequence of IHG.1's
residually multiplicity-free generalized matrix algebra. In particular p=2 is
not excluded by a distinct-character assumption.

First take a complete reduced Noetherian local T, an ideal I, a compact G and a
continuous rank-two representation over the total quotient ring K of T. Assume
its characteristic polynomials lie in T[X], reduce to the product of two
T-valued character polynomials modulo I, and that every field-factor projection
of the representation is irreducible. Construct a finite T-module M and a
continuous class in H¹(G,M(chi/psi)) whose every representative cocycle generates
M, and prove Fitt₀_T(M) is contained in I. Residual equality of chi and psi is
allowed. ArithmeticGaloisDuality owns the continuous cochain/class API.

Then construct the full local-condition version for a Noetherian inclusion
T ⊂ Ttilde, T local, with both rings complete for the maximal ideal of T,
a nontrivial ideal Itilde, I=Itilde∩T, and K=Frac(Ttilde) a product of local
rings with principal maximal ideals. Require irreducibility on reduced field
factors and the source's character-polynomial congruence. For a finite collection
of local subgroups, choose triangularizations with diagonal characters eta_v,
xi_v and a partition Sigma disjoint-union P. On Sigma impose xi_v congruent to
psi modulo Itilde; on the specified inertia subgroups for P impose xi_v
congruent to chi. Prove the theorem in its residually indistinguishable case,
and compare the distinguishable case with the separate classical construction.

Construct N and the cocycle, zero on a chosen subgroup in nonempty Sigma and on
the specified inertia groups, with explicit coboundary vectors y_v on the
remaining Sigma subgroups. Prove N is generated by the cocycle image together
with those vectors. For each chosen sigma_v in a P subgroup prove, **in Ttilde**,
the containment of the extended ideal

    (product over v in P of (xi_v(sigma_v) − chi(sigma_v))) · Fitt₀_T(N) ⊆ Itilde.

Do not drop the local factors, replace the Fitting ideal by an annihilator, or
claim the cocycle alone generates N in the local-condition theorem. Construct
the proof's formal matrix ring and trace/determinant invariants; prove the
integral matrix-invariant theorem and the rational algebraic-group cohomology
restriction/acyclicity statements used in §§3–4. Here “rational cohomology” is
cohomology of algebraic-group representations over the integral base, not the
cohomology of the discrete group GL₂(Z). Build Koszul/Buchsbaum–Rim complexes,
their grade/regularity hypotheses, exactness and the comparison killing the
obstruction as in §5. Reuse existing homological/Fitting-ideal APIs and export
these general algebraic subresults independently. IntegralIwasawaTheory I.7
verifies the actual Hilbert/Eisenstein and ramification hypotheses; no arithmetic
Brumer–Stark conclusion is part of this abstract supplier.

## Acceptance and sources

Test determinants in residual characteristic ≤n, a nonreduced coefficient ring, and a bounded complex with nonzero ghost endomorphisms. Include the failure of trace reconstruction without its hypotheses. Sources: [Chenevier](https://arxiv.org/abs/0809.0415), determinant and Cayley–Hamilton sections; [Scholze torsion](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), §§4.3,5.1–5.4; [ACC+](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §§2.3–2.4,3. Suggested.lean illustrates only the currently expressible algebra.

## Implementation handoff: Integral determinants and nilpotent errors

**Stages:** IHG.0, IHG.1, IHG.2, IHG.3, IHG.4, IHG.5, IHG.6. These are concrete construction and acceptance obligations; source-proof leaves must still be transcribed before execution tickets are marked ready.

Construct polynomial laws natural under every coefficient algebra extension, their divided-power representation and Cayley–Hamilton ideal. Distinguish an action on a complex, its homotopy class and its cohomology action, and prove the quantified nilpotence of the kernel used for interpolation. The arithmetic Frobenius polynomial is tested with T₀=1 and q^(i(i−1)/2).

**Acceptance and consumer contract.** Use nonreduced rings and residual characteristic at most n as acceptance cases. Residual multiplicity-free generalized matrix algebra structure and absolutely irreducible representation reconstruction have different hypotheses. For IHG.6 expose the invariant-theory and Buchsbaum–Rim construction and its local Fitting factors; a formally named continuous cocycle does not prove its integral generation bound.
