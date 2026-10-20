# Independent package review: FunctionFieldArithmetic

Verdict: **needs_changes**, after the corrections in this submission. The one remaining
mathematical defect is the generalized Picard/Lang-cover comparison at a nonzero modulus
(README §4.6). The package now identifies that gap explicitly. Its arithmetic ray quotients,
finite characters and global arithmetic existence do not depend on treating it as proved.

Reviewer: Codex, session `codex-HkXdRC`, 2026-10-20; issue #10900. The input package was written
by `claude-gOlGsn` for #10767. I did none of that package job. This is a completed fixing
review with one unresolved defect, rather than acceptance of an incomplete construction.

The review follows WORKERS, PACKAGE_REVIEW, PROTOCOL §§5, 13 and 20, UPSTREAM_GUIDE and the
expansion source rules. It changes only this package's README and Suggested file, its review
record, this report and the job's handoff. The packet and `metadata.toml` are unchanged.

## What remains

The accepted plan requires ray classes and generalized Picard torsors, with global existence
realized by Lang ray covers. Ordinary `Pic` and `Jac` do not supply those objects for a
nonzero modulus. The cited AutomorphicLFunctionsAndLocalFactors AL.3 contract treats the
zero-modulus Picard/Lang comparison; SchemeAndStackFoundations SF.3c treats ordinary Picard
schemes and torsors. Neither constructs `J_m` or `Pic_m¹`.

README §4.6 now states `rayPicard_comparison` with its intended domain and compatibility
conditions: a smooth projective geometrically connected curve over a finite field, every
effective modulus, the ray Abel map, comparison of degree-zero ray classes with `J_m(k)` and
degree-one classes with `Pic_m¹(k)`, increasing-modulus maps, and the least-conductor
interpretation of the associated finite covers. What is still missing is a construction/API
for the generalized Picard schemes, Rosenlicht's universal property, and the proof connecting
Lang torsors to the required connected covers and their conductors. Connectedness over the
base field must be separated from geometric connectedness, and cover quotients must carry
the appropriate surjectivity condition.

Conrad's four-page geometric class-field-theory handout, §2 and Theorems 3.1–3.2, states the
relevant classification but does not give that construction and proof. Milne ADT Appendix A
expressly sets aside existence at its opening; its finite norm statements cannot substitute
for the geometric result. ArithmeticGaloisDuality does separately promise arithmetic norm
existence, which is consumed as such. This distinction is the reason for `needs_changes`.

The tests in §4.6 expose the missing generality: for `ℙ¹`, modulus `[0]+[∞]` needs `𝔾_m` and
modulus `2[0]` needs `𝔾_a`, whereas the ordinary Jacobian is trivial. A nontrivial constant
extension has conductor zero and still changes the degree direction. Merely citing the
ordinary Jacobian or deleting the ramified target would fail the accepted plan.

## Shape, pins and ownership

I read the AlgebraicCurves and completed RestrictedProducts upstream roadmaps and their
Suggested files as models. The revised README retains a summary, scope, conventions, exact
supplier contracts, ordered layers, sources, named APIs, discriminating Checks and four
worked examples. It contains no job identifiers or packet scaffolding. Heavy objects remain
README targets; the Suggested file uses native carriers, light definitions and milestone
statements. No data definition has a `sorry` body. Metadata remains `topic = "math.NT"`.

