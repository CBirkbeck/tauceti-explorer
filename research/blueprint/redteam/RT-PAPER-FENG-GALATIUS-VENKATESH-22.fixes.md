# Fixes to the Feng–Galatius–Venkatesh extraction

Completed 2026-10-01 by Codex, session `codex-rtOQ9t`, for
[issue #5507](https://github.com/CBirkbeck/tauceti-explorer/issues/5507),
`FIX-RT-PAPER-FENG-GALATIUS-VENKATESH-22`, against base `4393f20`.
All three high-severity findings were confirmed in the red-team review JSON
and are applied. The fixes await their independent review; this report does
not supply that verdict.

The issue's three deliverables are the only changed files. The original
57 item IDs and classifications, five route memberships, 41 missing-item
assignments and 17 source records and verdicts are preserved. No new owner,
roadmap or blueprint node is introduced. The existing product supplier K.7
is added to item /2, and the corrected supplier contracts are stated in the
paper's items and route briefs.

## Finding 1: the hyperbolic splitting needs its factor of two

**Fixed in item /25, route 3 and the reader.** Put
$E=K(\mathbf Z)[1/2]$, with involution $\psi^{-1}$. Identify its homotopy
orbits with its positive eigensummand using the projector
$p_+=(1+\psi^{-1})/2$. The first map remains the standard unscaled hyperbolic
construction $H$ under this identification. Forgetting its form gives

$$
c_BH=1+\psi^{-1}=2\,\mathrm{id}\quad\text{on }E^{(+)}.
$$

Thus the retraction of $H$ is $(1/2)c_B$. Equivalently, if $c_B$ is the
projection, the chosen summand inclusion is $(1/2)H$. Item /25's statement
and proof outline specify these maps, and route 3's GN.6 design contract
requires their normalization. Its degree-zero acceptance specification is
$c_B(H([\mathbf Z]))=2[\mathbf Z]$, because a hyperbolic rank-one module has
underlying module $\mathbf Z\oplus\mathbf Z^\vee$ of rank two. Another
specification distinguishes the positive and negative eigensummands.

The fibre sequence, splitting existence and Witt-group computation are
retained. Theorem 3.5 already computes the composite $1+\psi^{-1}$ and uses
its invertibility at odd primes, so its Betti–Hodge isomorphism and the
universal-extension conclusions are unchanged. Its Betti map itself is not
rescaled throughout the extraction; the factor belongs to the stated
retraction of the selected hyperbolic inclusion.

**Source issue E18** records the published §3.4 retraction assertion,
pp.254–255, and compares the explicit formula on p.256. It affects that
map-level assertion, not the existence of the splitting or the main theorem.
The source version and PDF hash are recorded. The independent red-team
verification is linked as evidence; an independent fix verdict is not invented.

## Finding 2: distinguish the generic spectrum map from tensor multiplication

**Fixed in item /2, item /17's application and route 5's imports.** The generic
adjoint $\Sigma^\infty_+|\mathcal C|\to K(\mathcal C)$ for an arbitrary
symmetric monoidal groupoid is now a map of spectra. Its one operation gives
additive group completion and does not supply an extra unital ring structure.

For commutative $R$, the projective-module groupoid uses direct sum for the
additive construction. Tensor product, with the distributivity and coherence
needed by the product construction, supplies the separate multiplication on
$K(R)$. GeneralAlgebraicKTheory K.7 owns its external products, unit, symmetry
and associativity homotopies; SchemeKTheoryOperations S.6 extends them to
schemes. Item /2 names K.7 alongside the original group-completion/plus
suppliers, and route 5 explicitly imports that product input. H.4 and
H.5:spectra retain the general additive/spectrum construction.

The specific map in item /17 stays
$\Sigma^\infty_+|\mathrm{Pic}(R)|\to K(R)$, multiplicative for tensor product.
Its target is explicitly $K(R)$, whose addition came from direct sum, rather
than $K(\mathrm{Pic}(R),\otimes)$. The tensor unit $R$ maps to $[R]=1$ in
$K_0(R)$; it is not the additive zero obtained by group-completing the tensor
unit as an additive monoidal object.

The negative specification uses the discrete groupoid $(\mathbf Q/\mathbf Z,+)$.
It is already group-like, so the generic completion has this same additive
component group. In a hypothetical nonzero unital ring with that additive
group, the unit would have finite order $n$, and distributivity would imply
$nx=(n1)x=0$ for every $x$. But $1/(n+1)$ modulo $\mathbf Z$ is not killed
by $n$. Hence no such ring structure exists. A positive degree-zero
specification distinguishes direct-sum ranks $a+b$ from tensor-product ranks
$ab$, with unit $[\mathbf Z]$. These are mathematical specifications, not
compiled tests.

The published source already distinguishes these constructions correctly;
this finding adds no published-source error.

## Finding 3: keep level-zero group completion in the Segal machine

**Fixed in item /51 and route 5's H.4/H.5 supplier contract.** The statement
now describes the original prespectrum with spaces $|X(S^n)|$, then the
associated connective spectrum. For special $X$, its original structure maps
are weak equivalences at levels $n\ge1$. An equivalent Ω-spectrum has
zeroth space $\Omega|X(S^1)|$ and the same positive spaces. The map
$|X(S^0)|\to\Omega|X(S^1)|\simeq\Omega^\infty B^\infty X$ remains group
completion. A claim that the unmodified level-zero map is also a weak
equivalence requires the group-like component condition, or very specialness.

The negative specification is
$X(S)=\mathbf N^{S\setminus\{*\}}$, with pointed maps acting by summation
over their non-basepoint fibres. It is special: the Segal maps are
isomorphisms, and $X(\{*\})$ is even a point. Nevertheless the level-zero
component map is $\mathbf N\to\mathbf Z$, which misses $-1$. The unmodified
prespectrum therefore fails the Ω-spectrum condition at zero. Replacing
$\mathbf N$ by $\mathbf Z$ supplies the companion very-special specification.
This example is independent of the existing point-versus-contractible issue E15.

H.4 supplies group completion and H.5:spectra the spectrum foundation; the
route-5 import contract explicitly retains this ℕ-to-ℤ test, rather than
planning another group-completion machine inside the Part II. The source's
Appendix A.1 already states the positive-level distinction correctly, so no
new source issue is recorded for this extraction error.

## Sources, owners and reading scope

On **2026-10-01**, downloaded the actual
[published PDF](https://link.springer.com/content/pdf/10.1007/s00222-022-01127-8.pdf)
of Tony Feng, Soren Galatius and Akshay Venkatesh, *The Galois action on
symplectic K-theory*, Inventiones mathematicae 230 (2022), 225–319. Its 95
pages have SHA-256
`5da9a2b28d13b2b22a262a81650188025020d92238ec2b47404d177ef91d7b4d`,
matching the extraction and accepted red-team report. For this fix, reread
pp.236–240 (§§2.1–2.5), pp.254–256 (§§3.4–3.5) and pp.300–303
(Appendix A.1, through Example A.4); viewed page images 238,255,256,302.
This is a bounded fix reading; the earlier red-team report documents the
complete article reading.

Correction checks inspected the
[publisher record](https://link.springer.com/article/10.1007/s00222-022-01127-8),
[arXiv history](https://arxiv.org/abs/2007.15078),
[author's papers page](https://math.berkeley.edu/~fengt/papers.html) and
[Crossref DOI record](https://api.crossref.org/works/10.1007/s00222-022-01127-8),
plus a bounded exact-title correction search. The arXiv record identifies v3
as the final accepted version; Crossref has no update-to entry and an empty
relation object. No applicable correction was found by those checks, which
does not establish its absence. No author was contacted.

Read the current atlas descriptions of H.4, H.5:spectra, K.2:plus, K.7,
S.6 and GN.6, plus their accepted AUDIT-30, AUDIT-28 and AUDIT-02 coverage
entries. They distinguish the available algebraic degree-zero inputs from
higher spectrum/product/duality constructions. The fixes do not alter
library declarations or claim new implementation status; their generic
constructions stay with their existing owners. There is no unresolved
missing mathematics from these three findings requiring a new roadmap.

## Validation

- `scripts/check_paper.py` on the extraction: passed.
- `research/blueprint/intake.py check-files` on the three deliverables: passed.
- Source-issue schema and source-version checks, including E18: passed.
- Structural preservation: 57 unique item IDs, 1 library / 15 planned / 41 missing; all 41 missing items routed once across the five unchanged route memberships; previous source records and review metadata unchanged. K.7 is the one added existing supplier reference.
- Exact dyadic-rational hyperbolic/retraction and eigensummand calculations, direct-sum/tensor rank examples and the component-level negative examples: passed. The infinite group arguments are given above; finite calculations are examples, not general spectrum proofs.
- `git diff --check`: passed.

No Lean artifact is required or compiled. No library build, cache download
or language server was started. The fixes await their independent review.
