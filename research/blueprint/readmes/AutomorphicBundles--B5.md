# Automorphic bundles — B5: Hecke action and Fourier expansions

**Scope: `AutomorphicBundles:B5`. Status: partial.**

This specification develops the Fourier–Jacobi strand for nonnegative powers of the determinant Hodge line on the good-prime PEL models in Lan's revised thesis. It does not complete the Hecke strand, arbitrary Levi-valued coefficients, ramified Hilbert models, or the full geometric Lean prototype. Its companion packet contains fifteen nodes, preserving the nine original targets and separating six coefficient-proof steps. None is a geometric implementation claim. The handoff records source access, validation and the precise continuation boundary.

## Conventions and objects

Let `R` be the localization of the reflex integers specified by the good-prime PEL setting, or the characteristic-zero field version of that setting. Write `X` for the smooth proper toroidal model associated with compatible admissible smooth fan data, and `omega` for the determinant of the invariant differentials of its universal semi-abelian family. For `k >= 0` and an `R`-module `M`, use B4's actual section module

`AF(k,M) = Gamma(X, omega^k tensor_R M)`.

These are naive parallel weights, not all arithmetic Hilbert weights or arbitrary Levi representations. The determinant line is not the Hodge vector bundle itself. B3 owns canonical/subcanonical extensions; B4 owns their section spaces and analytic comparisons. Where the model is a stack, use its actual quasi-coherent sheaves and sections, not those on an unidentified coarse space.

A cusp label supplies its character lattice, positivity cone, finite cover of a lower-dimensional moduli **stack**, abelian torsor `C`, and character-indexed invertible sheaves `Psi(ell)` on `C`. Keep the actual cusp stabilizer, its degree action and its transport of coefficient sheaves. The cover is not identified with its quotient. The boundary Hodge line is

`L = det_Z(character lattice) tensor omega_A`.

The Raynaud extension and determinant of its invariant-differential sequence identify the relevant pullback of `omega` with `L`, compatibly with descent. In the elliptic comparison the invariant relative differential is `du/u` on the multiplicative fibre; `dq/q` is a differential on the base and is not a substitute.

## 1. Coefficients and local expansion

### Coefficient modules

Node: `B5/fj-coefficient-module`.

For a character degree `ell`, define

`C(ell;k,M) = Gamma(C, Psi(ell) tensor L^k tensor_R M)`.

Coefficient families lie in a **product** over the indicated dual cone. The completed character algebra can have additional support/topological constraints, so this product is neither declared equal to that completed algebra nor declared to consist entirely of expansions of global forms.

Use sections on the actual abelian torsor. The expression on the lower-dimensional base using a pushforward requires a separate projection/base-change theorem; arbitrary tensoring does not automatically commute with that pushforward.

API: `FJCoefficient.map` is functorial in `M`; `FJCoefficient.transport` transports the degree and its coefficient sheaf together; `FJCoefficient.family_ext` is degreewise extensionality with the prescribed transports.

Tests: `FJCoefficient.zeroCoefficients` for `M=0`; `FJCoefficient.tateTrivialization` identifies a coefficient with `M` using supplied Tate trivializations; `FJCoefficient.notFiniteSupport` uses the local function `(1-q)^(-1)`, whose nonnegative coefficients are all one. The last is not claimed to extend to a global modular form.

### Local expansion

Node: `B5/local-fj-expansion`.

Construct the map by restricting a global section to the completion along the chosen nonempty stratum, pulling it to the actual Mumford-family chart, applying the boundary Hodge identification, and extracting graded coefficients. Retain the equivariance inherited from the global section. In particular, no arbitrary linear map to a coefficient product is renamed an expansion.

The completion ideal and topology are part of the chart data. The Hodge identification uses actual étale descent with the required finite-type hypotheses. Descent to invariant sections does not divide by a stabilizer order.

API: `FourierJacobi.local_coeff`, `FourierJacobi.local_add`, `FourierJacobi.local_smul`. Tests: `FourierJacobi.local_zero`; `FourierJacobi.local_tate_monomial` for the local section `q^n(du/u)^k`; and `FourierJacobi.local_coefficient_map` for naturality under an `R`-linear map `M -> N`. Again a local monomial is not assumed to be a global form.

## 2. Cone comparison: distinguish ordinary charts from completions

Node: `B5/cone-compatibility`.

Let `sigma1` be a face of the closure of `sigma2`, both in the positive part of one cusp fan. Nonnegativity of the character pairing gives

`sigma2-dual <= sigma1-dual`.

