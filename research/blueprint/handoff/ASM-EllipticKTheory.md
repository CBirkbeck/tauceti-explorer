# ASM-EllipticKTheory — assembly handoff

Job: ASM-EllipticKTheory, issue #6417. Agent: Codex. Session: codex-z1tiYB.

## Result and scope

The assembly is complete. The assembled reader covers E.1–E.8 and the two
reviewed continuations in one dependency-ordered document: 53 parent nodes,
11 E.5 nodes and six E.6 nodes, with all 87 API entries, 59 test contracts and
13 selected planets. Its title and boundaries follow accepted RS-18:
**Elliptic curves, Part II: scheme K-theory and arithmetic symbol classes**,
building first on Tau Ceti's EllipticCurves roadmap. The introduction fixes
rank–degree–point coordinates, residue signs, arithmetic Frobenius and Tate
twists, marked arithmetic models, scope and supplier ownership.

The suggested file has one standard note and one import block. It combines the
parent signature forms, the E.5 actual Weierstrass point subgroup and the E.6
marked-model category/local comparisons. It retains one RegularProperModel and
one genericInclusion; the latter's pullback.fst is definitionally the pinned
TauCeti.genericFiberι. E.6 imports the actual TauCeti.Model and scalar-extension
APIs. No library substitute, new supplier definition or claimed implementation
was introduced. Missing supplier types and geometric test instances remain
explicit named comments. The parent's supplier variables specify intended
signatures only after instantiation with the genuine APIs and their laws.

Only the parent packet, assembled reader, assembled suggested file and this
handoff were edited. The E.5/E.6 packets and their separate readers/prototypes
remain untouched. All three review objects are unchanged. All nodes remain
unchecked. The mathematical roadmap is still partial because E.5's general
producer extensions and interfaces remain requests; assembly completion does
not assert closed coverage or formalization.

## Reviewed-node changes requiring attention

No statement, hypothesis, definition, API contract, test, acceptance condition,
source citation, planet or implementation status was changed in a packet.
The following parent proof-plan and dependency changes reconcile the accepted
continuations and should be checked by the assembly reviewer. In particular,
this records changes to a reviewed node's proof plan explicitly for the
orchestrator's re-review decision.

- E.5/harder-finiteness now depends on the exact node
  EllipticKTheory:E.5/harder-elliptic-input-closure. It replaces the nonexistent
  N.3:finite-generation/proper-curve-finite-generation and
  T.2:symbols/milnor-global-positive-characteristic producer IDs. Proof steps
  1, 2 and 5 now use the reviewed closure's distinct exact normed reciprocity
  plus origin splitting, degree-two tame kernel, higher Milnor vanishing, and
  affine-complement/localization finite-generation contracts. The conclusion
  and the Geisser–Levine/localization steps are unchanged.
- E.5/an-elliptic-curve-over-a-finite-field now directly cites the reviewed
  geometric modules, positive descent, odd groups, even groups and order nodes.
  E.6/good-reduction-primes-impose-no-condition now directly cites the positive
  odd-group node supplying the finite K₁ of a good special fibre.
- Parent request 32 now routes higher Milnor vanishing and tame-kernel finiteness
  to the T.5 global-function-field extension. Exact normed reciprocity is the
  separate T.4 request of E.5/harder-elliptic-input-closure; T.2:graded-map is a
  comparison map and supplies no vanishing theorem.
- Parent E.5 coverage remains partial and points to the explicit E.5 supplier
  obligations. E.6 becomes source_decomposed, with its old arithmetic uniqueness
  gap removed because the six reviewed E.6 continuation nodes now supply the
  complete proof plan. This does not declare those planned nodes implemented.
  The remaining parent finite-field gap summarizes the three E.5 gaps below.

The assembled reader uses the current accepted packet contracts when a part
reader lags its review: notably E.6's three added API entries and its corrected
minimal-model localization argument. For S⊆S′, the finite set of removed primes
is a principal open after taking a suitable power, by the imported torsion
class-group/localization theorem. Retained DVRs and their minimal models are
then unchanged. The assembly did not change that reviewed mathematics.

## Validation and exact Lean limit

All three `python3 scripts/check_blueprint.py` runs passed with zero errors and
zero warnings. Their definition/construction counters are:

| Packet | Nodes | Definition/construction API | Definition/construction tests | Planets | Baseline | Gaps | Requests |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| EllipticKTheory | 53 | 50 | 35 | 6 | 59 | 1 | 33 |
| EllipticKTheory--E.5 | 11 | 6 | 5 | 4 | 7 | 3 | 15 |
| EllipticKTheory--E.6 | 6 | 14 | 3 | 3 | 10 | 0 | 2 |

The full inventory also includes theorem APIs/tests; its totals are 87/59.
The combined graph has 70 unique nodes, no dangling same-roadmap node references,
no cycles and no forward references in the reader. The same-roadmap references
cross part boundaries by exact node IDs. External planning prerequisites and
Tau Ceti layer requests remain supplier obligations, not library declarations.
E.5 has five combined planets and E.6 four; every layer stays within the limit.
Reader anchors/file links and declaration/API/test inventories were checked.
The packet diff preserves all review objects and statement/hypothesis contracts.
`git diff --check` passed.

The pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. Relevant existing Tau Ceti model,
generic-fibre projection and scalar-extension declarations were read from
Git objects at that Tau Ceti pin. The shared Mathlib build is at its pin;
there is no usable prebuilt Tau Ceti Model.Basic/Fibers dependency there.

The full `lean-check research/blueprint/suggested/EllipticKTheory.lean` failed
at the import TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic
because its .olean is absent. It did not reach full-file elaboration. Nothing
was built or fetched, and no Lake project or language server was started.

A temporary subset in the same allowed suggested file elaborated successfully:
remove both `import TauCeti.*` lines and the complete
`section LocalComparison` through `end LocalComparison`, leaving all other
code intact. `lean-check` then returned exit 0, no errors and 81 warnings, all
`declaration uses 'sorry'`. This checks the merged Mathlib signature forms,
the E.5 actual point subgroup's six APIs, its five tests and order signature,
and the E.6 marked-model category/minimality/terminal-isomorphism forms and
partial test signatures. It does not check the omitted local Tau Ceti comparison,
missing higher K/coefficient/cohomology/Tate signatures, geometric examples or
any admitted proof. The complete file was restored afterward. Subsequent Lean
edits add named comments only and do not alter the checked code.