The baseline was checked against Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and the
provided Tau Ceti `f790474` build. I also read the current read-only TauCetiRoadmap checkout
at `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The completed roadmaps and all nine additions
named in PACKAGE_REVIEW were searched by mathematical objects as well as names. Searches
included completions, exact constants, Witt quotients, conductors, Picard moduli, restricted
products, determinants, reduction theory, Satake transforms and Hermitian densities. The
reviewed library coverage for FA.0–FA.7 was read before resolving ownership.

The duplication corrections and consumed boundaries are:

| Existing object or theorem | Resolution |
| --- | --- |
| Finite exact constants | Deleted the duplicate former §0.1 and `finite_exact_constants` Lean target. Cite `TauCeti.IsFunctionField.finiteDimensional_algebraicClosure`, `TauCeti.isIntegrallyClosedIn_algebraicClosure`, `TauCeti.IsFunctionField.algebraicClosure` and `exists_intermediateField_isIntegrallyClosedIn` in the boundaries. Renumbered the remaining Layer 0 sections. |
| One-pole Artin–Schreier genus and different | Consume AlgebraicCurves Layer 10 and current `TauCeti.two_mul_genus_eq_of_exists_reduced_artinSchreier_pole_ratFunc`. The retained §3.3 instead compares localized Witt classes, cyclic subextensions and geometric base change. |
| Place completions and rational-place power series | Consume AlgebraicCurves Layers 5 and 9 and native `Place.Completion`, `completionEmbedding`, `completionIntegersEquivPowerSeries`. Section 4.5 adds the comparison with Schmid–Witt coordinates, units and finite truncation, rather than constructing another completion. |
| General restricted products and topology of affine points | Consume Mathlib/RestrictedProducts and ReductiveGroupsPartII RG2.0. Section 6.1 adds the function-field restricted-product comparison and finite-type flat model independence. |
| Completed curve additive analysis | Consume AL.3's adeles, residue character, diagonal lattice, self-dual measure and Poisson summation. Layer 2 specializes these to divisor lattices, explicit volumes and indicators. |
| Global arithmetic class formation, norm existence and reciprocity | Consume ArithmeticGaloisDuality R02.3.2. State its profinite completion contract precisely; `C_F` itself retains a discrete degree direction. |
| General ramification, Artin factors over fields and semisimple recognition | Consume LocalFieldsRamification and ArithmeticGaloisRepresentations. The new finite-ring factor in §5.7 is explicitly more general than the field-valued factor. |
| Ordinary Picard schemes, curve Weil bound and local Satake | Consume the exact named supplier sections. None is renamed as the missing generalized Picard theorem. |
| Inert Hermitian density formula | Consume GeometryOfNumbersAndQuadraticArithmetic §3.2. Section 7.4 supplies the split case and a uniform statement; the inert theory is not planned twice. |

Supplier names were checked against the actual documents. I removed nonexistent AL.3
"restricted tensor" and ramified reciprocity subcontracts, the imaginary finite-ring trace
formula in InverseGaloisTheory, a nonexistent DWP §1.10 rationality result, and stale
SchemeAndStackFoundations/AutomorphicSpectralTheory numbering. The finite-coefficient
cohomology prerequisites are specifically EtaleCohomologyFoundations F.2.5, F.3 and
F.10.2–F.10.3 at version `651c49797943811c7dd6d8ab4b5771b7ede1ec0d`; these are roadmap
contracts, not claims of library implementation.

One circular attribution required a target here: DWP §3.7 consumes the per-degree finite-cover
Chebotarev input from FunctionFieldArithmetic, rather than supplying it. New §5.10 states
that theorem and derives it from Kosters's rational-place estimate, with the constant-field
congruence and an explicit lower-degree correction. No higher-tier supplier was introduced.

## Corrections made in place

1. Fixed Frobenius to act on an algebraic closure of the residue field. Kept arithmetic
   reciprocity separate from geometric Frobenius in Euler factors, including Yoshida's
   inverse convention and Yu's negative valuation degree.
2. Corrected the infinity ideal for `2∞` to `t⁻²O_∞`, with inverse `t²O_∞`, and corrected a
   reduced infinity basis to `x^{d_i}v_i`. Over a nonexact perfect base the degree formula
   uses `[k̃:k](1-g_exact)`; it does not substitute the native genus over `k` into that term.
3. Restored `computeRiemannRochBasis`, its genuine native basis output, soundness,
   completeness, termination and cost contract. The input includes verified normalized
   charts and the required field algorithms. Multiplication by `f` carries `L(D)` to
   `L(D-div(f))`. Field-operation costs and input/output sizes are separated from bit costs.
4. Separated finite discrete Witt quotients from the inverse-limit `p`-adic module topology
   and the maximal pro-`p` Galois group's Krull topology. The degree of a Witt class is its
   actual order `p^r`, not automatically `p^n`.
5. Replaced a false assertion about positive Laurent coefficients by the positive-coordinate
   Witt subgroup statement. The constant coefficient uses a trace-one choice; constant-only
   towers can be unramified and have smaller degree at low precision.
6. Retained the one-pole example as a comparison target instead of replanning its native
   genus theorem. A ramified-plus-unramified length-one class gives a diagonal degree-`p`
   subextension of a degree-`p²` compositum, not the compositum itself.
7. In relative Lubin–Tate theory, separability is for the Weierstrass polynomial, not the
   power series. Corrected the unramified degree `d`, torsion degree and norm subgroup for
   `ord(x)=d`; equivariance belongs in the strict isomorphism statement.
8. The Schmid–Witt lift ring is the `p`-adic completion of `W(k)((T))`; it permits negative
   Laurent degrees unbounded as precision grows. For `e∈ℤ_p`, the logarithmic derivative is
   defined by finite-precision limits, not a literal Laurent monomial `T^e`.
9. Corrected the upper-unit formula by clamping `ceil(log_p(r/i))` below at zero. The source's
   printed formula fails when the logarithm is negative. Added a ramified-plus-constant
   counterexample and separated inertia from the unramified constant character.
10. Restored finite arithmetic ray quotients, least conductors, degree values and a verified
    finite-group presentation. Quotienting by local units alone leaves an infinite degree
    direction. Added coefficient sections, uniformizer normalization, measure compatibility
    and precision-`N` local-coordinate comparisons.
11. Isolated the generalized Picard/Lang-cover gap described above instead of assigning it
    to a supplier that only states zero-modulus reciprocity.
12. Corrected the Euler-product locator and the constant-field zeta comparison. A rational
    curve has numerator `1`; its zeta series is still not `1`.
13. Finite-coefficient determinants use a perfect compact-support complex and the inverse
    alternating determinant. An alternating product on cohomology needs projective
    cohomology as an extra hypothesis. Power traces alone do not prove the determinant
    identity in torsion coefficients.
14. Restored place enumeration through normalized branches, the independent point-count
    verification needed by `L`-polynomial data, and finite ray computation using effective
    representatives and Riemann–Roch with residue conditions. Soundness without completeness
    would accept a proper quotient and is insufficient.
15. Restored the quantitative degree-sensitive Chebotarev theorem under its correct owner.
    Its compatible-degree coefficient is `|C|/|N|`, with `N` the geometric group, and places
    of proper divisor degree are removed from the rational-point count after base extension.
16. Specified finite-type flat integral models for adelic points and the actual finite
    central quotient. A torus without the degree quotient has infinitely many cusp forms.
17. Replaced a nonabelian "quotient group" average by a weighted finite double-coset sum.
    Stabilizers vary; refinement preserves the integral. A unipotent filtration supplies
    weights in `ℤ[1/p]`.
18. Supplied the global reduction-theory route from Morris I for a general connected
    reductive group, beyond Harder's split Chevalley statement. Local Iwasawa decomposition
    by itself does not give global cusp-support finiteness.
19. Corrected normalized constant terms to `δ_P^{-1/2}CT_P` for the declared right convolution
    and Satake transform. The `GL₂` spherical double coset computes `q+1` on constants and
    detects the wrong square root. Declared compatible measures for transitivity.
20. Distinguished inducing sections from Eisenstein sums: only the section has the simple
    determinant-degree homogeneity. The constant term of a rank-one Eisenstein series has
    two exponents. Unit-valued inducing characters and split nonunitary twists are separate.
21. Restricted rational Fourier-index covariance to rational Levi matrices. General adelic
    covariance is a local Whittaker statement. The zero Fourier coefficient cannot be
    replaced by the nonsingular factorization.
22. Specified split Hermitian cross-duals, integer total lengths versus half-lengths,
    rank-zero and empty generic fibers, and nonzero density denominators. The overlattice
    `(O,O)` of `(O,πO)` contributes exponent `1`, detecting a factor-of-two error.
23. Corrected the Kudla–Rapoport proof locator and the interpolation ranks `n+2j`. Fixed
    FYZ's degree conventions to use the original `𝔽_q` throughout, including constant
    quadratic covers and `deg(ω_{X'})=2deg(ω_X)`.

## Coverage of the accepted plan

The following accounts for all 48 nodes. Entries marked as consumed are kept in scope and
exact contracts, not restated as fresh targets. The two affected nodes explicitly retain the
unresolved geometric part. Node labels are abbreviated by removing the common roadmap prefix.

| Accepted node | Revised location or exact consumed owner |
| --- | --- |
| FA.0/finite-exact-base | Scope; native constant-field declarations; AlgebraicCurves 0, 8, 12. |
| FA.0/degree-conventions | §0.1; valuation/Yu degrees and Frobenius comparison. |
| FA.1/rational-picard-comparison | §0.3; finite-field Brauer obstruction vanishes. |
| FA.1/riemann-roch-basis-certificate | §§1.1–1.3; normalized charts and a native basis. |
| FA.1/certified-riemann-roch-computation | §1.3; algorithm, soundness, completeness, termination and cost. |
| FA.2/projective-adeles | Consumed AL.3 Curve additive analysis. |
| FA.2/projective-ideles | Consumed ArithmeticGaloisDuality R02.3.2. |
| FA.2/idele-divisor-exact-sequence | Consumed AGD and AL.3; exact contracts. |
| FA.2/additive-diagonal-lattice | Consumed AL.3; §2.1 divisor-lattice transport. |
| FA.2/completed-residue-functional | Consumed AL.3 residue functional. |
| FA.2/differential-additive-character | Consumed AL.3 residue character and conductor. |
| FA.2/differential-self-dual-haar | Consumed AL.3; §2.2 explicit divisor-lattice volumes. |
| FA.2/adelic-poisson | Consumed AL.3; §2.3 indicator transforms and consequences. |
| FA.3/ramification-import-contract | Scope: AlgebraicCurves 6–10, LocalFieldsRamification 3. |
| FA.3/artin-schreier-witt-quotient | §3.1 and native-carrier Lean definitions. |
| FA.3/reduced-witt-laurent-data | §3.2; positive subgroup, reduced coefficients and constant class. |
| FA.3/wild-cover-example | Native genus owner in scope; §3.3 comparison; worked example 4. |
| FA.4/equal-characteristic-lubin-tate | §4.1; relative and absolute normalizations. |
| FA.4/local-abelian-existence | §4.2; full equal-characteristic existence. |
| FA.4/schmid-witt-artin-comparison | §§4.3–4.4; coordinates in §4.5. |
| FA.4/function-field-class-formation | Consumed AGD R02.3.2 class formation. |
| FA.4/global-artin-norm-isomorphism | Consumed AGD R02.3.2 finite norm theorem. |
| FA.5/schmidt-degree-one | §0.2; divisor theorem, not existence of a rational point. |
| FA.4/ray-class-and-generalized-picard | §4.5 arithmetic ray groups; §4.6 explicit generalized Picard gap. |
| FA.4/global-abelian-existence | AGD arithmetic existence consumed; geometric Lang ray-cover realization remains §4.6's gap. |
| FA.4/profinite-reciprocity | AGD completion contract, including the constant-field projection. |
| FA.5/curve-zeta-series | §5.1; native effective-divisor series and Euler product. |
| FA.5/riemann-roch-zeta-rationality | §§5.2–5.3; §5.4 scheme/Jacobian comparison. |
| FA.5/artin-inertia-factor | Field factor consumed from AGR §2.5; finite-ring extension §5.7. |
| FA.5/torsion-trace-comparison | §5.7; compact-support perfect complex and determinant identity. |
| FA.5/degree-sensitive-chebotarev | §5.10; repaired circular DWP attribution. |
| FA.5/frobenius-semisimple-determination | Consumed AGR §5.13 and §1.8. |
| FA.6/automorphic-function-space | §§6.1–6.2. |
| FA.6/cuspidal-constant-terms | §6.3; weighted finite sum over a set of double cosets. |
| FA.6/harder-cuspidal-support | §6.4; global reduction and central-degree quotient. |
| FA.6/integral-coefficient-model | §6.5; finite module, base change and Hecke integrality. |
| FA.6/function-field-hecke-satake | §6.6; global action and normalized constant term. |
| FA.6/yu-degree-zero-nonvanishing | §6.7; exact hypotheses of Yu Lemma 5.3.3. |
| FA.6/unitary-unramified-inducing-character | §7.1; connected and split quadratic covers. |
| FA.6/unitary-siegel-eisenstein-series | §7.2; sections, convergence and rationality. |
| FA.6/unitary-residue-fourier-coefficient | §7.3; rational indices and local covariance. |
| FA.6/unitary-whittaker-density-comparison | §§7.4–7.5; split supplement and Whittaker formula. |
| FA.6/fyz-regular-global-coefficient | §7.6; original-base-field degrees. |
| FA.7/certified-place-enumeration | §5.8; finite and infinite normalized branches. |
| FA.7/l-polynomial-certificate | §5.6 with independent §5.8 counts. |
| FA.7/ray-character-conductor-certificate | §§4.5 and 5.9; finite quotient, all characters, least conductor. |
| FA.7/normalized-completion-certificate | Native/AlgebraicCurves completion consumed; §4.5 comparison and truncation. |
| FA.7/explicit-cost-and-examples | §§1.3, 5.8–5.9 and all four worked examples. |

The unchanged packet checker reports 48 nodes, 64 API entries, 63 unit-test entries, 30 planets,
28 baseline entries, five recorded gaps and 27 requests, with zero errors and zero warnings.
Its eight planned stages and zero closed stages are not a claim that this review closes
the packet's original gaps. The review's verdict concerns the revised package.

## Source verification

I first checked the author's flagged items: ADT's scope excludes existence at the start of
Appendix A; Morris II has the spectral decomposition theorem in §5.5, p. 1145, and the relevant
continuation from discrete Levi data in §§6.5–6.6, p. 1164; Li–Zhang's density theorem is the inert
case, so FYZ's split proof is needed; Stacks 03UZ states the finite-coefficient formula but
refers to SGA 4½ for its proof. I read the public Stacks statement, not a copy of the
uncleared SGA volume. No assertion of having verified that proof is made.

The reproducible sample uses `random.Random(20261020).sample` on the original 36 numbered
subsections in document order, with sample size 15. The original numbers are retained here
where the Layer 0 sections were subsequently renumbered. Each row records the source region
actually inspected, rather than treating a matching citation string as verification.

| Original subsection → current | Primary source region inspected and conclusion |
| --- | --- |
| 6.7 | Yu §5.3.1, Lemma 5.3.3 and proof, pp. 36–38; determinant-degree support and the residual-character argument checked. |
| 5.5 | Roquette §4.3.3, pp. 25–28, and the curve base-extension contract; the Euler/constant-field comparison is explicitly a deduction, not a falsely attributed extension theorem. |
| 4.2 | Yoshida §§5–6: Theorem 5.15/Corollary 5.16, p. 427 with proof p. 428; Theorem 6.11, p. 432 and Corollary 6.15, p. 433. Full equal-characteristic scope retained. |
| 7.1 | FYZ §2.1, pp. 8–10, including Remark 2.1's proof; split and connected cover character choices distinguished. |
| 0.4 → 0.3 | Roquette §4.3.3, pp. 25–28, and ADT A.6–A.7, pp. 130–132; compared the finite-field Picard argument with SF.3c's Brauer obstruction. |
| 7.5 | FYZ §§2.4–2.5, pp. 12–14; Kudla–Rapoport Proposition 10.1 and proof, pp. 37–38; corrected proof pages and rank steps. |
| 6.5 | Ciubotaru–Harris Proposition 3.1, p. 8 and Lemma 3.2, p. 9; BHKT §8.1, pp. 34–35; finite integral lattice and Hecke-integrality hypotheses checked. |
| 6.3 | Morris I §§4.1–4.5, pp. 101–102 and §§5.3–5.6, pp. 104–106; BHKT §8.1, p. 34; corrected nonabelian averaging independently. |
| 4.4 | Kosters–Wan Theorem 4.12, Lemma 4.13 and Proposition 4.14, pp. 21–23; corrected the missing nonnegative clamp rather than copying the printed formula. |
| 0.3 → 0.2 | Roquette §4.3.3, pp. 25–28; degree-one divisor argument checked against the Weil bound and nonexact-constant counterexample. |
| 1.1 | Hess §3.2, pp. 3–4; Lemmas 1–2 and Corollaries 3–4, pp. 4–6; fixed the infinity-ideal sign. |
| 0.2 → 0.1 | Yu §§2.2.1 and 2.2.3, pp. 8–9; Yoshida §5.9, p. 425; checked arithmetic/geometric inversion and negative Yu degree. |
| 3.2 | Kosters–Wan §§3.4, 3.6–3.8, pp. 8–12; §4.2, pp. 14–15; positive Witt subgroup and constant-only tower checked. |
| 5.1 | Roquette equation (4), p. 22 and §4.3.3, pp. 25–28; corrected Euler-product page and tested `ℙ¹` coefficients. |
| 2.1 | Parshin §2.1, p. 7 and §2.2, pp. 9–10; compared divisor signs with native `L(D)` and indicator annihilators. |

Beyond that sample I inspected Hess Theorem 7 and its proof, pp. 6–8, Corollary 11, p. 8,
and §6/Algorithm 13/Remark 14, pp. 9–11; Yoshida Definition 5.3 and Proposition 5.4, p. 423,
Proposition 5.10, p. 425, and Appendix I §7, p. 434; AV §3.2, equations (3.1)–(3.2), p. 27;
Conrad's adelic Propositions/Theorem 2.1, 2.3 and 3.6, pp. 2, 3 and 6; Harder Theorem 1.2.1,
Lemma 1.2.2 and Corollary 1.2.3, pp. 255–256; FYZ §§2.1–2.6, pp. 8–15; Li–Zhang §3.5,
Theorem 3.5.1 and proof, pp. 17–18; and Kosters's complete five-page Chebotarev note.

The Chebotarev deduction in §5.10 is this review's argument. Kosters Theorem 1.1, Corollary
1.2, p. 2 and Lemmas 1.3–1.4, pp. 3–5 supply the weighted rational-place bound; I checked the
proof's rational-place restriction rather than the corollary's misleading all-place subscript.
Summing the per-element bound over the compatible class and subtracting lower-degree places
produces the stated, deliberately nonoptimal bound.

All source results and proof routes in the edited files are in my own words. There are no
verbatim source passages or section-by-section source summaries. The following ledger pins
the public PDF bytes inspected on 2026-10-20; only the regions just identified were read,
except where a complete short note is expressly stated.

| Public PDF | SHA-256 |
| --- | --- |
| [adt](https://www.jmilne.org/math/Books/ADTnot.pdf) | `2c6195ec76a974f3f336c77cb71cc3845b018aad2d43136716b3477a3bc5fb31` |
| [av](https://arxiv.org/pdf/2303.13436v1) | `3e2736beea70ba3467ad30a24b518d82cf589d9ddd4a06f6b0684c7bfd7d6306` |
| [bhkt](https://arxiv.org/pdf/1609.03491v2) | `ec54cf92ce04146c73b48945be2765f675359255d46cc94a0aa35a39229743b9` |
| [ch](https://arxiv.org/pdf/2311.15300v1) | `7261083b46cc8ec3fad81215250ff6bef47da05ef6054813572de21db10dc103` |
| [conrad-adelic](https://math.stanford.edu/~conrad/papers/adelictop.pdf) | `fe4a9193aff4ef575665b40971f3da32f850a74d87b3f2d0fa28bba26b9cbabb` |
| [conrad-geom](https://math.stanford.edu/~conrad/249BW09Page/handouts/geomcft.pdf) | `d5a83bd35472904dabd0d8ff02974b221065af2ebbc421d12a45bb3e3da16a85` |
| [fyz](https://arxiv.org/pdf/2103.11514v4) | `c6a65b8c01333cc726ba6b163fd24aba5022db6cf5baf00c353ccb9b9ba182b8` |
| [harder](https://www.ariel.ac.il/wp/yuval-flicker/wp-content/uploads/sites/316/2026/03/HarderChevalleyGpsFunFields1974.pdf) | `a6e654188e504f21a2caa11888160499e7c86fa9b7f0e4bfd92535835d423bfa` |
| [hess](https://sagewiki.lipn.univ-paris13.fr/daysff/curves?action=AttachFile&do=get&target=hess-computing_riemann_roch_spaces_in_algebraic_function_fields_and_related_topics.pdf) | `69d7e3d1f2455dd79081247d20b30ceb1176812411f78ec036ae58528fc0882a` |
| [kosters-cheb](https://arxiv.org/pdf/1404.6345v1) | `6e98f8196ac9731be61947a4dd3d6fce14abd306f4b1a154e49b450db69c35ea` |
| [kr](https://arxiv.org/pdf/0912.3758v2) | `4184d46227f59875b0aba2178af2fac5baee21aa06ef201aed1d782c69c91d41` |
| [kw](https://arxiv.org/pdf/1607.00523v1) | `c306bfb15225da4558574451e2ae22cb307c8f0b698dc5f366e543350f9522ab` |
| [lz](https://arxiv.org/pdf/1908.01701v3) | `7db1843f90c3e79741f8d58d92b6bb42b0a3b7ae001c8f9419f43b08c2119d49` |
| [morris1](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/DAC6AE21425864B27BFA33D98ECA5ACA/S0008414X00026584a.pdf/eisenstein-series-for-reductive-groups-over-global-function-fields-i-the-cusp-form-case.pdf) | `6757178733cee91823e6d8842c5fd7c9a17b99c9a9cf7b8d55bc8f35e5fb2254` |
| [morris2](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6B1D0A42095B073B7072B0D7D584536D/S0008414X00033150a.pdf/div-class-title-eisenstein-series-for-reductive-groups-over-global-function-fields-ii-the-general-case-div.pdf) | `3e38d71954a76856304a034fadba599bfb90deec0bee06afaee99fb92a292a40` |
| [parshin](https://arxiv.org/pdf/1011.3392v1) | `acbb25d15ad3efc8fc70f92cc436c8ed0ea7d8b74487e338af996f403b6270da` |
| [roquette](https://www.mathi.uni-heidelberg.de/~roquette/klkall.pdf) | `1714d2d51e38fbf954544d6e1e40e8d5f9f98fd370d63adad5b8101e5b5887a3` |
| [yoshida](https://www.numdam.org/item/10.5802/afst.1188.pdf) | `37a2b12ba633f505d6753e034812a047f998e30c663976ca87cc742b3d311c74` |
| [yu](https://arxiv.org/pdf/1807.04659v5) | `9383bcdee14777ec647ba2658da3319d7d43864f9481b07c7d9550f1a454de1c` |

Other inspected sources are the [Stacks 03UZ statement](https://stacks.math.columbia.edu/tag/03UZ)
and the versioned [EtaleCohomologyFoundations contract](https://github.com/TauCetiProject/TauCetiRoadmap/blob/651c49797943811c7dd6d8ab4b5771b7ede1ec0d/TauCetiRoadmap/EtaleCohomologyFoundations/README.md).

## Adversarial mathematics pass

The following covers every current numbered subsection, including the new computation and
Chebotarev targets. Each row groups that subsection's definitions, identities, conventions
and API tests. The README contains the individual discriminating Checks; this table records
the computations and the resulting correction or retained restriction. A finite field has
`q>1`; `q=1` is excluded, not silently used as a denominator case. Characteristic two is
allowed in the Witt and equal-characteristic class-field layers, while the stated unitary
density/FYZ branch retains its characteristic-not-two hypothesis.

| Statements checked | Instances and calculation | Outcome |
| --- | --- | --- |
| 0.1 degrees, absolute values, Frobenius | `π_v` has degree `deg(v)`, norm `q^{-deg(v)}` and Yu degree `-deg(v)`; a scalar in `GL_n` multiplies degree by `n`; a principal divisor has degree zero. | Both degree conventions and one reciprocity inversion are explicit. |
| 0.2 Schmidt and degree surjectivity | `𝔽_q(t)` has `∞` of degree one; over `𝔽_q`, every place of `𝔽_{q²}(t)` has even degree; a conic over a nonfinite field may have index two. | Finite exact constants retained; no rational point is claimed. |
| 0.3 Picard comparison | `Pic⁰(ℙ¹)=0`, elliptic `Pic⁰(k)=E(k)`; nonfinite-field Brauer obstruction can prevent descent of a rational Picard point. | Finite-field descent condition retained. |
| 1.1 chart ideals and intersection | For `D=2∞`, infinity ideal `t^{-2}O_∞`; `L(2∞)=⟨1,t,t²⟩`; `L(-∞)=0`; `D=0` gives constants. | Corrected ideal/inverse sign. |
| 1.2 reduced basis and dimensions | Rational `m∞` gives `d_1=m`; elliptic `D=0` gives invariants `(0,-2)`; a degree-two constant extension with exact genus two has native genus three. | Infinity basis and nonexact-base degree formula corrected. |
| 1.3 algorithm and principal transport | Rational and elliptic bases above; `f=t` sends `L(D)` to `L(D-div(t))`; negative-degree output is the empty basis. | Native basis, termination and complete output restored; normalization/factorization costs charged. |
| 2.1 divisor lattices | `A(0)=∏O_v`; changing `D` by `[v]` multiplies local volume by `q_v`; intersection with `F` is `L(D)`. | Positive divisor sign agrees with native `L(D)`. |
| 2.2 self-dual volume | On `ℙ¹`, `dt=-u^{-2}du` at infinity, `μ(O_∞)=q`; with a unit differential `μ(O_v)=1`; zero differential is excluded. | Character conductor, square-root volume and nonzero hypothesis checked. |
| 2.3 Fourier indicators | Annihilator of `A(D)` is `A(div(ω)-D)`; `D=0` and infinity above fix the sign; applying Fourier twice recovers the reflected indicator. | No duplicate Poisson theorem; indicator specialization retained. |
| 3.1 Witt operator and quotient | `℘(1)=0`, `℘([a])=[a^p]-[a]`, length zero quotient trivial; a class of order `p^r` gives degree `p^r`, even at length `n>r`. | Actual order and finite/infinite topologies fixed; no characteristic-two exclusion. |
| 3.2 reduced representatives | Trace-one constant gives unramified degree `p`; zero class gives degree one; constant `p^sβ` is trivial through length `s`; positive-coordinate vectors are removable. | Correct subgroup and constant term, not a formal `TW(k)[[T]]` ideal. |
| 3.3 one-pole comparison | Over `𝔽₃`, `y³-y=t^{-2}` has conductor three, different six and genus one; adding a nonzero constant gives a diagonal cubic subfield of a degree-nine compositum. | Native genus consumed; compositum claim corrected and nonzero geometric class required. |
| 4.1 Lubin–Tate | Height-one absolute case; relative `ord(x)=2` has unramified degree two, total torsion degree `2(Q-1)Q^{m-1}` and norm group `⟨x⟩U^m`; residue characteristic two still allowed. | Weierstrass polynomial, relative degree and equivariance fixed. |
| 4.2 local existence | Unramified extensions, tame prime-to-`p` extensions and wild Artin–Schreier degree `p` extensions; unit norm subgroup gives the prescribed conductor. | Full equal-characteristic result retained; prime-to-`p` existence alone is insufficient. |
| 4.3 Schmid–Witt | Zero pairs to zero; constant class detects valuation; negative powers detect principal units; `Σ p^j[T^{-(pj+1)}]` needs the completed lift ring. | Correct ring, pro-`p` quotient and `p`-adic logarithmic derivative. |
| 4.4 conductors and upper units | Over `𝔽₃`, pole two has conductor three; a constant-only class has inertia zero; `β+p[T^{-m}]` with `m>p`, `p∤m`, at `r=1` has inertia image `pℤ_p`, not `ℤ_p`. | Added `max(0,ceil(log_p(r/i)))`; empty minima and zero coefficients specified. |
| 4.5 finite ray data and local coordinates | `ℙ¹`, modulus zero, quotient by degree `r` gives `ℤ/r`; moduli `[0]+[∞]` and `2[0]` give degree-zero orders `q-1` and `q`; precision two in characteristic two gives `(1+T)²=1`. | Degree quotient and verified isomorphism required; `π_∞=t^{-1}` fixes coordinate direction and measure. |
| 4.6 generalized Picard comparison | Zero modulus recovers `Jac`; the two rational moduli require `𝔾_m` and `𝔾_a`; a constant cover is connected without geometric connectedness. | Explicit unresolved geometric gap; cannot accept ordinary Picard as its supplier. |
| 5.1 zeta and point counts | `A_0=1`, no degree-zero places, `N_1=B_1`; on `ℙ¹`, `N_r=q^r+1` and `A_n=(q^{n+1}-1)/(q-1)`. | Euler/derivative signs correct; `r≥1` for point-count interpretations; `q-1≠0`. |
| 5.2 large-degree counts | Genus zero at `n=0` gives `A_0=1`; elliptic `n>0` gives `A_n=h(q^n-1)/(q-1)`; outside `n>2g-2` correction terms need not vanish. | Integer inequality in Lean matches the exact threshold; exponent subtraction is safe. |
| 5.3 rationality | `ℙ¹` has `L=1`; the elliptic example gives `1+3T+5T²` and `L(1)=9`; reciprocal constant/leading coefficients give `q^g`. | Exact constants and degree `2g` retained; no theorem from Tate's thesis used. |
| 5.4 scheme/Jacobian comparison | Rational curve has trivial Jacobian; elliptic numerator is the Frobenius polynomial in reverse convention; nonexact constants break the geometrically connected dictionary. | Native divisor/scheme comparison has the exactness hypothesis. |
| 5.5 constant extensions | `N_{rm}` under degree-`m` constant extension; elliptic `N_2=27` over `𝔽₂₅`; original-base-field constant extension has denominator `1-T^m`, `1-q^mT^m`. | Distinguishes changing the base field from the same scheme viewed over the old base. |
| 5.6 polynomial data | `g=0` forces `1`; `q=5,g=1,N_1=9` gives `1+3T+5T²`; changing the count to eight is rejected. | Newton sign and reciprocal symmetry tested; the predicate verifies polynomial data, not raw point counts. |
| 5.7 finite coefficients and determinants | Rank-one Frobenius `a` gives `1-aT`; zero module gives `1`; identity on rank `ℓ` in characteristic `ℓ` has all power traces zero but determinant `1-T^ℓ`; complex `ℤ/4 --2--> ℤ/4` has nonprojective cohomology. | Perfect-complex formula retained; projective-cohomology variant separate; traces alone rejected. |
| 5.8 place enumeration | `ℙ¹` degree one has `q+1` places including infinity; elliptic example gives nine; bounded finite irreducibles require all normalized branches; bound zero gives no places. | Soundness, completeness and no repetitions required; cost depends on output size. |
| 5.9 finite ray algorithm | Rational modulus zero with degree quotient one is trivial and with quotient two gives `ℤ/2`; `2[0]` detects wild order `q`; a proper finite quotient must fail completeness. | Effective representative degree window and residue-one Riemann–Roch conditions made explicit. |
| 5.10 Chebotarev | Constant quadratic extension excludes trivial Frobenius at odd degrees; geometric group `N=1` fixes coefficient one; trivial cover at degree two gives `2π(2)=q²-q`, differing from `q²+1` by `q+1`. | Compatible-degree coefficient and lower-degree correction restored; `|N|>0`. |
| 6.1 adelic points | `𝔾_m(𝔸)` is the ideles, not the units with the subspace topology; `𝔸/F` compact, `C_F` noncompact; `GL₁` integral stabilizer has order `q-1`. | Affine point topology consumed; finite-type flat restricted-product comparison retained. |
| 6.2 function modules | Rational `GL₁` without central quotient has degree set `ℤ`; quotient by degree `r>0` has `r` cosets; a ring character value minus one need not be injective. | Correct central quotient; field-only vanishing argument not generalized to arbitrary rings. |
| 6.3 weighted constant terms | Torus has no proper parabolic; nonzero constant on `GL₂` is not cusp; Heisenberg order `p³` example has orbit weights `1/p²` and `1/p`. | Finite set of double cosets with varying stabilizers; `p` invertible and refinement required. |
| 6.4 cusp support | Torus without degree quotient has infinitely many delta functions; with central quotient the support set is finite; `GL₂` constant functions fail cuspidality. | General reductive global reduction supplied; local decomposition alone rejected. |
| 6.5 integral models | Finite support gives an integral lattice; flat scalar extension preserves a kernel; reduction modulo a noninvertible `p` cannot use normalized unipotent averaging. | Coefficient and flatness restrictions retained; Hecke algebraicity uses a finite integral model. |
| 6.6 Satake/constant terms | For `GL₂`, raw Satake is `qX₁+X₂`, normalized is `√q(X₁+X₂)`; normalized constant term has weights `√q,1/√q`; resulting constant eigenvalue is `q+1`, not `2√q`. | Corrected `δ^{-1/2}CT`; right convolution, identity parabolic and transitivity measures fixed. |
| 6.7 degree-zero nonvanishing | Restrict `n=1` to degree zero; for `n>1`, determinant characters are residual and not cuspidal; nonunitary twists may be transferred to the unitary case. | Correct finite-volume quotient and Morris II spectral locators. |
| 7.1 inducing characters | Connected cover gives finite-order characters extending the quadratic character; split unitary choices are `(χ₀,χ₀^{-1})`; nonunitary split twists are treated separately. | Codomain and connected/split generality explicit. |
| 7.2 sections and Eisenstein series | Rank one has two constant-term exponents, so an Eisenstein sum cannot have the section's one-exponent homogeneity; trivial character recovers the standard spherical section. | Renamed to `section_degree`; rationality uses the unitary-group target, not `GL_n` alone. |
| 7.3 Fourier/Whittaker covariance | Rational `α` has norm one and preserves rational indices; a general adelic `α` need not; `T=0,n=1` has two exponents, while nonsingular coefficients factor locally. | Rational-index formula restricted; general covariance is `whittaker_levi`. |
| 7.4 split density | Rank zero density one; empty generic embedding or `m<n` gives zero; `m(0)=1`, `m(1)=1-T`, `m(2)=(1-T)(1-ηqT)`; `(O,πO)⊂(O,O)` has half-length `1/2`. | Integer total exponent, cross-duals and nonzero denominators fixed; `π^{-1}` Gram form excluded as nonintegral. |
| 7.5 Whittaker-density identity | Spherical self-dual lattice gives normalized polynomial one; rank-one Gram `π^r` distinguishes split `ΣT^i` from inert `Σ(-T)^i`; interpolation visits `n+2j`. | Correct rank parity and proof locator. |
| 7.6 FYZ degree formula | Trivial self-dual data gives constant normalization; `E=αO` has `deg E=-Σv(det α)deg(v)`; constant quadratic cover has relative-exact degree different from original-base degree by two. | Original `𝔽_q` convention fixes the exponents and `deg ω_{X'}=2deg ω_X`. |

The four end-to-end examples now carry native place degrees, Riemann–Roch bases and completed
uniformizers, as well as counts and numerators. For `E/𝔽₅: y²=x³+x+1`, the finite fibers have
sizes `2,0,2,2,2`, plus infinity, giving nine points and numerator `1+3T+5T²`. A scratch
enumeration of `𝔽₂₅=𝔽₅[u]/(u²-2)` found thirteen fibers of size two and twelve of size zero,
plus infinity, giving 27 and numerator `1+T+25T²`. The wild cubic over `𝔽₃` has three
split places at infinity and one totally ramified place at zero, giving four rational
points, genus one and numerator `1+3T²`. These arithmetic computations support the Checks;
they are not claims of formalized algorithms or proofs.

## Ten Lean signatures checked against the README

| Declaration | Signature audit |
| --- | --- |
| `artinSchreierWitt` | Prime `p`, characteristic `p` field; an additive homomorphism for the Witt law, using actual Witt Frobenius minus identity. Matches §3.1, with no finite-field restriction. |
| `aswQuotient` | Quotient by the sum of Frobenius-minus-identity range and truncation kernel; length zero is allowed and is tested as trivial. Matches §3.1. |
| `exists_divisor_degree_eq_one` | `Finite k`, explicit intrinsic `IsFunctionField k F`, exact constants. Conclusion is a divisor of degree one, not an effective divisor or a rational place. Matches §0.2. |
| `divisor_degree_surjective` | Same hypotheses; surjectivity onto `ℤ`, including negative degrees. Matches §0.2. |
| `zeta_logDeriv` | Finite exact constants; `r>0`; range index `i+1` and coefficient `r-1-i` give the stated integer recurrence. Matches §5.1. |
| `pointCount_ratFunc` | Finite field and `r>0`; literal `q^r+1`, including characteristic two. Matches the rational-curve check in §5.1. |
| `effectiveDivisorCount_of_large` | `2*g≤n+1` is precisely `n>2g-2` for natural `n`; it ensures the natural exponent `n+1-g` is correct. Exact constants retained. Matches §5.2. |
| `zeta_rationality` | Degree `2g`, constant/leading coefficients, reciprocal coefficients for `j≤g`, correct linear sign and value at one. Genus zero gives the polynomial one. Matches §5.3. |
| `IsLPolynomialData.unique` | Predicate contains constant term, degree bound, reciprocal symmetry and first `g` Newton identities; integer cancellation by positive `r` proves uniqueness. No primality hypothesis on the abstract `q` is needed for uniqueness. Matches §5.6. |
| `lPolynomial_isLPolynomialData` | Finite exact constants and actual native zeta identity, not the desired predicate as an assumption. The numerator automatically has all §5.6 properties. |

The final file has eight admitted milestone theorem declarations, with no admitted examples.
The proved examples exercise the real Witt definitions, effective-divisor/point-count
definitions and `L`-polynomial predicate; the elliptic wrong-count test is a negative control.
Heavy targets restored in the README are also named in the closing comment. No weakened
Lean substitute was used to force them through nonexistent carriers.

## Validation and limits

- `lean-check` on the package Suggested file: exit 0, eight `declaration uses sorry` warnings
  and no other warnings. The wrapper used the provided pinned shared build; no build/update,
  cache fetch or language server was started. Only closing comments changed after that run.
- `python3 scripts/check_blueprint.py research/blueprint/packets/FunctionFieldArithmetic.json`:
  exit 0, no errors and no warnings; packet unchanged.
- `python3 research/blueprint/intake.py check-files` on the package files, review record,
  report and handoff: zero problems.
- `git diff --check`: clean. Review JSON parses; metadata retains its single-line form.

Elaboration establishes that the signatures type at the pins, not their truth. The adversarial
computations above are the additional mathematics review. The finite-coefficient theorem is
supported by the public Stacks statement and explicit perfect-complex supplier contract;
SGA 4½'s referenced proof was not inspected. The remaining generalized Picard construction
must be supplied before this package is ready for its upstream draft PR. The handoff names
a possible public proof source as an unverified lead, not as resolution of that gap.