The **ordinary** smaller-cone chart is an open subchart of the larger-cone chart. This correctly gives the inclusion of their character algebras. It does **not**, by itself, give a map between their completions along their respective, different strata.

### A test that rejects the direct-completion shortcut

Let `k` be a nonzero commutative ring, take the quadrant cone, and take its `x`-ray face. The ordinary charts are

`Spec k[x,y]` and `D(y) = Spec k[x,y,y^-1]`.

Completion of the first at its closed stratum gives `k[[x,y]]`. Completion of the second along its face stratum gives `k[y,y^-1][[x]]`, with the `x`-adic topology. There is **no coordinate-preserving ring homomorphism**

`k[[x,y]] -> k[y,y^-1][[x]]`.

Indeed, `1-y` is a unit in the source: its inverse is the formal series with every nonnegative `y` coefficient equal to one. In the target, take the constant coefficient in `x`, then evaluate the Laurent polynomial at `y=1`. This is a ring homomorphism to `k` sending `1-y` to zero. A unit cannot map to zero in a nonzero ring. The contradiction does not even require continuity.

This example refutes the general toric inference, not the global Fourier–Jacobi support theorem. It does not purport to construct a complete PEL datum. The zero-face/positive-ray example is useful only as an **uncompleted** polynomial-to-Laurent-polynomial degree test; it cannot justify a formal morphism, and the zero cone need not be in the positive part required by the argument.

The existing pinned theorem `PowerSeries.isUnit_iff_constantCoeff` supplies the unit criterion. The suggested file retains three algebraic regression signatures: invertibility of `1-X`, impossibility of sending `X` to one by a ring homomorphism to a nonzero ring, and the same obstruction after composing with a target evaluation. These use actual `PowerSeries` and `RingHom` types. They do not replace the geometric signatures.

### The common-completion construction contract

Use the relative fan embedding and its completion along the union `W` of the positive-cone strata. This is the common formal object defined immediately before Lan's (6.2.5.22), rather than one of the individual stratum completions. On an ordinary chart write `J = I(W)` and `I_sigma` for the ideal of a particular stratum.

The required arrows of **formal spaces** are

`individual stratum completion -> common boundary completion -> X`.

On rings the arrows reverse. Their existence must follow from the actual ideal-containment/continuity data: on the appropriate ordinary chart the image of `J` lies in `I_sigma`. Do not insert an arrow from one individual stratum completion to another.

The division of work is precise:

- **C0 and F0:** describe `J` as a character-homogeneous ideal on the shared toric chart. Construct the completed coefficient projections through its finite quotients, their separatedness and compatibility with the continuous maps to the individual stratum completions. Do not replace the inverse limit with an unrestricted product.
- **C4 and early C5:** construct the Mumford family on the common completion and its morphism to the toroidal model. Prove that restriction gives the individual chart maps and the same Hodge identification. This is actual family/gluing work, not a consequence of naming a common object.
- **B5:** pull a global Hodge section to that common object, compare its two pullbacks degree by degree, and descend the calculation with the actual coefficient-sheaf transports.

On the `sigma2` ordinary chart the character algebra only has degrees in `sigma2-dual`. The completed coefficient theorem must preserve that support. Applying its two comparison maps therefore yields agreement on the old degrees and zero coefficients in `sigma1-dual minus sigma2-dual`. Thus the `sigma1` expansion is the extension by zero of the `sigma2` expansion. This statement concerns sections in the **common image**, not every element of either completed ring.

There is a useful positive affine test. The `(xy)`-adic completion of `k[x,y]` maps to both `k[[x,y]]` and `k[y,y^-1][[x]]`: `(xy)` maps into `(x,y)` in the first ring and into `(x)` after localization in the second. Compare images of one element of this common completion. Enlarging the common source to all of `k[[x,y]]` reintroduces the counterexample above.

Finally use the admissible fan's incidence chains among positive cones and its support theorem. Arbitrary cones need not be comparable. Intersecting the dual-cone support conditions gives the dual of the fan support. The common-chart construction and completed-coefficient theorem are explicit **open supplier leaves**; correcting indices is not their proof.

### The full cusp-label map

Node: `B5/global-fj-expansion`.

The compatible expansions give `FJ_Phi` on the full dual support cone, valued in the fixed submodule for the **full** cusp stabilizer. Invariance under a single cone stabilizer is insufficient; the full group's transport of Mumford families supplies the additional comparison.

