# Endoscopic transfer: towers, pure transfer and rational Igusa traces

This part covers ET.6a, ET.7a, ET.7b and their joint export ET.7. It plans the
mathematics that identifies classical mixed-characteristic local tower cohomology
with local Langlands factors and compares unitary automorphic and Igusa traces.
The geometric tower isomorphism, the equivariant derived cohomology comparison,
the actual supercuspidal sector theorem, the pure automorphic transfer and the
rational alternating Igusa identity are separate outputs. None can be replaced
by another one without the comparison theorem stated below.

This is a completed target-level planning pass, with every scoped target assigned
a contract, proof route and acceptance check. All four stages are **planned**.
They are not source-decomposed, closed or implemented. In particular the missing
Harris–Taylor and Boyer primary proofs and the independent Dat-to-FS dictionary
remain real gaps. The reader is the definitive mathematical plan; the Suggested
file contains only small statements on carriers already present at the pinned
libraries.

## Conventions and dependencies

Locally E is a finite extension of Q_p, n≥1, ell≠p, Λ=Qbar_ell and D/E has
invariant 1/n. Fix a square root of q=|k_E|. In Dat’s convention arithmetic
Frobenius has |Frob|=q and acts on Λ(1) by q. Geometric Frobenius has |Frob|=q^(−1);
a uniformizer corresponds to geometric Frobenius under local reciprocity.
Cohomology of a left action uses inverse pullback.
Globally F/F+ is CM; in the CSnc trace calculation F=F+F_0 and p splits in F_0.
The global rank 2n in that calculation is distinct from a local tower rank chosen
for another application. Every use fixes its rank rather than conflating them.

Dat's tensor sector is H[ρ]=H⊗_Dρ, where v·d=d^(−1)v. It selects the multiplicity
of ρ∨. Its literal supercuspidal factor is rec(JL(ρ)∨)|·|^((1−n)/2). FS uses
geometric source-torsor actions and perverse normalization, and its required
outputs are a parameter and its dual on the two legs. Their independent action
dictionary is an explicit theorem still to be checked, not a change of symbol.
In particular inverting a Frobenius eigenvalue does not invert an arbitrary
nonabelian Weil representation.

For E=Q_p, in SW20 the basic Newton datum belongs to B(G,μ^(−1)). For the multiplicative
rank-one case b=p^(−1), μ=1. The Newton sign of b is negative, while the bundle
E_b in 0→T⊗O→E_b→i_*Lie G→0 has positive degree. The FS O(−1/n) source bundle
uses the opposite Hecke orientation; its conversion is a separate target.

The pure branch uses only independent ET.3/4 transfer, ET.6 conventions and the
lower complex automorphic spectral decomposition. It has no Igusa concentration
input. The Igusa branch uses the early rational trace object, ET.5 geometric
stabilization and the pure spectral results. It exports virtual coefficients,
not positive multiplicities or integral concentration.

The upstream tier rule requires the raw compact-unitary clauses of AG2.1a and
the early rational Igusa clauses of IG.0/IG.1 to move down here. The rational
Igusa construction needs a proposed ET.5a supplier before ET.5; its present
ET.7b label is retained only pending this ownership and ordering repair. General PEL
representability is still imported from PELModuli; only the specific early objects
are assigned below their consumers. The narrow basic minuscule tower fibre also
moves down here; general shtukas and general EL/PEL integral comparison stay with
HS2 and its integral continuation. HS3 and ES7 consume the classical tower
comparison, so there is no reverse edge from ET.6a to HS3 or ES7.

The confirmed cyclic-base-change finding requires an additional ordering repair:
the cyclic BC/AI targets currently assigned to ET.7a belong in a new ET.4b before
ET.6. This part retains the issue's current scope and proposes that relocation.
It introduces no ET.7a→ET.6 edge. The local p-divisible classification similarly
belongs in an early finite-flat supplier after R07.2, never in relative T2. Since
FiniteFlatGroupsAndIntegralPadicHodgeTheory is now TauCetiRoadmap pull request
#879, whose Dieudonné layer stops before Rapoport–Zink spaces, that supplier is an
addition to the pull request, a Part II, or a target planned here. No ET.6a target
uses HS2, so the atlas edge HS2→ET.6a is proposed for deletion.

## Library boundary and Lean prototype

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. The current read-only upstream documents
were also checked at TauCetiRoadmap 0d144d044dacebca17b654695b6f1ad58f159b27 and
TauCeti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. AdicSpaces and CompactGroups
provide existing geometry and normalized compact averaging. They are not
replanned. The reviewed coverage has no row certifying these four ET stages;
neighboring shtuka layers are unbuilt. A current-library name search found no
classical towers, Igusa, Speh or JL carrier. This is search evidence, not a claim
that every possible foundational declaration was inspected.

Matrix.trace and Matrix.trace_diagonal were read at the Mathlib pin in
Mathlib/LinearAlgebra/Matrix/Trace.lean, lines 35–50. They enter only the
compatibility statement of the finite ledger, not as a surrogate for an
infinite-dimensional trace. The Suggested file defines the finite rational
comparisonTrace ledger, states its short API, including the identification with
the trace of a diagonal matrix, and gives the four tests below. Every other proposed
carrier, API and unit test remains a reader target because its prerequisite
theory is absent at the pins. The newer WORKERS shape rule governs this slim
file; there are no opaque carriers, Prop placeholders or data definitions with
unproved bodies.

## Target index

### ET.6a

- `tower-conventions`: Tower datum and action conventions.
- `lubin-tate-tower`: The formal O_E-module tower.
- `drinfeld-tower`: The special O_D-module tower.
- `period-morphisms`: Period maps and their equivariance.
- `actions-and-weil-descent`: Commuting actions and effective Weil descent.
- `infinite-level-moduli`: The universal-cover moduli at infinite level.
- `perfectoid-limit`: Preperfectoidness and completed tower limits.
- `el-duality`: Infinite-level EL duality.
- `tower-compact-support`: The equivariant compact-support complex.
- `equivariant-cohomology-comparison`: Equivariant tower cohomology comparison.
- `central-quotient-sector`: Central quotient and tensor sectors.
- `basic-modification-functor`: The basic minuscule modification functor.
- `classical-tower-fibre-comparison`: Classical tower versus the basic Hecke fibre.
- `raw-compact-unitary-cohomology`: Raw compact-unitary PEL cohomology.
- `unitary-nearby-cycle-decomposition`: Independent nearby-cycle decomposition.
- `global-extraction`: Automorphic trace comparison and local extraction.
- `supercuspidal-dat-sector`: Actual supercuspidal cohomology in Dat conventions.
- `fs-normalization-contract`: Normalization contract for the two Hecke orientations.
- `rank-two-arithmetic-descent`: Arithmetic descent of the rank-two central quotient.
- `stein-mittag-leffler`: Perfectoid Stein covers and Mittag–Leffler.
- `gross-hopkins-vector-fields`: Gross–Hopkins coordinates and infinitesimal operators.
- `analytic-vectors-under-duality`: Duality and locally analytic vectors.

### ET.7a

- `cyclic-base-change`: Cyclic base change before classical LLC.
- `cyclic-automorphic-induction`: Cyclic automorphic induction.
- `speh-representation`: The global Speh datum.
- `residual-spectrum-classification`: The full GL_m discrete spectrum.
- `twisted-spectral-normalization`: Twisted unitary spectral coefficients.
- `weak-unitary-base-change`: Weak unitary base change and standard pairs.
- `cohomological-base-change`: Pure cohomological unitary transfer.
- `local-unitary-base-change`: Local unitary Langlands quotient compatibility.
- `relevant-packet-multiplicity`: Relevant generic packet multiplicity one.
- `definite-indefinite-switches`: Definite and indefinite packet switches.
- `transferable-level`: Transferable compact levels.
- `oldform-dimensions`: Packet oldform dimension identities.
- `gsp4-solvable-descent-interface`: Automorphic inputs to GSp₄ solvable descent.
- `induced-character-client`: Automorphic induction of a quadratic Hecke character.

### ET.7b

- `rational-igusa-object`: The early rational Igusa trace object.
- `csnc-test-functions`: The CSnc test-function package.
- `newton-reduction`: Normalized Newton reduction to the inner form.
- `red-trace-duality`: Test transfer is dual to Newton reduction.
- `signed-igusa-trace`: The signed source Igusa trace identity.
- `local-factorization`: Finite spectral factorization with virtual coefficients.
- `hecke-character-separation`: Separation of unramified Hecke characters.
- `rational-trace-export`: Rational Igusa export without concentration.

### ET.7

- `finite-coefficient-ledger`: A finite signed coefficient ledger.
- `torus-measure-check`: Torus transfer and measure conversion.
- `unramified-gl2-check`: Unramified GL₂ Satake check.
- `proper-endoscopy-check`: Proper unitary endoscopy and coefficient check.
- `division-inner-form-check`: Division-algebra transfer and sign check.
- `coherent-exports`: Coherent automorphic and Igusa exports.

## ET.6a. Classical towers and actual cohomological realization

### Tower datum and action conventions

Target `tower-conventions` (definition).

Fix a finite extension E/Q_p, residue cardinality q, n≥1, the central division algebra D/E with
   invariant 1/n, and an algebraic closure Λ of Q_ell with ell≠p. Fix q^(1/2) in Λ. Write
   |w|=q^(−v(w)) for v(geometric Frobenius)=1, so Λ(1) has character |w|. Towers carry the Dat left
   GL_n(E)×D× action; cohomology uses inverse pullback to turn this into a left action. Regard the
   Weil group as an abstract acting group, with ell-adic continuity checked on inertia separately. A
   change to right moduli actions is a named conversion, not an identification of formulas.

Hypotheses.

- E has characteristic zero; Λ has characteristic zero; n≥1.

Construction or proof route.

1. Import the local field, division algebra and reciprocity convention from ET.6.
2. Record the chosen frame and quasi-isogeny actions before applying inverse pullback.
3. Extend Tate twists to half-integers using the fixed square root of q; changing that root changes the
   unramified quadratic twist.

Proposed API (reader targets unless expressly prototyped).

- `TowerDatum.qHalf` (data): The specified square root of q and the characters |·|^a on W_E.
- `TowerDatum.leftCohomologyAction` (functoriality): A left moduli action induces a left cohomology action by inverse pullback.
- `TowerDatum.frobeniusConversion` (compatibility): Arithmetic and geometric Frobenius elements are mutual inverses; the corresponding unramified eigenvalues are reciprocal.
- `TowerDatum.ext` (extensionality): Equality requires equality of field, frame, reciprocity, coefficient and square-root choices.

Unit tests.

- `TowerDatum.tateFrob` (computation): Λ(1)(Frob_ar)=q and Λ(1)(Frob_geom)=q^(−1).
- `TowerDatum.rankOne` (degenerate): At n=1 the middle degree and half-Tate exponent are both zero.
- `TowerDatum.rootChange` (compatibility): Replacing q^(1/2) by −q^(1/2) multiplies an odd half-twist by the unramified quadratic character.

Uses.

- Dat, Theorem 4.1.2: The exponent and the contragredient in a sector formula refer to these choices.
- FS, proof of IX.7.4: The unit/counit computation requires the two Weil factors to be dual.

Acceptance checks.

- Arithmetic Frobenius acts on Λ(1) by q; geometric Frobenius acts by q^(−1).
- Changing left/right actions also changes which contragredient an isotypic notation selects.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Source matching.

- [Dat] §2.2.1, p. 12; §3.1.5 with footnote 6, p. 16; Fait 3.3.2, p. 22; §3.5, pp. 24–27: Dat
   normalizes |·| so that arithmetic Frobenius has value q and uniformizers correspond to geometric
   Frobenius; the linear group acts through transposed quasi-isogenies so that the final theorem
   carries no contragredient; on the Lubin–Tate side the linear group first acts on the right and is
   turned into a left action by inversion, and the diagonal centre acts trivially.
- [FS] IX.7.3–IX.7.4, p. 338: The target Hecke normalization includes a shift and a half Tate twist.

### The formal O_E-module tower

Target `lubin-tate-tower` (construction).

Choose a one-dimensional formal O_E-module H of O_E-height n over the algebraic closure of the
   residue field. The deformation functor at level m classifies (G,ρ,α_m), where G deforms H, ρ is
   an O_E-linear quasi-isogeny on the special fibre and α_m is a full Drinfeld level structure on
   G[varpi_E^m]. Its rigid generic fibres form the Lubin–Tate tower M_LT,m over brevé E. At level
   zero each quasi-isogeny-height component is an (n−1)-dimensional open ball. Higher generic-fibre
   levels are finite étale with the specified congruence deck group.

Hypotheses.

- Full Drinfeld level structure is imposed integrally, not an arbitrary basis over a nonreduced base.
- Fix H and a uniformizer varpi_E.

Construction or proof route.

1. Request formal O_E-module deformation representability and Drinfeld full-level divisibility
   conditions from the lower finite-flat owner.
2. Represent each height component and pass to its rigid generic fibre.
3. Use the étaleness of varpi-power torsion in characteristic zero to construct the finite étale level
   maps.
4. Glue the components using quasi-isogenies; do not replace the infinite height union by the
   height-zero component.

Proposed API (reader targets unless expressly prototyped).

- `LubinTate.level` (constructor): Construct the space representing framed deformations with full level m.
- `LubinTate.forgetLevel` (functoriality): For m≥r, forget the extra level structure; compositions agree.
- `LubinTate.height` (projection): The quasi-isogeny height is a locally constant integer function.
- `LubinTate.levelTorsor` (characterisation): Over a fixed lower generic level, full lifts form the expected congruence torsor.
- `LubinTate.ext` (extensionality): An isomorphism respects the formal module, framing quasi-isogeny and every level vector.

Unit tests.

- `LubinTate.heightOne` (degenerate): For n=1 each level-zero component is zero-dimensional; the components still range over Z.
- `LubinTate.deckDegree` (computation): The degree from full level m to level zero is |GL_n(O_E/varpi_E^m)| on the generic fibre.
- `LubinTate.integralLevel` (non-example): On the generic fibre a linearly dependent O_E/varpi_E^m frame is not full. On the connected special fibre zero sections can be full when the Drinfeld Cartier-divisor condition holds; integral fullness cannot be defined by pointwise linear independence.

Uses.

- SW13, §7.2: The universal-cover functor produces its dual Drinfeld moduli.
- Dat, §3.3: Finite levels supply the equivariant compact-support complex.

Acceptance checks.

- The level-zero ball has dimension n−1.
- The GL_n(E) action is on the tower of correspondences; a general element need not preserve an
   individual integral level.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/tower-conventions`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

Source matching.

- [Dat] §3.2, pp. 18–21: The moduli, height components and group actions of the Lubin–Tate tower.
- [SW13] §6.5, Definitions 6.5.1 and 6.5.3; Theorems 6.5.2 and 6.5.4, pp. 66–68: The EL moduli and
   rational infinite-level functor apply to O_E-linear formal groups.

### The special O_D-module tower

Target `drinfeld-tower` (construction).

The Drinfeld formal moduli functor classifies special formal O_D-modules of dimension n and
   O_E-height n², with a framing quasi-isogeny. Here special means the prescribed rank-one
   eigenspace condition for the maximal unramified subfield of D on Lie G. Its generic fibres with
   full O_D level form M_Dr,m. At the bottom level the period domain is Ω_E^(n−1)=P_E^(n−1) minus
   all E-rational hyperplanes, with the height components retained.

Hypotheses.

- Use the maximal order O_D and its uniformizer Π_D; distinguish Π_D-level from varpi_E-level.
- Specialness and the determinant condition are imposed on the formal moduli.

Construction or proof route.

1. Use the lower formal-group deformation machinery with the specialness condition.
2. Represent the framing functor by the formal Drinfeld model, recording the source proof as a supplier
   requirement.
3. Construct level maps by forgetting O_D-torsion frames.
4. Identify the generic period domain and its rational hyperplane complement; this identification is
   not the definition of the moduli functor.

Proposed API (reader targets unless expressly prototyped).

- `Drinfeld.level` (constructor): Represent the special-module deformation functor with O_D-level m.
- `Drinfeld.forgetLevel` (functoriality): The integral and generic level maps compose.
- `Drinfeld.specialLie` (characterisation): Lie eigenspaces for the unramified subfield have the prescribed ranks.
- `Drinfeld.period` (projection): The period map lands in Ω_E^(n−1).
- `Drinfeld.ext` (extensionality): An isomorphism preserves the O_D action, framing and level structure.

Unit tests.

- `Drinfeld.rankTwo` (computation): At n=2 the formal module has dimension 2 and height 4, while the rigid moduli has dimension 1.
- `Drinfeld.rationalHyperplane` (non-example): An E-rational hyperplane point is excluded from Ω_E^(n−1).
- `Drinfeld.rankOne` (degenerate): For n=1 the period domain is a point and D=E.

Uses.

- Dat, Corollary 3.4.2: The Drinfeld complex is compared with the LT complex.
- FS, IX.7.4: The return Hecke correspondence uses the Drinfeld tower.

Acceptance checks.

- For n=2 the period domain is P¹ minus P¹(E).
- GL_n(E) acts through the framing algebra and D× through level changes, exchanging the roles of the
   two groups in LT.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/tower-conventions`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

Source matching.

- [Dat] §3.1, pp. 15–18: Special O_D-modules, period domain and level actions.
- [SW13] §7.3, pp. 71–73: The EL duality specializes to the two classical towers, with a convention
   warning on the linear group.

### Period maps and their equivariance

Target `period-morphisms` (construction).

Construct the Grothendieck–Messing period map from the Dieudonné Lie quotient and the infinite-level
   Hodge–Tate period map from the framed Tate module. On LT the GM target is the flag variety for
   the frame and the HT target is the flag variety for E^n; the group acting trivially on each
   target is specified. On the dual Drinfeld datum these targets exchange. Period maps are maps of
   adic spaces or diamonds on their stated levels, and the GM map is étale on the classical generic
   fibre.

Hypotheses.

- Use the determinant condition, the chosen covariant/contravariant Dieudonné convention and fixed
   frames.
- For general E retain the O_E action rather than silently using the Q_p height as n.

Construction or proof route.

1. Form the Lie quotient of the crystalline deformation and the Tate Hodge–Tate filtration.
2. Check functoriality under quasi-isogeny and level changes.
3. Use the universal-cover description to identify the exchanged quotients under duality.
4. Prove étaleness using Grothendieck–Messing deformation theory; local coordinates then have an
   invertible derivative.

