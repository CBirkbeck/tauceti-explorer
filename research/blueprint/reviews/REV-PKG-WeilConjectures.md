# Independent review: Weil conjectures roadmap package

**Verdict: accepted after corrections.** Codex, session `codex-rySk4t`, completed
issue #7544 (`REV-PKG-WeilConjectures`) on 2026-10-09. This session did none of
the package-writing job. The review covers the package README, Suggested.lean
and metadata against the accepted WC.0 and WC.6 packets. It accepts a roadmap
specification; it does not certify implementations of the proposed theorems.

## Corrections

1. Strengthened `degreewise_pure_factor_extraction` from existence to unique
   existence of the integer polynomial family, and added pairwise coprimality
   after mapping to rational coefficients. Its existing hypotheses already
   supply the all-embeddings weight separation needed for these conclusions.
   The README specifies coprimality over ℚ: disjoint roots do not generally give
   a Bezout identity over ℤ. This agrees with the reduced-fraction argument in
   Deligne I, proof of (1.7) ⇒ (1.6), pp. 276–277.
2. Made the WC.4 citation distinguish proper-smooth transport (Milne,
   Theorems 20.2–20.4, pp. 127–128), its lifting application (20.5, p. 129),
   and Artin comparison (21.1, p. 130). The bibliography uses the same locators.
   The family and transport path remain explicit arguments.

No accepted packet, atlas file, link map, or supplier roadmap was changed.

## Six acceptance checks

| Requirement | Result |
| --- | --- |
| Upstream form and size | Pass. Mathematical introduction, scope, supplier contracts, conventions, existing interfaces, ordered layers, usable APIs, examples, and located references. README is below 200,000 bytes. JacobianChallenge and HodgeStructures were read as upstream exemplars, alongside the guidance and ClassFieldTheory structure. |
| Fidelity and boundaries | Pass. All 74 declaration targets occur in the README; statements, hypotheses, proof routes and examples were compared with both accepted packets. The three local definitions retain all 19 API lemmas and 14 test specifications. |
| Own words and sources | Pass. The document is organized by its mathematical construction rather than a source's section sequence. Source claims have theorem/section and page locators, with preprint versions distinguished from published pagination. There are no source passages. |
| Reader-facing prose | Pass. No packet names, job identifiers, review/checkpoint narrative, or coverage statuses occur in the README. WC labels name mathematical layers. |
| Suggested Lean | Pass. The final file elaborates at the pinned Mathlib with zero errors, 97 warnings, all for `sorry`, and no other warnings. Active statements match the README's algebraic forms. Geometric forms require the named supplier carriers, as permitted by §13. |
| Metadata | Pass. Exactly `topic = "math.AG"` followed by a newline; this category fits the geometric and cohomological subject. |

## Target-by-target reconciliation

Each target's suggested declaration name was located independently, then its
statement and hypotheses compared with the relevant README subsection. The
following groups partition the 74 targets; “active” counts named packet
signatures, excluding companion APIs and anonymous examples.

| Accepted layer | Targets | Active | Substantive checks |
| --- | ---: | ---: | --- |
| WC.0 | 3 | 0 | Actual Hom point types, finiteness and field-isomorphism transport; residue degrees; rational compact supports, coefficient change, geometric Frobenius and q=p^f. |
| WC.1 | 15 | 5 | Euler/trace comparisons; descent and normalized integrality; groupoid mass; twist and character-lattice contracts; signed configurations; inverse-zeta termination; sieve; curve numerator without RH. |
| WC.2 | 5 | 4 | Imported graded pairings; signed determinant assembly; middle parity; rational multiplier; extension sign. |
| WC.3 | 2 | 1 | Generic weight-separated extraction and its projective application; all embeddings, multiplicity, unique integer factors and coefficient-prime independence. |
| WC.4 | 2 | 0 | Supplied-family Betti transport and equivariant polynomial consequence, the latter placed after its WC.5 arithmetic prerequisite. |
| WC.5 | 9 | 3 | Counts over every extension; disconnected/dimension-zero cases; curve/elliptic normalization; recurrence; complete intersections; exact/local/global polynomial-count and Tate consequences. |
| WC.5 finite-spectrum branch | 16 | 16 | Vandermonde orientation; arbitrary weighted normed fields; eventual bounds; grouped cancellation; reciprocal escape; analytic/formal/rational comparisons; poles; pairing equality; little-o strictness and graded cutoff. |
| WC.5 surface branch | 2 | 0 | Graph/diagonal comparison and recovery of curve RH from the independent Hodge-index bound. |
| WC.6 | 5 | 0 | Smooth proper factors without projectivity; reduced mixed divisors; signed equation; dualizing-constant extension; smooth proper DM application. |
| WC.7 | 15 | 0 | Projective space, finite étale orbits, products, curves, explicit equations, negative Euler exponents, compact supports, cycle/Num/surface consequences and final smooth proper assembly. |
| **Total** | **74** | **29** | **Three definitions, 19 companion API signatures and 14 definition-test examples additionally checked.** |

