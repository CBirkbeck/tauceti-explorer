# BP-ArithmeticGaloisRepresentations~2

Agent: Codex, session `codex-XV9azG`; revision of issue #6918 on 7 October 2026.

This is a complete **budgeted planning pass**, rather than a checkpoint. The packet has reached the issue's 300-node boundary. All seven scoped stages remain `partial`; no stage is claimed closed, and every declaration remains `implementationStatus: unchecked`. The existing independent-review object and all 47 source-issue records, including their adjudicated rejections, are preserved for the next independent reviewer.

## What this revision changed

Retained all 190 original identifiers and separated 44 reviewed bundles into 154 declarations, adding 110 nodes: 24 in R01.1, 40 in R01.3, 12 in R01.4 and 34 in R01.5. The final packet contains 31 definitions, 28 constructions, 83 lemmas, 145 theorems, 9 comparisons and 4 applications; 550 API items, 292 unit tests, 40 planets and 417 pinned baseline citations. The reader states every node, its hypotheses, proof plan, prerequisites and acceptance conditions, and includes all API items and unit tests.

The splits isolate coefficient descent, lattice existence, Brauer–Nesbitt and Clifford arguments; finite wild factorisation, integrality, conductor operations and individual elliptic reduction cases; the projective coefficient field and small-characteristic image cases; and Frobenius density, character independence, Schur-index descent, Carayol gluing, Haar bounds and semisimplicity criteria. Extracted proof steps were reconciled with their actual clauses. In particular finite-field realisability uses the general semisimple Schur-index criterion, rather than an absolutely irreducible special case. Gap and request consumer lists were narrowed where a split had propagated them to unrelated clauses. Some original consumers still conservatively import all clauses of their old prerequisite bundles; their exact refinement remains in coverage.

Material signature and mathematical clarifications:

- Determinants through a free complement apply to finite projective modules with varying local rank. Constant rank is needed for the global top-exterior-power comparison, not for complement independence, multiplicativity or base change.
- The inertia-invariants and Artin/Weil–Deligne comparisons require the full tame-character package, canonical finite ℓ-adic coefficients, inertia identification and residue cardinality. Surjectivity of an arbitrary homomorphism alone does not supply monodromy.
- Typed global conductor identities now state excluded-place admissibility and the valid coefficient tier: finite image, discrete coefficients or a finite canonical ℓ-adic coefficient field. The algebraic-closure coefficient case still needs explicit finite-extension descent.
- The exact residual elliptic conductor formula is for raw `E[ℓ]`. For `y²+y=x³−x²` at ℓ = 5, the exponent at 11 is one for the torsion representation and zero for its global semisimplification. Without irreducibility only the divisibility assertion is made for the latter.
- G7 owns the matrix determinant identity for symplectic similitudes; R01.6 imports it in its vector-space comparison, avoiding the duplicate square-root-extension argument.
- Removed the suggested file's replacement abelian-variety point/torsion carrier and its opaque geometry suppliers. R01.6 now names the actual `TauCeti.AlgebraicGeometry.AbelianVariety` carrier, with exact mathematical statement/API/test comments where the genuine supplier vocabulary is unavailable.

## Confirmed red-team requirements

`RT-AREA-langlands-1/6`: Ogg and the Ogg–Saito inputs remain with R01.3. The comparison imports the elliptic reduction algorithm, minimal proper regular models, component comparison and the Tate-module input. Its component count is geometric and without multiplicity: five for I₀*, rather than the four components of the smooth Néron special fibre. The conductor and Ogg nodes now also realise R01.6's comparison target. Saito's unavailable original theorem and the mixed-characteristic comparison at two and three remain explicit gaps; no exact comparison at those primes is declared closed.

`RT-AREA-langlands-1/17`: retain the review's classical Brauer–Nesbitt/image-algebra proof in R01.1 and the perfect-field descent inputs. Determinant reconstruction imports this theorem. Reversing that dependency through IHG.1 would create the cycle the review identified.

## Checks and elaboration

`python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticGaloisRepresentations.json`: zero errors and zero warnings. The source issues and source-version records also pass `check_errata.py` after projecting those fields into an `errata-v1` scratch input; the blueprint itself retains `blueprint-v1`. Additional consistency checks verify the own-node DAG, retained identifiers, unchanged review/source-issue objects, unchecked implementation statuses, and correspondence of the reader and suggested index with the packet.