Proposed API (reader targets unless expressly prototyped).

- `TowerPeriod.gm` (projection): Send a deformation to its Dieudonné Lie quotient.
- `TowerPeriod.ht` (projection): Send the infinite Tate frame to its Hodge–Tate filtration.
- `TowerPeriod.baseChange` (functoriality): Both maps commute with extension of the complete coefficient field.
- `TowerPeriod.dual` (compatibility): Duality exchanges the two period morphisms with the specified flag identifications.

Unit tests.

- `TowerPeriod.rankOne` (degenerate): Both targets are points at n=1.
- `TowerPeriod.level` (compatibility): Forgetting finite level leaves GM unchanged; a change of full Tate frame transforms HT by the linear-group action.
- `TowerPeriod.rankTwoEtale` (computation): On an LT one-dimensional GM chart, the derivative of the period coordinate is invertible.

Uses.

- SW13, Proposition 7.2.2: They identify the two flags under EL duality.
- CDN20, Proposition 4.8; Pan, §5.3: Their differentials control infinitesimal operators and analytic
   vectors.

Acceptance checks.

- GM factors through level zero; HT requires the full infinite frame.
- The rational hyperplane complement in the Drinfeld case is tested separately from the LT GM image.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/lubin-tate-tower`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/drinfeld-tower`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

Source matching.

- [SW13] §6.1, pp. 54–56 (Proposition 6.1.3, p. 55); §7.1, Proposition 7.1.1, p. 68; Proposition
   7.2.2, p. 70: The crystalline (Grothendieck–Messing) period map at level zero and its étaleness,
   the infinite-level Hodge–Tate period map with its equivariance (linear group acting,
   self-quasi-isogeny group trivial), and the exchange of the two flag varieties under duality.
- [Pan] §§5.2.2–5.2.4, pp. 55–57 (v1): Rank-two GM étaleness and the Hodge–Tate map.

### Commuting actions and effective Weil descent

Target `actions-and-weil-descent` (theorem).

The finite-level correspondences and the infinite-level towers carry commuting GL_n(E), D× and W_E
   actions compatible with level maps, period maps and base change. A Weil element moves the
   quasi-isogeny height by its valuation contribution. In Dat conventions the height-zero stabilizer
   is {(g,d,w): |det(g)Nrd(d)^(−1)|_E=|w|}; the full-height representation is induced from this
   stabilizer. The diagonal E× in GL_n(E)×D× acts trivially.

Hypotheses.

- Use the datum and action choices above.
- Weil descent includes the height translation, not just an action on coefficients.

Construction or proof route.

1. Define the two algebraic-group actions on frames and framing quasi-isogenies.
2. Construct the Frobenius descent isomorphism from the special-fibre frame and check its cocycle.
3. Compute determinants and reduced norms on heights to obtain the stabilizer equation.
4. Verify the cocycles commute with level changes and induce the announced cohomology actions.

Acceptance checks.

- A uniformizer in only one group factor translates height; the diagonal central element does not.
- The height-zero component alone is not invariant under the full product group.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/lubin-tate-tower`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/drinfeld-tower`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/period-morphisms`.

Source matching.

- [Dat] §3.5, especially (3.5.1), pp. 24–26: The central kernel and height stabilizer.
- [SW13] Proposition 6.5.5, p. 68: Continuity of the EL linear-group actions.

### The universal-cover moduli at infinite level

Target `infinite-level-moduli` (construction).

For an EL datum (B,V,H,μ), define M_∞ on complete Huber pairs over brevé E by triples (G,ρ,α), with
   α an integral full Tate frame on geometric points, equivalently the rational frame after allowing
   quasi-isogenies. In the universal-cover description an element is a B-linear map s:V→H̃_η whose
   quasi-logarithm has a locally free quotient W of the prescribed rank and such that 0→V→H̃_η→W→0
   is exact on every geometric point. The determinant condition fixes the μ-type of W.

Hypotheses.

- Use a basic EL datum for tower duality; the moduli description itself has the hypotheses of SW13
   6.5.4.
- Integral and rational functors are distinguished.

Construction or proof route.

1. Import universal covers and Tate modules from the finite-flat packet.
2. Translate a frame to the B-linear universal-cover map and its Lie quotient.
3. Use local p-divisible classification to reconstruct G from the map and prove full faithfulness.
4. Prove the geometric-point exactness condition is preserved under base change; it cannot be omitted
   in favor of the rank condition alone.

Proposed API (reader targets unless expressly prototyped).

- `TowerInfinity.ofTriple` (constructor): A deformation, quasi-isogeny and full Tate frame give a point.
- `TowerInfinity.toCoverMap` (projection): Project to the B-linear universal-cover map s.
- `TowerInfinity.pointCriterion` (characterisation): Rank, determinant type and the geometric exact sequence characterize the rational points.
- `TowerInfinity.changeLattice` (equivalence): Rational-frame moduli do not depend on the integral lattice.
- `TowerInfinity.baseChange` (functoriality): The triple and universal-cover descriptions commute with Huber-pair base change.

Unit tests.

- `TowerInfinity.missingExactness` (non-example): A map whose quasi-logarithm has the right rank but whose geometric kernel is larger than V fails the moduli criterion.
- `TowerInfinity.levelRecovery` (compatibility): Reduction of the integral frame modulo varpi_E^m gives the full finite level m.
- `TowerInfinity.lattice` (compatibility): Replacing the lattice by varpi_E times it changes integral framing but leaves the rational functor isomorphic.

Uses.

- SW13, Theorem 7.2.3: The pairing formula defines the dual infinite-level point.
- SW20, Theorem 24.2.5: It identifies the tower with a minuscule modification functor.

Acceptance checks.

- The construction is independent of the lattice for the rational-frame functor.
- The integral frame recovers the specified finite congruence levels.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/lubin-tate-tower`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/drinfeld-tower`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/universal-cover`.

Source matching.

- [SW13] Theorem 6.3.4 and the description following it, pp. 59–61; Theorem 6.5.4, pp. 67–68: The
   infinite-level moduli description with exactness and quotient conditions.

### Preperfectoidness and completed tower limits

Target `perfectoid-limit` (theorem).

The infinite-level EL moduli is preperfectoid and is a tilde-limit of the finite generic levels.
   After base change to an algebraically closed complete extension C and the specified strong
   completion, the resulting infinite-level space is perfectoid. The tilde-limit assertion gives the
   topological inverse limit and dense colimit of affinoid rings, not an equality of uncompleted
   rings.

Hypotheses.

- Use the precise completion and Huber-pair topology of SW13.
- Tilde-limit is the imported perfectoid-tower notion.

Construction or proof route.

1. Use the universal-cover embedding into a perfectoid ambient space.
2. Impose the rank and exactness conditions by the local chart analysis of SW13 6.3.
3. Identify finite-level frame quotients and the completed affinoid colimit.
4. Base change and complete before applying the perfectoid conclusion.

Acceptance checks.

- A level-zero open ball is not itself asserted perfectoid.
- A rank-one determinant tower agrees with the height-one cyclotomic model after completion.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/infinite-level-moduli`, `PerfectoidSpaces:P5`.

Source matching.

- [SW13] Theorem 6.3.4, pp. 59–61; Theorems 6.5.4 and 6.4.1, pp. 64–68: The general preperfectoid
   limit and the determinant calculation.

### Infinite-level EL duality

Target `el-duality` (theorem).

For a basic EL datum set B̌=End_B^0(H), take the dual datum described by SW13 §7.2, and identify the
   two linear groups in the exchanged order. There is a G(E)×J(E)-equivariant isomorphism M_∞≅M̌_∞.
   Its universal-cover formula is š(f)(v)=f(s(v)). Under the identified flag varieties the GM
   period of one side is the HT period of the other. For the LT datum its dual is the Drinfeld
   datum. Standard Drinfeld linear-group conventions may require inverse transpose; this
   automorphism is recorded explicitly.

Hypotheses.

- The EL datum is basic, so the full endomorphism algebra has the needed centralizer property.
- The statement is at infinite level; equal numbered finite levels are not asserted isomorphic.

Construction or proof route.

1. Compute the dual EL weights using Hom(V_0,V) and Hom(V_1,V).
2. Apply the pairing formula to the universal-cover map.
3. Use the exactness condition to identify the dual quotient and construct the inverse.
4. Check both period maps and group actions on the universal-cover formula.

Acceptance checks.

- Applying duality twice gives the canonical original datum.
- GM and HT exchange rather than each being individually fixed.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/infinite-level-moduli`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/period-morphisms`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/perfectoid-limit`.

Source matching.

- [SW13] Proposition 7.2.2 and Theorem 7.2.3, pp. 70–71; §7.3, pp. 71–73 (the inverse-transpose remark
   on the linear-group action is in the proof of Theorem 7.3.1, p. 71): The basic EL duality and the
   classical specialization.

### The equivariant compact-support complex

Target `tower-compact-support` (definition).

For T=LT or Dr, define C_T,Λ by the derived smooth level colimit of RΓ_c(M_T,K×brevé E C,Λ).
   Integral coefficients mean first taking the derived inverse limit over Λ/ell^r at a fixed finite
   level and then the smooth level colimit. Trace maps, pullback maps and the action conventions are
   retained in the derived category of smooth GL_n(E)×D× representations with commuting W_E action.
   Compact supports are the finite-level proper-support construction, not ordinary global sections
   of the infinite union.

Hypotheses.

- Use finite levels locally of finite type and the smooth representation category.
- Do not commute the coefficient inverse limit and level colimit without a separate theorem.

Construction or proof route.

1. Import analytic compact-support cohomology and coefficient inverse systems from the lower étale
   owners.
2. Build the finite-level complexes with pullback for level refinement and trace in the opposite
   direction.
3. Take the derived smooth colimit and define the commuting Weil action by descent.
4. Check coefficient reduction and extension of the algebraically closed base field.

Proposed API (reader targets unless expressly prototyped).

- `TowerCohomology.atLevel` (constructor): Construct RΓ_c at one finite level and coefficient exponent.
- `TowerCohomology.refine` (functoriality): Pull back along a finite étale level map.
- `TowerCohomology.trace` (functoriality): Trace in the reverse direction; trace∘pullback is multiplication by the degree.
- `TowerCohomology.coefficientReduction` (compatibility): Derived reduction modulo ell^r agrees with the finite coefficient tower.
- `TowerCohomology.ext` (extensionality): Maps are identified through their compatible finite-level representatives, not just equality of virtual characters.

Unit tests.

- `TowerCohomology.coverDegree` (computation): For a degree d level covering, trace∘pullback is d times the identity.
- `TowerCohomology.rankOneDegree` (degenerate): The n=1 tower has its compact-support cohomology in degree zero.
- `TowerCohomology.nonproper` (non-example): On a nonproper positive-dimensional tower, replacing RΓ_c by RΓ changes the functor and is rejected.

Uses.

- Dat, Corollary 3.4.2 and Theorem 4.1.2: The comparison and representation sectors are statements
   about this complex.
- FS, IX.7.4: The cohomological input must retain Weil actions, not only an Euler characteristic.

Acceptance checks.

- Cohomology agrees with the usual smooth tower H_c^i.
- The trace composed with pullback equals the covering degree.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/actions-and-weil-descent`, `SmoothRepresentationsOfLocalGroups:SR.0`, `DiamondSixOperations:S2`, `AdicCoefficientsAndComparisons:L0`.

Source matching.

- [Dat] §3.3, Faits 3.3.2–3.3.5 and the definition of RΓ_c, pp. 21–24: The equivariant compact-support
   derived complex and coefficient limits.

### Equivariant tower cohomology comparison

Target `equivariant-cohomology-comparison` (theorem).

There is an isomorphism C_LT,Z_ell≅C_Dr,Z_ell in the equivariant derived category, compatible with
   the smooth GL_n(E)×D× structure (hence with the Hecke operators of both level systems), with W_E
   and with coefficient reduction. It induces all degree-wise cohomology comparisons after extending
   to Λ. The proof passes through the equivalence of the appropriate equivariant tower topoi and
   proper-support functors; a bare perfectoid-space isomorphism does not suffice.

Hypotheses.

- Use the same action convention on both complexes.
- The finite-level descent theorem compares cofinal level presentations, not equal m.

Construction or proof route.

1. Use EL duality to identify the common infinite-level presentation.
2. Descend equivariant finite étale objects and compact supports through cofinal finite levels.
3. Construct the equivalence of tower topoi and show it intertwines the derived support functors.
4. Pass through integral coefficient inverse systems and then rationalize; compare inertia continuity
   as well as abstract Weil equivariance.

Acceptance checks.

- The comparison is an isomorphism of smooth GL_n(E)×D× complexes, so it intertwines the Hecke
   operators of both towers; it commutes with coefficient reduction.
- A degree-wise comparison only after forgetting W_E fails this target.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/el-duality`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/tower-compact-support`, `PerfectoidSpaces:P5`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`.

Source matching.

- [Dat] Theorem 3.4.1 and Corollary 3.4.2, p. 24: Dat states the equivalence of the equivariant
   period-space topoi exchanging the two compact-support functors, credits it to Faltings and
   Fargues and refers to Fargues’s work on the isomorphism between the two towers for its proof;
   Corollary 3.4.2 is the resulting integral derived isomorphism over the central quotient group
   with the discrete Weil group. Dat is a consumer of this theorem; the proof route here goes
   through the Scholze–Weinstein duality instead.

### Central quotient and tensor sectors

Target `central-quotient-sector` (definition).

Quotient a tower by the action of varpi_E^Z in its linear group, using Dat §3.5; the remaining
   height classes are indexed by Z/nZ. First define the full-tower sector at central character ω:
   the left GL_n(E) character is ω and the left D× character is ω^(−1), while ρ has central
   character ω. To use the quotient model, arrange ω(varpi_E)=1 by an explicitly recorded unramified
   twist, and retain that twist when returning to the full tower. For an irreducible
   D×-representation ρ in that sector define H_c^i[ρ]=H_c^i⊗_{Λ[D×]}ρ, turning the cohomology left
   D× action into a right action by v·d=d^(−1)v. In this characteristic-zero,
   fixed-central-character quotient D×/varpi_E^Z is compact, so sector extraction is exact and
   agrees with Hom_D(ρ∨,H_c^i).

Hypotheses.

- The left D× character of the relevant cohomology summand is the inverse of the central character of
   ρ; the diagonal centre acts trivially.
- The Λ representation is smooth; exactness uses characteristic zero and compactness modulo the fixed
   centre.

Construction or proof route.

1. Form the discrete central quotient with its cohomology action.
2. Untwist the central character, retaining the induced Weil twist.
3. Apply averaging on the compact quotient to establish exact sector extraction.
4. Identify tensor coinvariants with the multiplicity of ρ∨ by the evaluation pairing.

Proposed API (reader targets unless expressly prototyped).

- `TowerSector.centralQuotient` (constructor): Form the quotient tower and its fixed-character component.
- `TowerSector.tensor` (constructor): Tensor the right D× cohomology module with ρ.
- `TowerSector.homDual` (equivalence): Tensor extraction corresponds to Hom_D(ρ∨,−).
- `TowerSector.exact` (instance): Sector extraction is exact over Λ in the fixed compact-mod-centre setting.
- `TowerSector.unramifiedTwist` (compatibility): Untwisting ω(varpi_E) transports both the smooth and Weil factors.

Unit tests.

- `TowerSector.dualSelector` (computation): For a constituent ρ∨⊗V, extraction by tensoring with ρ gives V.
- `TowerSector.heightClasses` (computation): Quotienting the height translation by varpi_E leaves n height residue classes.
- `TowerSector.integralFailure` (non-example): Exact averaging is not asserted over integral or mod-ell coefficients when the compact quotient has ell-torsion.

Uses.

- Dat, Theorem 4.1.2: This notation fixes the literal supercuspidal formula.
- FS, IX.7.4: The action dictionary must translate this convention before presenting an FS isotypic
   formula.

Acceptance checks.

- The selector is ρ∨ in Hom notation, not ρ.
- Changing the uniformizer is accompanied by the corresponding central-character identification.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/tower-compact-support`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/actions-and-weil-descent`, `SmoothRepresentationsOfLocalGroups:SR.0`.

Source matching.

- [Dat] §3.5 and the notation before Theorem 4.1.2, pp. 24–28: The quotient and tensor coinvariant
   convention.

### The basic minuscule modification functor

Target `basic-modification-functor` (construction).

For the basic isocrystal of a one-dimensional height-n formal O_E-module, define the v-functor of
   modifications of its Fargues–Fontaine vector bundle at a marked untilt with minuscule Lie
   quotient and a Tate lattice/frame. For E=Q_p, the SW20 covariant convention has μ=(1,0,…,0) and
   b∈B(GL_n,μ^(−1)); the Newton slope of b is −1/n, while E_b in the exact sequence has degree +1
   and slope +1/n in the curve convention. The modification is O^n→E_b with the Lie cokernel after
   the stated covariant conversion. For E≠Q_p use the O_E-linear EL datum in Res_{E/Q_p}GL_n, with
   its determinant condition. This is only the tower-specific fibre; general local shtukas remain
   HS2.

Hypotheses.

- Use the finite-flat local classification and distinguish the covariant Newton convention from the
   degree of its curve bundle.
- Include the untilt divisor and full O_E-compatible Tate framing.

Construction or proof route.

1. Import the marked Cartier untilt divisor from FarguesFontaineDiamonds F4.
2. Form the minuscule modification using the p-divisible-group exact sequence; its positive-degree
   bundle is not replaced by its dual.
3. Impose O_E linearity and the EL determinant condition to pass from Q_p to E.
4. Define lattice level quotients and their universal Q_p/O_E local systems.

Proposed API (reader targets unless expressly prototyped).

- `BasicTowerFibre.ofModification` (constructor): A minuscule modification with its marked untilt and Tate frame gives a point.
- `BasicTowerFibre.forgetFrame` (projection): Forget the full frame to a lattice-level point.
- `BasicTowerFibre.elCondition` (characterisation): O_E linearity and the determinant condition cut out the formal-module EL fibre.
- `BasicTowerFibre.pullback` (functoriality): Pull back bundles, divisors and frames along a perfectoid base map.

Unit tests.