For full validation, run the same full-file lean-check in an existing build
whose prebuilt Tau Ceti dependencies match the pin; do not build the libraries
for this job. If those modules remain unavailable, the subset recipe above
reproduces the limited check without introducing any additional Lean file.

## Remaining work and where to resume

Nothing remains to assemble. Independent assembly review should check the
recorded proof-plan/reference reconciliation and the reader's correspondence
with all three accepted packets. General producer work, actual supplier API
instantiation and full Tau Ceti elaboration are the next mathematical/formalization
steps, rather than omissions silently discharged by this assembly.

For Harder, start at E.5/harder-elliptic-input-closure and the N.3/T.5/M.5d
requests. For the positive computation, proceed through geometric modules,
continuous Frobenius descent, positive K descent, odd/even formulas and orders.
Keep coefficient degree n+1, the i−1 twist in the odd coefficient table,
continuous rational cohomology only in twists j≥2, and arithmetic Frobenius
q^iπ in B_i. For arithmetic minimality, follow the E.6 category → finite global
contractions → terminality → local criterion → marked uniqueness → S-localization
chain. Incoming terminality is a theorem, not the minimality definition.

The four gap records (one parent summary and three E.5 substantive records)
are collected here. The retired parent E.6 uniqueness gap has been supplied at
the planning level by the accepted E.6 continuation.

### EllipticKTheory gap 1: Finite-field computation: routed inputs still awaiting their proofs

E.5/harder-elliptic-input-closure gives the exact N.3:finite-generation global-function-field extension, T.5 higher Milnor vanishing/tame-kernel extension and M.5d Geisser–Levine contracts. E.5/geometric-elliptic-k-modules, E.5/elliptic-cohomology-frobenius-descent and E.5/finite-elliptic-k-descent give the remaining coefficient, cohomology and Frobenius interfaces, including H.6, EDC.2, R01.1, R34.2 and upstream elliptic inputs. The three gap records of the E.5 packet retain these supplier obligations; no route is an implemented theorem.

Consumers: `EllipticKTheory:E.5/an-elliptic-curve-over-a-finite-field`.

### EllipticKTheory--E.5 gap 1: Global function-field producer extensions remain unplanned

N.3 finite generation and the T.5 extension for higher Milnor vanishing and the finite prime-to-p tame kernel need the precise contracts requested here. Neither the number-field packets nor nonexistent IDs mentioned by the parent fix count as supplied declarations. T.2:graded-map supplies the comparison map, not the vanishing theorem. The general results remain owned by their general suppliers.

Consumers: `EllipticKTheory:E.5/harder-elliptic-input-closure`.

### EllipticKTheory--E.5 gap 2: Geisser–Levine and coefficient descent interfaces are missing at the pins

M.5d must supply the Quillen comparison, and M.6/M.7 must supply the actual curve spectral sequence/comparison with degree ranges, edge splittings and limit compatibilities. A list of cohomology groups is not a construction of the spectral sequence. The elliptic computation is conditional on these requests. H.6 must provide the scheme-spectrum universal-coefficient sequence, compatible coefficient transition maps and divisible-coefficient colimit; the ring-only L.1 interface does not fill this gap.

Consumers: `EllipticKTheory:E.5/harder-elliptic-input-closure`, `EllipticKTheory:E.5/geometric-elliptic-k-modules`, `EllipticKTheory:E.5/finite-elliptic-k-descent`.

### EllipticKTheory--E.5 gap 3: Geometric/continuous cohomology and upstream Tate interfaces are requested

The curve Kummer/trace calculation, continuous finite-field Hochschild–Serre and Tate-lattice/isogeny point comparisons have exact owners and requests, but are not library declarations at the pins. Missing supplier types are left as explicit omissions in the suggested Lean file; no conclusion-bearing substitute is introduced.

Consumers: `EllipticKTheory:E.5/geometric-elliptic-k-modules`, `EllipticKTheory:E.5/elliptic-cohomology-frobenius-descent`, `EllipticKTheory:E.5/positive-even-elliptic-k-groups`, `EllipticKTheory:E.5/elliptic-k-group-orders`.

## Collected restructuring proposals and upstream notes

All ten part records follow, preserving their proposals and their originating
packet/position. The six parent records include decisions already settled by
RS-18; they are not six new changes to apply. The four E.5 Part II proposals
carry the genuinely missing general contracts to their existing owners.

Interpret the final parent RT boundary record's “N.3 supplies the function-field
branch” as the requested extension below, not existing number-field work. The
E.5 review confirmed that the producer nodes cited by the parent fix did not
exist. Likewise the broader parent M.7 request is refined by the E.5 requests:
curve trace/Kummer belongs to EDC.2, continuous cohomology to R01.1 and elliptic
Weil/degree/Tate facts to upstream EllipticCurves. M.7 retains its comparison
role. No general results are reassigned to this consumer.

### EllipticKTheory restructure 1: E.1's scheme construction is owned over a base by the Tau Ceti modular-curves roadmap

**kind**: note-duplicate-boundary

**detail**: E.1's scheme, its properness and smoothness, and the comparison of its points and group law with the point group over a field are ModularCurves layers 1A, 1B and 1D, and the scheme isogenies layers 2A and 2B, a Tau Ceti roadmap that is never re-planned (PROTOCOL section 15). The packet had built the field case anyway. The accepted restructuring RS-18 narrowed E.1 accordingly; REV-EllipticKTheory brought the nodes into line.

**action**: rescope

**roadmaps**: EllipticKTheory, tauceti:TauCetiRoadmap/ModularCurves

**proposal**: Settled by RS-18: E.1 imports ModularCurves 1A, 1B, 1D, 2A, 2B, AlgebraicCurves 12 and EllipticCurves 1 and keeps the interface (charts, zero section, integrality and regularity in the form the Tau Ceti divisor API consumes), the function-field identification, the points comparison and the isogeny comparison including the zero morphism. No further change.