The 45 remaining packet declarations concern geometric or arithmetic carriers
that are not supplied by the pinned library. They remain explicit mathematical
targets in the README. The standard non-exhaustive Lean header explains the
missing rational cohomology, stack point groupoids, family transport, duality
and cycle interfaces. No theorem is represented by an arbitrary `Prop` field,
no admitted predicate body replaces a missing condition, and no private
cohomology structure assumes the desired conclusions. This is the honest
omission permitted by PROTOCOL §13 and the upstream prototyping guidance.
The three active definitions use existing category, permutation, finite-subset
and polynomial carriers with concrete bodies.

Several delicate hypotheses were checked separately:

- The functional equation retains χ in ℤ, Δ²=q^(dχ), and the parity proof
  before introducing m=dχ/2. Its extension sign is
  ε_r=(-1)^((r+1)χ)ε^r. Middle eigenvalues use generalized multiplicity,
  without arithmetic Frobenius semisimplicity.
- The finite-spectrum converse needs nonzero *grouped* weights. Its weighted
  form does not assume characteristic zero or completeness; the unweighted
  multiplicity form does require characteristic zero. R=0 and an eventual
  starting index remain allowed. Formal generating identities use arbitrary
  commutative rings; rational comparison uses LaurentSeries rather than a
  putative inclusion of every rational function into PowerSeries.
- Polynomial count quantifies over every positive prime power. The open-U
  density-one theorem concludes semisimplification and constructs a
  palindromic polynomial from the prescribed upper coefficients; it does not
  identify arbitrary lower coefficients of the approximate witness. Actual
  Tate decompositions over all Spec ℤ additionally import the stated p-adic
  and global unramified inputs. Rational irreducibles retain Schur indices.
- Smooth proper purity uses DWP.7 rather than only the projective DWP.4
  theorem. The homology-manifold variant assumes the specified dualizing
  object with Frobenius compatibility. The DM application explicitly needs
  finite-characteristic rational coarse comparison and the stack Part II
  contracts; a characteristic-zero coarse theorem alone is insufficient.
- Reduced mixed-sheaf divisors retain upper weights and multiplicities, with
  no general integral or coefficient-prime-independent degree factors.
  Rigid/crystalline comparison is an RD.7 determinant theorem with linear
  q-Frobenius, obtained by the required iteration of p-Frobenius.
- Base-field cycle surjectivity, rather than geometric cycle generation,
  supplies scalar Frobenius. Num/Picard descent and the Enriques/genus-one
  ranks remain explicit supplier inputs. The rational-surface converse uses
  finite-order Frobenius before deriving identity from maximal trace.

## Sources, baseline and ownership

Primary texts were independently accessed and the controlling locations
reread. No unavailable private source or uncleared book was used.