- `BasicTowerFibre.rankOneSign` (computation): The SW20 multiplicative datum is b=p^(−1), μ=1; swapping b for p violates this convention.
- `BasicTowerFibre.generalEHeight` (compatibility): For E/Q_p of degree e, restriction of scalars has Q_p rank en while the O_E rank remains n.
- `BasicTowerFibre.levelFrame` (compatibility): Reducing the universal Tate frame gives the specified congruence-level local system.

Uses.

- SW20, Theorem 24.2.5: The classical tower is identified with this fibre.
- ES7:GLn-comparison: Only the classical basic fibre is exported; excursion operators are constructed
   by the consumer.

Acceptance checks.

- For n=1, b=p^(−1) and μ=1 give the nonempty multiplicative modification.
- The Newton sign of b and the degree sign of E_b are distinguished by the exact sequence; they cannot
   be copied from the FS O(−1/n) orientation.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/infinite-level-moduli`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `FarguesFontaineDiamonds:F4/curve_untilt_divisor`, `DiamondsAndVStacks:D6`.

Source matching.

- [SW20] Theorem 24.2.5, pp. 227–229; Corollary 24.3.5, pp. 230–231: The GL_n and EL modification
   descriptions and their level compatibility.

### Classical tower versus the basic Hecke fibre

Target `classical-tower-fibre-comparison` (theorem).

The diamonds of the classical LT/Dr EL tower levels are isomorphic to the corresponding basic
   minuscule modification functor at those levels. The isomorphism respects the universal Tate local
   system, the two period maps, the framing/level actions and Weil descent. The infinite-level
   comparison and its cohomological realization are exported from ET.6a. No general EL/PEL
   Rapoport–Zink representability or full Hecke/Satake construction is claimed here.

Hypotheses.

- At hyperspecial/parahoric level impose SW20 connectedness and local-model hypotheses; in the PEL
   extension p≠2.
- For the required formal O_E-module case use the EL restriction-of-scalars specialization.

Construction or proof route.

1. Map a p-divisible deformation to its vector-bundle modification via the local classification
   theorem.
2. Show the Tate kernel is the trivial bundle and reconstruct the p-divisible group on geometric
   points.
3. Use the GM étale map and the universal lattice local system to promote the geometric-point
   comparison to a diamond isomorphism.
4. Match all levels by the same local system and transport actions; combine with the independent
   tower-cohomology comparison.

Acceptance checks.

- A pointwise bijection alone fails the diamond-isomorphism target.
- The HS3 classical-comparison clauses for these towers should redirect to this node rather than
   create a reverse edge to ET.6a.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/basic-modification-functor`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/el-duality`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/equivariant-cohomology-comparison`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/period-morphisms`.

Source matching.

- [SW20] Theorem 24.2.5 and Corollary 24.3.5, pp. 227–231: The diamond comparison and the all-level
   local-system argument.

### Raw compact-unitary PEL cohomology

Target `raw-compact-unitary-cohomology` (construction).

For a Harris–Taylor compact unitary PEL datum with the required split place E and local division
   invariant, construct the neat finite-level canonical models and their integral PEL models at p,
   the universal p-divisible group, and RΓ_c of the geometric generic fibre with its algebraic
   coefficient local system. Retain prime-to-p Hecke correspondences, local p-level correspondences
   and W_E descent. This raw object and its nearby cycles precede any associated global Galois
   representation or local–global compatibility theorem.

Hypotheses.

- The division algebra, involution, signatures, neatness and local level are required to satisfy the
   Harris–Taylor moduli hypotheses.
- Compactness is a theorem of this datum, not a consequence of neatness.

Construction or proof route.

1. Import the general PEL moduli problem and universal family from PELModuli.
2. Specialize to the compact unitary datum and construct its p-level integral models.
3. Construct the algebraic local system and the Hecke/Weil actions on geometric cohomology.
4. Prove the exact compactness and level properties from Harris–Taylor; this proof step is blocked by
   the uncleared book, and is recorded as a source gap.

Proposed API (reader targets unless expressly prototyped).

- `CompactUnitaryRaw.atLevel` (constructor): Construct the raw compact unitary PEL model at a neat level.
- `CompactUnitaryRaw.localSystem` (constructor): Associate the specified algebraic coefficient representation.
- `CompactUnitaryRaw.hecke` (functoriality): Level correspondences act on raw cohomology with pullback and proper trace.
- `CompactUnitaryRaw.nearbyCycles` (compatibility): The geometric generic-fibre complex compares with the integral-model nearby-cycle complex.

Unit tests.

- `CompactUnitaryRaw.properSupport` (compatibility): On the compact datum, the proper-support comparison is the canonical map RΓ_c→RΓ.
- `CompactUnitaryRaw.levelTrace` (computation): Trace after pullback for a finite neat covering multiplies by its degree.
- `CompactUnitaryRaw.boundary` (non-example): A noncompact unitary datum requires boundary terms and cannot be substituted into the compact calculation.

Uses.

- Harris–Taylor and Boyer input as used in Dat, §4.1: The local supercuspidal realization is extracted
   from this raw global object.
- AutomorphicGaloisRepresentationsPartII:AG2.1a: Its raw compact-unitary clauses move down here; later
   Galois compatibility consumes them.

Acceptance checks.

- For a compact generic fibre RΓ_c≅RΓ, by properness rather than by changing notation.
- The construction cannot invoke the Galois representation later extracted from it.

Inputs. `PELModuli:M2/representability`, `PELModuli:M2/universal-family`, `PELModuli:M4/canonical-model-identification`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.6`.

Source matching.

- [Dat] §4.1, Theorem 4.1.2 and its proof, pp. 28–29: Dat credits Theorem 4.1.2 to Boyer; its proof
   translates between Harris–Taylor’s and Boyer’s nearby-cycle notation and applies Boyer’s theorem,
   whose global input is the compact unitary (Harris–Taylor) Shimura variety planned here.
- [Shin] §5.1, pp. 30–31 (author copy): Compact unitary PEL data and the distinction between moduli
   and canonical-model components.

### Independent nearby-cycle decomposition

Target `unitary-nearby-cycle-decomposition` (theorem).

For the compact unitary model above, decompose the relevant Newton-stratum nearby-cycle terms into
   Igusa factors and local formal-module deformation cohomology, with the stratum shifts,
   coefficient duals, W_E descent and Hecke actions retained. Extracting the supercuspidal local
   sector has only the contribution yielding degree n−1. The precise Harris–Taylor and Boyer
   stratification and local-system statements must be read and matched before this theorem is
   certified; Dat’s citation is an interface witness, not its proof.

Hypotheses.

- Use the actual compact unitary integral model and the supercuspidal sector.
- This target does not assert all non-supercuspidal monodromy or elliptic derived decompositions.

Construction or proof route.

1. Construct the Newton strata and their local product charts from the moduli.
2. Calculate the nearby-cycle restrictions and intermediate extensions with their shifts.
3. Compare stratum cohomology with the local LT deformation complexes.
4. Use the independently proved boundary/stratum vanishings for the supercuspidal sector; the book
   proof and exact internal locators are an open source-access task.

Acceptance checks.

- The spectral sequence must prove actual sector concentration, not just cancellation of Euler
   characteristics.
- All W_E actions must be the descent actions of the same model.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/raw-compact-unitary-cohomology`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/lubin-tate-tower`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/tower-compact-support`, `LefschetzPencilsAndVanishingCycles:LPV.6`.

Source matching.

- [Dat] Theorem 4.1.2 and its proof, pp. 28–29 (with Lemma 3.5.13, p. 27): Dat identifies the sector
   cohomology with the dual of the nearby-cycle cohomology of the Lubin–Tate formal scheme
   (Berkovich’s comparison and the duality Lemma 3.5.13) and then applies Boyer’s computation; the
   nearby-cycle realization is imported, not proved by duality.

### Automorphic trace comparison and local extraction

Target `global-extraction` (theorem).

Apply the independent compact-unitary trace comparison to the raw cohomology and isolate the global
   automorphic constituents with prescribed supercuspidal local factor. The nearby-cycle
   decomposition then extracts the local LT Weil representation and identifies it with the ET.6
   normalized parameter of the contragredient in Dat’s tensor convention, fixing the scalar and the
   central character. The proof must be independent of any AG2 local–global compatibility or FS
   agreement result.

Hypotheses.

- Use independent ET.4 trace identities and ET.6 classical parameter conventions.
- Any cyclic base-change input used by ET.6 must first be reassigned to the proposed earlier ET.4b;
   ET.7a is not an input here.

Construction or proof route.

1. Use independently available global test functions to isolate the chosen finite local supercuspidal
   factor.
2. Compare geometric raw cohomological traces and automorphic spectral traces including component and
   volume factors.
3. Use the nearby-cycle decomposition to identify the surviving local factor.
4. Prove concentration and scalar normalization by the Harris–Taylor argument as extended by Boyer;
   exact theorem matching in the uncleared Harris–Taylor book and in Boyer’s freely available paper
   (arXiv:math/0511531) is still required.

Acceptance checks.

- No edge from AG2 compatibility or ES7 agreement enters this proof.
- A character identity must be upgraded to a degree-wise sector isomorphism using the independent
   concentration theorem.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/raw-compact-unitary-cohomology`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/unitary-nearby-cycle-decomposition`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Source matching.

- [Dat] §4.1, pp. 28–29: The proof of Theorem 4.1.2 applies Boyer’s theorem, which rests on the
   Harris–Taylor global calculation, after translating conventions.

### Actual supercuspidal cohomology in Dat conventions

Target `supercuspidal-dat-sector` (theorem).

Let ρ be an irreducible smooth D× representation such that π_ρ=JL(ρ) is supercuspidal, with central
   character treated as above. For the full tower, or its correctly untwisted quotient model,
   H_c^i(M_LT)[ρ]=0 for i≠n−1 and H_c^(n−1)(M_LT)[ρ]≅π_ρ⊗rec_E(π_ρ∨)|·|^((1−n)/2) as GL_n(E)×W_E
   representations. The same identity holds for the Dr tower in the common Dat action convention.
   These are actual cohomology groups, not virtual representations. Here [ρ] is the tensor
   convention already defined.

Hypotheses.

- ell≠p and characteristic-zero coefficients.
- The independent global realization (Harris–Taylor, extended by Boyer) and its concentration proof
   must be supplied.
- Only the d_ρ=1 (supercuspidal) specialization of Dat is used.

Construction or proof route.

1. Specialize Dat 4.1.2 to d_ρ=1. Only i=0 is defined in its degree n−1+i indexing; the vanishing for
   1≤i≤n−1 is the intended reading recorded as EndoscopicTransferAndUnitaryTraceComparison/E3 and
   follows from the range of Boyer’s computation.
2. Identify the unique smooth factor with JL(ρ) and retain rec of its contragredient.
3. Read the independent global realization through the preceding raw/nearby-cycle/extraction chain; it
   remains blocked by source access.
4. Use the integral equivariant tower comparison to transfer the degree-wise result to Dr.

Acceptance checks.

- The degree is exactly n−1 and the exponent is (1−n)/2.
- The Weil factor is rec(π_ρ∨); replacing it by rec(π_ρ) without changing conventions fails.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/central-quotient-sector`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/global-extraction`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/equivariant-cohomology-comparison`.

Source matching.

- [Dat] Theorem 4.1.2 (credited to Boyer), p. 28: The supercuspidal (d_ρ=1) specialization of the
   displayed degree-wise formula; the vanishing outside degree n−1 is the intended reading of the
   theorem’s range (EndoscopicTransferAndUnitaryTraceComparison/E3).

### Normalization contract for the two Hecke orientations

Target `fs-normalization-contract` (comparison).

Export to ES7 the two geometric Hecke orientations of the basic tower, with standard perverse
   normalization Λ[n−1]((n−1)/2), and explicit action-conversion isomorphisms from the Dat complex.
   In the FS orientation the σ=JL^(−1)(π) input yields π⊗ρ_π on the LT leg, and the π input on the
   return Dr leg yields σ⊗ρ_π∨, concentrated after normalization in degree zero. Here the input is
   the associated smooth representation sheaf on the source stratum, and isotypic extraction is
   derived tensor over that source group using the right action defined by its torsor; it is not
   silently identified with Dat’s [ρ]. The promised conversion must specify the duals,
   inverse-transpose linear action, central quotient and Weil/Tate twists.

Hypotheses.

- π is irreducible supercuspidal and ρ_π is the ET.6 parameter.
- The explicit independent action dictionary remains a gap until matched with the Harris–Taylor
   source; the FS proof is only evidence of the consumer signature.

Construction or proof route.

1. Use the classical tower–modification comparison to identify the two geometric orientations and their
   source torsor actions.
2. Compare their right-action derived tensor functors with the literal Dat sector.
3. Track inverse transpose, dual local systems and the shift/half-Tate twist separately; prove the
   resulting action-conversion maps.
4. Check the scalar on the two-leg unit/counit composite at (1,1), leaving that composite calculation
   to ES7.

Acceptance checks.

- At n=1 the shift and half twist vanish and the two factors are dual rank-one Weil characters.
- The two-leg output is σ⊗ρ_π⊗ρ_π∨, with independently specified W_E actions.
- A formula obtained by just replacing rec(π∨) in the Dat formula is rejected.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/classical-tower-fibre-comparison`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/supercuspidal-dat-sector`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/tower-conventions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

Source matching.

- [FS] IX.7.4, p. 338: The two normalized cohomology outputs needed by the consumer (FS writes JL(π)
   for the D× representation σ and ρ_π^* for the dual parameter); not an independent proof.
- [Dat] §§3.3–3.5 and Theorem 4.1.2, pp. 21–28: The literal input complex and sector convention that
   the independent dictionary must translate.

### Arithmetic descent of the rank-two central quotient

Target `rank-two-arithmetic-descent` (theorem).

For the rank-two Drinfeld tower in CDN23’s conventions, the quotient M_n^varpi by the chosen central
   uniformizer action descends from brevé E to E with its G′ action. Its base change to a finite
   extension K/E is therefore the arithmetic space M_n,K^varpi, with the specified continuous Galois
   action on étale cohomology. Descent is obtained from the Weil cocycle including the height
   translation, not by discarding the descent datum after geometric base change.

Hypotheses.

- Restrict this additional endpoint to the rank-two setting and fields covered by CDN23.
- Use the precise central quotient and quotient group G′ of that source.

Construction or proof route.

1. Compute the Frobenius height translation on the tower.
2. Pass to the central uniformizer quotient so that the translation is killed in the required descent
   cocycle.
3. Apply effective descent to its finite-level formal/rigid models.
4. Match G′ and the coefficient Galois action after finite extension.

Acceptance checks.

- Arithmetic H_et(M_n,K^varpi,−) is not confused with geometric H_et(M_n,C^varpi,−).
- The central action and descent survive the group-action comparison.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/actions-and-weil-descent`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/central-quotient-sector`.

Source matching.

- [CDN23] §0.2.1, p. 4 (published copy): The tower, its central quotient, arithmetic descent and
   action conventions.

### Perfectoid Stein covers and Mittag–Leffler

Target `stein-mittag-leffler` (theorem).

In the setting of CDN23 §3 — the Lubin–Tate tower of GL_n(F) at infinite level over C_p, for every
   n≥1 (the paper applies it with n=2), and hence the Drinfeld tower through the duality isomorphism
   — choose an increasing Stein affinoid perfectoid cover {U_s}. For every i and k≥1 the restriction
   inverse system {H_et^i(U_s,Z/p^k)} is Mittag–Leffler. Thus its derived inverse-limit obstruction
   R¹lim vanishes. This p-primary statement is separate from the ell≠p compact-support realization
   and does not assert that arbitrary perfectoid covers are Mittag–Leffler.

Hypotheses.

- The cover is a Stein affinoid perfectoid cover as in CDN23 3.10.
- The source’s compact p-adic Lie level group acts on its standard exhaustion.

Construction or proof route.

1. Reduce by dévissage to k=1.
2. Tilt each U_s and use Artin–Schreier plus affinoid perfectoid acyclicity; for i≥2 the groups vanish.
3. For i=1 use density of the Stein restriction maps and the Artin–Schreier quotient.
4. For i=0 use the compact Lie-group description of components and stabilization of the ascending
   closed-subgroup chain.

Acceptance checks.

- The i=0 argument is included; higher acyclicity alone does not settle it.
- The exact published locator is Lemma 3.10, pp. 35–36, correcting the issue’s Lemma 3.3.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/perfectoid-limit`, `PerfectoidSpaces:P5`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/rank-two-arithmetic-descent`.

Source matching.

- [CDN23] Lemma 3.10 and Corollary 3.11, pp. 35–36: The Stein-cover Mittag–Leffler proof, including
   the component argument; §3 works with the Lubin–Tate tower of GL_n(F) for arbitrary n (§3.1, p.
   32).

### Gross–Hopkins coordinates and infinitesimal operators

Target `gross-hopkins-vector-fields` (theorem).

In the rank-two LT chart of CDN20, write the Gross–Hopkins period coordinate as A/B and put
   g=AB′−A′B. Étaleness makes g invertible. The vector fields f_i d/dz with f_1=A²/g, f_2=B²/g and
   f_3=AB/g give the infinitesimal action of the Lie algebra of D×/F× (D the quaternion division
   algebra) on functions on the tower, in the source’s chosen basis. In particular f_1 f_2′−f_2
   f_1′=2f_3, so the first two vector fields have the required bracket. The formulas are
   coordinate-dependent and glue through the period-map transformation rule.

Hypotheses.

- Rank two, the coefficient field and Lie-algebra basis of CDN20 §4.2.
- Derivatives are in the selected LT deformation coordinate z.

Construction or proof route.

1. Use GM étaleness to establish g≠0 on the chart.
2. Differentiate the projective linear action on the period coordinate.
3. Pull the induced vector fields back through the étale period map.
4. Compute the bracket using the quotient rule, then verify compatibility on chart overlaps.

Acceptance checks.

- The denominator is g, not g², in each f_i.
- The bracket coefficient is 2f_3 in the chosen basis.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/period-morphisms`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/lubin-tate-tower`, `LocallyAnalyticDistributions:L0`.

Source matching.

- [CDN20] Proposition 4.8, pp. 38–39 (arXiv copy): Proof of Proposition 4.8, Lubin–Tate side: the
   Gross–Hopkins period coordinate A/B, the invertibility of g and the three vector fields giving
   the infinitesimal action of Ǧ/Z(Ǧ), which the source attributes to Gross–Hopkins, and the
   identity f_1f_2′−f_2f_1′=2f_3 (checked by the quotient rule).