### EllipticKTheory restructure 2: The roadmap document does not record two pinned Tau Ceti theorems that settle half of E.2

**kind**: note-missing-record

**detail**: Tau Ceti proves, complete, that the points of a Weierstrass curve over a field are the degree-zero divisor classes of its function field, that the divisor class group of an order system with a weight-one rational point splits by degree, and (for E.7) that n(T) − n(O) is principal at an n-torsion point. The roadmap document recorded none of them; RS-18 now names EllipticCurves layers 0 and 2 as their owners.

**action**: rescope

**roadmaps**: EllipticKTheory

**proposal**: Settled by RS-18 for ownership; the roadmap document should cite pointEquivDegreeZeroDivisorClass and classGroupAddEquivPicZeroProdInt in E.2 and exists_principal_zsmul_pointPlace_sub_infinity in E.7, as this packet does.

### EllipticKTheory restructure 3: E.6's arithmetic-surface half is owned by the Tau Ceti roadmap Stable reduction, layers 4 and 5

**kind**: note-duplicate-boundary

**action**: rescope

**roadmaps**: EllipticKTheory, tauceti:TauCetiRoadmap/StableReduction

**detail**: Blow-ups, intersection multiplicities of vertical divisors, the resolution and common-resolution theorems (layer 4) and regular and minimal models with the components and multiplicities of the special fibre (layer 5) are planned upstream over a discrete valuation ring; RS-18 names both as owners. E.6 keeps the K-theory and the passage to the Dedekind base O_{F,S}, which Stacks 0ADX (resolution over a Dedekind base of characteristic-zero fraction field) and 0C5S (comparison of regular models over a noetherian base) supply. This replaces the packet's proposal to split E.6. Revised by REV-EllipticKTheory.