API: `FourierJacobi.coeff`, `FourierJacobi.constantTerm`, `FourierJacobi.coefficient_naturality`. The last now has its own proof node in section 4, because other nodes use it as a dependency. Tests: `FourierJacobi.global_zero`; `FourierJacobi.global_local`, recovering each local expansion by extension by zero; and `FourierJacobi.no_averaging`. For the last, a trivial cyclic order-`p` action on `F_p` has invariant module `F_p`, whereas the group sum annihilates it and division by `p` is unavailable. This is not a proof of the full non-neat Hecke-descent theorem.

## 3. Refinement and constant terms

### Fan refinement

Node: `B5/fj-refinement`.

A compatible refinement pulls back the same semi-abelian family and Hodge line. Comparison with the actual formal restriction maps preserves every coefficient. B3's section-comparison theorem, including torsion coefficients, and a common refinement give a canonical, cocycle-compatible identification independent of the fan. This is not literal equality of compactifications.

Require identity and composition compatibility and test `M=R/p^2`. A coefficient-free degree-zero pushforward theorem does not establish this coefficient-sensitive comparison. For the finitely generated projective part of B3's coefficient reduction, use a direct summand of a finite free module, not a union of free submodules; see E6813 below. The new injectivity dévissage in section 4 is not a replacement for the toric higher-direct-image calculation required by refinement invariance.

### Boundary restriction

Node: `B5/constant-term-restriction`.

For the appropriate positive-cone stratum, positivity places every nonzero degree in the global dual cone in its character-graded ideal. Reduction modulo that ideal leaves degree zero. Then use full cusp-stabilizer invariance and the actual quotient of the finite lower-dimensional cover to descend the resulting section. The quotient and its invariance condition cannot be suppressed.

On a Tate chart this is restriction at `q=0`. At higher-dimensional boundaries the constant term may itself vary on a lower-dimensional moduli object. Its value at one deeper cusp is not a test that the entire boundary section vanishes.

## 4. Expansion principle and coefficient recognition

Fix the actual finite collection `I` of cusp labels. In this section abbreviate

`F(M) = AF(k,M)` and `G(M) = product_(i in I) FJE_Phi_i(k,M)`.

Each factor of `G` is itself a full-stabilizer fixed submodule of a product over character degrees. These abbreviations refer to the geometric constructions above; they are not replacement carriers whose fields assume the expansion principle.

### Naturality of coefficient change

Node: `B5/coefficient-naturality`.

For an `R`-linear map `a:M -> N`, prove

`G(a) composed with FJ_I,M = FJ_I,N composed with F(a)`.

Tensor by `a`, restrict to each completion and use functoriality of the actual Hodge identification and homogeneous coefficient projections. Then descend the calculation through the character-line transports and pass to full stabilizer invariants. The group acts `R`-linearly and the maps intertwine its actions. Only functoriality of completion is used here, not an unjustified exactness theorem for arbitrary coefficient modules.

Check identity and composition and transport under an actual coefficient-module isomorphism. For `R -> R/p`, this is a square of natural maps, not the claim that `AF(k,R) tensor R/p` equals `AF(k,R/p)`.

### Left exactness of the section row

Node: `B5/coefficient-sequence-exact`.

From `0 -> N -> M -> Q -> 0`, construct the exact row

`0 -> F(N) -> F(M) -> F(Q)`.

Early C5 supplies flatness of `X` over `R`, and B3 supplies local freeness of the Hodge line over `O_X`. Together these make the coefficient sheaf flat over `R`; local freeness over `O_X` alone does not. On the flat atlas, tensoring preserves the short exact coefficient sequence. SF.1 descends the exact sheaf sequence, and left exactness of global sections gives the displayed row. No vanishing of `H^1`, surjectivity of `F(M) -> F(Q)`, or arbitrary global-section base-change theorem is used.

The flat affine test is `Z --2--> Z -> Z/2`. The failure test is `X=Spec F_p` over `Z`: the invertible sheaf `O_X` sends the injection `Z --p--> Z` to zero after tensoring. This isolates the required base-flatness hypothesis.

### Left exactness of coefficient families

Node: `B5/fj-target-left-exact`.

For the same coefficient sequence, construct the exact row

`0 -> G(N) -> G(M) -> G(Q)`.

C4/early C5 supply `R`-flatness of each abelian torsor and invertibility of each character-Hodge coefficient sheaf. Use SF.0/SF.1 to obtain the left-exact section row in each degree. Products preserve its injection and kernel description: a family in the kernel has a componentwise lift, unique because the first product map is injective.