### Duality and locally analytic vectors

Target `analytic-vectors-under-duality` (theorem).

For E=Q_p and n=2, on an affinoid perfectoid tower chart Spa(B,B+) covered as in Pan §5.3.5, the
   GL_2(Q_p)-locally analytic vectors in B equal the D×-locally analytic vectors. Duality exchanges
   the two periods and the invariant differential constructions: for the weight convention
   χ=(n_1,n_2), k=n_2−n_1≥0, Pan’s two order-(k+1) operators are equal up to the nonzero rational
   normalization constant c′ after the prescribed line-bundle identifications. The constant is not
   declared equal to one without normalizing coordinates.

Hypotheses.

- Use Pan v1’s chart topology, analytic-vector definition, polarization and weight convention.
- The analytic input from Pan22 and its Higgs compatibility must be independently supplied.

Construction or proof route.

1. Use the explicit local series description of Pan 5.2.8 to prove the GL_2-analytic inclusion in the
   D×-analytic vectors.
2. Use duality and the exchanged period map to apply the analogous description 5.3.8 for the reverse
   inclusion.
3. Transport the Kodaira–Spencer line-bundle identifications under duality.
4. Apply the uniqueness characterization of the differential operator in 5.2.15 to obtain 5.3.20,
   retaining c′.

Acceptance checks.

- The result applies to locally analytic vectors, not to all continuous B.
- The transported operator has order k+1 and a nonzero scalar; it is not a tautological renaming.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/el-duality`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/period-morphisms`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/gross-hopkins-vector-fields`, `LocallyAnalyticDistributions:L0`.

Source matching.

- [Pan] Theorems 5.2.8, 5.3.4, 5.3.8; Corollary 5.3.9; Theorem 5.3.20, pp. 59, 63–65, 67 (v1): Local
   series, period exchange, analytic-vector equality and operator comparison.

## ET.7a. Pure automorphic transfer

### Cyclic base change before classical LLC

Target `cyclic-base-change` (theorem).

For a cyclic extension L/K of number fields of prime degree r and its class-field character η, a
   cuspidal unitary representation π of GL_m(A_K) has a unique cyclic base change Π in the class
   induced from cuspidal representations. It is cuspidal if π is not isomorphic to π⊗η; in the
   self-twist case r divides m and Π is the isobaric sum of the r distinct conjugates of a cuspidal
   representation of GL_(m/r)(A_L). A Galois-stable cuspidal Π descends, and its descents differ by
   powers of η. Local tempered base change satisfies the Shintani character identity and sends the
   central character ω_π to ω_π∘N_L/K; the other tempered representations with the same lift are the
   inductions of the same discrete-series data twisted factorwise by powers of the local class-field
   character, and the lift of a supercuspidal representation is supercuspidal when it is discrete
   and otherwise is induced from the distinct Galois conjugates of a supercuspidal representation.

Hypotheses.

- Use the induced-from-unitary-cuspidal class and prime degree for the stated global cuspidality
   alternative.
- The local statement is for cyclic nonarchimedean extensions and tempered representations.

Construction or proof route.

1. Use associated test functions and the cyclic twisted trace identity, independent of the later tower
   realization.
2. Apply strong multiplicity one to prove uniqueness of the almost-everywhere lift.
3. Separate the self-twist and no-self-twist cases in the discrete spectral comparison.
4. Prove the local tempered character identity and central-character relation by the AC local transfer
   argument.
5. Relocate this current-scope node to proposed ET.4b before ET.6; do not create an ET.7a→ET.6 edge.

Acceptance checks.

- A self-twist example has noncuspidal base change; cuspidality is not automatic.
- For an unramified local degree-r extension the Satake eigenvalues become α_i^r.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `AutomorphicSpectralTheory:AS.6/invariant-trace-formula`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3`.

Source matching.

- [AC] Chapter I, Definition 6.1 and Theorem 6.2, p. 51; Proposition 6.7, p. 59; Lemma 6.10, p. 62;
   Chapter III, Theorem 4.2, pp. 202–203: The local Shintani lift with its uniqueness and
   central-character relation, the fibres of tempered lifting, the lifts of supercuspidal
   representations, and the global cyclic cuspidality alternatives.

### Cyclic automorphic induction

Target `cyclic-automorphic-induction` (theorem).

For a cyclic extension L/K of degree r and an automorphic representation Π of GL_a(A_L) induced from
   unitary cuspidal data, there is a unique automorphic induction AI_L/K(Π) on GL_(ar)(A_K) in that
   class, characterized by induction of unramified Weil parameters almost everywhere. At split
   places its parameter is the direct sum over the places above; at inert places it is
   Ind_(W_Lw)^(W_Kv). For prime degree and cuspidal Π, induction is cuspidal precisely when the
   Galois orbit has size r. Transitivity handles the stated cyclic towers.

Hypotheses.

- Use the induced-from-cuspidal class of AC III §6.
- The prime-degree cuspidality criterion is distinguished from the general transitivity statement.

Construction or proof route.

1. Construct the induced Satake parameters at split and inert places.
2. Use the cyclic base-change descent alternatives to produce the global representation.
3. Use strong multiplicity one for uniqueness and induction by stages for transitivity.
4. Compute the central character by the determinant of the induced local parameter, including the
   permutation determinant character.

Acceptance checks.

- For rank-one input and quadratic L/K, det Ind χ equals the transfer of χ times the quadratic
   extension character.
- A Galois-invariant cuspidal input induces a noncuspidal isobaric sum.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/cyclic-base-change`.

Source matching.

- [AC] Chapter III, Definition 6.1 and Theorem 6.2 and proof, pp. 214–217: Automorphic induction, its
   split/inert parameters and construction by cyclic descent.

### The global Speh datum

Target `speh-representation` (definition).

For a unitary cuspidal representation ρ of GL_a(A_F) and an integer b≥1, put m=ab. Define Speh(ρ,b)
   as the unique irreducible Langlands quotient of normalized induction of ρ|det|^((b−1)/2),
   ρ|det|^((b−3)/2), …, ρ|det|^((1−b)/2) from the Levi GL_a^b. Its central character is ω_ρ^b
   because the exponents sum to zero. This global residual Speh quotient is distinguished from a
   local generalized Steinberg subrepresentation.

Hypotheses.

- F is a number field and ρ is unitary cuspidal.
- Normalized upper-parabolic induction and decreasing exponents are fixed.

Construction or proof route.

1. Form the normalized standard module.
2. Use the local Langlands-quotient theorem at all places and restricted tensor product compatibility.
3. Compute the exponent sum and central character.
4. Retain the quotient realization when discussing global residues.

Proposed API (reader targets unless expressly prototyped).

- `Speh.ofCuspidal` (constructor): Construct the quotient from (ρ,b) with a≥1, b≥1.
- `Speh.standardModule` (projection): Expose the normalized induction and its quotient map.
- `Speh.centralCharacter` (compatibility): The central character is ω_ρ^b.
- `Speh.one` (simp): Speh(ρ,1)=ρ.
- `Speh.ext` (extensionality): The cuspidal datum and segment length determine the global quotient up to isomorphism.

Unit tests.

- `Speh.lengthOne` (degenerate): b=1 gives the original cuspidal representation.
- `Speh.lengthTwo` (computation): For b=2 the exponents are +1/2 and −1/2 and the central character is ω_ρ².
- `Speh.quotientVsSub` (non-example): Replacing the quotient by the local essentially square-integrable segment subrepresentation is not the global Speh definition.

Uses.

- MW, introductory theorem, p. 606: Every discrete GL_m constituent is classified by this datum.
- Shin, Proposition 4.8: The relatively discrete Levi spectrum includes residual constituents, not
   only cusp forms.

Acceptance checks.

- At b=1 it is ρ.
- For b>1 it lies in the residual discrete spectrum, not the cuspidal spectrum.

Inputs. `AutomorphicFormsOnReductiveGroups:AF.2`, `AutomorphicSpectralTheory:AS.4`.

Source matching.

- [MW] Introduction and §I.1, pp. 605–607; §I.11, pp. 640–643: The quotient convention,
   central-character class and residual representation.

### The full GL_m discrete spectrum

Target `residual-spectrum-classification` (theorem).

With a fixed unitary central character over a number field, every irreducible constituent of
   L²_disc(GL_m(F) modulo its centre in GL_m(A_F)) is a unique Speh(ρ,b), m=ab, and occurs with
   multiplicity one. The cuspidal spectrum is the b=1 part and the residual spectrum is b>1. The
   statement uses square integrability modulo the centre; it does not replace the continuous
   spectrum by discrete Speh representations.

Hypotheses.

- Use the normalized induction and central-character convention of the Speh datum.

Construction or proof route.

1. Decompose by cuspidal support classes.
2. Normalize intertwining operators by the Rankin–Selberg factors.
3. Analyze the residue hyperplanes and the cancellation of poles at the zero differences.
4. Show that only equal-rank repeated-cuspidal segments survive and each gives its unique quotient
   once.

Acceptance checks.

- A b=2 residual constituent must appear in a discrete spectral calculation.
- Continuous Eisenstein contributions remain in the full trace formula where required.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/speh-representation`, `AutomorphicSpectralTheory:AS.6/fine-spectral-expansion`.

Source matching.

- [MW] Introduction, theorem (i)–(ii), pp. 605–606; §II.3 and its corollary, pp. 647–649: The residual
   classification by repeated cuspidal support and the residue proof route.

### Twisted unitary spectral coefficients

Target `twisted-spectral-normalization` (theorem).

For the unitary twisted GL group and test functions of Shin §4, the invariant twisted spectral
   distribution is the sum over Levi M of |W_M|/|W_G| times |det(Φ^(−1)θ−1) on a_M^(Gθ)|^(−1), times
   traces on the relatively discrete Levi spectrum of the normalized intertwining composite. After
   the stated central character twist, Shin Corollary 4.14 identifies this composite with the
   normalized θ-intertwiner A′ on the induced representation. At the full Levi the determinant is
   2^r for r nonzero components of the endoscopic datum vecn, so its reciprocal spectral coefficient
   is 2^(−r); at a maximal proper Levi it is 2^(r+1).

Hypotheses.

- Use Shin’s real Lefschetz function and central-character normalization.
- Convergence and the invariant trace formula come from AS.6, independently of Igusa cohomology.

Construction or proof route.

1. Import the invariant spectral expansion and group the regular Weyl terms.
2. Use the Φ^(−1)θ involution to identify the single surviving regular element.
3. Insert the residual spectrum classification into each Levi discrete summand.
4. Transport the intertwining operator through the explicit central twist and retain its determinant
   coefficient.

Acceptance checks.

- For a full Levi with two nonzero endoscopic blocks the determinant is 4 and its reciprocal
   coefficient is 1/4.
- Absorbing the normalization operator into an unnamed scalar fails the target.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/residual-spectrum-classification`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `AutomorphicSpectralTheory:AS.6/invariant-trace-formula`.

Source matching.

- [Shin] Proposition 4.8 and Remark 4.10, p. 28; Lemma 4.11, p. 29; Corollary 4.14, p. 30 (author
   copy): The Levi/Weyl coefficient, determinant and normalized intertwiner.

### Weak unitary base change and standard pairs

Target `weak-unitary-base-change` (definition).

Let F/F+ be CM, V a standard definite or standard one-place-indefinite hermitian space, and π an
   automorphic U(V) representation. A weak automorphic base change is an automorphic representation
   Π of GL_N(A_F) that is a finite isobaric sum of discrete automorphic representations and whose
   unramified local parameters match local base change at all but finitely many places of F+. A
   standard pair requires π_f to occur in the stated raw Shimura cohomology (degree zero in the
   definite case, some degree in the indefinite case). Strong multiplicity one gives uniqueness of Π
   when it exists; weak base change alone specifies neither every bad local factor nor every packet
   member.

Hypotheses.

- Standard means the signatures and finite-local conditions of LTXZZ Definition 3.2.7.
- Use finite isobaric sums, not only cuspidal GL_N representations.

Construction or proof route.

1. Import the canonical models of the abelian-type unitary Shimura varieties Sh(V,K) attached to
   Res_{F+/Q}U(V) (these are not PEL moduli of similitude groups) and, for definite V, the finite
   Shimura sets; take their raw cohomology.
2. Define the unramified parameter-matching predicate.
3. Use strong multiplicity one for uniqueness in the isobaric class.
4. Record that LTXZZ attributes existence to Shin’s cohomological base change for unitary similitude
   groups (their reference [72], Theorem 1.1, adapted as in their Proposition D.1.3) and, for
   definite V, also to Labesse (their reference [42], Corollaire 5.3); both run through independent
   stable trace identities.

Proposed API (reader targets unless expressly prototyped).

- `UnitaryWeakBC.matches` (characterisation): The good-place unramified parameters match the fixed L-embedding.
- `UnitaryWeakBC.isobaric` (data): Record the GL_N isobaric datum and its central character.
- `UnitaryWeakBC.unique` (extensionality): Two isobaric transfers with the same almost-everywhere parameters are isomorphic.
- `StandardPair.cohomologyWitness` (projection): Expose the raw finite-part cohomological occurrence and the standard signatures.

Unit tests.

- `UnitaryWeakBC.split` (computation): At a split place U(V)(F+_v)≅GL_N(F_w), the selected component is the corresponding GL_N representation.
- `UnitaryWeakBC.badPlace` (non-example): Almost-everywhere equality does not certify an arbitrary chosen ramified packet member.
- `StandardPair.definite` (degenerate): For a definite space the occurrence witness is degree-zero Shimura-set cohomology.

Uses.

- LTXZZ, Proposition C.3.1: Weak transfer is upgraded to all-place matching only under the relevant
   generic packet theorem.
- AutomorphicGaloisRepresentationsPartII:AG2.2: The pure automorphic transfer is available before
   Igusa concentration.

Acceptance checks.

- Changing a ramified unitary local factor cannot be ruled out by the weak definition alone.
- Residual Speh possibilities remain until cuspidality is separately established.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/cyclic-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/residual-spectrum-classification`, `ShimuraVarieties:V6/abelian-canonical`.

Source matching.

- [LTXZZ] Definitions 3.2.3 and 3.2.7; Proposition 3.2.8, pp. 144–146: Weak matching, standard pairs
   and base-change existence.

### Pure cohomological unitary transfer

Target `cohomological-base-change` (theorem).

For a standard pair (V,π), the independent unitary stable trace comparison and complex spectral
   decomposition produce the weak isobaric base change Π. At split and good unramified places the
   character/Satake identities use the chosen L-embedding, and at infinity Π has the corresponding
   cohomological infinitesimal character. The identities include the central character and
   normalized intertwiner coefficients. They are exported to AG2.2 without using Igusa concentration
   or any constructed global Galois representation.

Hypotheses.

- Use the independent ET.4 stable/twisted identities and their admissible test functions.
- Existence is LTXZZ Proposition 3.2.8, which cites Shin’s cohomological base change (their reference
   [72], Theorem 1.1) and, for definite V, Labesse (their reference [42], Corollaire 5.3); these
   primary proofs remain a source-reading gap.

Construction or proof route.

1. Use the complex spectral decomposition of raw cohomology and real Lefschetz test functions.
2. Transfer finite test functions using ET.3/4 and compare twisted discrete spectra.
3. Use the residual classification and cyclic base-change steps to identify the isobaric GL_N
   constituents.
4. Apply strong multiplicity one to identify the good-place character and infinity type.
5. Read Shin’s (and, in the definite case, Labesse’s) primary existence argument before treating the
   theorem as independently certified.

Acceptance checks.

- The proof has no prerequisite in ET.7b or IG.5.
- The theorem makes good-place and infinity assertions, not all-place packet matching.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/weak-unitary-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/twisted-spectral-normalization`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/cyclic-automorphic-induction`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`.

Source matching.

- [LTXZZ] Proposition 3.2.8, p. 146: The existence theorem is not proved in LTXZZ: it is attributed to
   Shin’s cohomological base change, with Labesse’s result as a second reference in the definite
   case.
- [Shin] §4, Proposition 4.8, p. 28, and Corollary 4.14, p. 30: The pure twisted spectral comparison
   machinery.

### Local unitary Langlands quotient compatibility

Target `local-unitary-base-change` (comparison).

For an unramified quadratic nonarchimedean extension and a unitary group U(V), write an irreducible
   local representation as a Langlands quotient with tempered data τ_0 on a smaller unitary group
   and τ_i on GL_(r_i), and strictly positive ordered unramified characters α_i. Its GL_N base
   change is the Langlands quotient of the symmetric list τ_t^(∨c)α_t^(−1), …, τ_1^(∨c)α_1^(−1),
   BC(τ_0), τ_1α_1, …, τ_tα_t. Spherical base change matches Satake via the fixed L-embedding. These
   are classification outputs imported from ET.4; defining weak global transfer does not prove them.

Hypotheses.

- The tempered local unitary base-change/classification theorem is an independent ET.4 supplier.
- Retain the strictly positive ordering and normalized induction convention.

Construction or proof route.

1. Use the Langlands classification to identify the unique standard module.
2. Apply local base change to tempered unitary data and the conjugate-dual paired GL blocks.
3. Match the dominant exponents and pass to the unique irreducible quotient.
4. Verify the spherical case using Satake, not a global a.e. argument.

Acceptance checks.

- The GL list has total rank N_0+2Σr_i.
- Replacing conjugate dual by ordinary dual gives a different list over a CM extension.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/weak-unitary-base-change`.

Source matching.

- [LTXZZ] Appendix C.1, pp. 351–352: The local Langlands-quotient and tempered/spherical base-change
   rules.

### Relevant generic packet multiplicity one

Target `relevant-packet-multiplicity` (theorem).

For a relevant GL_N(A_F) representation Π in the sense of LTXZZ 1.1.3 (cuspidal, conjugate self-dual
   with its specified infinity type), and a standard definite or standard indefinite V, every
   irreducible admissible π on U(V) whose local base change equals Π_v at every place occurs in the
   discrete automorphic spectrum with multiplicity one. Conversely, an automorphic π with weak base
   change Π matches Π at every place. At nondistinguished infinity π_v is trivial; at the
   distinguished indefinite infinity its allowed components are the N discrete series with
   Harish–Chandra set {(1−N)/2,(3−N)/2,…,(N−1)/2}.

Hypotheses.

