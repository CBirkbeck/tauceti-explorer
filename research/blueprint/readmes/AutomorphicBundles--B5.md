# Automorphic bundles — B5: Hecke action and Fourier expansions

**Scope: `AutomorphicBundles:B5`. Status: partial.**

This specification develops the Fourier–Jacobi strand for nonnegative powers of the determinant Hodge line on the good-prime PEL models in Lan's revised thesis. It does not complete the Hecke strand, arbitrary Levi-valued coefficients, ramified Hilbert models, or the full geometric Lean prototype. Its companion packet contains nine nodes; none is an implementation claim. The handoff records source access, validation and the precise continuation boundary.

## Conventions and objects

Let `R` be the localization of the reflex integers specified by the good-prime PEL setting, or the characteristic-zero field version of that setting. Write `X` for the smooth proper toroidal model associated with compatible admissible smooth fan data, and `omega` for the determinant of the invariant differentials of its universal semi-abelian family. For `k >= 0` and an `R`-module `M`, use B4's actual section module

`AF(k,M) = Gamma(X, omega^k tensor_R M)`.

These are naive parallel weights, not all arithmetic Hilbert weights or arbitrary Levi representations. The determinant line is not the Hodge vector bundle itself. B3 owns canonical/subcanonical extensions; B4 owns their section spaces and analytic comparisons.

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

The existing pinned theorem `PowerSeries.isUnit_iff_constantCoeff` supplies the unit criterion. The suggested file adds three algebraic regression signatures: invertibility of `1-X`, impossibility of sending `X` to one by a ring homomorphism to a nonzero ring, and the same obstruction after composing with a target evaluation. These use actual `PowerSeries` and `RingHom` types. They do not replace the geometric signatures.

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

API: `FourierJacobi.coeff`, `FourierJacobi.constantTerm`, `FourierJacobi.coefficient_naturality`. Tests: `FourierJacobi.global_zero`; `FourierJacobi.global_local`, recovering each local expansion by extension by zero; and `FourierJacobi.no_averaging`. For the last, a trivial cyclic order-`p` action on `F_p` has invariant module `F_p`, whereas the group sum annihilates it and division by `p` is unavailable. This is not a proof of the full non-neat Hecke-descent theorem.

## 3. Refinement and constant terms

### Fan refinement

Node: `B5/fj-refinement`.

A compatible refinement pulls back the same semi-abelian family and Hodge line. Comparison with the actual formal restriction maps preserves every coefficient. B3's section-comparison theorem, including torsion coefficients, and a common refinement give a canonical, cocycle-compatible identification independent of the fan. This is not literal equality of compactifications.

Require identity and composition compatibility and test `M=R/p^2`. A coefficient-free degree-zero pushforward theorem does not establish this coefficient-sensitive comparison.

### Boundary restriction

Node: `B5/constant-term-restriction`.

For the appropriate positive-cone stratum, positivity places every nonzero degree in the global dual cone in its character-graded ideal. Reduction modulo that ideal leaves degree zero. Then use full cusp-stabilizer invariance and the actual quotient of the finite lower-dimensional cover to descend the resulting section. The quotient and its invariance condition cannot be suppressed.

On a Tate chart this is restriction at `q=0`. At higher-dimensional boundaries the constant term may itself vary on a lower-dimensional moduli object. Its value at one deeper cusp is not a test that the entire boundary section vanishes.

## 4. Expansion principle and coefficient recognition

### Joint injectivity

Node: `B5/fj-injectivity`.

Use the source's finite collection of nonempty strata meeting every irreducible component of the toroidal model. Establish joint injectivity for the actual coefficient module `M`, not just field coefficients.

Coefficient vanishing first gives a zero completed section using the separated chart theorem. For finitely generated modules over the indicated Dedekind base, separate a projective summand and primary torsion summands. A projective summand can be embedded as a direct summand of a finite free module; it is not assumed free.

The free and `R/p^n` cases require formal faithfulness along the detecting strata. Keep the component/associated-point conditions for the nonreduced coefficient reductions. In particular, do not silently strengthen total-model component detection to fibrewise detection and call the original theorem proved; establish the necessary geometric implication for the actual model.

Pass to arbitrary `M` using filtered finite generation and the correct qcqs section/colimit theorem. Coefficient maps induced by inclusions must be injective. There is no need to commute an infinite coefficient product with a filtered colimit, and that interchange is not assumed.