For invariant families, translate that lift by a stabilizer element. Equivariance gives the same image, so uniqueness makes the lift invariant. This is left exactness of fixed submodules without averaging, and does not require a finite stabilizer or invertible group order. Finally take the product over `I`.

The distinction from right exactness is essential. Let a generator of `C_p` act on `F_p^2` by `(a,b) -> (a+b,b)`. The sequence with the first-coordinate inclusion and second-coordinate quotient is exact, but its map on invariants to the final `F_p` is zero. A claim that invariant sections preserve the final surjection would fail this test.

### Prime-quotient coefficients

Node: `B5/fj-injectivity-cyclic`.

Let `p` be a prime ideal of `R`, including `p=0`, and put `S=R/p`. Assume that the base-changed chosen strata meet every irreducible component of `X_S`, and that the formal-chart coefficient comparisons are compatible with this base change. Under these explicit hypotheses, prove injectivity on `AF(k,S)`.

Use the **sheaf** identification with `Gamma(X_S,omega_S^k)`. This is not an identification with `AF(k,R) tensor_R S`. A zero coefficient family gives a zero completed Hodge section. At a point of a selected stratum, its germ lies in every power of the local stratum ideal. The ideal is proper and the Hodge stalk is finite over a Noetherian local ring, so the Krull intersection theorem gives a zero germ. The section therefore vanishes on an open neighborhood of the selected strata.

The model in this step is reduced: for `p=0`, it is smooth over the regular Dedekind base, and for nonzero `p` it is smooth over a residue field. Because the zero open meets every irreducible component, it is dense in each one. On a trivializing affine chart, the representing function vanishes at all generic points and is zero by reducedness. For a stack, carry the open zero locus and its density through an actual flat atlas and descend the zero section. Do not assume that every arbitrary affine atlas chart itself meets the selected strata.

This does **not** prove the component-detection hypothesis after residue base change. Lan's source statement starts with strata meeting all components of the total toroidal model. Early C5 must prove that its actual strata yield the fiberwise condition needed here, or supply another faithful-restriction argument recovering the same source hypothesis. The final theorem below remains open at that geometric input.

The distinction is not a formality of smoothness: `Spec R[1/p]` meets the component of `Spec R` but misses its `p`-fiber. This elementary warning is neither a PEL boundary example nor a counterexample to Lan's theorem. Retain also the two-disjoint-curves test, with all cusps on only one component.

### Nonsplit coefficient extensions

Node: `B5/fj-injectivity-extension`.

For `0 -> N -> M -> Q -> 0`, injectivity of `FJ_N` and `FJ_Q` implies injectivity of `FJ_M`. Form the two actual `ShortComplex (ModuleCat R)` rows for `F` and `G` and their naturality morphism. Apply the existing pinned theorem

`CategoryTheory.ShortComplex.mono_τ₂_of_exact_of_mono`.

Its exact hypotheses are source-row exactness, monicity of both first row maps, and monicity of the two outer vertical maps. The three preceding coefficient nodes supply the rows and squares. The theorem does **not** require the last map of the section row to be onto, nor a splitting of the coefficient extension.

The element argument explains the interface. A section with zero expansion has zero image in `F(Q)`, so it lifts to `F(N)`. The first map of the `G` row is injective, so that lift has zero expansion. Injectivity for `N` then kills the lift. This generic diagram lemma already exists; the work here is its instantiation with the constructed Fourier–Jacobi maps.

Test the nonsplit sequence `0 -> Z/2 -> Z/4 -> Z/2 -> 0`, as well as `N=0` and `Q=0`. The suggested file includes a `ModuleCat` application of the existing lemma and finite algebra regression signatures, not a completed geometric instantiation.

### Finite coefficients by a prime filtration

Node: `B5/fj-injectivity-finite`.

For a finite module over a Noetherian ring, Stacks 00L0 gives a finite filtration

`0 = M_0 <= M_1 <= ... <= M_r = M`, with `M_j/M_(j-1)` isomorphic to `R/p_j`.

Request this generic associated-prime/finite-module lemma from the R03.3 commutative-algebra owner, with explicit quotient maps and linear isomorphisms. Its current roadmap has complete-local coefficient conventions, so the request must be accepted with this genuinely generic scope before it is promoted as an available interface. Do not import all deformation or patching theory, or build a private Shimura filtration library.

Assuming the prime-quotient input for every `p_j`, use naturality to transport injectivity through each quotient isomorphism. Start with the zero module and apply the extension lemma at every step. This proves finite-coefficient injectivity. Over a Dedekind domain a nonzero prime is maximal; the other factor is `R` itself. No PID, semilocality or freeness assumption on the finite module enters.

