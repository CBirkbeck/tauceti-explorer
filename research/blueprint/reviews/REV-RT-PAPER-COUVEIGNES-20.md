# REV-RT-PAPER-COUVEIGNES-20

Independent verification of the red-team result `RT-PAPER-COUVEIGNES-20` on the accepted
extraction of Jean-Marc Couveignes, *Enumerating number fields*, Annals of Mathematics 192
(2020), 487–497. I did not write the extraction, its review, or the red team.

**The red team reports no findings.** There is therefore nothing to confirm or reject, and
`RT-PAPER-COUVEIGNES-20.review.json` carries an empty `findings` array.

A clean result is still a claim, so I tested it rather than passing it through: §17 says a
red team that finds nothing "still says what it looked at, so that a clean result means
something", and what makes that worth anything is whether the `checked` list is true. I
sampled it. **Every claim I tested holds.**

## What I tested

**The source (checked 1).** I re-fetched the publisher PDF from
`annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf`. Its SHA-256 is
`8d63bd3a14f0d61f421695f1d93559d18fb674240c6dee872c23bf5902e1a104` — **exactly** the hash
the extraction records and the extraction's own review verified. 12 PDF pages for printed
487–497.

**The erratum (checked 13).** This is where I nearly went wrong, and the red team was right.
The extraction has no `sourceIssues` key at all, so its `E1` looked to me like a reference to
something that does not exist. It does exist, in the place the programme keeps it:
`research/errata/REGISTER.md` records `PAPER-COUVEIGNES-20/E1`, a **Misprint** at §3,
published p. 493 — "The source says `We set L = 𝓛 ⊗_Q R as the underlying R-vector space`; it
should be `L = 𝓛 ⊗_Z R`" — confirmed by `REV-ERRATA-PAPER-COUVEIGNES-20`, with a recorded
search of the Annals page, both arXiv versions, the author's page, HAL and Crossref for an
existing correction. I then found the passage myself on PDF page 7: "This is a free
**Z**-module `𝓛 ⊂ V_R` of rank `ℓ = C(d+r,d) − n`. We set `L = 𝓛 ⊗_Q R` as the underlying
R-vector space." So the misprint is real, it is recorded, and the red team is right not to
raise it again.

**The library-positive items (checked 9).** All twelve `library`-status items of the
extraction cite declarations that resolve at the pinned commits; none is dangling.

**The missing-status challenge (checked 10).** I re-ran the searches the red team says it
ran. At the pin, `successive minima`, `Alexander–Hirschowitz` and `Horace` return **zero**
declarations, so those items are rightly `missing`; while the near misses it says it
inspected do exist — `GramMatrix` (67), `gramSchmidt` (41), `Homogenize` (37).

**Duplication and route closure (checked 12).** Both proposed roadmap ids,
`GenericDoublePointInterpolation` and `EffectiveBoundsCompactModels`, are absent from the
atlas index and are proposed by this extraction alone — no other paper competes for either.
I also checked the Part II title against §15: "Effective arithmetic bounds and geometry of
numbers, Part II: compact models and degree-sensitive field counts" is an exact prefix
extension of its parent's atlas title.

## Judgement

The clean result is earned. The `checked` list is specific enough to be falsifiable — it
names page numbers, hypotheses, declaration families and search terms — and the parts of it
I could test independently were all true, including the one that first looked wrong to me.

I have not re-red-teamed the extraction, which is not a verifier's job: I did not re-derive
the interpolation argument, the covolume comparison or the asymptotic count, and I did not
look for findings the red team missed. What I can say is that its account of its own work is
accurate wherever I checked it, so the empty findings array is worth what it claims to be.

## What I did not do

No Lean was compiled. Declarations were checked at the pinned commits through the index; the
source was re-fetched, hashed and read at the one page a claim turned on.
