# Handoff: BP-ClassicalAdicEtaleCohomology--H4

Issue #693. Worker: Codex, session `codex-aFUJt5`. Scope: exactly
`ClassicalAdicEtaleCohomology:H4` and `ClassicalAdicEtaleCohomology:H5`.
This is a complete target-level planning pass under PROTOCOL §0: both stages
are `planned`, neither is `closed`. It is not a claim of proof closure or
formalization. All implementation statuses remain `unchecked`.

The deliverables are the H4 packet, reader and suggested file, together with
this note. The packet has 39 nodes: 2 definitions, 8 constructions, 26 theorems
and 3 applications. It has 36 API items, 32 unit tests, 12 planets (six in each
stage), 9 baseline declaration citations, 15 supplier requests, 7 explicit gaps,
one source issue and three structure proposals. The reader is about 12,600
words and contains every proposed declaration, API item and test. The ten
definition/construction nodes each have at least three tests.

## Scope, ownership and completed work

Accepted `independent-review-REV-RS-05` (23 September 2026) is binding. Both
H4/H5 are retained. R1 supplies analytification/fibre products and proper
coherent GAGA; R2 supplies formal geometry and generic fibres. H0/H1/H2/H3
supply the analytic site, coefficients, henselian comparison, geometric
field-pair invariance and support/trace machinery. The existing upstream
AdicSpaces and JacobianChallenge documents were read for style and ownership.
No existing upstream roadmap, atlas data, reviewed decomposition or other
worker’s packet was edited.

Both reviewed H5 identifiers are preserved:

- `ClassicalAdicEtaleCohomology:H5/proper-comparison-3-7-2`
- `ClassicalAdicEtaleCohomology:H5/comparison-over-nonarchimedean-fields-3-8-1`

Their kinds are refined to `theorem` to display the named comparison planets;
the inherited mathematical statements and reviewed locators are retained.
The three new H5 branches cover comparison, analytic finiteness/radius
exhaustion, and smooth-curve compactification/boundary reduction.

H4 distinguishes weak rational domains, strict-valuative subsets, and genuine
analytic open disc/annulus unions. Ito’s rank-two endpoint refinements show
why those definitions cannot be conflated. The Kummer API retains μₙ and the
Tate twist: a basis of untwisted coefficients needs a trivialization. Tame
ℓ-root transitions kill H¹ modulo ℓ; pure p-root transitions are invertible
modulo ℓ and do not kill it. H2 invariance retains the exact surjective-pair
condition C′⁺∩C=C⁺. The arbitrary-plus-ring annulus export remains conditional
on its recorded specialization/support supplier.

H5 keeps field-characteristic invertibility in finite-type comparison separate
from residue-characteristic invertibility in radial cohomology and smooth
duality. Proper comparison permits all torsion coefficients. The radius proof
uses actual surjective restriction maps, equal finite dimensions, a common
stage in every degree, and a cofinal stable tower. Filtered neighborhood
continuity and the derived inverse limit of an increasing open cover are
separate contracts. Mieda’s public Proposition 3.38 proof verifies smooth qcqs
per-degree finiteness; the finite-total ball use is separately verified in
ECD 27.2. The full maximal book statement is not guessed from either.

Lütkebohmert Definition 5.6 is decomposed into global and local formal-curve
compactifiability, with APIs and tests. Public scans confirm Theorem 5.3’s
complete-DVR/locality scope, Proposition 5.4/Lemma 5.5’s coherent formal
thickenings and divisor conditions, Proposition 5.7’s extension, and Lemma
5.8’s degree bound d≥2g−1. The §7.4/§7.5 approximation contracts, including
Weierstrass domains, relative compactness, prescribed congruence and blow-up
closure, are requested from R2 rather than replaced by abstract Elkik alone.
The additional smooth Hilbert/deformation contract is proposed as a
JacobianChallenge Part II building on the existing upstream direction.

## RT-AREA-etale/5

Handled by a precise H3 request and a split/edge proposal: retain the early
curve trace/duality prefix consumed by S4/S5; add `H3:smooth-duality` and its
edge to H5. The suffix must supply Huber 5.7.2, the 7.2.2 curve trace
normalization, general relative traces and 7.5.3 relative Poincaré duality for
pure smooth dimension d, **every d≥0**. The contract specifies the boundedness,
Tate twist, coefficient domain, actual duality map, base-change/composition
compatibility and dimension-zero/one normalizations. Berkovich 7.2.1, 7.3.1
and 7.4.9 and Zavyalov A.15/A.18/A.19 give the public route with its
finite-local-constant and taut/overconvergent conditions.

