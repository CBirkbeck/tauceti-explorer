# Independent package review: BorelRegulators

Job: `REV-PKG-BorelRegulators~adv`, issue #11021. Reviewer: Codex, session
`codex-Okfw71`. Date: 2026-10-19. Verdict: **needs_changes**.

This is a completed fixing review, not a checkpoint. The package was written
in #10996; this reviewer did not write it. I read the whole package, its
56-node packet, its reviewed library coverage, the package-review instructions,
the upstream guide, and the source and signature rules. I used ClassFieldTheory
and AlgebraicTopology as the two atlas upstream examples and checked the
current upstream README/signature contracts described below. The packet is
unchanged.

The mathematical conventions and the representative Lean statements are
substantially sound after the fixes below. Three outstanding comparisons/proof
prerequisites prevent an upstream-ready verdict. In particular a source that
quotes a theorem verifies the endpoint, but does not supply the prerequisite
decomposition required by this packet.

## Outstanding work and handoff

1. **Norm-one Tamagawa proof, README §6.2.** Borel 1977, proof of Proposition
   2.4, p.619, explicitly uses Weil's value one and says rationality suffices.
   The argument proving that value, with the relevant measure conventions,
   remains undecomposed. The official IAS record for Weil's 1961 notes is
   [handle 20.500.12111/8024](https://albert.ias.edu/20.500.12111/8024).
   Its indexed Theorem 3.3.1 is consistent with the cited endpoint; attempted
   PDF downloads returned HTTP 403 and the browser PDF did not expose readable
   proof text. I have not verified that proof. Resume by reading its
   division-algebra zeta and quotient-measure argument, identifying each needed
   theorem and its supplier, and matching the discriminant-normalised
   AdelicAlgebraicGroups measure. Compactness and positivity cannot replace
   rationality. This gap is on the proof path to §§6.3 and 7.1.
2. **Bloch's pairing, restored in README §7.3.** Packet node
   `R.6/bloch-borel-interface` was absent from the package. The generic formula
   `adelicPeriodPairing_changeMeasure` does not identify an independently
   specified pairing. Read Lectures 1–4 of Bloch's *Higher regulators,
   algebraic K-theory, and zeta functions of elliptic curves*, CRM Monograph
   Series 11, and give numbered locators for its primitive pairing and local
   forms, the equality with §6.6, and a table of all local conversion factors.
   The book is absent from the permitted library index; no readable permitted
   full source was obtained. Borel's side is verified, not Bloch's. The
   restored subsection records the missing definition instead of inventing it.
   It follows §7.2 so there is no new dependency cycle.
3. **Evaluated weight-two coefficient, README §8.5.** The universal
   real-proportionality statement is supported. The calculation of λ_BW in the
   adopted cross-ratio, Suslin and Tate-coordinate conventions remains open,
   as it was in the packet. Transport Goncharov's coefficients all the way to
   the normalised trace representative and division by 2πi; record the sign
   and powers of π as an evaluated coefficient. A nonzero unspecified scalar
   and the Pauli calculation do not finish this calculation. The name
   `borelRegulator_blochWigner_exact` is retained as an explicitly unresolved
   target, alongside the weaker sourced theorem.

No source files or source passages have been placed in the repository. A
successor needs the locators above, not a scratch download. The other packet
gaps have explicit local targets or supplier contracts: augmented building
duality, compact symmetric-pair duals, complete-manifold analysis, suspension
and Bott normalisation, and infinitesimal Chern–Weil/van Est. Missing pinned
carriers remain README targets, as the package rules require; this is not a
claim that their formalisation exists.

## Fixes applied

- Imported Mathlib's existing low-degree Lie cochains and differentials in the
  supplier section. The all-degree construction now explicitly extends
  `d₁₂` and `d₂₃`, with compatibility targets, rather than silently starting a
  second low-degree theory.
- Made the weighted cusp bound well-defined. For ρ+λ strictly positive it is
  the extended-natural supremum of admissible degrees, giving a maximum when
  bounded and infinity when all degrees work. Degree zero is admissible under
  that hypothesis. Outside that hypothesis only the positivity predicate is
  asserted. Added A₁ boundary and unbounded examples.
- Replaced the proposed restriction of an arbitrary almost-everywhere
  measurable cochain class by Goncharov's actual boundary/interior cocycles
  and prism homotopy, restricted before taking cohomology. Added the
  countable-orbit negative control and repeated-point check.
- Fixed the form-Laplacian sign against the supplied scalar operator: the
  Hodge Laplacian is minus Casimir in Borel's frame and minus `div grad` on
  functions, with the Euclidean x² value −2 as a witness.
- Kept generality consistent for the commuting-matrix trace vanishing result:
  arbitrary finite matrix size, j≥2 and pairwise commutation. Added README API
  names for the real-place, empty-target and order-zero boundary statements
  already needed by the examples.
- Removed library-only arithmetic examples from Suggested.lean; their
  mathematical computations remain in the README. Each of its four retained
  definitions now has exactly two proved examples. Former admitted boundary
  examples are named theorem targets; the Tate-coordinate identity is a named
  proved theorem. No admitted `example` remains. The trace tests use the
  stated commutator-reduction milestone, whose proof remains admitted; their
  elaboration is not an independent proof of that milestone.
- Restored the Bloch pairing comparison and preserved all three outstanding
  gaps visibly in the scope and relevant subsections. Real proportionality
  is not presented as an exact numerical coefficient calculation.

## Sources checked

I sampled 15 of the original `Use` citation paragraphs without replacement
using Python's random generator with seed 11021. The table records every
sample. I opened the cited public PDFs and read the indicated statements;
equations obscured by text extraction were checked on the page where needed.
All sample locators resolve; the Tamagawa citation has the limitation stated
above.

| README | Source locator read | Result |
|---|---|---|
| 4.4 | Burgos Definition 9.24, pp.86–87; Remark 4.25, p.32 | Renormalised suspended class and Bott convention match. |
| 6.4 | Borel 1977 §§1.5–1.6, pp.616–617; 1980 erratum, p.373 | Signed algebraic discriminant and positive Haar discriminant must be distinguished. |
| 3.1 | Borel 1974 §§10.2, 10.6, 11.5, pp.263, 265–266, 268 | Classical real, complex and quaternionic compact-dual factors match. |
| 4.1 | Burgos Proposition 9.22 and Corollary 9.23, pp.84–85 | Parity and conjugation target match. |
| 6.2 | Borel 1977 proof of Proposition 2.4, p.619 | Endpoint quoted correctly; Weil proof gap remains. |
| 4.5 | Burgos §9.7, Propositions 9.25–9.26, pp.87–88 | Factorial, sign, real projection and factor two match. |
| 3.9 | Borel 1974 §12.1, p.270 | Stable elementary/SL/GL comparison is the relevant input. |
| 4.3 | Burgos Proposition 9.22 and §9.2 | Dimension is r₁+r₂ in odd weight and r₂ in even weight. |
| 4.7 | Burgos Definitions 9.19, 9.24 and Proposition 9.21, pp.84–86 | Original and renormalised regulators are distinguished. |
| 3.7 | Borel 1974 Theorem 7.5, p.259; §9.5(3), p.262; §11.5, p.268 | Injection/surjection ranges and specialisation match. |
| 5.2 | Borel 1977 §1.4, p.616 | Negative-integer order agrees with parity. |
| 3.6 | Borel 1974 §0.1, p.237; §§9.1–9.5, pp.261–262 | Strict integer part is essential. |
| 5.4 | Borel 1977 §6.4(4), p.633 | Supports rational proportionality, not an integral identity. |
| 1.4 | Quillen/Bass §1 Theorem 2, p.180, proof pp.186–188; Putman–Studenmund §1, pp.3,5 | Division-ring building statement and reduced-homology convention match. |
| 3.12 | Borel 1974 Proposition 12.2, p.271 | Higher rank formula has the stated lower-degree exclusions. |

Additional checks cover the flagged source issues and inherited gaps:

| Source or gap | Pages/statements read and disposition |
|---|---|
| Borel's erratum | Entire p.373, including the displayed embedding determinant and all three specified removals of powers of i. The Q(i) witness agrees. |
| Weibel IV typo | Theorems 1.17–1.18, pp.11–12. Both sides of the central-simple comparison must be rationalised; the package does so. |
| Weibel VI field finiteness | Classical Data 8.1, p.47, contains the field/ring finiteness problem. The package uses finite generation for the arithmetic ring, and only rational comparison for the field. |
| Complete-manifold analysis | Borel 1974 §§1–3, pp.238–246, and §7.4, pp.258–259: complete integrability, square-integrable exact harmonic forms and the Casimir argument are distinct inputs. |
| Matsushima's constant | Matsushima, pp.10–14, and Kaneyuki–Nagano Theorem 4.1, p.249. The normalised trace-free isotropy quadratic form and its factor one-half agree with §3.4. Borel §3.2(5), p.242, fixes Hodge Laplacian as minus Casimir; the scalar `div grad` convention is explicitly negated. |
| Finite compact-dual rings | Borel 1953 Propositions 31.3–31.4, pp.203–205. Low-rank Euler and exterior factors agree; finite rings are not replaced by stable rings. |
| Suspension and infinitesimal comparison | Burgos Proposition 4.24 and Remark 4.25, pp.31–32; Theorems 8.12 and 8.15, pp.71–73; §§9.7 and 10.4, pp.87–88,95–97. The independently constructed Deligne character precedes factor two. |
| Integral Bloch convention | Weibel VI Definition 5.1, Theorem 5.2 and Corollary 5.3, pp.23–24. The target is the antisymmetric tensor quotient, not the exterior square. |
| Weight-two cocycle comparison | Goncharov equation (11), p.7; Lemma 5.2, pp.38–39; Corollary 5.5, p.41; equations (61),(64), Theorem 5.7 and proof, pp.43–47; Corollary 5.10 and Theorem 5.11, p.49. Supports the actual-cochain comparison and nonzero real proportionality. Coordinate conversion remains open. |
| Weil and Bloch | Endpoint confirmed in Borel, but missing proofs/definitions were not inferred from search results. See the handoff. |

## Duplication, suppliers and ordering

Baseline: Mathlib `082e2d3`, Tau Ceti `f790474`. Current-library comparison:
Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; current-roadmap comparison:
`0d144d044dacebca17b654695b6f1ad58f159b27`.

I searched by objects and operations as well as declaration names: proper
division subspaces, augmented building homology, arithmetic stabilisers,
relative Lie differentials, invariant forms, compact duals, complete Stokes,
Casimir, plus/Hurewicz, Chern suspension, embedding conjugation, lattice
covolume, continued zeta, reduced norm, local gauge measures, period cycles,
Deligne cones and Bloch boundaries. The current search covered all roadmap
README/signature files and Completed, and the current library source; relevant
matches were read as contracts. In particular:

| Supplier | Ownership check and action |
|---|---|
| Nine newer roadmaps | Checked AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry. Only the first three and OrthogonalSpinGroups have relevant mathematical matches. |
| DifferentialGeometry 5,6,8,12 | Forms, compact/corner Stokes, de Rham integration and Riemannian volume are already supplied and remain deferrals. Complete noncompact L¹-Stokes and the Matsushima/Casimir argument are additional targets here. |
| AlgebraicVectorBundles | Supplies algebraic Chern classes, explicitly leaves the topological comparison to a successor. It does not supply the topological suspended class here. |
| IntegralLattices and Mathlib | Generic full lattices and covolumes remain supplied. Only the arithmetic regulator image and its specified coordinate lattice are new. |
| OrthogonalSpinGroups | Its orthogonal adelic carriers do not export generic strong approximation, Tamagawa measures or the norm-one division-algebra Tamagawa computation. No removal follows from its references to successors. |
| Completed | Checked ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts. Unit regulators concern K₁, not the higher-weight target. Restricted products do not supply Tamagawa measures or quotient volumes. |
| Mathlib Lie cochains | Existing low-degree differentials are now explicit suppliers and compatibility constraints. This is the duplication correction made in this review. |
| Tau Ceti order complex | Used directly, including its induced maps. The spherical division-subspace specialisation is distinct from ReductiveGroupsPartII's affine valued building. |
| Continuous cohomology | Mathlib pullback is reused. The degree-zero/one/two discrete comparison is supplied by pinned Tau Ceti; only the all-degree extension is new. |
| Current Dedekind zeta | Read `exists_differentiableOn_eq_dedekindZeta_sub` and `ne_zero_of_eqOn_dedekindZeta`: their half-plane continuation and line nonvanishing do not supply negative special values or the full functional equation. |
| AdelicAlgebraicGroups | Current §§2.4–2.5,3.4,4.2–4.5 already own finite SL gauge volumes, restriction-of-scalars measures, SL₁(D), compactness, strong approximation, neat covers and index scaling. These remain deferrals; the package adds the specific Tamagawa value and primitive periods. |
| Chebotarev and ClassFieldTheory | Read current auxiliary-prime/cyclotomic-degree, cyclic fixed-field and density contracts (Chebotarev 7,8,10), and local/global Brauer invariants (ClassFieldTheory 5,10). A prime congruence alone would not give cyclotomic disjointness. |

No further current target was found to remove. The package already excluded
generic local SL point-count/volume and norm-one-group construction targets;
this review did not recreate them. No target was moved into a higher-tier
roadmap. References to later ArithmeticKTheory, Polylogarithms and K3BlochGroups
are consumer descriptions; the minimal constructions they would otherwise
supply are local targets here. The functional equation uses its named
LFunctions/ArithmeticGaloisRepresentations §2.7 owner; no Tate's-thesis theorem
is stated. The order is analytic conventions and compact-fibre comparison,
then inner-form periods, then the zeta determinant, then additional regulator
comparisons. Restored §7.3 follows that order.

## Adversarial mathematics pass

Every subsection's definitions, theorem statements and API identities were
checked together with its conventions. The following table records the
instances used, including negative controls. A retained claim is a roadmap
target, not a completed formal proof. Definitions have at least three prose
checks in their subsections; the explicitly incomplete Bloch-side definition
is the exception reported above, not an accepted definition with invented
tests.

| Statements and conventions | Instances and outcome; correction if needed |
|---|---|
| Standing right-module and rank conventions; 1.1 order/arithmetic APIs | D=F and O=O_F recover SL_n, not GL_n; n=1 projective lattices remain allowed; Q-rank is n−1 independently of e. Opposite scalars match right subspaces. Nonmaximal orders use commensurability. |
| 1.2 building, flags, maps | n=1 has no vertices; n=2 vertices are lines and a repeated vertex is not an edge; rank-three strict line/plane flags give edges. Maps preserve strict inclusion and compose. |
| 1.3 Steinberg module, action, augmentation | Empty building gives Z in degree −1; a two-line augmentation kernel has generator [L]−[L′]; swapping lines negates it. Ordinary unaugmented H₀ would fail. |
| 1.4 Solomon–Tits | n=1 is S^(−1); n=2 is a discrete set; contractibility of the whole complex would contradict reduced H₀. Division-ring hypothesis is used. |
| 1.5 arithmetic duality/finiteness | GL₂ over a field with real places tests the orientation character; finite-index neat descent preserves finite generation. Replacing arithmetic lattice stabilisers by all rational points is excluded. |
| 2.1 discrete comparison and restriction | Identity, composite and degree-zero constants agree with existing cochains. The trivial group has higher cohomology zero. Low degrees agree with the supplied isomorphism. |
| 2.2 invariant arithmetic comparison, Lie and quotient refinements | Trivial group and degree zero give constants. A PGL₂ arithmetic subgroup missing components must not impose full K-invariance; connected and finite-component descent are separate. Existing low-degree differentials are now explicit compatibility targets. |
| 2.3 block naturality | Identity block and a composite of two blocks give the same pullback; degree-zero constants stay one. Compatible compact subgroups are required. |
| 2.4 stable Hopf operations | Empty block is the unit; block exchange tests graded signs. For odd division degree the determinant −1 exchange needs the extra −1 coordinate; for even degree both reduced norms are already one. No SL/GL homology equality is assumed to define the product. |
| 3.1 compact-dual construction and classical factors | SL₂(R)/SO₂ has compact dual S²; complex SL₂ has compact dual SU₂; quaternionic compact factor starts in its correct size. Connected versus full compact-group invariants are distinct. |
| 3.2 finite/stable compact-dual cohomology | SU₂ gives degree-three exterior generator; SU₂/SO₂ gives degree-two Euler class with square zero; SU₄/SO₄ also has the Euler factor. Stable rings cannot substitute for these finite cases. |
| 3.3 degreewise stability | Rank-one and the first missing generator expose the stable-range restriction; restrictions compose, and an Euler class outside the stable range is not asserted to persist. |
| 3.4 Matsushima/Garland constants and analytic prerequisites | q=0 never divides by q; an abelian compact isotropy factor has ratio one. For split SL₂ the trace-free diag(1,−1) test gives zero lower eigenvalue, so no spurious degree-one positivity. The analytic Laplacian sign is fixed against DifferentialGeometry. |
| 3.5 logarithmic forms, positivity and weighted bound | Empty wedge is degree zero; unweighted split A₁ gives bound zero. λ=−ρ fails degree zero; λ=α makes all degrees admissible in A₁. Replaced the undefined maximum of an empty/unbounded set by the stated admissibility convention and extended-natural bound. Cuspidal right-quotient coordinates fix the δ direction. |
| 3.6 strict stable-range bounds | Strict integer part of 1 is zero. Rank 4q needs strict inequality; n=9 versus n=10 at q=2 separates the boundary for SL_n. Anisotropic root data give infinity, not zero. |
| 3.7 arithmetic stable comparison | q=0 gives constants; injectivity at c(G) does not imply surjectivity beyond m(G). The displayed strict sufficient bound excludes its equality case. |
| 3.8 stable arithmetic exterior algebra | Totally real fields have no degree-three primitive; a complex place contributes one. Two odd generators anticommute and have square zero over R; stability is degreewise. |
| 3.9 plus construction, elementary group, SL/GL and localisation | K₀(field)=Z and K₁(field)=F× rule out a reduced-norm-one replacement. E is the perfect subgroup killed; the SL/E quotient is torsion. Integral localisation is not claimed to be an isomorphism; both higher groups are rationalised. |
| 3.10 Cartan–Serre/Hurewicz and indecomposables | Degree zero is excluded; product classes are decomposable rather than new primitives. The connected plus H-space, finite-type and rational hypotheses are not omitted. |
| 3.11 ranks for division orders | Degree e and dimension e² are distinguished; matrix Morita invariance leaves rank unchanged. Nonmaximal arithmetic orders have the same rational higher K-theory, not necessarily identical integral K-groups. |
| 3.12 number-field rank theorem and finiteness | Q: K₃ rational rank zero, K₅ rank one; imaginary quadratic: each higher odd rank one. K₁ is excluded. The tame-symbol quotient of K₂(Q) detects why torsion does not imply finite and why the integral lattice must come from O_F. |
| 4.1 archimedean target | One fixed real embedding contributes zero at j=2 and one at j=3; a conjugate pair has entries (a,−a) at j=2 and (a,a) at j=3; empty set gives zero. The general submodule definition does not need an involution, but embedding applications do. |
| 4.2 coordinate equivalence/reference lattice | A complex pair's integral generator is (1,−1), covolume one in the selected coordinate, not sqrt(2). Conjugating the representative changes the even-weight sign. Empty coordinates give determinant one. |
| 4.3 target dimension | Q at j=2 gives zero, Q at j=3 gives one, imaginary quadratic gives one for either parity. Restriction to j≥2 matches the Lean theorem. |
| 4.4 universal class, suspension and Bott orientation | j=2 fixes the sign; the (j−1)! Hurewicz/Bott factor cancels the Chern-character denominator in the specified convention. Relative-to-absolute comparison is not equality of cochains. |
| 4.5 trace, projection and normalisation APIs | Pauli triple gives Φ₃=−2i; repeated arguments give zero; commuting inputs vanish for j≥2, while j=1 is excluded from that theorem. π₁ kills 1 and fixes i; π₂ does the reverse. Borel/Beilinson coordinates are −2/π and −1/π. Factorials, 2 and π are nonzero. Generalised the commuting-matrix signature to all finite sizes. |
| 4.6 embedding pullback/trace | Identity maps and composites agree; a finite extension gives trace-pullback equal to [E:F]. All embeddings, including both members of a complex pair, are counted before choosing coordinates. |
| 4.7 arithmetic regulator | Zero class and torsion map to zero; conjugation changes the even-weight sign. O_F and F regulators agree under the specified rational comparison, not by an unsupported integral isomorphism. |
| 4.8 extension and transfer | Q→Q(i), j=3 gives pullback 1 and trace 2; j=2 gives rectangular maps with zero source. Transfer requires the finite-projective ring extension, not merely a field embedding without its integral module data. |
| 4.9 Adams operations and products | a=1 is identity; a=2 separates unequal weights because 2^w−2^j is nonzero. a=0 is excluded. K₀ multiplication can be nonzero; a product involving a positive even-degree class vanishes rationally. |
| 4.10 real regulator isomorphism | Zero target Q,j=2 gives the zero-dimensional isomorphism; imaginary quadratic,j=2 gives rank one. Rank equality alone is not used to prove regulator nonvanishing. |
| 4.11 integral regulator lattice | Finite generation of K(O_F), torsion quotient and real isomorphism imply discrete/full image. The dense image of Z²→R with irrational slope shows why rank/image assertions alone do not suffice. No finite generation of K(F) is assumed. |
| 4.12 determinant line and matrix | Empty matrix determinant one; changing a Z-basis has determinant ±1; conjugating one complex representative changes one row sign. Nonsquare extension matrices do not receive a determinant. |
| 4.13 covolume conversion | Rank zero gives one; rank-one sign change preserves covolume; scaling a d-dimensional regulator by 2 gives 2^d. The extra real factor at j≡3 mod4 is retained. |
| 5.1 completed zeta conventions | Complex-place gamma factor includes 2; an alternative factor πΓ_C requires π^(−r₂). The functional equation is supplied, not reproved. Library totalised gamma values at poles are not inverted as analytic residues. |
| 5.2 exact order at 1−j | Q,j=2 has order zero; Q,j=3 has order one; imaginary quadratic,j=2 has order one. Positivity at j>1 prevents accidental cancellation. |
| 5.3 normalised leading coefficient | z² at zero has coefficient one, not two; z³ evaluated at order two gives zero; order zero is evaluation for any function. Exact-order nonvanishing needs the residual factor nonzero. Added the general order-zero API name. |
| 5.4 functional-equation leading term | Q,j=2 gives the rational value 1/12 in absolute value; imaginary quadratic introduces its signed-to-positive discriminant conversion only through absolute values. Neither torsion cardinalities nor an integral identity follows. |
| 5.5 compact fibre comparison | N=3 and N=5 test odd-rank compact-fibre splitting and nonzero restrictions. Full Γ\G cohomology is distinguished from symmetric-space cohomology. Neatness and component descent precede integration. |
| 6.1 division algebra and Brauer-index interfaces | Zero Brauer class has division degree one; quaternion invariants 1/2 at 3 and 7 sum to zero; a nonzero real invariant would violate archimedean splitting. Two inert places are chosen after a cyclic field, avoiding an unjustified prescribed-local extension theorem. |
| 6.2 norm-one Tamagawa target | Scaling one local measure destroys value one without compensation. Compact finite positive volume need not be rational. Endpoint verified; proof-source gap marked explicitly. |
| 6.3 archimedean volume | e=2 leaves only ζ_F(2); index-two covers double volume; split M_e(F) would lose anisotropic compactness. Strong approximation uses a noncompact infinite factor, and no period theorem is used circularly. |
| 6.4 restriction-of-scalars form APIs | Q gives δ=1; Q(i), basis (1,i), embeddings (id,conj), gives δ=−2i, δ²=−4 and q=1 factor i/2. Embedding permutation signs cancel; basis orientation changes the rational line only by sign. Positive discriminant 1/2 is not the algebraic factor. |
| 6.5 compact cycles and primitive pullback | e=2 regular representation has dimension four and primitive multiplier two; index-two cover doubles integral; orientation reversal negates it. Full-group quotient is essential for the top-dimensional cycle. |
| 6.6 adelic pairing and conversion identities | Zero form integrates to zero but has no density c_η. Negating form negates signed integral; doubling form doubles integral and halves c_η; doubling one finite measure doubles its product factor. The converted volume is invariant under form rescaling. |
| 7.1 rational primitive period line | Large odd N satisfies the full comparison degree, not only individual primitive degrees. Empty exterior product is one; regular-representation factors are nonzero. The induction isolates ζ_F(j) after the earlier product, using the unresolved §6.2 input explicitly. |
| 7.2 zeta determinant | Q,j=2: covolume 1 and absolute leading term 1/12 have rational ratio 12. Rank-one conjugation preserves absolute determinant. No Lichtenbaum integral formula is asserted. |
| 7.3 Bloch comparison | Form doubling, orientation reversal and local rescaling are necessary controls. They do not specify Bloch's missing pairing or compute its conversion factors; explicit source/statement gap restored. |
| 8.1 relative-to-absolute injection | Quotient q(M,M′)=M^(-1)M′ and section (1,u) fix the direction. A primitive pulls back as 1⊗x−x⊗1. The conjugated diagonal must be transported before comparison. |
| 8.2 Deligne character and infinitesimal representative | Cone shift −1 and differential (dr,df,r−f−dω) give square zero. Spec C at j>0 gives H¹=C/R(j). The Chern character is defined independently of factor two, avoiding circular normalisation. |
| 8.3 universal factor two | Weight-two trace test distinguishes 2πΦ from πΦ; injectivity transfers the absolute comparison to the relative class. It is a theorem for every j≥2, not an assumed weight-two scalar. |
| 8.4 arithmetic factor two | Rank two covolume multiplies by four, rank zero by one; naturality at each embedding transfers the universal comparison. |
| 8.5 Bloch group, Suslin, cocycles and scalar | r(∞,0,1,z)=z fixes cross-ratio; inverse swaps sign of D. [0],[1] and x=y relations are excluded. In Q(t), valuations give boundary of [t] value one, so kernel is proper. Antisymmetric quotient retains possible diagonal 2-torsion. Repeated boundary points give D=0. Actual prism identity supplies restriction; a.e. representatives cannot be evaluated on a countable orbit. Exact coefficient remains a separate gap. |
| 8.6 small-field and ζ₆ tests | Q even weight has covolume one; imaginary quadratic weight two has a conjugation-odd coordinate. 1−ζ₆=ζ₆^(-1) gives boundary −ζ₆⊗ζ₆, killed by two. Thus 2[ζ₆] is integral Bloch, [ζ₆] rational Bloch; no unjustified integral membership is used. |
| 8.7 extension matrices | Q→Q(i), odd weight, tests T P=2; even weight has rectangular zero-source maps. Two composable extensions fix matrix order; representative changes act through diagonal signs. |

## Lean signature comparison and validation

All four retained definitions have real bodies over existing carriers. All
README definitions absent from the Lean are represented in its closing
comment by mathematical topic, including the restored pairing and exact
coefficient target. No missing higher K-theory, relative Lie cohomology,
Tamagawa or Deligne carrier was forced into an artificial encoding.

| Signature spot-check | Agreement with README |
|---|---|
| `archimedeanTarget` | All finite embedding applications specialise its real-function submodule and exponent j−1; general c is permitted only for the underlying definition. |
| `archimedeanTarget_fixed_even` | Includes j≥2, even j and a conjugation-fixed point. |
| `archimedeanTarget_finrank` | Arbitrary number field, all embeddings, j≥2, the correct odd/even dimensions. |
| `tateProjection` | Natural q, complex input, conjugation sign and division by two. |
| `traceCocycle` | Arbitrary finite square-matrix index; full signed permutation sum with the displayed factorial ratio. |
| `traceCocycle_three` | Exactly −Tr(X[Y,Z])/2, no missing cyclic factor three. |
| `traceCocycle_block` | Arbitrary two finite index types, block diagonal matrices, j≥2. |
| `traceCocycle_scalar` | Pairwise commuting matrices in any finite size, j≥2; no longer only 1-by-1 matrices. |
| `normalizedLeadingCoefficient_factor` and `_ne_zero` | Analytic germs, eventual factorisation, residual value; nonzero conclusion additionally assumes that value nonzero. |
| `exists_archimedeanSplitDivision` | Arbitrary number field, e≥2, finite central division algebra of dimension e², splitting at every infinite completion. |

Validation completed:

- `lean-check` on the package Suggested.lean: exit 0; only admitted-theorem
  warnings. No admitted examples, sorry-bodied data definitions or other
  warnings. Imports are `Mathlib` and the actually used Tau Ceti order-complex
  module. The eight examples are proved; admitted theorem dependencies remain
  roadmap targets, not a claim of formal correctness.
- `python3 scripts/check_blueprint.py research/blueprint/packets/BorelRegulators.json`:
  zero errors and zero warnings; the unchanged packet reports its eight
  existing gaps, not eight newly closed gaps.
- `python3 research/blueprint/intake.py check-files` on the four changed
  deliverables: zero problems.
- `git diff --check`: clean. Metadata is unchanged. No path outside the
  issue's deliverables is changed; this report includes the persistent handoff.

The fixes and reproducible checks complete this review. The three explicit
items in the handoff are the remaining work before an upstream draft can be
recommended.