The filtration `0 < 2(Z/4) < Z/4` has two `Z/2` factors. Thus the reduction handles nilpotent torsion such as `R/p^n` through exact sequences, without demanding a new completion-faithfulness theorem on every nonreduced thickening. It also covers a finite nonfree projective ideal without calling it free.

### Arbitrary coefficients and the source theorem

Node: `B5/fj-injectivity`.

The target remains the source theorem: the selected nonempty strata meet every irreducible component of the toroidal model, and their joint expansion on `AF(k,M)` is injective for arbitrary `M`. First discharge early C5's residue-component obligation and obtain the finite-coefficient theorem. Until that happens, the source theorem is not declared proved under a silently stronger hypothesis.

Write `M` as the directed union of its finitely generated submodules `N`. Tensoring the fixed Hodge sheaf commutes with this colimit. On the actual qcqs algebraic stack, use Stacks 0GQZ with the finitely presented sheaf `G=O_X` to commute sections with it. Therefore a given section `f` comes from some `f_N`.

If the expansion of `f` vanishes, naturality gives

`G(N -> M)(FJ_N(f_N)) = 0`.

The map `G(N) -> G(M)` is injective by the coefficient-family left-exactness theorem. Hence `FJ_N(f_N)=0`, finite-coefficient injectivity gives `f_N=0`, and consequently `f=0`.

There is no need for `colim_N G(N) = G(M)`. That tempting interchange can fail: if `M` is the direct sum of countably many copies of a field, the sequence of its distinct basis vectors belongs to the countable product of `M`, but to the product of no single finite-dimensional submodule. The proof needs only that the section lifts from finite coefficients and that the coefficient-family inclusion is injective.

In particular, the method applies to `R[1/p]/R` by its finite torsion submodules. A field-only or torsion-free-only expansion theorem would not supply this case.

### Recognition of a coefficient submodule

Node: `B5/coefficient-recognition`.

For `M1 <= M`, membership of every selected expansion in the image of the actual `M1` coefficient-family module must imply membership of the global section in the image of `AF(k,M1)`.

Apply the naturality square to `0 -> M1 -> M -> M/M1 -> 0`. The two left-exactness nodes supply its rows. The image of the section in `AF(k,M/M1)` has zero expansion, so use joint injectivity **for that quotient module**, then exactness at `AF(k,M)`. The linear-map prototype covers only this final algebraic step; it is not a proof that the geometric rows have been constructed.

Test `M1=M`, `M1=0`, and `M=R[1/p]` with `M1=R`. The last quotient is torsion and may be infinitely generated. No unconditional global-section base-change isomorphism or surjectivity of the final section map is asserted.

## 5. Cuspidality

Node: `B5/cuspidal-boundary-criterion`.

For a neat smooth toroidal model with reduced relative normal-crossings boundary `D`, use B3's subcanonical coefficient `omega^k(-D)`. Prove exactness of the boundary sequence with the chosen module `M`; its global-section kernel identifies the image of subcanonical sections. Then use all required boundary charts and constant-term restrictions to detect vanishing on `D`.

Checking geometric points is not sufficient over nonreduced coefficients. Nor can one scalar constant at one maximal cusp replace all the required boundary restrictions. The rank-one test is divisibility by `q`; the higher-dimensional test allows a nonzero boundary form whose deeper scalar constant vanishes. Koecher extension does not force cuspidality. The new left-exactness lemma in section 4 concerns change of `M`; it does not by itself prove exactness of this separate boundary sequence after tensoring.

## Ownership and remaining scope

C0 supplies the shared fan and character algebra; C1 supplies labels, stabilizers and quotients; C4 supplies degeneration data and families; early C5 supplies the toroidal model and chart maps. C3 supplies refinements, B3/B4 the coefficient sheaves and section comparisons, F0 formal geometry, SF.0 quasi-coherent tensor and section operations, and SF.1 the actual flat-atlas and qcqs-stack comparisons, coordinating SF.2 for the generic site input. The new finite prime-filtration request is a narrow generic interface in R03.3's commutative-algebra direction, not an already implemented result under its complete-local conventions.

The generic short-complex monomorphism theorem is reused directly from pinned Mathlib. Generic completion, tensor and prime-filtration results belong to their owners, not to a competing B5 foundational library. Limited quoted searches for prime filtration in the libraries and atlas found no match; this is not an exhaustive absence certificate.