The packet uses the existing valid H3 stage plus the request; it does not
pretend the proposed suffix already exists. No out-of-scope H3 file is edited.
H5’s characteristic-p comparison and every-dimensional affine-space
application explicitly consume this input. Absolute smooth proper duality or
curve-only duality does not close it.

## Source access and remaining refinements

Public editions, URLs, read passages, access dates and hashes are in the
packet. Read sources: Scholze’s author PDF dated 14 April 2026 (§§19,24,25,27),
Ito arXiv:2008.07794 (§6 and Appendix A.1), Berkovich IHÉS 78 (§§6–7),
Zavyalov arXiv:2111.01830 (§5.3 and Appendix A), the GDZ Lütkebohmert OCR and
page scans, and Mieda’s public author PDF (§3.3 and Proposition 3.38 proof).
Scan URLs and hashes for pp.197,198,200,201,202,212,213 are retained so the
next worker needs none of this run’s scratch files.

Huber’s publisher full-PDF request returned HTML. No book pages or private
library were newly accessed. The accepted 3.7/3.8 locators are inherited;
Ito verifies the geometric-field 6.2.2 statement, ECD verifies the finite-total
ball instance of Proposition 6.1.1, and Mieda verifies smooth per-degree
finiteness. Do not describe those as a new reading of the book proof.

A refinement pass must:

1. Read Hub96 §§3.7–3.9,6.1–6.3 and decompose the needed key proof inputs.
   Verify the general-K smooth-constructibility statement: Ito §6 fixes
   algebraically closed K, whereas ECD24.1 applies it over a perfectoid K.
   Determine the maximal finiteness domain and ordinary-site boundedness;
   read Hub98a Proposition3.1 if adding the nonsmooth characteristic-zero case.
2. Supply H3:smooth-duality and its edge, preserving the early curve prefix.
   Check the characteristic-zero purity/reduction separately: its coefficient
   domain is broader than prime-to-residue duality.
3. Supply the arbitrary-plus-ring radial specialization/support comparison,
   and the classical nonnoetherian proper-support base-change contract if that
   version of the perfectoid transfer is desired. ECD’s diamond base change
   does not itself prove the latter classical statement.
4. Close source issue `ClassicalAdicEtaleCohomology/E1`: ECD25.3 cites a local
   discrete-base compactification for a global embedding over geometric C.
   Give a primary theorem in that exact scope, or the missing descent and
   compatible globalization argument. This is a proof/citation bridge gap,
   not a claimed counterexample to biduality.
5. Discharge the precise R2, upstream deformation/Hilbert, P5/P6 and E1
   contracts, then replace named analytic/formal omission comments with
   signatures when their owning carriers exist.

Added-paper inputs assigned to H0–H3 remain with those owners. In particular
Zavyalov/Guo–Reinecke trace generality is addressed by the H3 suffix request;
Česnavičius continuity/henselization, CDN nearby cycles and KL local systems
are not re-planned in H4/H5.

## Validation and Lean limitations

`python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalAdicEtaleCohomology--H4.json`
passes with zero errors and zero warnings. Additional consistency checks
verify the internal DAG, preserved reviewed identifiers, distinct proposed
names, all 107 declaration/API/test names in both the reader and suggested
file, ten definition/construction test inventories, and the six-planet limit.

`lean-check research/blueprint/suggested/ClassicalAdicEtaleCohomology--H4.lean`
elaborates with only the intended declaration-uses-`sorry` warnings. Memory
was checked first and exceeded 20GB. No language server or Lake build/update/
cache operation was started.

The baseline citations were checked in the pinned source trees: Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369, Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174. The available shared compiled build
has the exact Mathlib pin but a newer Tau Ceti checkout,
cf386627e9176a3827c1a5fe804989fd94a4d216. Accordingly this is shared-build
elaboration, not a claim of complete exact-Tau-pin elaboration.

Its first attempted import of the pinned Spa.Polydisc module failed because
that module has no object in the shared build. The exact polydisc and
classical-point compatibility signatures are retained as named comments;
the compiled file imports available Spa modules. Actual valuation-set and
additive-map cores are typed. Analytic site/derived comparison signatures,
formal compactifiability definitions, their API/tests and the geometric
Kummer degree isomorphism have explicit named omission comments. No arbitrary
proposition or theorem-valued record substitutes for those missing carriers.