- Relevant generic cuspidal Π and the standard hermitian spaces are essential.
- Import the independent generic packet classification and global multiplicity formula from ET.4; it
   is not claimed for arbitrary non-generic Arthur parameters.

Construction or proof route.

1. Apply the generic global unitary packet theorem with the appropriate inner-form relevance
   conditions.
2. Use the global multiplicity formula to prove occurrence and multiplicity one for the specified
   standard forms.
3. Upgrade weak transfer to all-place matching using that same classification theorem.
4. Compute the infinity components from the fixed cohomological parameter.

Acceptance checks.

- There are N allowed distinguished indefinite infinity components, not an arbitrary multiplicity N
   for a single automorphic π.
- An arbitrary weak transfer does not prove this theorem without the relevant generic hypotheses.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/cohomological-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/local-unitary-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`.

Source matching.

- [LTXZZ] Proposition C.3.1, p. 363: All-place matching, multiplicity one and the allowed infinity
   components.

### Definite and indefinite packet switches

Target `definite-indefinite-switches` (theorem).

For even N=2r, standard definite V and indefinite V′ agree outside one inert finite place p and the
   distinguished infinity. If π has trivial infinity, cuspidal base change and its p-component lies
   in the special set S of LTXZZ C.2.5, replace it by the matched S′ component and any distinguished
   discrete series with Harish–Chandra set {1/2−r,…,r−1/2}; the resulting π′ has discrete
   multiplicity one. For odd N=2r+1, the reverse switch from a cuspidal-base-change indefinite π′
   with unramified p-component and infinity set {−r,…,r} to the definite unramified matching
   component has multiplicity one.

Hypotheses.

- Use the exact even S/S′ local packet comparison or the odd unramified comparison.
- The spaces are fixed isomorphic at every unchanged place.

Construction or proof route.

1. Preserve local base change at unchanged places by the fixed identifications.
2. Apply the local packet comparison at p, including the lattice and parity hypotheses.
3. Use the classified infinity components to preserve the global parameter.
4. Invoke relevant packet multiplicity one for the resulting all-place matching representation.

Acceptance checks.

- Even and odd switches have different directions and finite-place assumptions.
- Without membership in S, the even p-component cannot be freely replaced.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/relevant-packet-multiplicity`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/local-unitary-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`.

Source matching.

- [LTXZZ] Corollaries C.3.2 and C.3.3, p. 364; Proposition C.2.5, p. 362: The two parity-specific
   switches.

### Transferable compact levels

Target `transferable-level` (definition).

A compact open K_v in U(V)(F+_v) is transferable if for each endoscopic H the characteristic
   function 1_Kv has an endoscopic transfer f_Kv^H associated to a compactly supported GL-side
   function φ_Kv^H under base change, and for the full-rank quasi-split H the GL-side function may
   be supported on a maximal compact. An inertial transfer is the selected full-rank φ_Kv. The
   characteristic function is unnormalized: conversion to the idempotent divides by vol(K_v).

Hypotheses.

- Fix transfer factors, associated-function convention and Haar measures from ET.3/4.
- A transfer is a selected witness, not a unique test function.

Construction or proof route.

1. Form the associated-test-function predicate for each elliptic endoscopic datum.
2. Specify a witness for the full-rank transfer and its maximal-compact support.
3. Use split identity transfer, hyperspecial fundamental lemmas, or the small-level theorem as
   appropriate.
4. Keep the selected witnesses and prove trace independence at the packet-sum level.

Proposed API (reader targets unless expressly prototyped).

- `TransferableLevel.witness` (constructor): Supply associated transfer functions for every relevant H.
- `TransferableLevel.inertial` (projection): Project to the selected full-rank GL transfer.
- `TransferableLevel.spherical` (example): Good hyperspecial levels use the unit function under both fundamental lemmas.
- `TransferableLevel.idempotent` (compatibility): Replace 1_K by vol(K)e_K; traces scale accordingly.
- `TransferableLevel.traceIndependence` (characterisation): Matching packet traces depend on the transfer class, not the chosen representative.

Unit tests.

- `TransferableLevel.split` (compatibility): Under the split GL_N identification, a chosen 1_K transfers to itself with the same Haar measure.
- `TransferableLevel.volume` (computation): tr π(1_K)=vol(K) dim π^K, while tr π(e_K)=dim π^K.
- `TransferableLevel.badLevel` (non-example): An arbitrary ramified nonsplit K is not declared transferable without the required witnesses.

Uses.

- LTXZZ, Proposition D.2.3: The selected inertial transfers compute packet oldform dimensions.
- ET.7 normalization acceptance: The trace-to-dimension conversion depends on whether the source uses
   characteristic functions or idempotents.

Acceptance checks.

- At split places any compact open is transferable.
- At good inert places the hyperspecial transfer is the GL_N hyperspecial characteristic function.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/local-unitary-base-change`.

Source matching.

- [LTXZZ] Definition D.2.1 and Lemma D.2.2, p. 369: The two transfer conditions and the split, good
   and sufficiently small cases.

### Packet oldform dimension identities

Target `oldform-dimensions` (theorem).

Use all the data of LTXZZ D.2: even N=2r, relevant Π, disjoint Σ_min and Σ_lr, Σ_min containing the
   bad places, both together containing the ramified places of Π, inert nonsplit places in Σ_lr with
   special maximal K_v, hyperspecial levels elsewhere, and transferable K_v at Σ_min. Put c_v=1 at
   v∈Σ_lr exactly when Π_v is normalized induction of α_r^(−1),…,α_2^(−1),St_2,α_2,…,α_r with
   |α_i|=1, otherwise c_v=0. Then the definite Π-eigenspace dimension is
   |∏_(v∈Σ_min)tr(Π_v(φ_Kv)A_Πv) ∏_(v∈Σ_lr)c_v|; the indefinite middle-degree dimension is N times
   this value.

Hypotheses.

- Use the specified normalized local intertwiners, inertial transfers and source measures.
- Middle-degree concentration is the characteristic-zero relevant-tempered Matsushima calculation for
   this standard datum, not integral Igusa concentration.

Construction or proof route.

1. Use relevant packet classification and temperedness to restrict raw cohomology to the specified
   infinity components.
2. Use the local special-maximal calculation to obtain each zero/one c_v.
3. Sum dim π_v^K over local packet members at the remaining bad places.
4. Prove the identity between packet sums of invariants and normalized traces by passing to an
   auxiliary totally real quadratic extension in which every place of Σ_min splits, every place of
   Σ_lr is inert and the base change of Π stays cuspidal, and by using Shin’s definite-case
   dimension formula there (LTXZZ pp. 370–371, citing their references [71] and [72]).
5. Apply the transferred trace identity with normalized intertwiners; the standard infinity packet
   contributes 1 in the definite case and N in the indefinite case.

Acceptance checks.

- If some c_v=0 both specified eigenspaces vanish.
- For N=2 and all local factors one, the indefinite dimension is twice the definite dimension.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/transferable-level`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/relevant-packet-multiplicity`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/definite-indefinite-switches`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `AutomorphicFormsOnReductiveGroups:AF.5`, `AutomorphicFormsOnReductiveGroups:AF.4`.

Source matching.

- [LTXZZ] Proposition D.2.3 and its setup, pp. 368–371: The full hypotheses, local indicators and the
   two oldform dimensions.

### Automorphic inputs to GSp₄ solvable descent

Target `gsp4-solvable-descent-interface` (application).

Export cyclic GL_4 descent and the general-type GL_4↔GSp_4 transfer contract required in BCGP 1.8.22
   and Proposition 7.5.3. For a χ-self-dual cuspidal GL_4 representation, symplectic type is
   detected by a pole at 1 of the twisted exterior-square L-function, and general-type descents have
   all-place standard-parameter matching and multiplicity one. The BCGP solvable-descent
   applications take as input a given irreducible Galois representation over Q with multiplier
   ε^(−1), its given automorphic realization over a solvable CM or totally real extension, and the
   stated Tate twist; the construction of those Galois realizations is external to this part.

Hypotheses.

- The packet classification/transfer is an independent ET.4 supplier, including the similitude central
   character.
- Keep the twists and |·|² central character in BCGP 7.5.3; no descent is asserted without
   irreducibility over the extension.

Construction or proof route.

1. Use cyclic descent iteratively over the solvable chain, retaining the class-field twists.
2. Use the supplied symplectic-type/general-type transfer classification to identify the descended
   automorphic parameter.
3. Check the oddness obstruction excluding orthogonal type in the regular |·|²-self-dual Q case.
4. Leave comparison with the given Galois realization and its construction to the BCGP/AG2 consumer.

Acceptance checks.

- The similitude character is part of the exported parameter.
- No edge from AG2 Galois construction is introduced into the pure automorphic branch.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/cyclic-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/cyclic-automorphic-induction`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`.

Source matching.

- [BCGP] §1.8.22, p. 15; Proposition 7.5.3 and proof, p. 175 (arXiv copy): General-type transfer and
   the precise solvable-descent clients of cyclic descent.

### Automorphic induction of a quadratic Hecke character

Target `induced-character-client` (application).

Export the quadratic rank-one automorphic induction theorem used by BCGP Lemma 10.2.4: if a given
   irreducible two-dimensional potentially abelian de Rham Galois representation is not finite up to
   twist, the consumer identifies it as Ind_(G_K)^(G_F)ψ_p for a quadratic K/F and an algebraic
   Hecke character ψ with distinct conjugates. The automorphic output required here is the cuspidal
   AI_K/F(ψ), with the induced unramified parameters and determinant including the quadratic
   extension character. The classification of the given Galois representation is the consumer’s
   input, not a new construction here.

Hypotheses.

- The Hecke character and the quadratic induction identification are supplied as input.
- Distinct conjugates are essential to cuspidality.

Construction or proof route.

1. Apply the rank-one prime-degree automorphic induction theorem.
2. Use the nontrivial Galois orbit to prove cuspidality.
3. Compute the induced unramified parameters and central character.
4. Expose the finite-up-to-twist alternative as a separate consumer case.

Acceptance checks.

- If ψ is Galois-invariant, the induced automorphic representation is an isobaric sum, not cuspidal.
- The determinant includes the quadratic permutation character.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/cyclic-automorphic-induction`.

Source matching.

- [BCGP] Lemma 10.2.4, p. 213 (arXiv copy): The quadratic Hecke-character induction client.

## ET.7b. Rational Igusa comparison

### The early rational Igusa trace object

Target `rational-igusa-object` (construction).

For the CSnc split-prime quasi-split unitary PEL datum and a completely slope-divisible
   representative X_b, form the finite-level Mantovan Igusa varieties over its central leaf by
   trivializations of the slope-graded truncated p-divisible group, with the liftable-automorphism
   condition. The perfection of their inverse limit identifies with the perfect isomorphism torsor.
   The frames respect the O_F action and the paired polarizations up to one common scalar
   multiplier, and fppf locally lift to every larger truncation level. Define the rational
   alternating smooth cohomology class [H_c(Ig^b,Λ)]=Σ_i(−1)^i[H_c^i] over the finite-level tower,
   with J_b(Q_p)×G(A_f^p) actions. The object is not assumed positive, concentrated or integral.

Hypotheses.

- Use CSnc’s unramified PEL datum, neat prime-to-p levels and completely slope-divisible X_b.
- Only the early central-leaf/torsor/cohomology construction moves down; compactified fibres and
   integral concentration stay IG.
- Preserve the common polarization multiplier across all paired slope factors and the
   seminormal/perfect-base hypotheses in the torsor construction.

Construction or proof route.

1. Specialize the lower PEL universal family and define the Newton class and central leaf by its
   p-divisible isomorphism type.
2. Use the liftable-automorphism finite-level torsors and slope decomposition to construct the Igusa
   level system.
3. Compare the perfected finite-level tower with the isomorphism torsor and construct the quasi-isogeny
   group correspondences.
4. Take rational compact-support cohomology and its alternating class with all group actions.

Proposed API (reader targets unless expressly prototyped).

- `IgusaRational.atLevel` (constructor): Construct finite Igusa torsors with liftable truncated automorphisms.
- `IgusaRational.perfection` (equivalence): Identify their perfection with the full perfect torsor.
- `IgusaRational.actions` (functoriality): Prime-to-p and J_b correspondences act compatibly with finite level.
- `IgusaRational.eulerClass` (projection): Project rational cohomology to its alternating Grothendieck class.
- `IgusaRational.coefficientExtension` (compatibility): Scalar extension transports the trace object without imposing positivity.

Unit tests.

- `IgusaRational.alternating` (computation): A complex with the same one-dimensional trivial representation in degrees 0 and 1 has zero Euler class but nonzero cohomology.
- `IgusaRational.perfect` (compatibility): The perfection map induces an ell≠p étale cohomology isomorphism.
- `IgusaRational.truncation` (non-example): An arbitrary automorphism of X_b[p^m] not liftable to the required slope structure is not a finite Igusa level frame.

Uses.

- CSnc, Theorem 5.6.1: Its alternating character is the geometric side of the explicit trace formula.
- IgusaVarietiesAndTorsionConcentration:IG.1 and IG.5: These early rational clauses move down here;
   the higher stages import them and add geometric/integral consequences.

Acceptance checks.

- The scalar kernel in the group action is retained.
- Perfection does not add or remove étale cohomology with ell≠p coefficients.

Inputs. `PELModuli:M2/representability`, `PELModuli:M2/universal-family`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `DiamondSixOperations:S2`, `AdicCoefficientsAndComparisons:L0`.

Source matching.

- [CSnc] §§2.2–2.3, Proposition 2.2.3, Theorem 2.2.4, Definition 2.3.5 and Remark 2.3.7, pp. 14–20:
   The finite Igusa torsors and perfection comparison.
- [CS17] Definitions 4.3.6 and §5.2, pp. 716–718, 732–733: The Mantovan tower and its alternating
   cohomology class.

### The CSnc test-function package

Target `csnc-test-functions` (definition).

Use G=G_(2n) for F=F+F_0 and p split in F_0 as in CSnc §5.6. For auxiliary sets S_pf(N_0)⊂S_pf(N),
   write φ=φ_p φ_Spf φ^S. Initially φ_p on J_b(Q_p) is acceptable in the Newton-slope sense of ET.5;
   φ^S is the base-change image of an unramified GL_(2n) test function; at S_pf use the
   characteristic functions of the sufficiently small principal congruence levels specified in CSnc.
   For each elliptic endoscopic G_vecn choose the transferred finite functions and the real
   Lefschetz function f_vecn,∞. Retain the Haar measures, transfer-factor L-map and normalized
   θ-intertwiner.

Hypotheses.

- Use all field, split-prime, small-level and set inclusions in CSnc §5.6.
- Acceptability restricts φ_p at first; the extension to arbitrary φ_p is a separate theorem.

Construction or proof route.

1. Use ET.5 acceptability to construct the Newton/Levi transfer at p.
2. Use the split auxiliary-place transfer and the unramified base-change map elsewhere.
3. Use the real Lefschetz function with the source infinity type.
4. Record characteristic-function volumes and the endoscopic coefficient without replacing them by
   normalized unit functions.

Proposed API (reader targets unless expressly prototyped).

- `IgusaTests.ofAcceptable` (constructor): Assemble the test package from acceptable φ_p and the specified finite levels.
- `IgusaTests.endoscopic` (projection): Give the selected transfer for each elliptic endoscopic datum.
- `IgusaTests.infinity` (projection): Give the normalized Lefschetz test function.
- `IgusaTests.volume` (compatibility): Track each unnormalized characteristic function under a change to a Hecke idempotent.

Unit tests.

- `IgusaTests.zeroLocal` (degenerate): φ_p=0 makes every endoscopic and geometric trace zero.
- `IgusaTests.badAuxiliary` (non-example): A principal-congruence level not satisfying the stated smallness and auxiliary-place conditions is not admitted by the source theorem.
- `IgusaTests.characteristic` (computation): At an auxiliary compact level K, 1_K=vol(K)e_K; its trace includes that volume.

Uses.

- CSnc, Theorem 5.6.1: The geometric trace is expanded against this exact package.
- CSnc, Lemma 5.6.2: Its tensor factors separate the p, auxiliary and unramified contributions.

Acceptance checks.

- All three finite parts and the infinity test function are present.
- The case φ_p=0 is admissible and every trace vanishes.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/rational-igusa-object`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/twisted-spectral-normalization`.

Source matching.

- [CSnc] §5.6 setup and Theorem 5.6.1, pp. 74–75: The exact finite test functions, auxiliary sets and
   infinity input.
- [CSnc] Definition 5.3.1, p. 68: The transferred functions: the p-component is the function of Shin
   2010 §6 (the same as in CS17), auxiliary places use Langlands–Shelstad transfer, the unramified
   part uses the L-morphism and infinity uses Euler–Poincaré functions.

### Normalized Newton reduction to the inner form

Target `newton-reduction` (construction).

Define Red_b,vecn:Groth(G_vecn(Q_p))→Groth(J_b(Q_p)) by summing over the effective endoscopic Levi
   triples and allowed Levi embeddings, applying their signed normalized opposite-parabolic Jacquet
   functors, the specified L-map transfer (normalized induction among products of GL groups), and
   the Langlands–Jacquet map to the inner form. Include the transfer character and modulus factor
   belonging to the selected ET.5 test-function normalization. In Shin’s conventions
   Red=(n-Red)⊗barδ_(P(ν_b))^(1/2). CS17 §5.4 prints Red as the untwisted composite of the three
   steps (Shin’s n-Red); by the confirmed erratum PAPER-CARAIANI-SCHOLZE-17/E74 the twist is needed
   for CS17 Lemma 5.4.2, so the twisted Red is the one defined here, and CSnc’s use of CS17’s Red is
   read the same way (EndoscopicTransferAndUnitaryTraceComparison/E4). A naive unsigned
   Jacquet-then-JL composition is insufficient.

Hypotheses.

- Fix b, its Levi M_b, inner form J_b, effective endoscopic triples and transfer factors.
- The exact CSnc/CS17 character/modulus conversion is an ET.5 supplier requirement.

Construction or proof route.

1. Enumerate effective Levi triples and admissible embeddings.
2. Apply the normalized Jacquet functor for the prescribed opposite parabolic with its transfer sign.
3. Apply the endoscopic GL-product map and signed Langlands–Jacquet transfer.
4. Insert the prescribed modulus/character twist and prove additivity on Grothendieck groups.

Proposed API (reader targets unless expressly prototyped).