`lean-check research/blueprint/suggested/ArithmeticGaloisRepresentations.lean` completed against Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: **848 unfinished-proof warnings, no errors and no other warnings**. Memory was above the required threshold; the run finished within twenty minutes. The active file imports individual Mathlib modules. The shared build has no compiled Tau Ceti objects for the geometry imports. Therefore this check does **not** elaborate the R01.6 geometry comment blocks. The new 110-entry declaration index records exact auxiliary statements and hypotheses and points to the corresponding typed bundle sections; it does **not** claim that every auxiliary name was individually elaborated. No formalisation claim follows from this prototype check.

## Sources and baseline

The reviewed seven-stage library audit and both upstream documents, EllipticCurves and RepresentationTheory/InductionRestriction, were read. The elliptic document explicitly excludes its algorithmic/Artin conductor identification; the contrary audit attribution is recorded as an upstream note, with no upstream files changed.

The reviewed baseline register was retained. Statements particularly relevant to these changes were checked at the pins, including the actual abelian-variety carrier, its dimension/base-change interface, the absolute-Galois/separable-closure comparison, exterior-power bases, local freeness of finite flat modules, finite-free determinant product/base-change identities and triviality of finite-field Brauer groups. This revision does not claim a fresh independent verification of all 417 inherited citations.

Public copies of 52 original PDFs were retrieved and their expected hashes checked. Retrieval is not a claim to have read every paper. Passages specifically checked for this revision include Deligne–Serre §6.10–6.13, Brumer–Kramer Theorem 6.2 and its reduction to Theorem 5.5, BCGP25 Proposition 4.11, and Serre 1972 printed pp. 279–283 (Propositions 14–18). The original Serre bibliographic record is retained historically; the current source points to the freely available scanned author copy, whose hash and reading note are recorded in `sourceVersions`. Its image pages were read visually because text extraction is unusable. Brumer–Kramer §§3–5 were not re-established: the sharp dyadic bound's Theorem 5.5 input remains a gap.

Saito's original paper and the independently unverified inputs listed in the packet remain open. In particular nothing here closes the quoted-source gaps for Carayol, Nekovář/Boston–Lenstra–Ribet, Serre independence, Gan–Takeda, exceptional modular representations or the unrecomputed finite-group enumerations. Accessible later quotations do not certify those primary arguments.

## Where a follow-up resumes

There are **36 recorded gaps and 60 supplier requests**. The authoritative worklist is each stage's `coverage.remaining`, together with the relevant node's exact prerequisites; it contains no dependency on deleted scratch files.

- **G7: partial.** Split the remaining operation, polarization, monodromy and image-condition bundles; establish the recorded algebraic-group, modular-cohomology and finite-enumeration inputs. Keep adequate, enormous, vast and tidy distinct and preserve the Hodge-theoretic and supplier ownership boundaries.
- **R01.1: partial.** Complete the carrier/operation, lattice, semisimplification and reductive-model declaration splits. General reductive reduction still needs Larsen's building input and the Ĝ-pseudocharacter reconstruction; GLₙ does not inherit those gaps.
- **R01.2: partial.** Split the local, Weil–Deligne, purity and ε-factor bundles. Instantiate the strengthened abstract signatures with the real local Weil and tame-character suppliers, and obtain the indecomposable classification and global inputs to local constants.
- **R01.3: partial.** Finish the conductor carrier/API and induction splits. Supply perfect infinite residue-field ramification, the sharp dyadic p-group estimate, potential-good-reduction inertia and the Ogg–Saito arithmetic-surface inputs. Keep raw torsion and its global semisimplification distinct.
- **R01.4: partial.** Finish Dickson's proof lemmas, restriction/cyclotomic and characteristic-two bundles; obtain the stated automorphism and Dickinson inputs, and type the remaining classification clauses.
- **R01.5: partial.** Finish recognition/descent and curve/gluing splits, replace requested stage citations with exported declarations, and establish the minuscule semisimplicity and symplectic Haar-null inputs. The closed-set Chebotarev bound itself does not depend on the latter application gap.
- **R01.6: partial.** Split the actual torsion, Tate-module, pairing, isogeny and local-factor constructions with their APIs/tests, then elaborate on the real geometric carrier. Resolve the downstream A6 characteristic-polynomial/endomorphism-coefficient cycle and the scheme-Frobenius owner, and place independence/connectedness after checking their real proof inputs. Preserve the reviewed restructuring proposals rather than importing a downstream supplier into a cycle.