These formal-faithfulness leaves remain open. The requested suppliers are F0, early C5 and SF.0. Tests retain the disjoint union of two proper connected curves, where a cusp on one component misses sections on the other; the smooth connected field case; and a separate `R/p^2` case.

### Recognition of a coefficient submodule

Node: `B5/coefficient-recognition`.

For `M1 <= M`, membership of each selected expansion in the image of the actual `M1` coefficient-family module must imply membership of the global section in the image of `AF(k,M1)`.

Apply the natural maps to `M1 -> M -> M/M1`. Establish left exactness using flatness of the geometric coefficient sheaves before taking sections, then left exactness of products and invariants where needed. Global sections alone do not make tensoring exact. The image in `AF(k,M/M1)` has zero expansion, so apply joint injectivity **for the quotient module**. Exactness at `AF(k,M)` then yields the desired image membership. The suggested linear diagram chase covers only this final algebraic step.

Test `M1=M`, `M1=0`, and `M=R[1/p]` with `M1=R`. The last quotient is torsion, which rules out a proof that only establishes torsion-free injectivity. No unconditional global-section base-change isomorphism is asserted.

## 5. Cuspidality

Node: `B5/cuspidal-boundary-criterion`.

For a neat smooth toroidal model with reduced relative normal-crossings boundary `D`, use B3's subcanonical coefficient `omega^k(-D)`. Prove exactness of the boundary sequence with the chosen module `M`; its global-section kernel identifies the image of subcanonical sections. Then use all required boundary charts and constant-term restrictions to detect vanishing on `D`.

Checking geometric points is not sufficient over nonreduced coefficients. Nor can one scalar constant at one maximal cusp replace all the required boundary restrictions. The rank-one test is divisibility by `q`; the higher-dimensional test allows a nonzero boundary form whose deeper scalar constant vanishes. Koecher extension does not force cuspidality.

## Ownership and remaining scope

C0 supplies the shared fan and character algebra; C1 supplies labels, stabilizers and quotients; C4 supplies degeneration data and families; early C5 supplies the toroidal model and its chart maps. C3 supplies refinements, B3/B4 the coefficient sheaves and section comparisons, F0 formal geometry, and SF.0 the relevant quasi-coherent module operations. The generic completion and toric coefficient results belong to those owners, not to a competing B5 formal-geometry library.

**C5 needs an early/late interface split.** B5 consumes the toroidal chart construction, whereas the integral minimal-compactification argument consumes the constant-term theorem. Importing all of C5 before B5 and then using B5 to finish C5 hides a cycle. The requests isolate the early input but do not claim that the atlas has already been restructured.

The Hecke strand remains part of B5's required work: pullback, coefficient identification, unnormalized trace, arithmetic normalization, composition with the abstract Hecke ring and non-neat descent. Preserve the audited analytic declarations `ModularForm.trace`, `CuspForm.trace` and the prime twisted-slash comparison in the packet. Read the exact modular-curve and algebraic-form supplier interfaces before adding their geometric comparison nodes. Do not rebuild existing analytic operators or substitute averages.

General Levi-valued coefficients, ramified Hilbert models, integral coarse-space issues and the analytic q-expansion comparisons remain required work. The packet's partial status and remaining list make these boundaries explicit. Neither the algebraic regression examples nor a structural validator supplies the missing geometry.

## Source issues and verification boundary

The primary text inspected is Kai-Wen Lan's *Arithmetic compactifications of PEL-type Shimura varieties*, **author-hosted thesis revision of 14 March 2021**. Source records give the exact URLs and locators. The publisher edition has not been inspected, and no finding is attributed to it merely because the numbering agrees.

`AutomorphicBundles/E6811` records the reversed new-degree difference and mismatched stabilizer subscripts on printed p. 536, visually checked in the rendered author copy. The relevant zero condition is on the `sigma1` coefficients in `sigma1-dual minus sigma2-dual`; the printed reverse difference is empty. This is a transcription issue, separate from the missing formal-map justification.

`AutomorphicBundles/E6812` records that missing justification. The explicit affine unit obstruction above invalidates the generic direct-completion inference. The proposed common-completion route is identified as a repair requiring its own geometric supplier proofs, not presented as a verbatim argument from the source or as a disproof of the final support theorem.

The author-hosted errata of 14 March 2021, especially items 71–77, were checked. They address chart descriptions, étaleness, the moduli stack and full-stabilizer descent, but no correction of these two p. 536 issues was located there. The search is not a claim of novelty. Neither finding has an independent review verdict. No communication to the author is part of this task.