- `NewtonRed.apply` (constructor): Apply the signed sum of Jacquet, GL transfer and inner-form maps.
- `NewtonRed.add` (structure): Red is additive on virtual representations.
- `NewtonRed.factor` (characterisation): Expose its effective Levi terms, signs and normalization character.
- `NewtonRed.trace` (compatibility): The character pairs with the ET.5 transferred test function.
- `NewtonRed.localProduct` (functoriality): At split p, independent field factors factor with the specified central factor.

Unit tests.

- `NewtonRed.fullGroup` (degenerate): For vecn=(2n), the effective endoscopy reduces to the single Levi M_b term, with its transfer sign.
- `NewtonRed.virtualNegative` (computation): Red(−[π])=−Red([π]); no positivity follows.
- `NewtonRed.innerFormSign` (non-example): Omitting e_p(J_b) for a nonsplit inner form breaks the transferred trace equality.

Uses.

- CS17, Lemma 5.4.2; CSnc, Lemma 5.6.2: It gives the explicit p-local character in the spectral
   expansion.
- IgusaVarietiesAndTorsionConcentration:IG.5: The rational spectral support is fed to a separate
   residual application.

Acceptance checks.

- For the full endoscopic group the effective set is a singleton, but the inner-form sign remains.
- For a proper endoscopic group all allowed Levi contributions are retained.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.5`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/local-unitary-base-change`, `SmoothRepresentationsOfLocalGroups:SR.2`.

Source matching.

- [CS17] §5.4, Remark 5.4.1 and Lemma 5.4.2, pp. 739–740: The three-step construction (printed without
   the modulus twist, corrected by PAPER-CARAIANI-SCHOLZE-17/E74) and the trace compatibility of
   Lemma 5.4.2.
- [Shin] §5.5, (5.14)–(5.16), pp. 36–37 (author copy): The signed opposite Jacquet functor and modulus
   twist.

### Test transfer is dual to Newton reduction

Target `red-trace-duality` (theorem).

For acceptable φ_p and the fixed transfer φ_vecn,p, every virtual π_p on G_vecn(Q_p) satisfies tr
   π_p(φ_vecn,p)=tr Red_b,vecn(π_p)(φ_p). This identity is exact in the chosen measures and
   normalization; each transfer step is dual to the corresponding representation step. The local
   identity is for acceptable φ_p, where φ_vecn,p is defined; the global trace expansion that uses
   it is extended to arbitrary compactly supported smooth φ_p by the Frobenius-twist argument of
   Shin 2009, Lemma 6.4, as in the proofs of CS17 Lemma 5.5.1 and CSnc Lemma 5.6.2.

Hypotheses.

- Use the signed and normalized reduction above.
- For the extension, use the ET.5 acceptable-function extension theorem.

Construction or proof route.

1. Pair normalized opposite Jacquet modules with the constant-term transfer.
2. Factor transfer through M_b and use the signed inner-form character identity.
3. Apply the GL-product induction transfer and the modulus twist.
4. Multiply the test by sufficiently large Frobenius powers so it is acceptable, use the finite
   Weil-character exponential identity, then recover power zero with the same finite-level trace
   distribution.

Acceptance checks.

- The equality is tested on a nontrivial inner form and a proper endoscopic datum.
- An extension by simply declaring all φ_p acceptable fails.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/newton-reduction`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/csnc-test-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5`.

Source matching.

- [CS17] Lemma 5.4.2, p. 740: The local trace identity, valid for the twisted Red of
   PAPER-CARAIANI-SCHOLZE-17/E74; with the printed untwisted composite it fails for non-basic b.
- [CSnc] Proof of Lemma 5.6.2, pp. 75–76: The local reduction and acceptable-function extension input.

### The signed source Igusa trace identity

Target `signed-igusa-trace` (theorem).

For the CSnc test package, tr(φ|[H_c(Ig^b,Λ)])=τ(G)Σ_vecn ε_vecn I_spec^(G_vecn θ)(f_vecn θ), where
   the sum is over the source elliptic endoscopic groups and ε_vecn=1/2 for the balanced proper
   datum vecn=(n,n), and 1 for the other listed data. All global signs and normalization constants
   inside the invariant distributions are retained. This exact identity is not replaced by the
   unsigned linear-span statement in Lemma 5.6.2.

Hypotheses.

- φ_p is acceptable: CSnc §5.6 assumes this in the first instance and Theorem 5.6.1 is proved under
   it; only the factorized expansion is extended to arbitrary φ_p.
- Use the source datum, τ(G), transferred functions and real Lefschetz normalization.
- The alternating class and its finite-level smooth traces are well defined.

Construction or proof route.

1. Apply the ET.5 geometric Igusa trace expression and its stabilization.
2. Use ET.4 to compare the stable distribution with the twisted GL distribution.
3. Insert the explicit endoscopic automorphism coefficient for each vecn.
4. Use the independent invariant geometric/spectral trace identity to replace the geometric
   distribution by I_spec.

Acceptance checks.

- For the balanced proper datum the coefficient is 1/2, not 1.
- The zero φ_p boundary case gives zero on both sides.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/rational-igusa-object`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/csnc-test-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/red-trace-duality`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/twisted-spectral-normalization`.

Source matching.

- [CSnc] Theorem 5.6.1, pp. 74–75: The exact τ(G) and ε_vecn source identity.

### Finite spectral factorization with virtual coefficients

Target `local-factorization` (theorem).

After fixing the CSnc test package, the rational alternating Igusa trace lies in the finite span of
   terms tr(Red_b,vecn(π_vecn,p)(φ_p)) · tr(Π_vecn,Spf(f_vecn,Spf)A_Spf) ·
   tr(ζ_vecn,*Π_vecn^S(f_2n^S)). Here Π_vecn is a θ-stable irreducible isobaric automorphic
   representation whose infinity component is cohomological for one of the coefficient systems
   Ξ(φ_vecn) entering f_vecn,∞ (none of them is trivial when vecn is proper:
   PAPER-CARAIANI-SCHOLZE-17/E77 and EndoscopicTransferAndUnitaryTraceComparison/E5), π_vecn,p is
   its split-p base-change preimage, and Red is the twisted reduction above
   (PAPER-CARAIANI-SCHOLZE-17/E74, EndoscopicTransferAndUnitaryTraceComparison/E4). The coefficients
   are virtual spectral coefficients; no sign, multiplicity or positivity is supplied merely by the
   span assertion.

Hypotheses.

- Finiteness is for fixed infinity type and fixed finite test functions/levels, not a uniform finite
   list over all levels.
- Use split-p injectivity to define the required preimage.

Construction or proof route.

1. Insert the independent twisted spectral decomposition and residual Levi classification.
2. Factor the test-function tensor product and normalized intertwiner into the three finite parts.
3. Use local trace duality to replace the p component by Red.
4. Retain the exact signed identity separately; CSnc’s span proof explicitly suppresses some constants
   and signs.

Acceptance checks.

- A noncuspidal isobaric constituent is not discarded.
- Terms with the same unramified eigencharacter are grouped with their summed virtual coefficient.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/signed-igusa-trace`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/red-trace-duality`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/twisted-spectral-normalization`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/residual-spectrum-classification`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/cohomological-base-change`.

Source matching.

- [CSnc] Lemma 5.6.2 and Remark 5.6.3, pp. 75–76: The finite factorization and possible repeated
   eigencharacters; its “trivial algebraic representation” clause and its untwisted Red are
   corrected as recorded in EndoscopicTransferAndUnitaryTraceComparison/E4–E5.
- [CS17] Lemma 5.5.1, pp. 741–743: The analogous isobaric spectral factorization, as corrected by
   PAPER-CARAIANI-SCHOLZE-17/E74 and E77.

### Separation of unramified Hecke characters

Target `hecke-character-separation` (theorem).

At fixed finite level and infinity type, the distinct unramified GL_(2n) eigencharacters appearing
   in the finite spectral expansion are linearly independent as functions on the spherical Hecke
   algebra. Thus varying f_2n^S isolates the total virtual coefficient of each eigencharacter.
   Distinct endoscopic or Levi contributions with the same image character need not be separated:
   their contributions sum in the same coefficient.

Hypotheses.

- Use the finite list of characters in the fixed-level expansion and characteristic-zero coefficients.
- The unramified parameter map is the specified ζ_vecn,* map.

Construction or proof route.

1. Identify distinct isobaric GL representations by strong multiplicity one.
2. Apply linear independence of distinct algebra characters on a finite list, choosing a separating
   finite product of local Hecke operators.
3. Use this separation to isolate the coefficient distribution in φ_p.
4. Retain coincidences under the endoscopic parameter map as one virtual coefficient rather than
   assigning positivity to each term.

Acceptance checks.

- Two different characters can be separated by some finite Hecke operator combination.
- Repeated copies of the same character cannot be independently separated.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/local-factorization`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/residual-spectrum-classification`.

Source matching.

- [CS17] Corollary 5.5.2 and Remark 5.5.3, p. 743: Linear independence of unramified Hecke characters
   and the nonuniqueness of endoscopic contributions; the first assertion of Corollary 5.5.2 holds
   only for the total contribution of a Hecke eigensystem (PAPER-CARAIANI-SCHOLZE-17/E79), which is
   the form used here.
- [CSnc] Remark 5.6.3, p. 76: The same Hecke eigensystem may have multiple endoscopic origins.

### Rational Igusa export without concentration

Target `rational-trace-export` (application).

Export to IG.5 and AG2.1b the fixed-level rational trace expansion, its unramified eigencharacter
   support, and the exact local Red factorization with virtual coefficients. A client may infer a
   rational support constraint or a localized virtual trace equality. Inferring an actual cohomology
   constituent, integral nonvanishing, torsion control or middle-degree concentration requires its
   own additional theorem; these claims are not consequences of an alternating trace identity.

Hypotheses.

- Use the signed identity for exact coefficients and the span theorem for support.
- Higher consumers import the early rational object defined in this part.

Construction or proof route.

1. Package the three-part factorization and character-separation maps.
2. State the exact coefficient data needed for each rational client.
3. List separately the integral and concentration hypotheses a stronger client must prove.
4. Check that there is no return dependency from IG.5 or AG2 compatibility.

Acceptance checks.

- An acyclic two-term complex with cancellation is not declared zero in cohomology.
- The export is independent of integral concentration.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/signed-igusa-trace`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/local-factorization`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/hecke-character-separation`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/rational-igusa-object`.

Source matching.

- [CSnc] §5.6, pp. 74–76: The rational virtual trace supplier.
- [LTXZZ] Lemma 6.1.11, pp. 267–268: The later non-Eisenstein boundary/concentration application needs
   independent residual Galois input.

## ET.7. Coherent exports and worked normalization checks

### A finite signed coefficient ledger

Target `finite-coefficient-ledger` (definition).

For a finite set s of spectral terms and rational numbers mult_i, sign_i, local_i, bad_i, unram_i,
   define comparisonTrace(s)=Σ_(i∈s) mult_i sign_i local_i bad_i unram_i. The fields stand
   respectively for virtual spectral multiplicity, the endoscopic/inner-form coefficient, local Red
   trace, auxiliary twisted trace and spherical eigenvalue. This finite calculation is a
   normalization check on a fixed test package; it is not a definition of the infinite automorphic
   trace formula.

Hypotheses.

- Every analytic/spectral finiteness and trace identity has already been proved before instantiating
   the ledger.

Construction or proof route.

1. Use the factorization theorem to enumerate the finite terms.
2. Store the virtual multiplicity separately from the sign/endoscopic constant.
3. Form the finite sum on the existing rational carrier.
4. Check additivity and invariance under merging terms with identical remaining trace factors.

Proposed API (reader targets unless expressly prototyped).

- `comparisonTrace` (constructor): Evaluate the finite signed coefficient sum on the existing rational carrier.
- `comparisonTrace_addMultiplicity` (structure): Adding multiplicity functions adds the trace.
- `comparisonTrace_zeroLocal` (simp): If every local factor is zero, the trace is zero.
- `comparisonTrace_merge` (compatibility): Terms with the same sign and three trace factors combine by adding virtual multiplicities.
- `comparisonTrace_eq_trace_diagonal` (compatibility): Over all of a finite index type, the ledger equals the Mathlib trace of the diagonal matrix whose entries are the five-fold products.

Unit tests.

- `comparisonTrace.balanced` (computation): One term with mult=signless traces=1 and endoscopic coefficient 1/2 evaluates to 1/2.
- `comparisonTrace.cancellation` (computation): Two terms with identical trace factors and multiplicities 1 and −1 have sum zero.
- `comparisonTrace.innerForm` (computation): A term with multiplicity 2, sign −1 and trace factors 3,5,7 evaluates to −210.
- `comparisonTrace.matrixTrace` (compatibility): For two terms with products 2 and 3 the ledger equals Matrix.trace of the diagonal matrix diag(2,3), namely 5.

Uses.

- ET.7 normalization checks: Concrete coefficients catch erased signs, volumes and multiplicities.
- Suggested.lean: Only this finite existing-carrier calculation is suggested in Lean; the heavy
   representation objects remain reader targets.

Acceptance checks.

- A negative coefficient is legal and must remain negative.
- A balanced proper endoscopic contribution includes its factor 1/2.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/local-factorization`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/signed-igusa-trace`, `mathlib:Matrix.trace`, `mathlib:Matrix.trace_diagonal`.

Source matching.

- [CSnc] Theorem 5.6.1 and Lemma 5.6.2, pp. 74–76: The exact signed and factorized trace expressions
   motivate separate coefficients.

### Torus transfer and measure conversion

Target `torus-measure-check` (theorem).

For identity transfer on a local torus T with matching Haar measures, orbital integral at t is
   evaluation f(t), stable and ordinary conjugacy coincide, and the transfer factor is one. For a
   compact open K⊂T, e_K=1_K/vol(K), so for a smooth character χ trivial on K, tr χ(1_K)=vol(K) and
   tr χ(e_K)=1; if χ is nontrivial on K the corresponding traces are zero. Rescaling Haar measure by
   c rescales the characteristic-function trace by c and rescales e_K by c^(−1).

Hypotheses.

- Use identity endoscopy and the same quotient measure on the trivial conjugacy orbit.

Construction or proof route.

1. Compute the torus conjugacy orbit, which is a point.
2. Integrate the character over K and use its trivial/nontrivial alternatives.
3. Track the measure in the idempotent normalization.
4. Insert this calculation into the pure and Igusa transfer conventions.

Acceptance checks.

- At vol(K)=3 the trivial character trace of 1_K is 3, not 1.
- A nontrivial character on K integrates to zero.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/transferable-level`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/csnc-test-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`.

Source matching.

- [AC] Chapter I, §4–§5, pp. 40–50: Associated test functions and the unramified base-change
   homomorphism.
- [LTXZZ] Definition D.2.1, p. 369: Characteristic functions, not automatically normalized
   idempotents, are transferred.

### Unramified GL₂ Satake check

Target `unramified-gl2-check` (theorem).

For normalized unramified GL_2(E) principal series with Satake eigenvalues α,β, vol(GL_2(O_E))=1,
   the characteristic function of K diag(varpi_E,1) K has eigenvalue q^(1/2)(α+β); the central
   double coset of varpi_E I has eigenvalue αβ. The normalized Hecke polynomial is X²−q^(−1/2)T_1
   X+T_2. Under unramified cyclic degree-r base change the eigenvalues become α^r,β^r.
   Geometric-Frobenius parameters invert the corresponding arithmetic-Frobenius eigenvalues; the
   q-half factors stay attached to the stated normalized Satake map.

Hypotheses.

- Normalized induction, fixed q^(1/2), the standard L-embedding and the stated Haar measure.
- T_2 is the central double coset, not the second elementary Hecke operator under a different scaling.

Construction or proof route.

1. Use the normalized Satake transform and its modular-character factor.
2. Compute the two elementary symmetric functions of α,β.
3. Apply the local cyclic norm/Satake base-change map.
4. Invert the Weil Frobenius convention explicitly instead of changing only one coefficient.

Acceptance checks.

- For α=2, β=3 the normalized polynomial is X²−5X+6.
- For r=2 it becomes X²−13X+36 at the parameter level.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/cyclic-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/local-unitary-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/tower-conventions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`.

Source matching.

- [AC] Chapter I, §4 and the end of §5, pp. 40–50; Theorem 6.2, pp. 51–52: The Satake base-change map
   raises unramified parameters to the extension degree.

### Proper unitary endoscopy and coefficient check

Target `proper-endoscopy-check` (theorem).

For the CSnc balanced elliptic endoscopic datum G_(n,n) of G_(2n), the standard parameter map is the
   block direct sum with the specified endoscopic character twists, and the source exact Igusa trace
   has coefficient ε_(n,n)=1/2. The twisted spectral normalization has its own Levi determinant
   factor; it is not an additional replacement for ε. The corresponding Red sum uses the effective
   Levi embeddings and transfer signs of this proper datum.

Hypotheses.

- Use the source’s fixed L-embedding and character choices from ET.4/5.
- The check tests the proper datum, not only the full-rank identity endoscopy.

Construction or proof route.

1. Construct the two-block L-parameter with the source character twists.
2. Compute the automorphism coefficient ε for the balanced endoscopic datum.
3. Compare the signed Igusa identity with the normalized twisted spectral coefficient ledger.
4. Use local Red trace duality for the same proper datum.

Acceptance checks.

- A single normalized spectral term contributes half its unit coefficient before the other specified
   factors.
- Dropping one effective Levi term can change the virtual local coefficient.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/signed-igusa-trace`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/newton-reduction`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/twisted-spectral-normalization`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7/finite-coefficient-ledger`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4`.

Source matching.

- [CSnc] Theorem 5.6.1, p. 75: The balanced proper endoscopic coefficient.
- [Shin] Remark 4.10 and §5.5, pp. 28, 36–37: Distinct spectral determinant and local reduction
   factors.

### Division-algebra transfer and sign check

Target `division-inner-form-check` (theorem).

For GL_2(E) and its quaternion division inner form D×, the Jacquet–Langlands character relation on
   matching regular elliptic elements has sign (−1)^(2−1)=−1. The trivial D× representation
   transfers to the Steinberg GL_2 representation, whose elliptic character is the negative of the
   trivial inner-form character. In a Red trace the inner-form/Kottwitz sign must agree with the
   transferred test-function normalization; equality without that sign is rejected.

Hypotheses.