**proposal**: No split of E.6 (settled by RS-18's narrowing): the model nodes of E.6 import StableReduction layers 4 and 5 by request. Model independence needs no blow-up formula, so the S.5 link RS-18 adds to E.6 can be pruned when the atlas is next regenerated.

### EllipticKTheory restructure 4: E.7 requires E.6

**kind**: ownership

**action**: rescope

**roadmaps**: EllipticKTheory

**detail**: E.7's integral certificates rest on E.6's vertical residues; the atlas has E.7 requiring only E.5, and RS-18 adds no such link. There is no cycle: E.6 does not depend on E.7. Added by REV-EllipticKTheory.

**proposal**: Add EllipticKTheory:E.6 to the requires of EllipticKTheory:E.7.

### EllipticKTheory restructure 5: The worked examples of E.8 and ER.8

**kind**: ownership

**action**: rescope

**roadmaps**: EllipticKTheory, EllipticRegulators

**detail**: E.8 requires a nontrivial certificate, a residue at a non-rational closed point and a bad-fibre integrality calculation; EllipticRegulators ER.8 requires a CM class with residue certificates, a non-rational torsion calculation followed by transfer, and an arithmetic-model integrality test. Added by REV-EllipticKTheory.

**proposal**: E.8 owns the K-theoretic certificates of the worked examples; ER.8 cites them and adds only regulator values.

### EllipticKTheory restructure 6: RT-AREA-ktheory-2/1,4,12: arithmetic and geometric inputs

**kind**: note-duplicate-boundary

**detail**: E.5 is now explicitly elliptic/geometrically connected. N.3 supplies the function-field branch, separate from number-field finite generation. E.3 retains finite-field integral injectivity via T.2/k2-finite-field and rational injectivity over number fields; E.7 already required E.6 and E.8 now names both arithmetic-model suppliers. Generic f_*f^* remains multiplication by [f_*O], not by degree without an additional K₀ hypothesis.

### EllipticKTheory--E.5 restructure 1: ArithmeticKTheory, EllipticKTheory

**action**: rescope

**roadmaps**: ArithmeticKTheory, EllipticKTheory

**detail**: N.3:finite-generation and its current packet are restricted to number fields; Harder requires Quillen/GQ82 for global function-field S-integers.

**proposal**: Keep the number-field work. Add “K-theory of number fields and S-integers, Part II: global function-field S-integers”, with ArithmeticKTheory as its first prerequisite. Place the requested affine finite-generation theorem and its proper-curve localization consequence in an N.3 sibling/extension at the foundational owner; E.5 imports them and retains only the elliptic Harder specialization. No new node ID is asserted before that supplier is planned.

### EllipticKTheory--E.5 restructure 2: K2SymbolsBrauer, EllipticKTheory

**action**: rescope

**roadmaps**: K2SymbolsBrauer, EllipticKTheory

**detail**: The T.5 arithmetic brief is number-field-only; III.7.2(a) gives higher Milnor vanishing and cannot prove the function-field K₂ tame-kernel theorem. T.4 presently states reciprocity as vanishing.

**proposal**: Add “Explicit K₂: symbols, residues and reciprocity, Part II: global function-field vanishing and tame kernels”, with K2SymbolsBrauer as its first prerequisite. Extend T.5 to the two separate Bass–Tate contracts and T.4 to exact global normed reciprocity/affine SK₁. Import the Milnor functor and natural graded comparison from T.2:symbols and T.2:graded-map. E.5 imports these general results and owns their elliptic application; do not create a second Milnor theory.

### EllipticKTheory--E.5 restructure 3: MotivicEtaleKTheory, EllipticKTheory

**action**: rescope

**roadmaps**: MotivicEtaleKTheory, EllipticKTheory

**detail**: M.5d’s current blueprint covers logarithmic differentials/Bloch–Gabber–Kato, without the characteristic-p Quillen comparison required by Harder.

**proposal**: Add “Motivic and étale methods for arithmetic K-theory, Part II: characteristic-p Quillen comparison”, with MotivicEtaleKTheory as its first prerequisite. Put the requested full Geisser–Levine theorem in an M.5d sibling/extension, reusing its existing Milnor/logarithmic inputs. Keep curve spectral-sequence and ordinary-to-étale comparison in their current M.6/M.7 owners. E.5 contains no general Geisser–Levine node.

### EllipticKTheory--E.5 restructure 4: ArithmeticGaloisRepresentations, EllipticKTheory

**action**: rescope

**roadmaps**: ArithmeticGaloisRepresentations, EllipticKTheory

**detail**: R01.1 needs an explicit finite-field continuous-cohomology contract; the discrete torsion statement does not justify rational ℓ-adic Hochschild–Serre.

**proposal**: Add “Arithmetic Galois representations and conductors, Part II: continuous finite-field cohomology”, with ArithmeticGaloisRepresentations as its first prerequisite. Place the procyclic continuous cohomology and coefficient-compatible Hochschild–Serre interfaces in an R01.1 extension. E.5 specializes them using the existing curve trace/Kummer and elliptic Weil inputs. Upstream Tau Ceti layers are imported unchanged.

The accepted RS-18 boundary governs the introduction where a still-pending
AlgebraicCurves link map retains older scheme-construction language. No upstream
roadmap, atlas requires list or link map was edited. The recorded E.7←E.6 edge
and unnecessary E.6←S.5 blowup-formula edge are maintainer/atlas follow-ups.

**EllipticKTheory--E.5 upstream note**: No changes to Tau Ceti roadmaps or scheme/Tate definitions are proposed. Upstream supplier requests import the existing layers and expose their required comparison contracts.

## Collected supplier requests

All 50 requests follow without dropping contracts or consumers: 33 from the
parent, 15 from E.5 and two from E.6. Numbers are one-based positions in their
packet's requests array, so each entry can be resumed directly. Overlapping
requests remain visible: the E.5 entries give the precise strengthened contracts
and route notes; the E.6 entries strengthen the imported local surface/model
interfaces without re-planning those Tau Ceti roadmaps. A supplier label is not
an assertion that the requested theorem is implemented or already planned.

### EllipticKTheory request 1 — `GeneralAlgebraicKTheory:K.1`

K_n(C) = π_{n+1}|NQ(C)| for an exact category C, with π_1 identified with ExactK0; applied through SchemeKTheoryOperations S.2 to give one functor K_n on schemes; K-theory of rings commutes with filtered colimits (used for K_2(L) = colim_S K_2(O_{L,S}) of a number field L).

Consumers: `EllipticKTheory:E.3/localisation-sequence-for-a-curve`, `EllipticKTheory:E.3/what-the-sequence-does-not-identify`, `EllipticKTheory:E.8/the-completion-criterion`.

### EllipticKTheory request 2 — `GeneralAlgebraicKTheory:K.3`

Quillen localisation for the Serre subcategory of finite-length coherent sheaves on a noetherian curve, natural in exact functors; dévissage identifying its K-theory with the sum over closed points of K_*(k(x)); and the resolution theorem. (The projection formula is not K.3's; it is S.2's.)

Consumers: `EllipticKTheory:E.3/localisation-sequence-for-a-curve`, `EllipticKTheory:E.3/naturality-of-the-sequence`, `EllipticKTheory:E.3/naturality-for-finite-transfer`, `EllipticKTheory:E.5/pullback-and-pushforward`.

### EllipticKTheory request 3 — `KTheoryFiniteLocalFields:L.1`

K_0(F_q) = Z, K_{2j}(F_q) = 0, K_{2j−1}(F_q) ≅ Z/(q^j − 1), with restriction and transfer.

Consumers: `EllipticKTheory:E.5/an-elliptic-curve-over-a-finite-field`, `EllipticKTheory:E.6/vertical-residues`.

### EllipticKTheory request 4 — `KTheoryLowDegrees:U.3`

K_1 of a field is its unit group by the determinant; for a commutative ring the stable determinant K_1(A) → A^×, SK_1(A) := its kernel, the split decomposition K_1(A) = A^× ⊕ SK_1(A), and naturality of det.

Consumers: `EllipticKTheory:E.3/localisation-sequence-for-a-curve`, `EllipticKTheory:E.3/boundaries-in-degrees-one-and-zero`, `EllipticKTheory:E.4/K1-and-SK1-of-a-curve`.

### EllipticKTheory request 5 — `KTheoryLowDegrees:Z.5`

For a one-dimensional, separated, connected, regular noetherian scheme X: rank and determinant give K_0(X) ≅ Z ⊕ Pic(X), with [O_X] = (1, O_X), [L] = (1, L) and the skyscraper at a closed point x equal to (0, O(x)). NOT the combination with the elliptic Picard decomposition, which E.2 owns (requesting it would make Z.5 depend on E.2 while E.2 depends on Z.5; restructure entry).

Consumers: `EllipticKTheory:E.2/K0-of-a-curve`, `EllipticKTheory:E.2/ring-structure-of-K0-of-a-curve`, `EllipticKTheory:E.2/K0-of-an-elliptic-curve`.

### EllipticKTheory request 6 — `KTheoryLowDegrees:Z.6`

The explicit comparison of the projective-bundle basis ([O], [O(−1)]) of K_0 of the projective line with its rank-Pic basis, which RS-18 assigns to Z.6.

Consumers: `EllipticKTheory:E.5/the-projective-line-and-the-projective-bundle-theorem`.

### EllipticKTheory request 7 — `MotivicEtaleKTheory:M.4`

For a field F: H^n(F, Z(n)) ≅ K^M_n(F) and H^i(F, Q(j)) = 0 for i > j.

Consumers: `EllipticKTheory:E.4/indecomposable-K3-sits-in-weight-two`.

### EllipticKTheory request 8 — `MotivicEtaleKTheory:M.6`

For X smooth over a field: K_m(X)_Q^{(j)} ≅ H^{2j−m}(X, Q(j)) (the rational motivic comparison E.4's stage text names); the motivic spectral sequence with its degeneration for curves over finite fields (K-book VI.4.2, VI.6.6). The coniveau tower itself is taken from S.4, not M.6a.

Consumers: `EllipticKTheory:E.4/adams-operations-and-the-weight-decomposition`, `EllipticKTheory:E.4/indecomposable-K3-sits-in-weight-two`, `EllipticKTheory:E.5/an-elliptic-curve-over-a-finite-field`.

### EllipticKTheory request 9 — `SchemeKTheoryOperations:S.2`

For noetherian schemes: derived pullback f^* on K for every morphism, functorial; proper pushforward f_* on G, and on K for proper maps of finite Tor-dimension, functorial; base change g^* f_* = f'_* g'^* for g flat (in particular for the inclusion of a generic fibre and for open immersions) and for Tor-independent squares; the projection formula f_*(x · f^*y) = f_*(x) · y in all degrees (K-book V.3.12); agreement of f_* for a finite flat map of affine schemes with the module transfer; the Cartan equivalence K ≃ G for regular noetherian finite-dimensional schemes.

Consumers: `EllipticKTheory:E.2/degree-euler-characteristic-and-pushforward`, `EllipticKTheory:E.3/localisation-sequence-for-a-curve`, `EllipticKTheory:E.3/naturality-of-the-sequence`, `EllipticKTheory:E.3/naturality-for-finite-pullback`, `EllipticKTheory:E.3/naturality-for-finite-transfer`, `EllipticKTheory:E.4/K1-and-SK1-of-a-curve`, `EllipticKTheory:E.4/rational-base-point-splitting`, `EllipticKTheory:E.4/the-coniveau-spectral-sequence-of-a-curve`, `EllipticKTheory:E.5/pullback-and-pushforward`, `EllipticKTheory:E.5/projection-formula-and-isogenies`, `EllipticKTheory:E.6/the-integral-part`, `EllipticKTheory:E.6/model-independence`, `EllipticKTheory:E.8/the-completion-criterion`.

### EllipticKTheory request 10 — `SchemeKTheoryOperations:S.3`

The localisation fibre sequence with supports, its specialisation to a DVR, a regular curve and a regular arithmetic surface 𝓔 over O_{F,S} (K(𝓔) → K(𝓔_U) → ⊕_{v∉U} G(𝓔_v), and its colimit K_2(𝓔) → K_2(E) → ⊕_v G_1(𝓔_v) for the generic fibre E), with the boundary on units and symbols identified with valuations and tame symbols (S.3's own stage text; the sign is fixed against K2SymbolsBrauer:T.3/tame-symbol in E.3).

Consumers: `EllipticKTheory:E.3/localisation-sequence-for-a-curve`, `EllipticKTheory:E.3/the-tame-symbol-boundary`, `EllipticKTheory:E.6/the-integral-part`, `EllipticKTheory:E.6/good-reduction-primes-impose-no-condition`, `EllipticKTheory:E.6/vertical-residues`.

### EllipticKTheory request 11 — `SchemeKTheoryOperations:S.4`

The codimension filtration and coniveau exact couple of G-theory with first page ⊕_{codim x = p} K_{−p−q}(k(x)) (K-book V.9.5), its identification with the localisation sequence for a one-dimensional noetherian scheme, and, on a regular two-dimensional scheme, that the composite of the degree-two boundary (tame symbols at codimension-one points) with the degree-one boundary (divisors) vanishes.

Consumers: `EllipticKTheory:E.4/the-coniveau-spectral-sequence-of-a-curve`, `EllipticKTheory:E.6/vertical-residues`.

### EllipticKTheory request 12 — `SchemeKTheoryOperations:S.5`

Homotopy invariance K_*(X × A^1) = K_*(X) for regular noetherian X, and the projective-bundle theorem K_*(P(E)) = ⊕_{i=0}^{r} K_*(X) · [O(−i)] in all degrees, with generators the powers of the tautological bundle. (The blow-up formula is not needed: E.6's model independence uses only S.2.)

Consumers: `EllipticKTheory:E.4/K1-and-SK1-of-a-curve`, `EllipticKTheory:E.4/the-coniveau-spectral-sequence-of-a-curve`, `EllipticKTheory:E.5/the-projective-line-and-the-projective-bundle-theorem`.

### EllipticKTheory request 13 — `SchemeKTheoryOperations:S.6`

Adams operations ψ^k on K_*(X) for regular X with ψ^k[L] = [L^{⊗k}] on line bundles, multiplicativity, compatibility with pullback, rational eigenspace projectors built from finitely many ψ^k, and the weight shift ψ^k ∘ i_* = k^c · i_* ∘ ψ^k for the Gysin map of a codimension-c regular closed immersion with trivial normal bundle; finite-coefficient eigenspaces with the explicit condition on the prime ℓ.

Consumers: `EllipticKTheory:E.4/adams-operations-and-the-weight-decomposition`, `EllipticKTheory:E.4/indecomposable-K3-sits-in-weight-two`.

### EllipticKTheory request 14 — `SchemeKTheoryOperations:S.7`

The self-intersection formula i^* i_*(a) = λ_{−1}(N^∨) · a for a regular closed immersion i, in particular i^* i_* = 0 for a rational point of a regular curve.

Consumers: `EllipticKTheory:E.4/rational-base-point-splitting`.

### EllipticKTheory request 15 — `tauceti:TauCetiRoadmap/ModularCurves#1a-projective-weierstrass-models`

Layer 1A: the projective Weierstrass cubic projModel W over a ring R as a closed subscheme of P^2_R with zero section [0:1:0], properness, and for W.IsElliptic smoothness of relative dimension one, with compatibility with base change. E.1 uses R = F and E.6 uses R = O_{F,S} (proper and flat, smooth where the discriminant is a unit); neither constructs the scheme again.

Consumers: `EllipticKTheory:E.1/the-elliptic-curve-as-a-scheme`, `EllipticKTheory:E.1/geometric-properties-of-the-curve`, `EllipticKTheory:E.6/existence-of-a-regular-proper-model`.

### EllipticKTheory request 16 — `tauceti:TauCetiRoadmap/ModularCurves#1b-the-points-dictionary`

Layer 1B(1): over a field K and for W.IsElliptic, sections of projModel W → Spec K are W.toAffine.Point, the zero section corresponding to the point at infinity.

Consumers: `EllipticKTheory:E.1/points-and-group-law-comparison`.

### EllipticKTheory request 17 — `tauceti:TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law`

Layer 1D(6): the scheme-theoretic group law agrees with Mathlib's group law on field-valued points.

Consumers: `EllipticKTheory:E.1/points-and-group-law-comparison`.

### EllipticKTheory request 18 — `tauceti:TauCetiRoadmap/ModularCurves#2a-group-homomorphisms-multiplication-maps-and-their-degree`

Layer 2A: projModelFunctionFieldEquiv : K(projModel W) ≃ W.toAffine.FunctionField.

Consumers: `EllipticKTheory:E.1/the-function-field-of-the-curve`.

### EllipticKTheory request 19 — `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`

Layer 2B: the kernel of an isogeny as a finite locally free group scheme of rank the degree, whose F-points are Tau Ceti's TauCeti.Isogeny.ker.

Consumers: `EllipticKTheory:E.1/isogenies-as-scheme-morphisms`.

### EllipticKTheory request 20 — `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`

Layer 12: the anti-equivalence between regular projective curves and function fields of transcendence degree one (12B, with closed points ↔ places), the specialisation to W.FunctionField giving the isogeny-to-morphism correspondence (12C), and scheme Weil divisors ↔ function-field divisors with matching degrees and principal divisors (12D).

Consumers: `EllipticKTheory:E.1/the-function-field-of-the-curve`, `EllipticKTheory:E.1/isogenies-as-scheme-morphisms`, `EllipticKTheory:E.2/picard-group-is-the-divisor-class-group`.

### EllipticKTheory request 21 — `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`

Layer A: the Picard group of a scheme as a group, Weil ↔ Cartier ↔ line bundles, Cl(X) ≅ Pic(X) for an integral noetherian scheme of dimension one with DVR local rings (the surjectivity Tau Ceti lacks), and the degree of a line bundle on a proper curve.

Consumers: `EllipticKTheory:E.2/degree-euler-characteristic-and-pushforward`, `EllipticKTheory:E.2/picard-group-is-the-divisor-class-group`.

### EllipticKTheory request 22 — `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`

Layer B: finite-dimensionality of H^i of coherent sheaves on a proper curve over a field, H^i = 0 for i ≥ 2, H^0(O) = k and the genus for a geometrically integral proper curve, and Riemann-Roch χ(L) = deg L + 1 − g.

Consumers: `EllipticKTheory:E.1/geometrically-integral-curve`, `EllipticKTheory:E.2/degree-euler-characteristic-and-pushforward`.

### EllipticKTheory request 23 — `tauceti:TauCetiRoadmap/ModularCurves#2d-picard-duality-and-comparison-of-the-duals`

Layer 2D: relative elliptic Picard duality and descent, which RS-18 names as the owner of descent for the pointed field-valued scheme; E.2 specialises it (E.2/line-bundle-descent).

Consumers: `EllipticKTheory:E.2/line-bundle-descent`.

### EllipticKTheory request 24 — `tauceti:TauCetiRoadmap/EllipticCurves#layer-0-the-function-field-places-and-divisors`

Layer 0: the function field of an elliptic curve with its places and divisors, and the degree-zero point/divisor-class identification already realised in Tau Ceti (pointEquivDegreeZeroDivisorClass), which RS-18 names as its owner.

Consumers: `EllipticKTheory:E.2/picard-decomposition-and-the-point-group`, `EllipticKTheory:E.7/symbol-certificates`.

### EllipticKTheory request 25 — `tauceti:TauCetiRoadmap/EllipticCurves#layer-05-base-change-galois-actions-translations-and-descent-cross-cutting`

Layer 0.5: Galois equivariance of P ↦ [P − O] under base change to a separable closure, used for the descent of line-bundle classes.

Consumers: `EllipticKTheory:E.2/line-bundle-descent`.

### EllipticKTheory request 26 — `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`

Layer 1: isogenies, the dual isogeny and [m] with deg [m] = m^2, E[m] étale of order m^2 when char F ∤ m, and separability.

Consumers: `EllipticKTheory:E.1/isogenies-as-scheme-morphisms`, `EllipticKTheory:E.5/class-of-the-pushed-forward-structure-sheaf`.

### EllipticKTheory request 27 — `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`

Layer 2: the ℓ-primary torsion E[ℓ^∞] ≅ (Q_ℓ/Z_ℓ)^2 over a separable closure with its Galois action (Tate module).

Consumers: `EllipticKTheory:E.5/an-elliptic-curve-over-a-finite-field`, `EllipticKTheory:E.7/principal-divisors-on-rational-torsion`.

### EllipticKTheory request 28 — `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`

Layer 3: the Frobenius trace a_q = q + 1 − #E(F_q) and the zeta function Z(E/F_q, t) = (1 − a_q t + q t^2)/((1 − t)(1 − q t)).

Consumers: `EllipticKTheory:E.5/an-elliptic-curve-over-a-finite-field`.

### EllipticKTheory request 29 — `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`

Layer 4: blow-ups with affine charts; intersection multiplicities of vertical divisors on a regular proper model over a DVR; resolution of a normal proper model of a smooth curve and common resolution of two regular proper models.

Consumers: `EllipticKTheory:E.6/the-regular-proper-model`, `EllipticKTheory:E.6/existence-of-a-regular-proper-model`, `EllipticKTheory:E.6/regular-models-linked-by-blowups`.

### EllipticKTheory request 30 — `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`

Layer 5: regular and minimal regular proper models over a DVR, uniqueness of the minimal model in positive genus, the components C_i and multiplicities m_i of the special fibre with div(π) = Σ m_i C_i. E.6 adds only the passage to O_{F,S}.

Consumers: `EllipticKTheory:E.6/the-regular-proper-model`, `EllipticKTheory:E.6/existence-of-a-regular-proper-model`, `EllipticKTheory:E.6/vertical-residues`.

### EllipticKTheory request 31 — `MotivicEtaleKTheory:M.5d`

Geisser–Levine in characteristic p: (a) K_n^M(k)/p^ν ≅ K_n(k;ℤ/p^ν), (b) K_n(k) has no p-torsion, (c) kernel and cokernel of K_n^M(k)→K_n(k) are uniquely p-divisible. Supply all three separately, with the finite-coefficient comparison and compatibility; Harder uses (c) after Bass–Tate vanishing.

Consumers: `EllipticKTheory:E.5/harder-finiteness`.

### EllipticKTheory request 32 — `K2SymbolsBrauer:T.5`

Global-function-field Bass–Tate higher Milnor vanishing and tame-kernel finiteness of order prime to p, as the extension specified in E.5/harder-elliptic-input-closure. Exact normed reciprocity and affine SK₁ vanishing remain the distinct T.4 request of that node. T.2:graded-map supplies the Milnor-to-Quillen comparison map; it does not supply higher Milnor vanishing.

Consumers: `EllipticKTheory:E.5/harder-finiteness`.

### EllipticKTheory request 33 — `MotivicEtaleKTheory:M.7`

Étale cohomology of a smooth projective geometrically connected finite-field curve, Poincaré duality, Tate twists, Weil Frobenius eigenvalue bounds, and the descent sequence used in K-book VI.6.4–6.7. This is a requested interface, not a claim these theorems are already built.

Consumers: `EllipticKTheory:E.5/an-elliptic-curve-over-a-finite-field`.

### EllipticKTheory--E.5 request 1 — `ArithmeticKTheory:N.3:finite-generation`

Extend the general Quillen arithmetic finiteness owner to global function-field S-integers: for smooth affine U/F_q, all K_n(U) are finitely generated (Quillen/GQ82, K-book IV.6.9). Export the proper smooth finite-curve consequence using localization at a nonempty finite complement. The existing N.3-finite-generation packet plans number-field rings only; its nodes do not supply these statements.

Consumers: `EllipticKTheory:E.5/harder-elliptic-input-closure`.

Route: Supplier extension requested, not an established node.

### EllipticKTheory--E.5 request 2 — `K2SymbolsBrauer:T.2:graded-map`

Export the natural graded Milnor-to-Quillen map from products, using the actual Milnor functor of T.2:symbols and preserving field functoriality. The degree-two Matsumoto isomorphism alone does not supply the higher-degree map used by Geisser–Levine. Global function-field Bass–Tate vanishing is requested from the T.5 extension, not proved here or reassigned to the presentation stage.

Consumers: `EllipticKTheory:E.5/harder-elliptic-input-closure`.

Route: Import the existing graded-map owner; no suitable blueprint node exists yet.

### EllipticKTheory--E.5 request 3 — `K2SymbolsBrauer:T.5`

Extend the general arithmetic tame-kernel owner to global function fields F=F_q(X): (a) Bass–Tate K_n^M(F)=0 for n≥3 (III.7.2(a)); (b) ker[K₂(F)→⊕_x k(x)×] is finite of order prime to p for X smooth projective geometrically integral. Export the actual theorem/proof input for n=2 separately: III.7.2(a) does not supply tame-kernel finiteness. Current T.5 is a number-field stage. The natural graded comparison is imported from T.2:graded-map.

Consumers: `EllipticKTheory:E.5/harder-elliptic-input-closure`.

Route: Supplier scope extension requires its own blueprint work; accepted parent sourceIssue E1 applies.

### EllipticKTheory--E.5 request 4 — `K2SymbolsBrauer:T.4`

In addition to Weil reciprocity as vanishing of a composite, export the global function-field exact reciprocity sequence K₂(F_q(X))→⊕_x k(x)×→F_q×→0, or an equivalent proof from affine SK₁=0 and the rational-origin localization for elliptic X. The normed map is the actual finite-field transfer. The norm condition alone is insufficient.

Consumers: `EllipticKTheory:E.5/harder-elliptic-input-closure`.

Route: Strengthened reciprocity input; parent sourceIssue E2.

### EllipticKTheory--E.5 request 5 — `MotivicEtaleKTheory:M.5d`

Export Geisser–Levine in characteristic p for every field F and n≥0: K_n^M(F)/p^r≅K_n(F;Z/p^r), K_n(F) has no p-torsion, and the kernel/cokernel of the natural map K_n^M(F)→K_n(F) are uniquely p-divisible, compatibly with products and field maps. The current M.5d packet supplies log differentials/Bloch–Gabber–Kato, not this Quillen comparison (K-book VI.4.7).

Consumers: `EllipticKTheory:E.5/harder-elliptic-input-closure`.

### EllipticKTheory--E.5 request 6 — `MotivicEtaleKTheory:M.6`

For smooth curves over finite fields and their algebraic closures, export the convergent finite/divisible-coefficient motivic K spectral sequence, its filtered-colimit, base-change, Galois and edge-map compatibility, and the split field/e-invariant summand. State ranges sufficient for positive integral groups after the universal-coefficient degree shift.

Consumers: `EllipticKTheory:E.5/geometric-elliptic-k-modules`, `EllipticKTheory:E.5/finite-elliptic-k-descent`.

### EllipticKTheory--E.5 request 7 — `MotivicEtaleKTheory:M.7`

Export ordinary-to-étale/coefficient comparison in the curve ranges used in VI.4.6.1 and VI.6.4–6.7, including ℓ=2 when ℓ≠p, continuous-coefficient limits and the specified low-degree treatment. This request does not assign curve Kummer/duality or the Weil bound to M.7.

Consumers: `EllipticKTheory:E.5/geometric-elliptic-k-modules`, `EllipticKTheory:E.5/finite-elliptic-k-descent`.

### EllipticKTheory--E.5 request 8 — `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`

Export the geometric smooth proper curve coefficient calculation H⁰=Q_ℓ/Z_ℓ(j), H¹=J(kbar)\[ℓ∞\](j−1) via Kummer/Jacobian duality, H²=Q_ℓ/Z_ℓ(j−1) via normalized trace, and vanishing above two. Retain Galois equivariance and compatibility of integral/rational/divisible coefficients; the elliptic origin identifies J with E. This refines the existing curve trace scope and imports its Jacobian inputs.

Consumers: `EllipticKTheory:E.5/geometric-elliptic-k-modules`, `EllipticKTheory:E.5/elliptic-cohomology-frobenius-descent`.

### EllipticKTheory--E.5 request 9 — `EtaleDualityAndPerverseSheaves:EDC.2:pairings`

Export the compatible geometric perfect pairings and derived Z_ℓ/Q_ℓ/Q_ℓ/Z_ℓ coefficient triangles used in the curve calculation, preserving the top-degree twist and continuous-coefficient conventions.

Consumers: `EllipticKTheory:E.5/geometric-elliptic-k-modules`, `EllipticKTheory:E.5/elliptic-cohomology-frobenius-descent`.

### EllipticKTheory--E.5 request 10 — `ArithmeticGaloisRepresentations:R01.1`

Export for Gal(F_qbar/F_q) the continuous procyclic cohomology sequence with F−1, cd_ℓ=1, and Hochschild–Serre for finite/integral/rational/divisible ℓ-adic coefficients. In particular H¹(G,Q_ℓ)=Q_ℓ for the trivial action; do not apply a discrete torsion-cohomology assertion to rational continuous representations.

Consumers: `EllipticKTheory:E.5/elliptic-cohomology-frobenius-descent`.

Route: Finite-field cohomology specialisation/extension of the general Galois-representation supplier.

### EllipticKTheory--E.5 request 11 — `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`

Import prime-to-characteristic elliptic torsion, T_ℓE free of rank two, V_ℓE/T_ℓE≅E(kbar)[ℓ∞], the twist convention and equivariant isogeny/point action. These are upstream inputs; do not construct a new Tate module or Weil pairing here.

Consumers: `EllipticKTheory:E.5/twisted-frobenius-kernel`, `EllipticKTheory:E.5/positive-even-elliptic-k-groups`.

### EllipticKTheory--E.5 request 12 — `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`

Import the hom-group/degree quadratic form, degree and geometric kernel for separable isogenies, and the comparison of the Frobenius isogeny’s point action with Mathlib’s q-power point map. The pinned function-field Isogeny alone has no general point-map or scheme-model interface.

Consumers: `EllipticKTheory:E.5/twisted-frobenius-kernel`, `EllipticKTheory:E.5/elliptic-k-group-orders`.

### EllipticKTheory--E.5 request 13 — `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`

Import the Hasse bound, a_q=q+1−#E(F_q), π²−[a_q]π+[q]=0 and the resulting deg(1−[q^i]π) calculation from the existing quadratic degree theory. Fix arithmetic Frobenius on points; geometric Frobenius on H¹ has the same polynomial through duality.

Consumers: `EllipticKTheory:E.5/elliptic-cohomology-frobenius-descent`, `EllipticKTheory:E.5/elliptic-k-group-orders`.

### EllipticKTheory--E.5 request 14 — `tauceti:TauCetiRoadmap/ModularCurves#2d-picard-duality-and-comparison-of-the-duals`

Import the Picard-dual additivity/theorem-of-the-square package and its multiplication-map consequence [m]*=[m] on Pic⁰(E), compatible with base change. This supplies the missing direct prerequisite of the inherited odd-[m] determinant calculation; the scheme Picard theory remains upstream.

Consumers: `EllipticKTheory:E.5/isogeny-rank-determinant-action`.

### EllipticKTheory--E.5 request 15 — `StableHomotopyKTheory:H.6`

Export the spectrum-cofiber universal-coefficient sequence 0→K_n(X)⊗Z/ℓ^r→K_n(X;Z/ℓ^r)→K_(n−1)(X)[ℓ^r]→0 for the actual scheme K-spectrum, in every degree used here. Specify the cofiber transition maps induced by Z/ℓ^r→Z/ℓ^(r+1), x↦ℓx. After filtered colimit, give 0→K_n(X)⊗Qℓ/Zℓ→K_n(X;Qℓ/Zℓ)→K_(n−1)(X)[ℓ∞]→0, natural for scheme base change and Galois action. No noncanonical splitting is needed. This supplies the degree shift in VI.6.4 and VI.6.7; the finite-field ring interface of L.1 is insufficient for schemes.

Consumers: `EllipticKTheory:E.5/geometric-elliptic-k-modules`, `EllipticKTheory:E.5/finite-elliptic-k-descent`.

Route: Import the existing general spectrum-coefficient owner; specialize its spectrum theorem, rather than creating a second coefficient theory in E.5.

### EllipticKTheory--E.6 request 1 — `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`

Exceptional curves of the first kind on regular surfaces; projective curve-on-surface contraction in a vertical fibre over a Noetherian base, preserving projectivity and having a regular two-dimensional contracted point (Stacks 54.16.9(1), 0C2N); universal factorization of any map taking that curve to a point through its blowdown (54.16.1, 0C5J). These are the existing layer’s surface contraction theorem, requested in its projective Noetherian-base form, not a new minimal-model theorem.

Consumers: `EllipticKTheory:E.6/minimal-arithmetic-model`, `EllipticKTheory:E.6/exists-locally-minimal-arithmetic-model`, `EllipticKTheory:E.6/locally-minimal-terminal-model`.

### EllipticKTheory--E.6 request 2 — `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`

For a smooth projective geometrically integral positive-genus curve over the fraction field of a DVR: no exceptional curve of the first kind characterizes relative minimality; a relatively minimal regular proper model is terminal among marked regular proper models, and is unique up to unique identity-marked isomorphism (Stacks 55.8.4–55.8.6, 55.10.1–55.10.2). Provide the regularity/reducedness and dense-generic-fibre interface needed when restricting the parent arithmetic model.

Consumers: `EllipticKTheory:E.6/minimal-arithmetic-model`, `EllipticKTheory:E.6/exists-locally-minimal-arithmetic-model`, `EllipticKTheory:E.6/locally-minimal-terminal-model`, `EllipticKTheory:E.6/unique-minimal-arithmetic-model`.

## Source corrections retained

All 20 source-issue records remain in their original packets: 16 parent, E17 in
E.5, and three E.6 records. The reader carries their corrected conventions and
passage locators without importing the review history into its mathematics.
Notable continuation corrections are the missing geometric-curve bar before
Weibel VI.6.4's coefficient table; the reversed arrow in Stacks 0C9Z; the X̄/X̄′
ambient-surface slip in 0C2N(2); and the V/Y slip in the codimension-one points
of the target in 0C5R. The assembly did not amend published-source verdicts.