**C5 needs an early/late interface split.** B5 consumes the toroidal chart construction, whereas the integral minimal-compactification argument consumes the constant-term theorem. Importing all of C5 before B5 and then using B5 to finish C5 hides a cycle. The requests isolate the early input but do not claim that the atlas has already been restructured.

The Hecke strand remains required: pullback, coefficient identification, unnormalized trace, arithmetic normalization, composition with the abstract Hecke ring and non-neat descent. Preserve the audited analytic declarations `ModularForm.trace`, `CuspForm.trace` and the prime twisted-slash comparison. The reviewed AUDIT-13 result distinguishes those analytic interfaces from the missing geometric action. Read the exact modular-curve, algebraic-form and correspondence suppliers before adding their geometric comparison nodes. Do not rebuild analytic operators or substitute averages.

General Levi-valued coefficients, ramified Hilbert models, integral coarse-space issues and the analytic q-expansion comparisons remain required work. The fifteen-node packet is still a partial source decomposition; its nine definition/construction tests remain geometric signature obligations. Algebraic regression examples and structural validation do not supply that geometry.

## Source issues and verification boundary

The main primary text inspected is Kai-Wen Lan's *Arithmetic compactifications of PEL-type Shimura varieties*, **author-hosted thesis revision of 14 March 2021**, at https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf. The publisher edition has not been inspected, and no finding is attributed to it merely because the numbering agrees.

`AutomorphicBundles/E6811` preserves the preceding checkpoint's finding of a reversed new-degree difference and mismatched stabilizer subscripts on printed p. 536, checked there in the rendered author copy. The relevant zero condition is on the `sigma1` coefficients in `sigma1-dual minus sigma2-dual`; the printed reverse difference is empty. This transcription issue is separate from the missing formal-map justification.

`AutomorphicBundles/E6812` preserves that separate justification issue. The affine unit obstruction in section 2 invalidates the generic direct-completion inference. The common-completion route is a proposed repair requiring geometric supplier proofs, not a verbatim source proof or a disproof of the final support theorem.

`AutomorphicBundles/E6813` concerns the coefficient reduction in the proof of Lemma 7.1.1.4, printed p. 533 (PDF index 560), visually re-read in this continuation. The passage from flatness to a filtered union of the module's free submodules is not valid over a general Dedekind base. A finitely generated module equal to such a directed union would already equal one member containing its finite generating set, hence would be free. A nonprincipal invertible ideal is finite projective and not free. The source's notation permits an infinite set of retained primes, so semilocality is not a blanket standing hypothesis.

This is a scoped objection to the generic algebra inference, not a constructed counterexample with a chosen PEL reflex field, nor a claim that Lemma 7.1.1.4 or the expansion principle is false. For the finitely generated projective part already reached in that proof, split a finite free surjection and pass the natural comparison to its direct summand (Stacks 00NX). A separately proved freeness condition on a particular base would also repair that case. A filtered colimit of finite free modules with general transition maps is not a filtered union of free submodules. The prime-filtration route above repairs the injectivity reduction only; refinement cohomology still needs its own proof.

The author-hosted errata of 14 March 2021, https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf, were checked. Items 71–77 concern charts, étaleness, stacks and stabilizers. No correction for the two p. 536 issues was located in the preceding check, and searches of the parsed errata for 7.1.1 and free located no correction for E6813. Additional web searches did not locate a relevant primary correction. None of the three findings has an independent review verdict; novelty is unverified. No communication to the author is part of this task.

Additional primary inputs read in this continuation are Stacks [00L0](https://stacks.math.columbia.edu/tag/00L0), including both prime-filtration proofs; [00IP](https://stacks.math.columbia.edu/tag/00IP), including the Artin–Rees/Nakayama proof of local separation; [00NX](https://stacks.math.columbia.edu/tag/00NX), finite projective modules as direct summands; and [0GQZ](https://stacks.math.columbia.edu/tag/0GQZ), the qcqs-stack filtered-colimit comparison, with the site conditions in section [0GQU](https://stacks.math.columbia.edu/tag/0GQU). These are inputs to the proposed application, not evidence that its geometric premises are already formalized.

Lan's coefficient-reduction and exact-row pages (printed pp. 533 and 539) were re-read as rendered pages. The notation and good-prime convention were read as parsed text; the additional notation-page screenshot failed. No byte hash or unperformed rendering check is claimed. Pinned prototype elaboration and the exact CI result are recorded in the handoff rather than inferred from the existence of Lean-shaped statements.