- Matching elliptic elements and transfer measures/factors come from ET.4/5/6.
- This is the nontrivial inner-form acceptance example.

Construction or proof route.

1. Use the independent local Jacquet–Langlands character theorem from ET.6.
2. Specialize to the trivial D× representation and identify its Steinberg transfer.
3. Evaluate the elliptic character relation.
4. Trace the same sign through the local Red/test transfer and the finite coefficient ledger.

Acceptance checks.

- At rank two the elliptic sign is −1.
- At rank one D=E and the corresponding sign is +1.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/newton-reduction`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/red-trace-duality`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7/finite-coefficient-ledger`.

Source matching.

- [Dat] §2.1, pp. 6–12, in particular Remark 2.1.14, p. 10; Theorem 4.1.2, p. 28: The
   Jacquet–Langlands conventions (in the Grothendieck group the elliptic representations of a type
   differ from the discrete series by the sign (−1)^|I|) and their relation to tower factors.
- [Shin] §5.5–§5.6, pp. 36–42: The sign enters the inner-form trace transfer.

### Coherent automorphic and Igusa exports

Target `coherent-exports` (application).

Provide separate imports for ET.7a pure automorphic transfer and ET.7b rational Igusa trace
   comparison, plus their joint export. Coherence consists of conversion theorems for
   arithmetic/geometric Frobenius, half Tate twists, inverse-pullback/dual Hecke action, normalized
   versus unnormalized induction, Haar idempotents, Kottwitz signs and virtual stable
   multiplicities. The five acceptance examples are the torus measure calculation, unramified GL_2
   parameters, balanced proper unitary endoscopy, quaternion inner form, and CSnc’s exact trace with
   φ_p=0. These tests do not remove the recorded primary-source and action-dictionary gaps.

Hypotheses.

- Each branch satisfies its own hypotheses; clients need only the branch they consume.
- Exact coefficients require the signed identity, while the factorization alone supplies virtual
   support.

Construction or proof route.

1. List the shared convention choices and compare their effects on each branch.
2. Run the torus, GL_2, proper-endoscopic and division-inner-form calculations with the selected
   functions.
3. Use the zero local-function boundary case to test the signed Igusa identity.
4. Export the pure branch independently to AG2.2 and the rational branch to AG2.1b/IG.5 without reverse
   edges.

Acceptance checks.

- A pure-branch client has no IG.5 prerequisite.
- A rational Igusa client receives no integral concentration assertion.

Inputs. `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/cohomological-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/oldform-dimensions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/rational-trace-export`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7/torus-measure-check`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7/unramified-gl2-check`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7/proper-endoscopy-check`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7/division-inner-form-check`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7/finite-coefficient-ledger`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/fs-normalization-contract`.

Source matching.

- [CSnc] §5.6, pp. 74–76: The signed rational trace export.
- [LTXZZ] Appendices C.3 and D.2, pp. 363–364, 368–371: The pure relevant packet and oldform
   comparison exports.
- [FS] IX.7.4, p. 338: The independent two-tower consumer normalization target.

## Exact supplier requests

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2

Add an early local p-divisible/formal-module supplier after Dieudonné theory: deformation
   representability with full Drinfeld levels for one-dimensional formal O_E modules and special O_D
   modules; SW13 5.1.4, 5.1.6 and 5.2.1 with Hodge–Tate subspace and vector-bundle exact sequence,
   including the SW20 covariant conversion and O_E-linear specialization. This is an explicit
   scope-extension request, not a claim that R07.2 already has those local results. Move the local
   classification out of T2 and assign its FF bundle prerequisites below this supplier.
   FiniteFlatGroupsAndIntegralPadicHodgeTheory is now TauCetiRoadmap pull request #879; its R07.2
   (Dieudonné theory, R07.2.1–R07.2.29) contains no Rapoport–Zink or Drinfeld-level moduli and no
   SW13 §5 classification, so this scope extension has to be made in that pull request, in a Part II
   of that roadmap, or by planning the classification in ET.6a itself.

Needed by: `lubin-tate-tower`, `drinfeld-tower`, `infinite-level-moduli`, `basic-modification-functor`, `rational-igusa-object`.

### PerfectoidSpaces:P5

Finite-level étale-object descent, the tilde-limit topology and completed affinoid colimit, with
   compatible descent of compact supports through cofinal levels. Supply the topos-level statement
   required for equivariant tower cohomology; a space limit alone is insufficient.

Needed by: `perfectoid-limit`, `equivariant-cohomology-comparison`, `stein-mittag-leffler`.

### DiamondsAndVStacks:D6

The diamond associated to a classical analytic adic space, full faithfulness and compatibility with
   the marked untilt and group actions for the classical tower-fibre comparison.

Needed by: `basic-modification-functor`, `stein-mittag-leffler`.

### ClassicalAdicEtaleCohomology:H1:formal-adic-comparison

Comparison of formal-model generic-fibre nearby cycles with analytic cohomology on finite
   tower/compact-unitary levels, including pullback, proper trace and Weil descent. Do not use the
   higher Galois compatibility theorem.

Needed by: `equivariant-cohomology-comparison`, `raw-compact-unitary-cohomology`.

### LefschetzPencilsAndVanishingCycles:LPV.6

Nearby-cycle functors and the perverse/spectral-sequence formalism on the actual compact unitary
   integral model with stratum restriction, coefficient local systems and inertia. No Harris–Taylor
   stratum calculation is assumed to be contained in this general supplier.

Needed by: `raw-compact-unitary-cohomology`, `unitary-nearby-cycle-decomposition`.

### DiamondSixOperations:S2

Non-quasicompact compactifiable proper-support pushforward and finite étale pullback/trace in all
   required dimensions n−1, plus the analytic comparison of support functors. The classical H3 curve
   theory alone is inadequate for n>2.

Needed by: `tower-compact-support`, `rational-igusa-object`.

### AdicCoefficientsAndComparisons:L0

At a fixed finite level, adic coefficient complexes as derived inverse limits over ell^r, derived
   reduction and scalar extension, followed by the separate smooth level colimit; no unproved
   interchange of these limits.

Needed by: `tower-compact-support`, `rational-igusa-object`.

### SmoothRepresentationsOfLocalGroups:SR.0

Smooth group representations over Λ, equivariant derived complexes with additional abstract W_E
   action, exact characteristic-zero compact-mod-centre sector extraction, tensor/Hom dual
   convention, and compatible level colimits.

Needed by: `tower-compact-support`, `central-quotient-sector`.

### SmoothRepresentationsOfLocalGroups:SR.2

Normalized opposite-parabolic Jacquet functors, normalized induction and trace duality with constant
   terms, including additivity on Grothendieck groups.

Needed by: `newton-reduction`.

### LocallyAnalyticDistributions:L0

Locally analytic vectors in the rank-two tower affinoid function spaces, their analytic-radius
   topology and continuous Lie-algebra differentiation. Pan22’s explicit local-series and Higgs
   compatibility input must be assigned once within this lower analytic direction.

Needed by: `gross-hopkins-vector-fields`, `analytic-vectors-under-duality`.

### AutomorphicFormsOnReductiveGroups:AF.2

Cuspidal automorphic representations with unitary central character, normalized restricted tensor
   products and square integrability modulo the centre.

Needed by: `speh-representation`.

### AutomorphicFormsOnReductiveGroups:AF.5

For the standard definite unitary datum: identification of the degree-zero cohomology of the Shimura
   sets with algebraic automorphic forms on the compact-at-infinity unitary group (functions on
   finite adelic double cosets), compatibly with Hecke operators and with the decomposition into
   automorphic representations with trivial infinity component. This is the definite case of the
   oldform count; it is not integral or Igusa concentration.

Needed by: `oldform-dimensions`.

### AutomorphicFormsOnReductiveGroups:AF.4

Cohomological representations of the real unitary group U(N−1,1)×U(N)^(d−1) and the (g,K)-cohomology
   (Matsushima) description of the Π-eigenspace of the cohomology of the standard indefinite unitary
   Shimura variety for relevant Π: every contributing π is cuspidal and tempered, contributes only
   in degree N−1, and each of the N discrete series with Harish-Chandra parameter
   {(1−N)/2,…,(N−1)/2} contributes one dimension. Characteristic zero only; not integral or Igusa
   concentration.

Needed by: `oldform-dimensions`.

### AutomorphicSpectralTheory:AS.4

The discrete and continuous automorphic spectral decomposition with fixed unitary central character,
   normalized Langlands quotients, meromorphic normalized Eisenstein intertwiners, their
   Rankin–Selberg factors and residue calculus. These are inputs to the MW target here; the residual
   Speh classification in this part supplies the resulting GL discrete data.

Needed by: `speh-representation`.

### EndoscopicTransferAndUnitaryTraceComparison:ET.4

Independent stable/twisted unitary trace identities with all L-embeddings, transfer factors,
   measures, Lefschetz infinity functions and normalized intertwiners. Also provide generic unitary
   packet relevance and multiplicity formulas (Mok/KMSW generic theorem as used in LTXZZ C.3.1),
   local unitary quotient base change, special-maximal packet comparisons, small-level transfer, and
   general-type GL4/GSp4 transfer. Relocate cyclic BC/AI to proposed ET.4b before ET.6; neither
   later Igusa concentration nor AG2/FS agreement may prove these inputs.

Needed by: `tower-conventions`, `raw-compact-unitary-cohomology`, `global-extraction`, `cyclic-base-change`, `twisted-spectral-normalization`, `weak-unitary-base-change`, `cohomological-base-change`, `local-unitary-base-change`, `relevant-packet-multiplicity`, `definite-indefinite-switches`, `transferable-level`, `oldform-dimensions`, `csnc-test-functions`, `newton-reduction`, `signed-igusa-trace`, `proper-endoscopy-check`, `gsp4-solvable-descent-interface`.

### EndoscopicTransferAndUnitaryTraceComparison:ET.3

Associated endoscopic/base-change test functions, local fundamental lemmas and normalized Satake
   maps for the fixed split, hyperspecial and cyclic unramified cases.

Needed by: `cyclic-base-change`, `transferable-level`.

### EndoscopicTransferAndUnitaryTraceComparison:ET.5

Independent geometric Igusa trace/stabilization and the explicit effective-Levi/Newton transfer
   theorem, including signs, opposite Jacquet convention, modulus/character twists, factorization
   through the inner form and the Frobenius-shift extension from acceptable functions (Shin09 Lemma
   6.4). Import the rational-Igusa object after its proposed relocation to early ET.5a before ET.5;
   the current ET.7b stage label must not be used as an ET.5 prerequisite. This resolves the
   ordering only once the maintainer applies the move.

Needed by: `csnc-test-functions`, `newton-reduction`, `red-trace-duality`, `signed-igusa-trace`.

### EndoscopicTransferAndUnitaryTraceComparison:ET.6

Classical characteristic-zero GL_n LLC and JL with division invariant, duality, central character,
   reciprocity and unramified twists. Audit the independent cyclic BC/AI input and reorder it to
   ET.4b. Supply elliptic JL character sign and compatibility of local unitary GL quotient
   parameters; no tower or FS realization is imported to define rec.

Needed by: `tower-conventions`, `global-extraction`, `supercuspidal-dat-sector`, `fs-normalization-contract`, `local-unitary-base-change`, `division-inner-form-check`.

## Gaps and certification gates

### Harris–Taylor and Boyer primary proof access

The full Harris–Taylor book is neither cleared in atlas-library/INDEX.md nor freely accessible from
   an authorized copy found in this run. Dat credits Theorem 4.1.2 to Boyer and proves it by
   translating notation and applying Boyer’s theorem; Boyer’s computation (arXiv:math/0511531,
   freely available; Invent. Math. 177 (2009)) rests on Harris–Taylor’s global realization. Neither
   Boyer’s paper nor the Harris–Taylor book has been read for this plan. The raw compact unitary
   integral model, Newton-stratum nearby-cycle decomposition, global extraction, actual
   supercuspidal concentration and scalar normalization have a target-level plan but no
   independently read book proof or precise internal theorem/page locators. Obtain/register the
   book, then match its exact statements and proof chain. The packet is planned, not
   source_decomposed or closed.

Affected targets: `raw-compact-unitary-cohomology`, `unitary-nearby-cycle-decomposition`, `global-extraction`, `supercuspidal-dat-sector`.

### Independent Dat-to-FS action dictionary

The literal Dat sector and Weil contragredient are stated exactly. FS IX.7.4 witnesses the requested
   normalized Hecke outputs but cannot independently prove their convention conversion. Read the
   Harris–Taylor dictionary and check the source-torsor right actions, contragredient, inverse
   transpose, central quotient, [n−1] and ((n−1)/2) normalization before certifying the FS export.
   An arithmetic/geometric Frobenius substitution alone cannot invert an arbitrary nonabelian Weil
   representation.

Affected targets: `fs-normalization-contract`.

### Early local formal-module and classification supplier

R07.2 currently plans Dieudonné theory, not the entire O_E/O_D deformation/classification interface
   requested here. The SW13 local classification and SW20 sign conversion must move below the tower
   and below relative T2. The general representation of the special O_D formal moduli also needs its
   primary proof (Drinfeld/Rapoport–Zink or the source explicitly proving the specialization); SW13
   duality alone is not that integral representability proof.
   FiniteFlatGroupsAndIntegralPadicHodgeTheory is now TauCetiRoadmap pull request #879, whose R07.2
   stops at Dieudonné theory over perfect valuation rings (R07.2.29); the classification can only be
   added there, in a Part II, or planned in ET.6a.

Affected targets: `lubin-tate-tower`, `drinfeld-tower`, `infinite-level-moduli`, `basic-modification-functor`.

### Primary pure-transfer and packet proofs

LTXZZ 3.2.8 cites Shin’s cohomological base change (their reference [72], Theorem 1.1) and, for
   definite V, Labesse (their reference [42], Corollaire 5.3), C.3.1 cites the generic KMSW
   classification, and D.2.2 cites Morel/small-level transfer. Their exact consumer statements were
   read, but this part does not certify those independently unread primary proofs. ET.4 must supply
   the requested independent pure-transfer, generic packet, small-level and GSp4 classification
   contracts. Local LLC in ET.6 does not automatically supply all global unitary packet members.

Affected targets: `cohomological-base-change`, `relevant-packet-multiplicity`, `definite-indefinite-switches`, `transferable-level`, `oldform-dimensions`, `gsp4-solvable-descent-interface`.

### Early cyclic base-change ordering repair

The confirmed langlands red-team finding /1 identifies a classical LLC route in ET.6 that already
   needs cyclic base change. The current stage placement of BC/AI in ET.7a is therefore too late.
   These target nodes remain in this issue’s current scope but are marked for relocation to a new
   ET.4b after ET.3/4 and AS.6, before ET.6; there is no ET.7a→ET.6 prerequisite in this packet.
   This ordering proposal is not an integrated atlas change and must be applied before packaging.

Affected targets: `cyclic-base-change`, `cyclic-automorphic-induction`, `global-extraction`, `supercuspidal-dat-sector`.

### Early Igusa geometry and rational trace move

The higher IG.0/IG.1 packet already records the central leaf, liftable torsors, Mantovan/perfect
   tower and rational Euler class. WORKERS requires their early clauses to move down to this part
   and be relocated to an ET.5a supplier before ET.5. Leaving the object under ET.7b while importing
   the entire ET.7b stage into ET.5 would create a cycle: the signed trace target already imports
   ET.5. The lower PEL/finite-flat suppliers must cover the exact p-divisible isomorphism and
   liftable-automorphism proofs, including CSnc 2.2.7 and CS17 4.3.15 used in their construction.
   Redirect those higher clauses to the early node; compactified fibres, integral cohomology and
   concentration remain IG.

Affected targets: `rational-igusa-object`, `signed-igusa-trace`, `rational-trace-export`.

### Exact Newton-transfer conventions and acceptable extension

CS17 and Shin expose the reduction construction and trace identity. The primary transfer identities
   and the Frobenius-shift extension used by CSnc cite Shin09/10 and signed inner-form JL. ET.5 must
   match the complete CSnc normalization, including its modulus/character twist and every effective
   Levi embedding. The span proof intentionally drops some signs; it cannot supply the exact signed
   constants on its own.

Affected targets: `newton-reduction`, `red-trace-duality`, `signed-igusa-trace`, `local-factorization`.

### Analytic local-series and Higgs input

Pan v1 5.2.8 refers to Pan22 for its full local-series proof and explicitly notes an additional
   Higgs-field compatibility check on the toric chart. This was not independently proved here. The
   lower analytic supplier must provide the input and the explicit normalization constant in the
   operator comparison must remain nonzero but unspecified until coordinates are fixed.
   Publication-number correspondence for the 2026 Annals version has not been checked.

Affected targets: `analytic-vectors-under-duality`.

### All-dimensional support comparison

The classical curve compact-support roadmap H3 cannot alone construct C_T for arbitrary n. The lower
   diamond support and coefficient bundle must provide the all-dimensional analytic/tower topos
   support comparison and its equivariant cofinal descent. The Dat result is a target theorem with
   its proof route, not a claim that generic perfectoid limit machinery already proves it.

Affected targets: `tower-compact-support`, `equivariant-cohomology-comparison`.

## Ownership proposals

Confirmed RT-AREA-langlands-1/1: ET.6 classical LLC needs cyclic BC/AI currently placed after it.

Create ET.4b after ET.3/ET.4 and AS.6, requiring AutomorphicSpectralTheory:AS.6, ET.3 and ET.4. Move
   cyclic-base-change (with Arthur–Clozel Chapter I §6: Theorem 6.2, Proposition 6.7, Lemma 6.10)
   and cyclic-automorphic-induction (Chapter III §§4 and 6) there, and add Harris–Taylor’s base
   change from their unitary group (Harris–Taylor §VI: VI.1.1, VI.2.1, VI.2.9–VI.2.10), which this
   part could not read. Add the edges ET.4b→ET.6, ET.4b→ET.7a and
   ET.4b→GL2AutomorphicRepresentationsAndTransfer:R17.4. ET.6 itself still needs explicit targets
   for Harris’s non-Galois automorphic induction (Scholze, Local Langlands for GL_n, §13) and
   Henniart’s highly-ramified-twist argument (§14). Keep ET.7a pure cohomological unitary transfer
   and residual Speh comparison. The current packet retains the assigned scope pending this
   decision.

Confirmed RT-AREA-padic-1/25: SW13 local classification must precede T2 and the towers.

Add an early local p-divisible stage after R07.2, with the independent geometric FF bundle
   classification and the SW13 5.1.4/5.1.6/5.2.1 proof chain; route T2, IG.3 and ET.6a to it. Do not
   import relative T2 back into the classical tower construction.
   FiniteFlatGroupsAndIntegralPadicHodgeTheory is now TauCetiRoadmap pull request #879, so the new
   stage is either an addition to that pull request or a Part II of it; planning the classification
   in ET.6a is the alternative if neither is wanted.

Confirmed RT-AREA-geomlanglands/2 and current HS3/classical-comparison overlap: tower comparison
   needs one owner and direction.

ET.6a owns the narrow basic minuscule fibre and the LT/Dr specialization of SW20 24.2.5/24.3.5.
   Redirect HS3 tower clauses and ES7 to these nodes. General HS2 local-shtuka construction and the
   general EL/PEL integral comparison remain with their owners. No ET.6a→HS3 dependency; HS3 and ES7
   consume ET.6a. Delete the atlas stage edge HeckeStacksAndLocalShtukas:HS2→ET.6a: no ET.6a node
   uses HS2 (the basic fibre is built from FarguesFontaineDiamonds F4 and DiamondsAndVStacks D6),
   and HS2 lies outside the Caraiani–Newton tiers. Point ES7:GLn-comparison’s import sentence and
   HS2’s “match with known local Shimura moduli” clause at ET.6a/classical-tower-fibre-comparison.

WORKERS upstream tier rule moves higher raw geometry and rational Igusa inputs down before ET.

Move only the early compact-unitary raw model/cohomology clauses of AG2.1a and the
   central-leaf/Mantovan/perfect-tower/rational Euler-class clauses of IG.0/IG.1 needed by this part
   to ET.6a and a proposed early ET.5a rational-Igusa supplier before ET.5, respectively. The
   rational object is retained in the assigned ET.7b scope until that move is approved; the trace
   theorem stays ET.7b. Higher stages import these nodes; global Galois representations, boundary
   localization, compactified fibres, integral concentration and residual applications stay with
   AG2/IG.

## Mistakes in the sources

The following mistakes were found at the cited places. Every node above uses the corrected
   statements.

### EndoscopicTransferAndUnitaryTraceComparison/E2 (misprint, affects nothing)

[Dat] §3.2.2, p. 18, and §3.2.3, p. 19 (author PDF of Invent. Math. 169 (2007)).

Printed: The Lubin–Tate deformation functor is written as a union of height components indexed by
   the natural numbers (h∈N, and once by an undefined index set H), and the level-zero space as the
   union over h∈N.

Correction: The height h of the framing quasi-isogeny ranges over Z, and the unions are over h∈Z.

Reason: Quasi-isogenies of every integer height occur (compose with powers of the uniformizer), the
   decomposition is stated for all heights in the preceding sentence, and the Drinfeld side (§3.1.3,
   p. 16) uses h∈Z; the D×-action of §3.2.4 moves heights by negative amounts as well.

Known: new. Searched: the author PDF on the author’s page (only version available to this review);
   the published Inventiones version was not accessible to this review.

### EndoscopicTransferAndUnitaryTraceComparison/E3 (misprint, affects nothing)

[Dat] Theorem 4.1.2, p. 28 (author PDF of Invent. Math. 169 (2007)).

Printed: The isomorphism H_c^{d−1+i}[ρ]≅π_ρ^{≤i}⊗σ(π_ρ^∨)|·|^{(d_ρ−d)/2−i} is asserted for 0≤i≤d−1,
   while π_ρ^{≤i}=π_ρ^{{1,…,i}} is defined only for {1,…,i}⊆S_ρ, i.e. for i≤d_ρ−1 (Convention
   2.1.13).

Correction: The formula holds for 0≤i≤d_ρ−1, and H_c^{d−1+i}[ρ]=0 for d_ρ≤i≤d−1 (equivalently, set
   π_ρ^{≤i}=0 there).

Reason: The proof identifies H_c^{d−1+i}[ρ] with the dual of Boyer’s U^{d−1−i}(ρ) and applies
   Boyer’s theorem, which describes U^{d−d_ρ+i} for 0≤i≤d_ρ−1 and gives zero in the other degrees;
   the substitution i↦d_ρ−1−i in the proof covers exactly the range 0≤i≤d_ρ−1. For supercuspidal ρ
   (d_ρ=1) this is the concentration in degree d−1 used by supercuspidal-dat-sector.

Known: new. Searched: the author PDF on the author’s page (only version available to this review);
   the published Inventiones version was not accessible to this review.

### EndoscopicTransferAndUnitaryTraceComparison/E4 (error, affects a stated result)

[CSnc] §5.6, Lemma 5.6.2 and its proof, pp. 75–76, and the proof of Theorem 5.1.2, p. 77 (author
   copy; the same text in arXiv:1909.01898v2).

Printed: The p-factor of each term is tr(Red(π_p^vecn)(φ_p)), with Red the morphism of CS17 §5.4,
   obtained from tr π_p^vecn(φ_p^vecn) by CS17 Lemma 5.4.2, where φ_p^vecn is the function of Shin
   2010 §6 (Definition 5.3.1(1), p. 68).

Correction: Use Red=n-Red⊗δ̄^{1/2}_{P(ν_b)} (Shin 2011 §5.5), or evaluate the untwisted composite at
   φ_p·δ̄^{1/2}_{P(ν_b)}; the p-local representations π_j=Red(π_p^vecn) of the proof of Theorem
   5.1.2 change by the same twist.

Reason: This is PAPER-CARAIANI-SCHOLZE-17/E74 inherited: CSnc takes Red from CS17 §5.4, where it is
   printed as the untwisted three-step composite, and takes φ_p^vecn from Shin 2010 §6, whose
   construction transfers φ_p·δ̄^{1/2}; CS17 Lemma 5.4.2 holds only for the twisted Red. For
   non-basic b the twist changes central characters, so the printed expansion is off. Whether the
   last assertion of Theorem 5.1.2 (the parameter of π_{j,v}|·|^{1/2−n}) needs the corresponding
   unramified twist was not determined in this review.

Known: new. Searched: arXiv:1909.01898 v1 and v2 listing (v2 checked: same text); Annals of
   Mathematics article page for 199 (2024), 483–590 (no erratum listed); Crossref record of
   doi:10.4007/annals.2024.199.2.1 (no update relation); the atlas extraction
   PAPER-CARAIANI-SCHOLZE-24 (not recorded there).

### EndoscopicTransferAndUnitaryTraceComparison/E5 (error, affects a stated result)

[CSnc] §5.6, Lemma 5.6.2, last sentence but one of the statement, p. 75 (author copy; the same text
   in arXiv:1909.01898v2).

Printed: Each Π^vecn_∞ is asserted to be cohomological with respect to the trivial algebraic
   representation.

Correction: Π^vecn_∞ is cohomological with respect to Ξ(φ_vecn) for one of the discrete parameters
   φ_vecn with ζ̃_vecn∘φ_vecn the parameter of the trivial representation of G_2n; for vecn=(2n)
   this is the trivial representation, for proper vecn=(n_1,n_2) none of them is. Π^vecn is still
   regular and C-algebraic, which is all that the later arguments use.

Reason: This is PAPER-CARAIANI-SCHOLZE-17/E77 inherited. The test function at infinity is a
   combination of Lefschetz functions for the Ξ(φ_vecn) (p. 74). In CSnc the endoscopic twist
   multiplies both blocks by ϖ^{ϵ(n_i)} with ϵ(n_1)=ϵ(n_2) because n_1+n_2=2n (p. 68), so two
   trivial blocks would give two runs of exponents with the same centre, while the exponents of the
   trivial parameter of GL_{2n} split into runs centred at n_2/2 and −n_1/2.

Known: new. Searched: arXiv:1909.01898 v1 and v2 listing (v2 checked: same text); Annals of
   Mathematics article page for 199 (2024), 483–590 (no erratum listed); Crossref record of
   doi:10.4007/annals.2024.199.2.1 (no update relation); the atlas extraction
   PAPER-CARAIANI-SCHOLZE-24 (not recorded there).

The CS17 errata recorded in the paper extraction PAPER-CARAIANI-SCHOLZE-17 are used throughout
   ET.7b: E74 (the reduction map needs the modulus twist), E77 (at infinity the contributing
   representations are cohomological for the endoscopic coefficient systems, not the trivial one)
   and E79 (Corollary 5.5.2 holds for the total contribution of a Hecke eigensystem).

## Source versions read

All statements above are mathematical paraphrases. No source passage is reproduced.

### [SW13] Moduli of p-divisible groups

Peter Scholze and Jared Weinstein. arXiv:1211.6357, cleared author PDF; printed page numbering of
   that file.

URL: https://arxiv.org/abs/1211.6357

SHA-256: `984411ef6c3d735a713684d4c9251fbad411a40eab33cefed8ab5c8412b09f6d`. Read 2026-10-14.

- §5.1, Theorem 5.1.4 and Proposition 5.1.6, pp. 49–50; Theorem 5.2.1, p. 51
- §6.3, Theorem 6.3.4 and universal-cover description, pp. 59–61
- Theorem 6.4.1, pp. 64–66; §6.5, pp. 66–68
- §§7.1–7.3, especially Proposition 7.2.2 and Theorem 7.2.3, pp. 69–73

Maintainer-cleared copy read in place under atlas-library; no copy or passages saved.

### [SW20] Berkeley lectures on p-adic geometry

Peter Scholze and Jared Weinstein. Authors’ March 27, 2020 version of Annals of Mathematics Studies
   207.

URL: https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf

SHA-256: `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc`. Read 2026-10-14.

- Lecture 24, §§24.2–24.3, pp. 226–231; Theorem 24.2.5 and Corollary 24.3.5 with their proofs

Maintainer-cleared copy read in place under atlas-library; no copy or passages saved.

### [Dat] Théorie de Lubin–Tate non-abélienne et représentations elliptiques

Jean-François Dat. Author PDF of Invent. Math. 169 (2007), 75–152; internal printed pages.

URL: https://webusers.imj-prg.fr/~jean-francois.dat/recherche/publis/LT.pdf

SHA-256: `4973a260e5af4b046652956ad63e95a412fb82873cdecc6bd585c85e1aa4a04d`. Read 2026-10-14.

- §§2.1–2.2, pp. 6–14
- §§3.1–3.5, pp. 15–27; Theorem 3.4.1 and Corollary 3.4.2, p. 24; Lemma 3.5.13, p. 27
- §4 and §4.1, Theorem 4.1.2 (credited to Boyer) and its proof, which translates Harris–Taylor’s and
   Boyer’s notation, pp. 28–29

### [CSnc] On the generic part of the cohomology of non-compact unitary Shimura varieties

Ana Caraiani and Peter Scholze. Author copy noncompact.pdf (90 pages; its text and page numbers
   agree with arXiv:1909.01898v2 at every place cited here); published in Annals of Mathematics 199
   (2024), 483–590.

URL: https://www.ma.imperial.ac.uk/~acaraian/papers/noncompact.pdf

SHA-256: `9c9b723d20f35af25f45c236224fb3a4d72c57379ea54759a3b609f4092d8eb5`. Read 2026-10-14.

- §§2.2–2.3, liftable automorphisms, central leaves and finite Igusa torsors, pp. 14–20
- §5.3, Definition 5.3.1 and Theorem 5.3.2, p. 68
- §5.6, pp. 74–76; Theorem 5.6.1, Lemma 5.6.2 and Remark 5.6.3

### [CS17] On the generic part of the cohomology of Shimura varieties

Ana Caraiani and Peter Scholze. Annals of Mathematics 186 (2017), 649–766, published PDF.

URL: https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf

SHA-256: `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a`. Read 2026-10-14.

- §4.3, Definitions 4.3.1 and 4.3.6, Remark 4.3.7 and Proposition 4.3.8, pp. 715–718
- §5.2 rational alternating cohomology, pp. 732–733
- §5.4, pp. 739–740; Lemma 5.4.2
- §5.5, pp. 741–743; Lemma 5.5.1, Corollary 5.5.2 and Remark 5.5.3

### [Shin] Galois representations arising from some compact Shimura varieties

Sug Woo Shin. Author StableGal.pdf of Ann. Math. 173 (2011), 1645–1741; internal 60-page numbering.

URL: https://math.berkeley.edu/~swshin/StableGal.pdf

SHA-256: `93f4fe322200a646f337ae8d4aa9a036a866df1bb59ad5fe7bf09373324da75b`. Read 2026-10-14.

- §4, Proposition 4.8, Remark 4.10 and Corollary 4.14, pp. 28–30
- §5.1, compact PEL datum and component convention, pp. 30–31
- §5.5–§5.6, signed reduction and trace duality, pp. 36–42

### [AC] Simple algebras, base change, and the advanced theory of the trace formula

James Arthur and Laurent Clozel. Annals of Mathematics Studies 120 (1989), author archive hosted by
   Clay; scanned printed pages.

URL: https://www.claymath.org/library/cw/arthur/pdf/30.pdf

SHA-256: `3033d863634f5a1e8c26e48ba5b5ec9d8f95fb411b2a6d21c1580db80bc01737`. Read 2026-10-14.

- Chapter I §§4–5, unramified base-change map and associated functions, pp. 40–50
- Chapter I §6, Definition 6.1 and Theorem 6.2 with reduction/proof, pp. 51–57
- Chapter I §6, Proposition 6.7, p. 59, and Lemma 6.10, p. 62
- Chapter III §4, Theorem 4.2 and the cyclic alternatives, pp. 202–203
- Chapter III §6, Definition 6.1, Theorem 6.2 and induction-by-stages proof, pp. 214–217

### [MW] Le spectre résiduel de GL(n)

Colette Mœglin and Jean-Loup Waldspurger. Ann. Sci. École Norm. Sup. (4) 22 (1989), 605–674,
   published Numdam scan.

URL: https://www.numdam.org/article/ASENS_1989_4_22_4_605_0.pdf

SHA-256: `a46e3549d05d2cd39f396ef326840f4484f3935ff3daa17e6339091962de9e94`. Read 2026-10-14.

- Introduction and §I.1, pp. 605–607; §I.11, pp. 640–643
- §II.3 spectral decomposition and its corollary, pp. 647–649; surrounding residue argument

### [LTXZZ] On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives

Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu. Invent. Math. 228 (2022), 107–375,
   cleared published NSF copy.

URL: https://doi.org/10.1007/s00222-021-01088-4

SHA-256: `dd821abd2b06233cb69cdc88de242b689686d5f2ce0c2072128abcd54ec89d97`. Read 2026-10-14.

- Definitions 3.2.3 and 3.2.7; Proposition 3.2.8, pp. 144–146
- Lemma 6.1.11 and proof, pp. 267–268 (consumer boundary only)
- Appendix C.1 local base change, pp. 351–352; Proposition C.2.5, p. 362; C.3, Proposition C.3.1 and
   Corollaries C.3.2–C.3.3, pp. 363–364
- Appendix D.2, pp. 368–371, setup, Definition D.2.1, Lemma D.2.2 and Proposition D.2.3

Maintainer-cleared copy read in place under atlas-library; no copy or passages saved.

### [CDN20] Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1

Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł. arXiv:1704.08928 author copy; JAMS 33 (2020),
   311–362 is the publication, whose numbering is not substituted.

URL: https://arxiv.org/pdf/1704.08928

SHA-256: `15e4868f5b11ad113e2806b5e9884d7b100f529e67c6cd6030f24cf8e3ae9073`. Read 2026-10-14.

- §4.2, Proposition 4.8, pp. 38–39, Gross–Hopkins vector fields
- §5.1, Proposition 5.1, p. 40, ell-adic dictionary (context only)

### [CDN23] Factorisation de la cohomologie étale p-adique de la tour de Drinfeld

Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł. Forum of Mathematics, Pi 11 (2023), e16,
   published Cambridge PDF, 62 pages.

URL: https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf

SHA-256: `b007a4e37b824ca5986ac6152ed9fabcf38dde97e16d8f5f7f60756fe77d3418`. Read 2026-10-14.

- §0.2.1, p. 4, central quotient and arithmetic descent
- §3, Lemma 3.10 and Corollary 3.11, pp. 35–36, Stein-cover Mittag–Leffler

### [Pan] On locally analytic vectors of the completed cohomology of modular curves II

Lue Pan. arXiv:2209.06366v1, 14 September 2022; preprint theorem/page numbering, not Annals 203
   (2026).

URL: https://arxiv.org/pdf/2209.06366

SHA-256: `0873b61a758c57a9c5567f8e9ed7d905adcb7b359013a24e680facd1027b31b4`. Read 2026-10-14.

- §§5.2.2–5.2.4, pp. 55–57, GM and HT geometry
- Theorem 5.2.8 and Corollary 5.2.10, pp. 59–60
- §5.3, Theorems 5.3.4 and 5.3.8, Corollary 5.3.9, pp. 63–65
- §§5.3.19–5.3.21, p. 67, differential operator comparison

### [BCGP] Modularity theorems for abelian surfaces

George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni. arXiv:2502.20645 author copy; internal
   printed pages.

URL: https://arxiv.org/pdf/2502.20645

SHA-256: `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c`. Read 2026-10-14.

- §1.8.22, p. 15, general-type GL4/GSp4 transfer
- Proposition 7.5.3 and proof, p. 175, solvable descent
- Lemma 10.2.4 and proof, p. 213, quadratic Hecke-character induction

### [FS] Geometrization of the local Langlands correspondence

Laurent Fargues and Peter Scholze. arXiv:2102.13459v4; IX.7.4 used solely as an output-signature
   witness.

URL: https://arxiv.org/pdf/2102.13459v4

SHA-256: `1f8040751d3424f59ae56651d990d7b2d5030e6b7cae58bc2fc683358dfc2027`. Read 2026-10-14.

- IX.7.3–IX.7.4, pp. 337–338, the two normalized tower outputs and consumer proof

The issue’s CDN23 Lemma 3.3 locator is corrected to published Lemma 3.10,
pp. 35–36. This corrects the source route, not the published mathematics. Pan
locators refer to v1; the 2026 Annals pagination has not been substituted. Dat’s
Theorem 4.1.2 is credited to Boyer and its proof applies Boyer’s computation,
which rests on Harris–Taylor’s global realization; the FS theorem is only the
consumer signature. Neither citation is treated as access to the missing
independent global proof.
