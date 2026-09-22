# Bakker–Klingler–Tsimerman: tame arithmetic quotients and Hodge loci

Partial source extraction by Codex, session `codex-c83e7a`, 22 September 2026. Refs #1422.

The corrected paper constructs semialgebraic structures on arithmetic quotients, proves definability of period maps, and deduces that exceptional Hodge loci are countable unions of closed algebraic subvarieties. The extraction has **118 items: 10 library imports, 12 existing plans and 96 missing items**, each missing item routed once. All 44 definitions and constructions have three proposed API contracts, a concrete consumer and three proposed tests: 132 contracts and 132 tests. The dependency graph has 222 edges. These are planning contracts, not newly formalized declarations.

The checkpoint remains partial because the original deep analytic inputs and several proof interfaces are not fully decomposed. Those gaps are listed below; the JSON carries full statements, proof outlines, dependencies, ownership, source locations and the design briefs.

## Sources actually read

I read the entire [author paper](https://benjamin-bakker.github.io/DefArith.pdf), all 23 pages including §§1–5, Appendix A and references, together with the entire four-page [official erratum](https://benjamin-bakker.github.io/DefArithErr.pdf). Publication metadata agrees with JAMS 33 (2020), 917–939, DOI 10.1090/jams/952; the correction is JAMS 36 (2023), DOI 10.1090/jams/1025. A complete comparison with the typeset original remains outstanding: downloading the publisher-copy mirror timed out. This is not represented as full version collation.

The additional reads were:

- The entire [Orr–Schnell correction](https://msp.org/ant/2023/17-6/ant-v17-n6-p04-s.pdf), article pages 1231–1237, including both counterexamples and the corrected containment theorem. The original Orr proof to which it refers is still unread.
- [Bakker–Grimm–Schnell–Tsimerman](https://benjamin-bakker.github.io/finiteness.pdf), author version dated 13 December 2021, pages 13–15, including the full Proposition 28.1 proof.
- [Schmid](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schmid.pdf), printed pages 230, 232–233 and 244–245: the Borel monodromy lemma and its proof, nilpotent-orbit setup and statement, and the one-variable Corollary 5.29 proof. This is a selected-input read, not the complete 109-page article.
- [Kashiwara](https://ems.press/content/serial-article-files/42282), printed pages 863–866 and 870–875: distributivity, simultaneous splitting, norm estimates and the Section 4 proof text. I inspected the image of printed page 870 to check the squared-norm conventions. Several other OCR formulas and earlier inputs remain unverified, so the full norm-estimate proof is not certified.

The JSON records SHA-256, acquisition date and exact read extent for all six PDFs. Original o-minimality, definable Chow, reduction-theory and several Hodge background proofs remain prerequisite leaves. Bibliographic leads and existing roadmap ownership do not count as completed source extraction.

## The official correction is part of the theorem statement

A general quotient is Γ\G/M with a chosen maximal compact subgroup K containing M. Both the definable structure and the generalized Borel–Serre construction retain K. Siegel-set comparisons use the same K. The original unqualified independence and functoriality statements must not be exported.

A corrected morphism has the form [h′] ↦ [φ(h′)g], with φ defined over Q, g a real point, compatible arithmetic levels and stabilizers, φ(K′) contained in gKg⁻¹, and the target Cartan involution preserving the image Lie algebra. Definability is the conclusion. It cannot be inserted into the definition to evade the proof. Conjugation by an arbitrary real g is not automatically a rational group map; right translation transports the compact data.

Orr–Schnell's corrected containment theorem requires stability of the split Siegel torus under the chosen ambient Cartan involution, in addition to compact-subgroup inclusion. Stability of the whole embedded group is sufficient, but the torus condition is weaker. BGST Proposition 28.1 supplies the reverse rational containment only with its explicit forward-containment hypothesis. The original citation to real Siegel domains does not provide that rational statement.

The Hodge target has canonical compatible Cartan data, so the principal period-map and Hodge-locus conclusions survive the correction. Rational Hecke correspondences also fit the corrected contract. The quotient of the intrinsic symmetric space of maximal compact subgroups has a canonical structure; this does not imply independence of K on a fixed general Γ\G/M. The extraction retains the SL₂ compact-choice and Cartan-unstable subgroup counterexamples as tests.

## Existing objects and owners

The pinned commits are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. I read the actual imported declarations and the reviewed HodgeStructures, arithmetic reduction, locally symmetric and ShimuraData audit entries.

Tau Ceti already supplies pure and mixed Hodge structures, module-valued local systems, period-domain points with fixed polarization, the Weil operator, the positive Hodge form, and Deligne's decomposition for a single mixed structure. Mathlib supplies the finite exponential of commuting nilpotents. The existing period-domain point carrier does not supply a complex manifold. A generic local system does not impose finite free integral fibres. The single Deligne decomposition does not supply Kashiwara's simultaneous splittings.

The Hodge metric convention also needs an adapter: the library form is conjugate-linear in the first argument, while the paper uses the conjugate convention. Diagonal norms agree. Centered monodromy weights must be shifted by the pure weight before constructing the limiting mixed Hodge structure. A roughly monomial norm requires a nonzero vector.

All 211 atlas extracts were screened for ownership; selected owner descriptions, available new roadmap/packet files, reserved identifiers and the prior Bakker–Tsimerman and Mok–Pila–Tsimerman routes were checked. The routes are:

| Route | Scope |
| --- | --- |
| AdelicAlgebraicGroups AA.3 | Rational reduction, fixed-K Siegel sets, corrected containment/pullback and reduced-form dictionary |
| LogicAndDefinabilityInNumberTheory LD.0/LD.6 | Selected structures, finite definable atlases, analytic corners, rough functions, curve test and definable analytic Chow |
| ShimuraData D3 | Import the already planned general polarized-variation definition |
| ShimuraVarieties V3 | Borel algebraicity, with this paper as an alternative proof source |
| AlgebraicModuliForArithmeticGeometry R09.7d | Import normal-crossing compactifications |
| ComplexComparisonPartII C0/C4 | Shared analytic image and algebraic/analytic graph interfaces |
| ArithmeticLocallySymmetricSpaces, Part II | General compact-stabilizer Borel–Serre spaces, fixed-K definability and corrected morphisms |
| Upstream HodgeStructures, Part II | General period-domain geometry, degeneration, finite Siegel containment, definable period maps and Hodge loci |

The proposed extension identifiers are `ArithmeticQuotientDefinability` and `DegeneratingHodgeStructures`, in `arithmeticgeometry`. Their briefs import each shared supplier by owner. Upstream LieGroups Layer 9 supplies Cartan/Iwasawa decompositions directly; no source route re-plans an upstream roadmap. The Hodge extension realizes the existing point carrier geometrically and imports the generic VHS definition from D3. The arithmetic extension specializes to ALS.2 when M=K. Generic definable Chow remains LD.6, consistent with the prior MPT route; ordinary projective Chow in ComplexComparison is a different theorem.

## Proof decomposition and scope checks

The period-map chain separates holomorphic untwisting, nilpotent exponential, restricted-analytic coefficients, simultaneous filtrations, the two Hodge norm estimates, the horizontal perturbation, indefinite Gram determinants, rough matrix entries, one-variable reducedness, the curve test and finite permutations of a rational basis. B(u,v)=Q(u,conj v) is generally indefinite, so positive-definite Gram–Schmidt cannot replace the adapted-flag nondegeneracy proof. The adjoint Mumford–Tate group also needs a faithful representation or central-cover adapter before applying reduction on the original vector space.

The following are derived audit qualifications, distinct from the official erratum:

1. **The local disk needs shrinking.** The printed whole-open-polydisk formulation is too broad without an outer-boundary condition. On the unit disk let f(z)=exp(−(1+z)/(1−z)) and τ(z)=2i+εf(z), for ε small enough that the image lies in an injective chart of Γ(3)\H. Since Re((1+z)/(1−z))>0, this defines a polarized weight-one variation with trivial monodromy. The fibre f=e⁻¹ contains zₙ=2πin/(2+2πin), n≠0, an infinite discrete set accumulating at 1. Its period map on the entire punctured disk is not o-minimal-definable. Every smaller buffered disk avoids this obstruction. The global theorem on an algebraic base is unaffected; its compactification proof uses precisely such finite buffered charts.
2. **Reducedness needs finite permutations.** For b=diag(1,T), reversing the basis preserves product-of-diagonals/determinant=1 but makes the ordering inequality T<C fail uniformly. The usable basis-change contract first obtains the unordered bounds and then sorts lengths among finitely many permutations. The source proof already allows such finite orderings; the quantitative adapter remains to be written.
3. **The curve test needs domain control.** The proof of Lemma 4.5 substitutes z₁=mz₂+i while the sector was written with 0<Re z₁<1. A buffered/subdivided horizontal-strip interpolation lemma must justify every substitution. This is a recorded proof-interface gap, not a counterexample to the lemma.
4. **Finite quotient pieces are not automatically charts.** Finite overlap produces a definable relation, but an entire Siegel piece can identify distinct points. A proper quotient and local slice refinement are needed. The surjective-group reduction also needs finite-index arithmetic and stabilizer adapters before claiming a product quotient.
5. **The algebraic target structure must be compared.** For the alternative Borel proof, an R_an,exp comparison with the algebraic Baily–Borel structure is required before applying definable Chow to a graph. The relevant [KUY uniformization theorem](https://arxiv.org/abs/1307.3965) needs an independent-proof audit. The two target structures must not silently be identified in R_alg or R_an.
6. **The Hodge locus is a countable union.** Prove closed analyticity and definability of each proper special image, then algebraicity of each pullback using [definable analytic Chow](https://doi.org/10.1515/CRELLE.2009.002). Exclude the generic identity subdatum. Neither the whole union nor arbitrary countable unions are asserted definable.

Appendix A's boundary is the space of pairs consisting of a point and a local boundary branch. At a quadrant vertex two boundary points map to the same ambient point. The dimension is n−1, as correctly stated later in the appendix, and the boundary map need not be injective.

## Validation and remaining work

The structural audit checks unique identifiers, all dependencies and their acyclicity, complete API/test/consumer coverage, exactly one route for each missing item, valid stage/parent/area identifiers, source and input hashes, and absence of concurrent deliverable changes. Finite diagnostics check nilpotent identities and the noncommuting exclusion, Hodge conjugation conventions, the two boundary branches, the rational torus/Cartan obstruction, the reversed-basis example and finite sorting. Numerical evaluation checks the explicit Möbius fibre formula; the symbolic argument above supplies its mathematical explanation. These diagnostics are not Lean proofs and are distinct from the 132 proposed tests.

`check_paper.py` passed; `intake.py check-files` reported three files and zero problems. The fresh-main ownership/concurrency audit also passed. No Lean file is a deliverable for this paper job, and no Lean compilation is claimed.

The JSON gaps G1–G6 and handoff identify the exact resumption points: published-copy collation; original reduction/quotient proofs; Schmid/Kashiwara and representation adapters; curve-test domain control; quantitative permutation and finite boundary-chart repairs; and independent definable algebraization plus Hodge-image/countability inputs. The extraction must remain partial until those source and interface gaps are closed.