| Source and version | Locations checked |
| --- | --- |
| Deligne, Weil I, published article | §§1.4–1.7, pp. 274–277; §§2.2–2.6, pp. 280–282; Theorem 8.1 and proof, pp. 301–302. |
| Deligne, Weil II, published article | Corollary 3.3.4, p. 206; Corollary 3.3.9 and §3.3.11, p. 207. |
| SGA 4½, Rapport | §§3.1–3.4 and 3.6, pp. 86–88. |
| Milne, LEC v2.21 | Theorems 20.2–20.5 and 21.1, pp. 127–130; Lemmas 27.5, 27.9–27.10, Proposition 27.11, Theorem 27.12 and §§27.13–27.15, pp. 155–160. |
| Mustață, author's zeta notes | Remark 3.7, Lemma 3.8, Theorem 3.6 and Proposition 3.9, pp. 21–22. |
| Bergström–Faber–Payne, published text | Proposition 1.3, pp. 1324–1325; Proposition 3.1, p. 1330; equation (8), Definition 7.3 and Propositions 7.4–7.5, pp. 1337–1339; §§9.1–9.2, pp. 1351–1352. |
| van den Bogaart–Edixhoven, arXiv v3 | Theorem 2.1, p. 3; Lemma 4.1, pp. 6–7; Lemma 4.2 and ensuing proof, pp. 8–10. |
| Yu, arXiv v5 | Appendix C, unnumbered finite-spectrum lemma and proof, p. 81. The weighted matrix extension is an explicit mathematical argument, not attributed as Yu's exact statement. |
| Schröer, arXiv v3 | §7, Proposition 7.1 and Corollaries 7.2–7.3, pp. 19–21. |
| Kedlaya, isocrystals arXiv v6 and Fourier-transforms preprint | §§8.1–8.8 and 9.1–9.7, pp. 20–22; Fourier §6.6, pp. 50–52, for the imported RD.7 scope. The package also distinguishes the published §5.3 pagination. |

In particular, the package retains the accepted repairs to the inclusive local
integrality bound, the curve-bound radius, and the polynomial approximation's
low coefficients. The source-version hashes for Yu, van den Bogaart–Edixhoven
and Schröer agree with the accepted packets. No journal collation of those
preprints is claimed.

The reviewed `data/library-coverage.json` WC entries and all 65 distinct
baseline declarations in the two packets were checked against source at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Existing finite-field, determinant,
series, Galois/Gauss, groupoid, representation-ring and elliptic-count APIs
are consumed. Integral `Scheme.EllAdicCohomology` is correctly distinguished
from the additional rational Frobenius realization.

RS-17's ownership contracts and the EllipticCurves/AlgebraicCurves link maps
agree with the README. The elliptic Hasse theorem remains with EllipticCurves
Layer 3. AlgebraicCurves supplies genus conversion, not the étale identity
b₁=2g. Purity, pairing reciprocity, surfaces and rigid comparison retain their
DWP, EDC, SF.5 and RD.7 owners. The CohomologicalPointCounting specification at
`4bd72379658126cbe9be935656396f0c9dac4de0` was checked for rationalization,
continuous Frobenius, Tate conventions, all-power traces and existing zeta
ownership. Stack extensions are recorded separately from its scheme scope.
The surface proof has no DWP.1, DWP.4 or projective factor dependency in its
bound-to-root argument.

## Validation and limits

- `lean-check research/blueprint/packages/WeilConjectures/Suggested.lean`:
  exit 0 after the signature correction; 97 `sorry` warnings, zero errors,
  no other warnings. The file has 48 named declarations and 52 anonymous
  examples. The proofs and example proofs remain admitted; elaboration is
  evidence about types and conventions only.
- Both accepted packets pass `scripts/check_blueprint.py` with zero errors
  and zero warnings, without modification.
- Independent finite-field enumeration confirms 8 and 32 points for
  y²=x³−x over F₅ and F₂₅, and 3, 5, 9, 33 points for y²+y=x⁵ over
  F₂, F₄, F₈, F₁₆, including the unique point at infinity. Rational
  arithmetic also checks the displayed extension-sign formula with positive
  and negative Euler characteristics.
- The 200 KB bound, exact metadata, JSON validity, deliverable-path rules
  and absence of local paths were checked; `git diff --check` passes.

The accepted plan's private-snapshot reconciliation and supplier construction
requirements remain limitations of implementation. This package identifies
those mathematical inputs and never claims they are already formalized.
There are no remaining package corrections required by this review.
