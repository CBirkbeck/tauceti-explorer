# FIX-RT-PAPER-MASSER-ZANNIER-20

Issue #5500. Codex, session `codex-J6LwjP`, 1 October 2026.
All three independently confirmed findings are addressed. I did not write
the extraction, its review or this red team; this report implements the
verifier's findings and does not supply an independent fix review.

## RT/1: interpolation and analytic closure

Item /66 now specifies the compact real-analytic parametrized image
K=J(F([1,2])) and its isogeny-class coverage. Its Newton-series construction
and Cholesky continuity input remain, with an API and positivity tests.
It does not promise an embedded curve or a complex analytic hypersurface.
Positivity is asserted on the real interval, not for every complex parameter.

New item /74 gives the obstruction to the published global endpoint. Put
G=g(g+1)/2. A globally closed pure analytic hypersurface has dimension G−1,
while the Satake boundary has dimension G−g. For g≥2 the former is strictly
larger, so Remmert–Stein applies, including to the singular ambient complex
space. The closure in the projective compactification is analytic, hence
algebraic by Chow. Restriction gives the original hypersurface, contradicting
transcendence and its asserted coverage of all algebraic isogeny classes in
view of Theorem 1.1. The g=1 argument has no strict dimension inequality;
the elliptic construction /40 is unchanged.

E13 records this published supplementary-result error. A local replacement
is explicitly gated: name an open U containing K and prove a relatively
closed pure codimension-one W_U there, or formulate and prove a germwise or
nonclosed version. Local equations on different domains cannot simply be
multiplied without extensions and compatibility. This fix does not enable
such a replacement or claim that this gluing problem has been solved.
The gate is propagated through route 7 and the reader. General analytic
closure and compactification inputs import ComplexComparisonPartII C0/C4
and ShimuraCompactifications C5 rather than a duplicate theory. Their actual
contracts do not explicitly export general singular-space Remmert–Stein or
the exact Siegel boundary dimension, so two scoped supplier `requests` bind
those missing adapters, with statements, sources, APIs and tests. The owner
designs must register them; they are not asserted already formalized.

## RT/2: arithmetic torsion descent

Item /58 states the main Theorem 1.1 without the supplementary torsion
clause; /56 retains the theta geometric-degree estimate. Item /57 distinguishes
its unchanged main degree D from a supplementary arithmetic comparison.
New item /73 isolates the unresolved rational 16-torsion claim. E14 records
the missing implication, without alleging that Theorem 1.1 or the existential
torsion assertion is false.

The binding route 7 and /73 import fine-level moduli and the universal
principally polarized family from PELModuli M2/M5, the perfect equivariant
Weil pairing and torsion from AbelianSchemes A3, and analytic comparison from
A5. They distinguish the theta coordinate model, polarized model field,
cyclotomic field and torsion splitting field. Full rational 16-torsion implies
μ_16 is in the field by perfectness and Galois equivariance. This excludes a
real field, whereas the theta-coordinate diagnostic at τ=iI_g is real.

Item /73 requires a comparison cover and the actual
D(Y,Ψ_Y)=[F_Y:ℚ][F_{Ψ_Y}:ℚ]D_{Ψ_Y}, or complete residue-field extension
bookkeeping. The cyclotomic factor is at most φ(16)=8 over the model field;
any further descent/torsion factors must also be proved and counted. These
two accounting methods must not double-count the same extension. Adjoining
ζ_16 alone is not asserted sufficient. Neither the arithmetic comparison nor
the claim that its total fits 2^{16g⁴} has been established here, so the
supplementary endpoint stays gated. The main theorem's numerical bound stands.

## RT/3: one shared supplier

Items /16–/18 and /38 remain with LD.6. Items /19–/23 join the accepted
`LogicAndDefinabilityPartII` in new route 9, using the exact id, parent, title
and area of PAPER-MOK-PILA-TSIMERMAN-19. The two unsupported planned-layer
credits (/19,/21) become missing shared foundations; no completed library
credit is added. Route 1, route 2's ownership explanation, route 7's imports,
the summary and reader no longer defer a choice between competing owners.

The brief binds genus-one j/j² and Siegel J adapters and one shared
Ax–Lindemann deduction, with modular/vertical/horizontal exclusions and the
weakly-special point-or-full-ambient dichotomy. It imports only early LD.6
counting, whose downstream arithmetic applications consume the supplier.
If a stage split is needed, it belongs to the owner design; no whole-stage
LD.6 reverse edge or claim of global graph certification is introduced.
The accepted Mok–Pila–Tsimerman placement is the authority, not a merged
Tsimerman fix whose independent review remains pending.

## Evidence and validation

The published Annals PDF hash reproduced:
`8b76bfac88374180701992e242d88f5d38fbe0b0cdb39c6c40c3c3fbbb874b60`.
Selected pp.637,650,663,665–670 were read, and pp.666,669,670 were viewed as images.
Le Fourn's published pp.180–182 (6.4,6.5(b),6.6(a)) and Demailly Chapter II
pp.118,121 ((8.7)/(8.10), with surrounding text) were checked. Their separate
hashes and scopes are in `sourceVersions`; no full paper/book/version collation
is claimed by this fix worker. Journal/Crossref and title/author correction
searches located no correction. Zannier's institutional profile and Masser's
publication-list PDF were checked as leads; the latter dates from 2018 and
cannot certify absence of later corrections. These limits are in E13/E14.

The accepted shared supplier brief/review, actual LD.6/M2/M5/A3/A5 contracts
and reviewed M2/M5/A3/A5 library audits were read. No LD.6 audit entry was
present. Pinned sources were searched for Ax–Lindemann, weakly special,
Pila–Wilkie, o-minimal expansion and theta constants; these shared foundations
were not identified as completed library work. Tau Ceti f790474 Cholesky
factorization and continuity declarations were read, including
`cholesky_mul_transpose` and `continuous_cholesky`. No broad coverage claim
follows from those fragments and no new library item is added.

Checks: `scripts/check_paper.py`, intake on all three deliverables, source
diagnostic/version schemas, and whitespace checks pass. Preservation checks
retain all 72 original item ids, nineteen prerequisite records, twelve
original source diagnostics and the main theorem statements; the only
original status changes are /19 and /21. Every missing item is routed once.
The result has 74 items (3 library,11 planned,60 missing), nine routes and
fourteen source diagnostics. Exact finite/rational regressions check Satake
boundary dimensions, order-16 symplectic pairing values, positivity of
I+wwᵗ and degree-factor accounting. They do not formally prove interpolation,
arithmetic descent, Remmert–Stein or the transcendence suppliers.

No Lean file is requested or compiled, and no library build/cache download
was attempted. The local replacement and supplementary torsion descent remain
explicit future obligations in the existing owner design. The fix itself is
complete under the verifier's permitted gates; independent fix review remains.
